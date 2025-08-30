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
  test_Float32array_constructor_with_array_buffer,
  test_float32array_constructor_with_length,
  test_Float32array_constructor_with_iterable,
  test_Float32array_constructor_with_buffer,
  test_Float32array_static_from_array_like,
  test_Float32array_from_fixed_001,
  test_Float32array_static_from_iterable,
  test_Float32array_static_of_numbers,
  test_Float32array_toString,
  test_Float32array_toLocaleString,
  test_Float32array_copyWithin_helper,
  test_Float32array_some_001,
  test_Float32array_every_001,
  test_Float32array_fill_fixed,
  test_Float32array_filter_fixed,
  test_Float32array_find_001,
  test_Float32array_findIndex_001,
  test_Float32array_forEach_001,
  test_Float32array_indexOf_001,
  test_Float32array_lastIndexOf_001,
  test_Float32array_join_001,
  test_Float32array_map_001,
  test_Float32array_reduce_001,
  test_Float32array_reduceRight_001,
  test_Float32array_reduce_with_initial_001,
  test_Float32array_reduceRight_fixed_001,
  test_Float32array_reduce_fixed_001,
  test_Float32array_reverse_001,
  test_Float32array_set_001,
  test_Float32array_slice_001,
  test_Float32array_sort_fixed_001,
  test_Float32array_subarray_fixed_001,
  test_Float32array_at_fixed_001,
  test_Float32array_includes_fixed_001,
  test_Float32array_entries_fixed_001,
  test_Float32array_keys_fixed_001,
  test_Float32array_values_fixed_001,
  test_Float32array_index_access_fixed_001
} from '../testability/pages/Float32TaskPool';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Float32ArrayGlobalTest() {
  describe('Float32ArrayGlobalTest', () => {
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
     * @tc.number    : SUB_FLOAT32ARRAY_TEST_0001
     * @tc.name      : test_Float32array_constructor_length_0
     * @tc.desc      : Test concurrent creation of Float32Array with specified length using constructor via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_constructor_length_0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_constructor_length_0';
        console.info(`${caseName} test start`);

        try {
          for (let i = 0; i < 100; i++) {
            console.info(`[${caseName}] Attempt ${i + 1}: Creating Float32Array with length = 0`);
            let Float32Array: collections.Float32Array = new collections.Float32Array(0);
            console.info(`[${caseName}] Attempt ${i + 1}: Float32Array created, length = ${Float32Array.length}`);
            expect(Float32Array != null).assertTrue();
            expect(Float32Array.length === 0).assertTrue();
          }
          console.info(`${caseName} test end: All 100 Float32Array(0) creations succeeded.`);
        } catch (e) {
          console.error(`${caseName} test failed: ${e}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0002
     * @tc.name      : test_Float32array_constructor_length
     * @tc.desc      : Test sequential creation of Float32Array with length (100 iterations, verifies instance validity and length consistency)
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_constructor_with_length',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_constructor_with_lengths';
        console.info(`${caseName} test start`);

        const concurrentNum = 100;
        const length = 10;

        try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < concurrentNum; i++) {

            group.addTask(
              test_float32array_constructor_with_length,
              length,
              caseName,
              i
            );
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName} All tasks completed.`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} TaskGroup execution failed: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} Test setup failed: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0003
     * @tc.name      : test_Float32array_constructor_with_array_buffer
     * @tc.desc      : Test concurrent creation of Float32Array using ArrayBuffer as input (100 tasks via taskpool)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_constructor_with_array_buffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_constructor_with_array_buffer';
        console.info(`${caseName} test start`);

        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < concurrentNum; i++) {

            group.addTask(
              test_Float32array_constructor_with_array_buffer,
              caseName,
              i
            );
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName} All tasks completed.`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} TaskGroup execution failed: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} Test setup failed: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0004
     * @tc.name      : test_Float32array_constructor_with_iterable
     * @tc.desc      : Test concurrent creation of Float32Array using iterable input (100 tasks via taskpool, fixed iterable [1,2,3])
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_constructor_with_iterable_concurrently',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_constructor_with_iterable';
        const concurrentNum = 100;
        const fixedIterable = [1, 2, 3];

        try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_constructor_with_iterable, fixedIterable, caseName, i);
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName} completed.`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} error: ${e.message}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} setup error: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0005
     * @tc.name      : test_Float32array_constructor_with_buffer
     * @tc.desc      : Test concurrent creation of Float32Array with specified ArrayBuffer, byteOffset and length (100 tasks via taskpool, buffer size=100, offset=10, length=20)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_constructor_with_buffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_constructor_with_buffer';
        const concurrentNum = 100;
        const bufferSize = 100;
        const buffer: collections.ArrayBuffer = new collections.ArrayBuffer(bufferSize);
        const byteOffset = 10;
        const length = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(
              test_Float32array_constructor_with_buffer,
              buffer,
              byteOffset,
              length,
              caseName,
              i
            );
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName} completed. All tasks finished.`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} error: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} setup error: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0006
     * @tc.name      : test_Float32array_static_from_array_like
     * @tc.desc      : Test concurrent execution of Float32Array.from() with ArrayLike input (100 tasks via taskpool, ArrayLike data varies by task)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_static_from_array_like',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_static_from_array_like';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const arrayLike = [i];
            group.addTask(
              test_Float32array_static_from_array_like,
              arrayLike,
              caseName,
              i
            );
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName} All tasks completed successfully.`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} Task execution failed: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} Test setup failed: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0007
     * @tc.name      : test_concurrent_Float32array_from_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.from() method (100 tasks via taskpool)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_from_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_from_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_from_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0008
     * @tc.name      : test_Float32array_static_from_iterable
     * @tc.desc      : Test concurrent execution of Float32Array.from() with iterable input (100 tasks via taskpool, iterable data varies by task)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_static_from_iterable_concurrently_100_times',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_static_from_iterable_concurrently_100_times';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const arrayLike: Iterable<number> = [i];

            group.addTask(
              test_Float32array_static_from_iterable,
              arrayLike,
              caseName,
              i
            );
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName}  .`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} Task execution failed: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} Test setup failed: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0009
     * @tc.name      : test_Float32array_static_of_numbers
     * @tc.desc      : Test concurrent execution of Float32Array.of() with numeric input (100 tasks via taskpool, numeric data varies by task)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_static_of_numbers_concurrently_100_times',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_static_of_numbers_concurrently_100_times';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const numbers: number[] = [i];

            group.addTask(
              test_Float32array_static_of_numbers,
              numbers,
              caseName,
              i
            );
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName} All 100 tasks completed successfully.`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} Task execution failed: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} Test setup failed: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0010(这个用例存在cpp.crash的问题，待排查)
     * @tc.name      : test_Float32array_toString
     * @tc.desc      : Test concurrent execution of Float32Array.toString() method (100 tasks via taskpool, verifies string output consistency)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    // it('test_Float32array_toString_concurrently_100_times',
    //   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     const caseName = 'test_Float32array_toString_concurrently_100_times';
    //     const concurrentNum = 100;
    //
    //     try {
    //       let group = new taskpool.TaskGroup(caseName);
    //
    //       for (let i = 0; i < concurrentNum; i++) {
    //
    //         const Float32Array = new collections.Float32Array([i]);
    //
    //         const expectedString = `${i}`;
    //
    //         group.addTask(
    //           test_Float32array_toString,
    //           Float32Array,
    //           expectedString,
    //           caseName,
    //           i
    //         );
    //       }
    //
    //       await taskpool.execute(group)
    //         .then(() => {
    //           console.info(`${caseName} All 100 tasks completed successfully.`);
    //         })
    //         .catch((e: BusinessError) => {
    //           console.error(`${caseName} Task execution failed: ${e.message}, code: ${e.code}`);
    //           expect().assertFail();
    //         });
    //
    //       console.info(`${caseName} test end`);
    //     } catch (e) {
    //       console.error(`${caseName} Test setup failed: ${e}`);
    //       expect().assertFail();
    //     }
    //
    //     done();
    //   });

    /**
     * @tc.number    : GLOBAL_TEST_0011
     * @tc.name      : test_Float32array_toLocaleString
     * @tc.desc      : Test concurrent execution of Float32Array.toLocaleString() method (100 tasks via taskpool, verifies localized string output consistency)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_toLocaleString_concurrently_100_times',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_toLocaleString_concurrently_100_times';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {

            const Float32Array = new collections.Float32Array([i]);

            const expectedString = `${i}`;

            group.addTask(
              test_Float32array_toLocaleString,
              Float32Array,
              expectedString,
              caseName,
              i
            );
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName} All 100 tasks completed successfully.`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} Task execution failed: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} Test setup failed: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0012
     * @tc.name      : test_Float32array_copyWithin_function
     * @tc.desc      : Test concurrent execution of Float32Array.copyWithin() method (100 tasks via taskpool, fixed source/target range, verifies array data consistency)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_Float32array_copyWithin_function',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_Float32array_copyWithin_function';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const baseArray = [1, 2, 3, 4, 5, 6, 7, 8];
            const Float32Array = new collections.Float32Array(baseArray);
            const target = 3;
            const start = 1;
            const end = 3;
            const expectedArray = new collections.Float32Array([1, 2, 3, 2, 3, 6, 7, 8]);

            group.addTask(
              test_Float32array_copyWithin_helper,
              Float32Array,
              target,
              start,
              end,
              expectedArray,
              caseName,
              i
            );
          }

          await taskpool.execute(group)
            .then(() => {
              console.info(`${caseName} All ${concurrentNum} tasks completed successfully.`);
            })
            .catch((e: BusinessError) => {
              console.error(`${caseName} Task execution failed: ${e.message}, code: ${e.code}`);
              expect().assertFail();
            });

          console.info(`${caseName} test end`);
        } catch (e) {
          console.error(`${caseName} Test setup failed: ${e}`);
          expect().assertFail();
        }

        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0013
     * @tc.name      : test_concurrent_Float32array_some_001
     * @tc.desc      : Test concurrent execution of Float32Array.some() method (100 tasks via taskpool, 10-element array, verifies existence of target value (-10))
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_some_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_some_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 10;
        let testValue = -10;

        try {
          let arrayLike: number[] = [];
          for (let i = 0; i < Float32ArrayCount; i++) {
            arrayLike.push(i * 10);
          }

          arrayLike[0] = testValue;

          let Float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);

          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_some_001, Float32Array, caseName, i, testValue);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

          console.info(`${caseName} all tasks completed`);

          let hasNegative = Float32Array.some((element: number) => element < 0);
          console.info(`${caseName} Final verification - has negative: ${hasNegative}`);
          expect(hasNegative).assertEqual(true);

          let allNumbers = Float32Array.every((element: number) => typeof element === 'number');
          console.info(`${caseName} Final verification - all numbers: ${allNumbers}`);
          expect(allNumbers).assertEqual(true);

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : GLOBAL_TEST_0014
     * @tc.name      : test_concurrent_Float32array_every_001
     * @tc.desc      : Test concurrent execution of Float32Array.every() method (100 tasks via taskpool, 10-element array, verifies all elements meet positive condition)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_every_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_every_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 10;

        try {
          let arrayLike: number[] = [];
          for (let i = 0; i < Float32ArrayCount; i++) {
            arrayLike[i] = i * 10;
          }

          arrayLike[2] = -30;

          let Float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);

          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_every_001, Float32Array, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

          let allPositive = Float32Array.every((element: number) => element > 0);
          console.info(`${caseName} Final check - all positive: ${allPositive}`);
          expect(allPositive).assertEqual(false);

          let allNumbers = Float32Array.every((element: number) => typeof element === 'number');
          console.info(`${caseName} Final check - all numbers: ${allNumbers}`);
          expect(allNumbers).assertEqual(true);

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0015
     * @tc.name      : test_concurrent_Float32array_fill_basic_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.fill() method (100 tasks via taskpool)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_fill_basic_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_fill_basic_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_fill_fixed, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0016
     * @tc.name      : test_concurrent_Float32array_filter_basic_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.filter() method (100 tasks via taskpool)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_filter_basic_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_filter_basic_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_filter_fixed, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0017
     * @tc.name      : test_concurrent_Float32array_find_001
     * @tc.desc      : Test concurrent execution of Float32Array.find() method (100 tasks via taskpool, 20-element array, verifies target element lookup)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_find_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_find_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_find_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0018
     * @tc.name      : test_concurrent_Float32array_findIndex_001
     * @tc.desc      : Test concurrent execution of Float32Array.findIndex() method (100 tasks via taskpool, 20-element array, verifies target element index lookup)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_findIndex_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_findIndex_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_findIndex_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0019
     * @tc.name      : test_concurrent_Float32array_forEach_001
     * @tc.desc      : Test concurrent execution of Float32Array.forEach() method (100 tasks via taskpool, 20-element array, verifies element traversal logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_forEach_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_forEach_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_forEach_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0020
     * @tc.name      : test_concurrent_Float32array_indexOf_001
     * @tc.desc      : Test concurrent execution of Float32Array.indexOf() method (100 tasks via taskpool, 20-element array, verifies target element index search)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_indexOf_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_indexOf_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_indexOf_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0021
     * @tc.name      : test_concurrent_Float32array_lastIndexOf_001
     * @tc.desc      : Test concurrent execution of Float32Array.lastIndexOf() method (100 tasks via taskpool, 20-element array, verifies last occurrence index of target value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_lastIndexOf_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_lastIndexOf_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_lastIndexOf_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0022
     * @tc.name      : test_concurrent_Float32array_join_001
     * @tc.desc      : Test concurrent execution of Float32Array.join() method (100 tasks via taskpool, 20-element array, verifies array element concatenation into string)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_join_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_join_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_join_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0023
     * @tc.name      : test_concurrent_Float32array_map_001
     * @tc.desc      : Test concurrent execution of Float32Array.map() method (100 tasks via taskpool, 20-element array, verifies element transformation and new array generation)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_map_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_map_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;
        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_map_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0024
     * @tc.name      : test_concurrent_Float32array_reduce_001
     * @tc.desc      : Test concurrent execution of Float32Array.reduce() method (100 tasks via taskpool, 20-element array, verifies sequential element accumulation logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_reduce_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_reduce_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_reduce_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0025
     * @tc.name      : test_concurrent_Float32array_reduceRight_001
     * @tc.desc      : Test concurrent execution of Float32Array.reduceRight() method (100 tasks via taskpool, 20-element array, verifies reverse-order element accumulation logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_reduceRight_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_reduceRight_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_reduceRight_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0026
     * @tc.name      : test_concurrent_Float32array_reduce_with_initial_001
     * @tc.desc      : Test concurrent execution of Float32Array.reduce() with initial value (100 tasks via taskpool, 20-element array, verifies accumulation with initial value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_reduce_with_initial_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_reduce_with_initial_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_reduce_with_initial_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0027
     * @tc.name      : test_Float32Array_from_arraybuffer
     * @tc.desc      : Test creating Float32Array from ArrayBuffer
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_reduceRight_with_initial_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_reduceRight_with_initial_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_reduceRight_fixed_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0028
     * @tc.name      : test_concurrent_Float32array_reduce_with_initial_string_001
     * @tc.desc      : Test concurrent execution of Float32Array.reduce() with string initial value (100 tasks via taskpool, 20-element array, verifies string-type accumulation)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_reduce_with_initial_string_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_reduce_with_initial_string_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let Float32ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_reduce_fixed_001, caseName, i, Float32ArrayCount);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0029
     * @tc.name      : test_concurrent_Float32array_reverse_001
     * @tc.desc      : Test concurrent execution of Float32Array.reverse() method (100 tasks via taskpool, verifies array element order reversal)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_reverse_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_reverse_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_reverse_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0030
     * @tc.name      : test_concurrent_Float32array_set_001
     * @tc.desc      : Test concurrent execution of Float32Array.set() method (100 tasks via taskpool, verifies data copying from source array to target array)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_set_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_set_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_set_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0031
     * @tc.name      : test_concurrent_Float32array_slice_001
     * @tc.desc      : Test concurrent execution of Float32Array.slice() method (100 tasks via taskpool, verifies creation of subarray slice without modifying original array)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_slice_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_slice_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_slice_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0032
     * @tc.name      : test_concurrent_Float32array_sort_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.sort() method (100 tasks via taskpool, verifies array element sorting logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_sort_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_sort_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_sort_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0033
     * @tc.name      : test_concurrent_Float32array_subarray_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.subarray() method (100 tasks via taskpool, verifies creation of subarray view referencing original buffer)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_subarray_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_subarray_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_subarray_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0034
     * @tc.name      : test_concurrent_Float32array_at_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.at() method (100 tasks via taskpool, verifies element access by index (supports negative indices))
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_at_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_at_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_at_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0035
     * @tc.name      : test_concurrent_Float32array_includes_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.includes() method (100 tasks via taskpool, verifies existence of target value in array)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_includes_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_includes_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_includes_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0036
     * @tc.name      : test_concurrent_Float32array_entries_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.entries() method (100 tasks via taskpool, verifies iteration of index-value pairs)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_entries_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_entries_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_entries_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0037
     * @tc.name      : test_concurrent_Float32array_keys_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.keys() method (100 tasks via taskpool, verifies iteration of array indices)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_keys_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_keys_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100; // 并发任务数，可以根据需要调整

        try {
          let group = new taskpool.TaskGroup(caseName);

          // 为每个并发任务添加独立的测试任务
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_keys_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail(); // 标记整体测试失败
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail(); // 标记整体测试失败
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0038
     * @tc.name      : test_concurrent_Float32array_values_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Float32Array.values() method (100 tasks via taskpool, verifies iteration of array values)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_values_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_values_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_values_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0039
     * @tc.name      : test_concurrent_Float32array_index_access_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent index access for Float32Array (100 tasks via taskpool, verifies read/write operations via array indices)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_Float32array_index_access_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_Float32array_index_access_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_Float32array_index_access_fixed_001, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

  })
}