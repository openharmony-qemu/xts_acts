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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import {
  andTask,
  atomicCompareExchangeTask, atomicOrTask, atomicTask1,
  atomicXorTask,
  exchangeTask,
  modifyInt16Array,
  modifyValueTask,
  notifyInTaskpool,
  orTask,
  sleep,
  StoreWorker,
  subTask,
  taskAnd,
  taskExchange,
  taskOr,
  taskStore,
  taskSub,
  taskXor,
  waitInTaskpool,
  waitInTaskpool2,
  waitInTaskpool3,
  Worker3,
  WorkerSrc,
  WorkerSrc1,
  WorkerSrc2,
  WorkerSrc3,
  WorkerSrc4,
  XorWorker} from '../../testability/pages/TestUtils';

export default function AtomicsFunctionTest() {
  describe('AtomicsFunctionTest', () => {
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
     * @tc.name   testArkTSUtilsAtomicsFunction0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0100';
      console.info(`${caseName} test start`);
      const buffer = new collections.ArrayBuffer(4);
      const sharedArray = new collections.Int8Array(buffer);
      ArkTSUtils.Atomics.store(sharedArray, 0, 0);

      const task = new taskpool.Task(atomicTask1,sharedArray);
      const taskResult = await taskpool.execute(task);
      const mainThreadResult = ArkTSUtils.Atomics.load(sharedArray, 0);
      expect(taskResult).assertEqual(mainThreadResult);
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0300';
      console.info(`${caseName} test start`);
      const buffer = new collections.ArrayBuffer(200);
      const sharedArray = new collections.Int16Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i;
      }
      const task = new taskpool.Task(atomicCompareExchangeTask,sharedArray);
      const result = await taskpool.execute(task);
      console.info(`${result}`);

      for (let i = 0; i < 100; i++) {
        const mainResult = ArkTSUtils.Atomics.load(sharedArray, i);
        const expected = i + 1;
        expect(mainResult).assertEqual(expected);
      }
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0500';
      console.info(`${caseName} test start`);
      const buffer = new collections.ArrayBuffer(400);
      const sharedArray = new collections.Int32Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i;
      }
      const task = new taskpool.Task(atomicOrTask,sharedArray);
      const result = await taskpool.execute(task);
      console.info(`${result}`);

      for (let i = 0; i < 100; i++) {
        const mainResult = ArkTSUtils.Atomics.load(sharedArray, i);
        const expected = i | 2;
        expect(mainResult).assertEqual(expected);
      }
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1100';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer = new collections.ArrayBuffer(4 * (100 * 10 + 1));
      const int32Array = new collections.Int32Array(sharedArrayBuffer);
      for (let i = 0; i < 100 * 10; i++) {
        int32Array[i] = i;
      }
      const counterIndex = 100 * 10;
      ArkTSUtils.Atomics.store(int32Array, counterIndex, 0);

      const taskGroup = new taskpool.TaskGroup();
      const tasks = [taskXor, taskStore, taskAnd, taskExchange, taskOr, taskSub];
      for (let i = 0; i < tasks.length; i++) {
        const startIndex = i * 100;
        const task = new taskpool.Task(tasks[i], int32Array, startIndex, counterIndex);
        taskGroup.addTask(task);
      }
      await taskpool.execute(taskGroup);
      console.info('All tasks executed successfully');

      for (let i = 0; i < 6; i++) {
        const startIndex = i * 100;
        for (let j = 0; j < 100; j++) {
          const value = ArkTSUtils.Atomics.load(int32Array, startIndex + j);
          console.info(`collections.Int32Array[${startIndex + j}] value: ${value}`);
        }
      }
      const finalCount = ArkTSUtils.Atomics.load(int32Array, counterIndex);
      console.info(`Final counter value: ${finalCount}`);
      expect(600).assertEqual(finalCount);
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1200';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer = new collections.ArrayBuffer(1);
      const int8Array = new collections.Int8Array(sharedArrayBuffer);
      int8Array[0] = 10;
      const targetIndex = 0;
      const task = new taskpool.Task(modifyValueTask, int8Array, targetIndex);
      await taskpool.execute(task);
      console.info('Task executed successfully');
      const newValue = ArkTSUtils.Atomics.load(int8Array, targetIndex);
      console.log(`Value at index ${targetIndex} after modification: ${newValue}`);
      expect(20).assertEqual(newValue);
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1400';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(11 * 4);
      const int32Array = new collections.Int32Array(sharedArrayBuffer);
      for (let i: number = 0; i < 10; i++) {
        int32Array[i] = i * 2;
      }
      const statusIndex: number = 10;
      ArkTSUtils.Atomics.store(int32Array, statusIndex, 0);
      const targetIndex: number = 3;
      const newValue: number = 100;
      const task: taskpool.Task = new taskpool.Task(modifyInt16Array, sharedArrayBuffer, targetIndex, newValue, statusIndex);
      taskpool.execute(task)
        .then(() => {
          console.log('Task in taskpool completed.');
        })
        .catch((err: ErrorEvent) => {
          console.error('Error in taskpool: ', err.message);
        });
      ArkTSUtils.Atomics.wait(int32Array, statusIndex, 0, 10000);
      const firstLoadedValue: number = ArkTSUtils.Atomics.load(int32Array, targetIndex);
      expect(firstLoadedValue).assertEqual(newValue);
      ArkTSUtils.Atomics.wait(int32Array, statusIndex, 0, 10000);
      const secondLoadedValue: number = ArkTSUtils.Atomics.load(int32Array, targetIndex);
      expect(secondLoadedValue).assertEqual(newValue)
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0700
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1600';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(11 * 4);
      const int32Array: collections.Int32Array = new collections.Int32Array(sharedArrayBuffer);
      for (let i = 0; i < 10; i++) {
        int32Array[i] = i * 2;
      }
      const statusIndex: number = 10;
      ArkTSUtils.Atomics.store(int32Array, statusIndex, 0);
      for (let i = 0; i < 10; i++) {
        const task: taskpool.Task = new taskpool.Task(waitInTaskpool2, sharedArrayBuffer, statusIndex);
        taskpool.execute(task)
          .then(() => {
            console.log(`Task ${i} in taskpool completed.`);
          })
          .catch((err: ErrorEvent) => {
            console.error(`Error in taskpool task ${i}: `, err.message);
          });
      }
      const loadedValue = ArkTSUtils.Atomics.load(int32Array, statusIndex);
      expect(loadedValue).assertEqual(0);
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0800
     * @tc.desc   Read back collections.Uint8Array after worker atomic AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0200';
      const buffer = new collections.ArrayBuffer(100);
      const sharedArray = new collections.Uint8Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i + 1;
      }
      await new Promise<void>((resolve) => {
        WorkerSrc.workerInstance.postMessage(buffer);
        WorkerSrc.workerInstance.onmessage = (e: MessageEvents) => {
          const workerData = e.data as collections.Uint8Array;
          for (let i = 0; i < 100; i++) {
            expect(ArkTSUtils.Atomics.load(sharedArray, i)).assertEqual(workerData[i]);
          }
        };
        WorkerSrc.workerInstance.onexit = (code: number) => {
          expect(code).assertEqual(0);
          resolve();
        };
      });
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_0900
     * @tc.desc   Read back collections.Uint16Array after worker atomic exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0400';
      const buffer = new collections.ArrayBuffer(200);
      const sharedArray = new collections.Uint16Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i;
      }
      await new Promise<void>((resolve) => {
        WorkerSrc2.workerInstance.postMessage(buffer);
        WorkerSrc2.workerInstance.onmessage = (e: MessageEvents) => {
          const workerData = new collections.Uint16Array(e.data as collections.ArrayBuffer);
          for (let i = 0; i < 100; i++) {
            expect(ArkTSUtils.Atomics.load(sharedArray, i)).assertEqual(workerData[i]);
          }
        };
        WorkerSrc2.workerInstance.onexit = (code: number) => {
          expect(code).assertEqual(0);
          resolve();
        };
      });
      console.info(`${caseName} test end`);
      Done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsFunction0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_FUNCTION_1000
     * @tc.desc   Read back collections.Uint32Array after worker atomic store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsFunction0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0600';
      const buffer = new collections.ArrayBuffer(400);
      const sharedArray = new collections.Uint32Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i;
      }
      await new Promise<void>((resolve) => {
        WorkerSrc3.workerInstance.postMessage(buffer);
        WorkerSrc3.workerInstance.onmessage = (e: MessageEvents) => {
          const workerData = new collections.Uint32Array(e.data as collections.ArrayBuffer);
          for (let i = 0; i < 100; i++) {
            expect(ArkTSUtils.Atomics.load(sharedArray, i)).assertEqual(workerData[i]);
          }
        };
        WorkerSrc3.workerInstance.onexit = (code: number) => {
          expect(code).assertEqual(0);
          resolve();
        };
      });
      console.info(`${caseName} test end`);
      Done();
    });
  })
}
