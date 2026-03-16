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
  ExpressionTest0001,
  ExpressionTest0002,
  ExpressionTest0003,
  ExpressionTest0004,
  ExpressionTest0005,
  ExpressionTest0006,
  ExpressionTest0007,
  ExpressionTest0008,
  ExpressionTest0009,
  ExpressionTest0010,
  ExpressionTest0011,
  ExpressionTest0012,
  ExpressionTest0013,
  ExpressionTest0014,
  ExpressionTest0015,
  ExpressionTest0016,
  ExpressionTest0017,
  ExpressionTest0018,
  ExpressionTest0019,
  ExpressionTest0020,
  ExpressionTest0021,
  ExpressionTest0022,
  ExpressionTest0023,
  ExpressionTest0024,
  ExpressionTest0025,
  ExpressionTest0026,
  ExpressionTest0027,
  ExpressionTest0028,
  ExpressionTest0029,
  ExpressionTest0030,
  ExpressionTest0031,
  ExpressionTest0032,
  ExpressionTest0033,
  ExpressionTest0034,
  ExpressionTest0035,
  ExpressionTest0036,
  ExpressionTest0037,
  ExpressionTest0038,
  ExpressionTest0039,
  ExpressionTest0040,
  ExpressionTest0041,
  ExpressionTest0042,
  ExpressionTest0043,
  ExpressionTest0044,
  ExpressionTest0049,
  ExpressionTest0050,
  ExpressionTest0051,
  ExpressionTest0052,
  ExpressionTest0053,
  ExpressionTest0054,
  ExpressionTest0055,
  ExpressionTest0057,
  ExpressionTest0058,
  ExpressionTest0059,
  ExpressionTest0060,
  ExpressionTest0063,
  ExpressionTest0064,
  ExpressionTest0065,
  ExpressionTest0066,
  ExpressionTest0067,
  ExpressionTest0069,
  ExpressionTest0070,
  ExpressionTest0071,
  ExpressionTest0073,
  ExpressionTest0074,
  ExpressionTest0075,
  ExpressionTest0076,
  ExpressionTest0077,
  ExpressionTest0078,
  ExpressionTest0079,
  ExpressionTest0080,
  ExpressionTest0081,
  ExpressionTest0082,
  ExpressionTest0083,
  ExpressionTest0084,
  ExpressionTest0085,
  ExpressionTest0086,
  ExpressionTest0087,
  ExpressionTest0088,
  ExpressionTest0089,
  ExpressionTest0090,
  ExpressionTest0091,
  ExpressionTest0092,
  ExpressionTest0094,
  ExpressionTest0096,
  ExpressionTest0097,
  ExpressionTest0098,
  ExpressionTest0099,
  ExpressionTest0101,
  ExpressionTest0102,
  ExpressionTest0103,
  ExpressionTest0104,
  ExpressionTest0105,
  ExpressionTest0106,
  ExpressionTest0107,
  ExpressionTest0108,
  ExpressionTest0109,
  ExpressionTest0110,
  ExpressionTest0111,
  ExpressionTest0112,
  ExpressionTest0113,
  ExpressionTest0114,
  ExpressionTest0115,
  ExpressionTest0116,
  ExpressionTest0117,
  ExpressionTest0118,
  ExpressionTest0119,
  ExpressionTest0121,
  ExpressionTest0122,
  ExpressionTest0123,
  ExpressionTest0124,
  ExpressionTest0125,
  ExpressionTest0126,
  ExpressionTest0127,
  ExpressionTest0128,
  ExpressionTest0129,
  ExpressionTest0130,
  ExpressionTest0131,
  ExpressionTest0132,
  ExpressionTest0133,
  ExpressionTest0134,
  ExpressionTest0135,
  ExpressionTest0136,
  ExpressionTest0137,
  ExpressionTest0138,
  ExpressionTest0139,
  ExpressionTest0140,
  ExpressionTest0141,
  ExpressionTest0146,
  ExpressionTest0147,
  ExpressionTest0148,
  ExpressionTest0149,
  ExpressionTest0150,
  ExpressionTest0151,
  ExpressionTest0152,
  ExpressionTest0153,
  ExpressionTest0154,
  ExpressionTest0155,
  ExpressionTest0156,
  ExpressionTest0157,
  ExpressionTest0158,
  ExpressionTest0159,
  ExpressionTest0160,
  ExpressionTest0161,
  ExpressionTest0162,
  ExpressionTest0163,
  ExpressionTest0164,
  ExpressionTest0165,
  ExpressionTest0166,
  ExpressionTest0167,
  ExpressionTest0168,
  ExpressionTest0169,
  ExpressionTest0170,
  ExpressionTest0171,
  ExpressionTest0172,
  ExpressionTest0173,
  ExpressionTest0174,
  ExpressionTest0175,
  ExpressionTest0176,
  ExpressionTest0177,
  ExpressionTest0178,
  ExpressionTest0179,
  ExpressionTest0180,
  ExpressionTest0181,
  ExpressionTest0182,
  ExpressionTest0183,
  ExpressionTest0184,
  ExpressionTest0185,
  ExpressionTest0186,
  ExpressionTest0187,
  ExpressionTest0188,
  ExpressionTest0189,
  ExpressionTest0190,
  ExpressionTest0191,
  ExpressionTest0196,
  ExpressionTest0197,
  ExpressionTest0198,
  ExpressionTest0199,
  ExpressionTest0200
} from './expressiontest1function/ExpressionTest1Func';
import Utils from './../Util.test.ets';
let concurrentNum: int = 1

