/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import process from '@ohos.process';
import { MessageEvent, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import {
  sleep,
  taskpoolTestFunc1,
  taskpoolTestFunc10,
  taskpoolTestFunc2,
  taskpoolTestFunc3,
  taskpoolTestFunc4,
  taskpoolTestFunc5,
  taskpoolTestFunc6,
  taskpoolTestFunc7,
  taskpoolTestFunc8,
  taskpoolTestFunc9,
  WorkThread10,
  WorkThread11,
  WorkThread12,
  WorkThread13,
  WorkThread14,
  WorkThread15,
  WorkThread16,
  WorkThread17,
  WorkThread18,
  WorkThread9
} from '../testability/pages/TaskpoolMethods';

const BASE_COUNT = 2;


export default function ProcessSupplementSecondTest() {
  describe('ProcessSupplementSecondTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   ProcessSupplementSecondTest0100
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0100
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0100';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, starting main thread tests`);
      for (let i = 0; i < TEST_COUNT; i++) {
        try {
          const result = process.isAppUid(TEST_UID);
          if (typeof result === 'boolean') {
            if (result) {
              console.info(` main thread result is ${result}`);
              successCount++;
            } else {
              console.info(` main thread result is ${result}`);
            }
            console.info(`${caseName}, main thread call ${i} success, result: ${result}`);
          } else {
            failureCount++;
            console.error(`${caseName}, main thread call ${i} failed: invalid return type`);
          }
        } catch (error) {
          exceptionCount++;
          console.error(`${caseName}, main thread call ${i} exception: ${error.message}`);
        }
      }
      console.info(`${caseName}, main thread test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });




    /**
     * @tc.name   ProcessSupplementSecondTest0200
     * @tc.number ProcessSupplementSecondTest0200
     * @tc.desc   ProcessSupplementSecondTest0200
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0200';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount: number = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      let completedTasks = 0;
      console.info(`${caseName}, starting taskpool tests`);
      const totalTasks = TEST_COUNT;
      const taskPromises: Promise<void>[] = [];
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(taskpoolTestFunc1, TEST_UID);
        const promise = taskpool.execute(task).then((result) => {
          successCount += 1;
          completedTasks++;
          console.info(`${caseName}, task ${i} completed with ${result} successes`);
        }).catch((e: BusinessError) => {
          exceptionCount += BASE_COUNT;
          console.error(`${caseName}, task ${i} failed: ${e.message}`);
        });
        taskPromises.push(promise);
      }
      await Promise.all(taskPromises);
      failureCount = TEST_COUNT - successCount - exceptionCount;
      console.info(`${caseName}, taskpool test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      expect(completedTasks).assertEqual(totalTasks);

      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest0300
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0300
     * @tc.desc   execute sendable function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ProcessSupplementSecondTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementSecondTest0300';
      console.info(`${caseName}, test start`);
      const TEST_UID = 12345;
      const TEST_COUNT = 100;
      let successCount = 0;
      let failureCount = 0;
      let exceptionCount = 0;
      console.info(`${caseName}, creating Worker`);
      const workerTestPromise = new Promise<void>((resolve) => {
        WorkThread9.workerStageModel.onmessage = (e: MessageEvent<number>) => {
          const results = e.data;
          successCount = results;
          console.info(`${caseName}, worker completed with results:`, results);
          resolve();
        };
        WorkThread9.workerStageModel.onerror = (e: ErrorEvent) => {
          console.error(`${caseName}, worker error:`, e.message);
          exceptionCount = TEST_COUNT;
          resolve();
        };
      });
      console.info(`${caseName}, starting Worker test`);
      WorkThread9.workerStageModel.postMessage({ uid: TEST_UID, count: TEST_COUNT });
      await workerTestPromise;
      WorkThread9.workerStageModel.terminate();
      console.info(`${caseName}, Worker test results:`);
      console.info(`Success: ${successCount}, Failures: ${failureCount}, Exceptions: ${exceptionCount}`);
      expect(successCount).assertEqual(TEST_COUNT);
      expect(failureCount).assertEqual(0);
      expect(exceptionCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    });


    /**
     * @tc.name   ProcessSupplementSecondTest0400
     * @tc.number SUB_PROCESS_SUPPLEMENT_SECOND_TEST_0400
     * @tc.desc   execute sendable function
