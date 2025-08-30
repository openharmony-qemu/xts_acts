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
  test_uint8clampedarray_constructor_with_array_buffer,
  test_uint8clampedarray_constructor_with_length,
  test_uint8clampedarray_constructor_with_iterable,
  test_uint8ClampedArray_constructor_with_buffer,
  test_uint8Clampedarray_static_from_array_like,
  test_uint8ClampedArray_from_fixed_001,
  test_uint8Clampedarray_static_from_iterable,
  test_uint8ClampedArray_static_of_numbers,
  test_uint8ClampedArray_toString,
  test_uint8ClampedArray_toLocaleString,
  test_uint8ClampedArray_copyWithin_helper,
  test_uint8ClampedArray_some_001,
  test_uint8ClampedArray_every_001,
  test_uint8ClampedArray_fill_fixed,
  test_uint8ClampedArray_filter_fixed,
  test_uint8ClampedArray_find_001,
  test_uint8ClampedArray_findIndex_001,
  test_uint8Clampedarray_forEach_001,
  test_uint8ClampedArray_indexOf_001,
  test_uint8Clampedarray_lastIndexOf_001,
  test_uint8Clampedarray_join_001,
  test_uint8ClampedArray_map_001,
  test_uint8ClampedArray_reduce_001,
  test_uint8ClampedArray_reduceRight_001,
  test_uint8ClampedArray_reduce_with_initial_001,
  test_uint8Clampedarray_reduceRight_fixed_001,
  test_uint8ClampedArray_reduce_fixed_001,
  test_uint8ClampedArray_reverse_001,
  test_uint8ClampedArray_set_001,
  test_uint8ClampedArray_slice_001,
  test_uint8ClampedArray_sort_fixed_001,
  test_uint8ClampedArray_subarray_fixed_001,
  test_uint8ClampedArray_at_fixed_001,
  test_uint8ClampedArray_includes_fixed_001,
  test_uint8ClampedArray_entries_fixed_001,
  test_uint8ClampedArray_keys_fixed_001,
  test_uint8ClampedArray_values_fixed_001,
  test_uint8ClampedArray_index_access_fixed_001
} from '../testability/pages/Uint8ClampedTaskPool';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Uint8ClampedArrayGlobalTest() {
  describe('Uint8ClampedArrayGlobalTest', () => {
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0001
     * @tc.name      : test_uint8ClampedArray_constructor_length_0
     * @tc.desc      : Test concurrent creation of Uint8clampedArray with specified length (0) using constructor via taskpool
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_constructor_length_0', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_constructor_length_0';
        console.info(`${caseName} test start`);

        try {
          for (let i = 0; i < 100; i++) {
            console.info(`[${caseName}] Attempt ${i + 1}: Creating Uint8ClampedArray with length = 0`);
            let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(0);
            console.info(`[${caseName}] Attempt ${i + 1}: Uint8ClampedArray created, length = ${uint8ClampedArray.length}`);
            expect(uint8ClampedArray != null).assertTrue();
            expect(uint8ClampedArray.length === 0).assertTrue();
          }
          console.info(`${caseName} test end: All 100 uint8ClampedArray(0) creations succeeded.`);
        } catch (e) {
          console.error(`${caseName} test failed: ${e}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0002
     * @tc.name      : test_uint8ClampedArray_constructor_with_length
     * @tc.desc      : Test concurrent creation of Uint8ClampedArray with specified length using constructor via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_constructor_with_length',
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
              test_uint8clampedarray_constructor_with_length,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0003
     * @tc.name      : test_uint8ClampedArray_constructor_with_array_buffer
     * @tc.desc      : Test concurrent creation of Uint8ClampedArray using ArrayBuffer input via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_constructor_with_array_buffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_constructor_with_array_buffer';
        console.info(`${caseName} test start`);

        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < concurrentNum; i++) {

            group.addTask(
              test_uint8clampedarray_constructor_with_array_buffer,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0004
     * @tc.name      : test_uint8ClampedArray_constructor_with_iterable
     * @tc.desc      : Test concurrent creation of Uint8ClampedArray using Iterable input via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_constructor_with_iterable',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_constructor_with_iterable';
        const concurrentNum = 100;
        const fixedIterable = [1, 2, 3];

        try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8clampedarray_constructor_with_iterable, fixedIterable, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0005
     * @tc.name      : test_uint8ClampedArray_constructor_with_buffer
     * @tc.desc      : Test concurrent creation of Uint8ClampedArray with specified ArrayBuffer, byteOffset and length via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_constructor_with_buffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_constructor_with_buffer';
        const concurrentNum = 100;
        const bufferSize = 100;
        const buffer: collections.ArrayBuffer = new collections.ArrayBuffer(bufferSize);
        const byteOffset = 10;
        const length = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(
              test_uint8ClampedArray_constructor_with_buffer,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0006
     * @tc.name      : test_uint8ClampedArray_static_from_array_like
     * @tc.desc      : Test concurrent creation of Uint8ClampedArray via static from() method with ArrayLike input via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_static_from_array_like',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_static_from_array_like';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const arrayLike = [i];
            group.addTask(
              test_uint8Clampedarray_static_from_array_like,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0007
     * @tc.name      : test_concurrent_uint8ClampedArray_from_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent creation of Uint8ClampedArray via from() method via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_from_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_from_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_from_fixed_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0008
     * @tc.name      : test_uint8ClampedArray_static_from_iterable
     * @tc.desc      : Test concurrent creation of Uint8ClampedArray via static from() method with Iterable input via taskpool (100 times)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_static_from_iterable',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_static_from_iterable';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const arrayLike: Iterable<number> = [i];

            group.addTask(
              test_uint8Clampedarray_static_from_iterable,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0009
     * @tc.name      : test_uint8ClampedArray_static_of_numbers_100
     * @tc.desc      : Test concurrent creation of Uint8ClampedArray via static of() method with number inputs via taskpool (100 times)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_static_of_numbers_100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_static_of_numbers_100';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const numbers: number[] = [i];

            group.addTask(
              test_uint8ClampedArray_static_of_numbers,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0010
     * @tc.name      : test_uint8ClampedArray_toString_concurrently
     * @tc.desc      : Test concurrent execution of Uint8ClampedArray.toString() method via taskpool (100 times)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_toString_concurrently',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_toString_concurrently';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {

            const uint8ClampedArray = new collections.Uint8ClampedArray([i]);

            const expectedString = `${i}`;

            group.addTask(
              test_uint8ClampedArray_toString,
              uint8ClampedArray,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0011
     * @tc.name      : test_uint8ClampedArray_toLocaleString_concurrently
     * @tc.desc      : Test concurrent execution of Uint8ClampedArray.toLocaleString() method via taskpool (100 times)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_toLocaleString_concurrently',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_toLocaleString_concurrently';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {

            const uint8ClampedArray = new collections.Uint8ClampedArray([i]);

            const expectedString = `${i}`;

            group.addTask(
              test_uint8ClampedArray_toLocaleString,
              uint8ClampedArray,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0012
     * @tc.name      : test_uint8ClampedArray_copyWithin_function
     * @tc.desc      : Test concurrent execution of Uint8ClampedArray.copyWithin() method via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_uint8ClampedArray_copyWithin_function',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_uint8ClampedArray_copyWithin_function';
        const concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            const baseArray = [1, 2, 3, 4, 5, 6, 7, 8];
            const uint8ClampedArray = new collections.Uint8ClampedArray(baseArray);
            const target = 3;
            const start = 1;
            const end = 3;
            const expectedArray = new collections.Uint8ClampedArray([1, 2, 3, 2, 3, 6, 7, 8]);

            group.addTask(
              test_uint8ClampedArray_copyWithin_helper,
              uint8ClampedArray,
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0013
     * @tc.name      : test_concurrent_uint8ClampedArray_some_001
     * @tc.desc      : Test the some() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_some_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_some_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 10;
        let testValue = -10;

        try {
          let arrayLike: number[] = [];
          for (let i = 0; i < uint8ClampedArrayCount; i++) {
            arrayLike.push(i * 10);
          }

          arrayLike[0] = testValue;

          let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);

          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_some_001, uint8ClampedArray, caseName, i, testValue);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

          console.info(`${caseName} all tasks completed`);

          let hasNegative = uint8ClampedArray.some((element: number) => element < 0);
          console.info(`${caseName} Final verification - has negative: ${hasNegative}`);

          let allNumbers = uint8ClampedArray.every((element: number) => typeof element === 'number');
          console.info(`${caseName} Final verification - all numbers: ${allNumbers}`);

        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0014
     * @tc.name      : test_concurrent_uint8ClampedArray_every_001
     * @tc.desc      : Test the every() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_every_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_every_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 10;

        try {
          let arrayLike: number[] = [];
          for (let i = 0; i < uint8ClampedArrayCount; i++) {
            arrayLike[i] = i * 10;
          }

          arrayLike[2] = -30;

          let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);

          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_every_001, uint8ClampedArray, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

          let allPositive = uint8ClampedArray.every((element: number) => element > 0);
          console.info(`${caseName} Final check - all positive: ${allPositive}`);
          expect(allPositive).assertEqual(false);

          let allNumbers = uint8ClampedArray.every((element: number) => typeof element === 'number');
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0015
     * @tc.name      : test_concurrent_uint8ClampedArray_fill_basic_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8ClampedArray.fill() basic method via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_fill_basic_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_fill_basic_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_fill_fixed, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0016
     * @tc.name      : test_concurrent_uint8ClampedArray_filter_basic_fixed_001
     * @tc.desc      : Test fixed-scenario concurrent execution of Uint8ClampedArray.filter() basic method via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_filter_basic_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_filter_basic_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_filter_fixed, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0017
     * @tc.name      : test_concurrent_uint8ClampedArray_find_001
     * @tc.desc      : Test the find() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_find_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_find_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_find_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0018
     * @tc.name      : test_concurrent_uint8ClampedArray_findIndex_001
     * @tc.desc      : Test the findIndex() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_findIndex_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_findIndex_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_findIndex_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0019
     * @tc.name      : test_concurrent_uint8ClampedArray_forEach_001
     * @tc.desc      : Test the forEach() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_forEach_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_forEach_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Clampedarray_forEach_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0020
     * @tc.name      : test_concurrent_uint8ClampedArray_indexOf_001
     * @tc.desc      : Test the indexOf() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_indexOf_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_indexOf_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_indexOf_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0021
     * @tc.name      : test_concurrent_uint8ClampedArray_lastIndexOf_001
     * @tc.desc      : Test the lastIndexOf() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_lastIndexOf_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_lastIndexOf_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Clampedarray_lastIndexOf_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0022
     * @tc.name      : test_concurrent_uint8ClampedArray_join_001
     * @tc.desc      : Test the join() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_join_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_join_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Clampedarray_join_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0023
     * @tc.name      : test_concurrent_uint8ClampedArray_map_001
     * @tc.desc      : Test the map() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_map_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_map_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;
        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_map_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0024
     * @tc.name      : test_concurrent_uint8ClampedArray_reduce_001
     * @tc.desc      : Test the reduce() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_reduce_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_reduce_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_reduce_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0025
     * @tc.name      : test_concurrent_uint8ClampedArray_reduceRight_001
     * @tc.desc      : Test the reduceRight() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_reduceRight_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_reduceRight_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_reduceRight_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0026
     * @tc.name      : test_concurrent_uint8ClampedArray_reduce_with_initial_001
     * @tc.desc      : Test the reduce() method of Uint8ClampedArray with initial value under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_reduce_with_initial_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_reduce_with_initial_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_reduce_with_initial_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0027
     * @tc.name      : test_concurrent_uint8ClampedArray_reduceRight_with_initial_001
     * @tc.desc      : Test the reduceRight() method of Uint8ClampedArray with initial value under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_reduceRight_with_initial_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_reduceRight_with_initial_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Clampedarray_reduceRight_fixed_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0028
     * @tc.name      : test_concurrent_uint8ClampedArray_reduce_with_initial_string_001
     * @tc.desc      : Test the reduce() method of Uint8ClampedArray with string initial value under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_reduce_with_initial_string_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_reduce_with_initial_string_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;
        let uint8ClampedArrayCount = 20;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_reduce_fixed_001, caseName, i, uint8ClampedArrayCount);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0029
     * @tc.name      : test_concurrent_uint8ClampedArray_reverse_001
     * @tc.desc      : Test the reverse() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_reverse_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_reverse_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_reverse_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0030
     * @tc.name      : test_concurrent_uint8ClampedArray_set_001
     * @tc.desc      : Test the set() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_set_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_set_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_set_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0031
     * @tc.name      : test_concurrent_uint8ClampedArray_slice_001
     * @tc.desc      : Test the slice() method of Uint8ClampedArray under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_slice_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_slice_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_slice_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0032
     * @tc.name      : test_concurrent_uint8ClampedArray_sort_fixed_001
     * @tc.desc      : Test the sort() method of Uint8ClampedArray (fixed scenario) under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_sort_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_sort_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_sort_fixed_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0033
     * @tc.name      : test_concurrent_uint8ClampedArray_subarray_fixed_001
     * @tc.desc      : Test the subarray() method of Uint8ClampedArray (fixed scenario) under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_subarray_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_subarray_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_subarray_fixed_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0034
     * @tc.name      : test_concurrent_uint8ClampedArray_at_fixed_001
     * @tc.desc      : Test the at() method of Uint8ClampedArray (fixed scenario) under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_at_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_at_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_at_fixed_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0035
     * @tc.name      : test_concurrent_uint8ClampedArray_includes_fixed_001
     * @tc.desc      : Test the includes() method of Uint8ClampedArray (fixed scenario) under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_includes_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_includes_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_includes_fixed_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0036
     * @tc.name      : test_concurrent_uint8ClampedArray_entries_fixed_001
     * @tc.desc      : Test the entries() method of Uint8ClampedArray (fixed scenario) under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_entries_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_entries_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_entries_fixed_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0037
     * @tc.name      : test_concurrent_uint8ClampedArray_keys_fixed_001
     * @tc.desc      : Test the keys() method of Uint8ClampedArray (fixed scenario) under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_keys_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_keys_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100; // 并发任务数，可以根据需要调整

        try {
          let group = new taskpool.TaskGroup(caseName);

          // 为每个并发任务添加独立的测试任务
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_keys_fixed_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0038
     * @tc.name      : test_concurrent_uint8ClampedArray_values_fixed_001
     * @tc.desc      : Test the values() method of Uint8ClampedArray (fixed scenario) under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_values_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_values_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_values_fixed_001, caseName, i);
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
     * @tc.number    : SUB_UINT8CLAPEDARRAY_TEST_0039
     * @tc.name      : test_concurrent_uint8ClampedArray_index_access_fixed_001
     * @tc.desc      : Test index access operation of Uint8ClampedArray (fixed scenario) under concurrent conditions via taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_concurrent_uint8ClampedArray_index_access_fixed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_uint8ClampedArray_index_access_fixed_001';
        console.info(`${caseName} test start`);

        let concurrentNum = 100;

        try {
          let group = new taskpool.TaskGroup(caseName);

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8ClampedArray_index_access_fixed_001, caseName, i);
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