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

export default function BigIntConstructorString2Test(): void {
  describe('testBigIntConstructorString2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0100
     * @tc.name testBigIntConstructorString2Test0100
     * @tc.desc Verify BigInt from single non-zero decimal digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('5').toString()).assertEqual('5');
      expect(BigInt('9').toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0200
     * @tc.name testBigIntConstructorString2Test0200
     * @tc.desc Verify BigInt from two-digit decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('10').toString()).assertEqual('10');
      expect(BigInt('99').toString()).assertEqual('99');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0300
     * @tc.name testBigIntConstructorString2Test0300
     * @tc.desc Verify BigInt from powers of ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('100').toString()).assertEqual('100');
      expect(BigInt('10000').toString()).assertEqual('10000');
      expect(BigInt('1000000000').toString()).assertEqual('1000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0400
     * @tc.name testBigIntConstructorString2Test0400
     * @tc.desc Verify BigInt from negative zero string, result is zero and not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nz = BigInt('-0');
      expect(nz.toString()).assertEqual('0');
      expect(nz.negative()).assertFalse();
      expect(nz.equals(BigInt('0'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0500
     * @tc.name testBigIntConstructorString2Test0500
     * @tc.desc Verify BigInt from binary string with all eight bits set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0b11111111').toString()).assertEqual('255');
      expect(BigInt('0b11111111').equals(BigInt(255))).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0600
     * @tc.name testBigIntConstructorString2Test0600
     * @tc.desc Verify multiple adjacent sign characters throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt('++1');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('--1');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('+-1');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('-+1');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0700
     * @tc.name testBigIntConstructorString2Test0700
     * @tc.desc Verify positive sign with leading zeros is parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('+007').toString()).assertEqual('7');
      expect(BigInt('+000').toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0800
     * @tc.name testBigIntConstructorString2Test0800
     * @tc.desc Verify negative sign with leading zeros is parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-007').toString()).assertEqual('-7');
      expect(BigInt('-000').toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0900
     * @tc.name testBigIntConstructorString2Test0900
     * @tc.desc Verify BigInt from hex string with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigintConstructorStringHexLeadingZeros1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0x00FF').toString()).assertEqual('255');
      expect(BigInt('0x0000001A').toString()).assertEqual('26');
    });


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1000
     * @tc.name testBigIntConstructorString2Test1000
     * @tc.desc Verify BigInt from binary string with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0b00001010').toString()).assertEqual('10');
      expect(BigInt('0b00').toString()).assertEqual('0');
    });


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1100
     * @tc.name testBigIntConstructorString2Test1100
     * @tc.desc Verify BigInt from octal string with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0o000077').toString()).assertEqual('63');
      expect(BigInt('0o000').toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1200
     * @tc.name testBigIntConstructorString2Test1200
     * @tc.desc Verify BigInt from positive decimal string exceeding 64-bit range (arbitrary precision)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('123456789012345678901234567890').toString()).assertEqual('123456789012345678901234567890');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1300
     * @tc.name testBigIntConstructorString2Test1300
     * @tc.desc Verify BigInt from negative decimal string exceeding 64-bit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-123456789012345678901234567890').toString()).assertEqual('-123456789012345678901234567890');
      expect(BigInt('-123456789012345678901234567890').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1400
     * @tc.name testBigIntConstructorString2Test1400
     * @tc.desc Verify bare binary prefix 0b/0B strings throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt('0b');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('0B');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_1500
     * @tc.name testBigIntConstructorString2Test1500
     * @tc.desc Verify bare octal prefix 0o/0O strings throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorString2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt('0o');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('0O');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
    });
  });
}
