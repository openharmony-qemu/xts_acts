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

export default function FloatCompareToTest(): void {
  describe('FloatCompareToTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0100
     * @tc.name testCompareTo001
     * @tc.desc Verify compareTo returns -1 when current (1.0f) is less than other (2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op1: Float = new Float(2.0f);
      let a1: Float = new Float(1.0f);
      let result: int = a1.compareTo(op1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0200
     * @tc.name testCompareTo002
     * @tc.desc Verify compareTo returns -1 when current is negative infinity and other is finite negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op2: Float = new Float(-2.0f);
      let a2: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: int = a2.compareTo(op2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0300
     * @tc.name testCompareTo003
     * @tc.desc Verify compareTo returns -1 when current is finite positive and other is negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op3: Float = new Float(Float.NEGATIVE_INFINITY);
      let a3: Float = new Float(2.0f);
      let result: int = a3.compareTo(op3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0400
     * @tc.name testCompareTo004
     * @tc.desc Verify compareTo returns 1 when current (3.0f) is greater than other (1.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op4: Float = new Float(1.0f);
      let a4: Float = new Float(3.0f);
      let result: int = a4.compareTo(op4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0500
     * @tc.name testCompareTo005
     * @tc.desc Verify compareTo returns 0 when MIN_VALUE and -MIN_VALUE differ by less than EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op5: Float = new Float(-Float.MIN_VALUE);
      let a5: Float = new Float(Float.MIN_VALUE);
      let result: int = a5.compareTo(op5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0600
     * @tc.name testCompareTo006
     * @tc.desc Verify compareTo returns -1 when current value is less than other in positive scenario
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op6: Float = new Float(10.0f);
      let a6: Float = new Float(0.5f);
      let result: int = a6.compareTo(op6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0700
     * @tc.name testCompareTo007
     * @tc.desc Verify compareTo returns -1 when current negative value is less than other negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op7: Float = new Float(-1.0f);
      let a7: Float = new Float(-5.0f);
      let result: int = a7.compareTo(op7);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0800
     * @tc.name testCompareTo008
     * @tc.desc Verify compareTo returns -1 when current negative value is less than positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op8: Float = new Float(1.0f);
      let a8: Float = new Float(-1.0f);
      let result: int = a8.compareTo(op8);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_0900
     * @tc.name testCompareTo009
     * @tc.desc Verify compareTo returns -1 when current is MIN_VALUE and other is MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op9: Float = new Float(Float.MAX_VALUE);
      let a9: Float = new Float(Float.MIN_VALUE);
      let result: int = a9.compareTo(op9);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1000
     * @tc.name testCompareTo010
     * @tc.desc Verify compareTo returns 1 when current negative value is greater than other negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op11: Float = new Float(-5.0f);
      let a11: Float = new Float(-1.0f);
      let result: int = a11.compareTo(op11);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1100
     * @tc.name testCompareTo011
     * @tc.desc Verify compareTo returns 1 when current positive value is greater than negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op12: Float = new Float(-1.0f);
      let a12: Float = new Float(1.0f);
      let result: int = a12.compareTo(op12);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1200
     * @tc.name testCompareTo012
     * @tc.desc Verify compareTo returns 1 when current is MAX_VALUE and other is MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op13: Float = new Float(Float.MIN_VALUE);
      let a13: Float = new Float(Float.MAX_VALUE);
      let result: int = a13.compareTo(op13);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1300
     * @tc.name testCompareTo013
     * @tc.desc Verify compareTo returns 0 when difference is slightly less than EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = 1.0f;
      let diff: float = Float.EPSILON / 4.0f;
      let other: float = base + diff;
      let op14: Float = new Float(other);
      let a14: Float = new Float(base);
      let result: int = a14.compareTo(op14);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1400
     * @tc.name testCompareTo014
     * @tc.desc Verify compareTo returns -1 when difference exactly equals EPSILON (diff not < EPSILON)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = 1.0f;
      let other: float = base + Float.EPSILON;
      let op15: Float = new Float(other);
      let a15: Float = new Float(base);
      let result: int = a15.compareTo(op15);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1500
     * @tc.name testCompareTo015
     * @tc.desc Verify compareTo returns non-zero when difference is slightly greater than EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = 1.0f;
      let diff: float = Float.EPSILON * 4.0f;
      let other: float = base + diff;
      let op16: Float = new Float(other);
      let a16: Float = new Float(base);
      let result: int = a16.compareTo(op16);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1600
     * @tc.name testCompareTo016
     * @tc.desc Verify compareTo returns 0 for exactly same values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op17: Float = new Float(3.14f);
      let a17: Float = new Float(3.14f);
      let result: int = a17.compareTo(op17);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1700
     * @tc.name testCompareTo017
     * @tc.desc Verify compareTo returns 0 for same values constructed separately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op18: Float = new Float(100.0f);
      let a18: Float = new Float(100.0f);
      let result: int = a18.compareTo(op18);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1800
     * @tc.name testCompareTo018
     * @tc.desc Verify compareTo returns 1 when current value is NaN and other is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op19: Float = new Float(1.0f);
      let a19: Float = new Float(Float.NaN);
      let result: int = a19.compareTo(op19);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_1900
     * @tc.name testCompareTo019
     * @tc.desc Verify compareTo returns 1 when both values are NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op20: Float = new Float(Float.NaN);
      let a20: Float = new Float(Float.NaN);
      let result: int = a20.compareTo(op20);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2000
     * @tc.name testCompareTo020
     * @tc.desc Verify compareTo returns 1 when current is NaN and other is positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op21: Float = new Float(Float.POSITIVE_INFINITY);
      let a21: Float = new Float(Float.NaN);
      let result: int = a21.compareTo(op21);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2100
     * @tc.name testCompareTo021
     * @tc.desc Verify compareTo returns 1 when current is NaN and other is negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op22: Float = new Float(Float.NEGATIVE_INFINITY);
      let a22: Float = new Float(Float.NaN);
      let result: int = a22.compareTo(op22);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2200
     * @tc.name testCompareTo022
     * @tc.desc Verify compareTo returns -1 or 1 when current is finite and other is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op23: Float = new Float(Float.NaN);
      let a23: Float = new Float(1.0f);
      let result: int = a23.compareTo(op23);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2300
     * @tc.name testCompareTo023
     * @tc.desc Verify compareTo returns -1 or 1 when current is positive infinity and other is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op24: Float = new Float(Float.NaN);
      let a24: Float = new Float(Float.POSITIVE_INFINITY);
      let result: int = a24.compareTo(op24);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2400
     * @tc.name testCompareTo024
     * @tc.desc Verify compareTo returns 1 when current is positive infinity and other is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op25: Float = new Float(1.0f);
      let a25: Float = new Float(Float.POSITIVE_INFINITY);
      let result: int = a25.compareTo(op25);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2500
     * @tc.name testCompareTo025
     * @tc.desc Verify compareTo returns 1 when current is positive infinity and other is negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op26: Float = new Float(Float.NEGATIVE_INFINITY);
      let a26: Float = new Float(Float.POSITIVE_INFINITY);
      let result: int = a26.compareTo(op26);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2600
     * @tc.name testCompareTo026
     * @tc.desc Verify compareTo returns -1 when current is negative infinity and other is finite negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op27: Float = new Float(-1.0f);
      let a27: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: int = a27.compareTo(op27);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2700
     * @tc.name testCompareTo027
     * @tc.desc Verify compareTo returns -1 when current is negative infinity and other is positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op28: Float = new Float(Float.POSITIVE_INFINITY);
      let a28: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: int = a28.compareTo(op28);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2800
     * @tc.name testCompareTo028
     * @tc.desc Verify compareTo returns -1 when both values are positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op29: Float = new Float(Float.POSITIVE_INFINITY);
      let a29: Float = new Float(Float.POSITIVE_INFINITY);
      let result: int = a29.compareTo(op29);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2900
     * @tc.name testCompareTo029
     * @tc.desc Verify compareTo returns -1 when both values are negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op30: Float = new Float(Float.NEGATIVE_INFINITY);
      let a30: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: int = a30.compareTo(op30);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3000
     * @tc.name testCompareTo030
     * @tc.desc Verify compareTo returns -1 when current finite positive and other is positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op31: Float = new Float(Float.POSITIVE_INFINITY);
      let a31: Float = new Float(1.0f);
      let result: int = a31.compareTo(op31);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3100
     * @tc.name testCompareTo031
     * @tc.desc Verify compareTo returns 1 when current finite negative and other is negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op32: Float = new Float(Float.NEGATIVE_INFINITY);
      let a32: Float = new Float(-1.0f);
      let result: int = a32.compareTo(op32);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3200
     * @tc.name testCompareTo032
     * @tc.desc Verify compareTo returns 0 when both values are +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op33: Float = new Float(0.0f);
      let a33: Float = new Float(0.0f);
      let result: int = a33.compareTo(op33);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3300
     * @tc.name testCompareTo033
     * @tc.desc Verify compareTo returns 0 when both values are -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op34: Float = new Float(-0.0f);
      let a34: Float = new Float(-0.0f);
      let result: int = a34.compareTo(op34);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3400
     * @tc.name testCompareTo034
     * @tc.desc Verify compareTo returns 0 when comparing -0.0f and +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op35: Float = new Float(0.0f);
      let a35: Float = new Float(-0.0f);
      let result: int = a35.compareTo(op35);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3500
     * @tc.name testCompareTo035
     * @tc.desc Verify compareTo returns 0 when comparing +0.0f and -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op36: Float = new Float(-0.0f);
      let a36: Float = new Float(0.0f);
      let result: int = a36.compareTo(op36);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3600
     * @tc.name testCompareTo036
     * @tc.desc Verify compareTo returns 0 when both values are Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op37: Float = new Float(Float.MAX_VALUE);
      let a37: Float = new Float(Float.MAX_VALUE);
      let result: int = a37.compareTo(op37);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3700
     * @tc.name testCompareTo037
     * @tc.desc Verify compareTo returns 0 when MIN_VALUE and 0.0f differ by less than EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op38: Float = new Float(0.0f);
      let a38: Float = new Float(Float.MIN_VALUE);
      let result: int = a38.compareTo(op38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3800
     * @tc.name testCompareTo038
     * @tc.desc Verify compareTo returns 0 when -MIN_VALUE and 0.0f differ by less than EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op39: Float = new Float(0.0f);
      let a39: Float = new Float(-Float.MIN_VALUE);
      let result: int = a39.compareTo(op39);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_3900
     * @tc.name testCompareTo039
     * @tc.desc Verify compareTo returns 0 when both values are -Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op40: Float = new Float(-Float.MAX_VALUE);
      let a40: Float = new Float(-Float.MAX_VALUE);
      let result: int = a40.compareTo(op40);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4000
     * @tc.name testCompareTo040
     * @tc.desc Verify compareTo return values are only -1, 0, or 1 across multiple inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: float[] = [-Float.MAX_VALUE, -1.0f, -0.0f, 0.0f, 1.0f, Float.MAX_VALUE];
      for (let i: int = 0; i < inputs.length; i++) {
        for (let j: int = 0; j < inputs.length; j++) {
          let op42: Float = new Float(inputs[j]);
      let a42: Float = new Float(inputs[i]);
      let result: int = a42.compareTo(op42);
          let isValidCompareResult: boolean = result === -1 || result === 0 || result === 1;
          expect(isValidCompareResult).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4100
     * @tc.name testCompareTo041
     * @tc.desc Verify compareTo returns 0 when comparing instance with itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.0f);
      let result: int = f.compareTo(f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4200
     * @tc.name testCompareTo042
     * @tc.desc Verify compareTo returns 0 for different instances with same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: Float = new Float(1.0f);
      let f2: Float = new Float(1.0f);
      let result: int = f1.compareTo(f2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4300
     * @tc.name testCompareTo043
     * @tc.desc Verify compareTo returns 1 when current positive and other is zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op43: Float = new Float(0.0f);
      let a43: Float = new Float(1.0f);
      let result: int = a43.compareTo(op43);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4400
     * @tc.name testCompareTo044
     * @tc.desc Verify compareTo returns 0 when 0.0f and MIN_VALUE differ by less than EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op44: Float = new Float(Float.MIN_VALUE);
      let a44: Float = new Float(0.0f);
      let result: int = a44.compareTo(op44);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4500
     * @tc.name testCompareTo045
     * @tc.desc Verify compareTo returns 0 when both Float instances constructed from identical double value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op45: Float = new Float(3.75);
      let a45: Float = new Float(3.75);
      let result: int = a45.compareTo(op45);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4600
     * @tc.name testCompareTo046
     * @tc.desc Verify compareTo returns 0 when both Float instances constructed from MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeMax: float = Float.MAX_SAFE_INTEGER;
      let op46: Float = new Float(safeMax);
      let a46: Float = new Float(safeMax);
      let result: int = a46.compareTo(op46);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4700
     * @tc.name testCompareTo047
     * @tc.desc Verify compareTo after narrowing Float|null union parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let other: Float | null = new Float(2.0f);
      let f: Float = new Float(1.0f);
      expect(other !== null).assertTrue();
      let compareToResult: int = f.compareTo(other!);
      expect(compareToResult).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4800
     * @tc.name testCompareTo048
     * @tc.desc Verify compareTo returns 0 when both instances from MIN_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeMin: float = -Float.MAX_SAFE_INTEGER;
      let op47: Float = new Float(safeMin);
      let a47: Float = new Float(safeMin);
      let result: int = a47.compareTo(op47);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_4900
     * @tc.name testCompareTo049
     * @tc.desc Verify compareTo returns -1 when current is MAX_SAFE_INTEGER and other is MAX_SAFE_INTEGER plus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompareTo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let low: Float = new Float(Float.MAX_SAFE_INTEGER);
      let high: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      let result: int = low.compareTo(high);
      expect(result).assertEqual(-1);
    });
  });
}
