'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';


function getMathImulReturnedNumberSource(): number {
  return 21.9;
}

export default function mathImulTest(): void {
  describe('MathImulTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    })
    afterAll((): void => {
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0100
     * @tc.name testMathImul001
     * @tc.desc Verify Math.imul with arguments 3 and 4 for expected return 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 3;
      let rightOperand: number = 4;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0200
     * @tc.name testMathImul002
     * @tc.desc Verify Math.imul with arguments -3 and -4 for expected return 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -3;
      let rightOperand: number = -4;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0300
     * @tc.name testMathImul003
     * @tc.desc Verify Math.imul with arguments -3 and 4 for expected return -12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -3;
      let rightOperand: number = 4;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0400
     * @tc.name testMathImul004
     * @tc.desc Verify Math.imul with arguments 3 and -4 for expected return -12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 3;
      let rightOperand: number = -4;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0500
     * @tc.name testMathImul005
     * @tc.desc Verify Math.imul with arguments 3.9 and 4.1 for expected return 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 3.9;
      let rightOperand: number = 4.1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0600
     * @tc.name testMathImul006
     * @tc.desc Verify Math.imul with arguments 0 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 0;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0700
     * @tc.name testMathImul007
     * @tc.desc Verify Math.imul with arguments 0 and 5 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 0;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0800
     * @tc.name testMathImul008
     * @tc.desc Verify Math.imul with arguments 5 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 5;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0900
     * @tc.name testMathImul009
     * @tc.desc Verify Math.imul with Double.NaN as the left argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = Double.NaN;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1000
     * @tc.name testMathImul010
     * @tc.desc Verify Math.imul with Double.NaN as the right argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 5;
      let rightOperand: number = Double.NaN;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1100
     * @tc.name testMathImul011
     * @tc.desc Verify Math.imul with Double.POSITIVE_INFINITY as the left argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = Double.POSITIVE_INFINITY;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1200
     * @tc.name testMathImul012
     * @tc.desc Verify Math.imul with Double.POSITIVE_INFINITY as the right argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 5;
      let rightOperand: number = Double.POSITIVE_INFINITY;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1300
     * @tc.name testMathImul013
     * @tc.desc Verify Math.imul with Double.NEGATIVE_INFINITY as the left argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = Double.NEGATIVE_INFINITY;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1400
     * @tc.name testMathImul014
     * @tc.desc Verify Math.imul with arguments 2147483647 and 1 for expected return 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 2147483647;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1500
     * @tc.name testMathImul015
     * @tc.desc Verify Math.imul with arguments -2147483647 and 1 for expected return -2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -2147483647;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1600
     * @tc.name testMathImul016
     * @tc.desc Verify Math.imul with arguments 2147483647 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 2147483647;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1700
     * @tc.name testMathImul017
     * @tc.desc Verify Math.imul with arguments -2147483647 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -2147483647;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1800
     * @tc.name testMathImul018
     * @tc.desc Verify Math.imul with arguments -1 and 5 for expected return -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -1;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1900
     * @tc.name testMathImul019
     * @tc.desc Verify Math.imul with arguments -1 and -5 for expected return 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -1;
      let rightOperand: number = -5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2000
     * @tc.name testMathImul020
     * @tc.desc Verify Math.imul with arguments -1 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -1;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2100
     * @tc.name testMathImul021
     * @tc.desc Verify Math.imul with arguments 12345 and 67890 for expected return 838102050
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 12345;
      let rightOperand: number = 67890;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(838102050);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2200
     * @tc.name testMathImul022
     * @tc.desc Verify Math.imul with arguments -3 and 7 for expected return -21
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -3;
      let rightOperand: number = 7;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-21);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2300
     * @tc.name testMathImul023
     * @tc.desc Verify Math.imul with arguments 123.9 and 1 for expected return 123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 123.9;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(123);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2400
     * @tc.name testMathImul024
     * @tc.desc Verify Math.imul with arguments -456.7 and 1 for expected return -456
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -456.7;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-456);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2500
     * @tc.name testMathImul025
     * @tc.desc Verify Math.imul with unsigned 32-bit maximum maps to signed negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 4294967295;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2600
     * @tc.name testMathImul026
     * @tc.desc Verify Math.imul with 2^32 as left operand truncates to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 4294967296;
      let rightOperand: number = 7;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2700
     * @tc.name testMathImul027
     * @tc.desc Verify Math.imul with 65536 times 65536 wraps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 65536;
      let rightOperand: number = 65536;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2800
     * @tc.name testMathImul028
     * @tc.desc Verify Math.imul with 65536 times 65535 wraps to signed negative 65536
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 65536;
      let rightOperand: number = 65535;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-65536);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2900
     * @tc.name testMathImul029
     * @tc.desc Verify Math.imul with signed int32 minimum doubled wraps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -2147483648;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3000
     * @tc.name testMathImul030
     * @tc.desc Verify Math.imul with 65536 times 32768 reaches signed int32 minimum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 65536;
      let rightOperand: number = 32768;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3100
     * @tc.name testMathImul031
     * @tc.desc Verify Math.imul with 46341 squared wraps from positive product to negative result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 46341;
      let rightOperand: number = 46341;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2147479015);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3200
     * @tc.name testMathImul032
     * @tc.desc Verify Math.imul with negative value below int32 minimum maps to Int.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -2147483649;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3300
     * @tc.name testMathImul033
     * @tc.desc Verify Math.imul with Int.MAX_VALUE doubled wraps to negative two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 2147483647;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3400
     * @tc.name testMathImul034
     * @tc.desc Verify Math.imul with Int.MAX_VALUE minus one preserves signed result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 2147483646;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(2147483646);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3500
     * @tc.name testMathImul035
     * @tc.desc Verify Math.imul with negative int32 boundary plus one preserves signed result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -2147483647;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3600
     * @tc.name testMathImul036
     * @tc.desc Verify Math.imul with negative int32 boundary plus one doubled wraps to positive two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -2147483647;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3700
     * @tc.name testMathImul037
     * @tc.desc Verify Math.imul with hex literal all bits set maps to negative five after multiply
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 0xffffffff;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3800
     * @tc.name testMathImul038
     * @tc.desc Verify Math.imul with hex literal high bit set maps to signed int32 minimum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 0x80000000;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3900
     * @tc.name testMathImul039
     * @tc.desc Verify Math.imul with Math.PI source truncates fractional part before multiply
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = Math.PI;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4000
     * @tc.name testMathImul040
     * @tc.desc Verify Math.imul with Math.E source truncates fractional part before multiply
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = Math.E;
      let rightOperand: number = 3;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4100
     * @tc.name testMathImul041
     * @tc.desc Verify Math.imul with arithmetic expression source evaluates before int32 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 20 + 22;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(84);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4200
     * @tc.name testMathImul042
     * @tc.desc Verify Math.imul with function returned number source truncates before multiply
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = getMathImulReturnedNumberSource();
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4300
     * @tc.name testMathImul043
     * @tc.desc Verify Math.imul with negative one and zero returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -1;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4400
     * @tc.name testMathImul044
     * @tc.desc Verify Math.imul with 65535 squared wraps to signed negative 131071
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 65535;
      let rightOperand: number = 65535;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-131071);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4500
     * @tc.name testMathImul045
     * @tc.desc Verify Math.imul accepts an int minimum plus one source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: int = -2147483647;
      let rightOperand: int = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4600
     * @tc.name testMathImul046
     * @tc.desc Verify Math.imul with arguments 65535 and 1 for expected return 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 65535;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(65535);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4700
     * @tc.name testMathImul047
     * @tc.desc Verify Math.imul with arguments 65535 and -1 for expected return -65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 65535;
      let rightOperand: number = -1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-65535);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4800
     * @tc.name testMathImul048
     * @tc.desc Verify Math.imul with arguments 32767 and 2 for expected return 65534
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 32767;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(65534);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4900
     * @tc.name testMathImul049
     * @tc.desc Verify Math.imul with arguments -32768 and 2 for expected return -65536
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -32768;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-65536);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5000
     * @tc.name testMathImul050
     * @tc.desc Verify Math.imul with arguments 1000 and 1000 for expected return 1000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 1000;
      let rightOperand: number = 1000;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1000000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5100
     * @tc.name testMathImul051
     * @tc.desc Verify Math.imul with arguments 32767 and 32767 for expected return 1073676289
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 32767;
      let rightOperand: number = 32767;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1073676289);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5200
     * @tc.name testMathImul052
     * @tc.desc Verify Math.imul with arguments 32768 and 1 for expected return 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 32768;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(32768);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5300
     * @tc.name testMathImul053
     * @tc.desc Verify imul is static method callable via Math class name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.imul(3, 4);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5400
     * @tc.name testMathImul054
     * @tc.desc Verify imul idempotency with repeated same-argument calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 3;
      let rightOperand: number = 4;
      let firstCallProduct: number = Math.imul(leftOperand, rightOperand);
      let secondCallProduct: number = Math.imul(leftOperand, rightOperand);
      let thirdCallProduct: number = Math.imul(leftOperand, rightOperand);
      expect(firstCallProduct).assertEqual(12);
      expect(firstCallProduct).assertEqual(secondCallProduct);
      expect(secondCallProduct).assertEqual(thirdCallProduct);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5500
     * @tc.name testMathImul055
     * @tc.desc Verify imul commutativity with swapped argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 12345;
      let rightOperand: number = 67890;
      let forwardOrderProduct: number = Math.imul(leftOperand, rightOperand);
      let swappedOrderProduct: number = Math.imul(rightOperand, leftOperand);
      expect(forwardOrderProduct).assertEqual(838102050);
      expect(forwardOrderProduct).assertEqual(swappedOrderProduct);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5600
     * @tc.name testMathImul056
     * @tc.desc Verify imul in string hash computation scenario
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hash: number = 5381;
      let firstHashProduct: number = Math.imul(33, hash);
      hash = firstHashProduct + 65;
      let secondHashProduct: number = Math.imul(33, hash);
      hash = secondHashProduct + 66;
      let thirdHashProduct: number = Math.imul(33, hash);
      hash = thirdHashProduct + 67;
      expect(hash).assertEqual(193450027);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5700
     * @tc.name testMathImul057
     * @tc.desc Verify Math.imul with positive zero and negative zero returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveZero: number = 0.0;
      let negativeZero: number = -0.0;
      let result: number = Math.imul(positiveZero, negativeZero);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
      expect(Utils.isNegativeZero(result)).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5800
     * @tc.name testMathImul058
     * @tc.desc Verify Math.imul accepts a byte zero source value and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: byte = Int.toByte(0);
      let rightOperand: byte = Int.toByte(12);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5900
     * @tc.name testMathImul059
     * @tc.desc Verify Math.imul accepts a normal positive byte source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: byte = Int.toByte(12);
      let rightOperand: byte = Int.toByte(3);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(36);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6000
     * @tc.name testMathImul060
     * @tc.desc Verify Math.imul accepts a byte negative marker source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: byte = Int.toByte(-1);
      let rightOperand: byte = Int.toByte(5);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6100
     * @tc.name testMathImul061
     * @tc.desc Verify Math.imul accepts the byte maximum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: byte = Int.toByte(127);
      let rightOperand: byte = Int.toByte(2);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(254);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6200
     * @tc.name testMathImul062
     * @tc.desc Verify Math.imul accepts the byte minimum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: byte = Int.toByte(-128);
      let rightOperand: byte = Int.toByte(2);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-256);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6300
     * @tc.name testMathImul063
     * @tc.desc Verify Math.imul accepts a byte overflow-mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: byte = Int.toByte(128);
      let rightOperand: byte = Int.toByte(2);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(leftOperand).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(-256);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6400
     * @tc.name testMathImul064
     * @tc.desc Verify Math.imul accepts a short zero source value and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: short = Int.toShort(0);
      let rightOperand: short = Int.toShort(2048);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6500
     * @tc.name testMathImul065
     * @tc.desc Verify Math.imul accepts a normal positive short source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: short = Int.toShort(2048);
      let rightOperand: short = Int.toShort(2);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(4096);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6600
     * @tc.name testMathImul066
     * @tc.desc Verify Math.imul accepts a short negative marker source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: short = Int.toShort(-1);
      let rightOperand: short = Int.toShort(5);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6700
     * @tc.name testMathImul067
     * @tc.desc Verify Math.imul accepts the short maximum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: short = Int.toShort(32767);
      let rightOperand: short = Int.toShort(32767);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1073676289);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6800
     * @tc.name testMathImul068
     * @tc.desc Verify Math.imul accepts the short minimum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: short = Int.toShort(-32768);
      let rightOperand: short = Int.toShort(2);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-65536);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6900
     * @tc.name testMathImul069
     * @tc.desc Verify Math.imul accepts a short upper-limit mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: short = Int.toShort(65535);
      let rightOperand: short = Int.toShort(5);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(leftOperand).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7000
     * @tc.name testMathImul070
     * @tc.desc Verify Math.imul accepts an int maximum minus one source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: int = Int.MAX_VALUE - 1;
      let rightOperand: int = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(2147483646);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7100
     * @tc.name testMathImul071
     * @tc.desc Verify Math.imul accepts an int hexadecimal source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: int = 0x1234;
      let rightOperand: int = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(9320);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7200
     * @tc.name testMathImul072
     * @tc.desc Verify Math.imul accepts an int binary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: int = 0b1010;
      let rightOperand: int = 10;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(100);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7300
     * @tc.name testMathImul073
     * @tc.desc Verify Math.imul accepts an int octal source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: int = 0o123;
      let rightOperand: int = 3;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(249);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7400
     * @tc.name testMathImul074
     * @tc.desc Verify Math.imul accepts an int maximum boundary and wraps the product to signed int32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: int = Int.MAX_VALUE;
      let rightOperand: int = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7500
     * @tc.name testMathImul075
     * @tc.desc Verify Math.imul accepts an int minimum boundary and preserves signed int32 output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: int = Int.MIN_VALUE;
      let rightOperand: int = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7600
     * @tc.name testMathImul076
     * @tc.desc Verify Math.imul accepts an int overflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let leftOperand: int = maximumValue + 1;
      let rightOperand: int = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(leftOperand).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7700
     * @tc.name testMathImul077
     * @tc.desc Verify Math.imul accepts a long zero source value and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: long = Int.toLong(0);
      let rightOperand: long = Long.toLong(10000000000);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7800
     * @tc.name testMathImul078
     * @tc.desc Verify Math.imul accepts a positive long source value by low 32 bits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: long = Long.toLong(10000000000);
      let rightOperand: long = Int.toLong(1);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1410065408);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_7900
     * @tc.name testMathImul079
     * @tc.desc Verify Math.imul accepts a negative long source value by low 32 bits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: long = Long.toLong(-10000000000);
      let rightOperand: long = Int.toLong(1);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-1410065408);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8000
     * @tc.name testMathImul080
     * @tc.desc Verify Math.imul accepts a long maximum boundary source value on the int32 path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: long = Long.MAX_VALUE;
      let rightOperand: long = Int.toLong(1);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8100
     * @tc.name testMathImul081
     * @tc.desc Verify Math.imul accepts Long.MIN_VALUE source value on the int32 path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: long = Long.MIN_VALUE;
      let rightOperand: long = Int.toLong(1);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8200
     * @tc.name testMathImul082
     * @tc.desc Verify Math.imul accepts a long overflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let leftOperand: long = maximumValue + Int.toLong(1);
      let rightOperand: long = Int.toLong(1);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(leftOperand).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8300
     * @tc.name testMathImul083
     * @tc.desc Verify Math.imul accepts a normal positive float source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Double.toFloat(3.14);
      let rightOperand: float = Double.toFloat(2.0);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8400
     * @tc.name testMathImul084
     * @tc.desc Verify Math.imul accepts a negative float zero source value and returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Double.toFloat(-0.0);
      let rightOperand: float = Double.toFloat(99.99);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8500
     * @tc.name testMathImul085
     * @tc.desc Verify Math.imul accepts a negative float fractional source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Double.toFloat(-99.99);
      let rightOperand: float = Double.toFloat(2.0);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-198);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8600
     * @tc.name testMathImul086
     * @tc.desc Verify Math.imul accepts a positive float zero source value and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Double.toFloat(0.0);
      let rightOperand: float = Double.toFloat(99.99);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8700
     * @tc.name testMathImul087
     * @tc.desc Verify Math.imul accepts the float maximum boundary source value with zero multiplier
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Float.MAX_VALUE;
      let rightOperand: float = Double.toFloat(0.0);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8800
     * @tc.name testMathImul088
     * @tc.desc Verify Math.imul accepts the float minimum positive boundary source value on the int32 path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Float.MIN_VALUE;
      let rightOperand: float = Double.toFloat(1.0);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_8900
     * @tc.name testMathImul089
     * @tc.desc Verify Math.imul accepts direct Float.NaN input and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Float.NaN;
      let rightOperand: float = Double.toFloat(5.0);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9000
     * @tc.name testMathImul090
     * @tc.desc Verify Math.imul accepts direct Float.POSITIVE_INFINITY input and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Float.POSITIVE_INFINITY;
      let rightOperand: float = Double.toFloat(5.0);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9100
     * @tc.name testMathImul091
     * @tc.desc Verify Math.imul accepts direct Float.NEGATIVE_INFINITY input and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: float = Float.NEGATIVE_INFINITY;
      let rightOperand: float = Double.toFloat(5.0);
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9200
     * @tc.name testMathImul092
     * @tc.desc Verify Math.imul accepts a positive double fractional source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: double = 999999.99;
      let rightOperand: double = 2.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1999998);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9300
     * @tc.name testMathImul093
     * @tc.desc Verify Math.imul accepts a negative double fractional source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: double = -888.88;
      let rightOperand: double = 3.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2664);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9400
     * @tc.name testMathImul094
     * @tc.desc Verify Math.imul accepts the Double.MAX_VALUE boundary source value with zero multiplier
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: double = Double.MAX_VALUE;
      let rightOperand: double = 0.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9500
     * @tc.name testMathImul095
     * @tc.desc Verify Math.imul accepts the Double.MIN_VALUE boundary source value and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: double = Double.MIN_VALUE;
      let rightOperand: double = 1.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9600
     * @tc.name testMathImul096
     * @tc.desc Verify Math.imul accepts direct Double.NaN input and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: double = Double.NaN;
      let rightOperand: double = 5.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9700
     * @tc.name testMathImul097
     * @tc.desc Verify Math.imul accepts direct Double.POSITIVE_INFINITY input and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: double = Double.POSITIVE_INFINITY;
      let rightOperand: double = 5.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9800
     * @tc.name testMathImul098
     * @tc.desc Verify Math.imul accepts direct Double.NEGATIVE_INFINITY input and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: double = Double.NEGATIVE_INFINITY;
      let rightOperand: double = 5.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_9900
     * @tc.name testMathImul099
     * @tc.desc Verify Math.imul accepts a double overflowed source expression as Double.POSITIVE_INFINITY and returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: double = Double.MAX_VALUE * 2.0;
      let rightOperand: double = 5.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(leftOperand).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(0);
    });
  });
}
