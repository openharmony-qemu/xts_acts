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

export default function FloatSubTest(): void {
  describe('FloatSubTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0100
     * @tc.name testSub001
     * @tc.desc Verify negative float minus zero for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op2: Float = new Float(0.0f);
      let a2: Float = new Float(-3.5f);
      let result: Float = a2.sub(op2);
      let toStringResult2: string = result.toString();
      expect(toStringResult2).assertEqual('-3.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0200
     * @tc.name testSub002
     * @tc.desc Verify negative zero minus negative zero for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op3: Float = new Float(-0.0f);
      let a3: Float = new Float(-0.0f);
      let result: Float = a3.sub(op3);
      let toStringResult3: string = result.toString();
      expect(toStringResult3).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0300
     * @tc.name testSub003
     * @tc.desc Verify Float.MAX_VALUE minus negative Float.MAX_VALUE overflows to +Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op4: Float = new Float(-Float.MAX_VALUE);
      let a4: Float = new Float(Float.MAX_VALUE);
      let result: Float = a4.sub(op4);
      let isFiniteResult: boolean = result.isFinite();
      expect(isFiniteResult).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult4: string = result.toString();
      expect(toStringResult4).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0400
     * @tc.name testSub004
     * @tc.desc Verify -Float.MAX_VALUE minus Float.MAX_VALUE overflows to -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op5: Float = new Float(Float.MAX_VALUE);
      let a5: Float = new Float(-Float.MAX_VALUE);
      let result: Float = a5.sub(op5);
      let isFiniteResult2: boolean = result.isFinite();
      expect(isFiniteResult2).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult5: string = result.toString();
      expect(toStringResult5).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0500
     * @tc.name testSub005
     * @tc.desc Verify default-constructed Float (0.0f) minus positive float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Float = new Float().sub(new Float(3.0f));
      let toStringResult6: string = result.toString();
      expect(toStringResult6).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0600
     * @tc.name testSub006
     * @tc.desc Verify negative Infinity minus finite positive for Float.sub returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op6: Float = new Float(3.5f);
      let a6: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a6.sub(op6);
      let isFiniteResult3: boolean = result.isFinite();
      expect(isFiniteResult3).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult7: string = result.toString();
      expect(toStringResult7).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0700
     * @tc.name testSub007
     * @tc.desc Verify Float.MIN_VALUE minus Float.MIN_VALUE for Float.sub returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op7: Float = new Float(Float.MIN_VALUE);
      let a7: Float = new Float(Float.MIN_VALUE);
      let result: Float = a7.sub(op7);
      expect(result.equals(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0800
     * @tc.name testSub008
     * @tc.desc Verify positive float minus positive float for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op8: Float = new Float(2.0f);
      let a8: Float = new Float(3.5f);
      let result: Float = a8.sub(op8);
      let toStringResult8: string = result.toString();
      expect(toStringResult8).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_0900
     * @tc.name testSub009
     * @tc.desc Verify positive float minus negative float for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op9: Float = new Float(-2.0f);
      let a9: Float = new Float(3.5f);
      let result: Float = a9.sub(op9);
      let toStringResult9: string = result.toString();
      expect(toStringResult9).assertEqual('5.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1000
     * @tc.name testSub010
     * @tc.desc Verify negative float minus positive float for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op10: Float = new Float(2.0f);
      let a10: Float = new Float(-3.5f);
      let result: Float = a10.sub(op10);
      let toStringResult10: string = result.toString();
      expect(toStringResult10).assertEqual('-5.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1100
     * @tc.name testSub011
     * @tc.desc Verify negative float minus negative float for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op11: Float = new Float(-2.0f);
      let a11: Float = new Float(-3.5f);
      let result: Float = a11.sub(op11);
      let toStringResult11: string = result.toString();
      expect(toStringResult11).assertEqual('-1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1200
     * @tc.name testSub012
     * @tc.desc Verify positive float minus zero for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op12: Float = new Float(0.0f);
      let a12: Float = new Float(3.5f);
      let result: Float = a12.sub(op12);
      let toStringResult12: string = result.toString();
      expect(toStringResult12).assertEqual('3.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1300
     * @tc.name testSub013
     * @tc.desc Verify zero minus positive float for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op13: Float = new Float(2.0f);
      let a13: Float = new Float(0.0f);
      let result: Float = a13.sub(op13);
      let toStringResult13: string = result.toString();
      expect(toStringResult13).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1400
     * @tc.name testSub014
     * @tc.desc Verify zero minus zero for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op14: Float = new Float(0.0f);
      let a14: Float = new Float(0.0f);
      let result: Float = a14.sub(op14);
      let toStringResult14: string = result.toString();
      expect(toStringResult14).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1500
     * @tc.name testSub015
     * @tc.desc Verify zero minus negative float for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op15: Float = new Float(-2.0f);
      let a15: Float = new Float(0.0f);
      let result: Float = a15.sub(op15);
      let toStringResult15: string = result.toString();
      expect(toStringResult15).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1600
     * @tc.name testSub016
     * @tc.desc Verify subtracting same value for Float.sub returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op16: Float = new Float(5.0f);
      let a16: Float = new Float(5.0f);
      let result: Float = a16.sub(op16);
      let toStringResult16: string = result.toString();
      expect(toStringResult16).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1700
     * @tc.name testSub017
     * @tc.desc Verify large number minus tiny number is unchanged due to float32 precision loss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op17: Float = new Float(1.0f);
      let a17: Float = new Float(1e30f);
      let result: Float = a17.sub(op17);
      expect(result.equals(new Float(1e30f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1800
     * @tc.name testSub018
     * @tc.desc Verify NaN minus arbitrary value for Float.sub returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op18: Float = new Float(2.0f);
      let a18: Float = new Float(Float.NaN);
      let result: Float = a18.sub(op18);
      let isNaNResult: boolean = result.isNaN();
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_1900
     * @tc.name testSub019
     * @tc.desc Verify arbitrary value minus NaN for Float.sub returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op19: Float = new Float(Float.NaN);
      let a19: Float = new Float(3.5f);
      let result: Float = a19.sub(op19);
      let isNaNResult2: boolean = result.isNaN();
      expect(isNaNResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2000
     * @tc.name testSub020
     * @tc.desc Verify NaN minus NaN for Float.sub returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op20: Float = new Float(Float.NaN);
      let a20: Float = new Float(Float.NaN);
      let result: Float = a20.sub(op20);
      let isNaNResult3: boolean = result.isNaN();
      expect(isNaNResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2100
     * @tc.name testSub021
     * @tc.desc Verify Infinity minus Infinity for Float.sub returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op21: Float = new Float(Float.POSITIVE_INFINITY);
      let a21: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a21.sub(op21);
      let isNaNResult4: boolean = result.isNaN();
      expect(isNaNResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2200
     * @tc.name testSub022
     * @tc.desc Verify negative Infinity minus negative Infinity for Float.sub returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op22: Float = new Float(Float.NEGATIVE_INFINITY);
      let a22: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a22.sub(op22);
      let isNaNResult5: boolean = result.isNaN();
      expect(isNaNResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2300
     * @tc.name testSub023
     * @tc.desc Verify Infinity minus negative Infinity for Float.sub returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op23: Float = new Float(Float.NEGATIVE_INFINITY);
      let a23: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a23.sub(op23);
      let isFiniteResult4: boolean = result.isFinite();
      expect(isFiniteResult4).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult17: string = result.toString();
      expect(toStringResult17).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2400
     * @tc.name testSub024
     * @tc.desc Verify negative Infinity minus Infinity for Float.sub returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op24: Float = new Float(Float.POSITIVE_INFINITY);
      let a24: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a24.sub(op24);
      let isFiniteResult5: boolean = result.isFinite();
      expect(isFiniteResult5).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult18: string = result.toString();
      expect(toStringResult18).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2500
     * @tc.name testSub025
     * @tc.desc Verify finite value minus Infinity for Float.sub returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op25: Float = new Float(Float.POSITIVE_INFINITY);
      let a25: Float = new Float(3.5f);
      let result: Float = a25.sub(op25);
      let isFiniteResult6: boolean = result.isFinite();
      expect(isFiniteResult6).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult19: string = result.toString();
      expect(toStringResult19).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2600
     * @tc.name testSub026
     * @tc.desc Verify finite value minus negative Infinity for Float.sub returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op26: Float = new Float(Float.NEGATIVE_INFINITY);
      let a26: Float = new Float(3.5f);
      let result: Float = a26.sub(op26);
      let isFiniteResult7: boolean = result.isFinite();
      expect(isFiniteResult7).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult20: string = result.toString();
      expect(toStringResult20).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2700
     * @tc.name testSub027
     * @tc.desc Verify Infinity minus finite value for Float.sub returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op27: Float = new Float(3.5f);
      let a27: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a27.sub(op27);
      let isFiniteResult8: boolean = result.isFinite();
      expect(isFiniteResult8).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult21: string = result.toString();
      expect(toStringResult21).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2800
     * @tc.name testSub028
     * @tc.desc Verify 1.0f minus Float.MIN_VALUE loses precision (MIN_VALUE too small to affect 1.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op28: Float = new Float(Float.MIN_VALUE);
      let a28: Float = new Float(1.0f);
      let result: Float = a28.sub(op28);
      expect(result.equals(new Float(1.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2900
     * @tc.name testSub029
     * @tc.desc Verify Float.sub returns a new instance and original is unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(3.5f);
      let b: Float = a.sub(new Float(2.0f));
      let toStringResult22: string = a.toString();
      expect(toStringResult22).assertEqual('3.5');
      let toStringResult23: string = b.toString();
      expect(toStringResult23).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3000
     * @tc.name testSub030
     * @tc.desc Verify Float.sub returns a new instance different from the original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(3.5f);
      let b: Float = a.sub(new Float(2.0f));
      let isSameReference: boolean = a === b;
      expect(isSameReference).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3100
     * @tc.name testSub031
     * @tc.desc Verify chain call a.sub(b).sub(c) for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op29: Float = new Float(3.0f);
      let a29: Float = new Float(10.0f);
      let result: Float = a29.sub(op29).sub(new Float(2.0f));
      let toStringResult24: string = result.toString();
      expect(toStringResult24).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3200
     * @tc.name testSub032
     * @tc.desc Verify intermediate results of chain call for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(10.0f);
      let b: Float = a.sub(new Float(3.0f));
      let c: Float = b.sub(new Float(2.0f));
      let toStringResult25: string = a.toString();
      expect(toStringResult25).assertEqual('10');
      let toStringResult26: string = b.toString();
      expect(toStringResult26).assertEqual('7');
      let toStringResult27: string = c.toString();
      expect(toStringResult27).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3300
     * @tc.name testSub033
     * @tc.desc Verify long chain call for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op30: Float = new Float(10.0f);
      let a30: Float = new Float(100.0f);
      let result: Float = a30.sub(op30).sub(new Float(20.0f)).sub(new Float(30.0f));
      let toStringResult28: string = result.toString();
      expect(toStringResult28).assertEqual('40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3400
     * @tc.name testSub034
     * @tc.desc Verify Float.MIN_VALUE minus zero for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op31: Float = new Float(0.0f);
      let a31: Float = new Float(Float.MIN_VALUE);
      let result: Float = a31.sub(op31);
      expect(result.equals(new Float(Float.MIN_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3500
     * @tc.name testSub035
     * @tc.desc Verify Float.MAX_VALUE minus zero for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op32: Float = new Float(0.0f);
      let a32: Float = new Float(Float.MAX_VALUE);
      let result: Float = a32.sub(op32);
      expect(result.equals(new Float(Float.MAX_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3600
     * @tc.name testSub036
     * @tc.desc Verify positive zero minus negative zero for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op33: Float = new Float(-0.0f);
      let a33: Float = new Float(0.0f);
      let result: Float = a33.sub(op33);
      expect(result.equals(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3700
     * @tc.name testSub037
     * @tc.desc Verify negative zero minus positive zero for Float.sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op34: Float = new Float(0.0f);
      let a34: Float = new Float(-0.0f);
      let result: Float = a34.sub(op34);
      expect(result.equals(new Float(0.0f))).assertTrue();
      let isNegativeZero: boolean = 1.0f / result.toFloat() === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3800
     * @tc.name testSub038
     * @tc.desc Verify Float.sub after narrowing Float|null union operand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let other: Float | null = new Float(2.0f);
      let f: Float = new Float(5.0f);
      expect(other !== null).assertTrue();
      let result: Float = f.sub(other!);
      let toStringResult29: string = result.toString();
      expect(toStringResult29).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_3900
     * @tc.name testSub039
     * @tc.desc Verify Float.sub after narrowing Float|undefined union operand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let other: Float | undefined = new Float(1.0f);
      let f: Float = new Float(4.0f);
      expect(other !== undefined).assertTrue();
      let result: Float = f.sub(other!);
      let toStringResult30: string = result.toString();
      expect(toStringResult30).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_4000
     * @tc.name testSub040
     * @tc.desc Verify sub with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testSub040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      try {
        (f.sub as Object as () => Float)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });
  });
}
