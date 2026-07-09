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

export default function BigIntOperatorLeftShift2Test(): void {
  describe('testBigIntOperatorLeftShift2Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_0700
     * @tc.name testBigIntOperatorLeftShift2Test007
     * @tc.desc operatorLeftShift shift 0-8 bits on base 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).operatorLeftShift(BigInt(0)).toString()).assertEqual('2');
      expect(BigInt(2).operatorLeftShift(BigInt(1)).toString()).assertEqual('4');
      expect(BigInt(2).operatorLeftShift(BigInt(2)).toString()).assertEqual('8');
      expect(BigInt(2).operatorLeftShift(BigInt(3)).toString()).assertEqual('16');
      expect(BigInt(2).operatorLeftShift(BigInt(4)).toString()).assertEqual('32');
      expect(BigInt(2).operatorLeftShift(BigInt(5)).toString()).assertEqual('64');
      expect(BigInt(2).operatorLeftShift(BigInt(6)).toString()).assertEqual('128');
      expect(BigInt(2).operatorLeftShift(BigInt(7)).toString()).assertEqual('256');
      expect(BigInt(2).operatorLeftShift(BigInt(8)).toString()).assertEqual('512');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_0800
     * @tc.name testBigIntOperatorLeftShift2Test008
     * @tc.desc operatorLeftShift shift boundary 32/64/128/256 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLeftShift(BigInt(32)).toString()).assertEqual('4294967296');
      expect(BigInt(1).operatorLeftShift(BigInt(64)).toString()).assertEqual('18446744073709551616');
      expect(BigInt(1).operatorLeftShift(BigInt(100)).toString()).assertEqual('1267650600228229401496703205376');
      expect(BigInt(1).operatorLeftShift(BigInt(128)).toString()).assertEqual('340282366920938463463374607431768211456');
      expect(BigInt(1).operatorLeftShift(BigInt(256)).toString().length).assertEqual(78);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_0900
     * @tc.name testBigIntOperatorLeftShift2Test009
     * @tc.desc operatorLeftShift on negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1).operatorLeftShift(BigInt(1)).toString()).assertEqual('-2');
      expect(BigInt(-1).operatorLeftShift(BigInt(2)).toString()).assertEqual('-4');
      expect(BigInt(-1).operatorLeftShift(BigInt(3)).toString()).assertEqual('-8');
      expect(BigInt(-2).operatorLeftShift(BigInt(1)).toString()).assertEqual('-4');
      expect(BigInt(-2).operatorLeftShift(BigInt(3)).toString()).assertEqual('-16');
      expect(BigInt(-100).operatorLeftShift(BigInt(2)).toString()).assertEqual('-400');
      expect(BigInt('-2147483648').operatorLeftShift(BigInt(1)).toString()).assertEqual('-4294967296');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1000
     * @tc.name testBigIntOperatorLeftShift2Test010
     * @tc.desc operatorLeftShift on large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1000000000).operatorLeftShift(BigInt(10)).toString()).assertEqual('1024000000000');
      expect(BigInt('1000000000000000000').operatorLeftShift(BigInt(5)).toString()).assertEqual('32000000000000000000');
      expect(BigInt('123456789012345678901234567890').operatorLeftShift(BigInt(10)).toString()).assertEqual('126419751948641975194864197519360');
      expect(BigInt('123456789012345678901234567890').operatorLeftShift(BigInt(20)).toString().length).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1100
     * @tc.name testBigIntOperatorLeftShift2Test011
     * @tc.desc operatorLeftShift overflow behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLeftShift(BigInt(63)).toString()).assertEqual('9223372036854775808');
      expect(BigInt(1).operatorLeftShift(BigInt(500)).toString().length).assertEqual(151);
      expect(BigInt(1).operatorLeftShift(BigInt(1000)).toString().length).assertEqual(302);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1200
     * @tc.name testBigIntOperatorLeftShift2Test012
     * @tc.desc operatorLeftShift immutability test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const origA = a.toString();
      a.operatorLeftShift(BigInt(5));
      expect(a.toString()).assertEqual(origA);
      const b = BigInt(-100);
      const origB = b.toString();
      b.operatorLeftShift(BigInt(3));
      expect(b.toString()).assertEqual(origB);
      const c = BigInt(0);
      c.operatorLeftShift(BigInt(100));
      expect(c.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1300
     * @tc.name testBigIntOperatorLeftShift2Test013
     * @tc.desc operatorLeftShift zero shifted by any amount is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorLeftShift(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(0).operatorLeftShift(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(0).operatorLeftShift(BigInt(100)).toString()).assertEqual('0');
      expect(BigInt(0).operatorLeftShift(BigInt(1000)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1400
     * @tc.name testBigIntOperatorLeftShift2Test014
     * @tc.desc operatorLeftShift 1<<n verifies powers of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLeftShift(BigInt(0)).toString()).assertEqual('1');
      expect(BigInt(1).operatorLeftShift(BigInt(1)).toString()).assertEqual('2');
      expect(BigInt(1).operatorLeftShift(BigInt(2)).toString()).assertEqual('4');
      expect(BigInt(1).operatorLeftShift(BigInt(3)).toString()).assertEqual('8');
      expect(BigInt(1).operatorLeftShift(BigInt(7)).toString()).assertEqual('128');
      expect(BigInt(1).operatorLeftShift(BigInt(8)).toString()).assertEqual('256');
      expect(BigInt(1).operatorLeftShift(BigInt(15)).toString()).assertEqual('32768');
      expect(BigInt(1).operatorLeftShift(BigInt(31)).toString()).assertEqual('2147483648');
      expect(BigInt(1).operatorLeftShift(BigInt(62)).toString()).assertEqual('4611686018427387904');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1500
     * @tc.name testBigIntOperatorLeftShift2Test015
     * @tc.desc operatorLeftShift various constructor source combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5.0).operatorLeftShift(BigInt(3)).toString()).assertEqual('40');
      expect(BigInt('10').operatorLeftShift(BigInt('4')).toString()).assertEqual('160');
      expect(BigInt(false).operatorLeftShift(BigInt(100)).toString()).assertEqual('0');
      expect(BigInt(true).operatorLeftShift(BigInt(10)).toString()).assertEqual('1024');
      const source = BigInt(8);
      const shiftSrc = BigInt(5);
      expect(BigInt(source).operatorLeftShift(BigInt(true)).toString()).assertEqual('16');
      expect(BigInt(1).operatorLeftShift(BigInt(shiftSrc)).toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1600
     * @tc.name testBigIntOperatorLeftShift2Test016
     * @tc.desc operatorLeftShift value correctness via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(3).operatorLeftShift(BigInt(2)).equals(BigInt(12))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1700
     * @tc.name testBigIntOperatorLeftShift2Test017
     * @tc.desc operatorLeftShift return type via doubleValue and getLong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).operatorLeftShift(BigInt(10)).doubleValue()).assertEqual(2048.0);
      expect(BigInt(1).operatorLeftShift(BigInt(10)).getLong()).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1800
     * @tc.name testBigIntOperatorLeftShift2Test018
     * @tc.desc operatorLeftShift chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chain = BigInt(1).operatorLeftShift(BigInt(2)).operatorLeftShift(BigInt(3));
      expect(chain.toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_1900
     * @tc.name testBigIntOperatorLeftShift2Test019
     * @tc.desc operatorLeftShift cross-operator equivalence with multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shifted = BigInt(7).operatorLeftShift(BigInt(3));
      const multiplied = BigInt(7).operatorMultiply(BigInt(8));
      expect(shifted.toString()).assertEqual(multiplied.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2000
     * @tc.name testBigIntOperatorLeftShift2Test020
     * @tc.desc operatorLeftShift 1<<16, 1<<24, 1<<50 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLeftShift(BigInt(16)).toString()).assertEqual('65536');
      expect(BigInt(1).operatorLeftShift(BigInt(24)).toString()).assertEqual('16777216');
      expect(BigInt(1).operatorLeftShift(BigInt(50)).toString()).assertEqual('1125899906842624');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2100
     * @tc.name testBigIntOperatorLeftShift2Test021
     * @tc.desc operatorLeftShift longMin negative shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9223372036854775808').operatorLeftShift(BigInt(1)).toString()).assertEqual('-18446744073709551616');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2200
     * @tc.name testBigIntOperatorLeftShift2Test022
     * @tc.desc operatorLeftShift returns new reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const r = a.operatorLeftShift(BigInt(5));
      expect(r!==a).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2300
     * @tc.name testBigIntOperatorLeftShift2Test023
     * @tc.desc operatorLeftShift on addition result as left operand (10+5=15)<<1=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(5)).operatorLeftShift(BigInt(1)).toString()).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2400
     * @tc.name testBigIntOperatorLeftShift2Test024
     * @tc.desc operatorLeftShift on subtraction result as left operand (20-7=13)<<2=52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorSubtract(BigInt(7)).operatorLeftShift(BigInt(2)).toString()).assertEqual('52');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2500
     * @tc.name testBigIntOperatorLeftShift2Test025
     * @tc.desc operatorLeftShift on bitwiseOr result as left operand (10|3=11)<<1=22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorBitwiseOr(BigInt(3)).operatorLeftShift(BigInt(1)).toString()).assertEqual('22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2600
     * @tc.name testBigIntOperatorLeftShift2Test026
     * @tc.desc operatorLeftShift on asIntN 8-bit truncated value (asIntN(8,100)<<1=200)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(100)).operatorLeftShift(BigInt(1)).toString()).assertEqual('200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2700
     * @tc.name testBigIntOperatorLeftShift2Test027
     * @tc.desc operatorLeftShift on asUintN 8-bit truncated value (asUintN(8,200)<<1=400)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt(200)).operatorLeftShift(BigInt(1)).toString()).assertEqual('400');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2800
     * @tc.name testBigIntOperatorLeftShift2Test028
     * @tc.desc operatorLeftShift with byte constructor for right operand (10<<byte(1)=20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorLeftShift(BigInt(1 as byte)).toString()).assertEqual('20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_2900
     * @tc.name testBigIntOperatorLeftShift2Test029
     * @tc.desc operatorLeftShift with long constructor for right operand (10<<long(3)=80)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorLeftShift(BigInt(3 as long)).toString()).assertEqual('80');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3000
     * @tc.name testBigIntOperatorLeftShift2Test030
     * @tc.desc operatorLeftShift with double constructor for right operand (10<<4.0=160)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorLeftShift(BigInt(4.0)).toString()).assertEqual('160');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3100
     * @tc.name testBigIntOperatorLeftShift2Test031
     * @tc.desc operatorLeftShift with string constructor for right operand (10<<'5'=320)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorLeftShift(BigInt('5')).toString()).assertEqual('320');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3200
     * @tc.name testBigIntOperatorLeftShift2Test032
     * @tc.desc operatorLeftShift -1 by 16 bits (-1<<16=-65536)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1).operatorLeftShift(BigInt(16)).toString()).assertEqual('-65536');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3300
     * @tc.name testBigIntOperatorLeftShift2Test033
     * @tc.desc operatorLeftShift -1 by 64 bits (-1<<64=-18446744073709551616)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1).operatorLeftShift(BigInt(64)).toString()).assertEqual('-18446744073709551616');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3400
     * @tc.name testBigIntOperatorLeftShift2Test034
     * @tc.desc operatorLeftShift 255 by 16 bits (255<<16=16711680)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).operatorLeftShift(BigInt(16)).toString()).assertEqual('16711680');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3500
     * @tc.name testBigIntOperatorLeftShift2Test035
     * @tc.desc operatorLeftShift -255 by 16 bits (-255<<16=-16711680)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-255).operatorLeftShift(BigInt(16)).toString()).assertEqual('-16711680');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3600
     * @tc.name testBigIntOperatorLeftShift2Test036
     * @tc.desc operatorLeftShift fromULong(65535) by 8 bits (fromULong(65535)<<8=16776960)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(65535).operatorLeftShift(BigInt(8)).toString()).assertEqual('16776960');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3700
     * @tc.name testBigIntOperatorLeftShift2Test037
     * @tc.desc operatorLeftShift on value beyond JS safe integer (9007199254740993<<1=18014398509481986)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9007199254740993').operatorLeftShift(BigInt(1)).toString()).assertEqual('18014398509481986');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3800
     * @tc.name testBigIntOperatorLeftShift2Test038
     * @tc.desc operatorLeftShift on 100-digit all-ones (100-digit 1's<<1=100-digit 2's)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1'.repeat(100)).operatorLeftShift(BigInt(1)).toString()).assertEqual('2'.repeat(100));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_3900
     * @tc.name testBigIntOperatorLeftShift2Test039
     * @tc.desc operatorLeftShift on getULong round-tripped value (BigInt(-1).getULong()<<1=36893488147419103230)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const ulongVal: long = BigInt(-1).getULong();
      expect(BigInt(BigInt.fromULong(ulongVal)).operatorLeftShift(BigInt(1)).toString()).assertEqual('36893488147419103230');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_4000
     * @tc.name testBigIntOperatorLeftShift2Test040
     * @tc.desc operatorLeftShift on asIntN 64-bit truncated value (asIntN(64, Long.MAX)<<1=-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMax = BigInt('9223372036854775807');
      const shiftedVal = longMax.operatorLeftShift(BigInt(1));
      expect(BigInt.asIntN(64, shiftedVal).toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_4100
     * @tc.name testBigIntOperatorLeftShift2Test041
     * @tc.desc operatorLeftShift on asUintN 64-bit truncated value (asUintN(64, Long.MAX)<<1=18446744073709551614)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(64, BigInt('9223372036854775807')).operatorLeftShift(BigInt(1)).toString()).assertEqual('18446744073709551614');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_4200
     * @tc.name testBigIntOperatorLeftShift2Test042
     * @tc.desc operatorLeftShift byte minimum -128 by 1 bit (-128<<1=-256)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-128 as byte).operatorLeftShift(BigInt(1)).toString()).assertEqual('-256');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_4300
     * @tc.name testBigIntOperatorLeftShift2Test043
     * @tc.desc operatorLeftShift copy constructed negative value (BigInt(BigInt(-1))<<10=-1024)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(-1)).operatorLeftShift(BigInt(10)).toString()).assertEqual('-1024');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LEFT_SHIFT_4400
     * @tc.name testBigIntOperatorLeftShift2Test044
     * @tc.desc operatorLeftShift 2^64 by 1 bit (2^64<<1=36893488147419103232)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShift2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('18446744073709551616').operatorLeftShift(BigInt(1)).toString()).assertEqual('36893488147419103232');
    });
  });
}
