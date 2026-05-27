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

export default function BigIntConstructorStringTest(): void {
  describe('BigInt string constructor (mindmap constructor_7)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0100
     * @tc.name testBigIntConstructorStringDecimalPositive0100
     * @tc.desc Verify BigInt construction from positive decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringDecimalPositive0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0').toString()).assertEqual('0');
      expect(BigInt('42').toString()).assertEqual('42');
      expect(BigInt('9007199254740993').toString()).assertEqual('9007199254740993');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0200
     * @tc.name testBigIntConstructorStringDecimalNegative0200
     * @tc.desc Verify BigInt construction from negative decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringDecimalNegative0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-1').toString()).assertEqual('-1');
      expect(BigInt('-256').toString()).assertEqual('-256');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0300
     * @tc.name testBigIntConstructorStringLeadingZeros0300
     * @tc.desc Verify BigInt construction ignores leading zeros in decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringLeadingZeros0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('007').toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0400
     * @tc.name testBigIntConstructorStringEmptyString0400
     * @tc.desc Verify empty decimal string parses as zero and equals BigInt(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringEmptyString0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fromEmpty = BigInt('');

      expect(fromEmpty.toString()).assertEqual('0');
      expect(fromEmpty.equals(BigInt(0))).assertTrue();
      expect(fromEmpty.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0500
     * @tc.name testBigIntConstructorStringInvalidArgDecimal0500
     * @tc.desc Verify invalid decimal string throws when constructing BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringInvalidArgDecimal0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt('abc');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0600
     * @tc.name testBigIntConstructorStringPositiveSign0600
     * @tc.desc Verify BigInt construction accepts leading plus sign in decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringPositiveSign0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('+0').toString()).assertEqual('0');
      expect(BigInt('+42').toString()).assertEqual('42');
      expect(BigInt('+2147483647').toString()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0700
     * @tc.name testBigIntConstructorStringWhitespace0700
     * @tc.desc Verify ASCII whitespace trim for decimal strings, including whitespace-only as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringWhitespace0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(' 42').toString()).assertEqual('42');
      expect(BigInt('42 ').toString()).assertEqual('42');
      expect(BigInt(' 42 ').toString()).assertEqual('42');
      expect(BigInt('\t42').toString()).assertEqual('42');
      expect(BigInt('42\n').toString()).assertEqual('42');
      expect(BigInt('\r\n42\r\n').toString()).assertEqual('42');
      expect(BigInt(' \t 42 \n ').toString()).assertEqual('42');
      expect(BigInt('   ').toString()).assertEqual('0');
      expect(BigInt('\t\n').toString()).assertEqual('0');
      expect(BigInt(' \t\n ').equals(BigInt(''))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0800
     * @tc.name testBigIntConstructorStringNonDecimalRadix0800
     * @tc.desc Verify hex/binary/octal prefixed strings construct BigInt (current runtime behavior)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringNonDecimalRadix0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0xFF').toString()).assertEqual('255');
      expect(BigInt('0b1010').toString()).assertEqual('10');
      expect(BigInt('0o77').toString()).assertEqual('63');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0900
     * @tc.name testBigIntConstructorStringInvalidArgHex0900
     * @tc.desc Verify invalid hex digit in prefixed string throws when constructing BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringInvalidArgHex0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt('0xGG');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('0b102');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1000
     * @tc.name testBigIntConstructorStringInvalidArgMixedDecimal1000
     * @tc.desc Verify invalid decimal strings throw, including inner whitespace and dotted forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringInvalidArgMixedDecimal1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt('12abc');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('4 2');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('+ 42');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('1.5');
      }).assertThrow("Can't convert number 1.5 to BigInt because it's not an integer");
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1100
     * @tc.name testBigIntConstructorStringLongBounds1100
     * @tc.desc Verify decimal strings at signed long extrema construct exact BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringLongBounds1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').toString()).assertEqual('9223372036854775807');
      expect(BigInt('-9223372036854775808').toString()).assertEqual('-9223372036854775808');
      expect(BigInt('+9223372036854775807').toString()).assertEqual('9223372036854775807');
      expect(BigInt('9223372036854775808').toString()).assertEqual('9223372036854775808');
      expect(BigInt('-9223372036854775809').toString()).assertEqual('-9223372036854775809');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1200
     * @tc.name testBigIntConstructorStringULongMax1200
     * @tc.desc Verify decimal string at unsigned 64-bit maximum constructs exact BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringULongMax1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('18446744073709551615').toString()).assertEqual('18446744073709551615');
      expect(BigInt('18446744073709551615').equals(BigInt.fromULong(-1))).assertTrue();
    });
  });
}
