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
} from "../../../../../../hypium/index";

export default function CompoundAssignmentOperatorsTest(): void {
  describe("CompoundAssignmentOperatorsTest", () => {
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
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0100
     * @tc.name      testCompoundAssignmentOperators0001
     * @tc.desc      All compound assignment operators for byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 10; x += 20; expect(30 as byte).assertEqual(x);
      x = 30; x -= 10; expect(20 as byte).assertEqual(x);
      x = 10; x *= 20; expect(-56 as byte).assertEqual(x);
      x = 20; x /= 10; expect(2 as byte).assertEqual(x);
      x = 20; x %= 3; expect(2 as byte).assertEqual(x);
      x = 1; x <<= 3; expect(8 as byte).assertEqual(x);
      x = 8; x >>= 3; expect(1 as byte).assertEqual(x);
      x = -8; x >>>= 3; expect(-1 as byte).assertEqual(x);
      x = 0b1111; x &= 0b0101; expect(5 as byte).assertEqual(x);
      x = 0b0101; x |= 0b1010; expect(15 as byte).assertEqual(x);
      x = 0b1111; x ^= 0b0101; expect(10 as byte).assertEqual(x);
      x = 127; x += 1; expect(-128 as byte).assertEqual(x);
      x = -128; x += -1; expect(127 as byte).assertEqual(x);
      x = 0; x += 127; expect(127 as byte).assertEqual(x);
      x = 127; x -= 1; expect(126 as byte).assertEqual(x);
      x = -128; x -= 1; expect(127 as byte).assertEqual(x);
      x = 0; x -= 127; expect(-127 as byte).assertEqual(x);
      x = 127; x /= 1; expect(127 as byte).assertEqual(x);
      x = -128; x /= -1; expect(-128 as byte).assertEqual(x);
      x = 64; x /= 2; expect(32 as byte).assertEqual(x);
      x = 127; x %= 64; expect(63 as byte).assertEqual(x);
      x = -128; x %= 64; expect(0 as byte).assertEqual(x);
      x = 10; x %= 3; expect(1 as byte).assertEqual(x);
      x = 1; x <<= 3; expect(8 as byte).assertEqual(x);
      x = 127; x <<= 1; expect(-2 as byte).assertEqual(x);
      x = 127; x >>= 2; expect(31 as byte).assertEqual(x);
      x = -128; x >>= 1; expect(-64 as byte).assertEqual(x);
      x = -1; x >>>= 4; expect(-1 as byte).assertEqual(x);
      x = 127; x >>>= 2; expect(31 as byte).assertEqual(x);
      x = 0b1111; x &= 0b0101; expect(5 as byte).assertEqual(x);
      x = -1; x &= 0; expect(0 as byte).assertEqual(x);
      x = 0b0000; x |= 0b1010; expect(10 as byte).assertEqual(x);
      x = 0; x |= -1; expect(-1 as byte).assertEqual(x);
      x = 0b1111; x ^= 0b0101; expect(10 as byte).assertEqual(x);
      x = -1; x ^= -1; expect(0 as byte).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0200
     * @tc.name      testCompoundAssignmentOperators0002
     * @tc.desc      All compound assignment operators for short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 32767; x += 1; expect(-32768 as short).assertEqual(x);
      x = -32768; x += -1; expect(32767 as short).assertEqual(x);
      x = 0; x += 32767; expect(32767 as short).assertEqual(x);
      x = 32767; x -= 1; expect(32766 as short).assertEqual(x);
      x = -32768; x -= 1; expect(32767 as short).assertEqual(x);
      x = 0; x -= 32767; expect(-32767 as short).assertEqual(x);
      x = 32767; x /= 1; expect(32767 as short).assertEqual(x);
      x = -32768; x /= -1; expect(-32768 as short).assertEqual(x);
      x = 16384; x /= 2; expect(8192 as short).assertEqual(x);
      x = 32767; x %= 16384; expect(16383 as short).assertEqual(x);
      x = -32768; x %= 16384; expect(0 as short).assertEqual(x);
      x = 10; x %= 3; expect(1 as short).assertEqual(x);
      x = 1; x <<= 5; expect(32 as short).assertEqual(x);
      x = 32767; x <<= 1; expect(-2 as short).assertEqual(x);
      x = 32767; x >>= 3; expect(4095 as short).assertEqual(x);
      x = -32768; x >>= 2; expect(-8192 as short).assertEqual(x);
      x = -1; x >>>= 5; expect(-1 as short).assertEqual(x);
      x = 32767; x >>>= 3; expect(4095 as short).assertEqual(x);
      x = 0x7FFF; x &= 0x0F0F; expect(0x0F0F as short).assertEqual(x);
      x = -1; x &= 0; expect(0 as short).assertEqual(x);
      x = 0x0000; x |= 0x0F0F; expect(0x0F0F as short).assertEqual(x);
      x = 0; x |= -1; expect(-1 as short).assertEqual(x);
      x = 0x7FFF; x ^= 0x0F0F; expect(0x70F0 as short).assertEqual(x);
      x = -1; x ^= -1; expect(0 as short).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0300
     * @tc.name      testCompoundAssignmentOperators0003
     * @tc.desc      All compound assignment operators for int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647; x += 1; expect(-2147483648).assertEqual(x);
      x = -2147483648; x += -1; expect(2147483647).assertEqual(x);
      x = 0; x += 2147483647; expect(2147483647).assertEqual(x);
      x = 2147483647; x -= 1; expect(2147483646).assertEqual(x);
      x = -2147483648; x -= 1; expect(2147483647).assertEqual(x);
      x = 0; x -= 2147483647; expect(-2147483647).assertEqual(x);
      x = 2147483647; x /= 1; expect(2147483647).assertEqual(x);
      x = -2147483648; x /= -1; expect(-2147483648).assertEqual(x);
      x = 1073741824; x /= 2; expect(536870912).assertEqual(x);
      x = 2147483647; x %= 1073741824; expect(1073741823).assertEqual(x);
      x = -2147483648; x %= 1073741824; expect(0).assertEqual(x);
      x = 10; x %= 3; expect(1).assertEqual(x);
      x = 1; x <<= 10; expect(1024).assertEqual(x);
      x = 2147483647; x <<= 1; expect(-2).assertEqual(x);
      x = 2147483647; x >>= 4; expect(134217727).assertEqual(x);
      x = -2147483648; x >>= 3; expect(-268435456).assertEqual(x);
      x = -1; x >>>= 10; expect(4194303).assertEqual(x);
      x = 2147483647; x >>>= 4; expect(134217727).assertEqual(x);
      x = 0x7FFFFFFF; x &= 0x00FF00FF; expect(0x00FF00FF).assertEqual(x);
      x = -1; x &= 0; expect(0).assertEqual(x);
      x = 0x00000000; x |= 0x00FF00FF; expect(0x00FF00FF).assertEqual(x);
      x = 0; x |= -1; expect(-1).assertEqual(x);
      x = 0x7FFFFFFF; x ^= 0x00FF00FF; expect(0x7F00FF00).assertEqual(x);
      x = -1; x ^= -1; expect(0).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0400
     * @tc.name      testCompoundAssignmentOperators0004
     * @tc.desc      All compound assignment operators for long type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 9223372036854775807; x += 1; expect(-9223372036854775808).assertEqual(x);
      x = -9223372036854775808; x += -1; expect(9223372036854775807).assertEqual(x);
      x = 0; x += 9223372036854775807; expect(9223372036854775807).assertEqual(x);
      x = 9223372036854775807; x -= 1; expect(9223372036854775806).assertEqual(x);
      x = -9223372036854775808; x -= 1; expect(9223372036854775807).assertEqual(x);
      x = 0; x -= 9223372036854775807; expect(-9223372036854775807).assertEqual(x);
      x = 9223372036854775807; x /= 1; expect(9223372036854775807).assertEqual(x);
      x = -9223372036854775808; x /= -1; expect(-9223372036854775808).assertEqual(x);
      x = 4611686018427387904; x /= 2; expect(2305843009213693952).assertEqual(x);
      x = 9223372036854775807; x %= 4611686018427387904; expect(4611686018427387903).assertEqual(x);
      x = -9223372036854775808; x %= 4611686018427387904; expect(0).assertEqual(x);
      x = 10; x %= 3; expect(1).assertEqual(x);
      x = 1; x <<= 20; expect(1048576).assertEqual(x);
      x = 9223372036854775807; x <<= 1; expect(-2).assertEqual(x);
      x = 9223372036854775807; x >>= 5; expect(288230376151711743).assertEqual(x);
      x = -9223372036854775808; x >>= 4; expect(-576460752303423488).assertEqual(x);
      x = -1; x >>>= 20; expect(17592186044415).assertEqual(x);
      x = 9223372036854775807; x >>>= 5; expect(288230376151711743).assertEqual(x);
      x = 0x7FFFFFFFFFFFFFFF; x &= 0x0000FFFF0000FFFF; expect(0x0000FFFF0000FFFF).assertEqual(x);
      x = -1; x &= 0; expect(0).assertEqual(x);
      x = 0x0000000000000000; x |= 0x0000FFFF0000FFFF; expect(0x0000FFFF0000FFFF).assertEqual(x);
      x = 0; x |= -1; expect(-1).assertEqual(x);
      x = 0x7FFFFFFFFFFFFFFF; x ^= 0x0000FFFF0000FFFF; expect(0x7FFF0000FFFF0000).assertEqual(x);
      x = -1; x ^= -1; expect(0).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0500
     * @tc.name      testCompoundAssignmentOperators0005
     * @tc.desc      All compound assignment operators for float type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 3.4028235e38f; x += 1.0f; expect(3.4028235e38f).assertEqual(x);
      x = -3.4028235e38f; x += -1.0f; expect(-3.4028235e38f).assertEqual(x);
      x = 0.0f; x += 3.4028235e38f; expect(3.4028235e38f).assertEqual(x);
      x = 3.4028235e38f; x -= 1.0f; expect(3.4028235e38f).assertEqual(x);
      x = -3.4028235e38f; x -= 1.0f; expect(-3.4028235e38f).assertEqual(x);
      x = 0.0f; x -= 3.4028235e38f; expect(-3.4028235e38f).assertEqual(x);
      x = 3.4028235e38f; x /= 1.0f; expect(3.4028235e38f).assertEqual(x);
      x = -3.4028235e38f; x /= -1.0f; expect(3.4028235e38f).assertEqual(x);
      x = 2.0f; x /= 2.0f; expect(1.0f).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0600
     * @tc.name      testCompoundAssignmentOperators0006
     * @tc.desc      All compound assignment operators for double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.7976931348623157e308; x += 1.0; expect(1.7976931348623157e308).assertEqual(x);
      x = -1.7976931348623157e308; x += -1.0; expect(-1.7976931348623157e308).assertEqual(x);
      x = 0.0; x += 1.7976931348623157e308; expect(1.7976931348623157e308).assertEqual(x);
      x = 1.7976931348623157e308; x -= 1.0; expect(1.7976931348623157e308).assertEqual(x);
      x = -1.7976931348623157e308; x -= 1.0; expect(-1.7976931348623157e308).assertEqual(x);
      x = 0.0; x -= 1.7976931348623157e308; expect(-1.7976931348623157e308).assertEqual(x);
      x = 1.7976931348623157e308; x /= 1.0; expect(1.7976931348623157e308).assertEqual(x);
      x = -1.7976931348623157e308; x /= -1.0; expect(1.7976931348623157e308).assertEqual(x);
      x = 2.0; x /= 2.0; expect(1.0).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5800
     * @tc.name      testCompoundAssignmentOperators0058
     * @tc.desc      Mixed type compound assignment += long + int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:long = 100; let b:int = 50; a += b; expect(150).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5900
     * @tc.name      testCompoundAssignmentOperators0059
     * @tc.desc      Mixed type compound assignment -= long + short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:long = 200; let b:short = 30; a -= b; expect(170).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6000
     * @tc.name      testCompoundAssignmentOperators0060
     * @tc.desc      Mixed type compound assignment *= int + byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 10; let b:byte = 8; a *= b; expect(80).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6100
     * @tc.name      testCompoundAssignmentOperators0061
     * @tc.desc      Mixed type compound assignment /= short + byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:short = 100; let b:byte = 5; a /= b; expect(20 as short).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6200
     * @tc.name      testCompoundAssignmentOperators0062
     * @tc.desc      Mixed type compound assignment %= int + short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 100; let b:short = 30; a %= b; expect(10).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6300
     * @tc.name      testCompoundAssignmentOperators0063
     * @tc.desc      Compound assignment with zero values all types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1:byte = 0; b1 += 0; expect(0 as byte).assertEqual(b1);
      let s1:short = 0; s1 *= 0; expect(0 as short).assertEqual(s1);
      let i1:int = 0; i1 -= 0; expect(0).assertEqual(i1);
      let l1:long = 0; l1 /= 1; expect(0).assertEqual(l1);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6400
     * @tc.name      testCompoundAssignmentOperators0064
     * @tc.desc      Float boundary compound assignment +=
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f:float = 1.17549435e-38f; f += 0.0f; expect(1.17549435e-38f).assertEqual(f);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6500
     * @tc.name      testCompoundAssignmentOperators0065
     * @tc.desc      Double boundary compound assignment +=
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d:double = 2.2250738585072014e-308; d += 0.0; expect(2.2250738585072014e-308).assertEqual(d);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6600
     * @tc.name      testCompoundAssignmentOperators0066
     * @tc.desc      Compound assignment chain operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 10; a += 5; a *= 2; expect(30).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6700
     * @tc.name      testCompoundAssignmentOperators0067
     * @tc.desc      Negative value compound assignment all operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = -10; a += -5; expect(-15).assertEqual(a);
      let b:int = -10; b -= -5; expect(-5).assertEqual(b);
      let c:int = -10; c *= -5; expect(50).assertEqual(c);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6800
     * @tc.name      testCompoundAssignmentOperators0068
     * @tc.desc      Bitwise compound assignment edge cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 0; a |= 0; expect(0).assertEqual(a);
      let b:int = 0; b ^= 0; expect(0).assertEqual(b);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6900
     * @tc.name      testCompoundAssignmentOperators0069
     * @tc.desc      Shift compound assignment full bit shift
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 1; a <<= 31; expect(-2147483648).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7000
     * @tc.name      testCompoundAssignmentOperators0070
     * @tc.desc      Long type full range compound assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:long = 1; a <<= 63; expect(-9223372036854775808).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7100
     * @tc.name      testCompoundAssignmentOperators0071
     * @tc.desc      All operators combined test byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x:byte = 2; x += 3; x -= 1; x *= 2; x /= 2; expect(4 as byte).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7200
     * @tc.name      testCompoundAssignmentOperators0072
     * @tc.desc      All operators combined test int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x:int = 5; x += 5; x -= 3; x *= 2; x /= 3; expect(4).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7300
     * @tc.name      testCompoundAssignmentOperators0073
     * @tc.desc      Compound assignment implicit cast verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x:byte = 127; x += 1; expect(-128 as byte).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7400
     * @tc.name      testCompoundAssignmentOperators0074
     * @tc.desc      Final verification all compound operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 0;
      a += 1; a -= 1; a *= 1; a /= 1; a %= 1;
      a <<= 1; a >>= 1; a >>>= 1;
      a &= 1; a |= 1; a ^= 1;
      expect(0).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7500
     * @tc.name      testCompoundAssignmentOperators0075
     * @tc.desc      Full coverage compound assignment final test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testCompoundAssignmentOperators0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v_byte:byte = 64; v_byte <<= 1; expect(-128 as byte).assertEqual(v_byte);
      let v_short:short = 16384; v_short <<= 1; expect(-32768 as short).assertEqual(v_short);
      let v_int:int = 1073741824; v_int <<= 1; expect(-2147483648).assertEqual(v_int);
      let v_long:long = 4611686018427387904; v_long <<= 1; expect(-9223372036854775808).assertEqual(v_long);
    });
  })
}