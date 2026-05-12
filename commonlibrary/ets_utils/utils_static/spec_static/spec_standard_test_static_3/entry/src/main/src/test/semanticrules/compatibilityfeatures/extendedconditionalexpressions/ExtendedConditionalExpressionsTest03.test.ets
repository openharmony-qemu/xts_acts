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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15100
     * @tc.name      testForF10151
     * @tc.desc      For loop with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15200
     * @tc.name      testForF10152
     * @tc.desc      For loop with falsy condition (undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15300
     * @tc.name      testForF10153
     * @tc.desc      For loop with falsy condition (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15400
     * @tc.name      testForF10154
     * @tc.desc      For loop with falsy condition (-0.0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15500
     * @tc.name      testForF10155
     * @tc.desc      For loop with falsy condition (empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15600
     * @tc.name      testForF10156
     * @tc.desc      For loop with falsy condition (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15700
     * @tc.name      testForF10157
     * @tc.desc      For loop with falsy condition (NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15800
     * @tc.name      testForF10158
     * @tc.desc      For loop with falsy condition (Float.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_15900
     * @tc.name      testForF10159
     * @tc.desc      For loop with falsy condition (Double.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16000
     * @tc.name      testForF10160
     * @tc.desc      For loop with falsy condition (new Byte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForF10160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16100
     * @tc.name      testForT10161
     * @tc.desc      For loop with truthy condition (1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16200
     * @tc.name      testForT10162
     * @tc.desc      For loop with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16300
     * @tc.name      testForT10163
     * @tc.desc      For loop with truthy condition (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16400
     * @tc.name      testForT10164
     * @tc.desc      For loop with truthy condition (-1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16500
     * @tc.name      testForT10165
     * @tc.desc      For loop with truthy condition ('hello')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16600
     * @tc.name      testForT10166
     * @tc.desc      For loop with truthy condition (new Object())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16700
     * @tc.name      testForT10167
     * @tc.desc      For loop with truthy condition (Number.POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16800
     * @tc.name      testForT10168
     * @tc.desc      For loop with truthy condition (Long.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_16900
     * @tc.name      testForT10169
     * @tc.desc      For loop with truthy condition (1n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17000
     * @tc.name      testForT10170
     * @tc.desc      For loop with truthy condition (c' ')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17100
     * @tc.name      testForT10171
     * @tc.desc      For loop with truthy condition (empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17200
     * @tc.name      testForT10172
     * @tc.desc      For loop with truthy condition (TestSize.L)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForT10172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17300
     * @tc.name      testWhileF10173
     * @tc.desc      While loop with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileF10173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17400
     * @tc.name      testWhileF10174
     * @tc.desc      While loop with falsy condition (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileF10174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17500
     * @tc.name      testWhileF10175
     * @tc.desc      While loop with falsy condition (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileF10175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17600
     * @tc.name      testWhileF10176
     * @tc.desc      While loop with falsy condition (NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileF10176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17700
     * @tc.name      testWhileF10177
     * @tc.desc      While loop with falsy condition (new Byte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileF10177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17800
     * @tc.name      testWhileT10178
     * @tc.desc      While loop with truthy condition (1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileT10178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_17900
     * @tc.name      testWhileT10179
     * @tc.desc      While loop with truthy condition (0x80.toByte())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileT10179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_18000
     * @tc.name      testWhileT10180
     * @tc.desc      While loop with truthy condition (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileT10180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_18100
     * @tc.name      testWhileT10181
     * @tc.desc      While loop with truthy condition ('hello')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileT10181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_18200
     * @tc.name      testWhileT10182
     * @tc.desc      While loop with truthy condition (new Object())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileT10182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
