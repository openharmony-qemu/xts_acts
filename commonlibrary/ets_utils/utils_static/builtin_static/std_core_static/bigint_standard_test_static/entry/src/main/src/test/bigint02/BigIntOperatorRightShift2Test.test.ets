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

export default function BigIntOperatorRightShift2Test(): void {
  describe('testBigIntOperatorRightShift2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0100
     * @tc.name testBigIntOperatorRightShift2Test0100
     * @tc.desc operatorRightShift shift 0-5 bits on base 8 and 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(8).operatorRightShift(BigInt(0)).toString()).assertEqual('8');
      expect(BigInt(8).operatorRightShift(BigInt(1)).toString()).assertEqual('4');
      expect(BigInt(8).operatorRightShift(BigInt(2)).toString()).assertEqual('2');
      expect(BigInt(8).operatorRightShift(BigInt(3)).toString()).assertEqual('1');
      expect(BigInt(8).operatorRightShift(BigInt(4)).toString()).assertEqual('0');
      expect(BigInt(16).operatorRightShift(BigInt(1)).toString()).assertEqual('8');
      expect(BigInt(16).operatorRightShift(BigInt(2)).toString()).assertEqual('4');
      expect(BigInt(16).operatorRightShift(BigInt(3)).toString()).assertEqual('2');
      expect(BigInt(16).operatorRightShift(BigInt(4)).toString()).assertEqual('1');
      expect(BigInt(16).operatorRightShift(BigInt(5)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0200
     * @tc.name testBigIntOperatorRightShift2Test0200
     * @tc.desc operatorRightShift shift boundary 32/64/128/256 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1099511627776').operatorRightShift(BigInt(32)).toString()).assertEqual('256');
      expect(BigInt('1208925819614629174706176').operatorRightShift(BigInt(64)).toString()).assertEqual('65536');
      expect(BigInt(16777216).operatorRightShift(BigInt(16)).toString()).assertEqual('256');
      expect(BigInt(4294967296).operatorRightShift(BigInt(24)).toString()).assertEqual('256');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0300
     * @tc.name testBigIntOperatorRightShift2Test0300
     * @tc.desc operatorRightShift negative sign extension (-1>>n always -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1).operatorRightShift(BigInt(0)).toString()).assertEqual('-1');
      expect(BigInt(-1).operatorRightShift(BigInt(1)).toString()).assertEqual('-1');
      expect(BigInt(-1).operatorRightShift(BigInt(100)).toString()).assertEqual('-1');
      expect(BigInt(-2).operatorRightShift(BigInt(1)).toString()).assertEqual('-1');
      expect(BigInt(-2).operatorRightShift(BigInt(2)).toString()).assertEqual('-1');
      expect(BigInt(-4).operatorRightShift(BigInt(1)).toString()).assertEqual('-2');
      expect(BigInt(-4).operatorRightShift(BigInt(2)).toString()).assertEqual('-1');
      expect(BigInt(-8).operatorRightShift(BigInt(1)).toString()).assertEqual('-4');
      expect(BigInt(-8).operatorRightShift(BigInt(3)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0400
     * @tc.name testBigIntOperatorRightShift2Test0400
     * @tc.desc operatorRightShift on positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorRightShift(BigInt(1)).toString()).assertEqual('50');
      expect(BigInt(100).operatorRightShift(BigInt(2)).toString()).assertEqual('25');
      expect(BigInt(100).operatorRightShift(BigInt(5)).toString()).assertEqual('3');
      expect(BigInt(1000).operatorRightShift(BigInt(3)).toString()).assertEqual('125');
      expect(BigInt(1000).operatorRightShift(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt(2147483647).operatorRightShift(BigInt(1)).toString()).assertEqual('1073741823');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0500
     * @tc.name testBigIntOperatorRightShift2Test0500
     * @tc.desc operatorRightShift on large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000000000).operatorRightShift(BigInt(10)).toString()).assertEqual('976562');
      expect(BigInt('1000000000000000000').operatorRightShift(BigInt(20)).toString()).assertEqual('953674316406');
      expect(BigInt('123456789012345678901234567890').operatorRightShift(BigInt(50)).toString()).assertEqual('109651655766236');
      expect(BigInt('123456789012345678901234567890').operatorRightShift(BigInt(100)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0600
     * @tc.name testBigIntOperatorRightShift2Test0600
     * @tc.desc operatorRightShift immutability test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(100);
      const origA = a.toString();
      a.operatorRightShift(BigInt(5));
      expect(a.toString()).assertEqual(origA);
      const b = BigInt(-100);
      const origB = b.toString();
      b.operatorRightShift(BigInt(3));
      expect(b.toString()).assertEqual(origB);
      const c = BigInt(0);
      c.operatorRightShift(BigInt(100));
      expect(c.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0700
     * @tc.name testBigIntOperatorRightShift2Test0700
     * @tc.desc operatorRightShift zero shifted by any amount is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorRightShift(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(0).operatorRightShift(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(0).operatorRightShift(BigInt(100)).toString()).assertEqual('0');
      expect(BigInt(0).operatorRightShift(BigInt(1000)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0800
     * @tc.name testBigIntOperatorRightShift2Test0800
     * @tc.desc operatorRightShift 1>>n always 0 for n>=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorRightShift(BigInt(0)).toString()).assertEqual('1');
      expect(BigInt(1).operatorRightShift(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(1).operatorRightShift(BigInt(2)).toString()).assertEqual('0');
      expect(BigInt(1).operatorRightShift(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt(1).operatorRightShift(BigInt(100)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0900
     * @tc.name testBigIntOperatorRightShift2Test0900
     * @tc.desc operatorRightShift various constructor source combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100.0).operatorRightShift(BigInt(2)).toString()).assertEqual('25');
      expect(BigInt('1024').operatorRightShift(BigInt('4')).toString()).assertEqual('64');
      expect(BigInt(false).operatorRightShift(BigInt(100)).toString()).assertEqual('0');
      expect(BigInt(true).operatorRightShift(BigInt(1)).toString()).assertEqual('0');
      const source = BigInt(16);
      const shiftSrc = BigInt(3);
      expect(BigInt(source).operatorRightShift(BigInt(true)).toString()).assertEqual('8');
      expect(BigInt(40).operatorRightShift(BigInt(shiftSrc)).toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1000
     * @tc.name testBigIntOperatorRightShift2Test1000
     * @tc.desc operatorRightShift value correctness via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorRightShift(BigInt(2)).equals(BigInt(25))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1100
     * @tc.name testBigIntOperatorRightShift2Test1100
     * @tc.desc operatorRightShift return type via doubleValue and getLong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1024).operatorRightShift(BigInt(10)).doubleValue()).assertEqual(1.0);
      expect(BigInt(1000).operatorRightShift(BigInt(3)).getLong()).assertEqual(125);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1200
     * @tc.name testBigIntOperatorRightShift2Test1200
     * @tc.desc operatorRightShift chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chain = BigInt(1024).operatorRightShift(BigInt(2)).operatorRightShift(BigInt(3));
      expect(chain.toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1300
     * @tc.name testBigIntOperatorRightShift2Test1300
     * @tc.desc operatorRightShift cross-operator equivalence with division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const shifted = BigInt(100).operatorRightShift(BigInt(2));
      const divided = BigInt(25);
      expect(shifted.toString()).assertEqual(divided.toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1400
     * @tc.name testBigIntOperatorRightShift2Test1400
     * @tc.desc operatorRightShift on negative and sign-extended values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-100').operatorRightShift(BigInt(2)).toString()).assertEqual('-25');
      expect(BigInt('-100').operatorRightShift(BigInt(5)).toString()).assertEqual('-4');
      expect(BigInt(-2147483648).operatorRightShift(BigInt(31)).toString()).assertEqual('-1');
      expect(BigInt('-9223372036854775808').operatorRightShift(BigInt(1)).toString()).assertEqual('-4611686018427387904');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1500
     * @tc.name testBigIntOperatorRightShift2Test1500
     * @tc.desc operatorRightShift on positive int/long boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647).operatorRightShift(BigInt(31)).toString()).assertEqual('0');
      expect(BigInt('9223372036854775807').operatorRightShift(BigInt(1)).toString()).assertEqual('4611686018427387903');
      expect(BigInt('9223372036854775807').operatorRightShift(BigInt(63)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1600
     * @tc.name testBigIntOperatorRightShift2Test1600
     * @tc.desc operatorRightShift returns new BigInt reference and correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(100);
      const r = a.operatorRightShift(BigInt(5));
      expect(r.toString()!=a.toString()).assertTrue();
      const r2 = BigInt(100).operatorRightShift(BigInt(2));
      expect(Class.of(r2 as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1700
     * @tc.name testBigIntOperatorRightShift2Test1700
     * @tc.desc operatorRightShift 1024>>5 equals 32, verifying large power-of-2 right shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1024).operatorRightShift(BigInt(5)).toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1800
     * @tc.name testBigIntOperatorRightShift2Test1800
     * @tc.desc operatorRightShift 255 (8-bit all 1s) right shift 1 equals 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).operatorRightShift(BigInt(1)).toString()).assertEqual('127');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_1900
     * @tc.name testBigIntOperatorRightShift2Test1900
     * @tc.desc operatorRightShift 255 (8-bit all 1s) right shift 8 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).operatorRightShift(BigInt(8)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2000
     * @tc.name testBigIntOperatorRightShift2Test2000
     * @tc.desc operatorRightShift -16>>2 equals -4, verifying arithmetic shift on negative even number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-16).operatorRightShift(BigInt(2)).toString()).assertEqual('-4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2100
     * @tc.name testBigIntOperatorRightShift2Test2100
     * @tc.desc operatorRightShift -255>>1 equals -128, verifying arithmetic shift on negative odd-large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-255).operatorRightShift(BigInt(1)).toString()).assertEqual('-128');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2200
     * @tc.name testBigIntOperatorRightShift2Test2200
     * @tc.desc operatorRightShift -256>>8 equals -1, verifying full sign extension for negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-256).operatorRightShift(BigInt(8)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2300
     * @tc.name testBigIntOperatorRightShift2Test2300
     * @tc.desc operatorRightShift large positive odd number shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9999999999999999999').operatorRightShift(BigInt(1)).toString()).assertEqual('4999999999999999999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2400
     * @tc.name testBigIntOperatorRightShift2Test2400
     * @tc.desc operatorRightShift large negative odd number shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9999999999999999999').operatorRightShift(BigInt(1)).toString()).assertEqual('-5000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2500
     * @tc.name testBigIntOperatorRightShift2Test2500
     * @tc.desc operatorRightShift asIntN 8-bit truncated value shifted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(200)).operatorRightShift(BigInt(10)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2600
     * @tc.name testBigIntOperatorRightShift2Test2600
     * @tc.desc operatorRightShift asUintN 8-bit truncated value shifted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt(200)).operatorRightShift(BigInt(7)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2700
     * @tc.name testBigIntOperatorRightShift2Test2700
     * @tc.desc operatorRightShift -10>>0 equals -10, zero shift preserving sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).operatorRightShift(BigInt(0)).toString()).assertEqual('-10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2800
     * @tc.name testBigIntOperatorRightShift2Test2800
     * @tc.desc operatorRightShift fromULong value shifted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(255).operatorRightShift(BigInt(1)).toString()).assertEqual('127');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_2900
     * @tc.name testBigIntOperatorRightShift2Test2900
     * @tc.desc operatorRightShift -2^64>>32 equals -2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-18446744073709551616').operatorRightShift(BigInt(32)).toString()).assertEqual('-4294967296');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3000
     * @tc.name testBigIntOperatorRightShift2Test3000
     * @tc.desc operatorRightShift 9>>1 equals 4, odd positive truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9).operatorRightShift(BigInt(1)).toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3100
     * @tc.name testBigIntOperatorRightShift2Test3100
     * @tc.desc operatorRightShift 12>>1 equals 6, bit pattern test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorRightShift(BigInt(1)).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3200
     * @tc.name testBigIntOperatorRightShift2Test3200
     * @tc.desc operatorRightShift 15>>2 equals 3, low bits discarded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(15).operatorRightShift(BigInt(2)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3300
     * @tc.name testBigIntOperatorRightShift2Test3300
     * @tc.desc operatorRightShift large number beyond safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740993').operatorRightShift(BigInt(1)).toString()).assertEqual('4503599627370496');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3400
     * @tc.name testBigIntOperatorRightShift2Test3400
     * @tc.desc operatorRightShift 9007199254740992>>10 equals 8796093022208
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740992').operatorRightShift(BigInt(10)).toString()).assertEqual('8796093022208');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3500
     * @tc.name testBigIntOperatorRightShift2Test3500
     * @tc.desc operatorRightShift -9>>1 equals -5, negative odd truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-9).operatorRightShift(BigInt(1)).toString()).assertEqual('-5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3600
     * @tc.name testBigIntOperatorRightShift2Test3600
     * @tc.desc operatorRightShift -2147483648>>1 equals -1073741824
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-2147483648).operatorRightShift(BigInt(1)).toString()).assertEqual('-1073741824');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3700
     * @tc.name testBigIntOperatorRightShift2Test3700
     * @tc.desc operatorRightShift -1000>>10 equals -1, large negative shift convergence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1000).operatorRightShift(BigInt(10)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3800
     * @tc.name testBigIntOperatorRightShift2Test3800
     * @tc.desc operatorRightShift -16>>4 equals -1, shift equals bit width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-16).operatorRightShift(BigInt(4)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_3900
     * @tc.name testBigIntOperatorRightShift2Test3900
     * @tc.desc operatorRightShift 16>>104 equals 0, shift far exceeding bit width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(16).operatorRightShift(BigInt(104)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4000
     * @tc.name testBigIntOperatorRightShift2Test4000
     * @tc.desc operatorRightShift copy constructed negative value shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(-256)).operatorRightShift(BigInt(8)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4100
     * @tc.name testBigIntOperatorRightShift2Test4100
     * @tc.desc operatorRightShift -100>>1 equals -50, negative value becomes larger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-100).operatorRightShift(BigInt(1)).toString()).assertEqual('-50');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4200
     * @tc.name testBigIntOperatorRightShift2Test4200
     * @tc.desc operatorRightShift 0-bit shift equals original value test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12345).operatorRightShift(BigInt(0)).equals(BigInt(12345))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4300
     * @tc.name testBigIntOperatorRightShift2Test4300
     * @tc.desc operatorRightShift string constructed 255>>4 equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('255').operatorRightShift(BigInt(4)).toString()).assertEqual('15');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4400
     * @tc.name testBigIntOperatorRightShift2Test4400
     * @tc.desc operatorRightShift negative beyond safe integer range shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9007199254740993').operatorRightShift(BigInt(1)).toString()).assertEqual('-4503599627370497');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4500
     * @tc.name testBigIntOperatorRightShift2Test4500
     * @tc.desc operatorRightShift -9007199254740992>>10 equals -8796093022208
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9007199254740992').operatorRightShift(BigInt(10)).toString()).assertEqual('-8796093022208');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4600
     * @tc.name testBigIntOperatorRightShift2Test4600
     * @tc.desc operatorRightShift big number with trailing zeros after shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('900719925474099200').operatorRightShift(BigInt(1)).toString()).assertEqual('450359962737049600');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4700
     * @tc.name testBigIntOperatorRightShift2Test4700
     * @tc.desc operatorRightShift 99>>1 equals 49, odd number truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(99).operatorRightShift(BigInt(1)).toString()).assertEqual('49');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4800
     * @tc.name testBigIntOperatorRightShift2Test4800
     * @tc.desc operatorRightShift asIntN 8-bit 127>>1 equals 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(127)).operatorRightShift(BigInt(1)).toString()).assertEqual('63');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_4900
     * @tc.name testBigIntOperatorRightShift2Test4900
     * @tc.desc operatorRightShift asUintN 8-bit 255>>8 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt(255)).operatorRightShift(BigInt(8)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5000
     * @tc.name testBigIntOperatorRightShift2Test5000
     * @tc.desc operatorRightShift asUintN 16-bit 65535>>8 equals 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(16, BigInt(65535)).operatorRightShift(BigInt(8)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5100
     * @tc.name testBigIntOperatorRightShift2Test5100
     * @tc.desc operatorRightShift asIntN 16-bit -32768>>8 equals -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(16, BigInt(32768)).operatorRightShift(BigInt(8)).toString()).assertEqual('-128');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5200
     * @tc.name testBigIntOperatorRightShift2Test5200
     * @tc.desc operatorRightShift asIntN 8-bit -128>>8 equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(128)).operatorRightShift(BigInt(8)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5300
     * @tc.name testBigIntOperatorRightShift2Test5300
     * @tc.desc operatorRightShift 1024>>3 equals 128, power of 2 shift result is power of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1024).operatorRightShift(BigInt(3)).toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5400
     * @tc.name testBigIntOperatorRightShift2Test5400
     * @tc.desc operatorRightShift 20-digit positive large number shift 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('12345678901234567890').operatorRightShift(BigInt(1)).toString()).assertEqual('6172839450617283945');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5500
     * @tc.name testBigIntOperatorRightShift2Test5500
     * @tc.desc operatorRightShift 20-digit negative large number shift 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-12345678901234567890').operatorRightShift(BigInt(1)).toString()).assertEqual('-6172839450617283945');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5600
     * @tc.name testBigIntOperatorRightShift2Test5600
     * @tc.desc operatorRightShift 2^64>>32 equals 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('18446744073709551616').operatorRightShift(BigInt(32)).toString()).assertEqual('4294967296');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5700
     * @tc.name testBigIntOperatorRightShift2Test5700
     * @tc.desc operatorRightShift 2^100>>50 equals 2^50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1267650600228229401496703205376').operatorRightShift(BigInt(50)).toString()).assertEqual('1125899906842624');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5800
     * @tc.name testBigIntOperatorRightShift2Test5800
     * @tc.desc operatorRightShift value after doubleValue roundtrip shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(100).doubleValue()).operatorRightShift(BigInt(2)).toString()).assertEqual('25');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_5900
     * @tc.name testBigIntOperatorRightShift2Test5900
     * @tc.desc operatorRightShift value after getLong roundtrip shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(1000).getLong()).operatorRightShift(BigInt(3)).toString()).assertEqual('125');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_6000
     * @tc.name testBigIntOperatorRightShift2Test6000
     * @tc.desc operatorRightShift 255>>3 equals 31, formula verification (2^(n-k)-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test6000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).operatorRightShift(BigInt(3)).toString()).assertEqual('31');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_6100
     * @tc.name testBigIntOperatorRightShift2Test6100
     * @tc.desc operatorRightShift negative shift amount on positive/negative/zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test6100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(16).operatorRightShift(BigInt(-1)).toString()).assertEqual('32');
      expect(BigInt(100).operatorRightShift(BigInt(-2)).toString()).assertEqual('400');
      expect(BigInt(-16).operatorRightShift(BigInt(-1)).toString()).assertEqual('-32');
      expect(BigInt(0).operatorRightShift(BigInt(-10)).toString()).assertEqual('0');
    });
  });
}
