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
  describe('testBigIntAsUintN2Test', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_1300
     * @tc.name testBigIntAsUintN2Test013
     * @tc.desc Verify asUintN propagates BigInt construction error when non-numeric string is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt.asUintN(8, BigInt('abc'));
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt.asUintN(8, BigInt('123.4'));
      }).assertThrow("Can't convert number 123.4 to BigInt because it's not an integer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_1400
     * @tc.name testBigIntAsUintN2Test014
     * @tc.desc Verify asUintN works when num is constructed from Number via BigInt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt(0)).toString()).assertEqual('0');
      expect(BigInt.asUintN(8, BigInt(-128)).toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_1500
     * @tc.name testBigIntAsUintN2Test015
     * @tc.desc Verify asUintN works when num is constructed from decimal string via BigInt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt('255')).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, BigInt('-1')).toString()).assertEqual('255');
      expect(BigInt.asUintN(16, BigInt('65535')).toString()).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_1600
     * @tc.name testBigIntAsUintN2Test016
     * @tc.desc Verify asUintN works when num is constructed from boolean via BigInt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt(true)).toString()).assertEqual('1');
      expect(BigInt.asUintN(8, BigInt(false)).toString()).assertEqual('0');
      expect(BigInt.asUintN(1, BigInt(true)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, BigInt(false)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_1700
     * @tc.name testBigIntAsUintN2Test017
     * @tc.desc Verify 16-bit asUintN truncates negative inputs to unsigned equivalents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(16, Utils.biInt(-32768)).toString()).assertEqual('32768');
      expect(BigInt.asUintN(16, Utils.biInt(-32769)).toString()).assertEqual('32767');
      expect(BigInt.asUintN(16, Utils.biInt(-128)).toString()).assertEqual('65408');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_1800
     * @tc.name testBigIntAsUintN2Test018
     * @tc.desc Verify 32-bit asUintN at signed int boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(32, Utils.biInt(2147483647)).toString()).assertEqual('2147483647');
      expect(BigInt.asUintN(32, BigInt(-2147483648)).toString()).assertEqual('2147483648');
      expect(BigInt.asUintN(32, Utils.biInt(-1)).toString()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_1900
     * @tc.name testBigIntAsUintN2Test019
     * @tc.desc Verify 8-bit asUintN multi-cycle overflow wraps correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, Utils.biInt(896)).toString()).assertEqual('128');
      expect(BigInt.asUintN(8, Utils.biInt(-641)).toString()).assertEqual('127');
      expect(BigInt.asUintN(8, Utils.biInt(256).operatorAdd(Utils.biInt(42))).toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_2000
     * @tc.name testBigIntAsUintN2Test020
     * @tc.desc Verify 64-bit asUintN with multi-cycle: adding 2^64 yields same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cycle = BigInt('18446744073709551616');
      const base = Utils.biInt(42);
      const result = BigInt.asUintN(64, base.operatorAdd(cycle));
      expect(result.toString()).assertEqual('42');
      const baseNeg = Utils.biInt(-42);
      const resultNeg = BigInt.asUintN(64, baseNeg.operatorSubtract(cycle));
      expect(resultNeg.toString()).assertEqual('18446744073709551574');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_2100
     * @tc.name testBigIntAsUintN2Test021
     * @tc.desc Verify asUintN always returns non-negative results (>= 0n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, Utils.biInt(-1)).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, Utils.biInt(255)).toString()).assertEqual('255');
      expect(BigInt.asUintN(1, Utils.biInt(-1)).toString()).assertEqual('1');
      expect(BigInt.asUintN(32, Utils.biStr('4294967295')).toString()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_2200
     * @tc.name testBigIntAsUintN2Test022
     * @tc.desc Verify asUintN result always in [0, 2^bits-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max8 = BigInt(256);
      const zero = BigInt(0);
      let r = BigInt.asUintN(8, Utils.biInt(-1));
      expect(r.operatorGreaterThanEqual(zero)).assertTrue();
      expect(r.operatorLessThan(max8)).assertTrue();
      r = BigInt.asUintN(8, Utils.biInt(255));
      expect(r.operatorGreaterThanEqual(zero)).assertTrue();
      expect(r.operatorLessThan(max8)).assertTrue();
      const max16 = BigInt(65536);
      r = BigInt.asUintN(16, Utils.biInt(-32768));
      expect(r.operatorGreaterThanEqual(zero)).assertTrue();
      expect(r.operatorLessThan(max16)).assertTrue();
      r = BigInt.asUintN(16, Utils.biInt(32767));
      expect(r.operatorGreaterThanEqual(zero)).assertTrue();
      expect(r.operatorLessThan(max16)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_2300
     * @tc.name testBigIntAsUintN2Test023
     * @tc.desc Verify idempotency at 16-bit and 32-bit widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const once16 = BigInt.asUintN(16, Utils.biInt(12345));
      const twice16 = BigInt.asUintN(16, once16);
      expect(once16.equals(twice16)).assertTrue();
      const once32 = BigInt.asUintN(32, Utils.biStr('4294967295'));
      const twice32 = BigInt.asUintN(32, once32);
      expect(once32.equals(twice32)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_ASUINTN_2400
     * @tc.name testBigIntAsUintN2Test024
     * @tc.desc Verify asUintN truncates out-of-bounds inputs correctly and is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsUintN2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const once16 = BigInt.asUintN(16, Utils.biInt(70000));
      expect(once16.equals(BigInt(4464))).assertTrue();
      const twice16 = BigInt.asUintN(16, once16);
      expect(once16.equals(twice16)).assertTrue();
      const once32 = BigInt.asUintN(32, Utils.biInt(4294967338));
      expect(once32.equals(BigInt(42))).assertTrue();
      const twice32 = BigInt.asUintN(32, once32);
      expect(once32.equals(twice32)).assertTrue();
    });

  });
}
