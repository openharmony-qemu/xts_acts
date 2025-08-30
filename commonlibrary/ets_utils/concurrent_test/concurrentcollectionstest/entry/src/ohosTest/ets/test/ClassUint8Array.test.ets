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
  test_uint8array_constructor_with_array_buffer,
  test_uint8array_constructor_with_length,
  test_uint8array_constructor_with_iterable,
  test_uint8array_constructor_with_buffer,
  test_uint8array_static_from_array_like,
  test_uint8array_from_fixed_001,
  test_uint8array_static_from_iterable,
  test_uint8array_static_of_numbers,
  test_uint8array_toString,
  test_uint8array_toLocaleString,
  test_uint8array_copyWithin_helper,
  test_uint8array_some_001,
  test_uint8array_every_001,
  test_uint8array_fill_fixed,
  test_uint8array_filter_fixed,
  test_uint8array_find_001,
  test_uint8array_findIndex_001,
  test_uint8array_forEach_001,
  test_uint8array_indexOf_001,
  test_uint8array_lastIndexOf_001,
  test_uint8array_join_001,
  test_uint8array_map_001,
  test_uint8array_reduce_001,
  test_uint8array_reduceRight_001,
  test_uint8array_reduce_with_initial_001,
  test_uint8array_reduceRight_fixed_001,
  test_uint8array_reduce_fixed_001,
  test_uint8array_reverse_001,
  test_uint8array_set_001,
  test_uint8array_slice_001,
  test_uint8array_sort_fixed_001,
  test_uint8array_subarray_fixed_001,
  test_uint8array_at_fixed_001,
  test_uint8array_includes_fixed_001,
  test_uint8array_entries_fixed_001,
  test_uint8array_keys_fixed_001,
  test_uint8array_values_fixed_001,
  test_uint8array_index_access_fixed_001
} from '../testability/pages/Uint8TaskPool';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Uint8ArrayGlobalTest() {
  describe('Uint8ArrayGlobalTest', () => {
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
     * @tc.number    : GLOBAL_TEST_0001
     * @tc.name      : test_uint8array_constructor_length_0
     * @tc.desc      : Test non-concurrent creation of Uint8Array with length 0 (loop 100 times, verify instance non-null and length 0)
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_constructor_length_0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_constructor_length_0';
        console.info(`${caseName} test start`);

        try {
          for (let i = 0; i < 100; i++) {
            console.info(`[${caseName}] Attempt ${i + 1}: Creating Uint8Array with length = 0`);
            let uint8Array: collections.Uint8Array = new collections.Uint8Array(0);
            console.info(`[${caseName}] Attempt ${i + 1}: Uint8Array created, length = ${uint8Array.length}`);
            expect(uint8Array != null).assertTrue();
            expect(uint8Array.length === 0).assertTrue();
          }
          console.info(`${caseName} test end: All 100 uint8Array(0) creations succeeded.`);
        } catch (e) {
          console.error(`${caseName} test failed: ${e}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number    : GLOBAL_TEST_0002
     * @tc.name      : test_uint8array_constructor_with_length
     * @tc.desc      : Test concurrent creation of Uint8Array with specified length (100 tasks via taskpool, length=10, verify constructor functionality)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_constructor_with_length',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint87array_constructor_with_lengths';
        console.info(`${caseName} test start`);

        const concurrentNum = 100;
        const length = 10;

        try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < concurrentNum; i++) {

            group.addTask(
              test_uint8array_constructor_with_length,
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
     * @tc.name      : test_uint8array_constructor_with_array_buffer
     * @tc.desc      : Test concurrent creation of Uint8Array from ArrayBuffer (100 tasks via taskpool, verify buffer-based constructor functionality)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_constructor_with_array_buffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_constructor_with_array_buffer';
        console.info(`${caseName} test start`);

        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < concurrentNum; i++) {

            group.addTask(
              test_uint8array_constructor_with_array_buffer,
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
     * @tc.name      : test_uint8array_constructor_with_iterable_concurrently
     * @tc.desc      : Test concurrent creation of Uint8Array from iterable (100 tasks via taskpool, fixed iterable [1,2,3], verify iterable-based constructor)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_constructor_with_iterable_concurrently',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_constructor_with_iterable';
        const concurrentNum = 100;
        const fixedIterable = [1, 2, 3];

        try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_constructor_with_iterable, fixedIterable, caseName, i);
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
     * @tc.name      : test_uint8array_constructor_with_buffer
     * @tc.desc      : Test concurrent creation of Uint8Array with buffer, offset and length (100 tasks via taskpool, bufferSize=100, offset=10, length=20)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_constructor_with_buffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_constructor_with_buffer';
        const concurrentNum = 100;
        const bufferSize = 100;
        const buffer: collections.ArrayBuffer = new collections.ArrayBuffer(bufferSize);
        const byteOffset = 10;
        const length = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(
              test_uint8array_constructor_with_buffer,
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
     * @tc.name      : test_uint8array_static_from_array_like
     * @tc.desc      : Test concurrent execution of Uint8Array.from() with array-like (100 tasks via taskpool, arrayLike=[i], verify static from() method)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_static_from_array_like',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_static_from_array_like';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const arrayLike = [i];
            group.addTask(
              test_uint8array_static_from_array_like,
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
     * @tc.name      : test_concurrent_uint8array_from_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.from() (100 tasks via taskpool, verify from() method stability under concurrency)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_from_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_from_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_from_fixed_001, caseName, i);
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
     * @tc.name      : test_uint8array_static_from_iterable_concurrently_100_times
     * @tc.desc      : Test concurrent execution of Uint8Array.from() with iterable (100 tasks via taskpool, iterable=[i], verify from() with iterable input)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_static_from_iterable_concurrently_100_times',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_static_from_iterable_concurrently_100_times';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const arrayLike: Iterable<number> = [i];

            group.addTask(
              test_uint8array_static_from_iterable,
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
     * @tc.name      : test_uint8array_static_of_numbers_concurrently_100_times
     * @tc.desc      : Test concurrent execution of Uint8Array.of() with numbers (100 tasks via taskpool, numbers=[i], verify static of() method)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_static_of_numbers_concurrently_100_times',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_static_of_numbers_concurrently_100_times';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const numbers: number[] = [i];

            group.addTask(
              test_uint8array_static_of_numbers,
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
     * @tc.number    : GLOBAL_TEST_0010
     * @tc.name      : test_uint8array_toString_concurrently_100_times
     * @tc.desc      : Test concurrent execution of Uint8Array.toString() (100 tasks via taskpool, verify string conversion matches expected value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_toString_concurrently_100_times',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_toString_concurrently_100_times';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {

            const uint8Array = new collections.Uint8Array([i]);

            const expectedString = `${i}`;

            group.addTask(
              test_uint8array_toString,
              uint8Array,
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
     * @tc.number    : GLOBAL_TEST_0011
     * @tc.name      : test_uint8array_toLocaleString_concurrently_100_times
     * @tc.desc      : Test concurrent execution of Uint8Array.toLocaleString() (100 tasks via taskpool, verify locale string conversion matches expected value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_toLocaleString_concurrently_100_times',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_toLocaleString_concurrently_100_times';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {

            const uint8Array = new collections.Uint8Array([i]);

            const expectedString = `${i}`;

            group.addTask(
              test_uint8array_toLocaleString,
              uint8Array,
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
     * @tc.name      : test_uint8array_copyWithin_function
     * @tc.desc      : Test concurrent execution of Uint8Array.copyWithin() (100 tasks via taskpool, baseArray=[1-8], target=3, start=1, end=3, verify copy result)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8array_copyWithin_function',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8array_copyWithin_function';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const baseArray = [1, 2, 3, 4, 5, 6, 7, 8];
            const uint8Array = new collections.Uint8Array(baseArray);
            const target = 3;
            const start = 1;
            const end = 3;
            const expectedArray = new collections.Uint8Array([1, 2, 3, 2, 3, 6, 7, 8]);

            group.addTask(
              test_uint8array_copyWithin_helper,
              uint8Array,
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
     * @tc.name      : test_concurrent_uint8array_some_001
     * @tc.desc      : Test concurrent execution of Uint8Array.some() (100 tasks via taskpool, array with testValue=-10, verify existence check logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_some_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_some_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 10;
        let testValue = -10;

        try {
          let arrayLike: number[] = [];
          for (let i = 0; i < uint8ArrayCount; i++) {
            arrayLike.push(i * 10);
          }

          arrayLike[0] = testValue;

          let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);

          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_some_001, uint8Array, caseName, i, testValue);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

          console.info(`${caseName} all tasks completed`);

          let hasNegative = uint8Array.some((element: number) => element < 0);
          console.info(`${caseName} Final verification - has negative: ${hasNegative}`);

          let allNumbers = uint8Array.every((element: number) => typeof element === 'number');
          console.info(`${caseName} Final verification - all numbers: ${allNumbers}`);

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : GLOBAL_TEST_0014
     * @tc.name      : test_concurrent_uint8array_every_001
     * @tc.desc      : Test concurrent execution of Uint8Array.every() (100 tasks via taskpool, array with -30, verify all-elements check logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_every_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_every_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 10;

        try {
          let arrayLike: number[] = [];
          for (let i = 0; i < uint8ArrayCount; i++) {
            arrayLike[i] = i * 10;
          }

          arrayLike[2] = -30;

          let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);

          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_every_001, uint8Array, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

          let allPositive = uint8Array.every((element: number) => element > 0);
          console.info(`${caseName} Final check - all positive: ${allPositive}`);
          expect(allPositive).assertEqual(false);

          let allNumbers = uint8Array.every((element: number) => typeof element === 'number');
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
     * @tc.name      : test_concurrent_uint8array_fill_basic_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.fill() (100 tasks via taskpool, verify fill method functionality)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_fill_basic_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_fill_basic_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_fill_fixed, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_filter_basic_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.filter() (100 tasks via taskpool, verify element filtering logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_filter_basic_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_filter_basic_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_filter_fixed, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_find_001
     * @tc.desc      : Test concurrent execution of Uint8Array.find() (100 tasks via taskpool, 20-element array, verify target element finding logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_find_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_find_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_find_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_findIndex_001
     * @tc.desc      : Test concurrent execution of Uint8Array.findIndex() (100 tasks via taskpool, 20-element array, verify target element index finding logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_findIndex_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_findIndex_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_findIndex_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_forEach_001
     * @tc.desc      : Test concurrent execution of Uint8Array.forEach() (100 tasks via taskpool, 20-element array, verify element traversal logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_forEach_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_forEach_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_forEach_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_indexOf_001
     * @tc.desc      : Test concurrent execution of Uint8Array.indexOf() (100 tasks via taskpool, 20-element array, verify first occurrence index finding logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_indexOf_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_indexOf_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_indexOf_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_lastIndexOf_001
     * @tc.desc      : Test concurrent execution of Uint8Array.lastIndexOf() (100 tasks via taskpool, 20-element array, verify last occurrence index finding logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_lastIndexOf_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_lastIndexOf_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_lastIndexOf_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_join_001
     * @tc.desc      : Test concurrent execution of Uint8Array.join() (100 tasks via taskpool, 20-element array, verify element joining into string functionality)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_join_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_join_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_join_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_map_001
     * @tc.desc      : Test concurrent execution of Uint8Array.map() (100 tasks via taskpool, 20-element array, verify element transformation logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_map_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_map_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;
        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_map_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_reduce_001
     * @tc.desc      : Test concurrent execution of Uint8Array.reduce() (100 tasks via taskpool, 20-element array, verify element accumulation logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_reduce_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_reduce_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_reduce_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_reduceRight_001
     * @tc.desc      : Test concurrent execution of Uint8Array.reduceRight() (100 tasks via taskpool, 20-element array, verify right-to-left element accumulation logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_iunt32array_reduceRight_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_reduceRight_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_reduceRight_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_reduce_with_initial_001
     * @tc.desc      : Test concurrent execution of Uint8Array.reduce() with initial value (100 tasks via taskpool, 20-element array, verify accumulation with initial value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_reduce_with_initial_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_reduce_with_initial_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_reduce_with_initial_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_reduceRight_with_initial_001
     * @tc.desc      : Test concurrent execution of Uint8Array.reduceRight() with initial value (100 tasks via taskpool, 20-element array, verify right-to-left accumulation with initial value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_reduceRight_with_initial_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_reduceRight_with_initial_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_reduceRight_fixed_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_reduce_with_initial_string_001
     * @tc.desc      : Test concurrent execution of Uint8Array.reduce() with string initial value (100 tasks via taskpool, 20-element array, verify accumulation into string)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_reduce_with_initial_string_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_reduce_with_initial_string_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_reduce_fixed_001, caseName, i, uint8ArrayCount);
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
     * @tc.name      : test_concurrent_uint8array_reverse_001
     * @tc.desc      : Test concurrent execution of Uint8Array.reverse() (100 tasks via taskpool, verify array element reversal functionality)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_reverse_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_reverse_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_reverse_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_set_001
     * @tc.desc      : Test concurrent execution of Uint8Array.set() (100 tasks via taskpool, verify setting values from another array into Uint8Array)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_set_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_set_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_set_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_slice_001
     * @tc.desc      : Test concurrent execution of Uint8Array.slice() (100 tasks via taskpool, verify creating subarray slice functionality)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_slice_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_slice_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_slice_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_sort_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.sort() (100 tasks via taskpool, verify array element sorting logic)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_sort_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_sort_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_sort_fixed_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_subarray_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.subarray() (100 tasks via taskpool, verify creating subarray view functionality)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_subarray_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_subarray_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_subarray_fixed_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_at_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.at() (100 tasks via taskpool, verify accessing element by index (supports negative index))
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_at_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_at_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_at_fixed_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_includes_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.includes() (100 tasks via taskpool, verify checking if element exists in array)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_includes_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_includes_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_includes_fixed_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_entries_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.entries() (100 tasks via taskpool, verify getting index-element pair iterator)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_entries_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_entries_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_entries_fixed_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_keys_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.keys() (100 tasks via taskpool, verify getting index iterator)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_keys_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_keys_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100; // 并发任务数，可以根据需要调整

        try {
          let group = new taskpool.TaskGroup(caseName);

          // 为每个并发任务添加独立的测试任务
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_keys_fixed_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_values_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8Array.values() (100 tasks via taskpool, verify getting element iterator)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_values_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_values_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_values_fixed_001, caseName, i);
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
     * @tc.name      : test_concurrent_uint8array_index_access_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent index access of Uint8Array (100 tasks via taskpool, verify reading/writing elements by index)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8array_index_access_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8array_index_access_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8array_index_access_fixed_001, caseName, i);
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