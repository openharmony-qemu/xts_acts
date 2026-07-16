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

export default function FloatEqualsTest(): void {
  describe('FloatEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0100
     * @tc.name testEquals001
     * @tc.desc Verify equals returns true when comparing two Float instances with same value 1.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op1: Float = new Float(1.5f);
      let a1: Float = new Float(1.5f);
      let result: boolean = a1.equals(op1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0200
     * @tc.name testEquals002
     * @tc.desc Verify equals with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      try {
        (f.equals as Object as () => boolean)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0300
     * @tc.name testEquals003
     * @tc.desc Verify equals succeeds with correct return value when called with extra parameters via cast (extra args silently ignored by ArkTS runtime)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS silently ignores extra arguments; the method call succeeds with correct return value.
      let f: Float = new Float(1.5f);
      const result: boolean = (f.equals as Object as (a: Float, b: Float) => boolean)(new Float(1.5f), new Float(2.5f));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0400
     * @tc.name testEquals004
     * @tc.desc Verify equals returns true for Float instances with same positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op2: Float = new Float(3.14f);
      let a2: Float = new Float(3.14f);
      let result: boolean = a2.equals(op2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0500
     * @tc.name testEquals005
     * @tc.desc Verify equals returns true for Float instances with same zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op3: Float = new Float(0.0f);
      let a3: Float = new Float(0.0f);
      let result: boolean = a3.equals(op3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0600
     * @tc.name testEquals006
     * @tc.desc Verify equals returns true for Float instances with same negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op4: Float = new Float(-3.14f);
      let a4: Float = new Float(-3.14f);
      let result: boolean = a4.equals(op4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0700
     * @tc.name testEquals007
     * @tc.desc Verify equals returns false for Float instances with different positive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op5: Float = new Float(2.5f);
      let a5: Float = new Float(1.5f);
      let result: boolean = a5.equals(op5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0800
     * @tc.name testEquals008
     * @tc.desc Verify equals returns false for Float instances with different zero vs non-zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op6: Float = new Float(1.0f);
      let a6: Float = new Float(0.0f);
      let result: boolean = a6.equals(op6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_0900
     * @tc.name testEquals009
     * @tc.desc Verify equals returns false for Float instances with opposite sign values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op7: Float = new Float(-100.0f);
      let a7: Float = new Float(100.0f);
      let result: boolean = a7.equals(op7);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1000
     * @tc.name testEquals010
     * @tc.desc Verify equals returns false when passed null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: boolean = (f.equals as Object as (arg: Object | null) => boolean)(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1100
     * @tc.name testEquals011
     * @tc.desc Verify equals returns false when passed a String
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: boolean = (f.equals as Object as (arg: string) => boolean)("1.5");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1200
     * @tc.name testEquals012
     * @tc.desc Verify equals returns false when passed an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: boolean = (f.equals as Object as (arg: string) => boolean)("");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1300
     * @tc.name testEquals013
     * @tc.desc Verify equals returns true when passed a double via cast (auto-converted to float)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: boolean = (f.equals as Object as (arg: double) => boolean)(1.5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1400
     * @tc.name testEquals014
     * @tc.desc Verify equals returns false when passed a boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: boolean = (f.equals as Object as (arg: boolean) => boolean)(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1500
     * @tc.name testEquals015
     * @tc.desc Verify equals returns true when passed self reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: boolean = f.equals(f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1600
     * @tc.name testEquals016
     * @tc.desc Verify equals returns false for two NaN Float instances (IEEE 754 NaN !== NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op8: Float = new Float(Float.NaN);
      let a8: Float = new Float(Float.NaN);
      let result: boolean = a8.equals(op8);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1700
     * @tc.name testEquals017
     * @tc.desc Verify equals returns true for +0.0f and -0.0f comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op9: Float = new Float(-0.0f);
      let a9: Float = new Float(0.0f);
      let result: boolean = a9.equals(op9);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1800
     * @tc.name testEquals018
     * @tc.desc Verify equals returns true for -0.0f and +0.0f comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op10: Float = new Float(0.0f);
      let a10: Float = new Float(-0.0f);
      let result: boolean = a10.equals(op10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_1900
     * @tc.name testEquals019
     * @tc.desc Verify equals returns true for positive infinity comparisons
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op11: Float = new Float(Float.POSITIVE_INFINITY);
      let a11: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = a11.equals(op11);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2000
     * @tc.name testEquals020
     * @tc.desc Verify equals returns true for negative infinity comparisons
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op12: Float = new Float(Float.NEGATIVE_INFINITY);
      let a12: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: boolean = a12.equals(op12);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2100
     * @tc.name testEquals021
     * @tc.desc Verify equals returns false for positive infinity vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op13: Float = new Float(Float.NEGATIVE_INFINITY);
      let a13: Float = new Float(Float.POSITIVE_INFINITY);
      let result: boolean = a13.equals(op13);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2200
     * @tc.name testEquals022
     * @tc.desc Verify equals returns false for NaN vs finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op14: Float = new Float(1.5f);
      let a14: Float = new Float(Float.NaN);
      let result: boolean = a14.equals(op14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2300
     * @tc.name testEquals023
     * @tc.desc Verify equals returns true for Float.MAX_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op15: Float = new Float(Float.MAX_VALUE);
      let a15: Float = new Float(Float.MAX_VALUE);
      let result: boolean = a15.equals(op15);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2400
     * @tc.name testEquals024
     * @tc.desc Verify equals returns true for Float.MIN_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op16: Float = new Float(Float.MIN_VALUE);
      let a16: Float = new Float(Float.MIN_VALUE);
      let result: boolean = a16.equals(op16);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2500
     * @tc.name testEquals025
     * @tc.desc Verify equals returns false for Float.MAX_VALUE vs Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op17: Float = new Float(Float.MIN_VALUE);
      let a17: Float = new Float(Float.MAX_VALUE);
      let result: boolean = a17.equals(op17);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2600
     * @tc.name testEquals026
     * @tc.desc Verify equals satisfies reflexivity: x.equals(x) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Float = new Float(Float.MAX_VALUE);
      let equalsResult: boolean = x.equals(x);
      expect(equalsResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2700
     * @tc.name testEquals027
     * @tc.desc Verify equals satisfies symmetry: x.equals(y) equals y.equals(x) for same values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Float = new Float(1.5f);
      let y: Float = new Float(1.5f);
      let equalsResult2: boolean = x.equals(y);
      expect(equalsResult2).assertEqual(y.equals(x));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2800
     * @tc.name testEquals028
     * @tc.desc Verify equals satisfies symmetry: x.equals(y) equals y.equals(x) for different values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Float = new Float(1.5f);
      let y: Float = new Float(2.5f);
      let equalsResult3: boolean = x.equals(y);
      expect(equalsResult3).assertEqual(y.equals(x));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2900
     * @tc.name testEquals029
     * @tc.desc Verify equals satisfies transitivity: x.equals(y) and y.equals(z) implies x.equals(z)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Float = new Float(1.5f);
      let y: Float = new Float(1.5f);
      let z: Float = new Float(1.5f);
      if (x.equals(y) && y.equals(z)) {
        let equalsResult4: boolean = x.equals(z);
        expect(equalsResult4).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_3000
     * @tc.name testEquals030
     * @tc.desc Verify equals satisfies consistency: multiple calls return same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op19: Float = new Float(1.5f);
      let result1: boolean = new Float(1.5f).equals(op19);
      let op20: Float = new Float(1.5f);
      let result2: boolean = new Float(1.5f).equals(op20);
      let op21: Float = new Float(1.5f);
      let result3: boolean = new Float(1.5f).equals(op21);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_3100
     * @tc.name testEquals031
     * @tc.desc Verify equals returns false for non-null Float instance compared to null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: boolean = (f.equals as Object as (arg: int) => boolean)(42);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_3200
     * @tc.name testEquals032
     * @tc.desc Verify equals for Float with value 0.0f equals another Float with value 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op22: Float = new Float(-0.0f);
      let a19: Float = new Float(-0.0f);
      let result: boolean = a19.equals(op22);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_3300
     * @tc.name testEquals033
     * @tc.desc Verify equals for Float with large positive boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op23: Float = new Float(3.4028235e38f);
      let a20: Float = new Float(3.4028235e38f);
      let result: boolean = a20.equals(op23);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_3400
     * @tc.name testEquals034
     * @tc.desc Verify equals for Float with small positive boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op24: Float = new Float(1.4e-45f);
      let a21: Float = new Float(1.4e-45f);
      let result: boolean = a21.equals(op24);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_3500
     * @tc.name testEquals035
     * @tc.desc Verify equals for Float with large negative boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testEquals035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op25: Float = new Float(-3.4028235e38f);
      let a22: Float = new Float(-3.4028235e38f);
      let result: boolean = a22.equals(op25);
      expect(result).assertTrue();
    });
  });
}
