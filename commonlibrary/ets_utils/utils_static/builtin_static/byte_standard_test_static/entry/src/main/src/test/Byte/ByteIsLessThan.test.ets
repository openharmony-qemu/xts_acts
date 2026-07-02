'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ByteIsLessThanTest06_01test(): void {
  describe("ByteIsLessThanTest06_01", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0100
     * @tc.name      testByteIsLessThan0001
     * @tc.desc      Verify isLessThan returns true when comparing smaller positive byte value (30) to larger positive byte value (50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0200
     * @tc.name      testByteIsLessThanNullParameter
     * @tc.desc      Verify isLessThan throws ClassCastError when parameter is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThanNullParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let hasError: boolean = false;
        try {
          b1.isLessThan(null as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0300
     * @tc.name      testByteIsLessThanUndefinedParameter
     * @tc.desc      Verify isLessThan throws ClassCastError when parameter is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThanUndefinedParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let hasError: boolean = false;
        try {
          b1.isLessThan(undefined as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0400
     * @tc.name      testByteIsLessThanNullCaller
     * @tc.desc      Verify isLessThan throws ClassCastError when calling on null object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThanNullCaller", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          let b = null as byte;
          b.isLessThan(50 as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0500
     * @tc.name      testByteIsLessThanUndefinedCaller
     * @tc.desc      Verify isLessThan throws ClassCastError when calling on undefined object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThanUndefinedCaller", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          let b = undefined as byte;
          b.isLessThan(50 as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0600
     * @tc.name      testByteIsLessThanBooleanCast
     * @tc.desc      Verify isLessThan handles boolean cast: either throws ClassCastError or returns valid bool result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThanBooleanCast", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let hasError: boolean = false;
        let result: boolean = false;
        try {
          result = b1.isLessThan(true as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError || !result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0700
     * @tc.name      testByteIsLessThanInvalidObjectCast
     * @tc.desc      Verify isLessThan does not throw when invalid object is cast to byte at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThanInvalidObjectCast", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          let b = {} as byte;
          b.isLessThan(50 as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0800
     * @tc.name      testByteIsLessThanBidirectionalComparison
     * @tc.desc      Verify isLessThan bidirectional comparison: smaller (40) < larger (60) returns true, reverse returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanBidirectionalComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 40 as byte;
        let b2: byte = 60 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0900
     * @tc.name      testByteIsLessThanEqualValues
     * @tc.desc      Verify isLessThan returns false when comparing equal byte values (50 and 50) in both directions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanEqualValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1000
     * @tc.name      testByteIsLessThanMinVsZero
     * @tc.desc      Verify isLessThan compares minimum value (-128) to zero (0): -128 < 0 returns true, 0 < -128 returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanMinVsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -128 as byte;
        let b2: byte = 0 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1100
     * @tc.name      testByteIsLessThanMaxVsAdjacent
     * @tc.desc      Verify isLessThan compares maximum value (127) to (126): 127 < 126 returns false, 126 < 127 returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanMaxVsAdjacent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 127 as byte;
        let b2: byte = 126 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1200
     * @tc.name      testByteIsLessThanReturnTypeBoolean
     * @tc.desc      Verify isLessThan return type is boolean and 30 < 50 returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanReturnTypeBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        let result: boolean = b1.isLessThan(b2);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1300
     * @tc.name      testByteIsLessThanNegativeVsPositive
     * @tc.desc      Verify isLessThan returns true when comparing negative (-50) to positive (20)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanNegativeVsPositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = 20 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1400
     * @tc.name      testByteIsLessThanPositiveVsNegative
     * @tc.desc      Verify isLessThan returns false when comparing positive (20) to negative (-50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanPositiveVsNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 20 as byte;
        let b2: byte = -50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1500
     * @tc.name      testByteIsLessThanMinVsMax
     * @tc.desc      Verify isLessThan compares minimum (-128) to maximum (127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanMinVsMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -128 as byte;
        let b2: byte = 127 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1600
     * @tc.name      testByteIsLessThanZeroEqual
     * @tc.desc      Verify isLessThan returns false in both directions when comparing zero values (0 and 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanZeroEqual', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 0 as byte;
        let b2: byte = 0 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1700
     * @tc.name      testByteIsLessThanByteObjectComparison
     * @tc.desc      Verify isLessThan compares zero, positive (50), and negative (-30) Byte objects correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThanByteObjectComparison", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bZero: Byte = new Byte(0 as byte);
        let bPos: Byte = new Byte(50 as byte);
        let bNeg: Byte = new Byte(-30 as byte);
        expect(bZero.isLessThan(bPos)).assertTrue();
        expect(bZero.isLessThan(bNeg)).assertFalse();
        expect(bPos.isLessThan(bZero)).assertFalse();
        expect(bNeg.isLessThan(bZero)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1800
     * @tc.name      testByteIsLessThanByteObjectBoundary
     * @tc.desc      Verify isLessThan compares Byte objects with min, zero, and max values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThanByteObjectBoundary", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMax: Byte = new Byte(Byte.MAX_VALUE as byte);
        let bMin: Byte = new Byte(Byte.MIN_VALUE as byte);
        let bMid: Byte = new Byte(0 as byte);
        expect(bMin.isLessThan(bMax)).assertTrue();
        expect(bMid.isLessThan(bMax)).assertTrue();
        expect(bMax.isLessThan(bMin)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1900
     * @tc.name      testByteIsLessThanTransitivityPositive
     * @tc.desc      Verify isLessThan transitivity with three positive values (10, 30, 50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanTransitivityPositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 30 as byte;
        let b3: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b3)).assertTrue();
        expect(b1.isLessThan(b3)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2000
     * @tc.name      testByteIsLessThanTransitivityNegative
     * @tc.desc      Verify isLessThan transitivity with three negative values (-70, -50, -30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanTransitivityNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -70 as byte;
        let b2: byte = -50 as byte;
        let b3: byte = -30 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b3)).assertTrue();
        expect(b1.isLessThan(b3)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2100
     * @tc.name      testByteIsLessThanTransitivityBoundary
     * @tc.desc      Verify isLessThan transitivity with minimum, zero, and maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanTransitivityBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 0, 127];
        let bMin: byte = Int.toByte(testValues[0]);
        let bMid: byte = Int.toByte(testValues[1]);
        let bMax: byte = Int.toByte(testValues[2]);
        expect(bMin.isLessThan(bMid)).assertTrue();
        expect(bMid.isLessThan(bMax)).assertTrue();
        expect(bMin.isLessThan(bMax)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2200
     * @tc.name      testByteIsLessThanAdjacentMinBoundary
     * @tc.desc      Verify isLessThan compares minimum (-128) with next value (-127) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanAdjacentMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -127];
        let bMin: byte = Int.toByte(testValues[0]);
        let bNext: byte = Int.toByte(testValues[1]);
        expect(bMin.isLessThan(bNext)).assertTrue();
        expect(bNext.isLessThan(bMin)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2300
     * @tc.name      testByteIsLessThanAdjacentMaxBoundary
     * @tc.desc      Verify isLessThan compares (126) with maximum value (127) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanAdjacentMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [126, 127];
        let bPrev: byte = Int.toByte(testValues[0]);
        let bMax: byte = Int.toByte(testValues[1]);
        expect(bPrev.isLessThan(bMax)).assertTrue();
        expect(bMax.isLessThan(bPrev)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2400
     * @tc.name      testByteIsLessThanSelfComparison
     * @tc.desc      Verify isLessThan returns false when comparing value (55) with itself
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanSelfComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 55 as byte;
        expect(b.isLessThan(b)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2500
     * @tc.name      testByteIsLessThanMinSelfComparison
     * @tc.desc      Verify isLessThan returns false in both directions when comparing minimum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanMinSelfComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Byte.MIN_VALUE as byte;
        let b2: byte = Byte.MIN_VALUE as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2600
     * @tc.name      testByteIsLessThanMaxSelfComparison
     * @tc.desc      Verify isLessThan returns false in both directions when comparing maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanMaxSelfComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Byte.MAX_VALUE as byte;
        let b2: byte = Byte.MAX_VALUE as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2700
     * @tc.name      testByteIsLessThanNegativeComparison
     * @tc.desc      Verify isLessThan compares negative values (-50, -30) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanNegativeComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = -30 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2800
     * @tc.name      testByteIsLessThanCompareToConsistency
     * @tc.desc      Verify isLessThan and compareTo consistency with positive values (30,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanCompareToConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b1.compareTo(b2) < 0).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2900
     * @tc.name      testByteIsLessThanCompareToEqualConsistency
     * @tc.desc      Verify isLessThan and compareTo consistency with equal values (50,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanCompareToEqualConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.compareTo(b2) === 0).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
        expect(b2.compareTo(b1) === 0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3000
     * @tc.name      testByteIsLessThanIsGreaterThanDuality
     * @tc.desc      Verify isLessThan and isGreaterThan consistency with positive values (30,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanIsGreaterThanDuality', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b2.isGreaterThan(b1));
        expect(b1.isGreaterThan(b2)).assertEqual(b2.isLessThan(b1));
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3100
     * @tc.name      testByteIsLessThanIsLessEqualThanConsistency
     * @tc.desc      Verify isLessThan and isLessEqualThan consistency with equal values (50,50) and negative (-50,-50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanIsLessEqualThanConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.isLessEqualThan(b2)).assertTrue();
        let b3: byte = -50 as byte;
        let b4: byte = -50 as byte;
        expect(b3.isLessThan(b4)).assertFalse();
        expect(b3.isLessEqualThan(b4)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3200
     * @tc.name      testByteIsLessThanNativeOperatorConsistency
     * @tc.desc      Verify isLessThan and native operator consistency with positive values (30,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanNativeOperatorConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        let result1: boolean = b1.isLessThan(b2);
        let result2: boolean = b2.isLessThan(b1);
        expect(result1).assertEqual(b1 < b2);
        expect(result2).assertEqual(b2 < b1);
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3300
     * @tc.name      testByteIsLessThanSortWithIsLessThan
     * @tc.desc      Verify isLessThan can be used for sorting byte arrays correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanSortWithIsLessThan', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          50 as byte,
          20 as byte,
          80 as byte,
          10 as byte
        ];
        bytes.sort((a, b) => {
          if (a.isLessThan(b)) {
            return -1;
          }
          if (a.isGreaterThan(b)) {
            return 1;
          }
          return 0;
        });
        expect(bytes[0]).assertEqual(10);
        expect(bytes[3]).assertEqual(80);
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3400
     * @tc.name      testByteIsLessThanMethodExistence
     * @tc.desc      Verify all comparison methods exist on byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanMethodExistence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        expect(b.isLessThan(100 as byte)).assertTrue();
        expect(b.isLessEqualThan(100 as byte)).assertTrue();
        expect(b.isGreaterThan(10 as byte)).assertTrue();
        expect(b.isGreaterEqualThan(10 as byte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3500
     * @tc.name      testByteIsLessThanMethodExistenceBoundary
     * @tc.desc      Verify all comparison methods work on minimum and maximum byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanMethodExistenceBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMin: byte = Byte.MIN_VALUE as byte;
        let bMax: byte = Byte.MAX_VALUE as byte;
        expect(bMin.isLessThan(bMax)).assertTrue();
        expect(bMin.isLessEqualThan(bMax)).assertTrue();
        expect(bMax.isGreaterThan(bMin)).assertTrue();
        expect(bMax.isGreaterEqualThan(bMin)).assertTrue();
        expect(bMax.isLessThan(bMin)).assertFalse();
        expect(bMax.isLessEqualThan(bMin)).assertFalse();
        expect(bMin.isGreaterThan(bMax)).assertFalse();
        expect(bMin.isGreaterEqualThan(bMax)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3600
     * @tc.name      testByteIsLessThanRangeCheck
     * @tc.desc      Verify isLessThan and isGreaterThan range check with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThanRangeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let bLower: byte = 20 as byte;
        let bUpper: byte = 80 as byte;
        let inRange: boolean = b.isGreaterThan(bLower) && b.isLessThan(bUpper);
        expect(inRange).assertTrue();
      });

  })
}