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

export default function ExtendedConditionalExpressionsTest03():void {
  describe('ExtendedConditionalExpressionsTest03', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0151
     * @tc.desc      For loop with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0152
     * @tc.desc      For loop with falsy condition (undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|undefined = undefined
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0153
     * @tc.desc      For loop with falsy condition (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0154
     * @tc.desc      For loop with falsy condition (-0.0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -0.0
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0155
     * @tc.desc      For loop with falsy condition (empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ''
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0156
     * @tc.desc      For loop with falsy condition (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = false
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0157
     * @tc.desc      For loop with falsy condition (NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NaN
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0158
     * @tc.desc      For loop with falsy condition (Float.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Float.NaN
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0159
     * @tc.desc      For loop with falsy condition (Double.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Double.NaN
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0160
     * @tc.desc      For loop with falsy condition (new Byte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Byte = new Byte()
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0161
     * @tc.desc      For loop with truthy condition (1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0162
     * @tc.desc      For loop with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0163
     * @tc.desc      For loop with truthy condition (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = true
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0164
     * @tc.desc      For loop with truthy condition (-1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -1
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0165
     * @tc.desc      For loop with truthy condition ('hello')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'hello'
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0166
     * @tc.desc      For loop with truthy condition (new Object())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0167
     * @tc.desc      For loop with truthy condition (Number.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.POSITIVE_INFINITY
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0168
     * @tc.desc      For loop with truthy condition (Long.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Long.MAX_VALUE
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0169
     * @tc.desc      For loop with truthy condition (1n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 1n
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0170
     * @tc.desc      For loop with truthy condition (c' ')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: char = c' '
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0171
     * @tc.desc      For loop with truthy condition (empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number[] = []
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0172
     * @tc.desc      For loop with truthy condition (TestSize.L)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: TestSize = TestSize.L
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0173
     * @tc.desc      While loop with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0174
     * @tc.desc      While loop with falsy condition (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0175
     * @tc.desc      While loop with falsy condition (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = false
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0176
     * @tc.desc      While loop with falsy condition (NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NaN
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0177
     * @tc.desc      While loop with falsy condition (new Byte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Byte = new Byte()
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0178
     * @tc.desc      While loop with truthy condition (1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0179
     * @tc.desc      While loop with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0180
     * @tc.desc      While loop with truthy condition (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = true
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0181
     * @tc.desc      While loop with truthy condition ('hello')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'hello'
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_THREE_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0182
     * @tc.desc      While loop with truthy condition (new Object())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()
      let loopCount: number = 0

      while (v) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

  })
}
