/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';

import {
  testAssignmentLikeContexts0001,
  testAssignmentLikeContexts0002,
  testAssignmentLikeContexts0003,
  testAssignmentLikeContexts0004,
  testAssignmentLikeContexts0005,
  testAssignmentLikeContexts0006,
  testAssignmentLikeContexts0007,
  testAssignmentLikeContexts0008,
  testAssignmentLikeContexts0009,
  testAssignmentLikeContexts0010,
  testAssignmentLikeContexts0011,
  testAssignmentLikeContexts0012,
  testAssignmentLikeContexts0013,
  testAssignmentLikeContexts0014,
  testAssignmentLikeContexts0015,
  testAssignmentLikeContexts0016,
  testAssignmentLikeContexts0017,
  testAssignmentLikeContexts0018,
  testAssignmentLikeContexts0019,
  testAssignmentLikeContexts0020,
  testAssignmentLikeContexts0021,
  testAssignmentLikeContexts0022,
  testAssignmentLikeContexts0023,
  testAssignmentLikeContexts0024,
  testAssignmentLikeContexts0025,
  testAssignmentLikeContexts0026,
  testAssignmentLikeContexts0027,
  testAssignmentLikeContexts0028,
  testAssignmentLikeContexts0029,
  testAssignmentLikeContexts0030,
  testAssignmentLikeContexts0031,
  testAssignmentLikeContexts0032,
  testAssignmentLikeContexts0033,
  testAssignmentLikeContexts0034,
  testAssignmentLikeContexts0035,
  testAssignmentLikeContexts0036,
  testAssignmentLikeContexts0037,
  testAssignmentLikeContexts0038,
  testAssignmentLikeContexts0039,
  testAssignmentLikeContexts0040,
  testAssignmentLikeContexts0041,
  testAssignmentLikeContexts0042,
  testAssignmentLikeContexts0043,
  testAssignmentLikeContexts0044,
  testAssignmentLikeContexts0045,
  testAssignmentLikeContexts0046,
  testAssignmentLikeContexts0047,
  testAssignmentLikeContexts0048,
  testAssignmentLikeContexts0049,
  testAssignmentLikeContexts0050,
  testAssignmentLikeContexts0051,
  testAssignmentLikeContexts0052,
  testAssignmentLikeContexts0053,
  testAssignmentLikeContexts0054,
  testAssignmentLikeContexts0055,
  testAssignmentLikeContexts0056,
  testAssignmentLikeContexts0057,
  testAssignmentLikeContexts0058,
  testAssignmentLikeContexts0059,
  testAssignmentLikeContexts0060,
  testAssignmentLikeContexts0061,
  testAssignmentLikeContexts0062,
  testAssignmentLikeContexts0063,
  testAssignmentLikeContexts0064,
  testAssignmentLikeContexts0065,
  testAssignmentLikeContexts0066,
  testAssignmentLikeContexts0067,
  testAssignmentLikeContexts0068,
  testAssignmentLikeContexts0069,
  testAssignmentLikeContexts0070,
  testAssignmentLikeContexts0071,
  testAssignmentLikeContexts0072,
  testAssignmentLikeContexts0073,
  testAssignmentLikeContexts0074,
  testAssignmentLikeContexts0075,
  testAssignmentLikeContexts0076,
  testAssignmentLikeContexts0077,
  testAssignmentLikeContexts0078,
  testAssignmentLikeContexts0079,
  testAssignmentLikeContexts0080,
  testAssignmentLikeContexts0081,
  testAssignmentLikeContexts0082,
  testAssignmentLikeContexts0083,
  testAssignmentLikeContexts0084,
  testAssignmentLikeContexts0085,
  testAssignmentLikeContexts0086,
  testAssignmentLikeContexts0087,
  testAssignmentLikeContexts0088,
  testAssignmentLikeContexts0089,
  testAssignmentLikeContexts0090,
  testAssignmentLikeContexts0091,
  testAssignmentLikeContexts0092,
  testAssignmentLikeContexts0093,
  testAssignmentLikeContexts0094,
  testAssignmentLikeContexts0095,
  testAssignmentLikeContexts0096,
  testAssignmentLikeContexts0097,
  testAssignmentLikeContexts0098,
  testAssignmentLikeContexts0099,
  testAssignmentLikeContexts0100,
  testAssignmentLikeContexts0101,
  testAssignmentLikeContexts0102,
  testAssignmentLikeContexts0103,
  testAssignmentLikeContexts0104,
  testAssignmentLikeContexts0105,
  testAssignmentLikeContexts0106,
  testAssignmentLikeContexts0107,
  testAssignmentLikeContexts0108,
  testAssignmentLikeContexts0109,
  testAssignmentLikeContexts0110,
  testAssignmentLikeContexts0111,
  testAssignmentLikeContexts0112,
  testAssignmentLikeContexts0113,
  testAssignmentLikeContexts0114,
  testAssignmentLikeContexts0115,
  testAssignmentLikeContexts0116,
  testAssignmentLikeContexts0117,
  testAssignmentLikeContexts0118,
  testAssignmentLikeContexts0119,
  testAssignmentLikeContexts0120,
  testAssignmentLikeContexts0121,
  testAssignmentLikeContexts0122,
  testAssignmentLikeContexts0123,
  testAssignmentLikeContexts0124,
  testAssignmentLikeContexts0125,
  testAssignmentLikeContexts0126,
  testAssignmentLikeContexts0127,
  testAssignmentLikeContexts0128,
  testAssignmentLikeContexts0129,
  testAssignmentLikeContexts0130,
  testAssignmentLikeContexts0131,
  testAssignmentLikeContexts0132,
  testAssignmentLikeContexts0133,
  testAssignmentLikeContexts0134,
  testAssignmentLikeContexts0135,
  testAssignmentLikeContexts0136,
  testAssignmentLikeContexts0137,
  testAssignmentLikeContexts0138,
  testAssignmentLikeContexts0139,
  testAssignmentLikeContexts0140,
  testAssignmentLikeContexts0141,
  testAssignmentLikeContexts0142,
  testAssignmentLikeContexts0143,
  testAssignmentLikeContexts0144,
  testAssignmentLikeContexts0145,
  testAssignmentLikeContexts0146,
  testAssignmentLikeContexts0147,
  testAssignmentLikeContexts0148
} from './assignmentlikecontextstestfunction/AssignmentLikeContextsTestFunc';

