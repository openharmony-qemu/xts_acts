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
  testBoolAnd,
  testBoolArraySome,
  testBoolCompare,
  testBoolComplex,
  testBoolean,
  testBooleanConstructor,
  testBooleanprototypetoString,
  testBooleanPrototypeValueOf,
  testBoolIf,
  testBoolLiteralFalse,
  testBoolLiteralTrue,
  testBoolNot,
  testBoolOr,
  testBoolTernary
} from '../testability/pages/Boolean';



let concurrentNum: int = 100

export default function BooleanTest(): void {
  describe('BooleanTest', (): void => {
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
     * @tc.name   testBooleanConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBooleanConstructor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBooleanConstructor0001';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBooleanConstructor)
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
     * @tc.name   testBoolean002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolean002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolean002';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolean)
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
     * @tc.name   testBooleanprototypetoString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBooleanprototypetoString0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBooleanprototypetoString0003';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBooleanprototypetoString)
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
     * @tc.name   testBooleanPrototypeValueOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBooleanPrototypeValueOf0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBooleanPrototypeValueOf0004';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBooleanPrototypeValueOf)
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
     * @tc.name   testBoolLiteralTrue
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolLiteralTrue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolLiteralTrue';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolLiteralTrue)
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
     * @tc.name   testBoolLiteralFalse
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolLiteralFalse', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolLiteralFalse';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolLiteralFalse)
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
     * @tc.name   testBoolNot
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0700
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolNot', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolNot';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolNot)
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
     * @tc.name   testBoolAnd
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0800
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolAnd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolAnd';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolAnd)
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
     * @tc.name   testBoolOr
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0900
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolOr', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolOr';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolOr)
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
     * @tc.name   testBoolIf
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1000
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolIf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolIf';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolIf)
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
     * @tc.name   testBoolArraySome
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolArraySome', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolArraySome';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolArraySome)
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
     * @tc.name   testBoolCompare
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolCompare', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolCompare';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolCompare)
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
     * @tc.name   testBoolComplex
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolComplex', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolComplex';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolComplex)
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
     * @tc.name   testBoolTernary
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBoolTernary', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: () => void): void => {
        const caseName = 'testBoolTernary';
        console.info(`${caseName} test start`);
        let result: int = 0
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testBoolTernary)
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
