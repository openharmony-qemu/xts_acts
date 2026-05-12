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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_21200
     * @tc.name      testCondF10212
     * @tc.desc      Conditional expression with falsy value ("" + "")
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondF10212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ("" + "") ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_21300
     * @tc.name      testCondF10213
     * @tc.desc      Conditional expression with falsy value ("" + "a")
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondF10213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ("" + "a") ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_21400
     * @tc.name      testCondF10214
     * @tc.desc      Conditional expression with falsy value (0 - 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondF10214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0 - 0) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_21500
     * @tc.name      testCondF10215
     * @tc.desc      Conditional expression with falsy value (0 * 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondF10215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0 * 1) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_21600
     * @tc.name      testCondT10216
     * @tc.desc      Conditional expression with truthy value (1 + 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1 + 1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_21700
     * @tc.name      testCondT10217
     * @tc.desc      Conditional expression with truthy value (1 - 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1 - 0) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_21800
     * @tc.name      testCondT10218
     * @tc.desc      Conditional expression with truthy value (1 * 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1 * 1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_21900
     * @tc.name      testCondT10219
     * @tc.desc      Conditional expression with truthy value (1 / 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1 / 1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22000
     * @tc.name      testCondT10220
     * @tc.desc      Conditional expression with truthy value (Int.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Int.MAX_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22100
     * @tc.name      testCondT10221
     * @tc.desc      Conditional expression with truthy value (Int.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Int.MIN_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22200
     * @tc.name      testCondT10222
     * @tc.desc      Conditional expression with truthy value (new Long(Long.MIN_VALUE))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Long(Long.MIN_VALUE)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22300
     * @tc.name      testCondT10223
     * @tc.desc      Conditional expression with truthy value (new Long(Long.MAX_VALUE))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Long(Long.MAX_VALUE)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22400
     * @tc.name      testCondT10224
     * @tc.desc      Conditional expression with truthy value (new Short(-1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Short(-1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22500
     * @tc.name      testCondT10225
     * @tc.desc      Conditional expression with truthy value (new Byte(100))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Byte(100)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22600
     * @tc.name      testCondT10226
     * @tc.desc      Conditional expression with truthy value (Float.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.POSITIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22700
     * @tc.name      testCondT10227
     * @tc.desc      Conditional expression with truthy value (Float.NEGATIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.NEGATIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22800
     * @tc.name      testCondT10228
     * @tc.desc      Conditional expression with truthy value (Float.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.MIN_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_22900
     * @tc.name      testCondT10229
     * @tc.desc      Conditional expression with truthy value (Double.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.POSITIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23000
     * @tc.name      testCondT10230
     * @tc.desc      Conditional expression with truthy value (Double.NEGATIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.NEGATIVE_INFINITY) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23100
     * @tc.name      testCondT10231
     * @tc.desc      Conditional expression with truthy value (Double.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.MIN_VALUE) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23200
     * @tc.name      testCondT10232
     * @tc.desc      Conditional expression with truthy value (Color.Green)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Color.Green) ? 0 : 1  // truthy (value is 1)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23300
     * @tc.name      testCondT10233
     * @tc.desc      Conditional expression with truthy value (Status.Active)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Status.Active) ? 0 : 1  // truthy (value is 1)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23400
     * @tc.name      testCondT10234
     * @tc.desc      Conditional expression with truthy value (Priority.High)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Priority.High) ? 0 : 1  // truthy (value is 2)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23500
     * @tc.name      testCondT10235
     * @tc.desc      Conditional expression with truthy value (new String("\u0000\u0000").substring(0, 1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new String("\u0000\u0000").substring(0, 1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23600
     * @tc.name      testCondT10236
     * @tc.desc      Conditional expression with truthy value (new Char('A'))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Char(c'A')) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23700
     * @tc.name      testCondT10237
     * @tc.desc      Conditional expression with truthy value (new Number(1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Number(1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23800
     * @tc.name      testCondT10238
     * @tc.desc      Conditional expression with truthy value (new Boolean(true))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Boolean(true)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_23900
     * @tc.name      testCondT10239
     * @tc.desc      Conditional expression with truthy value (new Boolean(false))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Boolean(false)) ? 0 : 1  // falsy (ArkTS converts to underlying boolean value)
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24000
     * @tc.name      testCondT10240
     * @tc.desc      Conditional expression with truthy value ({} as Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ({} as Object) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24100
     * @tc.name      testCondT10241
     * @tc.desc      Conditional expression with truthy value ([1,2,3])
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ([1, 2, 3]) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24200
     * @tc.name      testCondT10242
     * @tc.desc      Conditional expression with truthy value ("\u0000")
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ("\u0000") ? 0 : 1  // truthy (non-empty string)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24300
     * @tc.name      testCondT10243
     * @tc.desc      Conditional expression with truthy value (0.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0.1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24400
     * @tc.name      testCondT10244
     * @tc.desc      Conditional expression with truthy value (Number.MAX_SAFE_INTEGER)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Number.MAX_SAFE_INTEGER) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24500
     * @tc.name      testCondT10245
     * @tc.desc      Conditional expression with truthy value (BigInt(1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCondT10245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (BigInt(1)) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

  })
}
