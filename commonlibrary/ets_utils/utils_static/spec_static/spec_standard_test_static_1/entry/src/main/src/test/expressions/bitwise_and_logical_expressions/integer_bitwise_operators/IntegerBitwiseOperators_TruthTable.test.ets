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

export default function IntegerBitwiseOperatorsTruthTableTest(): void {
  describe("IntegerBitwiseOperatorsTruthTableTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0100
     * @tc.name      testIntegerBitwiseOperatorsTruth0001
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(0);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0200
     * @tc.name      testIntegerBitwiseOperatorsTruth0002
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 85;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(85);
      expect((x ^ y)).assertEqual(85);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0300
     * @tc.name      testIntegerBitwiseOperatorsTruth0003
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -86;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-86);
      expect((x ^ y)).assertEqual(-86);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0400
     * @tc.name      testIntegerBitwiseOperatorsTruth0004
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 15;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(15);
      expect((x ^ y)).assertEqual(15);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0500
     * @tc.name      testIntegerBitwiseOperatorsTruth0005
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -16;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-16);
      expect((x ^ y)).assertEqual(-16);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0600
     * @tc.name      testIntegerBitwiseOperatorsTruth0006
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 51;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(51);
      expect((x ^ y)).assertEqual(51);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0700
     * @tc.name      testIntegerBitwiseOperatorsTruth0007
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -52;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-52);
      expect((x ^ y)).assertEqual(-52);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0800
     * @tc.name      testIntegerBitwiseOperatorsTruth0008
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -127;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-127);
      expect((x ^ y)).assertEqual(-127);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_0900
     * @tc.name      testIntegerBitwiseOperatorsTruth0009
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -103;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-103);
      expect((x ^ y)).assertEqual(-103);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1000
     * @tc.name      testIntegerBitwiseOperatorsTruth0010
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=0, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 102;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(102);
      expect((x ^ y)).assertEqual(102);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1100
     * @tc.name      testIntegerBitwiseOperatorsTruth0011
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(85);
      expect((x ^ y)).assertEqual(85);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1200
     * @tc.name      testIntegerBitwiseOperatorsTruth0012
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 85;
      expect((x & y)).assertEqual(85);
      expect((x | y)).assertEqual(85);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1300
     * @tc.name      testIntegerBitwiseOperatorsTruth0013
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -86;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-1);
      expect((x ^ y)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1400
     * @tc.name      testIntegerBitwiseOperatorsTruth0014
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 15;
      expect((x & y)).assertEqual(5);
      expect((x | y)).assertEqual(95);
      expect((x ^ y)).assertEqual(90);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1500
     * @tc.name      testIntegerBitwiseOperatorsTruth0015
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -16;
      expect((x & y)).assertEqual(80);
      expect((x | y)).assertEqual(-11);
      expect((x ^ y)).assertEqual(-91);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1600
     * @tc.name      testIntegerBitwiseOperatorsTruth0016
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 51;
      expect((x & y)).assertEqual(17);
      expect((x | y)).assertEqual(119);
      expect((x ^ y)).assertEqual(102);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1700
     * @tc.name      testIntegerBitwiseOperatorsTruth0017
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -52;
      expect((x & y)).assertEqual(68);
      expect((x | y)).assertEqual(-35);
      expect((x ^ y)).assertEqual(-103);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1800
     * @tc.name      testIntegerBitwiseOperatorsTruth0018
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -127;
      expect((x & y)).assertEqual(1);
      expect((x | y)).assertEqual(-43);
      expect((x ^ y)).assertEqual(-44);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_1900
     * @tc.name      testIntegerBitwiseOperatorsTruth0019
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -103;
      expect((x & y)).assertEqual(17);
      expect((x | y)).assertEqual(-35);
      expect((x ^ y)).assertEqual(-52);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2000
     * @tc.name      testIntegerBitwiseOperatorsTruth0020
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=85, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 102;
      expect((x & y)).assertEqual(68);
      expect((x | y)).assertEqual(119);
      expect((x ^ y)).assertEqual(51);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2100
     * @tc.name      testIntegerBitwiseOperatorsTruth0021
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-86);
      expect((x ^ y)).assertEqual(-86);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2200
     * @tc.name      testIntegerBitwiseOperatorsTruth0022
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 85;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-1);
      expect((x ^ y)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2300
     * @tc.name      testIntegerBitwiseOperatorsTruth0023
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -86;
      expect((x & y)).assertEqual(-86);
      expect((x | y)).assertEqual(-86);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2400
     * @tc.name      testIntegerBitwiseOperatorsTruth0024
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 15;
      expect((x & y)).assertEqual(10);
      expect((x | y)).assertEqual(-81);
      expect((x ^ y)).assertEqual(-91);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2500
     * @tc.name      testIntegerBitwiseOperatorsTruth0025
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -16;
      expect((x & y)).assertEqual(-96);
      expect((x | y)).assertEqual(-6);
      expect((x ^ y)).assertEqual(90);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2600
     * @tc.name      testIntegerBitwiseOperatorsTruth0026
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 51;
      expect((x & y)).assertEqual(34);
      expect((x | y)).assertEqual(-69);
      expect((x ^ y)).assertEqual(-103);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2700
     * @tc.name      testIntegerBitwiseOperatorsTruth0027
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -52;
      expect((x & y)).assertEqual(-120);
      expect((x | y)).assertEqual(-18);
      expect((x ^ y)).assertEqual(102);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2800
     * @tc.name      testIntegerBitwiseOperatorsTruth0028
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -127;
      expect((x & y)).assertEqual(-128);
      expect((x | y)).assertEqual(-85);
      expect((x ^ y)).assertEqual(43);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_2900
     * @tc.name      testIntegerBitwiseOperatorsTruth0029
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -103;
      expect((x & y)).assertEqual(-120);
      expect((x | y)).assertEqual(-69);
      expect((x ^ y)).assertEqual(51);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3000
     * @tc.name      testIntegerBitwiseOperatorsTruth0030
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-86, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 102;
      expect((x & y)).assertEqual(34);
      expect((x | y)).assertEqual(-18);
      expect((x ^ y)).assertEqual(-52);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3100
     * @tc.name      testIntegerBitwiseOperatorsTruth0031
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(15);
      expect((x ^ y)).assertEqual(15);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3200
     * @tc.name      testIntegerBitwiseOperatorsTruth0032
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 85;
      expect((x & y)).assertEqual(5);
      expect((x | y)).assertEqual(95);
      expect((x ^ y)).assertEqual(90);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3300
     * @tc.name      testIntegerBitwiseOperatorsTruth0033
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -86;
      expect((x & y)).assertEqual(10);
      expect((x | y)).assertEqual(-81);
      expect((x ^ y)).assertEqual(-91);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3400
     * @tc.name      testIntegerBitwiseOperatorsTruth0034
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 15;
      expect((x & y)).assertEqual(15);
      expect((x | y)).assertEqual(15);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3500
     * @tc.name      testIntegerBitwiseOperatorsTruth0035
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -16;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-1);
      expect((x ^ y)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3600
     * @tc.name      testIntegerBitwiseOperatorsTruth0036
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 51;
      expect((x & y)).assertEqual(3);
      expect((x | y)).assertEqual(63);
      expect((x ^ y)).assertEqual(60);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3700
     * @tc.name      testIntegerBitwiseOperatorsTruth0037
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -52;
      expect((x & y)).assertEqual(12);
      expect((x | y)).assertEqual(-49);
      expect((x ^ y)).assertEqual(-61);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3800
     * @tc.name      testIntegerBitwiseOperatorsTruth0038
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -127;
      expect((x & y)).assertEqual(1);
      expect((x | y)).assertEqual(-113);
      expect((x ^ y)).assertEqual(-114);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_3900
     * @tc.name      testIntegerBitwiseOperatorsTruth0039
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -103;
      expect((x & y)).assertEqual(9);
      expect((x | y)).assertEqual(-97);
      expect((x ^ y)).assertEqual(-106);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4000
     * @tc.name      testIntegerBitwiseOperatorsTruth0040
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=15, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 102;
      expect((x & y)).assertEqual(6);
      expect((x | y)).assertEqual(111);
      expect((x ^ y)).assertEqual(105);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4100
     * @tc.name      testIntegerBitwiseOperatorsTruth0041
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-16);
      expect((x ^ y)).assertEqual(-16);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4200
     * @tc.name      testIntegerBitwiseOperatorsTruth0042
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 85;
      expect((x & y)).assertEqual(80);
      expect((x | y)).assertEqual(-11);
      expect((x ^ y)).assertEqual(-91);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4300
     * @tc.name      testIntegerBitwiseOperatorsTruth0043
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -86;
      expect((x & y)).assertEqual(-96);
      expect((x | y)).assertEqual(-6);
      expect((x ^ y)).assertEqual(90);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4400
     * @tc.name      testIntegerBitwiseOperatorsTruth0044
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 15;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-1);
      expect((x ^ y)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4500
     * @tc.name      testIntegerBitwiseOperatorsTruth0045
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -16;
      expect((x & y)).assertEqual(-16);
      expect((x | y)).assertEqual(-16);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4600
     * @tc.name      testIntegerBitwiseOperatorsTruth0046
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 51;
      expect((x & y)).assertEqual(48);
      expect((x | y)).assertEqual(-13);
      expect((x ^ y)).assertEqual(-61);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4700
     * @tc.name      testIntegerBitwiseOperatorsTruth0047
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -52;
      expect((x & y)).assertEqual(-64);
      expect((x | y)).assertEqual(-4);
      expect((x ^ y)).assertEqual(60);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4800
     * @tc.name      testIntegerBitwiseOperatorsTruth0048
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -127;
      expect((x & y)).assertEqual(-128);
      expect((x | y)).assertEqual(-15);
      expect((x ^ y)).assertEqual(113);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_4900
     * @tc.name      testIntegerBitwiseOperatorsTruth0049
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -103;
      expect((x & y)).assertEqual(-112);
      expect((x | y)).assertEqual(-7);
      expect((x ^ y)).assertEqual(105);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5000
     * @tc.name      testIntegerBitwiseOperatorsTruth0050
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-16, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 102;
      expect((x & y)).assertEqual(96);
      expect((x | y)).assertEqual(-10);
      expect((x ^ y)).assertEqual(-106);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5100
     * @tc.name      testIntegerBitwiseOperatorsTruth0051
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(51);
      expect((x ^ y)).assertEqual(51);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5200
     * @tc.name      testIntegerBitwiseOperatorsTruth0052
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 85;
      expect((x & y)).assertEqual(17);
      expect((x | y)).assertEqual(119);
      expect((x ^ y)).assertEqual(102);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5300
     * @tc.name      testIntegerBitwiseOperatorsTruth0053
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -86;
      expect((x & y)).assertEqual(34);
      expect((x | y)).assertEqual(-69);
      expect((x ^ y)).assertEqual(-103);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5400
     * @tc.name      testIntegerBitwiseOperatorsTruth0054
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 15;
      expect((x & y)).assertEqual(3);
      expect((x | y)).assertEqual(63);
      expect((x ^ y)).assertEqual(60);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5500
     * @tc.name      testIntegerBitwiseOperatorsTruth0055
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -16;
      expect((x & y)).assertEqual(48);
      expect((x | y)).assertEqual(-13);
      expect((x ^ y)).assertEqual(-61);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5600
     * @tc.name      testIntegerBitwiseOperatorsTruth0056
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 51;
      expect((x & y)).assertEqual(51);
      expect((x | y)).assertEqual(51);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5700
     * @tc.name      testIntegerBitwiseOperatorsTruth0057
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -52;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-1);
      expect((x ^ y)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5800
     * @tc.name      testIntegerBitwiseOperatorsTruth0058
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -127;
      expect((x & y)).assertEqual(1);
      expect((x | y)).assertEqual(-77);
      expect((x ^ y)).assertEqual(-78);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_5900
     * @tc.name      testIntegerBitwiseOperatorsTruth0059
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -103;
      expect((x & y)).assertEqual(17);
      expect((x | y)).assertEqual(-69);
      expect((x ^ y)).assertEqual(-86);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6000
     * @tc.name      testIntegerBitwiseOperatorsTruth0060
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=51, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 102;
      expect((x & y)).assertEqual(34);
      expect((x | y)).assertEqual(119);
      expect((x ^ y)).assertEqual(85);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6100
     * @tc.name      testIntegerBitwiseOperatorsTruth0061
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-52);
      expect((x ^ y)).assertEqual(-52);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6200
     * @tc.name      testIntegerBitwiseOperatorsTruth0062
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 85;
      expect((x & y)).assertEqual(68);
      expect((x | y)).assertEqual(-35);
      expect((x ^ y)).assertEqual(-103);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6300
     * @tc.name      testIntegerBitwiseOperatorsTruth0063
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -86;
      expect((x & y)).assertEqual(-120);
      expect((x | y)).assertEqual(-18);
      expect((x ^ y)).assertEqual(102);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6400
     * @tc.name      testIntegerBitwiseOperatorsTruth0064
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 15;
      expect((x & y)).assertEqual(12);
      expect((x | y)).assertEqual(-49);
      expect((x ^ y)).assertEqual(-61);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6500
     * @tc.name      testIntegerBitwiseOperatorsTruth0065
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -16;
      expect((x & y)).assertEqual(-64);
      expect((x | y)).assertEqual(-4);
      expect((x ^ y)).assertEqual(60);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6600
     * @tc.name      testIntegerBitwiseOperatorsTruth0066
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 51;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-1);
      expect((x ^ y)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6700
     * @tc.name      testIntegerBitwiseOperatorsTruth0067
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -52;
      expect((x & y)).assertEqual(-52);
      expect((x | y)).assertEqual(-52);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6800
     * @tc.name      testIntegerBitwiseOperatorsTruth0068
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -127;
      expect((x & y)).assertEqual(-128);
      expect((x | y)).assertEqual(-51);
      expect((x ^ y)).assertEqual(77);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_6900
     * @tc.name      testIntegerBitwiseOperatorsTruth0069
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -103;
      expect((x & y)).assertEqual(-120);
      expect((x | y)).assertEqual(-35);
      expect((x ^ y)).assertEqual(85);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7000
     * @tc.name      testIntegerBitwiseOperatorsTruth0070
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-52, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 102;
      expect((x & y)).assertEqual(68);
      expect((x | y)).assertEqual(-18);
      expect((x ^ y)).assertEqual(-86);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7100
     * @tc.name      testIntegerBitwiseOperatorsTruth0071
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-127);
      expect((x ^ y)).assertEqual(-127);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7200
     * @tc.name      testIntegerBitwiseOperatorsTruth0072
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 85;
      expect((x & y)).assertEqual(1);
      expect((x | y)).assertEqual(-43);
      expect((x ^ y)).assertEqual(-44);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7300
     * @tc.name      testIntegerBitwiseOperatorsTruth0073
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -86;
      expect((x & y)).assertEqual(-128);
      expect((x | y)).assertEqual(-85);
      expect((x ^ y)).assertEqual(43);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7400
     * @tc.name      testIntegerBitwiseOperatorsTruth0074
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 15;
      expect((x & y)).assertEqual(1);
      expect((x | y)).assertEqual(-113);
      expect((x ^ y)).assertEqual(-114);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7500
     * @tc.name      testIntegerBitwiseOperatorsTruth0075
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -16;
      expect((x & y)).assertEqual(-128);
      expect((x | y)).assertEqual(-15);
      expect((x ^ y)).assertEqual(113);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7600
     * @tc.name      testIntegerBitwiseOperatorsTruth0076
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 51;
      expect((x & y)).assertEqual(1);
      expect((x | y)).assertEqual(-77);
      expect((x ^ y)).assertEqual(-78);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7700
     * @tc.name      testIntegerBitwiseOperatorsTruth0077
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -52;
      expect((x & y)).assertEqual(-128);
      expect((x | y)).assertEqual(-51);
      expect((x ^ y)).assertEqual(77);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7800
     * @tc.name      testIntegerBitwiseOperatorsTruth0078
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -127;
      expect((x & y)).assertEqual(-127);
      expect((x | y)).assertEqual(-127);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_7900
     * @tc.name      testIntegerBitwiseOperatorsTruth0079
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -103;
      expect((x & y)).assertEqual(-127);
      expect((x | y)).assertEqual(-103);
      expect((x ^ y)).assertEqual(24);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8000
     * @tc.name      testIntegerBitwiseOperatorsTruth0080
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-127, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 102;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-25);
      expect((x ^ y)).assertEqual(-25);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8100
     * @tc.name      testIntegerBitwiseOperatorsTruth0081
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-103);
      expect((x ^ y)).assertEqual(-103);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8200
     * @tc.name      testIntegerBitwiseOperatorsTruth0082
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 85;
      expect((x & y)).assertEqual(17);
      expect((x | y)).assertEqual(-35);
      expect((x ^ y)).assertEqual(-52);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8300
     * @tc.name      testIntegerBitwiseOperatorsTruth0083
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -86;
      expect((x & y)).assertEqual(-120);
      expect((x | y)).assertEqual(-69);
      expect((x ^ y)).assertEqual(51);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8400
     * @tc.name      testIntegerBitwiseOperatorsTruth0084
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 15;
      expect((x & y)).assertEqual(9);
      expect((x | y)).assertEqual(-97);
      expect((x ^ y)).assertEqual(-106);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8500
     * @tc.name      testIntegerBitwiseOperatorsTruth0085
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -16;
      expect((x & y)).assertEqual(-112);
      expect((x | y)).assertEqual(-7);
      expect((x ^ y)).assertEqual(105);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8600
     * @tc.name      testIntegerBitwiseOperatorsTruth0086
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 51;
      expect((x & y)).assertEqual(17);
      expect((x | y)).assertEqual(-69);
      expect((x ^ y)).assertEqual(-86);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8700
     * @tc.name      testIntegerBitwiseOperatorsTruth0087
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -52;
      expect((x & y)).assertEqual(-120);
      expect((x | y)).assertEqual(-35);
      expect((x ^ y)).assertEqual(85);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8800
     * @tc.name      testIntegerBitwiseOperatorsTruth0088
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -127;
      expect((x & y)).assertEqual(-127);
      expect((x | y)).assertEqual(-103);
      expect((x ^ y)).assertEqual(24);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_8900
     * @tc.name      testIntegerBitwiseOperatorsTruth0089
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -103;
      expect((x & y)).assertEqual(-103);
      expect((x | y)).assertEqual(-103);
      expect((x ^ y)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9000
     * @tc.name      testIntegerBitwiseOperatorsTruth0090
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=-103, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 102;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-1);
      expect((x ^ y)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9100
     * @tc.name      testIntegerBitwiseOperatorsTruth0091
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 0;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(102);
      expect((x ^ y)).assertEqual(102);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9200
     * @tc.name      testIntegerBitwiseOperatorsTruth0092
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=85
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 85;
      expect((x & y)).assertEqual(68);
      expect((x | y)).assertEqual(119);
      expect((x ^ y)).assertEqual(51);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9300
     * @tc.name      testIntegerBitwiseOperatorsTruth0093
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=-86
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -86;
      expect((x & y)).assertEqual(34);
      expect((x | y)).assertEqual(-18);
      expect((x ^ y)).assertEqual(-52);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9400
     * @tc.name      testIntegerBitwiseOperatorsTruth0094
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 15;
      expect((x & y)).assertEqual(6);
      expect((x | y)).assertEqual(111);
      expect((x ^ y)).assertEqual(105);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9500
     * @tc.name      testIntegerBitwiseOperatorsTruth0095
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=-16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -16;
      expect((x & y)).assertEqual(96);
      expect((x | y)).assertEqual(-10);
      expect((x ^ y)).assertEqual(-106);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9600
     * @tc.name      testIntegerBitwiseOperatorsTruth0096
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=51
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 51;
      expect((x & y)).assertEqual(34);
      expect((x | y)).assertEqual(119);
      expect((x ^ y)).assertEqual(85);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9700
     * @tc.name      testIntegerBitwiseOperatorsTruth0097
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=-52
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -52;
      expect((x & y)).assertEqual(68);
      expect((x | y)).assertEqual(-18);
      expect((x ^ y)).assertEqual(-86);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9800
     * @tc.name      testIntegerBitwiseOperatorsTruth0098
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=-127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -127;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-25);
      expect((x ^ y)).assertEqual(-25);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_9900
     * @tc.name      testIntegerBitwiseOperatorsTruth0099
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=-103
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -103;
      expect((x & y)).assertEqual(0);
      expect((x | y)).assertEqual(-1);
      expect((x ^ y)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TRUTH_ONE_0100
     * @tc.name      testIntegerBitwiseOperatorsTruth0100
     * @tc.desc      Bitwise AND, OR, XOR truth table: x=102, y=102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTruth0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 102;
      expect((x & y)).assertEqual(102);
      expect((x | y)).assertEqual(102);
      expect((x ^ y)).assertEqual(0);
    })
  })
}