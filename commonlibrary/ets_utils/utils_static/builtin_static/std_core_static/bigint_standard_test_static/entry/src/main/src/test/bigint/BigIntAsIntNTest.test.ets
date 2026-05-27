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
import {
  LONG_MIN,
  LONG_MAX_STR,
  LONG_MIN_STR,
  LONG_MAX_PLUS_ONE_STR,
  LONG_MIN_MINUS_ONE_STR,
  UINT32_MAX_STR,
  ULONG_MAX_STR,
  ULONG_MAX_PLUS_ONE_STR,
  INT8_MAX,
  INT8_MIN,
  INT8_OVERFLOW,
  UINT8_MAX,
  INT16_MAX,
  INT16_MIN,
  INT16_OVERFLOW,
  INT32_MIN_STR,
  POW2_31_STR,
  POW2_EXPONENT_100
} from '../BigIntTestLimits';
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
      expect(BigInt.asIntN(8, Utils.biInt(INT8_MAX)).toString()).assertEqual('127');
      expect(BigInt.asIntN(8, Utils.biInt(INT8_MIN)).toString()).assertEqual('-128');
      expect(BigInt.asIntN(8, Utils.biInt(INT8_OVERFLOW)).toString()).assertEqual('-128');
      expect(BigInt.asIntN(8, Utils.biInt(UINT8_MAX)).toString()).assertEqual('-1');
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
      expect(BigInt.asIntN(16, Utils.biInt(INT16_MAX)).toString()).assertEqual('32767');
      expect(BigInt.asIntN(16, Utils.biInt(INT16_MIN)).toString()).assertEqual('-32768');
      expect(BigInt.asIntN(16, Utils.biInt(INT16_OVERFLOW)).toString()).assertEqual('-32768');
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
      expect(BigInt.asIntN(32, Utils.biStr(UINT32_MAX_STR)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(32, Utils.biStr(POW2_31_STR)).toString()).assertEqual(INT32_MIN_STR);
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
      expect(BigInt.asIntN(64, Utils.biStr(LONG_MAX_STR)).toString()).assertEqual(LONG_MAX_STR);
      expect(BigInt.asIntN(64, BigInt(LONG_MIN)).toString()).assertEqual(LONG_MIN_STR);
      expect(BigInt.asIntN(64, Utils.biStr(LONG_MAX_PLUS_ONE_STR)).toString()).assertEqual(LONG_MIN_STR);
      expect(BigInt.asIntN(64, Utils.biStr(ULONG_MAX_STR)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(64, Utils.biStr(ULONG_MAX_PLUS_ONE_STR)).toString()).assertEqual('0');
      expect(BigInt.asIntN(64, Utils.biStr(LONG_MIN_MINUS_ONE_STR)).toString()).assertEqual(LONG_MAX_STR);
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
      const p100 = Utils.biInt(2).pow(Utils.biInt(POW2_EXPONENT_100));

      expect(BigInt.asIntN(64, p100).toString()).assertEqual('0');
      expect(BigInt.asIntN(64, p100.negate()).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_1100
     * @tc.name testBigIntAsIntNNegativeBoundary1100
     * @tc.desc Verify asIntN truncates negative magnitudes at LONG_MIN and sub-64-bit widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNNegativeBoundary1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(LONG_MIN)).toString()).assertEqual('0');
      expect(BigInt.asIntN(16, BigInt(LONG_MIN)).toString()).assertEqual('0');
      expect(BigInt.asIntN(32, BigInt(LONG_MIN)).toString()).assertEqual('0');
      expect(BigInt.asIntN(64, Utils.biStr(LONG_MIN_MINUS_ONE_STR)).toString()).assertEqual(LONG_MAX_STR);
      expect(BigInt.asIntN(64, Utils.biInt(2).pow(Utils.biInt(POW2_EXPONENT_100)).negate()).toString()).assertEqual('0');
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
      const truncated = BigInt.asIntN(8, Utils.biInt(UINT8_MAX));

      expect(Class.of(truncated as Object)).assertEqual(Class.from<BigInt>());
    });
  });
}
