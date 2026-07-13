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

export default function FloatIsGreaterThanTest(): void {
  describe('FloatIsGreaterThanTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0100
     * @tc.name testIsGreaterThan001
     * @tc.desc Verify isGreaterThan with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(3.0f);
      try {
        (f.isGreaterThan as Object as () => boolean)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0200
     * @tc.name testIsGreaterThan002
     * @tc.desc Verify isGreaterThan succeeds with correct return value when called with extra parameters via cast (extra args silently ignored by ArkTS runtime)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(3.0f);
      const result: boolean =
        (f.isGreaterThan as Object as (a: Float, b: Float) => boolean)(new Float(2.0f), new Float(1.0f));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0300
     * @tc.name testIsGreaterThan003
     * @tc.desc Verify isGreaterThan with 3 parameters returns expected result (extra args silently ignored)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(3.0f);
      const result: boolean =
        (f.isGreaterThan as Object as (a: Float, b: Float, c: Float) => boolean)(new Float(2.0f), new Float(1.0f),
          new Float(0.0f));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0400
     * @tc.name testIsGreaterThan004
     * @tc.desc Verify isGreaterThan returns true when positive value is greater than smaller positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l2: Float = new Float(3.0f);
      let r2: Float = new Float(2.0f);
      let result: boolean = l2.isGreaterThan(r2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0500
     * @tc.name testIsGreaterThan005
     * @tc.desc Verify isGreaterThan returns true for large positive value vs small positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3: Float = new Float(100.5f);
      let r3: Float = new Float(0.1f);
      let result: boolean = l3.isGreaterThan(r3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0600
     * @tc.name testIsGreaterThan006
     * @tc.desc Verify isGreaterThan returns true for positive value vs zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l4: Float = new Float(0.1f);
      let r4: Float = new Float(0.0f);
      let result: boolean = l4.isGreaterThan(r4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0700
     * @tc.name testIsGreaterThan007
     * @tc.desc Verify isGreaterThan returns true for positive value vs negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l5: Float = new Float(1.0f);
      let r5: Float = new Float(-1.0f);
      let result: boolean = l5.isGreaterThan(r5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0800
     * @tc.name testIsGreaterThan008
     * @tc.desc Verify isGreaterThan returns true for zero vs negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l6: Float = new Float(0.0f);
      let r6: Float = new Float(-0.1f);
      let result: boolean = l6.isGreaterThan(r6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_0900
     * @tc.name testIsGreaterThan009
     * @tc.desc Verify isGreaterThan returns true for less negative value vs more negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l7: Float = new Float(-1.0f);
      let r7: Float = new Float(-2.0f);
      let result: boolean = l7.isGreaterThan(r7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1000
     * @tc.name testIsGreaterThan010
     * @tc.desc Verify isGreaterThan returns true for positive infinity vs finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l8: Float = new Float(Float.POSITIVE_INFINITY);
      let r8: Float = new Float(1.0f);
      let result: boolean = l8.isGreaterThan(r8);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1100
     * @tc.name testIsGreaterThan011
     * @tc.desc Verify isGreaterThan returns true for positive infinity vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l9: Float = new Float(Float.POSITIVE_INFINITY);
      let r9: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l9.isGreaterThan(r9);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1200
     * @tc.name testIsGreaterThan012
     * @tc.desc Verify isGreaterThan returns true for finite positive value vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l10: Float = new Float(1.0f);
      let r10: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l10.isGreaterThan(r10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1300
     * @tc.name testIsGreaterThan013
     * @tc.desc Verify isGreaterThan returns true for MAX_VALUE vs normal value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l11: Float = new Float(Float.MAX_VALUE);
      let r11: Float = new Float(1.0f);
      let result: boolean = l11.isGreaterThan(r11);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1400
     * @tc.name testIsGreaterThan014
     * @tc.desc Verify isGreaterThan returns false when values are equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l12: Float = new Float(2.0f);
      let r12: Float = new Float(2.0f);
      let result: boolean = l12.isGreaterThan(r12);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1500
     * @tc.name testIsGreaterThan015
     * @tc.desc Verify isGreaterThan returns false when current value is less than other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l13: Float = new Float(1.0f);
      let r13: Float = new Float(2.0f);
      let result: boolean = l13.isGreaterThan(r13);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1600
     * @tc.name testIsGreaterThan016
     * @tc.desc Verify isGreaterThan returns false for negative value vs positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l14: Float = new Float(-1.0f);
      let r14: Float = new Float(1.0f);
      let result: boolean = l14.isGreaterThan(r14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1700
     * @tc.name testIsGreaterThan017
     * @tc.desc Verify isGreaterThan returns false for more negative value vs less negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l15: Float = new Float(-2.0f);
      let r15: Float = new Float(-1.0f);
      let result: boolean = l15.isGreaterThan(r15);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1800
     * @tc.name testIsGreaterThan018
     * @tc.desc Verify isGreaterThan returns false for +0.0f vs -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l16: Float = new Float(0.0f);
      let r16: Float = new Float(-0.0f);
      let result: boolean = l16.isGreaterThan(r16);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_1900
     * @tc.name testIsGreaterThan019
     * @tc.desc Verify isGreaterThan returns false for -0.0f vs +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l17: Float = new Float(-0.0f);
      let r17: Float = new Float(0.0f);
      let result: boolean = l17.isGreaterThan(r17);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2000
     * @tc.name testIsGreaterThan020
     * @tc.desc Verify isGreaterThan returns false for negative infinity vs finite negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l18: Float = new Float(Float.NEGATIVE_INFINITY);
      let r18: Float = new Float(-1.0f);
      let result: boolean = l18.isGreaterThan(r18);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2100
     * @tc.name testIsGreaterThan021
     * @tc.desc Verify isGreaterThan returns false for finite positive vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l19: Float = new Float(1.0f);
      let r19: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l19.isGreaterThan(r19);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2200
     * @tc.name testIsGreaterThan022
     * @tc.desc Verify isGreaterThan returns false for negative infinity vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l20: Float = new Float(Float.NEGATIVE_INFINITY);
      let r20: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l20.isGreaterThan(r20);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2300
     * @tc.name testIsGreaterThan023
     * @tc.desc Verify isGreaterThan returns false when value is NaN and other is positive number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l21: Float = new Float(Float.NaN);
      let r21: Float = new Float(1.0f);
      let result: boolean = l21.isGreaterThan(r21);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2400
     * @tc.name testIsGreaterThan024
     * @tc.desc Verify isGreaterThan returns false when positive number is compared with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l22: Float = new Float(1.0f);
      let r22: Float = new Float(Float.NaN);
      let result: boolean = l22.isGreaterThan(r22);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2500
     * @tc.name testIsGreaterThan025
     * @tc.desc Verify isGreaterThan returns false when both values are NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l23: Float = new Float(Float.NaN);
      let r23: Float = new Float(Float.NaN);
      let result: boolean = l23.isGreaterThan(r23);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2600
     * @tc.name testIsGreaterThan026
     * @tc.desc Verify isGreaterThan returns false when NaN is compared with positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l24: Float = new Float(Float.NaN);
      let r24: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l24.isGreaterThan(r24);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2700
     * @tc.name testIsGreaterThan027
     * @tc.desc Verify isGreaterThan returns false when NaN is compared with negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l25: Float = new Float(Float.NaN);
      let r25: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l25.isGreaterThan(r25);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2800
     * @tc.name testIsGreaterThan028
     * @tc.desc Verify isGreaterThan returns false when positive infinity is compared with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l26: Float = new Float(Float.POSITIVE_INFINITY);
      let r26: Float = new Float(Float.NaN);
      let result: boolean = l26.isGreaterThan(r26);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2900
     * @tc.name testIsGreaterThan029
     * @tc.desc Verify isGreaterThan returns false when negative infinity is compared with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l27: Float = new Float(Float.NEGATIVE_INFINITY);
      let r27: Float = new Float(Float.NaN);
      let result: boolean = l27.isGreaterThan(r27);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3000
     * @tc.name testIsGreaterThan030
     * @tc.desc Verify isGreaterThan returns true for MIN_VALUE vs 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l28: Float = new Float(Float.MIN_VALUE);
      let r28: Float = new Float(0.0f);
      let result: boolean = l28.isGreaterThan(r28);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3100
     * @tc.name testIsGreaterThan031
     * @tc.desc Verify isGreaterThan returns false for MAX_VALUE vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l29: Float = new Float(Float.MAX_VALUE);
      let r29: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l29.isGreaterThan(r29);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3200
     * @tc.name testIsGreaterThan032
     * @tc.desc Verify isGreaterThan returns true for MIN_VALUE vs -MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l30: Float = new Float(Float.MIN_VALUE);
      let r30: Float = new Float(-Float.MAX_VALUE);
      let result: boolean = l30.isGreaterThan(r30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3300
     * @tc.name testIsGreaterThan033
     * @tc.desc Verify isGreaterThan result for MAX_VALUE vs MAX_VALUE - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l31: Float = new Float(Float.MAX_VALUE);
      let r31: Float = new Float(Float.MAX_VALUE / 2.0f);
      let result: boolean = l31.isGreaterThan(r31);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3400
     * @tc.name testIsGreaterThan034
     * @tc.desc Verify isGreaterThan returns false for +0.0f vs +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l32: Float = new Float(0.0f);
      let r32: Float = new Float(0.0f);
      let result: boolean = l32.isGreaterThan(r32);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3500
     * @tc.name testIsGreaterThan035
     * @tc.desc Verify isGreaterThan returns false for -0.0f vs -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l33: Float = new Float(-0.0f);
      let r33: Float = new Float(-0.0f);
      let result: boolean = l33.isGreaterThan(r33);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3600
     * @tc.name testIsGreaterThan036
     * @tc.desc Verify isGreaterThan returns false for positive infinity vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l34: Float = new Float(Float.POSITIVE_INFINITY);
      let r34: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = l34.isGreaterThan(r34);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3700
     * @tc.name testIsGreaterThan037
     * @tc.desc Verify isGreaterThan returns false for negative infinity vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l35: Float = new Float(Float.NEGATIVE_INFINITY);
      let r35: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = l35.isGreaterThan(r35);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3800
     * @tc.name testIsGreaterThan038
     * @tc.desc Verify isGreaterThan returns false when lhs is less than rhs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l37: Float = new Float(1.0f);
      let r37: Float = new Float(2.0f);
      let result: boolean = l37.isGreaterThan(r37);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_3900
     * @tc.name testIsGreaterThan039
     * @tc.desc Verify isGreaterThan throws when passed null via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isGreaterThan as Object as (arg: Object | null) => boolean)(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_4000
     * @tc.name testIsGreaterThan040
     * @tc.desc Verify isGreaterThan throws when passed string via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isGreaterThan as Object as (arg: string) => boolean)("2.0");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_4100
     * @tc.name testIsGreaterThan041
     * @tc.desc Verify isGreaterThan throws when passed boolean via cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsGreaterThan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      try {
        (f.isGreaterThan as Object as (arg: boolean) => boolean)(true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });
  });
}
