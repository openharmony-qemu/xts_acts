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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

function getBigInt(): BigInt {
  return BigInt(100);
}


class ObjA { a: BigInt = BigInt(0); }
class ObjB { b: BigInt = BigInt(0); }

export default function BigIntOperatorAddTest_2(): void {
  describe('BigIntOperatorAddTest_2', () => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0100
     * @tc.name testBigIntOperatorAddTest001
     * @tc.desc operatorAdd with byte/short type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(127) + BigInt(1)).toString()).assertEqual('128');
      expect((BigInt(-128) + BigInt(-1)).toString()).assertEqual('-129');
      expect((BigInt(127) + BigInt(-128)).toString()).assertEqual('-1');
      expect((BigInt(32767) + BigInt(1)).toString()).assertEqual('32768');
      expect((BigInt(-32768) + BigInt(-1)).toString()).assertEqual('-32769');
      expect((BigInt(32767) + BigInt(-32768)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0200
     * @tc.name testBigIntOperatorAddTest002
     * @tc.desc operatorAdd with int type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(2147483647) + BigInt(1)).toString()).assertEqual('2147483648');
      expect((BigInt(-2147483648) + BigInt(-1)).toString()).assertEqual('-2147483649');
      expect((BigInt(2147483647) + BigInt(-2147483648)).toString()).assertEqual('-1');
      expect((BigInt(2147483647) + BigInt(2147483647)).toString()).assertEqual('4294967294');
      expect((BigInt(-2147483648) + BigInt(-2147483648)).toString()).assertEqual('-4294967296');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0300
     * @tc.name testBigIntOperatorAddTest003
     * @tc.desc operatorAdd with 20-digit and 40-digit large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v20 = '12345678901234567890';
      const v20_neg = '-12345678901234567890';
      const v40 = '1234567890123456789012345678901234567890';
      const v40_neg = '-1234567890123456789012345678901234567890';

      expect((BigInt(v20) + BigInt(v20)).toString()).assertEqual('24691357802469135780');
      expect((BigInt(v20) + BigInt(v20_neg)).toString()).assertEqual('0');
      expect((BigInt(v40) + BigInt(v40)).toString()).assertEqual('2469135780246913578024691357802469135780');
      expect((BigInt(v40) + BigInt(v40_neg)).toString()).assertEqual('0');
      expect((BigInt(v20) + BigInt(v40)).toString()).assertEqual('1234567890123456789024691357802469135780');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0400
     * @tc.name testBigIntOperatorAddTest004
     * @tc.desc operatorAdd with BigInt from different constructor formats (number vs string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt('127') + BigInt('1')).toString()).assertEqual((BigInt(127) + BigInt(1)).toString());
      expect((BigInt('-128') + BigInt('-1')).toString()).assertEqual((BigInt(-128) + BigInt(-1)).toString());
      expect((BigInt('32767') + BigInt('1')).toString()).assertEqual((BigInt(32767) + BigInt(1)).toString());
      expect((BigInt('2147483647') + BigInt('1')).toString()).assertEqual((BigInt(2147483647) + BigInt(1)).toString());
      expect((BigInt('9223372036854775807') + BigInt('1')).toString()).assertEqual((BigInt(9223372036854775807) + BigInt(1)).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0500
     * @tc.name testBigIntOperatorAddTest005
     * @tc.desc operatorAdd with values near zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(0) + BigInt(0)).toString()).assertEqual('0');
      expect((BigInt(1) + BigInt(-1)).toString()).assertEqual('0');
      expect((BigInt(-1) + BigInt(1)).toString()).assertEqual('0');
      expect((BigInt(1) + BigInt(0)).toString()).assertEqual('1');
      expect((BigInt(0) + BigInt(1)).toString()).assertEqual('1');
      expect((BigInt(-1) + BigInt(0)).toString()).assertEqual('-1');
      expect((BigInt(0) + BigInt(-1)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0600
     * @tc.name testBigIntOperatorAddTest006
     * @tc.desc operatorAdd with powers of 10 and all-9s boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(10) + BigInt(10)).toString()).assertEqual('20');
      expect((BigInt(100) + BigInt(100)).toString()).assertEqual('200');
      expect((BigInt('1000000000000000000') + BigInt('1000000000000000000')).toString()).assertEqual('2000000000000000000');
      expect((BigInt('9999999999999999999') + BigInt('1')).toString()).assertEqual('10000000000000000000');
      expect((BigInt('9999999999999999999') + BigInt('9999999999999999999')).toString()).assertEqual('19999999999999999998');
      expect((BigInt('-1000000000000000000') + BigInt('-1000000000000000000')).toString()).assertEqual('-2000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0700
     * @tc.name testBigIntOperatorAddTest007
     * @tc.desc operatorAdd with 100-digit extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big100 = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      const big100_2 = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999998';
      const negBig100 = '-' + big100;

      expect((BigInt(big100) + BigInt('1')).toString()).assertEqual('10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
      expect((BigInt(big100) + BigInt(negBig100)).toString()).assertEqual('0');
      const sumBig = BigInt(big100) + BigInt(big100_2);
      expect(sumBig.toString()).assertEqual('19999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999997');
      expect((BigInt(negBig100) + BigInt('-1')).toString()).assertEqual('-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0800
     * @tc.name testBigIntOperatorAddTest008
     * @tc.desc sequential mixed operatorAdd calls without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(42);
      expect((a + BigInt(10)).toString()).assertEqual('52');
      expect((a + BigInt(-10)).toString()).assertEqual('32');
      expect((a + BigInt(0)).toString()).assertEqual('42');
      expect((a + BigInt(-42)).toString()).assertEqual('0');
      expect((a + BigInt(42)).toString()).assertEqual('84');
      expect(a.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_0900
     * @tc.name testBigIntOperatorAddTest009
     * @tc.desc operatorAdd symmetry: positive + negative of same magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(5) + BigInt(-5)).toString()).assertEqual('0');
      expect((BigInt(-5) + BigInt(5)).toString()).assertEqual('0');
      expect((BigInt('99999999999999999999') + BigInt('-99999999999999999999')).toString()).assertEqual('0');
      expect((BigInt('-99999999999999999999') + BigInt('99999999999999999999')).toString()).assertEqual('0');
      expect((BigInt('123456789012345678901234567890') + BigInt('-123456789012345678901234567890')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1000
     * @tc.name testBigIntOperatorAddTest010
     * @tc.desc operatorAdd with fromULong: positive, neg-arg, mixed, wrap, boundary, bool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt.fromULong(1) + BigInt.fromULong(2)).toString()).assertEqual('3');

      expect((BigInt.fromULong(-1) + BigInt.fromULong(1)).toString()).assertEqual('18446744073709551616');

      expect((BigInt.fromULong(100) + BigInt(50)).toString()).assertEqual('150');

      expect((BigInt.fromULong(-1) + BigInt.fromULong(2)).toString()).assertEqual('18446744073709551617');

      expect((BigInt.fromULong(127) + BigInt.fromULong(1)).toString()).assertEqual('128');

      expect((BigInt.fromULong(-1) + BigInt(1)).toString()).assertEqual('18446744073709551616');

      expect((BigInt.fromULong(255) + BigInt(1)).toString()).assertEqual((BigInt('255') + BigInt('1')).toString());
      expect((BigInt.fromULong(0) + BigInt(true)).toString()).assertEqual('1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1100
     * @tc.name testBigIntOperatorAddTest011
     * @tc.desc operatorAdd with large multi-digit values (30-digit, 100-digit, 500-digit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: string[][] = [
        ['122222222222222222222222222222', '988888888888888888888888888888'],
        ['1222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222', '9888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888'],
        ['12222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222', '98888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888'],
      ];
      for (let p = 0; p < pairs.length; p++) {
        const a = BigInt(pairs[p][0]);
        const b = BigInt(pairs[p][1]);
        const result = a + b;
        expect(result.operatorLessThan(BigInt(0))).assertFalse();
        expect(result.toString().length).assertLargerOrEqual(pairs[p][0].length);
        const negA = BigInt('-' + pairs[p][0]);
        const negB = BigInt('-' + pairs[p][1]);
        const negResult = negA + negB;
        expect(negResult.operatorLessThan(BigInt(0))).assertTrue();
        expect(negResult.toString().length).assertLargerOrEqual(pairs[p][0].length);
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1200
     * @tc.name testBigIntOperatorAddTest012
     * @tc.desc operatorAdd verification: reverse-subtract for representative pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: BigInt[][] = [
        [BigInt('12345678901234567890'), BigInt('9876543210987654321')],
        [BigInt('99999999999999999999'), BigInt('1')],
        [BigInt('111111111111111111111111111111'), BigInt('888888888888888888888888888889')],
        [BigInt('999999999999999999999999999999'), BigInt('999999999999999999999999999999')],
        [BigInt('1234567890123456789012345678901234567890'), BigInt('1234567890123456789012345678901234567890')],
      ];
      for (let p = 0; p < pairs.length; p++) {
        const a = pairs[p][0];
        const b = pairs[p][1];
        const sum = a + b;
        expect((sum + (-b)).toString()).assertEqual(a.toString());
        expect((sum + (-a)).toString()).assertEqual(b.toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1300
     * @tc.name testBigIntOperatorAddTest013
     * @tc.desc operatorAdd distributive law: (a + b*c) == (a*c + b*c) for sign combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(((BigInt(3) + BigInt(4)) * BigInt(5)).toString()).assertEqual((BigInt(3) * BigInt(5) + BigInt(4) * BigInt(5)).toString());
      expect((BigInt(5) * (BigInt(3) + BigInt(4))).toString()).assertEqual((BigInt(5) * BigInt(3) + BigInt(5) * BigInt(4)).toString());

      expect(((BigInt(-3) + BigInt(10)) * BigInt(5)).toString()).assertEqual((BigInt(-3) * BigInt(5) + BigInt(10) * BigInt(5)).toString());
      expect((BigInt(5) * (BigInt(-3) + BigInt(10))).toString()).assertEqual((BigInt(5) * BigInt(-3) + BigInt(5) * BigInt(10)).toString());

      expect(((BigInt(-3) + BigInt(-7)) * BigInt(5)).toString()).assertEqual((BigInt(-3) * BigInt(5) + BigInt(-7) * BigInt(5)).toString());
      expect((BigInt(5) * (BigInt(-3) + BigInt(-7))).toString()).assertEqual((BigInt(5) * BigInt(-3) + BigInt(5) * BigInt(-7)).toString());

      const bigA = BigInt('12345678901234567890');
      const bigB = BigInt('9876543210987654321');
      const bigC = BigInt(2);
      expect(((bigA + bigB) * bigC).toString()).assertEqual((bigA * bigC + bigB * bigC).toString());
      expect((bigC * (bigA + bigB)).toString()).assertEqual((bigC * bigA + bigC * bigB).toString());
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1400
     * @tc.name testBigIntOperatorAddTest014
     * @tc.desc operatorAdd with distributive law factor extraction: a*c + b*c = (a+b)*c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(7);
      const b = BigInt(3);
      const c = BigInt(11);
      const left = (a * c) + b * c;
      const right = (a + b) * c;
      expect(left.toString()).assertEqual(right.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1500
     * @tc.name testBigIntOperatorAddTest015
     * @tc.desc operatorAdd zero identity: x + 0 = x for various 0 constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(42) + BigInt(0)).toString()).assertEqual('42');
      expect((BigInt(42) + BigInt('0')).toString()).assertEqual('42');
      expect((BigInt(42) + BigInt('0x0')).toString()).assertEqual('42');
      expect((BigInt(42) + BigInt('0o0')).toString()).assertEqual('42');
      expect((BigInt(42) + BigInt('0b0')).toString()).assertEqual('42');
      expect((BigInt(42) + BigInt(false)).toString()).assertEqual('42');
      expect((BigInt(42) + BigInt.fromULong(0)).toString()).assertEqual('42');
      expect((BigInt(-42) + BigInt(0)).toString()).assertEqual('-42');
      expect((BigInt('999999999999999999999999999999') + BigInt(0)).toString()).assertEqual('999999999999999999999999999999');
      expect((BigInt(42) + BigInt(-42)).toString()).assertEqual('0');
      expect((BigInt(-42) + BigInt(42)).toString()).assertEqual('0');

      expect(BigInt(0).operatorAdd(BigInt(127)).toString()).assertEqual('127');
      expect(BigInt(0).operatorAdd(BigInt(-128)).toString()).assertEqual('-128');
      expect(BigInt(0).operatorAdd(BigInt(32767)).toString()).assertEqual('32767');
      expect(BigInt(0).operatorAdd(BigInt(-32768)).toString()).assertEqual('-32768');
      expect(BigInt(0).operatorAdd(BigInt(2147483647)).toString()).assertEqual('2147483647');
      expect(BigInt(0).operatorAdd(BigInt(-2147483648)).toString()).assertEqual('-2147483648');
      expect(BigInt(0).operatorAdd(BigInt('9223372036854775807')).toString()).assertEqual('9223372036854775807');
      expect(BigInt(0).operatorAdd(BigInt('-9223372036854775808')).toString()).assertEqual('-9223372036854775808');

      expect(BigInt(0).operatorAdd(BigInt(true)).toString()).assertEqual('1');
      expect(BigInt(0).operatorAdd(BigInt(false)).toString()).assertEqual('0');
      expect(BigInt(false).operatorAdd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(true).operatorAdd(BigInt(0)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1600
     * @tc.name testBigIntOperatorAddTest016
     * @tc.desc operatorAdd cross-constructor: byte+str, bool+int, ulong+str, str+hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(100) + BigInt('50')).toString()).assertEqual('150');
      expect((BigInt(255) + BigInt('0xFF')).toString()).assertEqual('510');
      expect((BigInt(true) + BigInt(0)).toString()).assertEqual('1');
      expect((BigInt(false) + BigInt(1)).toString()).assertEqual('1');
      expect((BigInt.fromULong(100) + BigInt(50)).toString()).assertEqual('150');
      expect((BigInt.fromULong(255) + BigInt('255')).toString()).assertEqual('510');
      expect((BigInt('255') + BigInt('0xFF')).toString()).assertEqual('510');
      expect((BigInt(-100) + BigInt('-100')).toString()).assertEqual('-200');
      expect((BigInt(0) + BigInt('0')).toString()).assertEqual('0');
      expect((BigInt(0) + BigInt('0x0')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1700
     * @tc.name testBigIntOperatorAddTest017
     * @tc.desc operatorAdd round-trip: sum.toString() round-trip for representative cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cases: BigInt[][] = [
        [BigInt(12345), BigInt(67890)],
        [BigInt('123456789012345678901234567890'), BigInt('98765432109876543210987654321')],
        [BigInt('99999999999999999999999999999999999999999999'), BigInt('11111111111111111111111111111111111111111111')],
      ];
      for (let i = 0; i < cases.length; i++) {
        const sum = cases[i][0] + cases[i][1];
        const rt = BigInt(sum.toString());
        expect(rt.toString()).assertEqual(sum.toString());
      }
      expect(BigInt((BigInt(2147483647) + BigInt(1)).toString()).toString()).assertEqual('2147483648');
      expect(BigInt((BigInt(-2147483648) + BigInt(-1)).toString()).toString()).assertEqual('-2147483649');
      expect(BigInt((BigInt(9223372036854775807) + BigInt(1)).toString()).toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1800
     * @tc.name testBigIntOperatorAddTest018
     * @tc.desc operatorAdd chained addition: 3-small, 10-small sum=55, large accum, symmetry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((BigInt(10) + BigInt(20)) + BigInt(30)).toString()).assertEqual('60');
      expect((((BigInt(100) + BigInt(-30)) + BigInt(20)) + BigInt(-10)).toString()).assertEqual('80');
      let sum = BigInt(0);
      for (let i = 1; i <= 10; i++) { sum = sum + BigInt(i); }
      expect(sum.toString()).assertEqual('55');
      let largeSum = BigInt('10000000000000000000');
      largeSum = largeSum + BigInt('20000000000000000000');
      largeSum = largeSum + BigInt('30000000000000000000');
      largeSum = largeSum + BigInt('40000000000000000000');
      expect(largeSum.toString()).assertEqual('100000000000000000000');
      const a = BigInt(10), b = BigInt(20), c = BigInt(30);
      expect(((a + b) + c).toString()).assertEqual(((c + b) + a).toString());
      let sum30 = BigInt(0);
      for (let i = 1; i <= 30; i++) { sum30 = sum30 + BigInt(i); }
      expect(sum30.toString()).assertEqual('465');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_1900
     * @tc.name testBigIntOperatorAddTest019
     * @tc.desc operatorAdd with chain add with identity check at each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = BigInt(0);
      s = s + BigInt(10); expect(s.toString()).assertEqual('10');
      s = s + BigInt(20); expect(s.toString()).assertEqual('30');
      s = s + BigInt(-15); expect(s.toString()).assertEqual('15');
      s = s + BigInt(-15); expect(s.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2000
     * @tc.name testBigIntOperatorAddTest020
     * @tc.desc operatorAdd with chain add large alternating sign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((BigInt('99999999999999999999') + BigInt('-50000000000000000000')) + BigInt('10000000000000000000')).toString()).assertEqual('59999999999999999999');
      expect(((BigInt('-99999999999999999999') + BigInt('50000000000000000000')) + BigInt('-10000000000000000000')).toString()).assertEqual('-59999999999999999999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2100
     * @tc.name testBigIntOperatorAddTest021
     * @tc.desc operatorAdd with chain add seven huge digit-length values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = '111111111111111111111111111111';
      const b = '222222222222222222222222222222';
      const c = '333333333333333333333333333333';
      const d = '444444444444444444444444444444';
      const e = '555555555555555555555555555555';
      const f = '666666666666666666666666666666';
      const g = '777777777777777777777777777777';
      const sum = (((((BigInt(a) + BigInt(b)) + BigInt(c)) + BigInt(d)) + BigInt(e)) + BigInt(f)) + BigInt(g);
      expect(sum.toString()).assertEqual('3111111111111111111111111111108');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2200
     * @tc.name testBigIntOperatorAddTest022
     * @tc.desc operatorAdd associativity for representative sign/cross-format combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((BigInt(3) + BigInt(5)) + BigInt(7)).toString()).assertEqual((BigInt(3) +( BigInt(5) + BigInt(7))).toString());
      expect(((BigInt(-3) + BigInt(-5)) + BigInt(-7)).toString()).assertEqual((BigInt(-3) + (BigInt(-5) + BigInt(-7))).toString());
      expect(((BigInt(10) + BigInt(-5)) + BigInt(3)).toString()).assertEqual((BigInt(10) +( BigInt(-5) + BigInt(3))).toString());
      expect(((BigInt('12345678901234567890') + BigInt('9876543210987654321')) + BigInt('11111111111111111111')).toString()).assertEqual((BigInt('12345678901234567890') + BigInt('9876543210987654321') + BigInt('11111111111111111111')).toString());
      expect(((BigInt(7) + BigInt(7)) + BigInt(7)).toString()).assertEqual((BigInt(7) + (BigInt(7) + BigInt(7))).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2300
     * @tc.name testBigIntOperatorAddTest023
     * @tc.desc operatorAdd with associativity at extreme value boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');
      const one = BigInt(1);
      expect(((max + one) + min).toString()).assertEqual((max +( one + min)).toString());
      expect(((max + one) + min).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2400
     * @tc.name testBigIntOperatorAddTest024
     * @tc.desc operatorAdd extreme boundary: max+max, min+min, max+min, max+1, min-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');
      expect((max + max).toString()).assertEqual('18446744073709551614');
      expect((min + min).toString()).assertEqual('-18446744073709551616');
      expect((max + min).toString()).assertEqual('-1');
      expect((max + BigInt(1)).toString()).assertEqual('9223372036854775808');
      expect((min + BigInt(-1)).toString()).assertEqual('-9223372036854775809');
      expect((max + min + BigInt(1)).toString()).assertEqual('0');
      expect((BigInt(127) + BigInt(127)).toString()).assertEqual('254');
      expect((BigInt(32767) + BigInt(32767)).toString()).assertEqual('65534');
      expect((BigInt(2147483647) + BigInt(2147483647)).toString()).assertEqual('4294967294');
      expect((BigInt('99999999999999999999') + BigInt('99999999999999999999')).toString()).assertEqual('199999999999999999998');
      expect(BigInt('18446744073709551615').operatorBitwiseOr(BigInt(0)).toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2500
     * @tc.name testBigIntOperatorAddTest025
     * @tc.desc operatorAdd with bonus test for extra coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(1199) + BigInt(1199)).toString()).assertEqual('2398');
    expect((BigInt(-1199) + BigInt(-1199)).toString()).assertEqual('-2398');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2600
     * @tc.name testBigIntOperatorAddTest026
     * @tc.desc operatorAdd with this from double and other from int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5.0).operatorAdd(BigInt(3)).toString()).assertEqual('8');
      expect(BigInt(10.0).operatorAdd(BigInt(-4)).toString()).assertEqual('6');
      expect(BigInt(-7.0).operatorAdd(BigInt(2)).toString()).assertEqual('-5');
      expect(BigInt(0.0).operatorAdd(BigInt(0)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2700
     * @tc.name testBigIntOperatorAddTest027
     * @tc.desc operatorAdd with this from BigInt copy and other from boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const orig10 = BigInt(10);
      const a = BigInt(orig10);
      expect(a.operatorAdd(BigInt(true)).toString()).assertEqual('11');
      const origNeg5 = BigInt(-5);
      const b = BigInt(origNeg5);
      expect(b.operatorAdd(BigInt(false)).toString()).assertEqual('-5');
      const orig0 = BigInt(0);
      const c = BigInt(orig0);
      expect(c.operatorAdd(BigInt(true)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2800
     * @tc.name testBigIntOperatorAddTest028
     * @tc.desc operatorAdd with power-of-2 and power-of-10 addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(2) ** BigInt(50) + BigInt(2) ** BigInt(50)).toString()).assertEqual((BigInt(2) ** BigInt(51)).toString());
      expect((BigInt(2) ** BigInt(100) + BigInt(2) ** BigInt(100)).toString()).assertEqual((BigInt(2) ** BigInt(101)).toString());
      expect((BigInt(2) ** BigInt(200) + BigInt(2) ** BigInt(200)).toString()).assertEqual((BigInt(2) ** BigInt(201)).toString());
      expect((BigInt(10) ** BigInt(20) + BigInt(10) ** BigInt(20)).toString()).assertEqual((BigInt(2) * BigInt(10) ** BigInt(20)).toString());
      expect((BigInt(10) ** BigInt(50) + BigInt(10) ** BigInt(50)).toString()).assertEqual((BigInt(2) * BigInt(10) ** BigInt(50)).toString());
      expect((BigInt(10) ** BigInt(100) + BigInt(10) ** BigInt(100)).toString()).assertEqual((BigInt(2) * BigInt(10) ** BigInt(100)).toString());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_2900
     * @tc.name testBigIntOperatorAddTest029
     * @tc.desc operatorAdd with large power negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-(BigInt(10) ** BigInt(100)) + (-(BigInt(10) ** BigInt(100)))).toString()).assertEqual((-(BigInt(2) * BigInt(10) ** BigInt(100))).toString());
      expect((BigInt(10) ** BigInt(100) + (-(BigInt(10) ** BigInt(100)))).toString()).assertEqual('0');
      expect((BigInt(10) ** BigInt(100) + BigInt(1)).toString()).assertEqual(BigInt(10).pow(BigInt(100)).operatorAdd(BigInt(1)).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3000
     * @tc.name testBigIntOperatorAddTest030
     * @tc.desc operatorAdd with function return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(getBigInt().operatorAdd(BigInt(100)).toString()).assertEqual('200');
      expect(getBigInt().operatorAdd(BigInt(-50)).toString()).assertEqual('50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3100
     * @tc.name testBigIntOperatorAddTest031
     * @tc.desc operatorAdd with conditional expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest031', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true ? BigInt(10) : BigInt(20)).operatorAdd(BigInt(30)).toString()).assertEqual('40');
      expect((false ? BigInt(10) : BigInt(20)).operatorAdd(BigInt(30)).toString()).assertEqual('50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3200
     * @tc.name testBigIntOperatorAddTest032
     * @tc.desc operatorAdd with array element access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest032', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigInt[] = [BigInt(10), BigInt(20), BigInt(30)];
      expect(arr[0].operatorAdd(arr[1]).toString()).assertEqual('30');
      expect(arr[1].operatorAdd(arr[2]).toString()).assertEqual('50');
      expect(arr[0].operatorAdd(arr[2]).toString()).assertEqual('40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3300
     * @tc.name testBigIntOperatorAddTest033
     * @tc.desc operatorAdd with object property access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest033', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const objA: ObjA = new ObjA();
      objA.a = BigInt(10);
      const objB: ObjB = new ObjB();
      objB.b = BigInt(20);
      expect((objA.a as BigInt).operatorAdd((objB.b as BigInt)).toString()).assertEqual('30');
      expect((objA.a as BigInt).operatorAdd((objA.a as BigInt)).toString()).assertEqual('20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3400
     * @tc.name testBigIntOperatorAddTest034
     * @tc.desc operatorAdd result consistency with equals and operator+
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest034', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const b = BigInt(200);
      const result = a.operatorAdd(b);
      const expected = BigInt(300);
      expect(result.equals(expected)).assertTrue();
      expect(result.equals(a + b)).assertTrue();
      expect(BigInt(100).operatorAdd(BigInt(200)).equals(BigInt(100) + BigInt(200))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3500
     * @tc.name testBigIntOperatorAddTest035
     * @tc.desc operatorAdd with zero and string "-0" constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest035', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = BigInt(0);
      const other = BigInt('-0');
      expect(zero.operatorAdd(other).toString()).assertEqual('0');
      expect(other.operatorAdd(zero).toString()).assertEqual('0');
      expect(other.operatorAdd(other).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3600
     * @tc.name testBigIntOperatorAddTest036
     * @tc.desc operatorAdd return value is BigInt instance and original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest036', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(10);
      const b = BigInt(20);
      const result = a.operatorAdd(b);
      expect(result instanceof BigInt).assertTrue();
      const originalA = a.toString();
      const originalB = b.toString();
      a.operatorAdd(b);
      expect(a.toString()).assertEqual(originalA);
      expect(b.toString()).assertEqual(originalB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3700
     * @tc.name testBigIntOperatorAddTest037
     * @tc.desc operatorAdd with both operands from string constructor (positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest037', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt('123') + BigInt('456')).toString()).assertEqual('579');
      expect((BigInt('111111111111111111111111111111') + BigInt('222222222222222222222222222222')).toString()).assertEqual('333333333333333333333333333333');
      expect((BigInt('999999999999999999999999999999') + BigInt('999999999999999999999999999999')).toString()).assertEqual('1999999999999999999999999999998');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3800
     * @tc.name testBigIntOperatorAddTest038
     * @tc.desc operatorAdd with int boundary cross zero identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest038', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(2147483647) + BigInt(-2147483647)).toString()).assertEqual('0');
      expect((BigInt(-2147483648) + BigInt('2147483648')).toString()).assertEqual('0');
      expect((BigInt('9223372036854775807') + BigInt('-9223372036854775807')).toString()).assertEqual('0');
      expect((BigInt('-9223372036854775808') + BigInt('9223372036854775808')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_3900
     * @tc.name testBigIntOperatorAddTest039
     * @tc.desc operatorAdd with digit combos and neg-pos patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest039', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(10) + BigInt(20)).toString()).assertEqual('30');
      expect((BigInt(100000) + BigInt(200000)).toString()).assertEqual('300000');
      expect((BigInt(-5) + BigInt(3)).toString()).assertEqual('-2');
      expect((BigInt(-3) + BigInt(5)).toString()).assertEqual('2');
      expect((BigInt(-100) + BigInt(50)).toString()).assertEqual('-50');
      expect((BigInt(-50) + BigInt(100)).toString()).assertEqual('50');
      expect((BigInt(-999) + BigInt(1)).toString()).assertEqual('-998');
      expect((BigInt(-1) + BigInt(999)).toString()).assertEqual('998');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_4000
     * @tc.name testBigIntOperatorAddTest040
     * @tc.desc operatorAdd with Map get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest040', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const map: Map<string, BigInt> = new Map<string, BigInt>();
      map.set('a', BigInt(10));
      map.set('b', BigInt(20));
      const valA = map.get('a');
      const valB = map.get('b');
      if (valA !== undefined && valB !== undefined) {
        expect(valA.operatorAdd(valB).toString()).assertEqual('30');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_4100
     * @tc.name testBigIntOperatorAddTest041
     * @tc.desc operatorAdd chain result consistency with single addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest041', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(20)).operatorAdd(BigInt(30)).toString()).assertEqual('60');
      expect((BigInt(10) + BigInt(20) + BigInt(30)).toString()).assertEqual('60');
      expect(BigInt(10).operatorAdd(BigInt(20)).operatorAdd(BigInt(30)).equals(BigInt(10) + BigInt(20) + BigInt(30))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_4200
     * @tc.name testBigIntOperatorAddTest042
     * @tc.desc operatorAdd with mixed large pos+neg crossing type boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest042', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt('5000000000000000000') + BigInt('-1000000000000000000')).toString()).assertEqual('4000000000000000000');
      expect((BigInt('-5000000000000000000') + BigInt('1000000000000000000')).toString()).assertEqual('-4000000000000000000');
      expect((BigInt('18446744073709551615') + BigInt('-9223372036854775808')).toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_4300
     * @tc.name testBigIntOperatorAddTest043
     * @tc.desc operatorAdd with large pow values + small adjust
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest043', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pow100 = BigInt(10) ** BigInt(100);
      expect((pow100 + BigInt(1)).toString()).assertEqual(BigInt(10).pow(BigInt(100)).operatorAdd(BigInt(1)).toString());
      expect((pow100 + BigInt(-1)).toString()).assertEqual(BigInt(10).pow(BigInt(100)).operatorSubtract(BigInt(1)).toString());
      expect(((-pow100) + (-pow100)).toString()).assertEqual(BigInt(-2).operatorMultiply(BigInt(10).pow(BigInt(100))).toString());

      expect((pow100 + BigInt(1)).toString()).assertEqual('10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');
      expect((pow100 + BigInt(-1)).toString()).assertEqual('9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
      expect(((-pow100) + (-pow100)).toString()).assertEqual('-20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_ADD_4400
     * @tc.name testBigIntOperatorAddTest044
     * @tc.desc operatorAdd with hex large + decimal large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddTest044', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt('18446744073709551615') + BigInt('1')).toString()).assertEqual('18446744073709551616');
      expect((BigInt('18446744073709551615') + BigInt('-1')).toString()).assertEqual('18446744073709551614');
      expect((BigInt('-18446744073709551615') + BigInt('-1')).toString()).assertEqual('-18446744073709551616');
    });

  });
}