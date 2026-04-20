/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium";

// 0100
enum TestEnum0100 {
  One = -17
}
// 0200
enum TestEnum0200 {
  One = -301
}
// 0300
enum TestEnum0300 {
  One = -3001
}
// 0400
enum TestEnum0400 {
  One = -50001
}
// 0500
enum TestEnum0500 {
  One = 15
}
// 0600
enum TestEnum0600 {
  One = 299
}
// 0700
enum TestEnum0700 {
  One = 2999
}
// 0800
enum TestEnum0800 {
  One = 49999
}
// 0900
enum TestEnum0900 {
  One = "value: 2"
}
// 1000
enum TestEnum1000 {
  One = "value: 15"
}
// 1100
enum TestEnum1100 {
  One = "value: 15"
}
// 1200
enum TestEnum1200 {
  One = "value: 13"
}
// 1300
enum TestEnum1300 {
  One = "value: 2"
}
// 1400
enum TestEnum1400 {
  One = "value: 15"
}
// 1500
enum TestEnum1500 {
  One = "value: 13"
}
// 1600
enum TestEnum1600 {
  One = "value: 2"
}
// 1700
enum TestEnum1700 {
  One = "value: 15"
}
// 1800
enum TestEnum1800 {
  One = "value: 13"
}
// 1900
enum TestEnum1900 {
  One = "value: 13"
}
// 2000
enum TestEnum2000 {
  One = "value: 2"
}
// 2100
enum TestEnum2100 {
  One = "value: 15"
}
// 2200
enum TestEnum2200 {
  One = "value: 13"
}
// 2300
enum TestEnum2300 {
  One = "value: 2"
}
// 2400
enum TestEnum2400 {
  One = "value: 15"
}
// 2500
enum TestEnum2500 {
  One = "value: 13"
}
// 2600
enum TestEnum2600 {
  One = "value: 2"
}
// 2700
enum TestEnum2700 {
  One = 260
}
// 2800
enum TestEnum2800 {
  One = 2
}
// 2900
enum TestEnum2900 {
  One = 50060
}
// 3000
enum TestEnum3000 {
  One = 5000
}
// 3100
enum TestEnum3100 {
  One = 6
}
// 3200
enum TestEnum3200 {
  One = 50016
}
// 3300
enum TestEnum3300 {
  One = 49996
}
// 3400
enum TestEnum3400 {
  One = 1232
}
// 3500
enum TestEnum3500 {
  One = "12.32"
}
// 3600
enum TestEnum3600 {
  One = "3.199997"
}
// 3700
enum TestEnum3700 {
  One = "133.2"
}
// 3800
enum TestEnum3800 {
  One = "113.2"
}
// 3900
enum TestEnum3900 {
  One = 6
}
// 4000
enum TestEnum4000 {
  One = 50519
}
// 4100
enum TestEnum4100 {
  One = "505.18999999999994"
}
// 4200
enum TestEnum4200 {
  One = "1.8999999999996362"
}
// 4300
enum TestEnum4300 {
  One = "5061.9"
}
// 4400
enum TestEnum4400 {
  One = "5041.9"
}
// 4500
enum TestEnum4500 {
  One = 36
}
// 4600
enum TestEnum4600 {
  One = 16
}
// 4700
enum TestEnum4700 {
  One = 2600
}
// 4800
enum TestEnum4800 {
  One = 26
}
// 4900
enum TestEnum4900 {
  One = 0
}
// 5000
enum TestEnum5000 {
  One = 270
}
// 5100
enum TestEnum5100 {
  One = 250
}
// 5200
enum TestEnum5200 {
  One = "yes 10"
}
// 5300
enum TestEnum5300 {
  One = "no 260"
}
// 5400
enum TestEnum5400 {
  One = "yes 26.3"
}
// 5500
enum TestEnum5500 {
  One = "no -30"
}
// 5600
enum TestEnum5600 {
  One = "no -260"
}
// 5700
enum TestEnum5700 {
  One = "yes 26"
}
// 5800
enum TestEnum5800 {
  One = "yes 26"
}
// 5900
enum TestEnum5900 {
  One = "yes 26.3"
}
// 6000
enum TestEnum6000 {
  One = "yes p"
}
// 6100
enum TestEnum6100 {
  One = "yes p"
}
// 6200
enum TestEnum6200 {
  One = "yes 26.7"
}
// 6300
enum TestEnum6300 {
  One = 101
}
// 6400
enum TestEnum6400 {
  One = 101
}
// 6500
enum TestEnum6500 {
  One = 101
}
// 6600
enum TestEnum6600 {
  One = 101
}
// 6700
enum TestEnum6700 {
  One = 101
}
// 6800
enum TestEnum6800 {
  One = 101
}
// 6900
enum TestEnum6900 {
  One = 16
}
// 7000
enum TestEnum7000 {
  One = 300
}
// 7100
enum TestEnum7100 {
  One = 3000
}
// 7200
enum TestEnum7200 {
  One = 50000
}
// 7300
enum TestEnum7300 {
  One = "120.2"
}
// 7400
enum TestEnum7400 {
  One = "5050.9"
}
// 7500
enum TestEnum7500 {
  One = 24
}
// 7600
enum TestEnum7600 {
  One = 3
}
// 7700
enum TestEnum7700 {
  One = -32
}
// 7800
enum TestEnum7800 {
  One = 536870879
}
// 7900
enum TestEnum7900 {
  One = 2464
}
// 8000
enum TestEnum8000 {
  One = 376
}
// 8100
enum TestEnum8100 {
  One = 376
}
// 8200
enum TestEnum8200 {
  One = -2464
}
// 8300
enum TestEnum8300 {
  One = -376
}
// 8400
enum TestEnum8400 {
  One = 40048
}
// 8500
enum TestEnum8500 {
  One = 6250
}
// 8600
enum TestEnum8600 {
  One = 6250
}
// 8700
enum TestEnum8700 {
  One = 3
}
// 8800
enum TestEnum8800 {
  One = -40048
}
// 8900
enum TestEnum8900 {
  One = -6251
}
// 9000
enum TestEnum9000 {
  One = 984
}
// 9100
enum TestEnum9100 {
  One = 15
}
// 9200
enum TestEnum9200 {
  One = 15
}
// 9300
enum TestEnum9300 {
  One = -984
}
// 9400
enum TestEnum9400 {
  One = -16
}
// 9500
enum TestEnum9500 {
  One = 40408
}
// 9600
enum TestEnum9600 {
  One = 631
}
// 9700
enum TestEnum9700 {
  One = 631
}
// 9800
enum TestEnum9800 {
  One = -24
}
// 9900
enum TestEnum9900 {
  One = -40408
}
// 10000
enum TestEnum10000 {
  One = -632
}
// 10100
enum TestEnum10100 {
  One = -4
}
// 10200
enum TestEnum10200 {
  One = 536870908
}
// 10300
enum TestEnum10300 {
  One = 64
}
// 10400
enum TestEnum10400 {
  One = 32
}
// 10500
enum TestEnum10500 {
  One = 32
}
// 10600
enum TestEnum10600 {
  One = -64
}
// 10700
enum TestEnum10700 {
  One = "value = 101"
}
// 10800
enum TestEnum10800 {
  One = "value = 101"
}
// 10900
enum TestEnum10900 {
  One = "value = 101"
}
// 11000
enum TestEnum11000 {
  One = "value = 101"
}
// 11100
enum TestEnum11100 {
  One = "value = 10.1"
}
// 11200
enum TestEnum11200 {
  One = "value = 101.5"
}
// 11300
enum TestEnum11300 {
  One = -16
}
// 11400
enum TestEnum11400 {
  One = -300
}
// 11500
enum TestEnum11500 {
  One = "120.2"
}
// 11600
enum TestEnum11600 {
  One = "5050.9"
}
// 11700
enum TestEnum11700 {
  One = -3000
}
// 11800
enum TestEnum11800 {
  One = -50000
}
// 11900
enum TestEnum11900 {
  One = "-120.2"
}
// 12000
enum TestEnum12000 {
  One = "-5050.9"
}
// 12100
enum TestEnum12100 {
  One = 16
}
// 12200
enum TestEnum12200 {
  One = 300
}
// 12300
enum TestEnum12300 {
  One = 3000
}
// 12400
enum TestEnum12400 {
  One = 50000
}
// 12500
enum TestEnum12500 {
  One = 16
}
// 12600
enum TestEnum12600 {
  One = 300
}
// 12700
enum TestEnum12700 {
  One = "-120.2"
}
// 12800
enum TestEnum12800 {
  One = "-5050.9"
}
// 12900
enum TestEnum12900 {
  One = 3000
}
// 13000
enum TestEnum13000 {
  One = 50000
}
// 13100
enum TestEnum13100 {
  One = "120.2"
}
// 13200
enum TestEnum13200 {
  One = "5050.9"
}
// 13300
enum TestEnum13300 {
  One = -16
}
// 13400
enum TestEnum13400 {
  One = -300
}
// 13500
enum TestEnum13500 {
  One = -3000
}
// 13600
enum TestEnum13600 {
  One = -50000
}