export default function expressionTest1() {
  describe('ExpressionTest1', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0001
     * @tc.name concurrent_ExpressionTest0001
     * @tc.desc Test addition operator with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0001'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0001)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0002
     * @tc.name concurrent_ExpressionTest0002
     * @tc.desc Test subtraction operator with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0002'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0002)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0003
     * @tc.name concurrent_ExpressionTest0003
     * @tc.desc Test multiplication operator with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0003'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0003)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0004
     * @tc.name concurrent_ExpressionTest0004
     * @tc.desc Test division operator with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0004'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0004)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0005
     * @tc.name concurrent_ExpressionTest0005
     * @tc.desc Test modulus operator with positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0005'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0005)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0006
     * @tc.name concurrent_ExpressionTest0006
     * @tc.desc Test exponentiation operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0006'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0006)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0007
     * @tc.name concurrent_ExpressionTest0007
     * @tc.desc Test prefix increment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0007'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0007)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0008
     * @tc.name concurrent_ExpressionTest0008
     * @tc.desc Test postfix increment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0008'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0008)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0009
     * @tc.name concurrent_ExpressionTest0009
     * @tc.desc Test prefix decrement operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0009'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0009)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0010
     * @tc.name concurrent_ExpressionTest0010
     * @tc.desc Test postfix decrement operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0010'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0010)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0011
     * @tc.name concurrent_ExpressionTest0011
     * @tc.desc Test assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0011'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0011)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0012
     * @tc.name concurrent_ExpressionTest0012
     * @tc.desc Test addition assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0012'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0012)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0013
     * @tc.name concurrent_ExpressionTest0013
     * @tc.desc Test subtraction assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0013'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0013)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0014
     * @tc.name concurrent_ExpressionTest0014
     * @tc.desc Test multiplication assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0014'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0014)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0015
     * @tc.name concurrent_ExpressionTest0015
     * @tc.desc Test division assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0015'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0015)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0016
     * @tc.name concurrent_ExpressionTest0016
     * @tc.desc Test modulus assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0016'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0016)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0017
     * @tc.name concurrent_ExpressionTest0017
     * @tc.desc Test exponentiation assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0017'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0017)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0018
     * @tc.name concurrent_ExpressionTest0018
     * @tc.desc Test strict equality operator with same values and types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0018'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0018)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0019
     * @tc.name concurrent_ExpressionTest0019
     * @tc.desc Test strict equality operator with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0019'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0019)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0020
     * @tc.name concurrent_ExpressionTest0020
     * @tc.desc Test non-strict equality operator with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0020'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0020)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0021
     * @tc.name concurrent_ExpressionTest0021
     * @tc.desc Test strict inequality operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0021'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0021)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0022
     * @tc.name concurrent_ExpressionTest0022
     * @tc.desc Test greater than operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0022'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0022)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0023
     * @tc.name concurrent_ExpressionTest0023
     * @tc.desc Test less than operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0023'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0023)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0024
     * @tc.name concurrent_ExpressionTest0024
     * @tc.desc Test greater than or equal operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0024'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0024)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0025
     * @tc.name concurrent_ExpressionTest0025
     * @tc.desc Test less than or equal operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0025'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0025)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0026
     * @tc.name concurrent_ExpressionTest0026
     * @tc.desc Test logical AND operator with true values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0026'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0026)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0027
     * @tc.name concurrent_ExpressionTest0027
     * @tc.desc Test logical AND operator with false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0027'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0027)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0028
     * @tc.name concurrent_ExpressionTest0028
     * @tc.desc Test logical OR operator with true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0028'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0028)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0029
     * @tc.name concurrent_ExpressionTest0029
     * @tc.desc Test logical NOT operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0029'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0029)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0030
     * @tc.name concurrent_ExpressionTest0030
     * @tc.desc Test bitwise AND operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0030'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0030)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0031
     * @tc.name concurrent_ExpressionTest0031
     * @tc.desc Test bitwise OR operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0031'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0031)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0032
     * @tc.name concurrent_ExpressionTest0032
     * @tc.desc Test bitwise XOR operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0032'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0032)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0033
     * @tc.name concurrent_ExpressionTest0033
     * @tc.desc Test bitwise NOT operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0033'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0033)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0034
     * @tc.name concurrent_ExpressionTest0034
     * @tc.desc Test left shift operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0034'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0034)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0035
     * @tc.name concurrent_ExpressionTest0035
     * @tc.desc Test right shift operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0035'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0035)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0036
     * @tc.name concurrent_ExpressionTest0036
     * @tc.desc Test unsigned right shift operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0036'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0036)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0037
     * @tc.name concurrent_ExpressionTest0037
     * @tc.desc Test conditional operator with true condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0037'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0037)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0038
     * @tc.name concurrent_ExpressionTest0038
     * @tc.desc Test comma operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0038'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0038)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0039
     * @tc.name concurrent_ExpressionTest0039
     * @tc.desc Test typeof operator with number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0039'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0039)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0040
     * @tc.name concurrent_ExpressionTest0040
     * @tc.desc Test typeof operator with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0040'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0040)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0041
     * @tc.name concurrent_ExpressionTest0041
     * @tc.desc Test typeof operator with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0041'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0041)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0042
     * @tc.name concurrent_ExpressionTest0042
     * @tc.desc Test typeof operator with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0042'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0042)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0043
     * @tc.name concurrent_ExpressionTest0043
     * @tc.desc Test unary plus operator with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0043'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0043)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0044
     * @tc.name concurrent_ExpressionTest0044
     * @tc.desc Test unary minus operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0044'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0044)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0049
     * @tc.name concurrent_ExpressionTest0049
     * @tc.desc Test array destructuring with multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0049'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0049)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0050
     * @tc.name concurrent_ExpressionTest0050
     * @tc.desc Test operator precedence with multiplication and addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0050'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0050)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0051
     * @tc.name concurrent_ExpressionTest0051
     * @tc.desc Test operator precedence with parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0051'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0051)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0052
     * @tc.name concurrent_ExpressionTest0052
     * @tc.desc Test string concatenation with + operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0052'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0052)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0053
     * @tc.name concurrent_ExpressionTest0053
     * @tc.desc Test string concatenation with number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0053'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0053)
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



