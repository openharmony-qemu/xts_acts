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
import {
  testCharCodeAt,
  testCodePointAt,
  testConcat,
  testEndsWith,
  testFromCharCode,
  testFromCodePoint,
  testIncludes,
  testIndexOf,
  testLastIndexOf,
  testMatchAll,
  testNormalize,
  testPadEnd,
  testPadStart,
  testRepeat,
  testReplace,
  testReplaceAll,
  testSearch,
  testSlice,
  testSplit,
  testStartsWith,
  testStringIndexOf3500,
  testStringLastIndexOf4300,
  testStringLocaleCompare6600,
  testSubstring,
  testToLocaleLowerCase,
  testToLocaleUpperCase,
  testToLowerCase,
  testToString,
  testToUpperCase,
  testTrim,
  testTrimEnd,
  testTrimStart,
  testValueOf
} from '../testability/pages/String';



let concurrentNum: int = 100

export default function StringTest(): void {
  describe('StringTest', (): void => {
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
     * @tc.name   testFromCharCode
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFromCharCode', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testFromCharCode';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFromCharCode)
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
     * @tc.name   testFromCodePoint
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROMCHARCODE_0200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFromCodePoint', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testFromCodePoint';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testFromCodePoint)
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
     * @tc.name   testCharCodeAt
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_0303
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCharCodeAt', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testCharCodeAt';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testCharCodeAt)
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
     * @tc.name   testCodePointAt
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_0400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCodePointAt', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testCodePointAt';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testCodePointAt)
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
     * @tc.name   testConcat
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_0500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testConcat', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testConcat';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testConcat)
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
     * @tc.name   testEndsWith
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_0600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEndsWith', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testEndsWith';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testEndsWith)
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_0700
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_0800
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
     * @tc.name   testLastIndexOf
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1000
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
     * @tc.name   testMatchAll
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatchAll', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testMatchAll';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testMatchAll)
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
     * @tc.name   testNormalize
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testNormalize', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testNormalize';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testNormalize)
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
     * @tc.name   testPadEnd
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPadEnd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testPadEnd';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testPadEnd)
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
     * @tc.name   testPadStart
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPadStart', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testPadStart';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testPadStart)
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
     * @tc.name   testRepeat
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRepeat', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testRepeat';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testRepeat)
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
     * @tc.name   testReplace
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testReplace', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testReplace';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testReplace)
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
     * @tc.name   testReplaceAll
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1700
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testReplaceAll', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testReplaceAll';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testReplaceAll)
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
     * @tc.name   testSearch
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1800
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSearch', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSearch';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSearch)
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_1900
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
     * @tc.name   testSplit
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2000
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSplit', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSplit';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSplit)
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
     * @tc.name   testStartsWith
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStartsWith', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testStartsWith';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testStartsWith)
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
     * @tc.name   testSubstring
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSubstring', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testSubstring';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testSubstring)
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
     * @tc.name   testToLocaleLowerCase
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testToLocaleLowerCase', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testToLocaleLowerCase';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testToLocaleLowerCase)
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2400
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
     * @tc.name   testToLocaleUpperCase
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testToLocaleUpperCase', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testToLocaleUpperCase';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testToLocaleUpperCase)
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
     * @tc.name   testToLowerCase
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testToLowerCase', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testToLowerCase';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testToLowerCase)
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
     * @tc.name   testToUpperCase
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2700
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testToUpperCase', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testToUpperCase';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testToUpperCase)
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
     * @tc.name   testTrim
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2701
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTrim', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testTrim';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testTrim)
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
     * @tc.name   testTrimEnd
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2800
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTrimEnd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testTrimEnd';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testTrimEnd)
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
     * @tc.name   testTrimStart
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2801
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTrimStart', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testTrimStart';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testTrimStart)
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
     * @tc.name   testValueOf
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2900
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValueOf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testValueOf';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testValueOf)
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
     * @tc.name   testStringIndexOf3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_3000
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStringIndexOf3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testStringIndexOf3500';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testStringIndexOf3500)
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
     * @tc.name   testStringLastIndexOf4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2803
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStringLastIndexOf4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testStringLastIndexOf4300';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testStringLastIndexOf4300)
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
     * @tc.name   testStringLocaleCompare6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_2901
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStringLocaleCompare6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testStringLocaleCompare6600';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testStringLocaleCompare6600)
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
