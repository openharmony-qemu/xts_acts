'use static'
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

import Utils from "../../../Util.test";

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

export default function IntegerBitwiseOperatorsTest(): void {
  describe("IntegerBitwiseOperatorsTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0100
     * @tc.name      testIntegerBitwiseOperators0001
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: short = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0200
     * @tc.name      testIntegerBitwiseOperators0002
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: int = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0300
     * @tc.name      testIntegerBitwiseOperators0003
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: long = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0400
     * @tc.name      testIntegerBitwiseOperators0004
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: bigint = 1n
        expect(BigInt(x) & y).assertEqual(1n)
        expect(y & BigInt(x)).assertEqual(1n)
        expect(BigInt(x) | y).assertEqual(1n)
        expect(y | BigInt(x)).assertEqual(1n)
        expect(BigInt(x) ^ y).assertEqual(0n)
        expect(y ^ BigInt(x)).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0500
     * @tc.name      testIntegerBitwiseOperators0005
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: float = 1.0f
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0600
     * @tc.name      testIntegerBitwiseOperators0006
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0700
     * @tc.name      testIntegerBitwiseOperators0007
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: int = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0800
     * @tc.name      testIntegerBitwiseOperators0008
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: long = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0900
     * @tc.name      testIntegerBitwiseOperators0009
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: bigint = 1n
        expect(BigInt(x) & y).assertEqual(1n)
        expect(y & BigInt(x)).assertEqual(1n)
        expect(BigInt(x) | y).assertEqual(1n)
        expect(y | BigInt(x)).assertEqual(1n)
        expect(BigInt(x) ^ y).assertEqual(0n)
        expect(y ^ BigInt(x)).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1000
     * @tc.name      testIntegerBitwiseOperators0010
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: float = 1.0f
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1100
     * @tc.name      testIntegerBitwiseOperators0011
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1200
     * @tc.name      testIntegerBitwiseOperators0012
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: long = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1300
     * @tc.name      testIntegerBitwiseOperators0013
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: bigint = 1n
        expect(BigInt(x) & y).assertEqual(1n)
        expect(y & BigInt(x)).assertEqual(1n)
        expect(BigInt(x) | y).assertEqual(1n)
        expect(y | BigInt(x)).assertEqual(1n)
        expect(BigInt(x) ^ y).assertEqual(0n)
        expect(y ^ BigInt(x)).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1400
     * @tc.name      testIntegerBitwiseOperators0014
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: float = 1.0f
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1500
     * @tc.name      testIntegerBitwiseOperators0015
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1600
     * @tc.name      testIntegerBitwiseOperators0016
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: bigint = 1n
        expect(BigInt(x) & y).assertEqual(1n)
        expect(y & BigInt(x)).assertEqual(1n)
        expect(BigInt(x) | y).assertEqual(1n)
        expect(y | BigInt(x)).assertEqual(1n)
        expect(BigInt(x) ^ y).assertEqual(0n)
        expect(y ^ BigInt(x)).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1700
     * @tc.name      testIntegerBitwiseOperators0017
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: float = 1.0f
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1800
     * @tc.name      testIntegerBitwiseOperators0018
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1900
     * @tc.name      testIntegerBitwiseOperators0019
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: bigint = 1n
        let y: float = 1.0f
        expect(x & BigInt(y)).assertEqual(1n)
        expect(BigInt(y) & x).assertEqual(1n)
        expect(x | BigInt(y)).assertEqual(1n)
        expect(BigInt(y) | x).assertEqual(1n)
        expect(x ^ BigInt(y)).assertEqual(0n)
        expect(BigInt(y) ^ x).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2000
     * @tc.name      testIntegerBitwiseOperators0020
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: bigint = 1n
        let y: double = 1
        expect(x & BigInt(y)).assertEqual(1n)
        expect(BigInt(y) & x).assertEqual(1n)
        expect(x | BigInt(y)).assertEqual(1n)
        expect(BigInt(y) | x).assertEqual(1n)
        expect(x ^ BigInt(y)).assertEqual(0n)
        expect(BigInt(y) ^ x).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2100
     * @tc.name      testIntegerBitwiseOperators0021
     * @tc.desc      Bitwise AND, OR, XOR with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: float = 1.0f
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
  })
}