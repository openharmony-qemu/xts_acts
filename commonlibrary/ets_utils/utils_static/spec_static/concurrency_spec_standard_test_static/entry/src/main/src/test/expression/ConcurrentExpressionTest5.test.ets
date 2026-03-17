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
  ExpressionTest0741,
  ExpressionTest0742,
  ExpressionTest0743,
  ExpressionTest0744,
  ExpressionTest0745,
  ExpressionTest0746,
  ExpressionTest0747,
  ExpressionTest0748,
  ExpressionTest0749,
  ExpressionTest0750,
  ExpressionTest0751,
  ExpressionTest0752,
  ExpressionTest0753,
  ExpressionTest0754,
  ExpressionTest0755,
  ExpressionTest0756,
  ExpressionTest0757,
  ExpressionTest0758,
  ExpressionTest0759,
  ExpressionTest0760,
  ExpressionTest0761,
  ExpressionTest0762,
  ExpressionTest0763,
  ExpressionTest0764,
  ExpressionTest0765,
  ExpressionTest0766,
  ExpressionTest0767,
  ExpressionTest0768,
  ExpressionTest0769,
  ExpressionTest0770,
  ExpressionTest0773,
  ExpressionTest0774,
  ExpressionTest0775,
  ExpressionTest0776,
  ExpressionTest0777,
  ExpressionTest0778,
  ExpressionTest0779,
  ExpressionTest0780,
  ExpressionTest0781,
  ExpressionTest0782,
  ExpressionTest0783,
  ExpressionTest0784,
  ExpressionTest0785,
  ExpressionTest0786,
  ExpressionTest0787,
  ExpressionTest0788,
  ExpressionTest0789,
  ExpressionTest0790,
  ExpressionTest0791,
  ExpressionTest0792,
  ExpressionTest0794,
  ExpressionTest0795,
  ExpressionTest0796,
  ExpressionTest0797,
  ExpressionTest0798,
  ExpressionTest0799,
  ExpressionTest0800,
  ExpressionTest0801,
  ExpressionTest0802,
  ExpressionTest0803,
  ExpressionTest0804,
  ExpressionTest0805,
  ExpressionTest0806,
  ExpressionTest0807,
  ExpressionTest0808,
  ExpressionTest0809,
  ExpressionTest0810,
  ExpressionTest0811,
  ExpressionTest0812,
  ExpressionTest0813,
  ExpressionTest0814,
  ExpressionTest0815,
  ExpressionTest0816,
  ExpressionTest0817,
  ExpressionTest0818,
  ExpressionTest0819,
  ExpressionTest0820,
  ExpressionTest0823,
  ExpressionTest0824,
  ExpressionTest0825,
  ExpressionTest0826,
  ExpressionTest0827,
  ExpressionTest0828,
  ExpressionTest0829,
  ExpressionTest0830,
  ExpressionTest0831,
  ExpressionTest0832,
  ExpressionTest0833,
  ExpressionTest0834,
  ExpressionTest0835,
  ExpressionTest0836,
  ExpressionTest0837,
  ExpressionTest0838,
  ExpressionTest0839,
  ExpressionTest0840,
  ExpressionTest0841,
  ExpressionTest0842,
  ExpressionTest0843,
  ExpressionTest0844,
  ExpressionTest0845,
  ExpressionTest0846,
  ExpressionTest0847,
  ExpressionTest0848,
  ExpressionTest0849,
  ExpressionTest0850,
  ExpressionTest0851,
  ExpressionTest0852,
  ExpressionTest0853,
  ExpressionTest0854,
  ExpressionTest0855,
  ExpressionTest0856,
  ExpressionTest0857,
  ExpressionTest0858,
  ExpressionTest0859,
  ExpressionTest0860,
  ExpressionTest0861,
  ExpressionTest0862,
  ExpressionTest0863,
  ExpressionTest0864,
  ExpressionTest0865,
  ExpressionTest0866,
  ExpressionTest0867,
  ExpressionTest0868,
  ExpressionTest0869,
  ExpressionTest0871,
  ExpressionTest0872,
  ExpressionTest0873,
  ExpressionTest0874,
  ExpressionTest0875,
  ExpressionTest0876,
  ExpressionTest0877,
  ExpressionTest0878,
  ExpressionTest0879,
  ExpressionTest0880,
  ExpressionTest0881,
  ExpressionTest0882,
  ExpressionTest0883,
  ExpressionTest0884,
  ExpressionTest0885,
  ExpressionTest0886,
  ExpressionTest0887,
  ExpressionTest0888,
  ExpressionTest0889,
  ExpressionTest0890,
  ExpressionTest0891,
  ExpressionTest0892,
  ExpressionTest0893,
  ExpressionTest0894,
  ExpressionTest0895,
  ExpressionTest0896,
  ExpressionTest0897,
  ExpressionTest0898,
  ExpressionTest0899,
  ExpressionTest0900,
  ExpressionTest0901,
  ExpressionTest0902,
  ExpressionTest0903,
  ExpressionTest0904,
  ExpressionTest0905
} from './expressiontest5function/ExpressionTest5Func';
import Utils from './../Util.test.ets';
let concurrentNum: int = 1

