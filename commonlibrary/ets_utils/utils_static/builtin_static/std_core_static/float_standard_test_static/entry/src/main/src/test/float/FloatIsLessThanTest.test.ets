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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function FloatIsLessThanTest(): void {
  describe('FloatIsLessThanTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0100
     * @tc.name testIsLessThan001
     * @tc.desc Verify isLessThan with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isLessThan as Object as () => boolean)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0200
     * @tc.name testIsLessThan002
     * @tc.desc Verify isLessThan succeeds with correct return value when called with extra parameters via cast (extra args silently ignored by ArkTS runtime)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS silently ignores extra arguments; the method call succeeds with correct return value.
      let f: Float = new Float(1.0f);
      const result: boolean =
        (f.isLessThan as Object as (a: Float, b: Float) => boolean)(new Float(2.0f), new Float(3.0f));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0300
     * @tc.name testIsLessThan003
     * @tc.desc Verify isLessThan returns true when current value is less than other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l2: Float = new Float(1.0f);
      let r2: Float = new Float(2.0f);
      let result: boolean = l2.isLessThan(r2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0400
     * @tc.name testIsLessThan004
     * @tc.desc Verify isLessThan returns false when current value is greater than other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3: Float = new Float(2.0f);
      let r3: Float = new Float(1.0f);
      let result: boolean = l3.isLessThan(r3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0500
     * @tc.name testIsLessThan005
     * @tc.desc Verify isLessThan returns false when current value equals other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l4: Float = new Float(1.0f);
      let r4: Float = new Float(1.0f);
      let result: boolean = l4.isLessThan(r4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0600
     * @tc.name testIsLessThan006
     * @tc.desc Verify isLessThan returns true for negative value less than positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l5: Float = new Float(-1.0f);
      let r5: Float = new Float(1.0f);
      let result: boolean = l5.isLessThan(r5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0700
     * @tc.name testIsLessThan007
     * @tc.desc Verify isLessThan returns true for larger negative value is less than smaller negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l6: Float = new Float(-2.0f);
      let r6: Float = new Float(-1.0f);
      let result: boolean = l6.isLessThan(r6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0800
     * @tc.name testIsLessThan008
     * @tc.desc Verify isLessThan returns false for smaller negative value not less than larger negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l7: Float = new Float(-1.0f);
      let r7: Float = new Float(-2.0f);
      let result: boolean = l7.isLessThan(r7);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_0900
     * @tc.name testIsLessThan009
     * @tc.desc Verify isLessThan returns false for equal negative values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l8: Float = new Float(-1.0f);
      let r8: Float = new Float(-1.0f);
      let result: boolean = l8.isLessThan(r8);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1000
     * @tc.name testIsLessThan010
     * @tc.desc Verify isLessThan returns false for -0.0f vs +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l9: Float = new Float(-0.0f);
      let r9: Float = new Float(0.0f);
      let result: boolean = l9.isLessThan(r9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1100
     * @tc.name testIsLessThan011
     * @tc.desc Verify isLessThan returns false for +0.0f vs -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l10: Float = new Float(0.0f);
      let r10: Float = new Float(-0.0f);
      let result: boolean = l10.isLessThan(r10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1200
     * @tc.name testIsLessThan012
     * @tc.desc Verify isLessThan returns false for MIN_VALUE vs 0.0f (MIN_VALUE is positive)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l11: Float = new Float(Float.MIN_VALUE);
      let r11: Float = new Float(0.0f);
      let result: boolean = l11.isLessThan(r11);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1300
     * @tc.name testIsLessThan013
     * @tc.desc Verify isLessThan returns false for MIN_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l12: Float = new Float(Float.MIN_VALUE);
      let r12: Float = new Float(Float.MIN_VALUE);
      let result: boolean = l12.isLessThan(r12);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1400
     * @tc.name testIsLessThan014
     * @tc.desc Verify isLessThan returns true for -MIN_VALUE vs 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l13: Float = new Float(-Float.MIN_VALUE);
      let r13: Float = new Float(0.0f);
      let result: boolean = l13.isLessThan(r13);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1500
     * @tc.name testIsLessThan015
     * @tc.desc Verify isLessThan returns false for MAX_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l14: Float = new Float(Float.MAX_VALUE);
      let r14: Float = new Float(Float.MAX_VALUE);
      let result: boolean = l14.isLessThan(r14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1600
     * @tc.name testIsLessThan016
     * @tc.desc Verify isLessThan returns true for MAX_VALUE vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l15: Float = new Float(Float.MAX_VALUE);
      let r15: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l15.isLessThan(r15);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1700
     * @tc.name testIsLessThan017
     * @tc.desc Verify isLessThan returns false when NaN is compared with positive number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l16: Float = new Float(Float.NaN);
      let r16: Float = new Float(1.0f);
      let result: boolean = l16.isLessThan(r16);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1800
     * @tc.name testIsLessThan018
     * @tc.desc Verify isLessThan returns false when positive number is compared with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l17: Float = new Float(1.0f);
      let r17: Float = new Float(Float.NaN);
      let result: boolean = l17.isLessThan(r17);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_1900
     * @tc.name testIsLessThan019
     * @tc.desc Verify isLessThan returns false when NaN is compared with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l18: Float = new Float(Float.NaN);
      let r18: Float = new Float(Float.NaN);
      let result: boolean = l18.isLessThan(r18);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2000
     * @tc.name testIsLessThan020
     * @tc.desc Verify isLessThan returns false when NaN is compared with positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l19: Float = new Float(Float.NaN);
      let r19: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l19.isLessThan(r19);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2100
     * @tc.name testIsLessThan021
     * @tc.desc Verify isLessThan returns false when NaN is compared with negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l20: Float = new Float(Float.NaN);
      let r20: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l20.isLessThan(r20);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2200
     * @tc.name testIsLessThan022
     * @tc.desc Verify isLessThan returns false for positive infinity vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l21: Float = new Float(Float.POSITIVE_INFINITY);
      let r21: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l21.isLessThan(r21);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2300
     * @tc.name testIsLessThan023
     * @tc.desc Verify isLessThan returns true for positive number vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l22: Float = new Float(1.0f);
      let r22: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l22.isLessThan(r22);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2400
     * @tc.name testIsLessThan024
     * @tc.desc Verify isLessThan returns false for positive infinity vs positive number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l23: Float = new Float(Float.POSITIVE_INFINITY);
      let r23: Float = new Float(1.0f);
      let result: boolean = l23.isLessThan(r23);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2500
     * @tc.name testIsLessThan025
     * @tc.desc Verify isLessThan returns false for negative infinity vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l24: Float = new Float(Float.NEGATIVE_INFINITY);
      let r24: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l24.isLessThan(r24);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2600
     * @tc.name testIsLessThan026
     * @tc.desc Verify isLessThan returns true for negative infinity vs positive number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l25: Float = new Float(Float.NEGATIVE_INFINITY);
      let r25: Float = new Float(1.0f);
      let result: boolean = l25.isLessThan(r25);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2700
     * @tc.name testIsLessThan027
     * @tc.desc Verify isLessThan returns false for positive number vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l26: Float = new Float(1.0f);
      let r26: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l26.isLessThan(r26);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2800
     * @tc.name testIsLessThan028
     * @tc.desc Verify isLessThan returns true for negative infinity vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l27: Float = new Float(Float.NEGATIVE_INFINITY);
      let r27: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l27.isLessThan(r27);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2900
     * @tc.name testIsLessThan029
     * @tc.desc Verify isLessThan throws when passed null via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isLessThan as Object as (arg: Object | null) => boolean)(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_3000
     * @tc.name testIsLessThan030
     * @tc.desc Verify isLessThan throws when passed string via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isLessThan as Object as (arg: string) => boolean)("2.0");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_3100
     * @tc.name testIsLessThan031
     * @tc.desc Verify isLessThan throws when passed boolean via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isLessThan as Object as (arg: boolean) => boolean)(true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_3200
     * @tc.name testIsLessThan032
     * @tc.desc Verify isLessThan after narrowing Float|null union parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessThan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let other: Float | null = new Float(2.0f);
      let f: Float = new Float(1.0f);
      expect(other !== null).assertTrue();
      let isLessThanResult: boolean = f.isLessThan(other!);
      expect(isLessThanResult).assertTrue();
    });
  });
}
