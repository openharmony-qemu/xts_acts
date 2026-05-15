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

export default function ExtendedConditionalExpressionsTest07():void {
  describe('ExtendedConditionalExpressionsTest07', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0261
     * @tc.desc      Conditional expression type 2 with falsy Object|null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0262
     * @tc.desc      Conditional expression type 2 with falsy int 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0263
     * @tc.desc      Conditional expression type 2 with falsy undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|undefined = undefined
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0264
     * @tc.desc      Conditional expression type 2 with falsy empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ''
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0265
     * @tc.desc      Conditional expression type 2 with falsy NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NaN
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0266
     * @tc.desc      Conditional expression type 2 with falsy -0.0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -0.0
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0267
     * @tc.desc      Conditional expression type 2 with truthy byte 0x80
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0268
     * @tc.desc      Conditional expression type 2 with truthy 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0269
     * @tc.desc      Conditional expression type 2 with truthy 'hello'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'hello'
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0270
     * @tc.desc      Conditional expression type 2 with truthy new Object()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0271
     * @tc.desc      Conditional expression type 2 truthy path with falsy value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0272
     * @tc.desc      Conditional expression type 2 truthy path with falsy 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
      let res: number = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0273
     * @tc.desc      Conditional expression type 2 truthy path with truthy value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0274
     * @tc.desc      Conditional expression type 2 truthy path with truthy 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0275
     * @tc.desc      Conditional expression type 2 truthy path with truthy -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -1
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0276
     * @tc.desc      Conditional expression type 2 truthy path with truthy new Object()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0277
     * @tc.desc      Conditional expression type 2 truthy path with truthy Number.POSITIVE_INFINITY
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.POSITIVE_INFINITY
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0278
     * @tc.desc      Conditional expression type 2 truthy path with truthy Long.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Long.MAX_VALUE
      let res: number = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0279
     * @tc.desc      For loop type 2 with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0280
     * @tc.desc      For loop type 2 with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let retcode: number = 0
      let loopCount: number = 0

      for (let i: number = 0; v; i++) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0281
     * @tc.desc      While loop type 2 with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null
      let retcode: number = 0

      while (v) {  // falsy
        if (retcode == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0282
     * @tc.desc      While loop type 2 with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let loopCount: number = 0

      while (v) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0283
     * @tc.desc      Do-while loop type 2 with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0284
     * @tc.desc      Do-while loop type 2 with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0285
     * @tc.desc      If statement type 2 with falsy condition (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
      let res: number = 0
      if (v) {  // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0286
     * @tc.desc      If statement type 2 with truthy condition (1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
      let res: number = 0
      if (v) {  // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0287
     * @tc.desc      If statement type 2 with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let res: number = 0
      if (v) {  // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0288
     * @tc.desc      If statement type 2 with truthy condition (new Object())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()
      let res: number = 0
      if (v) {  // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0289
     * @tc.desc      If statement type 2 with truthy condition ('hello')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'hello'
      let res: number = 0
      if (v) {  // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVEN_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0290
     * @tc.desc      If statement type 2 with truthy condition (Number.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.POSITIVE_INFINITY
      let res: number = 0
      if (v) {  // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

  })
}
