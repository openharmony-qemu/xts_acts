import { describe, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { taskpool, worker } from '@kit.ArkTS';
import { loadRecorder } from '../share/LoadRecorder';
import { getALoadMarker, getBLoadIdThroughA } from '../share/NonSharedA';

const DOMAIN: number = 0x0000;
const TAG: string = 'SharedModuleRef';
const TASKPOOL_COUNT: number = 3;
const WORKER_COUNT: number = 3;
const CONCURRENT_TASKPOOL_COUNT: number = 2;
const CONCURRENT_WORKER_COUNT: number = 2;
const WORKER_SCRIPT: string = '../workers/NonSharedRefWorker.ets';
const CHECK_TIMEOUT_MS: number = 15000;

// Taskpool task: reads A's load marker and B's load marker (through A) on this
// thread, posting back `${aMarker}|${bLoadId}`
@Concurrent
async function readMarkersTask(): Promise<string> {
  return `${getALoadMarker()}|${getBLoadIdThroughA()}`;
}

// Main-thread participant: same logic as the task function (aggregated via
// Promise.all in the comprehensive concurrency case)
async function mainReadMarkers(): Promise<string> {
  return `${getALoadMarker()}|${getBLoadIdThroughA()}`;
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

// Parse A's load marker from the reply (reply format `${aMarker}|${bLoadId}`)
function parseAMarker(reply: string): string {
  const parts: Array<string> = reply.split('|');
  return parts[0];
}

// Parse B's load marker (read through A) from the reply
function parseBLoadId(reply: string): string {
  const parts: Array<string> = reply.split('|');
  return parts[1];
}

// Markers of A module instances observed so far (maintained on the main thread
// only, dedup by value). Race-free replacement for LoadRecorder counting inside
// concurrent windows: the number of distinct markers equals the number of distinct
// thread loads (each marker embeds a per-thread tid). The LoadRecorder counter is
// concurrent-push racy (Sendable array structural modification) and is kept as a
// diagnostic log only in those windows.
let seenAMarkers: Array<string> = [];

function rememberAMarker(marker: string): void {
  if (seenAMarkers.indexOf(marker) < 0) {
    seenAMarkers.push(marker);
  }
}

// Registry of created workers, swept in afterAll
let refWorkerRegistry: Array<worker.ThreadWorker> = [];

// Spawn a reference-check worker: terminates right after posting back
// `${aMarker}|${bLoadId}`
function spawnRefWorker(): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    const wk = new worker.ThreadWorker(WORKER_SCRIPT);
    refWorkerRegistry.push(wk);
    wk.onmessage = (e) => {
      const reply: string = e.data as string;
      resolve(reply);
      wk.terminate();
    };
    wk.onerror = (err) => {
      reject(new Error(`ref worker error: ${err.message}`));
    };
    wk.postMessage('check');
  });
}

