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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { collections } from '@kit.ArkTS';
import type { BusinessError } from '@ohos.base';
import {
  Int8_test_0001,
  Int8_test_0002,
  Int8_test_0003,
  Int8_test_0004,
  Int8_test_0005,
  Int8_test_0006,
  Int8_test_0007,
  Int8_test_0008,
  Int8_test_0009,
  Int8_test_0010,
  Int8_test_0011,
  Int8_test_0012,
  Int8_test_0013,
  Int8_test_0014,
  Int8_test_0015,
  Int8_test_0016,
  Int8_test_0017,
  Int8_test_0018,
  Int8_test_0019,
  Int8_test_0020,
  Int8_test_0021,
  Int8_test_0022,
  Int8_test_0023,
  Int8_test_0024,
  Int8_test_0025,
  Int8_test_0026,
  Int8_test_0027
} from '../testability/pages/Int8TaskPool';


let concurrentNum = 100
let arrCount = 1000

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Int8ArrayGlobalTest() {
  describe('Int8ArrayGlobalTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   Int8array_test_0001
     * @tc.number SUB_INT8ARRAY_TEST_0001
     * @tc.desc   Test Int8array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int8array_test_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int8array_test_0001';
        console.info(`${caseName} test start`);
        let array: collections.Int8Array = collections.Int8Array.from<number>(
          { length: 1000 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int8_test_0001, array, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(array.length).assertEqual(arrCount)
          expect(array).assertContain(99)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int8array_test_0003
     * @tc.number SUB_INT8ARRAY_TEST_0002
     * @tc.desc   Test Int8array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int8array_test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int8array_test_0003';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int8Array = collections.Int8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int8_test_0002, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('0,0,1,1,2,2,3,3,4,4');
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int8array_test_0004
     * @tc.number SUB_INT8ARRAY_TEST_0003
     * @tc.desc   Test Int8array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int8array_test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int8array_test_0004';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int8Array = collections.Int8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int8_test_0003, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('0,0,1,1,2,2,3,3,4,4');
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int8array_test_0005
     * @tc.number SUB_INT8ARRAY_TEST_0004
     * @tc.desc   Test Int8array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int8array_test_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int8array_test_0005';
        console.info(`${caseName} test start`);
        let array: collections.Int8Array = collections.Int8Array.from<number>(
          { length: 1000 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int8_test_0004, array, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(array.length).assertEqual(arrCount)
          expect(array).assertContain(127)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int8array_test_0006
     * @tc.number SUB_INT8ARRAY_TEST_0005
     * @tc.desc   Test Int8array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int8array_test_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int8array_test_0006';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int8Array = collections.Int8Array.from<number>(
          { length: 1000 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int8_test_0005, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res[0]).assertTrue();
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(array.length).assertEqual(arrCount)
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int8array_test_0007
     * @tc.number SUB_INT8ARRAY_TEST_0006
     * @tc.desc   Test Int8array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int8array_test_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int8array_test_0007';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int8Array = collections.Int8Array.from<number>(
          { length: 50 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int8_test_0006, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res[0].toString()).assertContain('40,42,44,46,48')
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
