/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import {
  ExpressionTest0906,
  ExpressionTest0907,
  ExpressionTest0908,
  ExpressionTest0909,
  ExpressionTest0910,
  ExpressionTest0911,
  ExpressionTest0912,
  ExpressionTest0913,
  ExpressionTest0914,
  ExpressionTest0915,
  ExpressionTest0917,
  ExpressionTest0918,
  ExpressionTest0920,
  ExpressionTest0921,
  ExpressionTest0922,
  ExpressionTest0923,
  ExpressionTest0924,
  ExpressionTest0925,
  ExpressionTest0926,
  ExpressionTest0927,
  ExpressionTest0928,
  ExpressionTest0929,
  ExpressionTest0930,
  ExpressionTest0931,
  ExpressionTest0932,
  ExpressionTest0933,
  ExpressionTest0934,
  ExpressionTest0935,
  ExpressionTest0936,
  ExpressionTest0937,
  ExpressionTest0938,
  ExpressionTest0939,
  ExpressionTest0940,
  ExpressionTest0941,
  ExpressionTest0942,
  ExpressionTest0943,
  ExpressionTest0944,
  ExpressionTest0945,
  ExpressionTest0946,
  ExpressionTest0947,
  ExpressionTest0948,
  ExpressionTest0949,
  ExpressionTest0950,
  ExpressionTest0951,
  ExpressionTest0952,
  ExpressionTest0954,
  ExpressionTest0955,
  ExpressionTest0956,
  ExpressionTest0957,
  ExpressionTest0958,
  ExpressionTest0959,
  ExpressionTest0960,
  ExpressionTest0961,
  ExpressionTest0962,
  ExpressionTest0963,
  ExpressionTest0964,
  ExpressionTest0965,
  ExpressionTest0966,
  ExpressionTest0967,
  ExpressionTest0968,
  ExpressionTest0969,
  ExpressionTest0970,
  ExpressionTest0971,
  ExpressionTest0972,
  ExpressionTest0973,
  ExpressionTest0974,
  ExpressionTest0975,
  ExpressionTest0976,
  ExpressionTest0977,
  ExpressionTest0978,
  ExpressionTest0979,
  ExpressionTest0980,
  ExpressionTest0981,
  ExpressionTest0982,
  ExpressionTest0983,
  ExpressionTest0984,
  ExpressionTest0985,
  ExpressionTest0986,
  ExpressionTest0987,
  ExpressionTest0988,
  ExpressionTest0989,
  ExpressionTest0990,
  ExpressionTest0991,
  ExpressionTest0992,
  ExpressionTest0993,
  ExpressionTest0994,
  ExpressionTest0995,
  ExpressionTest0996,
  ExpressionTest0997,
  ExpressionTest0998,
  ExpressionTest0999,
  ExpressionTest1000,
  ExpressionTest1001,
  ExpressionTest1002,
  ExpressionTest1003,
  ExpressionTest1004,
  ExpressionTest1005,
  ExpressionTest1006,
  ExpressionTest1007,
  ExpressionTest1008,
  ExpressionTest1009,
  ExpressionTest1010,
  ExpressionTest1011,
  ExpressionTest1012,
  ExpressionTest1013,
  ExpressionTest1014,
  ExpressionTest1015,
  ExpressionTest1016,
  ExpressionTest1017,
  ExpressionTest1018,
  ExpressionTest1019,
  ExpressionTest1020,
  ExpressionTest1021,
  ExpressionTest1022,
  ExpressionTest1023,
  ExpressionTest1024,
  ExpressionTest1025,
  ExpressionTest1026,
  ExpressionTest1027,
  ExpressionTest1028,
  ExpressionTest1029,
  ExpressionTest1030,
  ExpressionTest1031,
  ExpressionTest1032,
  ExpressionTest1033,
  ExpressionTest1034,
  ExpressionTest1035,
  ExpressionTest1036,
  ExpressionTest1037,
  ExpressionTest1038,
  ExpressionTest1039,
  ExpressionTest1040,
  ExpressionTest1041,
  ExpressionTest1042,
  ExpressionTest1044,
  ExpressionTest1045,
  ExpressionTest1046,
  ExpressionTest1047,
  ExpressionTest1048,
  ExpressionTest1049,
  ExpressionTest1050,
  ExpressionTest1071,
  ExpressionTest1075,
  ExpressionTest1077,
  ExpressionTest1078,
  ExpressionTest1079,
  ExpressionTest1080,
  ExpressionTest1081,
  ExpressionTest1082,
  ExpressionTest1083,
  ExpressionTest1084,
  ExpressionTest1085,
  ExpressionTest1086,
  ExpressionTest1087,
  ExpressionTest1088,
  ExpressionTest1089,
  ExpressionTest1090,
  ExpressionTest1091,
  ExpressionTest1092,
  ExpressionTest1093,
  ExpressionTest1094,
  ExpressionTest1095,
  ExpressionTest1096,
  ExpressionTest1097,
  ExpressionTest1098,
  ExpressionTest1100,
  ExpressionTest1101,
  ExpressionTest1102,
  ExpressionTest1103,
  ExpressionTest1104,
  ExpressionTest1106,
  ExpressionTest1107,
  ExpressionTest1108,
  ExpressionTest1109,
  ExpressionTest1110
} from './expressiontest6function/ExpressionTest6Func';
import Utils from './../Util.test.ets';
let concurrentNum: int = 1

