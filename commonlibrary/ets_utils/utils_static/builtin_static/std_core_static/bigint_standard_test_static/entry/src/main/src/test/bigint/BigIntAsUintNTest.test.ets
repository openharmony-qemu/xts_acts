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

function biInt(n: int): BigInt {
  return BigInt(n);
}

function biStr(s: string): BigInt {
  return BigInt(s);
}

export default function BigIntAsUintNTest(): void {
  describe('BigInt.asUintN (mindmap asUintN)', (): void => {
    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0100
     * @tc.name testBigIntAsUintN8And32Bit0100
     * @tc.desc Verify 8-bit and 32-bit unsigned truncation via BigInt.asUintN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN8And32Bit0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, biInt(127)).toString()).assertEqual('127');
      expect(BigInt.asUintN(32, biStr('4294967295')).toString()).assertEqual('4294967295');
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
      expect(BigInt.asUintN(1, biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asUintN(1, biInt(1)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, biInt(2)).toString()).assertEqual('0');
      expect(BigInt.asUintN(1, biInt(3)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, biInt(-1)).toString()).assertEqual('1');
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
      expect(BigInt.asUintN(8, biInt(255)).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, biInt(256)).toString()).assertEqual('0');
      expect(BigInt.asUintN(8, biInt(257)).toString()).assertEqual('1');
      expect(BigInt.asUintN(8, biInt(-1)).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, biInt(-128)).toString()).assertEqual('128');
      expect(BigInt.asUintN(8, biInt(-256)).toString()).assertEqual('0');
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
      expect(BigInt.asUintN(16, biInt(65535)).toString()).assertEqual('65535');
      expect(BigInt.asUintN(16, biInt(65536)).toString()).assertEqual('0');
      expect(BigInt.asUintN(32, biStr('4294967295')).toString()).assertEqual('4294967295');
      expect(BigInt.asUintN(32, biStr('4294967296')).toString()).assertEqual('0');
      expect(BigInt.asUintN(64, biStr('18446744073709551615')).toString()).assertEqual('18446744073709551615');
      expect(BigInt.asUintN(64, biStr('18446744073709551616')).toString()).assertEqual('0');
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
      expect(BigInt.asUintN(0, biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asUintN(0, biInt(5)).toString()).assertEqual('0');
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
        BigInt.asUintN(-1, biInt(5));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt.asUintN(-100, biInt(5));
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
      const u = BigInt.asUintN(8, biInt(200));
      const s = BigInt.asIntN(8, biInt(200));

      expect(u.toString()).assertEqual('200');
      expect(s.toString()).assertEqual('-56');
      expect(BigInt.asUintN(8, biInt(127)).equals(BigInt.asIntN(8, biInt(127)))).assertTrue();
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
      const masked = BigInt.asUintN(8, biInt(300));
      const mod256 = biInt(300).operatorModule(biInt(256));
      const alt = mod256.operatorLessThan(biInt(0)) ? mod256.operatorAdd(biInt(256)) : mod256;

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
      const x = biInt(12345);
      const once = BigInt.asUintN(8, x);
      const twice = BigInt.asUintN(8, once);

      expect(once.equals(twice)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_1000
     * @tc.name testBigIntAsUintNLargeExponent1000
     * @tc.desc Verify 64-bit asUintN truncates 2^100 to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintNLargeExponent1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const p100 = biInt(2).pow(biInt(100));

      expect(BigInt.asUintN(64, p100).toString()).assertEqual('0');
    });
  });
}