let testValue: byte = 16
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ConstantExpressionCheckEnum() {
  describe("ConstantExpressionCheckEnum", () => {
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
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0100
     * @tc.name      testConstantExpressionCheckEnum0001
     * @tc.desc      Constant expression with bitwise complement as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValue: byte = -17
      expect(TestEnum0100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0200
     * @tc.name      testConstantExpressionCheckEnum0002
     * @tc.desc      Constant expression with bitwise complement as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: short = -301
      expect(TestEnum0200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0300
     * @tc.name      testConstantExpressionCheckEnum0003
     * @tc.desc      Constant expression with bitwise complement as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: int = -3001
      expect(TestEnum0300.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0400
     * @tc.name      testConstantExpressionCheckEnum0004
     * @tc.desc      Constant expression with bitwise complement as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: long = -50001
      expect(TestEnum0400.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0500
     * @tc.name      testConstantExpressionCheckEnum0005
     * @tc.desc      Constant expression with bitwise complement as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: byte = 15
      expect(TestEnum0500.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0600
     * @tc.name      testConstantExpressionCheckEnum0006
     * @tc.desc      Constant expression with bitwise complement as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: short = 299
      expect(TestEnum0600.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0700
     * @tc.name      testConstantExpressionCheckEnum0007
     * @tc.desc      Constant expression with bitwise complement as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: int = 2999
      expect(TestEnum0700.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0800
     * @tc.name      testConstantExpressionCheckEnum0008
     * @tc.desc      Constant expression with bitwise complement as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: long = 49999
      expect(TestEnum0800.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_0900
     * @tc.name      testConstantExpressionCheckEnum0009
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 10
      const testValue: string = "value: " + (value1 & 7)
      expect(TestEnum0900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1000
     * @tc.name      testConstantExpressionCheckEnum0010
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 10
      const testValue: string = "value: " + (value1 | 7)
      expect(TestEnum1000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1100
     * @tc.name      testConstantExpressionCheckEnum0011
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 10
      const testValue: string = "value: " + (value1 | 7)
      expect(TestEnum1100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1200
     * @tc.name      testConstantExpressionCheckEnum0012
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 10
      const testValue: string = "value: " + (value1 ^ 7)
      expect(TestEnum1200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1300
     * @tc.name      testConstantExpressionCheckEnum0013
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.5f
      const testValue: string = "value: " + (value1 & 7.0f)
      expect(TestEnum1300.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1400
     * @tc.name      testConstantExpressionCheckEnum0014
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.5f
      const testValue: string = "value: " + (value1 | 7.0f)
      expect(TestEnum1400.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1500
     * @tc.name      testConstantExpressionCheckEnum0015
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.5f
      const testValue: string = "value: " + (value1 ^ 7.0f)
      expect(TestEnum1500.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1600
     * @tc.name      testConstantExpressionCheckEnum0016
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 10.9
      const testValue: string = "value: " + (value1 & 7.1)
      expect(TestEnum1600.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1700
     * @tc.name      testConstantExpressionCheckEnum0017
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 10.9
      const testValue: string = "value: " + (value1 | 7.1)
      expect(TestEnum1700.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1800
     * @tc.name      testConstantExpressionCheckEnum0018
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 10.9
      const testValue: string = "value: " + (value1 ^ 7.1)
      expect(TestEnum1800.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_1900
     * @tc.name      testConstantExpressionCheckEnum0019
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 10
      const testValue: string = "value: " + (value1 ^ 7)
      expect(TestEnum1900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2000
     * @tc.name      testConstantExpressionCheckEnum0020
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 10
      const testValue: string = "value: " + (value1 & 7)
      expect(TestEnum2000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2100
     * @tc.name      testConstantExpressionCheckEnum0021
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 10
      const testValue: string = "value: " + (value1 | 7)
      expect(TestEnum2100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2200
     * @tc.name      testConstantExpressionCheckEnum0022
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 10
      const testValue: string = "value: " + (value1 ^ 7)
      expect(TestEnum2200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2300
     * @tc.name      testConstantExpressionCheckEnum0023
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const testValue: string = "value: " + (value1 & 7)
      expect(TestEnum2300.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2400
     * @tc.name      testConstantExpressionCheckEnum0024
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const testValue: string = "value: " + (value1 | 7)
      expect(TestEnum2400.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2500
     * @tc.name      testConstantExpressionCheckEnum0025
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const testValue: string = "value: " + (value1 ^ 7)
      expect(TestEnum2500.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2600
     * @tc.name      testConstantExpressionCheckEnum0026
     * @tc.desc      Constant bitwise expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 10
      const testValue: string = "value: " + (value1 & 7)
      expect(TestEnum2600.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2700
     * @tc.name      testConstantExpressionCheckEnum0027
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 26
      const value2: int = 10
      const testValue = 260
      expect(TestEnum2700.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2800
     * @tc.name      testConstantExpressionCheckEnum0028
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 26
      const value2: int = 10
      const testValue = 2
      expect(TestEnum2800.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_2900
     * @tc.name      testConstantExpressionCheckEnum0029
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 5006
      const value2: int = 10
      const testValue = 50060
      expect(TestEnum2900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3000
     * @tc.name      testConstantExpressionCheckEnum0030
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 50006
      const value2: int = 10
      const testValue = 5000
      expect(TestEnum3000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3100
     * @tc.name      testConstantExpressionCheckEnum0031
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 50006
      const value2: int = 10
      const testValue = 6
      expect(TestEnum3100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3200
     * @tc.name      testConstantExpressionCheckEnum0032
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 50006
      const value2: int = 10
      const testValue = 50016
      expect(TestEnum3200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3300
     * @tc.name      testConstantExpressionCheckEnum0033
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 50006
      const value2: int = 10
      const testValue = 49996
      expect(TestEnum3300.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3400
     * @tc.name      testConstantExpressionCheckEnum0034
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const testValue = 1232
      expect(TestEnum3400.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3500
     * @tc.name      testConstantExpressionCheckEnum0035
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const testValue = 12.32
      expect(TestEnum3500.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3600
     * @tc.name      testConstantExpressionCheckEnum0036
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const testValue = value1%value2
      expect(TestEnum3600.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3700
     * @tc.name      testConstantExpressionCheckEnum0037
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const testValue = 133.2
      expect(TestEnum3700.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3800
     * @tc.name      testConstantExpressionCheckEnum0038
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const testValue = 113.2
      expect(TestEnum3800.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_3900
     * @tc.name      testConstantExpressionCheckEnum0039
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 26
      const value2: int = 10
      const testValue = 6
      expect(TestEnum3900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4000
     * @tc.name      testConstantExpressionCheckEnum0040
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 5051.9
      const value2: int = 10
      const testValue = 50519
      expect(TestEnum4000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4100
     * @tc.name      testConstantExpressionCheckEnum0041
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 5051.9
      const value2: int = 10
      const testValue = 5051.9/10
      expect(TestEnum4100.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4200
     * @tc.name      testConstantExpressionCheckEnum0042
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 5051.9
      const value2: int = 10
      const testValue = value1%value2
      expect(TestEnum4200.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4300
     * @tc.name      testConstantExpressionCheckEnum0043
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 5051.9
      const value2: int = 10
      const testValue = 5061.9
      expect(TestEnum4300.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4400
     * @tc.name      testConstantExpressionCheckEnum0044
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 5051.9
      const value2: int = 10
      const testValue = 5041.9
      expect(TestEnum4400.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4500
     * @tc.name      testConstantExpressionCheckEnum0045
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 26
      const value2: int = 10
      const testValue = 36
      expect(TestEnum4500.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4600
     * @tc.name      testConstantExpressionCheckEnum0046
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 26
      const value2: int = 10
      const testValue = 16
      expect(TestEnum4600.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4700
     * @tc.name      testConstantExpressionCheckEnum0047
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 260
      const value2: int = 10
      const testValue = 2600
      expect(TestEnum4700.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4800
     * @tc.name      testConstantExpressionCheckEnum0048
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 260
      const value2: int = 10
      const testValue = 26
      expect(TestEnum4800.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_4900
     * @tc.name      testConstantExpressionCheckEnum0049
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 260
      const value2: int = 10
      const testValue = 0
      expect(TestEnum4900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5000
     * @tc.name      testConstantExpressionCheckEnum0050
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 260
      const value2: int = 10
      const testValue = 270
      expect(TestEnum5000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5100
     * @tc.name      testConstantExpressionCheckEnum0051
     * @tc.desc      Constant expression with mathematical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 260
      const value2: int = 10
      const testValue = 250
      expect(TestEnum5100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5200
     * @tc.name      testConstantExpressionCheckEnum0052
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 10
      const decision: boolean = value1 < 102.1f
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum5200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5300
     * @tc.name      testConstantExpressionCheckEnum0053
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = 260
      const decision: boolean = value1 <= 25
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum5300.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5400
     * @tc.name      testConstantExpressionCheckEnum0054
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 26.3
      const decision: boolean = value1 == 26.3
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum5400.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5500
     * @tc.name      testConstantExpressionCheckEnum0055
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = -30
      const decision: boolean = value1 >= 0
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum5500.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5600
     * @tc.name      testConstantExpressionCheckEnum0056
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = -260
      const decision: boolean = value1 == -259
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum5600.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5700
     * @tc.name      testConstantExpressionCheckEnum0057
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 26.0f
      const decision: boolean = value1 == 26.0f
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum5700.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5800
     * @tc.name      testConstantExpressionCheckEnum0058
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 26.0
      const decision: boolean = value1 == 26
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum5800.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_5900
     * @tc.name      testConstantExpressionCheckEnum0059
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: number = 26.3
      const decision: boolean = value1 == 26.3
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum5900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6000
     * @tc.name      testConstantExpressionCheckEnum0060
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: string = "p"
      const decision: boolean = value1 == "p"
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum6000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6100
     * @tc.name      testConstantExpressionCheckEnum0061
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: string = "p"
      const decision: boolean = value1 >= "W"
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum6100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6200
     * @tc.name      testConstantExpressionCheckEnum0062
     * @tc.desc      Constant expression with logical calculations as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 26.7f
      const decision: boolean = value1 == 26.7f
      const testValue: string = decision ? "yes " + value1 : "no " + value1
      expect(TestEnum6200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6300
     * @tc.name      testConstantExpressionCheckEnum0063
     * @tc.desc      Constant expression numeric chain initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const const1: byte = 101
      const testValue = const1
      expect(TestEnum6300.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6400
     * @tc.name      testConstantExpressionCheckEnum0064
     * @tc.desc      Constant expression numeric chain initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const const1: byte = 101
      const testValue: short = const1
      expect(TestEnum6400.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6500
     * @tc.name      testConstantExpressionCheckEnum0065
     * @tc.desc      Constant expression numeric chain initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const const1: byte = 101
      const testValue: int = const1
      expect(TestEnum6500.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6600
     * @tc.name      testConstantExpressionCheckEnum0066
     * @tc.desc      Constant expression numeric chain initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const const1: short = 101
      const testValue: short = const1
      expect(TestEnum6600.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6700
     * @tc.name      testConstantExpressionCheckEnum0067
     * @tc.desc      Constant expression numeric chain initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const const1: short = 101
      const testValue: int = const1
      expect(TestEnum6700.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6800
     * @tc.name      testConstantExpressionCheckEnum0068
     * @tc.desc      Constant expression numeric chain initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const const1: int = 101
      const testValue: int = const1
      expect(TestEnum6800.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_6900
     * @tc.name      testConstantExpressionCheckEnum0069
     * @tc.desc      Constant expression with number conversion as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: byte = 16
      expect(TestEnum6900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7000
     * @tc.name      testConstantExpressionCheckEnum0070
     * @tc.desc      Constant expression with number conversion as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: short = 300
      expect(TestEnum7000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7100
     * @tc.name      testConstantExpressionCheckEnum0071
     * @tc.desc      Constant expression with number conversion as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: int = 3000
      expect(TestEnum7100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7200
     * @tc.name      testConstantExpressionCheckEnum0072
     * @tc.desc      Constant expression with number conversion as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: long = 50000
      expect(TestEnum7200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7300
     * @tc.name      testConstantExpressionCheckEnum0073
     * @tc.desc      Constant expression with number conversion as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: float = 120.2f
      expect(TestEnum7300.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7400
     * @tc.name      testConstantExpressionCheckEnum0074
     * @tc.desc      Constant expression with number conversion as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: number = 5050.9
      expect(TestEnum7400.One.valueOf()).assertEqual(testValue.toString())
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7500
     * @tc.name      testConstantExpressionCheckEnum0075
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 3
      const testValue = 24
      expect(TestEnum7500.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7600
     * @tc.name      testConstantExpressionCheckEnum0076
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 26
      const testValue = 3
      expect(TestEnum7600.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7700
     * @tc.name      testConstantExpressionCheckEnum0077
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = -256
      const testValue = -32
      expect(TestEnum7700.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7800
     * @tc.name      testConstantExpressionCheckEnum0078
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: short = -260
      const testValue = 536870879
      expect(TestEnum7800.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_7900
     * @tc.name      testConstantExpressionCheckEnum0079
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 308
      const testValue = 2464
      expect(TestEnum7900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8000
     * @tc.name      testConstantExpressionCheckEnum0080
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 3008
      const testValue = 376
      expect(TestEnum8000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8100
     * @tc.name      testConstantExpressionCheckEnum0081
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 3008
      const testValue = 376
      expect(TestEnum8100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8200
     * @tc.name      testConstantExpressionCheckEnum0082
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = -308
      const testValue = -2464
      expect(TestEnum8200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8300
     * @tc.name      testConstantExpressionCheckEnum0083
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = -3008
      const testValue = -376
      expect(TestEnum8300.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8400
     * @tc.name      testConstantExpressionCheckEnum0084
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 5006
      const testValue = 40048
      expect(TestEnum8400.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8500
     * @tc.name      testConstantExpressionCheckEnum0085
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 50006
      const testValue = 6250
      expect(TestEnum8500.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8600
     * @tc.name      testConstantExpressionCheckEnum0086
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = 50006
      const testValue = 6250
      expect(TestEnum8600.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8700
     * @tc.name      testConstantExpressionCheckEnum0087
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: byte = 26
      const testValue = 3
      expect(TestEnum8700.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8800
     * @tc.name      testConstantExpressionCheckEnum0088
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = -5006
      const testValue = -40048
      expect(TestEnum8800.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_8900
     * @tc.name      testConstantExpressionCheckEnum0089
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: long = -50006
      const testValue = -6251
      expect(TestEnum8900.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_9000
     * @tc.name      testConstantExpressionCheckEnum0090
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const testValue = 984
      expect(TestEnum9000.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_9100
     * @tc.name      testConstantExpressionCheckEnum0091
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const testValue = 15
      expect(TestEnum9100.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_9200
     * @tc.name      testConstantExpressionCheckEnum0092
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const testValue = 15
      expect(TestEnum9200.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_9300
     * @tc.name      testConstantExpressionCheckEnum0093
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = -123.2f
      const testValue = -984
      expect(TestEnum9300.One.valueOf()).assertEqual(testValue)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ENUM_9400
     * @tc.name      testConstantExpressionCheckEnum0094
     * @tc.desc      Constant shift expression as enum initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckEnum0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = -123.2f
      const testValue = -16
      expect(TestEnum9400.One.valueOf()).assertEqual(testValue)
    })

  })
}
