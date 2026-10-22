import { describe, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { taskpool, worker } from '@kit.ArkTS';
import { singletonA } from '../share/SingletonA';

const DOMAIN: number = 0x0000;
const TAG: string = 'SharedModuleState';
const ROUNDS: number = 10;
const TASKPOOL_COUNT: number = 3;
const CONCURRENT_TASKPOOL_COUNT: number = 2;
const WORKER_COUNT: number = 2;
const CHECK_TIMEOUT_MS: number = 20000;
const STATE_WORKER_SCRIPT: string = '../workers/SingletonAWorker.ets';

// Taskpool task: loops "increase + read" each round and returns the last observed
// value on this thread (for range assertions on the main thread)
@Concurrent
async function increaseAndGetTask(rounds: number): Promise<number> {
  let observed: number = 0;
  for (let i = 0; i < rounds; i++) {
    await singletonA.increaseCount();
    observed = await singletonA.getCount();
  }
  return observed;
}

// Main-thread participant: same logic as the task function (aggregated via
// Promise.all in the comprehensive concurrency case)
async function mainIncreaseAndGet(rounds: number): Promise<number> {
  let observed: number = 0;
  for (let i = 0; i < rounds; i++) {
    await singletonA.increaseCount();
    observed = await singletonA.getCount();
  }
  return observed;
}

// Timeout guard: prevents a hung async participant from suspending the case
// (a timeout fails the whole case)
function withTimeout(promise: Promise<Array<number>>, timeoutMs: number): Promise<Array<number>> {
  const timeout: Promise<Array<number>> = new Promise<Array<number>>((resolve, reject) => {
    setTimeout(() => {
      reject(new Error(`timeout after ${timeoutMs}ms`));
    }, timeoutMs);
  });
  return Promise.race([promise, timeout]);
}

// Registry of created workers, swept in afterAll
let stateWorkerRegistry: Array<worker.ThreadWorker> = [];

// Spawn a state-check worker: sends the round count, terminates right after the
// last observed value is posted back
function spawnStateWorker(rounds: number): Promise<number> {
  return new Promise<number>((resolve, reject) => {
    const wk = new worker.ThreadWorker(STATE_WORKER_SCRIPT);
    stateWorkerRegistry.push(wk);
    wk.onmessage = (e) => {
      const observed: number = e.data as number;
      resolve(observed);
      wk.terminate();
    };
    wk.onerror = (err) => {
      reject(new Error(`state worker error: ${err.message}`));
    };
    wk.postMessage(rounds);
  });
}

export default function sharedModuleStateTest() {
  describe('SharedModuleStateTest', () => {
    afterAll(() => {
      // Best-effort sweep of leftover workers (terminating an already-terminated
      // worker throws BusinessError, caught and ignored)
      for (let i = 0; i < stateWorkerRegistry.length; i++) {
        try {
          stateWorkerRegistry[i].terminate();
        } catch (e) {
          hilog.warn(DOMAIN, TAG, 'terminate failed: %{public}s', JSON.stringify(e));
        }
      }
      stateWorkerRegistry = [];
    });

    /**
     * @tc.name   sharedModule_state_0100
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_STATE_0100
     * @tc.desc   Verify the AsyncLock-protected counter increases exactly with sequential increase/getCount on the main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_state_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: number = await singletonA.getCount();
      for (let i = 1; i <= ROUNDS; i++) {
        await singletonA.increaseCount();
        const observed: number = await singletonA.getCount();
        expect(observed).assertEqual(before + i);
      }
      hilog.info(DOMAIN, TAG, 'sequential before=%{public}d after=%{public}d', before, before + ROUNDS);
    });

    /**
     * @tc.name   sharedModule_state_0200
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_STATE_0200
     * @tc.desc   Verify no lost updates when multiple taskpool threads concurrently increase and read the shared counter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_state_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: number = await singletonA.getCount();
      const tasks: Array<Promise<number>> = [];
      for (let i = 1; i <= TASKPOOL_COUNT; i++) {
        tasks.push(taskpool.execute(increaseAndGetTask, ROUNDS) as Promise<number>);
      }
      const observedList: Array<number> = await withTimeout(Promise.all(tasks), CHECK_TIMEOUT_MS);
      const final: number = await singletonA.getCount();
      hilog.info(DOMAIN, TAG, 'taskpool before=%{public}d final=%{public}d observed=%{public}s', before, final, JSON.stringify(observedList));
      expect(final).assertEqual(before + TASKPOOL_COUNT * ROUNDS);
      for (let i = 0; i < observedList.length; i++) {
        expect(observedList[i] >= before + ROUNDS).assertTrue();
        expect(observedList[i] <= final).assertTrue();
      }
    });

    /**
     * @tc.name   sharedModule_state_0300
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_STATE_0300
     * @tc.desc   Verify state consistency when main thread, taskpool and workers concurrently increase and read the shared counter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_state_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: number = await singletonA.getCount();
      const total: number = 1 + CONCURRENT_TASKPOOL_COUNT + WORKER_COUNT;
      const participants: Array<Promise<number>> = [];
      participants.push(mainIncreaseAndGet(ROUNDS));
      for (let i = 1; i <= CONCURRENT_TASKPOOL_COUNT; i++) {
        participants.push(taskpool.execute(increaseAndGetTask, ROUNDS) as Promise<number>);
      }
      for (let i = 1; i <= WORKER_COUNT; i++) {
        participants.push(spawnStateWorker(ROUNDS));
      }
      const observedList: Array<number> = await withTimeout(Promise.all(participants), CHECK_TIMEOUT_MS);
      const final: number = await singletonA.getCount();
      hilog.info(DOMAIN, TAG, 'concurrent before=%{public}d final=%{public}d observed=%{public}s', before, final, JSON.stringify(observedList));
      expect(final).assertEqual(before + total * ROUNDS);
      for (let i = 0; i < observedList.length; i++) {
        expect(observedList[i] >= before + ROUNDS).assertTrue();
        expect(observedList[i] <= final).assertTrue();
      }
    });
  });
}
