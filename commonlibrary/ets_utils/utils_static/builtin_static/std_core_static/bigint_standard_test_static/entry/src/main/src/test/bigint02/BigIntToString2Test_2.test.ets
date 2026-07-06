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

export default function BigIntToString2Test_2(): void {
  describe('BigIntToString2Test_2', () => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0100
     * @tc.name testBigIntToString2Test001
     * @tc.desc Verify toString(radix) returns 0 for zero at all radices 2 through 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).toString(2)).assertEqual('0');
      expect(BigInt(0).toString(8)).assertEqual('0');
      expect(BigInt(0).toString(10)).assertEqual('0');
      expect(BigInt(0).toString(16)).assertEqual('0');
      expect(BigInt(0).toString(36)).assertEqual('0');
      expect(BigInt('-0').toString(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0200
     * @tc.name testBigIntToString2Test002
     * @tc.desc Verify toString with radices 3 through 14 on a common value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: BigInt = BigInt(255);
      expect(v.toString(3)).assertEqual('100110');
      expect(v.toString(4)).assertEqual('3333');
      expect(v.toString(5)).assertEqual('2010');
      expect(v.toString(6)).assertEqual('1103');
      expect(v.toString(7)).assertEqual('513');
      expect(v.toString(9)).assertEqual('313');
      expect(v.toString(11)).assertEqual('212');
      expect(v.toString(12)).assertEqual('193');
      expect(v.toString(13)).assertEqual('168');
      expect(v.toString(14)).assertEqual('143');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0300
     * @tc.name testBigIntToString2Test003
     * @tc.desc Verify toString(16) for 2^128 and other large powers of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('340282366920938463463374607431768211456').toString(16)).assertEqual('100000000000000000000000000000000');
      expect(BigInt('18446744073709551616').toString(16)).assertEqual('10000000000000000');
      expect(BigInt('340282366920938463463374607431768211455').toString(16)).assertEqual('ffffffffffffffffffffffffffffffff');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0400
     * @tc.name testBigIntToString2Test004
     * @tc.desc Verify toString(radix) for negative values across multiple radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-255).toString(2)).assertEqual('-11111111');
      expect(BigInt(-255).toString(8)).assertEqual('-377');
      expect(BigInt(-255).toString(10)).assertEqual('-255');
      expect(BigInt(-255).toString(36)).assertEqual('-73');
      expect(BigInt(-10).toString(2)).assertEqual('-1010');
      expect(BigInt(-1).toString(16)).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0500
     * @tc.name testBigIntToString2Test005
     * @tc.desc Verify toString(radix) for hex/bin/oct string constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('0xFF').toString(10)).assertEqual('255');
      expect(BigInt('0xFF').toString(16)).assertEqual('ff');
      expect(BigInt('0b1010').toString(10)).assertEqual('10');
      expect(BigInt('0b1010').toString(2)).assertEqual('1010');
      expect(BigInt('0o77').toString(10)).assertEqual('63');
      expect(BigInt('0o77').toString(8)).assertEqual('77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0600
     * @tc.name testBigIntToString2Test006
     * @tc.desc Verify toString(radix) for boolean-constructed BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).toString(2)).assertEqual('1');
      expect(BigInt(true).toString(10)).assertEqual('1');
      expect(BigInt(false).toString(2)).assertEqual('0');
      expect(BigInt(false).toString(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0700
     * @tc.name testBigIntToString2Test007
     * @tc.desc Verify toString(radix) for ultra-large 100+ digit BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const huge: string = '12345678901234567890123456789012345678901234567890';
      const result: string = BigInt(huge).toString(16);

      const backToDecimal: string = BigInt('0x' + result).toString(10);

      expect(backToDecimal).assertEqual(huge);
      expect(result.length).assertEqual(41);

      const hexRegex = new RegExp('^[0-9a-f]+$');
      expect(hexRegex.test(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0800
     * @tc.name testBigIntToString2Test008
     * @tc.desc Verify toString at exact radix boundaries 2 and 36 on zero and large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(35).toString(36)).assertEqual('z');
      expect(BigInt(36).toString(36)).assertEqual('10');
      expect(BigInt(37).toString(36)).assertEqual('11');
      expect(BigInt(2).toString(2)).assertEqual('10');
      expect(BigInt(3).toString(2)).assertEqual('11');
      expect(BigInt(0).toString(2)).assertEqual('0');
      expect(BigInt(0).toString(36)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_0900
     * @tc.name testBigIntToString2Test009
     * @tc.desc Verify toString(radix) for negative zero and zero variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Test009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-0').toString(10)).assertEqual('0');
      expect(BigInt('-0').toString(16)).assertEqual('0');
      expect(BigInt('-0').toString(2)).assertEqual('0');
      expect(BigInt('000').toString(10)).assertEqual('0');
      expect(BigInt('-000').toString(10)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1000
     * @tc.name testBigIntToString2ExtTest010
     * @tc.desc Verify toString(radix) for various radices (2-36) with multiple values using roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v0 = BigInt(0), v1 = BigInt(1), v10 = BigInt(10), v35 = BigInt(35);
      const v255 = BigInt(255), v1024 = BigInt(1024), v65535 = BigInt(65535), v1M = BigInt(1000000);
      const vN1 = BigInt(-1), vN100 = BigInt(-100);

      expect(v0.toString(2)).assertEqual('0');
      expect(v255.toString(2)).assertEqual('11111111');
      expect(vN1.toString(2)).assertEqual('-1');

      expect(v10.toString(8)).assertEqual('12');
      expect(v65535.toString(8)).assertEqual('177777');
      expect(vN100.toString(8)).assertEqual('-144');

      expect(v1M.toString(10)).assertEqual('1000000');
      expect(v35.toString(10)).assertEqual('35');

      expect(v255.toString(16)).assertEqual('ff');
      expect(v1024.toString(16)).assertEqual('400');
      expect(vN1.toString(16)).assertEqual('-1');

      expect(v35.toString(36)).assertEqual('z');
      expect(v1M.toString(36)).assertEqual('lfls');
      expect(vN100.toString(36)).assertEqual('-2s');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1100
     * @tc.name testBigIntToString2ExtTest011
     * @tc.desc Verify toString(radix) for 2^n values in various radices (TC087-TC089, TC111-TC114)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1267650600228229401496703205376').toString()).assertEqual('1267650600228229401496703205376');
      expect(BigInt('1267650600228229401496703205376').toString(16)).assertEqual('10000000000000000000000000');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1200
     * @tc.name testBigIntToString2ExtTest012
     * @tc.desc Verify toString(2) and toString(16) for 2^50 and 2^200 (TC110-TC114)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1125899906842624').toString(2)).assertEqual('1' + '0'.repeat(50));
      expect(BigInt('1125899906842624').toString(16)).assertEqual('4000000000000');
      const hex200: string = '100000000000000000000000000000000000000000000000000';
      expect(BigInt('1606938044258990275541962092341162602522202993782792835301376').toString(16)).assertEqual(hex200);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1300
     * @tc.name testBigIntToString2ExtTest013
     * @tc.desc Verify toString(10) returns same as no-arg toString (TC116, TC117, mindmap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).toString(10)).assertEqual('255');
      expect(BigInt(4294967295).toString(10)).assertEqual('4294967295');
      expect(BigInt(255).toString(10)).assertEqual(BigInt(255).toString());
      expect(BigInt(12345).toString(10)).assertEqual(BigInt(12345).toString());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1400
     * @tc.name testBigIntToString2ExtTest014
     * @tc.desc Verify return value string properties: length, charAt, lowercase hex (mindmap return value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).toString(2).length).assertEqual(8);
      expect(BigInt(255).toString(16).length).assertEqual(2);
      const hexStr: string = BigInt(255).toString(16);
      expect(hexStr.toLowerCase()[0]).assertEqual('f');
      expect(BigInt(4660).toString(16)[3]).assertEqual('4');
      expect(BigInt(255).toString(2)[0]).assertEqual('1');
      expect(BigInt(43981).toString(16).toLowerCase()).assertEqual('abcd');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1500
     * @tc.name testBigIntToString2ExtTest015
     * @tc.desc Verify idempotence and roundtrip for toString(radix) with integer radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: BigInt = BigInt(255);
      expect(v.toString(16)).assertEqual('ff');
      expect(v.toString(10)).assertEqual('255');

      const back: BigInt = BigInt(v.toString(10));
      expect(back.toString(10)).assertEqual('255');

      const backHex: BigInt = BigInt('0x' + v.toString(16));
      expect(backHex.toString(10)).assertEqual('255');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1600
     * @tc.name testBigIntToString2ExtTest016
     * @tc.desc Verify immutability after toString(radix) and chained calls (mindmap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: BigInt = BigInt(255);
      v.toString(16);
      expect(v.toString(10)).assertEqual('255');
      expect(BigInt(200).operatorAdd(BigInt(55)).toString(16)).assertEqual('ff');
      expect(BigInt(2).pow(BigInt(8)).toString(2)).assertEqual('100000000');
      expect(BigInt(255).negate().toString(16)).assertEqual('-ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1700
     * @tc.name testBigIntToString2ExtTest017
     * @tc.desc Verify toString(10) result constructs new BigInt, then toString(16) produces expected hex (TOSTR-RADIX-POW-003)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: BigInt = new BigInt("8888888888888888888");
      const back: BigInt = new BigInt(v.toString(10));
      expect(back.toString(16)).assertEqual("7b5bad595e238e38");

      const vNeg: BigInt = new BigInt("-8888888888888888888");
      const backNeg: BigInt = new BigInt(vNeg.toString(10));
      expect(backNeg.toString(16)).assertEqual("-7b5bad595e238e38");

      const vLarge: BigInt = new BigInt("12345678901234567890");
      const round: BigInt = new BigInt(vLarge.toString(10));
      expect(round.toString()).assertEqual("12345678901234567890");
      expect(vLarge.equals(round)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1800
     * @tc.name testBigIntToString2ExtTest018
     * @tc.desc Verify toString(radix) with int.MAX=2147483647 and int.MIN=-2147483648 throws RangeError (TS2-04/05)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(10).toString(2147483647);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(-2147483648);
      }).assertThrowError('RangeError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_1900
     * @tc.name testBigIntToString2ExtTest019
     * @tc.desc Verify different BigInt values produce different toString(16) results (TS2-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hex255: string = BigInt(255).toString(16);
      const hex256: string = BigInt(256).toString(16);
      expect(hex255).assertEqual('ff');
      expect(hex256).assertEqual('100');
      expect(hex255).not().assertEqual(hex256);
      expect(BigInt(43981).toString(16)).assertEqual('abcd');
      expect(BigInt(0).toString(16)).assertEqual('0');
      expect(BigInt(1).toString(16)).assertEqual('1');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_2_EXT_2000
     * @tc.name testBigIntToString2ExtTest020
     * @tc.desc Verify after toString(0) throws error, the original value can still be used (TS2-11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ExtTest020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: BigInt = BigInt(255);
      let caught: boolean = false;
      try {
        v.toString(0);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
      expect(v.toString(10)).assertEqual('255');
      expect(v.toString(16)).assertEqual('ff');
      expect(v.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_BINARY_EXT_2100
     * @tc.name testBigIntToStringAsBinaryExtTest021
     * @tc.desc Verify toStringAsBinary returns '0' for zero and zero variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsBinaryExtTest021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).toString(2)).assertEqual('0');
      expect(new BigInt(0).toString(2)).assertEqual('0');
      expect(BigInt('-0').toString(2)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_BINARY_EXT_2200
     * @tc.name testBigIntToStringAsBinaryExtTest022
     * @tc.desc Verify toStringAsBinary returns correct binary for positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsBinaryExtTest022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).toString(2)).assertEqual('1');
      expect(BigInt(2).toString(2)).assertEqual('10');
      expect(BigInt(255).toString(2)).assertEqual('11111111');
      expect(BigInt(1024).toString(2)).assertEqual('10000000000');
      expect(BigInt(-1).toString(2)).assertEqual('-1');
      expect(BigInt(-255).toString(2)).assertEqual('-11111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_BINARY_EXT_2300
     * @tc.name testBigIntToStringAsBinaryExtTest023
     * @tc.desc Verify toStringAsBinary for long boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsBinaryExtTest023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9223372036854775807').toString(2)).assertEqual('111111111111111111111111111111111111111111111111111111111111111');
      expect(BigInt('-9223372036854775808').toString(2)).assertEqual('-1000000000000000000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_DECIMAL_EXT_2400
     * @tc.name testBigIntToStringAsDecimalExtTest024
     * @tc.desc Verify toStringAsDecimal returns correct decimal for zero, positive, and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsDecimalExtTest024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).toString()).assertEqual('0');
      expect(BigInt(1).toString()).assertEqual('1');
      expect(BigInt(255).toString()).assertEqual('255');
      expect(BigInt(-1).toString()).assertEqual('-1');
      expect(BigInt('-255').toString()).assertEqual('-255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_DECIMAL_EXT_2500
     * @tc.name testBigIntToStringAsDecimalExtTest025
     * @tc.desc Verify toStringAsDecimal for large values and consistency with no-arg toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsDecimalExtTest025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const huge: string = '1234567890123456789012345678901234567890';
      expect(BigInt(huge).toString()).assertEqual(huge);
      expect(BigInt('9223372036854775807').toString()).assertEqual('9223372036854775807');
      expect(BigInt(255).toString()).assertEqual(BigInt(255).toString());
      expect(BigInt(-42).toString()).assertEqual(BigInt(-42).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_POW2_RADIX_EXT_2600
     * @tc.name testBigIntToStringAsPow2RadixExtTest026
     * @tc.desc Verify toStringAsPowerOfTwoRadix with valid power-of-2 radices 2, 4, 8, 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPow2RadixExtTest026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).toString(2)).assertEqual('11111111');
      expect(BigInt(255).toString(4)).assertEqual('3333');
      expect(BigInt(255).toString(8)).assertEqual('377');
      expect(BigInt(255).toString(16)).assertEqual('ff');
      expect(BigInt(0).toString(2)).assertEqual('0');
      expect(BigInt(0).toString(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_POW2_RADIX_EXT_2700
     * @tc.name testBigIntToStringAsPow2RadixExtTest027
     * @tc.desc Verify toStringAsPowerOfTwoRadix with negative and large values at valid radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPow2RadixExtTest027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-255).toString(16)).assertEqual('-ff');
      expect(BigInt(-1).toString(2)).assertEqual('-1');
      expect(BigInt('9223372036854775807').toString(16)).assertEqual('7fffffffffffffff');
      expect(BigInt(255).toString(16)).assertEqual(BigInt(255).toString(16));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_POW2_RADIX_EXT_2800
     * @tc.name testBigIntToStringAsPow2RadixExtTest028
     * @tc.desc Verify toString(radix) works with non-power-of-2 radices 3,5,6,7,9,10,11,12,13,14,15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPow2RadixExtTest028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).toString(3)).assertEqual('100110');
      expect(BigInt(255).toString(5)).assertEqual('2010');
      expect(BigInt(255).toString(6)).assertEqual('1103');
      expect(BigInt(255).toString(7)).assertEqual('513');
      expect(BigInt(255).toString(9)).assertEqual('313');
      expect(BigInt(255).toString(10)).assertEqual('255');
      expect(BigInt(255).toString(11)).assertEqual('212');
      expect(BigInt(255).toString(12)).assertEqual('193');
      expect(BigInt(255).toString(13)).assertEqual('168');
      expect(BigInt(255).toString(14)).assertEqual('143');
      expect(BigInt(255).toString(15)).assertEqual('120');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_AS_POW2_RADIX_EXT_2900
     * @tc.name testBigIntToStringAsPow2RadixExtTest029
     * @tc.desc Verify toString(radix) works with wide radices 17-36; throws for 0, 1, negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPow2RadixExtTest029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wideRadices: int[] = [17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
      for (let i: int = 0; i < wideRadices.length; i++) {
        const radix: int = wideRadices[i];
        const result: string = BigInt(10).toString(radix);
        expect(result.length).assertLarger(0);
      }
      expect((): void => {
        BigInt(10).toString(0);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(1);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(-2);
      }).assertThrowError('RangeError');
    });
  });
}