export default function expressionTest5() {
  describe('ExpressionTest5', () => {
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0741
     * @tc.name concurrent_ExpressionTest0741
     * @tc.desc Test range check with logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0741', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0741'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0741)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0742
     * @tc.name concurrent_ExpressionTest0742
     * @tc.desc Test string length with arithmetic and bitwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0742', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0742'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0742)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0743
     * @tc.name concurrent_ExpressionTest0743
     * @tc.desc Test nested ternary with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0743', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0743'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0743)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0744
     * @tc.name concurrent_ExpressionTest0744
     * @tc.desc Test comma operator in for loop with multiple variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0744', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0744'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0744)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0745
     * @tc.name concurrent_ExpressionTest0745
     * @tc.desc Test string comparison with substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0745', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0745'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0745)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0746
     * @tc.name concurrent_ExpressionTest0746
     * @tc.desc Test unary operators with arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0746', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0746'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0746)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0747
     * @tc.name concurrent_ExpressionTest0747
     * @tc.desc Test bitwise operations in conditional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0747', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0747'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0747)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0748
     * @tc.name concurrent_ExpressionTest0748
     * @tc.desc Test string concatenation with increment in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0748'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0748)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0749
     * @tc.name concurrent_ExpressionTest0749
     * @tc.desc Test comparison with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0749', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0749'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0749)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0750
     * @tc.name concurrent_ExpressionTest0750
     * @tc.desc Test comma operator in for loop with string manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0750'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0750)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0751
     * @tc.name concurrent_ExpressionTest0751
     * @tc.desc Test string concatenation with multiple arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0751', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0751'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0751)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0752
     * @tc.name concurrent_ExpressionTest0752
     * @tc.desc Test unary minus with logical operations in ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0752', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0752'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0752)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0753
     * @tc.name concurrent_ExpressionTest0753
     * @tc.desc Test comma operator in for loop with array indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0753', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0753'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0753)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0754
     * @tc.name concurrent_ExpressionTest0754
     * @tc.desc Test logical NOT with object property check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0754', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0754'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0754)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0755
     * @tc.name concurrent_ExpressionTest0755
     * @tc.desc Test bitwise OR with range check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0755', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0755'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0755)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0756
     * @tc.name concurrent_ExpressionTest0756
     * @tc.desc Test string template with conditional expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0756', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0756'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0756)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0757
     * @tc.name concurrent_ExpressionTest0757
     * @tc.desc Test unary plus with string to number conversion in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0757', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0757'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0757)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0758
     * @tc.name concurrent_ExpressionTest0758
     * @tc.desc Test array length with arithmetic in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0758', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0758'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0758)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0759
     * @tc.name concurrent_ExpressionTest0759
     * @tc.desc Test logical AND with mixed conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0759', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0759'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0759)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0760
     * @tc.name concurrent_ExpressionTest0760
     * @tc.desc Test logical OR with mixed conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0760'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0760)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0761
     * @tc.name concurrent_ExpressionTest0761
     * @tc.desc Test compound assignment with modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0761', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0761'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0761)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0762
     * @tc.name concurrent_ExpressionTest0762
     * @tc.desc Test string template with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0762', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0762'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0762)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0763
     * @tc.name concurrent_ExpressionTest0763
     * @tc.desc Test prefix decrement in arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0763', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0763'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0763)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0764
     * @tc.name concurrent_ExpressionTest0764
     * @tc.desc Test postfix increment in expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0764', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0764'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0764)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0765
     * @tc.name concurrent_ExpressionTest0765
     * @tc.desc Test comma operator in for loop with multiple counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0765'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0765)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0766
     * @tc.name concurrent_ExpressionTest0766
     * @tc.desc Test string comparison with case transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0766', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0766'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0766)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0767
     * @tc.name concurrent_ExpressionTest0767
     * @tc.desc Test modulus with array indices in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0767', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0767'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0767)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0768
     * @tc.name concurrent_ExpressionTest0768
     * @tc.desc Test nullish coalescing with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0768', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0768'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0768)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0769
     * @tc.name concurrent_ExpressionTest0769
     * @tc.desc Test bitwise operations with positive and negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0769', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0769'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0769)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0770
     * @tc.name concurrent_ExpressionTest0770
     * @tc.desc Test array index with arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0770'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0770)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0773
     * @tc.name concurrent_ExpressionTest0773
     * @tc.desc Test comparison with right shift results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0773', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0773'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0773)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0774
     * @tc.name concurrent_ExpressionTest0774
     * @tc.desc Test string concatenation with modulus operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0774', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0774'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0774)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0775
     * @tc.name concurrent_ExpressionTest0775
     * @tc.desc Test operator precedence with mixed operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0775'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0775)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0776
     * @tc.name concurrent_ExpressionTest0776
     * @tc.desc Test grouped expressions in template with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0776'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0776)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0777
     * @tc.name concurrent_ExpressionTest0777
     * @tc.desc Test array method with arithmetic parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0777', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0777'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0777)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0778
     * @tc.name concurrent_ExpressionTest0778
     * @tc.desc Test unary plus with arithmetic in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0778', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0778'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0778)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0779
     * @tc.name concurrent_ExpressionTest0779
     * @tc.desc Test comparison with bitwise complement results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0779', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0779'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0779)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0780
     * @tc.name concurrent_ExpressionTest0780
     * @tc.desc Test compound assignment with division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0780'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0780)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0781
     * @tc.name concurrent_ExpressionTest0781
     * @tc.desc Test array manipulation with loop conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0781', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0781'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0781)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0782
     * @tc.name concurrent_ExpressionTest0782
     * @tc.desc Test modulus with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0782', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0782'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0782)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0783
     * @tc.name concurrent_ExpressionTest0783
     * @tc.desc Test string concatenation with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0783', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0783'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0783)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0784
     * @tc.name concurrent_ExpressionTest0784
     * @tc.desc Test comparison with exponentiation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0784', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0784'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0784)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0785
     * @tc.name concurrent_ExpressionTest0785
     * @tc.desc Test template string with array expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0785', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0785'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0785)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0786
     * @tc.name concurrent_ExpressionTest0786
     * @tc.desc Test array length with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0786', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0786'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0786)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0787
     * @tc.name concurrent_ExpressionTest0787
     * @tc.desc Test array index with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0787', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0787'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0787)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0788
     * @tc.name concurrent_ExpressionTest0788
     * @tc.desc Test template string with array manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0788', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0788'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0788)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0789
     * @tc.name concurrent_ExpressionTest0789
     * @tc.desc Test comparison with array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0789', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0789'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0789)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0790
     * @tc.name concurrent_ExpressionTest0790
     * @tc.desc Test array concatenation with conditional results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0790'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0790)
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0791
     * @tc.name concurrent_ExpressionTest0791
     * @tc.desc Test range check with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ExpressionTest0791', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ExpressionTest0791'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ExpressionTest0791)
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




  })
}