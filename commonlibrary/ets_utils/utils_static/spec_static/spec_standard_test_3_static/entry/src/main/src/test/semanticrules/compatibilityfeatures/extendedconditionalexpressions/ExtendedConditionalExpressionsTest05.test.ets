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

export default function ExtendedConditionalExpressionsTest05():void {
  describe('ExtendedConditionalExpressionsTest05', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0212
     * @tc.desc      Conditional expression with falsy value ("" + "")
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ("" + "") ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0213
     * @tc.desc      Conditional expression with falsy value ("" + "a")
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ("" + "a") ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0214
     * @tc.desc      Conditional expression with falsy value (0 - 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0 - 0) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0215
     * @tc.desc      Conditional expression with falsy value (0 * 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0 * 1) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0216
     * @tc.desc      Conditional expression with truthy value (1 + 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1 + 1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0217
     * @tc.desc      Conditional expression with truthy value (1 - 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1 - 0) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0218
     * @tc.desc      Conditional expression with truthy value (1 * 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1 * 1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0219
     * @tc.desc      Conditional expression with truthy value (1 / 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1 / 1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0220
     * @tc.desc      Conditional expression with truthy value (Int.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Int.MAX_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0221
     * @tc.desc      Conditional expression with truthy value (Int.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Int.MIN_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0222
     * @tc.desc      Conditional expression with truthy value (new Long(Long.MIN_VALUE))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Long(Long.MIN_VALUE)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0223
     * @tc.desc      Conditional expression with truthy value (new Long(Long.MAX_VALUE))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Long(Long.MAX_VALUE)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0224
     * @tc.desc      Conditional expression with truthy value (new Short(-1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Short(-1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0225
     * @tc.desc      Conditional expression with truthy value (new Byte(100))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Byte(100)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0226
     * @tc.desc      Conditional expression with truthy value (Float.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.POSITIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0227
     * @tc.desc      Conditional expression with truthy value (Float.NEGATIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.NEGATIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0228
     * @tc.desc      Conditional expression with truthy value (Float.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.MIN_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0229
     * @tc.desc      Conditional expression with truthy value (Double.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.POSITIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0230
     * @tc.desc      Conditional expression with truthy value (Double.NEGATIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.NEGATIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0231
     * @tc.desc      Conditional expression with truthy value (Double.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.MIN_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0232
     * @tc.desc      Conditional expression with truthy value (Color.Green)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Color.Green) ? 0 : 1  // truthy (value is 1)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0233
     * @tc.desc      Conditional expression with truthy value (Status.Active)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Status.Active) ? 0 : 1  // truthy (value is 1)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0234
     * @tc.desc      Conditional expression with truthy value (Priority.High)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Priority.High) ? 0 : 1  // truthy (value is 2)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0235
     * @tc.desc      Conditional expression with truthy value (new String("\u0000\u0000").substring(0, 1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new String("\u0000\u0000").substring(0, 1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0236
     * @tc.desc      Conditional expression with truthy value (new Char('A'))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Char(c'A')) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0237
     * @tc.desc      Conditional expression with truthy value (new Number(1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Number(1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0238
     * @tc.desc      Conditional expression with truthy value (new Boolean(true))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Boolean(true)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0239
     * @tc.desc      Conditional expression with truthy value (new Boolean(false))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Boolean(false)) ? 0 : 1  // falsy (ArkTS converts to underlying boolean value)
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0240
     * @tc.desc      Conditional expression with truthy value ({} as Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ({} as Object) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0241
     * @tc.desc      Conditional expression with truthy value ([1,2,3])
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ([1, 2, 3]) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0242
     * @tc.desc      Conditional expression with truthy value ("\u0000")
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ("\u0000") ? 0 : 1  // truthy (non-empty string)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0243
     * @tc.desc      Conditional expression with truthy value (0.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0.1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_3300
     * @tc.name    testConditionalExpression0244
     * @tc.desc      Conditional expression with truthy value (Number.MAX_SAFE_INTEGER)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Number.MAX_SAFE_INTEGER) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIVE_EXPRESSIONS_3400
     * @tc.name    testConditionalExpression0245
     * @tc.desc      Conditional expression with truthy value (BigInt(1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (BigInt(1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

  })
}
