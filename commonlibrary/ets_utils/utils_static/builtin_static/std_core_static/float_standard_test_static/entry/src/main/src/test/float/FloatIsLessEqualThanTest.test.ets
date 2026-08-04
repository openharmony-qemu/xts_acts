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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function FloatIsLessEqualThanTest(): void {
  describe('FloatIsLessEqualThanTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0100
     * @tc.name testIsLessEqualThan001
     * @tc.desc Verify isLessEqualThan with 1 parameter returns true when lhs <= rhs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l1: Float = new Float(2.0f);
      let r1: Float = new Float(3.0f);
      let result: boolean = l1.isLessEqualThan(r1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0200
     * @tc.name testIsLessEqualThan002
     * @tc.desc Verify isLessEqualThan with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(2.0f);
      try {
        (f.isLessEqualThan as Object as () => boolean)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0300
     * @tc.name testIsLessEqualThan003
     * @tc.desc Verify isLessEqualThan succeeds with correct return value when called with extra parameters via cast (extra args silently ignored by ArkTS runtime)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS silently ignores extra arguments; the method call succeeds with correct return value.
      let f: Float = new Float(2.0f);
      const result: boolean =
        (f.isLessEqualThan as Object as (a: Float, b: Float) => boolean)(new Float(1.0f), new Float(2.0f));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0400
     * @tc.name testIsLessEqualThan004
     * @tc.desc Verify isLessEqualThan returns true when positive value is less than other positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l2: Float = new Float(1.0f);
      let r2: Float = new Float(2.0f);
      let result: boolean = l2.isLessEqualThan(r2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0500
     * @tc.name testIsLessEqualThan005
     * @tc.desc Verify isLessEqualThan returns true when negative value is less than positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3: Float = new Float(-1.0f);
      let r3: Float = new Float(2.0f);
      let result: boolean = l3.isLessEqualThan(r3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0600
     * @tc.name testIsLessEqualThan006
     * @tc.desc Verify isLessEqualThan returns true when more negative value is less than less negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l4: Float = new Float(-3.0f);
      let r4: Float = new Float(-2.0f);
      let result: boolean = l4.isLessEqualThan(r4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0700
     * @tc.name testIsLessEqualThan007
     * @tc.desc Verify isLessEqualThan returns true when negative value is less than zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l5: Float = new Float(-0.1f);
      let r5: Float = new Float(0.0f);
      let result: boolean = l5.isLessEqualThan(r5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0800
     * @tc.name testIsLessEqualThan008
     * @tc.desc Verify isLessEqualThan returns true when zero is less than positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l6: Float = new Float(0.0f);
      let r6: Float = new Float(1.0f);
      let result: boolean = l6.isLessEqualThan(r6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_0900
     * @tc.name testIsLessEqualThan009
     * @tc.desc Verify isLessEqualThan returns true for equal positive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l7: Float = new Float(2.0f);
      let r7: Float = new Float(2.0f);
      let result: boolean = l7.isLessEqualThan(r7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1000
     * @tc.name testIsLessEqualThan010
     * @tc.desc Verify isLessEqualThan returns true for equal negative values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l8: Float = new Float(-2.0f);
      let r8: Float = new Float(-2.0f);
      let result: boolean = l8.isLessEqualThan(r8);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1100
     * @tc.name testIsLessEqualThan011
     * @tc.desc Verify isLessEqualThan returns true for equal zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l9: Float = new Float(0.0f);
      let r9: Float = new Float(0.0f);
      let result: boolean = l9.isLessEqualThan(r9);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1200
     * @tc.name testIsLessEqualThan012
     * @tc.desc Verify isLessEqualThan returns true for -0.0f vs +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l10: Float = new Float(-0.0f);
      let r10: Float = new Float(0.0f);
      let result: boolean = l10.isLessEqualThan(r10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1300
     * @tc.name testIsLessEqualThan013
     * @tc.desc Verify isLessEqualThan returns true for +0.0f vs -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l11: Float = new Float(0.0f);
      let r11: Float = new Float(-0.0f);
      let result: boolean = l11.isLessEqualThan(r11);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1400
     * @tc.name testIsLessEqualThan014
     * @tc.desc Verify isLessEqualThan returns false when positive value is greater than other positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l12: Float = new Float(2.0f);
      let r12: Float = new Float(1.0f);
      let result: boolean = l12.isLessEqualThan(r12);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1500
     * @tc.name testIsLessEqualThan015
     * @tc.desc Verify isLessEqualThan returns false when positive value is greater than negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l13: Float = new Float(1.0f);
      let r13: Float = new Float(-1.0f);
      let result: boolean = l13.isLessEqualThan(r13);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1600
     * @tc.name testIsLessEqualThan016
     * @tc.desc Verify isLessEqualThan returns false when less negative value compared with more negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l14: Float = new Float(-1.0f);
      let r14: Float = new Float(-2.0f);
      let result: boolean = l14.isLessEqualThan(r14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1700
     * @tc.name testIsLessEqualThan017
     * @tc.desc Verify isLessEqualThan returns false when positive value is greater than zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l15: Float = new Float(1.0f);
      let r15: Float = new Float(0.0f);
      let result: boolean = l15.isLessEqualThan(r15);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1800
     * @tc.name testIsLessEqualThan018
     * @tc.desc Verify isLessEqualThan returns false when current value is NaN and other is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l16: Float = new Float(Float.NaN);
      let r16: Float = new Float(2.0f);
      let result: boolean = l16.isLessEqualThan(r16);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_1900
     * @tc.name testIsLessEqualThan019
     * @tc.desc Verify isLessEqualThan returns false when other value is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l17: Float = new Float(2.0f);
      let r17: Float = new Float(Float.NaN);
      let result: boolean = l17.isLessEqualThan(r17);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2000
     * @tc.name testIsLessEqualThan020
     * @tc.desc Verify isLessEqualThan returns false when both values are NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l18: Float = new Float(Float.NaN);
      let r18: Float = new Float(Float.NaN);
      let result: boolean = l18.isLessEqualThan(r18);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2100
     * @tc.name testIsLessEqualThan021
     * @tc.desc Verify isLessEqualThan returns true for positive infinity vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l19: Float = new Float(Float.POSITIVE_INFINITY);
      let r19: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l19.isLessEqualThan(r19);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2200
     * @tc.name testIsLessEqualThan022
     * @tc.desc Verify isLessEqualThan returns true for finite value vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l20: Float = new Float(2.0f);
      let r20: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l20.isLessEqualThan(r20);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2300
     * @tc.name testIsLessEqualThan023
     * @tc.desc Verify isLessEqualThan returns false for positive infinity vs finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l21: Float = new Float(Float.POSITIVE_INFINITY);
      let r21: Float = new Float(2.0f);
      let result: boolean = l21.isLessEqualThan(r21);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2400
     * @tc.name testIsLessEqualThan024
     * @tc.desc Verify isLessEqualThan returns true for negative infinity vs finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l22: Float = new Float(Float.NEGATIVE_INFINITY);
      let r22: Float = new Float(2.0f);
      let result: boolean = l22.isLessEqualThan(r22);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2500
     * @tc.name testIsLessEqualThan025
     * @tc.desc Verify isLessEqualThan returns true for negative infinity vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l23: Float = new Float(Float.NEGATIVE_INFINITY);
      let r23: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l23.isLessEqualThan(r23);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2600
     * @tc.name testIsLessEqualThan026
     * @tc.desc Verify isLessEqualThan returns true for negative infinity vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l24: Float = new Float(Float.NEGATIVE_INFINITY);
      let r24: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l24.isLessEqualThan(r24);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2700
     * @tc.name testIsLessEqualThan027
     * @tc.desc Verify isLessEqualThan returns false for positive infinity vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l25: Float = new Float(Float.POSITIVE_INFINITY);
      let r25: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l25.isLessEqualThan(r25);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2800
     * @tc.name testIsLessEqualThan028
     * @tc.desc Verify isLessEqualThan returns true for MIN_VALUE vs MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l26: Float = new Float(Float.MIN_VALUE);
      let r26: Float = new Float(Float.MAX_VALUE);
      let result: boolean = l26.isLessEqualThan(r26);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2900
     * @tc.name testIsLessEqualThan029
     * @tc.desc Verify isLessEqualThan returns true for MAX_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l27: Float = new Float(Float.MAX_VALUE);
      let r27: Float = new Float(Float.MAX_VALUE);
      let result: boolean = l27.isLessEqualThan(r27);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_3000
     * @tc.name testIsLessEqualThan030
     * @tc.desc Verify isLessEqualThan returns false for MAX_VALUE vs MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l28: Float = new Float(Float.MAX_VALUE);
      let r28: Float = new Float(Float.MIN_VALUE);
      let result: boolean = l28.isLessEqualThan(r28);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_3100
     * @tc.name testIsLessEqualThan031
     * @tc.desc Verify isLessEqualThan returns false for MIN_VALUE vs 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l29: Float = new Float(Float.MIN_VALUE);
      let r29: Float = new Float(0.0f);
      let result: boolean = l29.isLessEqualThan(r29);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_3200
     * @tc.name testIsLessEqualThan032
     * @tc.desc Verify isLessEqualThan returns true when -MIN_VALUE <= 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l30: Float = new Float(-Float.MIN_VALUE);
      let r30: Float = new Float(0.0f);
      let result: boolean = l30.isLessEqualThan(r30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_3300
     * @tc.name testIsLessEqualThan033
     * @tc.desc Verify isLessEqualThan returns true for less than scenario
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l31: Float = new Float(Float.MIN_VALUE);
      let r31: Float = new Float(Float.MIN_VALUE);
      let result: boolean = l31.isLessEqualThan(r31);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_3400
     * @tc.name testIsLessEqualThan034
     * @tc.desc Verify isLessEqualThan throws when passed null via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isLessEqualThan as Object as (arg: Object | null) => boolean)(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_3500
     * @tc.name testIsLessEqualThan035
     * @tc.desc Verify isLessEqualThan throws when passed string via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isLessEqualThan as Object as (arg: string) => boolean)("2.0");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_3600
     * @tc.name testIsLessEqualThan036
     * @tc.desc Verify isLessEqualThan throws when passed boolean via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsLessEqualThan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isLessEqualThan as Object as (arg: boolean) => boolean)(true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });
  });
}
