'use static'
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';

export default function BigIntOperatorDivide2Test(): void {
  describe('testBigIntOperatorDivide2Test', (): void => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_0900
     * @tc.name testBigIntOperatorDivide2Test009
     * @tc.desc Mindmap input: operatorDivide exact division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorDivide(BigInt(2)).toString()).assertEqual('5');
      expect(BigInt(100).operatorDivide(BigInt(10)).toString()).assertEqual('10');
      expect(BigInt(1000).operatorDivide(BigInt(100)).toString()).assertEqual('10');
      expect(BigInt(42).operatorDivide(BigInt(42)).toString()).assertEqual('1');
      expect(BigInt(-42).operatorDivide(BigInt(-42)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1000
     * @tc.name testBigIntOperatorDivide2Test010
     * @tc.desc Mindmap input: operatorDivide sign combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-100).operatorDivide(BigInt(10)).toString()).assertEqual('-10');
      expect(BigInt(100).operatorDivide(BigInt(-10)).toString()).assertEqual('-10');
      expect(BigInt(-100).operatorDivide(BigInt(-10)).toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1100
     * @tc.name testBigIntOperatorDivide2Test011
     * @tc.desc Mindmap input: operatorDivide by 1 returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorDivide(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(1).operatorDivide(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(-1).operatorDivide(BigInt(1)).toString()).assertEqual('-1');
      expect(BigInt(42).operatorDivide(BigInt(1)).toString()).assertEqual('42');
      expect(BigInt(-42).operatorDivide(BigInt(1)).toString()).assertEqual('-42');
      expect(BigInt(2147483647).operatorDivide(BigInt(1)).toString()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1200
     * @tc.name testBigIntOperatorDivide2Test012
     * @tc.desc Mindmap input: operatorDivide by -1 negates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorDivide(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(-1).operatorDivide(BigInt(-1)).toString()).assertEqual('1');
      expect(BigInt(42).operatorDivide(BigInt(-1)).toString()).assertEqual('-42');
      expect(BigInt(-42).operatorDivide(BigInt(-1)).toString()).assertEqual('42');
      expect(BigInt(0).operatorDivide(BigInt(-1)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1300
     * @tc.name testBigIntOperatorDivide2Test013
     * @tc.desc Mindmap input: operatorDivide with zero dividend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorDivide(BigInt(2)).toString()).assertEqual('0');
      expect(BigInt(0).operatorDivide(BigInt(-2)).toString()).assertEqual('0');
      expect(BigInt(0).operatorDivide(BigInt(2147483647)).toString()).assertEqual('0');
      expect(BigInt(0).operatorDivide(BigInt(-2147483648)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1400
     * @tc.name testBigIntOperatorDivide2Test014
     * @tc.desc Mindmap truncation: operatorDivide positive truncation toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(7).operatorDivide(BigInt(2)).toString()).assertEqual('3');
      expect(BigInt(100).operatorDivide(BigInt(3)).toString()).assertEqual('33');
      expect(BigInt(1).operatorDivide(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt(3).operatorDivide(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt(5).operatorDivide(BigInt(2)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1500
     * @tc.name testBigIntOperatorDivide2Test015
     * @tc.desc Mindmap truncation: operatorDivide negative truncation toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-10).operatorDivide(BigInt(3)).toString()).assertEqual('-3');
      expect(BigInt(10).operatorDivide(BigInt(-3)).toString()).assertEqual('-3');
      expect(BigInt(-10).operatorDivide(BigInt(-3)).toString()).assertEqual('3');
      expect(BigInt(-7).operatorDivide(BigInt(2)).toString()).assertEqual('-3');
      expect(BigInt(7).operatorDivide(BigInt(-2)).toString()).assertEqual('-3');
      expect(BigInt(-7).operatorDivide(BigInt(-2)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1600
     * @tc.name testBigIntOperatorDivide2Test016
     * @tc.desc Mindmap large: operatorDivide beyond double safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9007199254740993').operatorDivide(BigInt(2)).toString()).assertEqual('4503599627370496');
      expect(BigInt('9223372036854775808').operatorDivide(BigInt(2)).toString()).assertEqual('4611686018427387904');
      expect(BigInt('-9223372036854775808').operatorDivide(BigInt(2)).toString()).assertEqual('-4611686018427387904');
      expect(BigInt('12345678901234567890').operatorDivide(BigInt('12345678901234567890')).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1700
     * @tc.name testBigIntOperatorDivide2Test017
     * @tc.desc Mindmap large: operatorDivide extra large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9999999999999999999').operatorDivide(BigInt(3)).toString()).assertEqual('3333333333333333333');
      expect(BigInt('100000000000000000000').operatorDivide(BigInt('100000000000000000000')).toString())
        .assertEqual('1');
      expect(BigInt('100000000000000000000').operatorDivide(BigInt(2)).toString()).assertEqual('50000000000000000000');
      expect(BigInt('-100000000000000000000').operatorDivide(BigInt(2)).toString())
        .assertEqual('-50000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1800
     * @tc.name testBigIntOperatorDivide2Test018
     * @tc.desc Mindmap error handling: operatorDivide various values by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(1).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(0).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(-1).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(2147483647).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(-2147483648).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_1900
     * @tc.name testBigIntOperatorDivide2Test019
     * @tc.desc OperatorDivide does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigIntOperatorDivide2Test019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const a = BigInt(10);
      const b = BigInt(3);
      const r = a.operatorDivide(b);
      expect(a.toString()).assertEqual('10');
      expect(b.toString()).assertEqual('3');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2000
     * @tc.name testBigIntOperatorDivide2Test020
     * @tc.desc Chain division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigIntOperatorDivide2Test020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(BigInt(100).operatorDivide(BigInt(10)).operatorDivide(BigInt(5)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2100
     * @tc.name testBigIntOperatorDivide2Test021
     * @tc.desc Complete negative truncation for small negative dividends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1).operatorDivide(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt(-3).operatorDivide(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt(-5).operatorDivide(BigInt(2)).toString()).assertEqual('-2');
      expect(BigInt(5).operatorDivide(BigInt(-2)).toString()).assertEqual('-2');
      expect(BigInt(-5).operatorDivide(BigInt(-2)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2200
     * @tc.name testBigIntOperatorDivide2Test022
     * @tc.desc LongMax divide by 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBigIntOperatorDivide2Test022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(BigInt('9223372036854775807').operatorDivide(BigInt(2)).toString()).assertEqual('4611686018427387903');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2300
     * @tc.name testBigIntOperatorDivide2Test023
     * @tc.desc Byte boundary values division: 127/3=42, -128/4=-32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorDivide(BigInt(3)).toString()).assertEqual('42');
      expect(BigInt(-128).operatorDivide(BigInt(4)).toString()).assertEqual('-32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2400
     * @tc.name testBigIntOperatorDivide2Test024
     * @tc.desc Short boundary values division: 32767/7=4681, -32768/(-8)=4096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(32767).operatorDivide(BigInt(7)).toString()).assertEqual('4681');
      expect(BigInt(-32768).operatorDivide(BigInt(-8)).toString()).assertEqual('4096');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2500
     * @tc.name testBigIntOperatorDivide2Test025
     * @tc.desc Int boundary values division: 2147483647/2=1073741823, -2147483648/(-4)=536870912
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2147483647).operatorDivide(BigInt(2)).toString()).assertEqual('1073741823');
      expect(BigInt(-2147483648).operatorDivide(BigInt(-4)).toString()).assertEqual('536870912');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2600
     * @tc.name testBigIntOperatorDivide2Test026
     * @tc.desc Divide boolean-constructed BigInt: true/1=1, false/99=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).operatorDivide(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(false).operatorDivide(BigInt(99)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2700
     * @tc.name testBigIntOperatorDivide2Test027
     * @tc.desc Divide string-constructed BigInt: "256"/"8"=32, "-512"/"-16"=32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('256').operatorDivide(BigInt('8')).toString()).assertEqual('32');
      expect(BigInt('-512').operatorDivide(BigInt('-16')).toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2800
     * @tc.name testBigIntOperatorDivide2Test028
     * @tc.desc Divide double-constructed BigInt: 64.0/4.0=16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(64.0).operatorDivide(BigInt(4.0)).toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_2900
     * @tc.name testBigIntOperatorDivide2Test029
     * @tc.desc Divide copy-constructed BigInt: copy(120)/copy(6)=20, copy(-180)/9=-20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(120)).operatorDivide(BigInt(BigInt(6))).toString()).assertEqual('20');
      expect(BigInt(BigInt(-180)).operatorDivide(BigInt(9)).toString()).assertEqual('-20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3000
     * @tc.name testBigIntOperatorDivide2Test030
     * @tc.desc Divide fromULong-constructed BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(0).operatorDivide(BigInt(50)).toString()).assertEqual('0');
      expect(BigInt.fromULong(1024).operatorDivide(BigInt.fromULong(32)).toString()).assertEqual('32');
      expect(BigInt.fromULong(-1).operatorDivide(BigInt(2)).toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3100
     * @tc.name testBigIntOperatorDivide2Test031
     * @tc.desc Divide asIntN/asUintN truncated BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(127)).operatorDivide(BigInt(3)).toString()).assertEqual('42');
      expect(BigInt.asIntN(8, BigInt(-128)).operatorDivide(BigInt(-4)).toString()).assertEqual('32');
      expect(BigInt.asUintN(8, BigInt(255)).operatorDivide(BigInt(5)).toString()).assertEqual('51');
      expect(BigInt.asIntN(1, BigInt(1)).operatorDivide(BigInt(-1)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, BigInt(1)).operatorDivide(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt.asUintN(16, BigInt(65535)).operatorDivide(BigInt(15)).toString()).assertEqual('4369');
      expect(BigInt.asUintN(32, BigInt(4294967295)).operatorDivide(BigInt(3)).toString()).assertEqual('1431655765');
      expect(BigInt.asUintN(64, BigInt.fromULong(-1)).operatorDivide(BigInt(4)).toString())
        .assertEqual('4611686018427387903');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3200
     * @tc.name testBigIntOperatorDivide2Test032
     * @tc.desc Divide pow-derived BigInt: 2^10/32=32, (-3)^3/(-9)=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).pow(BigInt(10)).operatorDivide(BigInt(32)).toString()).assertEqual('32');
      expect(BigInt(-3).pow(BigInt(3)).operatorDivide(BigInt(-9)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3300
     * @tc.name testBigIntOperatorDivide2Test033
     * @tc.desc Divide negate-derived BigInt: -(-20)/5=4, -(20)/(-2)=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-20).negate().operatorDivide(BigInt(5)).toString()).assertEqual('4');
      expect(BigInt(20).negate().operatorDivide(BigInt(-2)).toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3400
     * @tc.name testBigIntOperatorDivide2Test034
     * @tc.desc Divide add/subtract-derived BigInt: (10+50)/15=4, (200-80)/30=4, (30-150)/(-4)=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(50)).operatorDivide(BigInt(15)).toString()).assertEqual('4');
      expect(BigInt(100).operatorAdd(BigInt(-40)).operatorDivide(BigInt(12)).toString()).assertEqual('5');
      expect(BigInt(200).operatorSubtract(BigInt(80)).operatorDivide(BigInt(30)).toString()).assertEqual('4');
      expect(BigInt(30).operatorSubtract(BigInt(150)).operatorDivide(BigInt(-4)).toString()).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3500
     * @tc.name testBigIntOperatorDivide2Test035
     * @tc.desc Divide multiply/mod-derived BigInt: (7*8)/8=7, (-7*8)/4=-14, (29%6)/1=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(7).operatorMultiply(BigInt(8)).operatorDivide(BigInt(8)).toString()).assertEqual('7');
      expect(BigInt(-7).operatorMultiply(BigInt(8)).operatorDivide(BigInt(4)).toString()).assertEqual('-14');
      expect(BigInt(29).operatorModule(BigInt(6)).operatorDivide(BigInt(1)).toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3600
     * @tc.name testBigIntOperatorDivide2Test036
     * @tc.desc Divide bitwise/shift-derived BigInt: (28&12)/2=6, (12|5)/3=4, (12^5)/9=1, (16<<3)/2=64, (256>>2)/4=16, (~30)/(-1)=31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(28).operatorBitwiseAnd(BigInt(12)).operatorDivide(BigInt(2)).toString()).assertEqual('6');
      expect(BigInt(12).operatorBitwiseOr(BigInt(5)).operatorDivide(BigInt(3)).toString()).assertEqual('4');
      expect(BigInt(12).operatorBitwiseXor(BigInt(5)).operatorDivide(BigInt(9)).toString()).assertEqual('1');
      expect(BigInt(16).operatorLeftShift(BigInt(3)).operatorDivide(BigInt(2)).toString()).assertEqual('64');
      expect(BigInt(256).operatorRightShift(BigInt(2)).operatorDivide(BigInt(4)).toString()).assertEqual('16');
      expect(BigInt(30).operatorBitwiseNot().operatorDivide(BigInt(-1)).toString()).assertEqual('31');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3700
     * @tc.name testBigIntOperatorDivide2Test037
     * @tc.desc Divide inc/dec-derived BigInt: (41+1)/7=6, (56-1)/5=11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(41).operatorIncrement().operatorDivide(BigInt(7)).toString()).assertEqual('6');
      expect(BigInt(56).operatorDecrement().operatorDivide(BigInt(5)).toString()).assertEqual('11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3800
     * @tc.name testBigIntOperatorDivide2Test038
     * @tc.desc Divide BigInt reconstructed from formatted strings and getLong/getULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(1200).toString()).operatorDivide(BigInt(100)).toString()).assertEqual('12');
      expect(BigInt("0b"+BigInt('1000000').toString(2)).operatorDivide(BigInt(64)).toString()).assertEqual('15625');
      expect(BigInt("0x"+BigInt(4096).toString(16)).operatorDivide(BigInt(16)).toString()).assertEqual('256');
      expect(BigInt(BigInt(8000).getLong()).operatorDivide(BigInt(8)).toString()).assertEqual('1000');
      expect(BigInt(BigInt.fromULong(65536).getULong()).operatorDivide(BigInt(16)).toString()).assertEqual('4096');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_3900
     * @tc.name testBigIntOperatorDivide2Test039
     * @tc.desc Divide power-of-two values: 2^20/2^10=1024, -2^20/(-2^5)=32768, 3^5/3=81, -(3^5)/9=-27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1048576).operatorDivide(BigInt(1024)).toString()).assertEqual('1024');
      expect(BigInt(-1048576).operatorDivide(BigInt(-32)).toString()).assertEqual('32768');
      expect(BigInt(243).operatorDivide(BigInt(3)).toString()).assertEqual('81');
      expect(BigInt(-243).operatorDivide(BigInt(9)).toString()).assertEqual('-27');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4000
     * @tc.name testBigIntOperatorDivide2Test040
     * @tc.desc Divide mid-range numbers: 123456/12=10288, -123456/16=-7716
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(123456).operatorDivide(BigInt(12)).toString()).assertEqual('10288');
      expect(BigInt(-123456).operatorDivide(BigInt(16)).toString()).assertEqual('-7716');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4100
     * @tc.name testBigIntOperatorDivide2Test041
     * @tc.desc Dividend absolute value less than divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorDivide(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt(5).operatorDivide(BigInt(-10)).toString()).assertEqual('0');
      expect(BigInt(-5).operatorDivide(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt(-5).operatorDivide(BigInt(-10)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4200
     * @tc.name testBigIntOperatorDivide2Test042
     * @tc.desc Divide huge all-9 strings: "999...9"/9=111...1, "-999...9"/(-9)=111...1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9999999999999999999999999999').operatorDivide(BigInt(9)).toString())
        .assertEqual('1111111111111111111111111111');
      expect(BigInt('-9999999999999999999999999999').operatorDivide(BigInt(-9)).toString())
        .assertEqual('1111111111111111111111111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4300
     * @tc.name testBigIntOperatorDivide2Test043
     * @tc.desc Divide mid-range negative numbers: 12345678/123=100371, -12345678/(-123)=100371, 123456789/10000=12345, -123456789/10000=-12345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(12345678).operatorDivide(BigInt(123)).toString()).assertEqual('100371');
      expect(BigInt(-12345678).operatorDivide(BigInt(-123)).toString()).assertEqual('100371');
      expect(BigInt(123456789).operatorDivide(BigInt(10000)).toString()).assertEqual('12345');
      expect(BigInt(-123456789).operatorDivide(BigInt(10000)).toString()).assertEqual('-12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4400
     * @tc.name testBigIntOperatorDivide2Test044
     * @tc.desc Divide opposite-sign equal-abs: 666/(-666)=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(666).operatorDivide(BigInt(-666)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4500
     * @tc.name testBigIntOperatorDivide2Test045
     * @tc.desc Divide long string-constructed BigInt: "12345678901234567890"/"1000"=12345678901234567, negative variant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('12345678901234567890').operatorDivide(BigInt('1000')).toString()).assertEqual('12345678901234567');
      expect(BigInt('-12345678901234567890').operatorDivide(BigInt('-1000')).toString())
        .assertEqual('12345678901234567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4600
     * @tc.name testBigIntOperatorDivide2Test046
     * @tc.desc Divide by zero via boolean false: true/false throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(true).operatorDivide(BigInt(false));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4700
     * @tc.name testBigIntOperatorDivide2Test047
     * @tc.desc Divide by zero via literal 0 and empty constructor: 999/0 and 999/BigInt() throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(999).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(999).operatorDivide(new BigInt());
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4800
     * @tc.name testBigIntOperatorDivide2Test048
     * @tc.desc Divide by zero via string zero: "999..."/"0" throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt('999999999999').operatorDivide(BigInt('0'));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_4900
     * @tc.name testBigIntOperatorDivide2Test049
     * @tc.desc Divide by zero via fromULong(0): -1234/BigInt.fromULong(0) throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(-1234).operatorDivide(BigInt.fromULong(0));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5000
     * @tc.name testBigIntOperatorDivide2Test050
     * @tc.desc Divide by zero via asIntN zero: asUintN(32, 4294967295)/asIntN(8, 0) throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt.asUintN(32, BigInt(4294967295)).operatorDivide(BigInt.asIntN(8, BigInt(0)));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5100
     * @tc.name testBigIntOperatorDivide2Test051
     * @tc.desc Divide by zero via pow boolean: 10^18/BigInt(false) throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(10).pow(BigInt(18)).operatorDivide(BigInt(false));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5200
     * @tc.name testBigIntOperatorDivide2Test052
     * @tc.desc Divide by zero via formatted string and getLong: toString/BigInt(0) and getLong/BigInt() throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(BigInt('1234567').toString()).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(BigInt(9999).getLong()).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5300
     * @tc.name testBigIntOperatorDivide2Test053
     * @tc.desc Divide mixed-width unsigned: asUintN(16, 65535)/asUintN(8, 255)=257
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(16, BigInt(65535)).operatorDivide(BigInt.asUintN(8, BigInt(255))).toString())
        .assertEqual('257');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5400
     * @tc.name testBigIntOperatorDivide2Test054
     * @tc.desc Divide signed min by unsigned: asIntN(64, -2^63)/fromULong(1024)=-9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(64, BigInt(-9223372036854775808)).operatorDivide(BigInt.fromULong(1024)).toString())
        .assertEqual('-9007199254740992');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5500
     * @tc.name testBigIntOperatorDivide2Test055
     * @tc.desc Divide unsigned max by long max: fromULong(-1)/9223372036854775807=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-1).operatorDivide(BigInt(9223372036854775807)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5600
     * @tc.name testBigIntOperatorDivide2Test056
     * @tc.desc Divide string-constructed by double-constructed: "888...8"/8.0=111...1, 9007199254740991.0/"-1000"=-9007199254740
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('88888888888888888888').operatorDivide(BigInt(8.0)).toString()).assertEqual('11111111111111111111');
      expect(BigInt(9007199254740991.0).operatorDivide(BigInt('-1000')).toString()).assertEqual('-9007199254740');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5700
     * @tc.name testBigIntOperatorDivide2Test057
     * @tc.desc Divide copy-constructed by pow-derived: copy(1048576000)/2^10=1024000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt('1048576000')).operatorDivide(BigInt(2).pow(BigInt(10))).toString()).assertEqual('1024000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5800
     * @tc.name testBigIntOperatorDivide2Test058
     * @tc.desc Divide chained decrement/increment: (50-1-1)/8=6, (10+1+1)/6=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(50).operatorDecrement().operatorDecrement().operatorDivide(BigInt(8)).toString()).assertEqual('6');
      expect(BigInt(10).operatorIncrement().operatorIncrement().operatorDivide(BigInt(6)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_5900
     * @tc.name testBigIntOperatorDivide2Test059
     * @tc.desc Divide mixed-format BigInt: binary-string/hex-string=16, zh-CN/en-US=1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt("0b"+BigInt('4096').toString(2)).operatorDivide(BigInt("0x"+BigInt('256').toString(16))).toString())
        .assertEqual('16');
      expect(BigInt(1000000).operatorDivide(BigInt(1000)).toString()).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_6000
     * @tc.name testBigIntOperatorDivide2Test060
     * @tc.desc Divide mod-result by modulus base: remainder always between 0 and m, so remainder/m = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorModule(BigInt(7)).operatorDivide(BigInt(7)).toString()).assertEqual('0');
      expect(BigInt(-100).operatorModule(BigInt(7)).operatorDivide(BigInt(7)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_6100
     * @tc.name testBigIntOperatorDivide2Test061
     * @tc.desc Divide shifted negative: (-16<<3)/4=-32, (1048576>>5)/(-2)=-16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-16).operatorLeftShift(BigInt(3)).operatorDivide(BigInt(4)).toString()).assertEqual('-32');
      expect(BigInt(1048576).operatorRightShift(BigInt(5)).operatorDivide(BigInt(-2)).toString()).assertEqual('-16384');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_6200
     * @tc.name testBigIntOperatorDivide2Test062
     * @tc.desc Divide smaller type max/min by larger type max/min yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorDivide(BigInt(32767)).toString()).assertEqual('0');
      expect(BigInt(-32768).operatorDivide(BigInt(2147483647)).toString()).assertEqual('0');
      expect(BigInt(2147483647).operatorDivide(BigInt('9223372036854775807')).toString()).assertEqual('0');
      expect(BigInt(-9223372036854775808).operatorDivide(BigInt.fromULong(-1)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_6300
     * @tc.name testBigIntOperatorDivide2Test063
     * @tc.desc Divide 2^60 by 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).pow(BigInt(60)).operatorDivide(BigInt(3)).toString()).assertEqual('384307168202282325');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DIVIDE_6400
     * @tc.name testBigIntOperatorDivide2Test064
     * @tc.desc Divide (-2)^60 by (-3)^3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivide2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-2).pow(BigInt(60)).operatorDivide(BigInt(-3).pow(BigInt(3))).toString())
        .assertEqual('-42700796466920258');
    });
  });
}
