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

export default function BigIntAsUintN2Test(): void {
  describe('testBigIntAsUintN2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0100
     * @tc.name testBigIntAsUintN2Test0100
     * @tc.desc Verify constructing num from non-numeric string via BigInt() throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt.asUintN(8, BigInt('abc'));
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt.asUintN(8, BigInt('123.4'));
      }).assertThrow("Can't convert number 123.4 to BigInt because it's not an integer");
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0200
     * @tc.name testBigIntAsUintN2Test0200
     * @tc.desc Verify asUintN works when num is constructed from Number via BigInt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt(0)).toString()).assertEqual('0');
      expect(BigInt.asUintN(8, BigInt(-128)).toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0300
     * @tc.name testBigIntAsUintN2Test0300
     * @tc.desc Verify asUintN works when num is constructed from decimal string via BigInt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt('255')).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, BigInt('-1')).toString()).assertEqual('255');
      expect(BigInt.asUintN(16, BigInt('65535')).toString()).assertEqual('65535');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0400
     * @tc.name testBigIntAsUintN2Test0400
     * @tc.desc Verify asUintN works when num is constructed from boolean via BigInt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt(true)).toString()).assertEqual('1');
      expect(BigInt.asUintN(8, BigInt(false)).toString()).assertEqual('0');
      expect(BigInt.asUintN(1, BigInt(true)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, BigInt(false)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0500
     * @tc.name testBigIntAsUintN2Test0500
     * @tc.desc Verify 16-bit asUintN truncates negative inputs to unsigned equivalents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(16, Utils.biInt(-32768)).toString()).assertEqual('32768');
      expect(BigInt.asUintN(16, Utils.biInt(-32769)).toString()).assertEqual('32767');
      expect(BigInt.asUintN(16, Utils.biInt(-128)).toString()).assertEqual('65408');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0600
     * @tc.name testBigIntAsUintN2Test0600
     * @tc.desc Verify 32-bit asUintN at signed int boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(32, Utils.biInt(2147483647)).toString()).assertEqual('2147483647');
      expect(BigInt.asUintN(32, BigInt(-2147483648)).toString()).assertEqual('2147483648');
      expect(BigInt.asUintN(32, Utils.biInt(-1)).toString()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0700
     * @tc.name testBigIntAsUintN2Test0700
     * @tc.desc Verify 8-bit asUintN multi-cycle overflow wraps correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, Utils.biInt(896)).toString()).assertEqual('128');
      expect(BigInt.asUintN(8, Utils.biInt(-641)).toString()).assertEqual('127');
      expect(BigInt.asUintN(8, Utils.biInt(256).operatorAdd(Utils.biInt(42))).toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0800
     * @tc.name testBigIntAsUintN2Test0800
     * @tc.desc Verify 64-bit asUintN with multi-cycle: adding 2^64 yields same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cycle: BigInt = BigInt('18446744073709551616');
      const base: BigInt = Utils.biInt(42);
      const result: BigInt = BigInt.asUintN(64, base.operatorAdd(cycle));
      expect(result.toString()).assertEqual('42');
      const baseNeg: BigInt = Utils.biInt(-42);
      const resultNeg: BigInt = BigInt.asUintN(64, baseNeg.operatorSubtract(cycle));
      expect(resultNeg.toString()).assertEqual('18446744073709551574');
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_0900
     * @tc.name testBigIntAsUintN2Test0900
     * @tc.desc Verify asUintN always returns non-negative results (>= 0n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, Utils.biInt(-1)).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt.asUintN(8, Utils.biInt(255)).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt.asUintN(1, Utils.biInt(-1)).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt.asUintN(32, Utils.biStr('4294967295')).operatorGreaterThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_1000
     * @tc.name testBigIntAsUintN2Test1000
     * @tc.desc Verify asUintN result always in [0, 2^bits-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max8 = BigInt(256);
      expect(BigInt.asUintN(8, Utils.biInt(-1)).operatorLessThan(max8)).assertTrue();
      expect(BigInt.asUintN(8, Utils.biInt(255)).operatorLessThan(max8)).assertTrue();
      const max16 = BigInt(65536);
      expect(BigInt.asUintN(16, Utils.biInt(-32768)).operatorLessThan(max16)).assertTrue();
      expect(BigInt.asUintN(16, Utils.biInt(32767)).operatorLessThan(max16)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_ASUINTN_1100
     * @tc.name testBigIntAsUintN2Test1100
     * @tc.desc Verify idempotency at 16-bit and 32-bit widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const once16: BigInt = BigInt.asUintN(16, Utils.biInt(12345));
      const twice16: BigInt = BigInt.asUintN(16, once16);
      expect(once16.equals(twice16)).assertTrue();
      const once32: BigInt = BigInt.asUintN(32, Utils.biStr('4294967295'));
      const twice32: BigInt = BigInt.asUintN(32, once32);
      expect(once32.equals(twice32)).assertTrue();
    });

  });
}
