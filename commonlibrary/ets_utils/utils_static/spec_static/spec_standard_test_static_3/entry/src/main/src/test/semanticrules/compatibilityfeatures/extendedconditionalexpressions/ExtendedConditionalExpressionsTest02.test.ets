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

class TestContainer {
  public value: Object|null = null;
}

function addNumbers(a: number, b: number): number {
  return a + b;
}

// File-level enum declarations for tests
enum Color { Red, Green, Blue }
enum TestSize { S, M, L }
enum Status { None, Active, Inactive }
enum Priority { Low = 0, Medium = 1, High = 2 }

export default function ExtendedConditionalExpressionsTest02():void {
  describe('ExtendedConditionalExpressionsTest02', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0101
     * @tc.desc      Conditional expression with falsy value (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (null) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0102
     * @tc.desc      Conditional expression with falsy value (undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (undefined) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0103
     * @tc.desc      Conditional expression with falsy value (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0104
     * @tc.desc      Conditional expression with falsy value (-0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (-0.0) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0105
     * @tc.desc      Conditional expression with falsy value (empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ('') ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0106
     * @tc.desc      Conditional expression with falsy value (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (false) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0107
     * @tc.desc      Conditional expression with falsy value (NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Number.NaN) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0108
     * @tc.desc      Conditional expression with falsy value (Float.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.NaN) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0109
     * @tc.desc      Conditional expression with falsy value (Double.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.NaN) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0110
     * @tc.desc      Conditional expression with falsy value (new Byte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Byte()) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0111
     * @tc.desc      Conditional expression with falsy value (new Short())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Short()) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0112
     * @tc.desc      Conditional expression with falsy value (new Long())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Long()) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0113
     * @tc.desc      Conditional expression with falsy value (0n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0n) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0114
     * @tc.desc      Conditional expression with falsy value (c'\u0000')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (c'\u0000') ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0115
     * @tc.desc      Conditional expression with falsy value (null char string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new String("\u0000\u0000").substring(0, 0)) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0116
     * @tc.desc      Conditional expression with falsy value (new Number(NaN))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Number(Number.NaN)) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0117
     * @tc.desc      Conditional expression with falsy value (new Number(0))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Number(0)) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0118
     * @tc.desc      Conditional expression with falsy value (new Char('\u0000'))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Char(c'\u0000')) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0119
     * @tc.desc      Conditional expression with falsy value (Object|null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null  // falsy
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0120
     * @tc.desc      Conditional expression with falsy value (new byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Byte()) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0121
     * @tc.desc      Conditional expression with truthy value (1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0122
     * @tc.desc      Conditional expression with truthy value (0x7F.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0x7F.toByte()) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0123
     * @tc.desc      Conditional expression with truthy value (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (true) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0124
     * @tc.desc      Conditional expression with truthy value (-1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (-1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0125
     * @tc.desc      Conditional expression with truthy value (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0x80.toByte()) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0126
     * @tc.desc      Conditional expression with truthy value ('hello')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ('hello') ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0127
     * @tc.desc      Conditional expression with truthy value (42.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (42.5) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0128
     * @tc.desc      Conditional expression with truthy value (new Short(-1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Short(-1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0129
     * @tc.desc      Conditional expression with truthy value (Long.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Long.MAX_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0130
     * @tc.desc      Conditional expression with truthy value (Float.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.MAX_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0131
     * @tc.desc      Conditional expression with truthy value (Double.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.MAX_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0132
     * @tc.desc      Conditional expression with truthy value (1n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1n) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3300
     * @tc.name    testConditionalExpression0133
     * @tc.desc      Conditional expression with truthy value (c' ')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (c' ') ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3400
     * @tc.name    testConditionalExpression0134
     * @tc.desc      Conditional expression with truthy value (new Number(1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Number(1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3500
     * @tc.name    testConditionalExpression0135
     * @tc.desc      Conditional expression with truthy value (new Char('A'))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Char(c'A')) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3600
     * @tc.name    testConditionalExpression0136
     * @tc.desc      Conditional expression with truthy value (new Object())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object()
      let res: number = obj ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3700
     * @tc.name    testConditionalExpression0137
     * @tc.desc      Conditional expression with truthy value (Number.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Number.POSITIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3800
     * @tc.name    testConditionalExpression0138
     * @tc.desc      Conditional expression with truthy value (Number.NEGATIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Number.NEGATIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_3900
     * @tc.name    testConditionalExpression0139
     * @tc.desc      Conditional expression with truthy value (Number.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Number.MIN_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4000
     * @tc.name    testConditionalExpression0140
     * @tc.desc      Conditional expression with truthy value (Number.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Number.MAX_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4100
     * @tc.name    testConditionalExpression0141
     * @tc.desc      Conditional expression with truthy value (Long.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Long.MIN_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4200
     * @tc.name    testConditionalExpression0142
     * @tc.desc      Conditional expression with truthy value (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()  // truthy
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4300
     * @tc.name    testConditionalExpression0143
     * @tc.desc      Conditional expression with truthy value (non-empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1]
      let res: number = arr ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4400
     * @tc.name    testConditionalExpression0144
     * @tc.desc      Conditional expression with truthy value (empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      let res: number = arr ? 0 : 1  // truthy (array is always truthy)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4500
     * @tc.name    testConditionalExpression0145
     * @tc.desc      Conditional expression with truthy value (non-null object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = {} as Object
      let res: number = obj ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4600
     * @tc.name    testConditionalExpression0146
     * @tc.desc      Conditional expression with truthy value (Boolean(true))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Boolean(true)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4700
     * @tc.name    testConditionalExpression0147
     * @tc.desc      Conditional expression with truthy value (Boolean(false))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Boolean(false)) ? 0 : 1  // falsy (ArkTS converts to underlying boolean value)
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4800
     * @tc.name    testConditionalExpression0148
     * @tc.desc      Conditional expression with truthy value (TestSize.L)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (TestSize.L) ? 0 : 1  // truthy (value is 2)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_4900
     * @tc.name    testConditionalExpression0149
     * @tc.desc      Conditional expression with truthy value (Priority.Medium)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Priority.Medium) ? 0 : 1  // truthy (value is 1)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWO_EXPRESSIONS_5000
     * @tc.name    testConditionalExpression0150
     * @tc.desc      Conditional expression with truthy value (123n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (123n) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

  })
}