let concurrentNum: int = 1

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function AssignmentLikeContextsTest() {

  describe("AssignmentLikeContextsTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0100
     * @tc.name      concurrent_testAssignmentLikeContexts0001
     * @tc.desc      Assignment contexts allow using aliases: from 'Boolean' to 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0001'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0001)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0200
     * @tc.name      concurrent_testAssignmentLikeContexts0002
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Boolean' to 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0002'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0002)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0300
     * @tc.name      concurrent_testAssignmentLikeContexts0003
     * @tc.desc      Assignment contexts: Conversion from boolean to Boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0003'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0003)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0400
     * @tc.name      concurrent_testAssignmentLikeContexts0004
     * @tc.desc      Assignment contexts allow the use of conversion followed by a widening reference conversion: from 'boolean' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0004'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0004)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0500
     * @tc.name      concurrent_testAssignmentLikeContexts0005
     * @tc.desc      A widening reference conversion exists from any reference type S to any reference type T (S is subtype of T)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0005'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0005)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0600
     * @tc.name      concurrent_testAssignmentLikeContexts0006
     * @tc.desc      Widening reference conversion: Object[][] to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0006'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0006)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0700
     * @tc.name      concurrent_testAssignmentLikeContexts0007
     * @tc.desc      Assignment contexts allow conversion followed by a widening reference conversion (from 'boolean' to 'Object')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0007'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0007)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0800
     * @tc.name      concurrent_testAssignmentLikeContexts0008
     * @tc.desc      Assignment contexts allow the use of conversion followed by a widening reference conversion: from 'string' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0008'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0008)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0900
     * @tc.name      concurrent_testAssignmentLikeContexts0009
     * @tc.desc      A conversion from a type to that same type is permitted for any type: enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0009'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0009)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1000
     * @tc.name      concurrent_testAssignmentLikeContexts0010
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0010'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0010)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1100
     * @tc.name      concurrent_testAssignmentLikeContexts0011
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0011'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0011)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1200
     * @tc.name      concurrent_testAssignmentLikeContexts0012
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0012'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0012)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1300
     * @tc.name      concurrent_testAssignmentLikeContexts0013
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0013'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0013)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1400
     * @tc.name      concurrent_testAssignmentLikeContexts0014
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0014'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0014)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1500
     * @tc.name      concurrent_testAssignmentLikeContexts0015
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0015'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0015)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1600
     * @tc.name      concurrent_testAssignmentLikeContexts0016
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0016'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0016)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1700
     * @tc.name      concurrent_testAssignmentLikeContexts0017
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0017'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0017)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1800
     * @tc.name      concurrent_testAssignmentLikeContexts0018
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0018'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0018)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1900
     * @tc.name      concurrent_testAssignmentLikeContexts0019
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0019'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0019)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2000
     * @tc.name      concurrent_testAssignmentLikeContexts0020
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0020'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0020)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2100
     * @tc.name      concurrent_testAssignmentLikeContexts0021
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0021'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0021)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2200
     * @tc.name      concurrent_testAssignmentLikeContexts0022
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Long' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0022'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0022)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2300
     * @tc.name      concurrent_testAssignmentLikeContexts0023
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Long' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0023'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0023)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2400
     * @tc.name      concurrent_testAssignmentLikeContexts0024
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Float' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0024'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0024)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2500
     * @tc.name      concurrent_testAssignmentLikeContexts0025
     * @tc.desc      Assignment contexts allow using aliases: from 'Byte' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0025'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0025)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2600
     * @tc.name      concurrent_testAssignmentLikeContexts0026
     * @tc.desc      Assignment contexts allow using aliases: from 'Char' to 'char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0026'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0026)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2700
     * @tc.name      concurrent_testAssignmentLikeContexts0027
     * @tc.desc      Assignment contexts allow using aliases: from 'Short' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0027'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0027)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2800
     * @tc.name      concurrent_testAssignmentLikeContexts0028
     * @tc.desc      Assignment contexts allow using aliases: from 'Int' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0028'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0028)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2900
     * @tc.name      concurrent_testAssignmentLikeContexts0029
     * @tc.desc      Assignment contexts allow using aliases: from 'Long' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0029'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0029)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3000
     * @tc.name      concurrent_testAssignmentLikeContexts0030
     * @tc.desc      Assignment contexts allow using aliases: from 'Float' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0030'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0030)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3100
     * @tc.name      concurrent_testAssignmentLikeContexts0031
     * @tc.desc      Assignment contexts allow using aliases: from 'Double' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0031'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0031)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3200
     * @tc.name      concurrent_testAssignmentLikeContexts0032
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Byte' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0032'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0032)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3300
     * @tc.name      concurrent_testAssignmentLikeContexts0033
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Char' to 'char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0033'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0033)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3400
     * @tc.name      concurrent_testAssignmentLikeContexts0034
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Short' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0034'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0034)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3500
     * @tc.name      concurrent_testAssignmentLikeContexts0035
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Int' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0035'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0035)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3600
     * @tc.name      concurrent_testAssignmentLikeContexts0036
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Long' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0036'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0036)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3700
     * @tc.name      concurrent_testAssignmentLikeContexts0037
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Float' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0037'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0037)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3800
     * @tc.name      concurrent_testAssignmentLikeContexts0038
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Double' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0038'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0038)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3900
     * @tc.name      concurrent_testAssignmentLikeContexts0039
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0039'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0039)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4000
     * @tc.name      concurrent_testAssignmentLikeContexts0040
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0040'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0040)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4100
     * @tc.name      concurrent_testAssignmentLikeContexts0041
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0041'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0041)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4200
     * @tc.name      concurrent_testAssignmentLikeContexts0042
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0042'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0042)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4300
     * @tc.name      concurrent_testAssignmentLikeContexts0043
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0043'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0043)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4400
     * @tc.name      concurrent_testAssignmentLikeContexts0044
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0044'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0044)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4500
     * @tc.name      concurrent_testAssignmentLikeContexts0045
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0045'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0045)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4600
     * @tc.name      concurrent_testAssignmentLikeContexts0046
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0046'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0046)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4700
     * @tc.name      concurrent_testAssignmentLikeContexts0047
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0047'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0047)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4800
     * @tc.name      concurrent_testAssignmentLikeContexts0048
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0048'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0048)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4900
     * @tc.name      concurrent_testAssignmentLikeContexts0049
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0049'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0049)
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