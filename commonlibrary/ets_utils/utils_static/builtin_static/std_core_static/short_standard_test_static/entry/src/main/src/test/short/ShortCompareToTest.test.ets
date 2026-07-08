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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function shortCompareToTest(): void {
  describe('ShortCompareToTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0100
     * @tc.name testShortCompareTo001
     * @tc.desc Verify compareTo method with smaller current value for negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(3 as short);
      let other: Short = new Short(5 as short);
      let result: int = current.compareTo(other);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0200
     * @tc.name testShortCompareTo002
     * @tc.desc Verify compareTo method with larger current value for positive one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(5 as short);
      let other: Short = new Short(3 as short);
      let result: int = current.compareTo(other);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0300
     * @tc.name testShortCompareTo003
     * @tc.desc Verify compareTo method with equal current and other values for zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short((-1) as short);
      let other: Short = new Short((-1) as short);
      let result: int = current.compareTo(other);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0400
     * @tc.name testShortCompareTo004
     * @tc.desc Verify compareTo method with zero current and positive other for negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(0 as short);
      let other: Short = new Short(100 as short);
      let result: int = current.compareTo(other);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0500
     * @tc.name testShortCompareTo005
     * @tc.desc Verify compareTo method with negative current smaller than negative other for negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short((-10) as short);
      let other: Short = new Short((-5) as short);
      let result: int = current.compareTo(other);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0600
     * @tc.name testShortCompareTo006
     * @tc.desc Verify compareTo idempotency with smaller current value for consistent negative one across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(10 as short);
      let other: Short = new Short(20 as short);
      let first: int = current.compareTo(other);
      let second: int = current.compareTo(other);
      let third: int = current.compareTo(other);
      expect(first).assertEqual(-1);
      expect(second).assertEqual(-1);
      expect(third).assertEqual(-1);
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0700
     * @tc.name testShortCompareTo007
     * @tc.desc Verify compareTo consistency across different Short instances with identical values for equal results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let currentA: Short = new Short(100 as short);
      let currentB: Short = new Short(100 as short);
      let other: Short = new Short(200 as short);
      let resultA: int = currentA.compareTo(other);
      let resultB: int = currentB.compareTo(other);
      expect(resultA).assertEqual(-1);
      expect(resultB).assertEqual(-1);
      expect(resultA).assertEqual(resultB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0800
     * @tc.name testShortCompareTo008
     * @tc.desc Verify compareTo has no side effect on current instance internal value after invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(25 as short);
      let other: Short = new Short(30 as short);
      let beforeValue: int = current.toInt();
      let compareResult: int = current.compareTo(other);
      let afterValue: int = current.toInt();
      expect(compareResult).assertEqual(-1);
      expect(beforeValue).assertEqual(25);
      expect(afterValue).assertEqual(25);
      expect(afterValue).assertEqual(beforeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0900
     * @tc.name testShortCompareTo009
     * @tc.desc Verify compareTo symmetry with two distinct instances for inverse relationship between bidirectional calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Short = new Short(3 as short);
      let b: Short = new Short(8 as short);
      let aToB: int = a.compareTo(b);
      let bToA: int = b.compareTo(a);
      expect(aToB).assertEqual(-1);
      expect(bToA).assertEqual(1);
      expect(aToB).assertEqual(-bToA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1000
     * @tc.name testShortCompareTo010
     * @tc.desc Verify compareTo transitivity with three ascending values for consistent negative one across all ordered pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Short = new Short(1 as short);
      let b: Short = new Short(5 as short);
      let c: Short = new Short(9 as short);
      let aToB: int = a.compareTo(b);
      let bToC: int = b.compareTo(c);
      let aToC: int = a.compareTo(c);
      expect(aToB).assertEqual(-1);
      expect(bToC).assertEqual(-1);
      expect(aToC).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1100
     * @tc.name testShortCompareTo011
     * @tc.desc Verify compareTo with minimum short value against maximum short value for negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let result: int = minValue.compareTo(maxValue);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1200
     * @tc.name testShortCompareTo012
     * @tc.desc Verify compareTo with maximum short value against minimum short value for positive one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let minValue: Short = new Short(Short.MIN_VALUE);
      let result: int = maxValue.compareTo(minValue);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1300
     * @tc.name testShortCompareTo013
     * @tc.desc Verify compareTo with zero and negative zero for equality return of zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zero: Short = new Short(0 as short);
      let negativeZero: Short = new Short((-0) as short);
      let result: int = zero.compareTo(negativeZero);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1400
     * @tc.name testShortCompareTo014
     * @tc.desc Verify compareTo reflexivity with maximum short boundary value for zero return on self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let result: int = maxValue.compareTo(maxValue);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1500
     * @tc.name testShortCompareTo015
     * @tc.desc Verify compareTo reflexivity with minimum short boundary value for zero return on self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      let result: int = minValue.compareTo(minValue);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1600
     * @tc.name testShortCompareTo016
     * @tc.desc Verify compareTo symmetry with positive and negative one values for inverse bidirectional results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positive: Short = new Short(1 as short);
      let negative: Short = new Short((-1) as short);
      let posToNeg: int = positive.compareTo(negative);
      let negToPos: int = negative.compareTo(positive);
      expect(posToNeg).assertEqual(1);
      expect(negToPos).assertEqual(-1);
      expect(posToNeg).assertEqual(-negToPos);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1700
     * @tc.name testShortCompareTo017
     * @tc.desc Verify compareTo with minimum short value against zero for negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      let zero: Short = new Short(0 as short);
      let result: int = minValue.compareTo(zero);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1800
     * @tc.name testShortCompareTo018
     * @tc.desc Verify compareTo with maximum short value against zero for positive one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let zero: Short = new Short(0 as short);
      let result: int = maxValue.compareTo(zero);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1900
     * @tc.name testShortCompareTo019
     * @tc.desc Verify compareTo with maximum adjacent boundary value against maximum value for negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let adjacentMax: Short = new Short(32766 as short);
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let result: int = adjacentMax.compareTo(maxValue);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_2000
     * @tc.name testShortCompareTo020
     * @tc.desc Verify compareTo with minimum adjacent boundary value against minimum value for positive one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let adjacentMin: Short = new Short((-32767) as short);
      let minValue: Short = new Short(Short.MIN_VALUE);
      let result: int = adjacentMin.compareTo(minValue);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_2100
     * @tc.name testShortCompareTo021
     * @tc.desc Verify compareTo method argument runtime cast from null to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(10 as short);
      try {
        current.compareTo(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_2200
     * @tc.name testShortCompareTo022
     * @tc.desc Verify compareTo method argument runtime cast from undefined to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(10 as short);
      try {
        current.compareTo(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
