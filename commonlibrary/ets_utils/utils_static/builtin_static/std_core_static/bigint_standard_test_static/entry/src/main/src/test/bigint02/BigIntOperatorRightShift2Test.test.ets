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

export default function BigIntOperatorRightShift2Test(): void {
  describe('testBigIntOperatorRightShift2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_0700
     * @tc.name testBigIntOperatorRightShift2Test007
     * @tc.desc operatorRightShift shift 0-5 bits on base 8 and 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_0800
     * @tc.name testBigIntOperatorRightShift2Test008
     * @tc.desc operatorRightShift shift boundary 32/64/128/256 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1099511627776').operatorRightShift(BigInt(32)).toString()).assertEqual('256');
      expect(BigInt('1208925819614629174706176').operatorRightShift(BigInt(64)).toString()).assertEqual('65536');
      expect(BigInt(16777216).operatorRightShift(BigInt(16)).toString()).assertEqual('256');
      expect(BigInt(4294967296).operatorRightShift(BigInt(24)).toString()).assertEqual('256');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_0900
     * @tc.name testBigIntOperatorRightShift2Test009
     * @tc.desc operatorRightShift negative sign extension (-1>>n always -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1000
     * @tc.name testBigIntOperatorRightShift2Test010
     * @tc.desc operatorRightShift on positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorRightShift(BigInt(1)).toString()).assertEqual('50');
      expect(BigInt(100).operatorRightShift(BigInt(2)).toString()).assertEqual('25');
      expect(BigInt(100).operatorRightShift(BigInt(5)).toString()).assertEqual('3');
      expect(BigInt(1000).operatorRightShift(BigInt(3)).toString()).assertEqual('125');
      expect(BigInt(1000).operatorRightShift(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt(2147483647).operatorRightShift(BigInt(1)).toString()).assertEqual('1073741823');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1100
     * @tc.name testBigIntOperatorRightShift2Test011
     * @tc.desc operatorRightShift on large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1000000000).operatorRightShift(BigInt(10)).toString()).assertEqual('976562');
      expect(BigInt('1000000000000000000').operatorRightShift(BigInt(20)).toString()).assertEqual('953674316406');
      expect(BigInt('123456789012345678901234567890').operatorRightShift(BigInt(50)).toString()).assertEqual('109651655766236');
      expect(BigInt('123456789012345678901234567890').operatorRightShift(BigInt(100)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1200
     * @tc.name testBigIntOperatorRightShift2Test012
     * @tc.desc operatorRightShift immutability test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1300
     * @tc.name testBigIntOperatorRightShift2Test013
     * @tc.desc operatorRightShift zero shifted by any amount is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorRightShift(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(0).operatorRightShift(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(0).operatorRightShift(BigInt(100)).toString()).assertEqual('0');
      expect(BigInt(0).operatorRightShift(BigInt(1000)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1400
     * @tc.name testBigIntOperatorRightShift2Test014
     * @tc.desc operatorRightShift 1>>n always 0 for n>=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorRightShift(BigInt(0)).toString()).assertEqual('1');
      expect(BigInt(1).operatorRightShift(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(1).operatorRightShift(BigInt(2)).toString()).assertEqual('0');
      expect(BigInt(1).operatorRightShift(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt(1).operatorRightShift(BigInt(100)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1500
     * @tc.name testBigIntOperatorRightShift2Test015
     * @tc.desc operatorRightShift various constructor source combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1600
     * @tc.name testBigIntOperatorRightShift2Test016
     * @tc.desc operatorRightShift value correctness via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorRightShift(BigInt(2)).equals(BigInt(25))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1700
     * @tc.name testBigIntOperatorRightShift2Test017
     * @tc.desc operatorRightShift return type via doubleValue and getLong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1024).operatorRightShift(BigInt(10)).doubleValue()).assertEqual(1.0);
      expect(BigInt(1000).operatorRightShift(BigInt(3)).getLong()).assertEqual(125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1800
     * @tc.name testBigIntOperatorRightShift2Test018
     * @tc.desc operatorRightShift chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chain = BigInt(1024).operatorRightShift(BigInt(2)).operatorRightShift(BigInt(3));
      expect(chain.toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_1900
     * @tc.name testBigIntOperatorRightShift2Test019
     * @tc.desc operatorRightShift cross-operator equivalence with division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shifted = BigInt(100).operatorRightShift(BigInt(2));
      const divided = BigInt(25);
      expect(shifted.toString()).assertEqual(divided.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2000
     * @tc.name testBigIntOperatorRightShift2Test020
     * @tc.desc operatorRightShift on negative and sign-extended values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-100').operatorRightShift(BigInt(2)).toString()).assertEqual('-25');
      expect(BigInt('-100').operatorRightShift(BigInt(5)).toString()).assertEqual('-4');
      expect(BigInt(-2147483648).operatorRightShift(BigInt(31)).toString()).assertEqual('-1');
      expect(BigInt('-9223372036854775808').operatorRightShift(BigInt(1)).toString()).assertEqual('-4611686018427387904');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2100
     * @tc.name testBigIntOperatorRightShift2Test021
     * @tc.desc operatorRightShift on positive int/long boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2147483647).operatorRightShift(BigInt(31)).toString()).assertEqual('0');
      expect(BigInt('9223372036854775807').operatorRightShift(BigInt(1)).toString()).assertEqual('4611686018427387903');
      expect(BigInt('9223372036854775807').operatorRightShift(BigInt(63)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2200
     * @tc.name testBigIntOperatorRightShift2Test022
     * @tc.desc operatorRightShift returns new BigInt reference and correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const r = a.operatorRightShift(BigInt(5));
      expect(r.toString()!==a.toString()).assertTrue();
      const r2 = BigInt(100).operatorRightShift(BigInt(2));
      expect(Class.of(r2 as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2300
     * @tc.name testBigIntOperatorRightShift2Test023
     * @tc.desc operatorRightShift 1024>>5 equals 32, verifying large power-of-2 right shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1024).operatorRightShift(BigInt(5)).toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2400
     * @tc.name testBigIntOperatorRightShift2Test024
     * @tc.desc operatorRightShift 255 (8-bit all 1s) right shift 1 equals 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).operatorRightShift(BigInt(1)).toString()).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2500
     * @tc.name testBigIntOperatorRightShift2Test025
     * @tc.desc operatorRightShift 255 (8-bit all 1s) right shift 8 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).operatorRightShift(BigInt(8)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2600
     * @tc.name testBigIntOperatorRightShift2Test026
     * @tc.desc operatorRightShift -16>>2 equals -4, verifying arithmetic shift on negative even number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-16).operatorRightShift(BigInt(2)).toString()).assertEqual('-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2700
     * @tc.name testBigIntOperatorRightShift2Test027
     * @tc.desc operatorRightShift -255>>1 equals -128, verifying arithmetic shift on negative odd-large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-255).operatorRightShift(BigInt(1)).toString()).assertEqual('-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2800
     * @tc.name testBigIntOperatorRightShift2Test028
     * @tc.desc operatorRightShift -256>>8 equals -1, verifying full sign extension for negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-256).operatorRightShift(BigInt(8)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_2900
     * @tc.name testBigIntOperatorRightShift2Test029
     * @tc.desc operatorRightShift large positive odd number shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9999999999999999999').operatorRightShift(BigInt(1)).toString()).assertEqual('4999999999999999999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3000
     * @tc.name testBigIntOperatorRightShift2Test030
     * @tc.desc operatorRightShift large negative odd number shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9999999999999999999').operatorRightShift(BigInt(1)).toString()).assertEqual('-5000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3100
     * @tc.name testBigIntOperatorRightShift2Test031
     * @tc.desc operatorRightShift asIntN 8-bit truncated value shifted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(200)).operatorRightShift(BigInt(10)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3200
     * @tc.name testBigIntOperatorRightShift2Test032
     * @tc.desc operatorRightShift asUintN 8-bit truncated value shifted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt(200)).operatorRightShift(BigInt(7)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3300
     * @tc.name testBigIntOperatorRightShift2Test033
     * @tc.desc operatorRightShift -10>>0 equals -10, zero shift preserving sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-10).operatorRightShift(BigInt(0)).toString()).assertEqual('-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3400
     * @tc.name testBigIntOperatorRightShift2Test034
     * @tc.desc operatorRightShift fromULong value shifted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(255).operatorRightShift(BigInt(1)).toString()).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3500
     * @tc.name testBigIntOperatorRightShift2Test035
     * @tc.desc operatorRightShift -2^64>>32 equals -2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-18446744073709551616').operatorRightShift(BigInt(32)).toString()).assertEqual('-4294967296');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3600
     * @tc.name testBigIntOperatorRightShift2Test036
     * @tc.desc operatorRightShift 9>>1 equals 4, odd positive truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(9).operatorRightShift(BigInt(1)).toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3700
     * @tc.name testBigIntOperatorRightShift2Test037
     * @tc.desc operatorRightShift 12>>1 equals 6, bit pattern test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(12).operatorRightShift(BigInt(1)).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3800
     * @tc.name testBigIntOperatorRightShift2Test038
     * @tc.desc operatorRightShift 15>>2 equals 3, low bits discarded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(15).operatorRightShift(BigInt(2)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_3900
     * @tc.name testBigIntOperatorRightShift2Test039
     * @tc.desc operatorRightShift large number beyond safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9007199254740993').operatorRightShift(BigInt(1)).toString()).assertEqual('4503599627370496');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4000
     * @tc.name testBigIntOperatorRightShift2Test040
     * @tc.desc operatorRightShift 9007199254740992>>10 equals 8796093022208
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9007199254740992').operatorRightShift(BigInt(10)).toString()).assertEqual('8796093022208');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4100
     * @tc.name testBigIntOperatorRightShift2Test041
     * @tc.desc operatorRightShift -9>>1 equals -5, negative odd truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-9).operatorRightShift(BigInt(1)).toString()).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4200
     * @tc.name testBigIntOperatorRightShift2Test042
     * @tc.desc operatorRightShift -2147483648>>1 equals -1073741824
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-2147483648).operatorRightShift(BigInt(1)).toString()).assertEqual('-1073741824');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4300
     * @tc.name testBigIntOperatorRightShift2Test043
     * @tc.desc operatorRightShift -1000>>10 equals -1, large negative shift convergence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1000).operatorRightShift(BigInt(10)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4400
     * @tc.name testBigIntOperatorRightShift2Test044
     * @tc.desc operatorRightShift -16>>4 equals -1, shift equals bit width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-16).operatorRightShift(BigInt(4)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4500
     * @tc.name testBigIntOperatorRightShift2Test045
     * @tc.desc operatorRightShift 16>>104 equals 0, shift far exceeding bit width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(16).operatorRightShift(BigInt(104)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4600
     * @tc.name testBigIntOperatorRightShift2Test046
     * @tc.desc operatorRightShift copy constructed negative value shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(-256)).operatorRightShift(BigInt(8)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4700
     * @tc.name testBigIntOperatorRightShift2Test047
     * @tc.desc operatorRightShift -100>>1 equals -50, negative value becomes larger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-100).operatorRightShift(BigInt(1)).toString()).assertEqual('-50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4800
     * @tc.name testBigIntOperatorRightShift2Test048
     * @tc.desc operatorRightShift 0-bit shift equals original value test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(12345).operatorRightShift(BigInt(0)).equals(BigInt(12345))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_4900
     * @tc.name testBigIntOperatorRightShift2Test049
     * @tc.desc operatorRightShift string constructed 255>>4 equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('255').operatorRightShift(BigInt(4)).toString()).assertEqual('15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5000
     * @tc.name testBigIntOperatorRightShift2Test050
     * @tc.desc operatorRightShift negative beyond safe integer range shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9007199254740993').operatorRightShift(BigInt(1)).toString()).assertEqual('-4503599627370497');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5100
     * @tc.name testBigIntOperatorRightShift2Test051
     * @tc.desc operatorRightShift -9007199254740992>>10 equals -8796093022208
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9007199254740992').operatorRightShift(BigInt(10)).toString()).assertEqual('-8796093022208');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5200
     * @tc.name testBigIntOperatorRightShift2Test052
     * @tc.desc operatorRightShift big number with trailing zeros after shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('900719925474099200').operatorRightShift(BigInt(1)).toString()).assertEqual('450359962737049600');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5300
     * @tc.name testBigIntOperatorRightShift2Test053
     * @tc.desc operatorRightShift 99>>1 equals 49, odd number truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(99).operatorRightShift(BigInt(1)).toString()).assertEqual('49');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5400
     * @tc.name testBigIntOperatorRightShift2Test054
     * @tc.desc operatorRightShift asIntN 8-bit 127>>1 equals 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(127)).operatorRightShift(BigInt(1)).toString()).assertEqual('63');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5500
     * @tc.name testBigIntOperatorRightShift2Test055
     * @tc.desc operatorRightShift asUintN 8-bit 255>>8 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt(255)).operatorRightShift(BigInt(8)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5600
     * @tc.name testBigIntOperatorRightShift2Test056
     * @tc.desc operatorRightShift asUintN 16-bit 65535>>8 equals 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(16, BigInt(65535)).operatorRightShift(BigInt(8)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5700
     * @tc.name testBigIntOperatorRightShift2Test057
     * @tc.desc operatorRightShift asIntN 16-bit -32768>>8 equals -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(16, BigInt(32768)).operatorRightShift(BigInt(8)).toString()).assertEqual('-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5800
     * @tc.name testBigIntOperatorRightShift2Test058
     * @tc.desc operatorRightShift asIntN 8-bit -128>>8 equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(128)).operatorRightShift(BigInt(8)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_5900
     * @tc.name testBigIntOperatorRightShift2Test059
     * @tc.desc operatorRightShift 1024>>3 equals 128, power of 2 shift result is power of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1024).operatorRightShift(BigInt(3)).toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_6000
     * @tc.name testBigIntOperatorRightShift2Test060
     * @tc.desc operatorRightShift 20-digit positive large number shift 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('12345678901234567890').operatorRightShift(BigInt(1)).toString()).assertEqual('6172839450617283945');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_6100
     * @tc.name testBigIntOperatorRightShift2Test061
     * @tc.desc operatorRightShift 20-digit negative large number shift 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-12345678901234567890').operatorRightShift(BigInt(1)).toString()).assertEqual('-6172839450617283945');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_6200
     * @tc.name testBigIntOperatorRightShift2Test062
     * @tc.desc operatorRightShift 2^64>>32 equals 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('18446744073709551616').operatorRightShift(BigInt(32)).toString()).assertEqual('4294967296');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_6300
     * @tc.name testBigIntOperatorRightShift2Test063
     * @tc.desc operatorRightShift 2^100>>50 equals 2^50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1267650600228229401496703205376').operatorRightShift(BigInt(50)).toString()).assertEqual('1125899906842624');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_6400
     * @tc.name testBigIntOperatorRightShift2Test064
     * @tc.desc operatorRightShift value after doubleValue roundtrip shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(100).doubleValue()).operatorRightShift(BigInt(2)).toString()).assertEqual('25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_6500
     * @tc.name testBigIntOperatorRightShift2Test065
     * @tc.desc operatorRightShift value after getLong roundtrip shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(1000).getLong()).operatorRightShift(BigInt(3)).toString()).assertEqual('125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_6600
     * @tc.name testBigIntOperatorRightShift2Test066
     * @tc.desc operatorRightShift 255>>3 equals 31, formula verification (2^(n-k)-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).operatorRightShift(BigInt(3)).toString()).assertEqual('31');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_RIGHT_SHIFT_6700
     * @tc.name testBigIntOperatorRightShift2Test067
     * @tc.desc operatorRightShift with negative shift count on positive/negative/zero value. Special behavior: passing negative shift amount to right shift equals left shift operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShift2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(16).operatorRightShift(BigInt(-1)).toString()).assertEqual('32');
      expect(BigInt(100).operatorRightShift(BigInt(-2)).toString()).assertEqual('400');
      expect(BigInt(-16).operatorRightShift(BigInt(-1)).toString()).assertEqual('-32');
      expect(BigInt(0).operatorRightShift(BigInt(-10)).toString()).assertEqual('0');
    });
  });
}
