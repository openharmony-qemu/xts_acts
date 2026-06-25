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
import Utils from '../Util.test';

export default function BigIntAsUintNTest(): void {
  describe('BigInt.asUintN (mindmap asUintN)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0100
     * @tc.name testBigIntAsUintN8Bit0100
     * @tc.desc Verify 8-bit unsigned truncation via BigInt.asUintN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN8Bit0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, Utils.biInt(127)).toString()).assertEqual('127');
      expect(BigInt.asUintN(8, Utils.biInt(255)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0200
     * @tc.name testBigIntAsUintN1Bit0200
     * @tc.desc Verify 1-bit unsigned truncation via BigInt.asUintN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN1Bit0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(1, Utils.biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asUintN(1, Utils.biInt(1)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, Utils.biInt(2)).toString()).assertEqual('0');
      expect(BigInt.asUintN(1, Utils.biInt(3)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, Utils.biInt(-1)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0300
     * @tc.name testBigIntAsUintN8BitBoundary0300
     * @tc.desc Verify 8-bit unsigned boundary and overflow via BigInt.asUintN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN8BitBoundary0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, Utils.biInt(255)).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, Utils.biInt(256)).toString()).assertEqual('0');
      expect(BigInt.asUintN(8, Utils.biInt(256 + 1)).toString()).assertEqual('1');
      expect(BigInt.asUintN(8, Utils.biInt(-1)).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, Utils.biInt(-128)).toString()).assertEqual('128');
      expect(BigInt.asUintN(8, Utils.biInt(-256)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0400
     * @tc.name testBigIntAsUintNMultiWidthMax0400
     * @tc.desc Verify 16-bit, 32-bit, and 64-bit unsigned maxima via BigInt.asUintN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNMultiWidthMax0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(16, Utils.biInt(65535)).toString()).assertEqual('65535');
      expect(BigInt.asUintN(16, Utils.biInt(65536)).toString()).assertEqual('0');
      expect(BigInt.asUintN(32, Utils.biStr('4294967295')).toString()).assertEqual('4294967295');
      expect(BigInt.asUintN(32, Utils.biStr('4294967296')).toString()).assertEqual('0');
      expect(BigInt.asUintN(64, Utils.biStr('18446744073709551615')).toString()).assertEqual('18446744073709551615');
      expect(BigInt.asUintN(64, Utils.biStr('18446744073709551616')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0500
     * @tc.name testBigIntAsUintNZeroBits0500
     * @tc.desc Verify zero bits yields zero for BigInt.asUintN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNZeroBits0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(0, Utils.biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asUintN(0, Utils.biInt(5)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0600
     * @tc.name testBigIntAsUintNNegativeBits0600
     * @tc.desc Verify negative bits argument throws RangeError for BigInt.asUintN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNNegativeBits0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt.asUintN(-1, Utils.biInt(5));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt.asUintN(-100, Utils.biInt(5));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0700
     * @tc.name testBigIntAsUintNVersusAsIntN0700
     * @tc.desc Verify asUintN and asIntN differ at 8 bits for value 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNVersusAsIntN0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const u = BigInt.asUintN(8, Utils.biInt(200));
      const s = BigInt.asIntN(8, Utils.biInt(200));

      expect(u.toString()).assertEqual('200');
      expect(s.toString()).assertEqual('-56');
      expect(BigInt.asUintN(8, Utils.biInt(127)).equals(BigInt.asIntN(8, Utils.biInt(127)))).assertTrue();
      expect(BigInt.asUintN(16, Utils.biInt(-1)).toString()).assertEqual('65535');
      expect(BigInt.asIntN(16, Utils.biInt(-1)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0800
     * @tc.name testBigIntAsUintNModEquivalence0800
     * @tc.desc Verify 8-bit asUintN matches modular equivalence for value 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNModEquivalence0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const masked = BigInt.asUintN(8, Utils.biInt(300));
      const mod256 = Utils.biInt(300).operatorModule(Utils.biInt(256));
      const alt = mod256.operatorLessThan(Utils.biInt(0)) ? mod256.operatorAdd(Utils.biInt(256)) : mod256;

      expect(masked.equals(alt)).assertTrue();
      expect(masked.toString()).assertEqual('44');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0900
     * @tc.name testBigIntAsUintNIdempotent0900
     * @tc.desc Verify repeated 8-bit asUintN truncation is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNIdempotent0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const x = Utils.biInt(12345);
      const once = BigInt.asUintN(8, x);
      const twice = BigInt.asUintN(8, once);

      expect(once.equals(twice)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_1000
     * @tc.name testBigIntAsUintNLargeBits1000
     * @tc.desc Verify 64-bit asUintN truncates 2^100 to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNLargeBits1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const p100 = Utils.biInt(2).pow(Utils.biInt(100));

      expect(BigInt.asUintN(64, p100).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_1100
     * @tc.name testBigIntAsUintN64BitLongBounds1100
     * @tc.desc Verify 64-bit asUintN at signed long extrema magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN64BitLongBounds1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(64, BigInt(9223372036854775807)).toString()).assertEqual('9223372036854775807');
      expect(BigInt.asUintN(64, BigInt(-9223372036854775808)).toString()).assertEqual('9223372036854775808');
      expect(BigInt.asUintN(64, BigInt(0)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_1200
     * @tc.name testBigIntAsUintNULongMax1200
     * @tc.desc Verify 64-bit asUintN preserves unsigned maximum and truncates beyond uint64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNULongMax1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const umax = Utils.biStr('18446744073709551615');

      expect(BigInt.asUintN(64, umax).toString()).assertEqual('18446744073709551615');
      expect(BigInt.asUintN(64, Utils.biStr('18446744073709551616')).toString()).assertEqual('0');
      expect(umax.operatorGreaterThan(BigInt(9223372036854775807))).assertTrue();
    });
  });
}
