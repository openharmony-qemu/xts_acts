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

export default function ExtendedConditionalExpressionsTest04():void {
  describe('ExtendedConditionalExpressionsTest04', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0183
     * @tc.desc      Do-while loop with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null  // falsy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0184
     * @tc.desc      Do-while loop with falsy condition (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0  // falsy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0185
     * @tc.desc      Do-while loop with falsy condition (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = false  // falsy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0186
     * @tc.desc      Do-while loop with falsy condition (NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NaN  // falsy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0187
     * @tc.desc      Do-while loop with falsy condition (new Byte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Byte = new Byte()  // falsy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0188
     * @tc.desc      Do-while loop with truthy condition (1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1  // truthy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0189
     * @tc.desc      Do-while loop with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()  // truthy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0190
     * @tc.desc      Do-while loop with truthy condition (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = true  // truthy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0191
     * @tc.desc      Do-while loop with truthy condition ('hello')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'hello'  // truthy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0192
     * @tc.desc      Do-while loop with truthy condition (new Object())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()  // truthy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0193
     * @tc.desc      If statement with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (null) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0194
     * @tc.desc      If statement with falsy condition (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
      let res: number = 0
      if (v) {  // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0195
     * @tc.desc      If statement with falsy condition (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (false) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0196
     * @tc.desc      If statement with falsy condition (NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (Number.NaN) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0197
     * @tc.desc      If statement with falsy condition (undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (undefined) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0198
     * @tc.desc      If statement with falsy condition (empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if ('') { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0199
     * @tc.desc      If statement with falsy condition (new Byte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Byte = new Byte()
      let res: number = 0;
      if (v) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0200
     * @tc.desc      If statement with truthy condition (1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (1) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0201
     * @tc.desc      If statement with truthy condition (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (true) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0202
     * @tc.desc      If statement with truthy condition (-1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (-1) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0203
     * @tc.desc      If statement with truthy condition ('hello')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if ('hello') { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0204
     * @tc.desc      If statement with truthy condition (new Object())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object()
      let res: number = 0;
      if (obj) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0205
     * @tc.desc      If statement with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()
      let res: number = 0;
      if (v) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0206
     * @tc.desc      If statement with truthy condition (Number.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (Number.POSITIVE_INFINITY) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0207
     * @tc.desc      If statement with truthy condition (Long.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (Long.MAX_VALUE) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0208
     * @tc.desc      If statement with truthy condition (1n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (1n) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0209
     * @tc.desc      If statement with truthy condition (c' ')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (c' ') { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0210
     * @tc.desc      If statement with truthy condition (empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      let res: number = 0;
      if (arr) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FOUR_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0211
     * @tc.desc      If statement with truthy condition (TestSize.L)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (TestSize.L) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

  })
}