export default function sharedModuleNonSharedRefTest() {
  describe('SharedModuleNonSharedRefTest', () => {
    afterAll(() => {
      // Best-effort sweep of leftover workers (terminating an already-terminated
      // worker throws BusinessError, caught and ignored)
      for (let i = 0; i < refWorkerRegistry.length; i++) {
        try {
          refWorkerRegistry[i].terminate();
        } catch (e) {
          hilog.warn(DOMAIN, TAG, 'terminate failed: %{public}s', JSON.stringify(e));
        }
      }
      refWorkerRegistry = [];
    });

    /**
     * @tc.name   sharedModule_nonSharedRef_0100
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_NONSHAREDREF_0100
     * @tc.desc   Verify the non-shared module A is loaded once on the main thread and the shared module B is loaded only once.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_nonSharedRef_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const aMarker1: string = getALoadMarker();
      const aMarker2: string = getALoadMarker();
      const bLoadId: string = getBLoadIdThroughA();
      rememberAMarker(aMarker1);
      hilog.info(DOMAIN, TAG, 'main aMarker=%{public}s bLoadId=%{public}s aLoads=%{public}d bLoads=%{public}d', aMarker1, bLoadId, loadRecorder.getLoadTimesOf('NonSharedA'), loadRecorder.getLoadTimesOf('SharedB'));
      expect(aMarker1).assertContain('a-load-');
      expect(aMarker1).assertEqual(aMarker2);
      expect(loadRecorder.getLoadTimesOf('NonSharedA')).assertEqual(1);
      expect(seenAMarkers.length).assertEqual(1);
      expect(bLoadId).assertContain('b-load-');
      expect(loadRecorder.getLoadTimesOf('SharedB')).assertEqual(1);
    });

    /**
     * @tc.name   sharedModule_nonSharedRef_0200
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_NONSHAREDREF_0200
     * @tc.desc   Verify taskpool threads load independent copies of the non-shared module A while B stays globally unique through A.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_nonSharedRef_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainAMarker: string = getALoadMarker();
      const mainBLoadId: string = getBLoadIdThroughA();
      const seenBefore: number = seenAMarkers.length;
      const tasks: Array<Promise<string>> = [];
      for (let i = 1; i <= TASKPOOL_COUNT; i++) {
        tasks.push(taskpool.execute(readMarkersTask) as Promise<string>);
      }
      const replies: Array<string> = await withTimeout(Promise.all(tasks), CHECK_TIMEOUT_MS);
      for (let i = 0; i < replies.length; i++) {
        expect(parseBLoadId(replies[i])).assertEqual(mainBLoadId);
        const marker: string = parseAMarker(replies[i]);
        expect(marker).not().assertEqual(mainAMarker);
        rememberAMarker(marker);
      }
      const seenAfter: number = seenAMarkers.length;
      hilog.info(DOMAIN, TAG, 'taskpool aLoads(recorder)=%{public}d seenBefore=%{public}d seenAfter=%{public}d', loadRecorder.getLoadTimesOf('NonSharedA'), seenBefore, seenAfter);
      expect(seenAfter >= seenBefore + 1).assertTrue();
      expect(seenAfter <= seenBefore + TASKPOOL_COUNT).assertTrue();
      expect(loadRecorder.getLoadTimesOf('SharedB')).assertEqual(1);
    });

    /**
     * @tc.name   sharedModule_nonSharedRef_0300
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_NONSHAREDREF_0300
     * @tc.desc   Verify each worker loads an independent copy of the non-shared module A while B stays globally unique through A.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_nonSharedRef_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainAMarker: string = getALoadMarker();
      const mainBLoadId: string = getBLoadIdThroughA();
      const seenBefore: number = seenAMarkers.length;
      const checks: Array<Promise<string>> = [];
      for (let i = 1; i <= WORKER_COUNT; i++) {
        checks.push(spawnRefWorker());
      }
      const replies: Array<string> = await withTimeout(Promise.all(checks), CHECK_TIMEOUT_MS);
      const aMarkers: Array<string> = [];
      for (let i = 0; i < replies.length; i++) {
        expect(parseBLoadId(replies[i])).assertEqual(mainBLoadId);
        const marker: string = parseAMarker(replies[i]);
        expect(marker).not().assertEqual(mainAMarker);
        aMarkers.push(marker);
        rememberAMarker(marker);
      }
      for (let i = 0; i < aMarkers.length; i++) {
        for (let j = i + 1; j < aMarkers.length; j++) {
          expect(aMarkers[i]).not().assertEqual(aMarkers[j]);
        }
      }
      const seenAfter: number = seenAMarkers.length;
      hilog.info(DOMAIN, TAG, 'workers aLoads(recorder)=%{public}d aMarkers=%{public}s seenBefore=%{public}d seenAfter=%{public}d', loadRecorder.getLoadTimesOf('NonSharedA'), aMarkers.join(','), seenBefore, seenAfter);
      expect(seenAfter).assertEqual(seenBefore + WORKER_COUNT);
      expect(loadRecorder.getLoadTimesOf('SharedB')).assertEqual(1);
    });

    /**
     * @tc.name   sharedModule_nonSharedRef_0400
     * @tc.number SUB_COMPILER_RUNTIME_SHAREDMODULE_NONSHAREDREF_0400
     * @tc.desc   Verify the non-shared module A is isolated per thread while B stays globally unique under concurrent access.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sharedModule_nonSharedRef_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mainAMarker: string = getALoadMarker();
      const mainBLoadId: string = getBLoadIdThroughA();
      const seenBefore: number = seenAMarkers.length;
      const checks: Array<Promise<string>> = [];
      checks.push(mainReadMarkers());
      for (let i = 1; i <= CONCURRENT_TASKPOOL_COUNT; i++) {
        checks.push(taskpool.execute(readMarkersTask) as Promise<string>);
      }
      for (let i = 1; i <= CONCURRENT_WORKER_COUNT; i++) {
        checks.push(spawnRefWorker());
      }
      const replies: Array<string> = await withTimeout(Promise.all(checks), CHECK_TIMEOUT_MS);
      for (let i = 0; i < replies.length; i++) {
        expect(parseBLoadId(replies[i])).assertEqual(mainBLoadId);
      }
      expect(parseAMarker(replies[0])).assertEqual(mainAMarker);
      for (let i = 1; i <= CONCURRENT_TASKPOOL_COUNT; i++) {
        expect(parseAMarker(replies[i])).not().assertEqual(mainAMarker);
      }
      const workerMarkers: Array<string> = [];
      for (let i = 0; i < CONCURRENT_WORKER_COUNT; i++) {
        const marker: string = parseAMarker(replies[1 + CONCURRENT_TASKPOOL_COUNT + i]);
        expect(marker).not().assertEqual(mainAMarker);
        workerMarkers.push(marker);
      }
      expect(workerMarkers[0]).not().assertEqual(workerMarkers[1]);
      for (let i = 0; i < replies.length; i++) {
        rememberAMarker(parseAMarker(replies[i]));
      }
      const seenAfter: number = seenAMarkers.length;
      hilog.info(DOMAIN, TAG, 'concurrent aLoads(recorder)=%{public}d seenBefore=%{public}d seenAfter=%{public}d', loadRecorder.getLoadTimesOf('NonSharedA'), seenBefore, seenAfter);
      expect(seenAfter >= seenBefore + CONCURRENT_WORKER_COUNT).assertTrue();
      expect(seenAfter <= seenBefore + CONCURRENT_WORKER_COUNT + CONCURRENT_TASKPOOL_COUNT).assertTrue();
      expect(loadRecorder.getLoadTimesOf('SharedB')).assertEqual(1);
    });
  });
}
