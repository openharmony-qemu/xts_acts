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

export default function FloatIsGreaterEqualThanTest(): void {
  describe('FloatIsGreaterEqualThanTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0100
     * @tc.name testIsGreaterEqualThan001
     * @tc.desc Verify isGreaterEqualThan with 1 parameter returns boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l1: Float = new Float(3.0f);
      let r1: Float = new Float(2.0f);
      let result: boolean = l1.isGreaterEqualThan(r1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0200
     * @tc.name testIsGreaterEqualThan002
     * @tc.desc Verify isGreaterEqualThan with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(3.0f);
      try {
        (f.isGreaterEqualThan as Object as () => boolean)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0300
     * @tc.name testIsGreaterEqualThan003
     * @tc.desc Verify isGreaterEqualThan succeeds with correct return value when called with extra parameters via cast (extra args silently ignored by ArkTS runtime)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS silently ignores extra arguments; the method call succeeds with correct return value.
      let f: Float = new Float(3.0f);
      const result: boolean =
        (f.isGreaterEqualThan as Object as (a: Float, b: Float) => boolean)(new Float(1.0f), new Float(2.0f));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0400
     * @tc.name testIsGreaterEqualThan004
     * @tc.desc Verify isGreaterEqualThan returns true when positive value is greater than smaller positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l2: Float = new Float(5.0f);
      let r2: Float = new Float(3.0f);
      let result: boolean = l2.isGreaterEqualThan(r2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0500
     * @tc.name testIsGreaterEqualThan005
     * @tc.desc Verify isGreaterEqualThan returns true when negative value is greater than smaller negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3: Float = new Float(-1.0f);
      let r3: Float = new Float(-5.0f);
      let result: boolean = l3.isGreaterEqualThan(r3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0600
     * @tc.name testIsGreaterEqualThan006
     * @tc.desc Verify isGreaterEqualThan returns true when positive value is greater than negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l4: Float = new Float(3.0f);
      let r4: Float = new Float(-3.0f);
      let result: boolean = l4.isGreaterEqualThan(r4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0700
     * @tc.name testIsGreaterEqualThan007
     * @tc.desc Verify isGreaterEqualThan returns true when larger value is greater than smaller value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l5: Float = new Float(1.0f);
      let r5: Float = new Float(0.5f);
      let result: boolean = l5.isGreaterEqualThan(r5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0800
     * @tc.name testIsGreaterEqualThan008
     * @tc.desc Verify isGreaterEqualThan returns true for equal positive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l6: Float = new Float(3.0f);
      let r6: Float = new Float(3.0f);
      let result: boolean = l6.isGreaterEqualThan(r6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_0900
     * @tc.name testIsGreaterEqualThan009
     * @tc.desc Verify isGreaterEqualThan returns true for equal negative values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l7: Float = new Float(-3.0f);
      let r7: Float = new Float(-3.0f);
      let result: boolean = l7.isGreaterEqualThan(r7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1000
     * @tc.name testIsGreaterEqualThan010
     * @tc.desc Verify isGreaterEqualThan returns true for equal zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l8: Float = new Float(0.0f);
      let r8: Float = new Float(0.0f);
      let result: boolean = l8.isGreaterEqualThan(r8);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1100
     * @tc.name testIsGreaterEqualThan011
     * @tc.desc Verify isGreaterEqualThan returns true for equal floating point precision values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l9: Float = new Float(1.0000001f);
      let r9: Float = new Float(1.0000001f);
      let result: boolean = l9.isGreaterEqualThan(r9);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1200
     * @tc.name testIsGreaterEqualThan012
     * @tc.desc Verify isGreaterEqualThan returns false when positive value is less than larger positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l10: Float = new Float(2.0f);
      let r10: Float = new Float(3.0f);
      let result: boolean = l10.isGreaterEqualThan(r10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1300
     * @tc.name testIsGreaterEqualThan013
     * @tc.desc Verify isGreaterEqualThan returns false when negative value is less than positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l11: Float = new Float(-3.0f);
      let r11: Float = new Float(3.0f);
      let result: boolean = l11.isGreaterEqualThan(r11);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1400
     * @tc.name testIsGreaterEqualThan014
     * @tc.desc Verify isGreaterEqualThan returns false when more negative value is less than less negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l12: Float = new Float(-5.0f);
      let r12: Float = new Float(-1.0f);
      let result: boolean = l12.isGreaterEqualThan(r12);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1500
     * @tc.name testIsGreaterEqualThan015
     * @tc.desc Verify isGreaterEqualThan returns false when smaller value is less than larger value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l13: Float = new Float(0.5f);
      let r13: Float = new Float(1.0f);
      let result: boolean = l13.isGreaterEqualThan(r13);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1600
     * @tc.name testIsGreaterEqualThan016
     * @tc.desc Verify isGreaterEqualThan returns true for +0.0f vs -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l14: Float = new Float(0.0f);
      let r14: Float = new Float(-0.0f);
      let result: boolean = l14.isGreaterEqualThan(r14);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1700
     * @tc.name testIsGreaterEqualThan017
     * @tc.desc Verify isGreaterEqualThan returns true for -0.0f vs +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l15: Float = new Float(-0.0f);
      let r15: Float = new Float(0.0f);
      let result: boolean = l15.isGreaterEqualThan(r15);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1800
     * @tc.name testIsGreaterEqualThan018
     * @tc.desc Verify isGreaterEqualThan returns true for -0.0f vs -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l16: Float = new Float(-0.0f);
      let r16: Float = new Float(-0.0f);
      let result: boolean = l16.isGreaterEqualThan(r16);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_1900
     * @tc.name testIsGreaterEqualThan019
     * @tc.desc Verify isGreaterEqualThan returns false when finite value is compared with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l17: Float = new Float(3.0f);
      let r17: Float = new Float(Float.NaN);
      let result: boolean = l17.isGreaterEqualThan(r17);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2000
     * @tc.name testIsGreaterEqualThan020
     * @tc.desc Verify isGreaterEqualThan returns false when NaN is compared with finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l18: Float = new Float(Float.NaN);
      let r18: Float = new Float(3.0f);
      let result: boolean = l18.isGreaterEqualThan(r18);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2100
     * @tc.name testIsGreaterEqualThan021
     * @tc.desc Verify isGreaterEqualThan returns false when NaN is compared with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l19: Float = new Float(Float.NaN);
      let r19: Float = new Float(Float.NaN);
      let result: boolean = l19.isGreaterEqualThan(r19);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2200
     * @tc.name testIsGreaterEqualThan022
     * @tc.desc Verify isGreaterEqualThan returns true for positive infinity vs finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l20: Float = new Float(Float.POSITIVE_INFINITY);
      let r20: Float = new Float(3.0f);
      let result: boolean = l20.isGreaterEqualThan(r20);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2300
     * @tc.name testIsGreaterEqualThan023
     * @tc.desc Verify isGreaterEqualThan returns false for finite value vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l21: Float = new Float(3.0f);
      let r21: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l21.isGreaterEqualThan(r21);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2400
     * @tc.name testIsGreaterEqualThan024
     * @tc.desc Verify isGreaterEqualThan returns false for negative infinity vs finite negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l22: Float = new Float(Float.NEGATIVE_INFINITY);
      let r22: Float = new Float(-3.0f);
      let result: boolean = l22.isGreaterEqualThan(r22);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2500
     * @tc.name testIsGreaterEqualThan025
     * @tc.desc Verify isGreaterEqualThan returns true for finite negative value vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l23: Float = new Float(-3.0f);
      let r23: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l23.isGreaterEqualThan(r23);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2600
     * @tc.name testIsGreaterEqualThan026
     * @tc.desc Verify isGreaterEqualThan returns true for positive infinity vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l24: Float = new Float(Float.POSITIVE_INFINITY);
      let r24: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l24.isGreaterEqualThan(r24);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2700
     * @tc.name testIsGreaterEqualThan027
     * @tc.desc Verify isGreaterEqualThan returns true for positive infinity vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l25: Float = new Float(Float.POSITIVE_INFINITY);
      let r25: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l25.isGreaterEqualThan(r25);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2800
     * @tc.name testIsGreaterEqualThan028
     * @tc.desc Verify isGreaterEqualThan returns false for negative infinity vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l26: Float = new Float(Float.NEGATIVE_INFINITY);
      let r26: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l26.isGreaterEqualThan(r26);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2900
     * @tc.name testIsGreaterEqualThan029
     * @tc.desc Verify isGreaterEqualThan returns true for negative infinity vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l27: Float = new Float(Float.NEGATIVE_INFINITY);
      let r27: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l27.isGreaterEqualThan(r27);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3000
     * @tc.name testIsGreaterEqualThan030
     * @tc.desc Verify isGreaterEqualThan returns true for MAX_VALUE vs MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l28: Float = new Float(Float.MAX_VALUE);
      let r28: Float = new Float(Float.MIN_VALUE);
      let result: boolean = l28.isGreaterEqualThan(r28);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3100
     * @tc.name testIsGreaterEqualThan031
     * @tc.desc Verify isGreaterEqualThan returns false for MIN_VALUE vs MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l29: Float = new Float(Float.MIN_VALUE);
      let r29: Float = new Float(Float.MAX_VALUE);
      let result: boolean = l29.isGreaterEqualThan(r29);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3200
     * @tc.name testIsGreaterEqualThan032
     * @tc.desc Verify isGreaterEqualThan returns true for MAX_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l30: Float = new Float(Float.MAX_VALUE);
      let r30: Float = new Float(Float.MAX_VALUE);
      let result: boolean = l30.isGreaterEqualThan(r30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3300
     * @tc.name testIsGreaterEqualThan033
     * @tc.desc Verify isGreaterEqualThan returns true for MIN_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l31: Float = new Float(Float.MIN_VALUE);
      let r31: Float = new Float(Float.MIN_VALUE);
      let result: boolean = l31.isGreaterEqualThan(r31);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3400
     * @tc.name testIsGreaterEqualThan034
     * @tc.desc Verify isGreaterEqualThan returns true for MIN_VALUE vs 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l32: Float = new Float(Float.MIN_VALUE);
      let r32: Float = new Float(0.0f);
      let result: boolean = l32.isGreaterEqualThan(r32);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3500
     * @tc.name testIsGreaterEqualThan035
     * @tc.desc Verify isGreaterEqualThan returns true for -MAX_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l33: Float = new Float(-Float.MAX_VALUE);
      let r33: Float = new Float(-Float.MAX_VALUE);
      let result: boolean = l33.isGreaterEqualThan(r33);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3600
     * @tc.name testIsGreaterEqualThan036
     * @tc.desc Verify isGreaterEqualThan returns false when 2.0f is not >= 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l35: Float = new Float(2.0f);
      let r35: Float = new Float(3.0f);
      let result: boolean = l35.isGreaterEqualThan(r35);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3700
     * @tc.name testIsGreaterEqualThan037
     * @tc.desc Verify isGreaterEqualThan throws when passed null via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isGreaterEqualThan as Object as (arg: Object | null) => boolean)(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3800
     * @tc.name testIsGreaterEqualThan038
     * @tc.desc Verify isGreaterEqualThan throws when passed string via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isGreaterEqualThan as Object as (arg: string) => boolean)("2.0");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_3900
     * @tc.name testIsGreaterEqualThan039
     * @tc.desc Verify isGreaterEqualThan throws when passed boolean via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterEqualThan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isGreaterEqualThan as Object as (arg: boolean) => boolean)(true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });
  });
}
