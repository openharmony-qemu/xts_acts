import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import type { BusinessError } from '@ohos.base';
import {
  test_bitvector_constructor_001_task,
  test_bitvector_flipBitByIndex_001_task,
  test_bitvector_flipBitsByRange_001_task,
  test_bitvector_getBitCountByRange_001_task,
  test_bitvector_getIndexOf_001_task,
  test_bitvector_getLastIndexOf_001_task,
  test_bitvector_has_001_task,
  test_bitvector_index_accessor_001_task,
  test_bitvector_pop_001_task,
  test_bitvector_push_001_task,
  test_bitvector_range,
  test_bitvector_resize_001_task,
  test_bitvector_setAllBits_001_task,
  test_bitvector_setBitsByRange_001_task,
  test_bitvector_values_001_task,
} from '../testability/pages/BitVectorTaskPool';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function BitVectorGlobalTest() {
  describe('BitVectorGlobalTest', () => {
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
     * @tc.number    : GLOBAL_TEST_0010
     * @tc.name      : test_concurrent_collections_bitvector_constructor_001
     * @tc.desc      : Test BitVector constructor with fixed zero length and other lengths
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_constructor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_constructor';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)
          let concurrentNum = 100;
          const fixedLength = 0;

          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_constructor_001_task, fixedLength, caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0020
     * @tc.name      : test_bitvector_push
     * @tc.desc      : Test BitVector push method with fixed elements [0, 1, 0, 1, 0]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_push', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_push';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_push_001_task, fixedLength, fixedElements, caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0030
     * @tc.name      : test_bitvector_pop
     * @tc.desc      : Test BitVector pop method with fixed elements [0, 1, 0, 1, 0]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_pop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_pop';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0; // 初始长度为0
          const fixedElements = [0, 1, 0, 1, 0]; // 固定push的元素序列

          for (let i = 0; i < 100; i++) { // 只运行一个任务，避免并发
            group.addTask(test_bitvector_pop_001_task, fixedLength, fixedElements, caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0040
     * @tc.name      : test_bitvector_has
     * @tc.desc      : Test BitVector has method with fixed elements and range [1, 4] for value 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_has', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_has';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedElementToFind = 0;
          const fixedFromIndex = 1;
          const fixedToIndex = 4;

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_has_001_task,
              fixedLength, fixedElements, fixedElementToFind, fixedFromIndex, fixedToIndex,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0050
     * @tc.name      : test_bitvector_setBitsByRange
     * @tc.desc      : Test BitVector setBitsByRange method with fixed elements and range [1, 3) to set value 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_setBitsByRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_setBitsByRange';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedElementToSet = 1;
          const fixedFromIndex = 1;
          const fixedToIndex = 3;

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_setBitsByRange_001_task,
              fixedLength, fixedElements, fixedElementToSet, fixedFromIndex, fixedToIndex,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0060
     * @tc.name      : test_bitvector_setAllBits
     * @tc.desc      : Test BitVector setAllBits method with fixed elements, setting all to 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_setAllBits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_setAllBits';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedElementToSet = 1;

          for (let i = 0; i < 1; i++) {
            group.addTask(test_bitvector_setAllBits_001_task,
              fixedLength, fixedElements, fixedElementToSet,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

     /**
      * @tc.number    : GLOBAL_TEST_0070(crash)
      * @tc.name      : test_concurrent_collections_bitvector
      * @tc.desc      : test getBitsByRange method of BitVector
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
     it('test_concurrent_collections_bitvector', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
       async (done: () => void): Promise<void> => {
         const caseName = 'test_concurrent_collections_bitvector';
         console.info(`${caseName} test start`);

         // 初始化BitVector
         let bitVector = new collections.BitVector(0);
         for (let i = 0; i < 5; i++) {
           bitVector.push(i % 2); // 生成 [0, 1, 0, 1, 0]
         }

         try {
          let group = new taskpool.TaskGroup(caseName);
          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_range, bitVector, caseName, i);
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          });

          console.info(`${caseName} Original BitVector length: ${bitVector.length}`);
          expect(bitVector.length).assertEqual(5);
         } catch (e) {
           console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
           expect().assertFail();
         }

         console.info(`${caseName} test end`);
         done();
       });

    /**
     * @tc.number    : GLOBAL_TEST_0080
     * @tc.name      : test_bitvector_resize
     * @tc.desc      : Test BitVector resize method to expand and shrink the BitVector
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_resize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_resize';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedResizeToLarge = 10;
          const fixedResizeToSmall = 3;

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_resize_001_task,
              fixedLength, fixedElements, fixedResizeToLarge, fixedResizeToSmall,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0090
     * @tc.name      : test_bitvector_getBitCountByRange
     * @tc.desc      : Test BitVector getBitCountByRange method with fixed elements and range [1, 4) for bit value 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_getBitCountByRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_getBitCountByRange';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedElementToCount = 1;
          const fixedFromIndex = 1;
          const fixedToIndex = 4;

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_getBitCountByRange_001_task,
              fixedLength, fixedElements, fixedElementToCount, fixedFromIndex, fixedToIndex,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0100
     * @tc.name      : test_bitvector_getIndexOf
     * @tc.desc      : Test BitVector getIndexOf method with fixed elements and range [1, 4) for bit value 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_getIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_getIndexOf';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedElementToFind = 0;
          const fixedFromIndex = 1;
          const fixedToIndex = 4;

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_getIndexOf_001_task,
              fixedLength, fixedElements, fixedElementToFind, fixedFromIndex, fixedToIndex,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0110
     * @tc.name      : test_bitvector_getLastIndexOf
     * @tc.desc      : Test BitVector getLastIndexOf method with fixed elements and range [1, 4) for bit value 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_getLastIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_getLastIndexOf';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedElementToFind = 0;
          const fixedFromIndex = 1;
          const fixedToIndex = 4;

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_getLastIndexOf_001_task,
              fixedLength, fixedElements, fixedElementToFind, fixedFromIndex, fixedToIndex,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0120
     * @tc.name      : test_bitvector_flipBitByIndex
     * @tc.desc      : Test BitVector flipBitByIndex method with fixed elements, flipping bit at index 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_flipBitByIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_flipBitByIndex';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedIndexToFlip = 3;

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_flipBitByIndex_001_task,
              fixedLength, fixedElements, fixedIndexToFlip,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0130
     * @tc.name      : test_bitvector_flipBitsByRange
     * @tc.desc      : Test BitVector flipBitsByRange method with fixed elements and range [1, 4)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_flipBitsByRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_flipBitsByRange';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedFromIndex = 1;
          const fixedToIndex = 4;

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_flipBitsByRange_001_task,
              fixedLength, fixedElements, fixedFromIndex, fixedToIndex,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFalse();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFalse();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0140
     * @tc.name      : test_bitvector_values
     * @tc.desc      : Test BitVector values() method to iterate over all bit values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_values';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];

          for (let i = 0; i < 100; i++) {
            group.addTask(test_bitvector_values_001_task,
              fixedLength, fixedElements,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number    : GLOBAL_TEST_0150
     * @tc.name      : test_bitvector_index_accessor
     * @tc.desc      : Test BitVector index accessor [index: number]: number by accessing index 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_bitvector_index_accessor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_bitvector_index_accessor';
        console.info(`${caseName} test start`);

        try {
          let group = new taskpool.TaskGroup(caseName)

          const fixedLength = 0;
          const fixedElements = [0, 1, 0, 1, 0];
          const fixedIndexToAccess = 1;

          for (let i = 0; i < 1; i++) {
            group.addTask(test_bitvector_index_accessor_001_task,
              fixedLength, fixedElements, fixedIndexToAccess,
              caseName, i)
          }

          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail();
          })

          console.info(`${caseName} test end`);
          done()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}`);
          expect().assertFail();
        }
      })

  })
}