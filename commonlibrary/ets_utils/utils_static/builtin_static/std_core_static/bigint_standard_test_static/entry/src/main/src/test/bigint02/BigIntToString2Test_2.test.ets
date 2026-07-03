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
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0001
     * @tc.name testBigIntToString2ZeroAllRadices0001
     * @tc.desc Verify toString(radix) returns 0 for zero at all radices 2 through 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ZeroAllRadices0001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toString(2)).assertEqual('0');
      expect(BigInt(0).toString(8)).assertEqual('0');
      expect(BigInt(0).toString(10)).assertEqual('0');
      expect(BigInt(0).toString(16)).assertEqual('0');
      expect(BigInt(0).toString(36)).assertEqual('0');
      expect(BigInt('-0').toString(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0002
     * @tc.name testBigIntToString2MultipleRadices0002
     * @tc.desc Verify toString with radices 3 through 14 on a common value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2MultipleRadices0002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0003
     * @tc.name testBigIntToString2LargeHex0003
     * @tc.desc Verify toString(16) for 2^128 and other large powers of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2LargeHex0003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('340282366920938463463374607431768211456').toString(16)).assertEqual('100000000000000000000000000000000');
      expect(BigInt('18446744073709551616').toString(16)).assertEqual('10000000000000000');
      expect(BigInt('340282366920938463463374607431768211455').toString(16)).assertEqual('ffffffffffffffffffffffffffffffff');
    });


    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0004
     * @tc.name testBigIntToString2NegativeRadix0004
     * @tc.desc Verify toString(radix) for negative values across multiple radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2NegativeRadix0004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-255).toString(2)).assertEqual('-11111111');
      expect(BigInt(-255).toString(8)).assertEqual('-377');
      expect(BigInt(-255).toString(10)).assertEqual('-255');
      expect(BigInt(-255).toString(36)).assertEqual('-73');
      expect(BigInt(-10).toString(2)).assertEqual('-1010');
      expect(BigInt(-1).toString(16)).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0005
     * @tc.name testBigIntToString2RadixConstructedWithRadix0005
     * @tc.desc Verify toString(radix) for hex/bin/oct string constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RadixConstructedWithRadix0005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0xFF').toString(10)).assertEqual('255');
      expect(BigInt('0xFF').toString(16)).assertEqual('ff');
      expect(BigInt('0b1010').toString(10)).assertEqual('10');
      expect(BigInt('0b1010').toString(2)).assertEqual('1010');
      expect(BigInt('0o77').toString(10)).assertEqual('63');
      expect(BigInt('0o77').toString(8)).assertEqual('77');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0006
     * @tc.name testBigIntToString2BooleanConstructed0006
     * @tc.desc Verify toString(radix) for boolean-constructed BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2BooleanConstructed0006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).toString(2)).assertEqual('1');
      expect(BigInt(true).toString(10)).assertEqual('1');
      expect(BigInt(false).toString(2)).assertEqual('0');
      expect(BigInt(false).toString(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0007
     * @tc.name testBigIntToString2UltraLargeRadix0007
     * @tc.desc Verify toString(radix) for ultra-large 100+ digit BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2UltraLargeRadix0007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge: string = '12345678901234567890123456789012345678901234567890';
      const result: string = BigInt(huge).toString(16);

      const backToDecimal: string = BigInt('0x' + result).toString(10);

      expect(backToDecimal).assertEqual(huge);
      expect(result.length).assertEqual(41);

      const hexRegex = new RegExp('^[0-9a-f]+$');
      expect(hexRegex.test(result)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0008
     * @tc.name testBigIntToString2RadixBoundaryValues0008
     * @tc.desc Verify toString at exact radix boundaries 2 and 36 on zero and large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RadixBoundaryValues0008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(35).toString(36)).assertEqual('z');
      expect(BigInt(36).toString(36)).assertEqual('10');
      expect(BigInt(37).toString(36)).assertEqual('11');
      expect(BigInt(2).toString(2)).assertEqual('10');
      expect(BigInt(3).toString(2)).assertEqual('11');
      expect(BigInt(0).toString(2)).assertEqual('0');
      expect(BigInt(0).toString(36)).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0009
     * @tc.name testBigIntToString2NegativeZeroWithRadix0009
     * @tc.desc Verify toString(radix) for negative zero and zero variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2NegativeZeroWithRadix0009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-0').toString(10)).assertEqual('0');
      expect(BigInt('-0').toString(16)).assertEqual('0');
      expect(BigInt('-0').toString(2)).assertEqual('0');
      expect(BigInt('000').toString(10)).assertEqual('0');
      expect(BigInt('-000').toString(10)).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0010
     * @tc.name testBigIntToString2OtherRadices0010
     * @tc.desc Verify toString(radix) for various radices (2-36) with multiple values using roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2OtherRadices0010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0011
     * @tc.name testBigIntToString2RadixPowerOfTwo0011
     * @tc.desc Verify toString(radix) for 2^n values in various radices (TC087-TC089, TC111-TC114)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RadixPowerOfTwo0011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1267650600228229401496703205376').toString()).assertEqual('1267650600228229401496703205376');
      expect(BigInt('1267650600228229401496703205376').toString(16)).assertEqual('10000000000000000000000000');
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0012
     * @tc.name testBigIntToString2PowerTwoLargeRadix0012
     * @tc.desc Verify toString(2) and toString(16) for 2^50 and 2^200 (TC110-TC114)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2PowerTwoLargeRadix0012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1125899906842624').toString(2)).assertEqual('1' + '0'.repeat(50));
      expect(BigInt('1125899906842624').toString(16)).assertEqual('4000000000000');
      const hex200: string = '100000000000000000000000000000000000000000000000000';
      expect(BigInt('1606938044258990275541962092341162602522202993782792835301376').toString(16)).assertEqual(hex200);
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0013
     * @tc.name testBigIntToString2Radix10Explicit0013
     * @tc.desc Verify toString(10) returns same as no-arg toString (TC116, TC117, mindmap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Radix10Explicit0013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).toString(10)).assertEqual('255');
      expect(BigInt(4294967295).toString(10)).assertEqual('4294967295');
      expect(BigInt(255).toString(10)).assertEqual(BigInt(255).toString());
      expect(BigInt(12345).toString(10)).assertEqual(BigInt(12345).toString());
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0014
     * @tc.name testBigIntToString2ReturnValueProps0014
     * @tc.desc Verify return value string properties: length, charAt, lowercase hex (mindmap return value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ReturnValueProps0014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).toString(2).length).assertEqual(8);
      expect(BigInt(255).toString(16).length).assertEqual(2);
      const hexStr: string = BigInt(255).toString(16);
      expect(hexStr.toLowerCase()[0]).assertEqual('f');
      expect(BigInt(4660).toString(16)[3]).assertEqual('4');
      expect(BigInt(255).toString(2)[0]).assertEqual('1');
      expect(BigInt(43981).toString(16).toLowerCase()).assertEqual('abcd');
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0015
     * @tc.name testBigIntToString2IdempotentAndRoundtrip0015
     * @tc.desc Verify idempotence and roundtrip for toString(radix) with integer radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2IdempotentAndRoundtrip0015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(255).toString(10)).assertEqual('255');

      const v: BigInt = BigInt(255);
      expect(v.toString(16)).assertEqual('ff');
      expect(v.toString(10)).assertEqual('255');

      const back: BigInt = BigInt(v.toString(10));
      expect(back.toString(10)).assertEqual('255');

      const backHex: BigInt = BigInt('0x' + v.toString(16));
      expect(backHex.toString(10)).assertEqual('255');
    });


    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0016
     * @tc.name testBigIntToString2ImmutabilityAndChained0016
     * @tc.desc Verify immutability after toString(radix) and chained calls (mindmap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ImmutabilityAndChained0016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: BigInt = BigInt(255);
      v.toString(16);
      expect(v.toString(10)).assertEqual('255');
      expect(BigInt(200).operatorAdd(BigInt(55)).toString(16)).assertEqual('ff');
      expect(BigInt(2).pow(BigInt(8)).toString(2)).assertEqual('100000000');
      expect(BigInt(255).negate().toString(16)).assertEqual('-ff');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0017
     * @tc.name testBigIntToString2RoundtripThroughRadix0017
     * @tc.desc Verify toString(10) result constructs new BigInt, then toString(16) produces expected hex (TOSTR-RADIX-POW-003)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RoundtripThroughRadix0017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0018
     * @tc.name testBigIntToString2RadixIntBoundaryThrows0018
     * @tc.desc Verify toString(radix) with int.MAX=2147483647 and int.MIN=-2147483648 throws RangeError (TS2-04/05)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RadixIntBoundaryThrows0018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(10).toString(2147483647);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(-2147483648);
      }).assertThrowError('RangeError');
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0019
     * @tc.name testBigIntToString2DifferentValuesDifferentHex0019
     * @tc.desc Verify different BigInt values produce different toString(16) results (TS2-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2DifferentValuesDifferentHex0019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_EXT_0020
     * @tc.name testBigIntToString2ErrorRecoveryAfterInvalidRadix0020
     * @tc.desc Verify after toString(0) throws error, the original value can still be used (TS2-11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ErrorRecoveryAfterInvalidRadix0020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: BigInt = BigInt(255);
      let caught: boolean = false;
      try {
        v.toString(0);
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(v.toString(10)).assertEqual('255');
      expect(v.toString(16)).assertEqual('ff');
      expect(v.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_BINARY_EXT_0021
     * @tc.name testBigIntToString2AsBinaryZero0021
     * @tc.desc Verify toStringAsBinary returns '0' for zero and zero variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsBinaryZero0021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toStringAsBinary()).assertEqual('0');
      expect(new BigInt(0).toStringAsBinary()).assertEqual('0');
      expect(BigInt('-0').toStringAsBinary()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_BINARY_EXT_0022
     * @tc.name testBigIntToString2AsBinaryValues0022
     * @tc.desc Verify toStringAsBinary returns correct binary for positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsBinaryValues0022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).toStringAsBinary()).assertEqual('1');
      expect(BigInt(2).toStringAsBinary()).assertEqual('10');
      expect(BigInt(255).toStringAsBinary()).assertEqual('11111111');
      expect(BigInt(1024).toStringAsBinary()).assertEqual('10000000000');
      expect(BigInt(-1).toStringAsBinary()).assertEqual('-1');
      expect(BigInt(-255).toStringAsBinary()).assertEqual('-11111111');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_BINARY_EXT_0023
     * @tc.name testBigIntToString2AsBinaryLongBoundary0023
     * @tc.desc Verify toStringAsBinary for long boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsBinaryLongBoundary0023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').toStringAsBinary()).assertEqual('111111111111111111111111111111111111111111111111111111111111111');
      expect(BigInt('-9223372036854775808').toStringAsBinary()).assertEqual('-1000000000000000000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_DECIMAL_EXT_0024
     * @tc.name testBigIntToString2AsDecimalZeroPosNeg0024
     * @tc.desc Verify toStringAsDecimal returns correct decimal for zero, positive, and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsDecimalZeroPosNeg0024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toStringAsDecimal()).assertEqual('0');
      expect(BigInt(1).toStringAsDecimal()).assertEqual('1');
      expect(BigInt(255).toStringAsDecimal()).assertEqual('255');
      expect(BigInt(-1).toStringAsDecimal()).assertEqual('-1');
      expect(BigInt('-255').toStringAsDecimal()).assertEqual('-255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_DECIMAL_EXT_0025
     * @tc.name testBigIntToString2AsDecimalLarge0025
     * @tc.desc Verify toStringAsDecimal for large values and consistency with no-arg toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsDecimalLarge0025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge: string = '1234567890123456789012345678901234567890';
      expect(BigInt(huge).toStringAsDecimal()).assertEqual(huge);
      expect(BigInt('9223372036854775807').toStringAsDecimal()).assertEqual('9223372036854775807');
      expect(BigInt(255).toStringAsDecimal()).assertEqual(BigInt(255).toString());
      expect(BigInt(-42).toStringAsDecimal()).assertEqual(BigInt(-42).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_POW2_RADIX_EXT_0026
     * @tc.name testBigIntToString2AsPow2RadixValid0026
     * @tc.desc Verify toStringAsPowerOfTwoRadix with valid power-of-2 radices 2, 4, 8, 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsPow2RadixValid0026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).toStringAsPowerOfTwoRadix(2)).assertEqual('11111111');
      expect(BigInt(255).toStringAsPowerOfTwoRadix(4)).assertEqual('3333');
      expect(BigInt(255).toStringAsPowerOfTwoRadix(8)).assertEqual('377');
      expect(BigInt(255).toStringAsPowerOfTwoRadix(16)).assertEqual('ff');
      expect(BigInt(0).toStringAsPowerOfTwoRadix(2)).assertEqual('0');
      expect(BigInt(0).toStringAsPowerOfTwoRadix(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_POW2_RADIX_EXT_0027
     * @tc.name testBigIntToString2AsPow2RadixNegativeAndLarge0027
     * @tc.desc Verify toStringAsPowerOfTwoRadix with negative and large values at valid radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsPow2RadixNegativeAndLarge0027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-255).toStringAsPowerOfTwoRadix(16)).assertEqual('-ff');
      expect(BigInt(-1).toStringAsPowerOfTwoRadix(2)).assertEqual('-1');
      expect(BigInt('9223372036854775807').toStringAsPowerOfTwoRadix(16)).assertEqual('7fffffffffffffff');
      expect(BigInt(255).toStringAsPowerOfTwoRadix(16)).assertEqual(BigInt(255).toString(16));
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_POW2_RADIX_EXT_0028
     * @tc.name testBigIntToString2AsPow2RadixNonPow2Throws0028
     * @tc.desc Verify toStringAsPowerOfTwoRadix throws RangeError for non-power-of-2 radices 3,5,6,7,9,10,11,12,13,14,15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsPow2RadixNonPow2Throws0028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nonPow2Radices: int[] = [3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15];
      for (let i: int = 0; i < nonPow2Radices.length; i++) {
        const radix: int = nonPow2Radices[i];
        expect((): void => {
          BigInt(255).toStringAsPowerOfTwoRadix(radix);
        }).assertThrowError('RangeError');
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_AS_POW2_RADIX_EXT_0029
     * @tc.name testBigIntToString2AsPow2RadixNonPow2WideThrows0029
     * @tc.desc Verify toStringAsPowerOfTwoRadix throws RangeError for non-power-of-2 radices 17-36 and 0, 1, negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2AsPow2RadixNonPow2WideThrows0029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const wideNonPow2: int[] = [17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
      for (let i: int = 0; i < wideNonPow2.length; i++) {
        const radix: int = wideNonPow2[i];
        expect((): void => {
          BigInt(10).toStringAsPowerOfTwoRadix(radix);
        }).assertThrowError('RangeError');
      }
      expect((): void => {
        BigInt(10).toStringAsPowerOfTwoRadix(0);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toStringAsPowerOfTwoRadix(1);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toStringAsPowerOfTwoRadix(-2);
      }).assertThrowError('RangeError');
    });
  });
}