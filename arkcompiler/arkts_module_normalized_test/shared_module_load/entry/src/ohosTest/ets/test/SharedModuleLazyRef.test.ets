import { describe, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { taskpool, worker } from '@kit.ArkTS';
import { loadRecorder } from '../share/LoadRecorder';
import { sharedCGateway } from '../share/SharedC';

const DOMAIN: number = 0x0000;
const TAG: string = 'SharedModuleLazyRef';
const TASKPOOL_COUNT: number = 3;
const WORKER_COUNT: number = 3;
const CONCURRENT_TASKPOOL_COUNT: number = 2;
const CONCURRENT_WORKER_COUNT: number = 2;
const WORKER_SCRIPT: string = '../workers/LazyRefWorker.ets';
const CHECK_TIMEOUT_MS: number = 15000;

// Taskpool access task: accesses D through C's gateway on this thread, triggering
// this thread's lazy load, and returns the dMarker
@Concurrent
async function readDThroughCTask(): Promise<string> {
  return sharedCGateway.readDThroughC();
}

// Taskpool bind-only task: only instantiates this test-file module on the taskpool
// thread and binds C without accessing D (an unchanged D count after it runs proves
// that binding alone does not load)
@Concurrent
async function bindOnlyTask(): Promise<string> {
  return 'bound';
}

// Main-thread participant: accesses D through C's gateway (aggregated via
// Promise.all in the comprehensive concurrency case)
async function mainReadDThroughC(): Promise<string> {
  return sharedCGateway.readDThroughC();
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

// Markers of D module instances observed so far (maintained on the main thread
// only, dedup by value). Race-free replacement for LoadRecorder counting inside
// concurrent windows: the number of distinct markers equals the number of distinct
// thread loads (each marker embeds a per-thread tid). The LoadRecorder counter is
// concurrent-push racy (Sendable array structural modification) and is kept as a
// diagnostic log only in those windows.
let seenDMarkers: Array<string> = [];

function rememberDMarker(marker: string): void {
  if (seenDMarkers.indexOf(marker) < 0) {
    seenDMarkers.push(marker);
  }
}

// Registry of created workers, swept in afterAll
let lazyWorkerRegistry: Array<worker.ThreadWorker> = [];

// Spawn a lazy-ref worker:
// cmd='bind'  only binds C without accessing D (posts back 'bound', verifies that
//             binding alone does not load)
// cmd='check' accesses D through C's gateway, triggering this thread's lazy load
//             (posts back the dMarker)
function spawnLazyRefWorker(cmd: string): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    const wk = new worker.ThreadWorker(WORKER_SCRIPT);
    lazyWorkerRegistry.push(wk);
    wk.onmessage = (e) => {
      const reply: string = e.data as string;
      resolve(reply);
      wk.terminate();
    };
    wk.onerror = (err) => {
      reject(new Error(`lazy ref worker error: ${err.message}`));
    };
    wk.postMessage(cmd);
  });
}

