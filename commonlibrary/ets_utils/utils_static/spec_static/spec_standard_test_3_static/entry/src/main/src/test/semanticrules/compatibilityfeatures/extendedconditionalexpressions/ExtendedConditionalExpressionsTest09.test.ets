/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../../../../hypium/index";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// File-level enum declarations for tests
enum Color { Red, Green, Blue }
enum TestSize { S, M, L }
enum Status { None, Active, Inactive }
enum Priority { Low = 0, Medium = 1, High = 2 }

export default function ExtendedConditionalExpressionsTest09():void {
  describe('ExtendedConditionalExpressionsTest09', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })


    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0312
     * @tc.desc      If statement type 2 variant 1 with falsy condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (null) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0313
     * @tc.desc      If statement type 2 variant 1 with falsy 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (0) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0314
     * @tc.desc      If statement type 2 variant 1 with falsy undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (undefined) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0315
     * @tc.desc      If statement type 2 variant 1 with falsy NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (Number.NaN) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0316
     * @tc.desc      If statement type 2 variant 1 with truthy 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (1) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0317
     * @tc.desc      If statement type 2 variant 1 with truthy true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (true) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0318
     * @tc.desc      If statement type 2 variant 1 with truthy -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (-1) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0319
     * @tc.desc      If statement type 2 variant 1 with truthy 'hello'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if ('hello') { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0320
     * @tc.desc      If statement type 2 variant 1 with truthy new Object()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object()
      let res: number = 0;
      if (obj) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0321
     * @tc.desc      If statement type 2 variant 1 with truthy 0x80.toByte()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let res: number = 0;
      if (v) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0322
     * @tc.desc      If statement type 2 variant 2 with falsy int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
      let res: number = 0
      if (v) {  // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0323
     * @tc.desc      If statement type 2 variant 2 with truthy int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
      let res: number = 0
      if (v) {  // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0324
     * @tc.desc      If statement type 2 truthy variant 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (1) {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0325
     * @tc.desc      If statement type 2 truthy variant 1 with 0x80.toByte()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let res: number = 0;
      if (v) {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0326
     * @tc.desc      If statement type 2 truthy variant 1 with true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (true) {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0327
     * @tc.desc      If statement type 2 truthy variant 1 with 'hello'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if ('hello') {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0328
     * @tc.desc      If statement type 2 truthy variant 1 with new Object()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()
      let res: number = 0;
      if (v) {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0329
     * @tc.desc      If statement type 2 truthy variant 1 with Number.POSITIVE_INFINITY
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (Number.POSITIVE_INFINITY) {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0330
     * @tc.desc      If statement type 2 truthy variant 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let res: number = 0;
      if (v) {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0331
     * @tc.desc      If statement type 2 truthy variant 2 with 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
      let res: number = 0;
      if (v) {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_NINE_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0332
     * @tc.desc      If statement type 2 truthy variant 2 with Long.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Long.MAX_VALUE
      let res: number = 0;
      if (v) {  // truthy
      } else {
        res = 1
      }
      expect(res).assertEqual(0);
    });

  })
}