export default function expressionTest6() {
  describe('ExpressionTest6', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0906
     * @tc.name concurrent_ExpressionTest0906
     * @tc.desc Test array length with multiplication in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0906', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0906'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0906)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0907
     * @tc.name concurrent_ExpressionTest0907
     * @tc.desc Test logical AND with array value conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0907', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0907'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0907)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0908
     * @tc.name concurrent_ExpressionTest0908
     * @tc.desc Test logical OR with array value checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0908', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0908'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0908)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0909
     * @tc.name concurrent_ExpressionTest0909
     * @tc.desc Test compound assignment with modulus and addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0909', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0909'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0909)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0910
     * @tc.name concurrent_ExpressionTest0910
     * @tc.desc Test string template with bitwise operations on array indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0910'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0910)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0911
     * @tc.name concurrent_ExpressionTest0911
     * @tc.desc Test prefix decrement with array index and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0911', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0911'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0911)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0912
     * @tc.name concurrent_ExpressionTest0912
     * @tc.desc Test postfix increment with array index calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0912', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0912'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0912)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0913
     * @tc.name concurrent_ExpressionTest0913
     * @tc.desc Test comma operator in for loop with dual array indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0913', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0913'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0913)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0914
     * @tc.name concurrent_ExpressionTest0914
     * @tc.desc Test string comparison with array values and transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0914', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0914'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0914)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0915
     * @tc.name concurrent_ExpressionTest0915
     * @tc.desc Test modulus with array indices in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0915', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0915'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0915)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0917
     * @tc.name concurrent_ExpressionTest0917
     * @tc.desc Test bitwise operations with positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0917', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0917'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0917)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0918
     * @tc.name concurrent_ExpressionTest0918
     * @tc.desc Test array index calculation with complex arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0918', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0918'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0918)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0920
     * @tc.name concurrent_ExpressionTest0920
     * @tc.desc Test array index with left shift operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0920'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0920)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0921
     * @tc.name concurrent_ExpressionTest0921
     * @tc.desc Test string concatenation with multiple modulus operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0921', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0921'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0921)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0922
     * @tc.name concurrent_ExpressionTest0922
     * @tc.desc Test operator precedence with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0922', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0922'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0922)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0923
     * @tc.name concurrent_ExpressionTest0923
     * @tc.desc Test grouped expressions in template with array calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0923', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0923'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0923)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0924
     * @tc.name concurrent_ExpressionTest0924
     * @tc.desc Test array method with calculated parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0924', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0924'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0924)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0925
     * @tc.name concurrent_ExpressionTest0925
     * @tc.desc Test unary minus with string array values in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0925', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0925'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0925)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0926
     * @tc.name concurrent_ExpressionTest0926
     * @tc.desc Test comparison with bitwise complement results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0926', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0926'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0926)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0927
     * @tc.name concurrent_ExpressionTest0927
     * @tc.desc Test compound assignment with division and subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0927', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0927'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0927)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0928
     * @tc.name concurrent_ExpressionTest0928
     * @tc.desc Test array manipulation with complex conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0928', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0928'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0928)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0929
     * @tc.name concurrent_ExpressionTest0929
     * @tc.desc Test modulus with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0929', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0929'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0929)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0930
     * @tc.name concurrent_ExpressionTest0930
     * @tc.desc Test string concatenation with array values and math operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0930'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0930)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0931
     * @tc.name concurrent_ExpressionTest0931
     * @tc.desc Test comparison with exponentiation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0931', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0931'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0931)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0932
     * @tc.name concurrent_ExpressionTest0932
     * @tc.desc Test template string with array expressions and calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0932', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0932'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0932)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0933
     * @tc.name concurrent_ExpressionTest0933
     * @tc.desc Test array length with bitwise operations in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0933', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0933'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0933)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0934
     * @tc.name concurrent_ExpressionTest0934
     * @tc.desc Test array index calculation with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0934', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0934'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0934)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0935
     * @tc.name concurrent_ExpressionTest0935
     * @tc.desc Test template string with array manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0935', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0935'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0935)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0936
     * @tc.name concurrent_ExpressionTest0936
     * @tc.desc Test comparison with array length and calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0936', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0936'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0936)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0937
     * @tc.name concurrent_ExpressionTest0937
     * @tc.desc Test array concatenation with conditional results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0937', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0937'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0937)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0938
     * @tc.name concurrent_ExpressionTest0938
     * @tc.desc Test range check with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0938', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0938'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0938)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0939
     * @tc.name concurrent_ExpressionTest0939
     * @tc.desc Test array length with arithmetic and bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0939', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0939'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0939)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0940
     * @tc.name concurrent_ExpressionTest0940
     * @tc.desc Test nested ternary with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0940'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0940)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0941
     * @tc.name concurrent_ExpressionTest0941
     * @tc.desc Test comma operator in for loop with array transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0941', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0941'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0941)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0942
     * @tc.name concurrent_ExpressionTest0942
     * @tc.desc Test string comparison with array values and lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0942', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0942'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0942)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0943
     * @tc.name concurrent_ExpressionTest0943
     * @tc.desc Test unary operators with array values in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0943', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0943'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0943)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0944
     * @tc.name concurrent_ExpressionTest0944
     * @tc.desc Test bitwise operations with array values in conditional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0944', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0944'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0944)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0945
     * @tc.name concurrent_ExpressionTest0945
     * @tc.desc Test array manipulation with increment in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0945', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0945'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0945)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0946
     * @tc.name concurrent_ExpressionTest0946
     * @tc.desc Test comparison with transformed array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0946', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0946'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0946)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0947
     * @tc.name concurrent_ExpressionTest0947
     * @tc.desc Test comma operator in for loop with filtered array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0947', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0947'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0947)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0948
     * @tc.name concurrent_ExpressionTest0948
     * @tc.desc Test string concatenation with array index arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0948', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0948'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0948)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0949
     * @tc.name concurrent_ExpressionTest0949
     * @tc.desc Test unary plus with array string values in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0949', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0949'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0949)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0950
     * @tc.name concurrent_ExpressionTest0950
     * @tc.desc Test comma operator in for loop with array index and value manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0950'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0950)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0951
     * @tc.name concurrent_ExpressionTest0951
     * @tc.desc Test exponentiation with negative base and even exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0951', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0951'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0951)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0952
     * @tc.name concurrent_ExpressionTest0952
     * @tc.desc Test bitwise operations with left shift and addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0952', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0952'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0952)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0954
     * @tc.name concurrent_ExpressionTest0954
     * @tc.desc Test remainder operator with negative dividend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0954', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0954'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0954)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0955
     * @tc.name concurrent_ExpressionTest0955
     * @tc.desc Test template string with string methods and calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0955', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0955'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0955)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0956
     * @tc.name concurrent_ExpressionTest0956
     * @tc.desc Test prefix increment in array index calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0956', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0956'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0956)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0957
     * @tc.name concurrent_ExpressionTest0957
     * @tc.desc Test array index with right shift operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0957', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0957'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0957)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
            result = res.length
          }).catch((e: Error) => {
            console.info(`${caseName} Task execution catch: ${e.message}`);
            expect().assertFail()
          })
          expect(result).assertEqual(concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        done();
      })



  }
  )
}