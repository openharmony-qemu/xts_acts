'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index";
import { testCopyWithin, testEntries,
  testFill,
  testFilter,
  testFind,
  testFindIndex,
  testForEach,
  testIncludes,
  testIndexOf,
  testJoin,
  testKeys,
  testLastIndexOf,
  testMap,
  testReduce,
  testReduceRight,
  testReverse,
  testSet,
  testSlice,
  testSome,
  testSort,
  testSubarray,
  testSymbolIterator,
  testToLocaleString,
  testToString,
  testTypedArrayFrom, testTypedArrayOf,
  testValues } from '../testability/pages/typearray';



let concurrentNum: int = 100

export default function TypedArrayTest(): void {
  describe('TypedArrayTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach((): void => {
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
     * @tc.name   testTypedArrayFrom
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypedArrayFrom', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testTypedArrayFrom';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testTypedArrayFrom)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testTypedArrayOf
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypedArrayOf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testTypedArrayOf';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testTypedArrayOf)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });


    /**
     * @tc.name   testCopyWithin
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCopyWithin', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testCopyWithin';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testCopyWithin)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testEntries
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0301
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntries', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testEntries';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testEntries)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testFill
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0302
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFill', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testFill';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFill)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testFilter
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFilter', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testFilter';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFilter)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testFind
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFind', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testFind';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFind)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testFindIndex
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFindIndex', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testFindIndex';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFindIndex)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testForEach
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0700
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testForEach', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testForEach';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testForEach)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testIncludes
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0800
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testIncludes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testIncludes';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testIncludes)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testIndexOf
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1000
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testIndexOf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testIndexOf';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testIndexOf)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testJoin
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testJoin', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testJoin';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testJoin)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testKeys
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testKeys', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testKeys';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testKeys)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testLastIndexOf
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLastIndexOf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testLastIndexOf';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testLastIndexOf)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testMap
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMap', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testMap';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testMap)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testReduce
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testReduce', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testReduce';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testReduce)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testReduceRight
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testReduceRight', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testReduceRight';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testReduceRight)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testReverse
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1700
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testReverse', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testReverse';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testReverse)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testSet
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1800
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSet', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSet';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSet)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testSlice
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1900
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSlice', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSlice';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSlice)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testSome
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2000
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSome', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSome';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSome)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testSort
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSort', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSort';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSort)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testSubarray
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSubarray', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSubarray';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSubarray)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testSymbolIterator
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSymbolIterator', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSymbolIterator';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSymbolIterator)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testToLocaleString
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testToLocaleString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testToLocaleString';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testToLocaleString)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testToString
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testToString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testToString';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testToString)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   testValues
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValues', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testValues';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testValues)
          }
          taskpool.execute(group).then((res: Any[]): void => {
            console.info(`${caseName} Task execution success`);
            result = res.length;
            try {
              expect(result).assertEqual(concurrentNum);
            } finally {
              done();
            }
          }, (e: Error): void => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            try {
              expect().assertFail();
            } finally {
              done();
            }
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          try {
            expect().assertFail();
          } finally {
            done();
          }
        }
      });

  })
}
