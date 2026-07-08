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

export default function FloatMulTest(): void {
  describe('FloatMulTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0100
     * @tc.name testMul001
     * @tc.desc Verify negative zero times negative zero for Float.mul returns +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op2: Float = new Float(-0.0f);
      let a2: Float = new Float(-0.0f);
      let result: Float = a2.mul(op2);
      let toStringResult2: string = result.toString();
      expect(toStringResult2).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0200
     * @tc.name testMul002
     * @tc.desc Verify positive zero times negative zero for Float.mul returns -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op4: Float = new Float(-0.0f);
      let a4: Float = new Float(0.0f);
      let result: Float = a4.mul(op4);
      expect(result.equals(new Float(0.0f))).assertTrue();
      let isNegativeZero: boolean = 1.0f / result.toFloat() === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0300
     * @tc.name testMul003
     * @tc.desc Verify negative Infinity times negative Infinity for Float.mul returns +Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op5: Float = new Float(Float.NEGATIVE_INFINITY);
      let a5: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a5.mul(op5);
      let isFiniteResult: boolean = result.isFinite();
      expect(isFiniteResult).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult3: string = result.toString();
      expect(toStringResult3).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0400
     * @tc.name testMul004
     * @tc.desc Verify default-constructed Float (0.0f) times positive float for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Float = new Float().mul(new Float(3.0f));
      let toStringResult4: string = result.toString();
      expect(toStringResult4).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0500
     * @tc.name testMul005
     * @tc.desc Verify 1.0f times Float.MIN_VALUE preserves MIN_VALUE for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op6: Float = new Float(Float.MIN_VALUE);
      let a6: Float = new Float(1.0f);
      let result: Float = a6.mul(op6);
      expect(result.equals(new Float(Float.MIN_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0600
     * @tc.name testMul006
     * @tc.desc Verify Float.MAX_SAFE_INTEGER times 2.0f precision for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op7: Float = new Float(2.0f);
      let a7: Float = new Float(Float.MAX_SAFE_INTEGER);
      let result: Float = a7.mul(op7);
      let isFiniteResult2: boolean = result.isFinite();
      expect(isFiniteResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0700
     * @tc.name testMul007
     * @tc.desc Verify Float.MIN_VALUE times 0.5f yields subnormal for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op8: Float = new Float(0.5f);
      let a8: Float = new Float(Float.MIN_VALUE);
      let result: Float = a8.mul(op8);
      let isFiniteResult3: boolean = result.isFinite();
      expect(isFiniteResult3).assertTrue();
      expect(result.isGreaterEqualThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0800
     * @tc.name testMul008
     * @tc.desc Verify positive float times positive float for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op9: Float = new Float(2.0f);
      let a9: Float = new Float(3.0f);
      let result: Float = a9.mul(op9);
      let toStringResult5: string = result.toString();
      expect(toStringResult5).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_0900
     * @tc.name testMul009
     * @tc.desc Verify positive float times negative float for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op10: Float = new Float(-2.0f);
      let a10: Float = new Float(3.0f);
      let result: Float = a10.mul(op10);
      let toStringResult6: string = result.toString();
      expect(toStringResult6).assertEqual('-6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1000
     * @tc.name testMul010
     * @tc.desc Verify negative float times negative float for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op11: Float = new Float(-2.0f);
      let a11: Float = new Float(-3.0f);
      let result: Float = a11.mul(op11);
      let toStringResult7: string = result.toString();
      expect(toStringResult7).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1100
     * @tc.name testMul011
     * @tc.desc Verify negative float times positive float for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op12: Float = new Float(2.0f);
      let a12: Float = new Float(-3.0f);
      let result: Float = a12.mul(op12);
      let toStringResult8: string = result.toString();
      expect(toStringResult8).assertEqual('-6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1200
     * @tc.name testMul012
     * @tc.desc Verify zero times arbitrary number for Float.mul returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op13: Float = new Float(5.0f);
      let a13: Float = new Float(0.0f);
      let result: Float = a13.mul(op13);
      let toStringResult9: string = result.toString();
      expect(toStringResult9).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1300
     * @tc.name testMul013
     * @tc.desc Verify arbitrary number times zero for Float.mul returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op14: Float = new Float(0.0f);
      let a14: Float = new Float(5.0f);
      let result: Float = a14.mul(op14);
      let toStringResult10: string = result.toString();
      expect(toStringResult10).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1400
     * @tc.name testMul014
     * @tc.desc Verify negative zero times arbitrary number for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op15: Float = new Float(5.0f);
      let a15: Float = new Float(-0.0f);
      let result: Float = a15.mul(op15);
      expect(result.equals(new Float(0.0f))).assertTrue();
      let isNegativeZero: boolean = 1.0f / result.toFloat() === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1500
     * @tc.name testMul015
     * @tc.desc Verify arbitrary number times identity 1.0f for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op16: Float = new Float(1.0f);
      let a16: Float = new Float(3.14f);
      let result: Float = a16.mul(op16);
      let toStringResult11: string = result.toString();
      expect(toStringResult11).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1600
     * @tc.name testMul016
     * @tc.desc Verify identity 1.0f times arbitrary number for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op17: Float = new Float(3.14f);
      let a17: Float = new Float(1.0f);
      let result: Float = a17.mul(op17);
      let toStringResult12: string = result.toString();
      expect(toStringResult12).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1700
     * @tc.name testMul017
     * @tc.desc Verify decimal multiplication for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op18: Float = new Float(0.2f);
      let a18: Float = new Float(0.1f);
      let result: Float = a18.mul(op18);
      let isFiniteResult4: boolean = result.isFinite();
      expect(isFiniteResult4).assertTrue();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1800
     * @tc.name testMul018
     * @tc.desc Verify negative one multiplication negates for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op19: Float = new Float(-1.0f);
      let a19: Float = new Float(3.0f);
      let result: Float = a19.mul(op19);
      let toStringResult13: string = result.toString();
      expect(toStringResult13).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_1900
     * @tc.name testMul019
     * @tc.desc Verify Float.MAX_VALUE times MAX_VALUE for Float.mul overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op20: Float = new Float(Float.MAX_VALUE);
      let a20: Float = new Float(Float.MAX_VALUE);
      let result: Float = a20.mul(op20);
      let isFiniteResult5: boolean = result.isFinite();
      expect(isFiniteResult5).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult14: string = result.toString();
      expect(toStringResult14).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2000
     * @tc.name testMul020
     * @tc.desc Verify Float.MAX_VALUE times 0.5 for Float.mul no overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op21: Float = new Float(0.5f);
      let a21: Float = new Float(Float.MAX_VALUE);
      let result: Float = a21.mul(op21);
      let isFiniteResult6: boolean = result.isFinite();
      expect(isFiniteResult6).assertTrue();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2100
     * @tc.name testMul021
     * @tc.desc Verify Float.MIN_VALUE times MIN_VALUE for Float.mul underflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op22: Float = new Float(Float.MIN_VALUE);
      let a22: Float = new Float(Float.MIN_VALUE);
      let result: Float = a22.mul(op22);
      expect(result.equals(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2200
     * @tc.name testMul022
     * @tc.desc Verify NaN times positive number for Float.mul returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op23: Float = new Float(2.0f);
      let a23: Float = new Float(Float.NaN);
      let result: Float = a23.mul(op23);
      let isNaNResult: boolean = result.isNaN();
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2300
     * @tc.name testMul023
     * @tc.desc Verify positive number times NaN for Float.mul returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op24: Float = new Float(Float.NaN);
      let a24: Float = new Float(2.0f);
      let result: Float = a24.mul(op24);
      let isNaNResult2: boolean = result.isNaN();
      expect(isNaNResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2400
     * @tc.name testMul024
     * @tc.desc Verify NaN times NaN for Float.mul returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op25: Float = new Float(Float.NaN);
      let a25: Float = new Float(Float.NaN);
      let result: Float = a25.mul(op25);
      let isNaNResult3: boolean = result.isNaN();
      expect(isNaNResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2500
     * @tc.name testMul025
     * @tc.desc Verify NaN times zero for Float.mul returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op26: Float = new Float(0.0f);
      let a26: Float = new Float(Float.NaN);
      let result: Float = a26.mul(op26);
      let isNaNResult4: boolean = result.isNaN();
      expect(isNaNResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2600
     * @tc.name testMul026
     * @tc.desc Verify Infinity times positive number for Float.mul returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op27: Float = new Float(2.0f);
      let a27: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a27.mul(op27);
      let isFiniteResult7: boolean = result.isFinite();
      expect(isFiniteResult7).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult15: string = result.toString();
      expect(toStringResult15).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2700
     * @tc.name testMul027
     * @tc.desc Verify Infinity times negative number for Float.mul returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op28: Float = new Float(-2.0f);
      let a28: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a28.mul(op28);
      let isFiniteResult8: boolean = result.isFinite();
      expect(isFiniteResult8).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult16: string = result.toString();
      expect(toStringResult16).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2800
     * @tc.name testMul028
     * @tc.desc Verify negative Infinity times positive number for Float.mul returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op29: Float = new Float(2.0f);
      let a29: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a29.mul(op29);
      let isFiniteResult9: boolean = result.isFinite();
      expect(isFiniteResult9).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult17: string = result.toString();
      expect(toStringResult17).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2900
     * @tc.name testMul029
     * @tc.desc Verify negative Infinity times negative number for Float.mul returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op30: Float = new Float(-2.0f);
      let a30: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a30.mul(op30);
      let isFiniteResult10: boolean = result.isFinite();
      expect(isFiniteResult10).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult18: string = result.toString();
      expect(toStringResult18).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3000
     * @tc.name testMul030
     * @tc.desc Verify Infinity times Infinity for Float.mul returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op31: Float = new Float(Float.POSITIVE_INFINITY);
      let a31: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a31.mul(op31);
      let isFiniteResult11: boolean = result.isFinite();
      expect(isFiniteResult11).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult19: string = result.toString();
      expect(toStringResult19).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3100
     * @tc.name testMul031
     * @tc.desc Verify Infinity times negative Infinity for Float.mul returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op32: Float = new Float(Float.NEGATIVE_INFINITY);
      let a32: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a32.mul(op32);
      let isFiniteResult12: boolean = result.isFinite();
      expect(isFiniteResult12).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult20: string = result.toString();
      expect(toStringResult20).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3200
     * @tc.name testMul032
     * @tc.desc Verify Infinity times zero for Float.mul returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op33: Float = new Float(0.0f);
      let a33: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a33.mul(op33);
      let isNaNResult5: boolean = result.isNaN();
      expect(isNaNResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3300
     * @tc.name testMul033
     * @tc.desc Verify negative Infinity times zero for Float.mul returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op34: Float = new Float(0.0f);
      let a34: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a34.mul(op34);
      let isNaNResult6: boolean = result.isNaN();
      expect(isNaNResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3400
     * @tc.name testMul034
     * @tc.desc Verify 2.0f times Float.MAX_VALUE overflows to +Infinity for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op35: Float = new Float(Float.MAX_VALUE);
      let a35: Float = new Float(2.0f);
      let result: Float = a35.mul(op35);
      let isFiniteResult13: boolean = result.isFinite();
      expect(isFiniteResult13).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult21: string = result.toString();
      expect(toStringResult21).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3500
     * @tc.name testMul035
     * @tc.desc Verify Float.mul returns a new instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(3.0f);
      let b: Float = new Float(2.0f);
      let c: Float = a.mul(b);
      let isSameReference: boolean = c === a;
      expect(isSameReference).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3600
     * @tc.name testMul036
     * @tc.desc Verify Float.mul does not modify the original instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(3.0f);
      a.mul(new Float(2.0f));
      let toStringResult22: string = a.toString();
      expect(toStringResult22).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3700
     * @tc.name testMul037
     * @tc.desc Verify Float.mul does not modify the parameter instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(3.0f);
      let b: Float = new Float(2.0f);
      a.mul(b);
      let toStringResult23: string = b.toString();
      expect(toStringResult23).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3800
     * @tc.name testMul038
     * @tc.desc Verify chain call a.mul(b).mul(c) for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op36: Float = new Float(3.0f);
      let a36: Float = new Float(2.0f);
      let result: Float = a36.mul(op36).mul(new Float(4.0f));
      let toStringResult24: string = result.toString();
      expect(toStringResult24).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_3900
     * @tc.name testMul039
     * @tc.desc Verify multiple chain multiplication for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op37: Float = new Float(2.0f);
      let a37: Float = new Float(2.0f);
      let result: Float = a37.mul(op37).mul(new Float(2.0f)).mul(new Float(2.0f));
      let toStringResult25: string = result.toString();
      expect(toStringResult25).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_4000
     * @tc.name testMul040
     * @tc.desc Verify chain multiplication with different Float instances for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(2.0f);
      let b: Float = new Float(3.0f);
      let c: Float = new Float(5.0f);
      let result: Float = a.mul(b).mul(c);
      let toStringResult26: string = result.toString();
      expect(toStringResult26).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_4100
     * @tc.name testMul041
     * @tc.desc Verify chain multiplication intermediate results do not affect original instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(2.0f);
      let b: Float = new Float(3.0f);
      let r1: Float = a.mul(b);
      let r2: Float = r1.mul(new Float(4.0f));
      let toStringResult27: string = a.toString();
      expect(toStringResult27).assertEqual('2');
      let toStringResult28: string = r1.toString();
      expect(toStringResult28).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_4200
     * @tc.name testMul042
     * @tc.desc Verify Float.MAX_VALUE times 1.0f for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op38: Float = new Float(1.0f);
      let a38: Float = new Float(Float.MAX_VALUE);
      let result: Float = a38.mul(op38);
      expect(result.equals(new Float(Float.MAX_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_4300
     * @tc.name testMul043
     * @tc.desc Verify Float.MIN_VALUE times 1.0f for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op39: Float = new Float(1.0f);
      let a39: Float = new Float(Float.MIN_VALUE);
      let result: Float = a39.mul(op39);
      expect(result.equals(new Float(Float.MIN_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_4400
     * @tc.name testMul044
     * @tc.desc Verify Float.MAX_VALUE times 0.0f for Float.mul returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op40: Float = new Float(0.0f);
      let a40: Float = new Float(Float.MAX_VALUE);
      let result: Float = a40.mul(op40);
      let toStringResult29: string = result.toString();
      expect(toStringResult29).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_4500
     * @tc.name testMul045
     * @tc.desc Verify multiplication of very close numbers for Float.mul
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op41: Float = new Float(0.9999999f);
      let a41: Float = new Float(1.0000001f);
      let result: Float = a41.mul(op41);
      let isFiniteResult14: boolean = result.isFinite();
      expect(isFiniteResult14).assertTrue();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_4600
     * @tc.name testMul046
     * @tc.desc Verify mul with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMul046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      try {
        (f.mul as Object as () => Float)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });
  });
}
