/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { printArgs1, } from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';

// Full GC must never run on the application main thread or on shared
// TaskPool threads:
// - main-thread ForceFullGC froze the main event loop for more than 6s
//   (THREAD_BLOCK_6S, native faultlogger evidence of the AsyncRunner
//   strict round 43);
// - a TaskPool-hosted ForceFullGC can deadlock with concurrent TaskPool
//   scheduling (ExecuteDelayed strict round 5: every later case hung
//   waiting for TaskPool results that never arrived).
// A dedicated ThreadWorker keeps GC off both execution paths, requests are
// serialized on one worker, and the bounded observation below keeps a rare
// worker-side stall from hanging the test case.
const FORCE_GC_WORKER_PATH: string = '../workers/ForceFullGCWorker.ets';
const FORCE_GC_OBSERVE_TIMEOUT_MS: number = 15000;

let forceGCWorker: worker.ThreadWorker | undefined = undefined;
let forceGCChain: Promise<void> = Promise.resolve();

function runForceGCOnce(gcWorker: worker.ThreadWorker): Promise<void> {
  return new Promise<void>((resolve) => {
    const finish = (): void => {
      resolve();
    };
    gcWorker.onmessage = (e: MessageEvents) => {
      finish();
    };
    gcWorker.onerror = (err: ErrorEvent) => {
      console.error(`forceFullGC worker error: ${JSON.stringify(err)}`);
      finish();
    };
    gcWorker.postMessage('forceFullGC');
  });
}

function scheduleBackgroundFullGC(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      try {
        let gcWorker: worker.ThreadWorker;
        if (forceGCWorker === undefined) {
          gcWorker = new worker.ThreadWorker(FORCE_GC_WORKER_PATH);
          forceGCWorker = gcWorker;
        } else {
          gcWorker = forceGCWorker;
        }
        const run: Promise<void> = forceGCChain.then(() => runForceGCOnce(gcWorker));
        forceGCChain = run.catch(() => {
        });
        resolve(run);
      } catch (error) {
        console.error(`forceFullGC worker unavailable: ${JSON.stringify(error)}`);
        resolve();
      }
    }, 10);
  });
}

// Observes GC completion with a bounded wait: a full GC normally finishes
// in well under a second, and a rare worker-side stall must not hang the
// test case or distort the assertions on the tasks under test.
async function awaitBackgroundFullGC(gcPromise: Promise<void>): Promise<void> {
  await Promise.race([gcPromise, sleep(FORCE_GC_OBSERVE_TIMEOUT_MS)]);
}

export default function taskPoolAsyncRunnerMultipleGCTest() {
  describe('TaskPoolAsyncRunnerMultipleGCTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(500);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolAsyncRunnerMultipleGCTest0100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_MULTIPLE_GC_TEST_0100
     * @tc.desc   test task ui
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleGCTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleGCTest0100';
      console.info(`${caseName} test start`);
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 1000);
      let count: number = 0;
      const gcRequests: Array<Promise<void>> = [];
      for (let j = 0; j < 10; j++) {
        await sleep(10);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1);
          asyncRunner.execute(task).then(() => {
            console.info('=======', count);
            count++;
          }).catch((e: BusinessError) => {
            console.info('=======error', JSON.stringify(e.message));
            expect().assertFail();
          })
        }
        if (j == (2 || 4 || 7)) {
          gcRequests.push(scheduleBackgroundFullGC());
        }
      }

      while (count < 100) {
        await sleep(100);
      }
      await awaitBackgroundFullGC(Promise.all(gcRequests).then(() => {}));
      expect(100).assertEqual(count);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   taskPoolAsyncRunnerMultipleGCTest0200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_MULTIPLE_GC_TEST_0200
     * @tc.desc   test task ui
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerMultipleGCTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'taskPoolAsyncRunnerMultipleGCTest0200';
      console.info(`${caseName} test start`);
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let count: number = 0;
      let priority: Array<taskpool.Priority> = [
        taskpool.Priority.HIGH,
        taskpool.Priority.LOW,
        taskpool.Priority.IDLE,
        taskpool.Priority.MEDIUM,
      ];
      for (let i = 0; i < 4; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1);
        asyncRunner.execute(task, priority[i]).then(() => {
          console.info('=======', count);
          count++;
        }).catch((e: BusinessError) => {
          console.info('=======error', JSON.stringify(e.message));
          expect(true).assertFalse();
        })
      }

      while (count < 4) {
        await sleep(100);
      }
      expect(4).assertEqual(count);
      console.info(`${caseName} test end`);
      Done();
    })

  })
}
