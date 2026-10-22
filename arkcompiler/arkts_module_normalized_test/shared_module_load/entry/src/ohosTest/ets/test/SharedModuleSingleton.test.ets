import { describe, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { taskpool, worker } from '@kit.ArkTS';
import { loadRecorder } from '../share/LoadRecorder';
import { sharedState } from '../share/SharedTarget';

const DOMAIN: number = 0x0000;
const TAG: string = 'SharedModuleTest';
const TASKPOOL_COUNT: number = 3;
const WORKER_COUNT: number = 3;
const WORKER_SCRIPT: string = '../workers/SharedModuleWorker.ets';
const CHECK_TIMEOUT_MS: number = 15000;

// Taskpool task: writes the thread mark into the shared instance on the taskpool
// thread and returns the load marker read on that thread
@Concurrent
async function markThreadTask(name: string): Promise<string> {
  await sharedState.addThreadMark(name);
  return sharedState.getLoadId();
}

// Main-thread participant: writes the thread mark and returns the loadId (aggregated
// via Promise.all in the comprehensive concurrency case)
async function mainThreadMark(name: string): Promise<string> {
  await sharedState.addThreadMark(name);
  return sharedState.getLoadId();
}

// Timeout guard: prevents a hung async participant from suspending the case
// (a timeout fails the whole case)
function withTimeout(promise: Promise<Array<string>>, timeoutMs: number): Promise<Array<string>> {
  const timeout: Promise<Array<string>> = new Promise<Array<string>>((resolve, reject) => {
    setTimeout(() => {
      reject(new Error(`timeout after ${timeoutMs}ms`));
    }, timeoutMs);
  });
  return Promise.race([promise, timeout]);
}

// Registry of created workers, swept in afterAll
let workerRegistry: Array<worker.ThreadWorker> = [];

// Spawn a worker to run the check: terminates right after posting back the loadId;
// failures are rejected via onerror
function spawnWorkerCheck(threadName: string): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    const wk = new worker.ThreadWorker(WORKER_SCRIPT);
    workerRegistry.push(wk);
    wk.onmessage = (e) => {
      const loadId: string = e.data as string;
      hilog.info(DOMAIN, TAG, '%{public}s loadId=%{public}s', threadName, loadId);
      resolve(loadId);
      wk.terminate();
    };
    wk.onerror = (err) => {
      reject(new Error(`worker ${threadName} error: ${err.message}`));
    };
    wk.postMessage(threadName);
  });
}

export default function sharedModuleSingletonTest() {
  describe('SharedModuleSingletonTest', () => {
    afterAll(() => {
      // Best-effort sweep of leftover workers (terminating an already-terminated
      // worker throws BusinessError, caught and ignored)
      for (let i = 0; i < workerRegistry.length; i++) {
        try {
          workerRegistry[i].terminate();
        } catch (e) {
          hilog.warn(DOMAIN, TAG, 'terminate failed: %{public}s', JSON.stringify(e));
        }
      }
      workerRegistry = [];
    });

    /**
     * @tc.name   sharedModule_singleton_0100
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_SINGLETON_0100
     * @tc.desc   Verify the shared module is loaded only once on the main thread and the load marker is valid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_singleton_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const loadId: string = sharedState.getLoadId();
      hilog.info(DOMAIN, TAG, 'main thread loadId=%{public}s loadTimes=%{public}d', loadId, loadRecorder.getLoadTimesOf('SharedTarget'));
      expect(loadId).assertContain('load-');
      expect(loadRecorder.getLoadTimesOf('SharedTarget')).assertEqual(1);
      await sharedState.addThreadMark('main');
      expect(sharedState.getThreadMarkCount()).assertEqual(1);
      expect(sharedState.hasThreadMark('main')).assertTrue();
    });

    /**
     * @tc.name   sharedModule_singleton_0200
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_SINGLETON_0200
     * @tc.desc   Verify taskpool threads bind the same shared module instance and do not re-execute top-level code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_singleton_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainLoadId: string = sharedState.getLoadId();
      const tasks: Array<Promise<string>> = [];
      for (let i = 1; i <= TASKPOOL_COUNT; i++) {
        tasks.push(taskpool.execute(markThreadTask, `taskpool-${i}`) as Promise<string>);
      }
      const results: Array<string> = await withTimeout(Promise.all(tasks), CHECK_TIMEOUT_MS);
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(mainLoadId);
      }
      expect(loadRecorder.getLoadTimesOf('SharedTarget')).assertEqual(1);
      expect(sharedState.getThreadMarkCount()).assertEqual(1 + TASKPOOL_COUNT);
      for (let i = 1; i <= TASKPOOL_COUNT; i++) {
        expect(sharedState.hasThreadMark(`taskpool-${i}`)).assertTrue();
      }
    });

    /**
     * @tc.name   sharedModule_singleton_0300
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_SINGLETON_0300
     * @tc.desc   Verify multiple workers bind the same shared module instance and do not re-execute top-level code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_singleton_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainLoadId: string = sharedState.getLoadId();
      const checks: Array<Promise<string>> = [];
      for (let i = 1; i <= WORKER_COUNT; i++) {
        checks.push(spawnWorkerCheck(`worker-${i}`));
      }
      const results: Array<string> = await withTimeout(Promise.all(checks), CHECK_TIMEOUT_MS);
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(mainLoadId);
      }
      expect(loadRecorder.getLoadTimesOf('SharedTarget')).assertEqual(1);
      expect(sharedState.getThreadMarkCount()).assertEqual(1 + TASKPOOL_COUNT + WORKER_COUNT);
      for (let i = 1; i <= WORKER_COUNT; i++) {
        expect(sharedState.hasThreadMark(`worker-${i}`)).assertTrue();
      }
    });

    /**
     * @tc.name   sharedModule_singleton_0400
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_SINGLETON_0400
     * @tc.desc   Verify the shared module is loaded only once with a unique instance under concurrent access of main thread, taskpool and workers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_singleton_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainLoadId: string = sharedState.getLoadId();
      const marksBefore: number = sharedState.getThreadMarkCount();
      const checks: Array<Promise<string>> = [];
      checks.push(mainThreadMark('main-c'));
      checks.push(taskpool.execute(markThreadTask, 'taskpool-c1') as Promise<string>);
      checks.push(taskpool.execute(markThreadTask, 'taskpool-c2') as Promise<string>);
      checks.push(spawnWorkerCheck('worker-c1'));
      checks.push(spawnWorkerCheck('worker-c2'));
      const results: Array<string> = await withTimeout(Promise.all(checks), CHECK_TIMEOUT_MS);
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(mainLoadId);
      }
      expect(loadRecorder.getLoadTimesOf('SharedTarget')).assertEqual(1);
      expect(sharedState.getThreadMarkCount()).assertEqual(marksBefore + 5);
      expect(sharedState.hasThreadMark('main-c')).assertTrue();
      expect(sharedState.hasThreadMark('taskpool-c1')).assertTrue();
      expect(sharedState.hasThreadMark('taskpool-c2')).assertTrue();
      expect(sharedState.hasThreadMark('worker-c1')).assertTrue();
      expect(sharedState.hasThreadMark('worker-c2')).assertTrue();
    });
  });
}
