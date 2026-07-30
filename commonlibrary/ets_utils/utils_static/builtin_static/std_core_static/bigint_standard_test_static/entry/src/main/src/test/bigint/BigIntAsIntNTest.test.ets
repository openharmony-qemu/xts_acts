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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';

export default function BigIntAsIntNTest(): void {
  describe('BigInt.asIntN (mindmap asIntN)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0100
     * @tc.name testBigIntAsIntN8Bit0100
     * @tc.desc Verify 8-bit signed truncation via BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN8Bit0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, Utils.biInt(127)).toString()).assertEqual('127');
      expect(BigInt.asIntN(8, Utils.biInt(-128)).toString()).assertEqual('-128');
      expect(BigInt.asIntN(8, Utils.biInt(128)).toString()).assertEqual('-128');
      expect(BigInt.asIntN(8, Utils.biInt(255)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(8, Utils.biInt(-1)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(8, Utils.biInt(-129)).toString()).assertEqual('127');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0200
     * @tc.name testBigIntAsIntN1Bit0200
     * @tc.desc Verify 1-bit signed truncation via BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN1Bit0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(1, Utils.biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asIntN(1, Utils.biInt(1)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0300
     * @tc.name testBigIntAsIntN16Bit0300
     * @tc.desc Verify 16-bit signed truncation via BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN16Bit0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(16, Utils.biInt(32767)).toString()).assertEqual('32767');
      expect(BigInt.asIntN(16, Utils.biInt(-32768)).toString()).assertEqual('-32768');
      expect(BigInt.asIntN(16, Utils.biInt(32768)).toString()).assertEqual('-32768');
      expect(BigInt.asIntN(16, Utils.biInt(-1)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0400
     * @tc.name testBigIntAsIntN32Bit0400
     * @tc.desc Verify 32-bit signed truncation for max unsigned and 2^31 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN32Bit0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(32, Utils.biStr('4294967295')).toString()).assertEqual('-1');
      expect(BigInt.asIntN(32, Utils.biStr('2147483648')).toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0500
     * @tc.name testBigIntAsIntNNegativeBits0500
     * @tc.desc Verify negative bits argument throws RangeError for BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNNegativeBits0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt.asIntN(-1, Utils.biInt(5));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt.asIntN(-100, Utils.biInt(5));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0600
     * @tc.name testBigIntAsIntNVersusAsUintN0600
     * @tc.desc Verify asIntN and asUintN differ for negative one at 8 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNVersusAsUintN0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const u = BigInt.asUintN(8, Utils.biInt(-1));
      const s = BigInt.asIntN(8, Utils.biInt(-1));

      expect(u.toString()).assertEqual('255');
      expect(s.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0700
     * @tc.name testBigIntAsIntNZero0700
     * @tc.desc Verify zero truncates to zero for 8-bit and 32-bit asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNZero0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, Utils.biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asIntN(32, Utils.biInt(0)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0800
     * @tc.name testBigIntAsIntNZeroBits0800
     * @tc.desc Verify zero bits yields zero for BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNZeroBits0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(0, Utils.biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asIntN(0, Utils.biInt(5)).toString()).assertEqual('0');
      expect(BigInt.asIntN(0, Utils.biInt(-42)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0900
     * @tc.name testBigIntAsIntN64BitBoundary0900
     * @tc.desc Verify 64-bit signed truncation at long min and max magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN64BitBoundary0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(64, Utils.biStr('9223372036854775807')).toString()).assertEqual('9223372036854775807');
      expect(BigInt.asIntN(64, BigInt(-9223372036854775808)).toString()).assertEqual('-9223372036854775808');
      expect(BigInt.asIntN(64, Utils.biStr('9223372036854775808')).toString()).assertEqual('-9223372036854775808');
      expect(BigInt.asIntN(64, Utils.biStr('18446744073709551615')).toString()).assertEqual('-1');
      expect(BigInt.asIntN(64, Utils.biStr('18446744073709551616')).toString()).assertEqual('0');
      expect(BigInt.asIntN(64, Utils.biStr('-9223372036854775809')).toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_1000
     * @tc.name testBigIntAsIntNLargeBits1000
     * @tc.desc Verify 64-bit asIntN truncates 2^100 to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNLargeBits1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const p100 = Utils.biInt(2).pow(Utils.biInt(100));

      expect(BigInt.asIntN(64, p100).toString()).assertEqual('0');
      expect(BigInt.asIntN(64, p100.negate()).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_1100
     * @tc.name testBigIntAsIntNNegativeBoundary1100
     * @tc.desc Verify asIntN truncates negative magnitudes at -9223372036854775808 and sub-64-bit widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNNegativeBoundary1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(-9223372036854775808)).toString()).assertEqual('0');
      expect(BigInt.asIntN(16, BigInt(-9223372036854775808)).toString()).assertEqual('0');
      expect(BigInt.asIntN(32, BigInt(-9223372036854775808)).toString()).assertEqual('0');
      expect(BigInt.asIntN(64, Utils.biStr('-9223372036854775809')).toString()).assertEqual('9223372036854775807');
      expect(BigInt.asIntN(64, Utils.biInt(2).pow(Utils.biInt(100)).negate()).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_1200
     * @tc.name testBigIntAsIntNReturnType1200
     * @tc.desc Verify BigInt.asIntN returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNReturnType1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const truncated = BigInt.asIntN(8, Utils.biInt(255));

      expect(Class.of(truncated as Object)).assertEqual(Class.from<BigInt>());
    });
  });
}
