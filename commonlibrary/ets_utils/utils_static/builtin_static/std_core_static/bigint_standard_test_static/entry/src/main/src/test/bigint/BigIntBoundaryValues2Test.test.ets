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
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';

export default function BigIntBoundaryValues2Test(): void {
  describe('testBigIntBoundaryValues2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_1200
     * @tc.name testBigIntBoundaryValues2Test012
     * @tc.desc Verify fromULong full boundary coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = BigInt.fromULong(0);
      const longMaxVal = BigInt.fromULong(BigInt('9223372036854775807').getULong());
      const halfMax = BigInt.fromULong(BigInt('9223372036854775808').getULong());

      expect(zero.equals(BigInt(0))).assertTrue();
      expect(longMaxVal.equals(BigInt('9223372036854775807'))).assertTrue();
      expect(halfMax.equals(BigInt('9223372036854775808'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_1300
     * @tc.name testBigIntBoundaryValues2Test013
     * @tc.desc Verify BigInt construction from Number at safe integer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(9007199254740991).equals(BigInt('9007199254740991'))).assertTrue();
      expect(BigInt(9007199254740992).equals(BigInt('9007199254740992'))).assertTrue();
      expect(BigInt(9007199254740991.0).equals(BigInt('9007199254740991'))).assertTrue();
      expect(BigInt(9007199254740991.5).equals(BigInt('9007199254740992'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_1400
     * @tc.name testBigIntBoundaryValues2Test014
     * @tc.desc Verify multi-base string construction at 64-bit boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('0x7FFFFFFFFFFFFFFF').equals(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('0xFFFFFFFFFFFFFFFF').equals(BigInt('18446744073709551615'))).assertTrue();
      expect(BigInt('0b1111111111111111111111111111111111111111111111111111111111111111')
        .equals(BigInt('18446744073709551615'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_1500
     * @tc.name testBigIntBoundaryValues2Test015
     * @tc.desc Verify pow at 63/64-bit boundaries yields longMax and ulongMax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const two = BigInt(2);
      const pow63 = two.pow(BigInt(63));
      const pow64 = two.pow(BigInt(64));

      expect(pow63.operatorSubtract(BigInt(1)).equals(BigInt('9223372036854775807'))).assertTrue();
      expect(pow64.operatorSubtract(BigInt(1)).equals(BigInt('18446744073709551615'))).assertTrue();
      expect(BigInt('9223372036854775807').pow(BigInt(2)).operatorGreaterThan(pow63)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_1600
     * @tc.name testBigIntBoundaryValues2Test016
     * @tc.desc Verify asIntN(64) and asUintN(64) round-trip consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negOne = BigInt(-1);
      const ulongMaxVal = BigInt('18446744073709551615');
      const longMin = BigInt('-9223372036854775808');

      expect(BigInt.asIntN(64, BigInt.asUintN(64, negOne)).equals(negOne)).assertTrue();
      expect(BigInt.asIntN(64, BigInt.asUintN(64, ulongMaxVal)).equals(negOne)).assertTrue();
      expect(BigInt.asUintN(64, BigInt.asIntN(64, ulongMaxVal)).equals(ulongMaxVal)).assertTrue();
      expect(BigInt.asUintN(64, BigInt.asIntN(64, longMin)).equals(BigInt('9223372036854775808'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_1700
     * @tc.name testBigIntBoundaryValues2Test017
     * @tc.desc Verify multi-base toString and reconstruction round-trip at extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMax = BigInt('9223372036854775807');
      const ulongMaxVal = BigInt('18446744073709551615');

      const hexLongMax: string = '0x' + longMax.toString(16);
      const hexUlongMax: string = '0x' + ulongMaxVal.toString(16);
      const binLongMax: string = '0b' + longMax.toString(2);

      expect(BigInt(hexLongMax).equals(longMax)).assertTrue();
      expect(BigInt(hexUlongMax).equals(ulongMaxVal)).assertTrue();
      expect(BigInt(binLongMax).equals(longMax)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_1800
     * @tc.name testBigIntBoundaryValues2Test018
     * @tc.desc Verify cross-boundary increment/decrement stability after 1000 iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMax = BigInt('9223372036854775807');
      const longMin = BigInt('-9223372036854775808');

      let accPos = longMax;
      for (let i: int = 0; i < 1000; i++) {
        accPos = accPos.operatorIncrement();
      }
      for (let i: int = 0; i < 1000; i++) {
        accPos = accPos.operatorDecrement();
      }
      expect(accPos.equals(longMax)).assertTrue();

      let accNeg = longMin;
      for (let i: int = 0; i < 1000; i++) {
        accNeg = accNeg.operatorDecrement();
      }
      for (let i: int = 0; i < 1000; i++) {
        accNeg = accNeg.operatorIncrement();
      }
      expect(accNeg.equals(longMin)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_1900
     * @tc.name testBigIntBoundaryValues2Test019
     * @tc.desc Verify operations near the 128-bit boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ulongMaxVal = BigInt('18446744073709551615');
      const two = BigInt(2);
      const twoPow64 = two.pow(BigInt(64));

      expect(ulongMaxVal.operatorAdd(BigInt(1)).equals(twoPow64)).assertTrue();
      expect(two.pow(BigInt(127)).operatorSubtract(BigInt(1)).operatorAdd(BigInt(1))
        .equals(two.pow(BigInt(127)))).assertTrue();
      expect(two.pow(BigInt(127)).operatorRightShift(BigInt(126)).equals(two)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_2000
     * @tc.name testBigIntBoundaryValues2Test020
     * @tc.desc Verify multi-carry multiplication across and within signed long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ulongMaxVal = BigInt('18446744073709551615');
      const longMin = BigInt('-9223372036854775808');
      const two = BigInt(2);

      const prod = ulongMaxVal.operatorMultiply(ulongMaxVal);
      expect(longMin.operatorMultiply(longMin).equals(two.pow(BigInt(126)))).assertTrue();
      expect(prod.operatorRightShift(BigInt(127)).equals(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_2100
     * @tc.name testBigIntBoundaryValues2Test021
     * @tc.desc Verify illegal string construction near boundary values throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt('9223372036854775807.5');
      }).assertThrow("Can't convert number 9223372036854775807.5 to BigInt because it's not an integer");
      expect((): void => {
        BigInt('x9223372036854775807');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
      expect((): void => {
        BigInt('0xGHIK');
      }).assertThrow('BigInt.parseFromString(): provided string is invalid');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BOUNDARY_VALUE_2200
     * @tc.name testBigIntBoundaryValues2Test022
     * @tc.desc Verify getULong fromULong round-trip consistency at boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValues2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = BigInt(0);
      const longMax = BigInt('9223372036854775807');
      const ulongMaxVal = BigInt('18446744073709551615');

      expect(BigInt.fromULong(zero.getULong()).equals(zero)).assertTrue();
      expect(BigInt.fromULong(longMax.getULong()).equals(longMax)).assertTrue();
      expect(BigInt.fromULong(ulongMaxVal.getULong()).equals(ulongMaxVal)).assertTrue();
    });

  });
}
