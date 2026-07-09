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
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect} from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';

export default function BigIntAsIntN2Test(): void {
  describe('testBigIntAsIntN2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_1300
     * @tc.name testBigIntAsIntN2Test013
     * @tc.desc Verify 1-bit asIntN with even inputs yields 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(1, Utils.biInt(2)).toString()).assertEqual('0');
      expect(BigInt.asIntN(1, Utils.biInt(4)).toString()).assertEqual('0');
      expect(BigInt.asIntN(1, Utils.biInt(-2)).toString()).assertEqual('0');
      expect(BigInt.asIntN(1, Utils.biInt(-4)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_1400
     * @tc.name testBigIntAsIntN2Test014
     * @tc.desc Verify 1-bit asIntN with odd non-zero inputs yields -1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(1, Utils.biInt(3)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(1, Utils.biInt(5)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(1, Utils.biInt(-3)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(1, Utils.biInt(-5)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_1500
     * @tc.name testBigIntAsIntN2Test015
     * @tc.desc Verify 8-bit asIntN wraps full period 256 and -256 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, Utils.biInt(256)).toString()).assertEqual('0');
      expect(BigInt.asIntN(8, Utils.biInt(-256)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_1600
     * @tc.name testBigIntAsIntN2Test016
     * @tc.desc Verify 8-bit asIntN wraps -255 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, Utils.biInt(-255)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_1700
     * @tc.name testBigIntAsIntN2Test017
     * @tc.desc Verify 16-bit asIntN at unsigned max, min-1, and full cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(16, Utils.biInt(65535)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(16, Utils.biInt(-32769)).toString()).assertEqual('32767');
      expect(BigInt.asIntN(16, Utils.biInt(65536)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_1800
     * @tc.name testBigIntAsIntN2Test018
     * @tc.desc Verify 32-bit asIntN at signed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(32, BigInt(-2147483648)).toString()).assertEqual('-2147483648');
      expect(BigInt.asIntN(32, BigInt(2147483647)).toString()).assertEqual('2147483647');
      expect(BigInt.asIntN(32, BigInt(2147483648)).toString()).assertEqual('-2147483648');
      expect(BigInt.asIntN(32, BigInt(4294967295)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_1900
     * @tc.name testBigIntAsIntN2Test019
     * @tc.desc Verify 8-bit asIntN multi-cycle overflow gives correct signed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, Utils.biInt(896)).toString()).assertEqual('-128');
      expect(BigInt.asIntN(8, Utils.biInt(-641)).toString()).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_2000
     * @tc.name testBigIntAsIntN2Test020
     * @tc.desc Verify idempotency: applying asIntN twice yields the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const once8 = BigInt.asIntN(8, Utils.biInt(200));
      const twice8 = BigInt.asIntN(8, once8);
      expect(once8.equals(twice8)).assertTrue();
      const once32 = BigInt.asIntN(32, Utils.biStr('4294967295'));
      const twice32 = BigInt.asIntN(32, once32);
      expect(once32.equals(twice32)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_2100
     * @tc.name testBigIntAsIntN2Test021
     * @tc.desc Verify symmetry: asIntN(8, -n) equals -asIntN(8, n) when n is not the minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pos = BigInt.asIntN(8, Utils.biInt(100));
      const neg = BigInt.asIntN(8, Utils.biInt(-100));
      expect(pos.negate().equals(neg)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_2200
     * @tc.name testBigIntAsIntN2Test022
     * @tc.desc Verify sign correctness: positive, negative, zero results have correct sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, Utils.biInt(42)).operatorGreaterThan(BigInt(0))).assertTrue();
      expect(BigInt.asIntN(8, Utils.biInt(-42)).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt.asIntN(8, Utils.biInt(0)).equals(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_2300
     * @tc.name testBigIntAsIntN2Test023
     * @tc.desc Verify asIntN equals asUintN when result is in [0, 2^(bits-1)-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, Utils.biInt(100)).toString()).assertEqual(
        BigInt.asUintN(8, Utils.biInt(100)).toString());
      expect(BigInt.asIntN(8, Utils.biInt(0)).toString()).assertEqual(
        BigInt.asUintN(8, Utils.biInt(0)).toString());
      expect(BigInt.asIntN(8, Utils.biInt(127)).toString()).assertEqual(
        BigInt.asUintN(8, Utils.biInt(127)).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_2400
     * @tc.name testBigIntAsIntN2Test024
     * @tc.desc Verify asIntN = asUintN - 2^bits when result is in [2^(bits-1), 2^bits-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uintVal = BigInt.asUintN(8, Utils.biInt(200));
      const intVal = BigInt.asIntN(8, Utils.biInt(200));
      const diff = uintVal.operatorSubtract(BigInt(256));
      expect(intVal.equals(diff)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASINTN_2500
     * @tc.name testBigIntAsIntN2Test025
     * @tc.desc Verify non-integer Number/NaN/Infinity throws ClassCastError for BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt.asIntN(8, 1.5 as Object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt.asIntN(8, NaN as Object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt.asIntN(8, Infinity as Object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt.asIntN(8, -Infinity as Object as BigInt);
      }).assertThrowError('ClassCastError');
    });
  });
}