export default function sharedModuleLazyRefTest() {
  describe('SharedModuleLazyRefTest', () => {
    afterAll(() => {
      // Best-effort sweep of leftover workers (terminating an already-terminated
      // worker throws BusinessError, caught and ignored)
      for (let i = 0; i < lazyWorkerRegistry.length; i++) {
        try {
          lazyWorkerRegistry[i].terminate();
        } catch (e) {
          hilog.warn(DOMAIN, TAG, 'terminate failed: %{public}s', JSON.stringify(e));
        }
      }
      lazyWorkerRegistry = [];
    });

    /**
     * @tc.name   sharedModule_lazyRef_0100
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_LAZYREF_0100
     * @tc.desc   Verify the non-shared dependency D is loaded during import resolution of the shared module C on the loading thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_lazyRef_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(loadRecorder.getLoadTimesOf('SharedC')).assertEqual(1);
      const lazyBefore: number = loadRecorder.getLoadTimesOf('NonSharedD');
      hilog.info(DOMAIN, TAG, 'before access dLoads=%{public}d cLoads=%{public}d records=%{public}s', lazyBefore, loadRecorder.getLoadTimesOf('SharedC'), loadRecorder.getRecordList());
      expect(lazyBefore).assertEqual(1);
      const dMarker1: string = sharedCGateway.readDThroughC();
      const dMarker2: string = sharedCGateway.readDThroughC();
      rememberDMarker(dMarker1);
      hilog.info(DOMAIN, TAG, 'main dMarker=%{public}s', dMarker1);
      expect(dMarker1).assertContain('d-load-');
      expect(dMarker1).assertEqual(dMarker2);
      expect(loadRecorder.getLoadTimesOf('NonSharedD')).assertEqual(1);
      expect(seenDMarkers.length).assertEqual(1);
      expect(loadRecorder.getLoadTimesOf('SharedC')).assertEqual(1);
    });

    /**
     * @tc.name   sharedModule_lazyRef_0200
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_LAZYREF_0200
     * @tc.desc   Verify taskpool threads bind C without loading D and lazily load D on first access.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_lazyRef_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainDMarker: string = sharedCGateway.readDThroughC();
      const recorderBefore: number = loadRecorder.getLoadTimesOf('NonSharedD');
      const seenBefore: number = seenDMarkers.length;
      const bindReplies: Array<string> = await withTimeout(Promise.all([taskpool.execute(bindOnlyTask) as Promise<string>]), CHECK_TIMEOUT_MS);
      expect(bindReplies[0]).assertEqual('bound');
      expect(loadRecorder.getLoadTimesOf('NonSharedD')).assertEqual(recorderBefore);
      expect(seenDMarkers.length).assertEqual(seenBefore);
      const tasks: Array<Promise<string>> = [];
      for (let i = 1; i <= TASKPOOL_COUNT; i++) {
        tasks.push(taskpool.execute(readDThroughCTask) as Promise<string>);
      }
      const replies: Array<string> = await withTimeout(Promise.all(tasks), CHECK_TIMEOUT_MS);
      for (let i = 0; i < replies.length; i++) {
        expect(replies[i]).not().assertEqual(mainDMarker);
        rememberDMarker(replies[i]);
      }
      const seenAfter: number = seenDMarkers.length;
      hilog.info(DOMAIN, TAG, 'taskpool dLoads(recorder)=%{public}d seenBefore=%{public}d seenAfter=%{public}d', loadRecorder.getLoadTimesOf('NonSharedD'), seenBefore, seenAfter);
      expect(seenAfter >= seenBefore + 1).assertTrue();
      expect(seenAfter <= seenBefore + TASKPOOL_COUNT).assertTrue();
      expect(loadRecorder.getLoadTimesOf('SharedC')).assertEqual(1);
    });

    /**
     * @tc.name   sharedModule_lazyRef_0300
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_LAZYREF_0300
     * @tc.desc   Verify each worker binds C without loading D and lazily loads D on first access.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_lazyRef_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainDMarker: string = sharedCGateway.readDThroughC();
      const recorderBefore: number = loadRecorder.getLoadTimesOf('NonSharedD');
      const seenBefore: number = seenDMarkers.length;
      const bindReplies: Array<string> = await withTimeout(Promise.all([spawnLazyRefWorker('bind')]), CHECK_TIMEOUT_MS);
      expect(bindReplies[0]).assertEqual('bound');
      expect(loadRecorder.getLoadTimesOf('NonSharedD')).assertEqual(recorderBefore);
      expect(seenDMarkers.length).assertEqual(seenBefore);
      const checks: Array<Promise<string>> = [];
      for (let i = 1; i <= WORKER_COUNT; i++) {
        checks.push(spawnLazyRefWorker('check'));
      }
      const replies: Array<string> = await withTimeout(Promise.all(checks), CHECK_TIMEOUT_MS);
      for (let i = 0; i < replies.length; i++) {
        expect(replies[i]).not().assertEqual(mainDMarker);
        rememberDMarker(replies[i]);
      }
      for (let i = 0; i < replies.length; i++) {
        for (let j = i + 1; j < replies.length; j++) {
          expect(replies[i]).not().assertEqual(replies[j]);
        }
      }
      const seenAfter: number = seenDMarkers.length;
      hilog.info(DOMAIN, TAG, 'workers dLoads(recorder)=%{public}d dMarkers=%{public}s seenBefore=%{public}d seenAfter=%{public}d', loadRecorder.getLoadTimesOf('NonSharedD'), replies.join(','), seenBefore, seenAfter);
      expect(seenAfter).assertEqual(seenBefore + WORKER_COUNT);
      expect(loadRecorder.getLoadTimesOf('SharedC')).assertEqual(1);
    });

    /**
     * @tc.name   sharedModule_lazyRef_0400
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_LAZYREF_0400
     * @tc.desc   Verify lazy loading of the non-shared dependency is isolated per thread under concurrent access of main thread, taskpool and workers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_lazyRef_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainDMarker: string = sharedCGateway.readDThroughC();
      const seenBefore: number = seenDMarkers.length;
      const checks: Array<Promise<string>> = [];
      checks.push(mainReadDThroughC());
      for (let i = 1; i <= CONCURRENT_TASKPOOL_COUNT; i++) {
        checks.push(taskpool.execute(readDThroughCTask) as Promise<string>);
      }
      for (let i = 1; i <= CONCURRENT_WORKER_COUNT; i++) {
        checks.push(spawnLazyRefWorker('check'));
      }
      const replies: Array<string> = await withTimeout(Promise.all(checks), CHECK_TIMEOUT_MS);
      expect(replies[0]).assertEqual(mainDMarker);
      for (let i = 1; i < replies.length; i++) {
        expect(replies[i]).not().assertEqual(mainDMarker);
      }
      const w0: string = replies[1 + CONCURRENT_TASKPOOL_COUNT];
      const w1: string = replies[1 + CONCURRENT_TASKPOOL_COUNT + 1];
      expect(w0).not().assertEqual(w1);
      for (let i = 0; i < replies.length; i++) {
        rememberDMarker(replies[i]);
      }
      const seenAfter: number = seenDMarkers.length;
      hilog.info(DOMAIN, TAG, 'concurrent dLoads(recorder)=%{public}d seenBefore=%{public}d seenAfter=%{public}d', loadRecorder.getLoadTimesOf('NonSharedD'), seenBefore, seenAfter);
      expect(seenAfter >= seenBefore + CONCURRENT_WORKER_COUNT).assertTrue();
      expect(seenAfter <= seenBefore + CONCURRENT_WORKER_COUNT + CONCURRENT_TASKPOOL_COUNT).assertTrue();
      expect(loadRecorder.getLoadTimesOf('SharedC')).assertEqual(1);
    });
  });
}
