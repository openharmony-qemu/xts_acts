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

export default function FloatDivTest(): void {
  describe('FloatDivTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0100
     * @tc.name testDiv001
     * @tc.desc Verify negative zero divided by negative float for Float.div returns +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op1: Float = new Float(-5.0f);
      let a1: Float = new Float(-0.0f);
      let result: Float = a1.div(op1);
      let toStringResult2: string = result.toString();
      expect(toStringResult2).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0200
     * @tc.name testDiv002
     * @tc.desc Verify positive float divided by negative zero for Float.div returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op2: Float = new Float(-0.0f);
      let a2: Float = new Float(5.0f);
      let result: Float = a2.div(op2);
      let isFiniteResult: boolean = result.isFinite();
      expect(isFiniteResult).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult3: string = result.toString();
      expect(toStringResult3).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0300
     * @tc.name testDiv003
     * @tc.desc Verify negative zero divided by negative zero for Float.div returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op3: Float = new Float(-0.0f);
      let a3: Float = new Float(-0.0f);
      let result: Float = a3.div(op3);
      let isNaNResult: boolean = result.isNaN();
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0400
     * @tc.name testDiv004
     * @tc.desc Verify negative Infinity divided by finite negative for Float.div returns +Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op4: Float = new Float(-2.0f);
      let a4: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a4.div(op4);
      let isFiniteResult2: boolean = result.isFinite();
      expect(isFiniteResult2).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult4: string = result.toString();
      expect(toStringResult4).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0500
     * @tc.name testDiv005
     * @tc.desc Verify default-constructed Float (0.0f) divided by positive float for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Float = new Float().div(new Float(3.0f));
      let toStringResult5: string = result.toString();
      expect(toStringResult5).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0600
     * @tc.name testDiv006
     * @tc.desc Verify 6.0f divided by 2.0f equals 3.0f for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op5: Float = new Float(2.0f);
      let a5: Float = new Float(6.0f);
      let result: Float = a5.div(op5);
      let toStringResult6: string = result.toString();
      expect(toStringResult6).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0700
     * @tc.name testDiv007
     * @tc.desc Verify positive divided by negative equals negative for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op6: Float = new Float(-2.0f);
      let a6: Float = new Float(6.0f);
      let result: Float = a6.div(op6);
      let toStringResult7: string = result.toString();
      expect(toStringResult7).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0800
     * @tc.name testDiv008
     * @tc.desc Verify negative divided by positive equals negative for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op7: Float = new Float(2.0f);
      let a7: Float = new Float(-6.0f);
      let result: Float = a7.div(op7);
      let toStringResult8: string = result.toString();
      expect(toStringResult8).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_0900
     * @tc.name testDiv009
     * @tc.desc Verify negative divided by negative equals positive for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op8: Float = new Float(-2.0f);
      let a8: Float = new Float(-6.0f);
      let result: Float = a8.div(op8);
      let toStringResult9: string = result.toString();
      expect(toStringResult9).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1000
     * @tc.name testDiv010
     * @tc.desc Verify non-integer division 5.0f/2.0f for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op9: Float = new Float(2.0f);
      let a9: Float = new Float(5.0f);
      let result: Float = a9.div(op9);
      let toStringResult10: string = result.toString();
      expect(toStringResult10).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1100
     * @tc.name testDiv011
     * @tc.desc Verify dividing a number by itself returns 1.0f for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(7.0f);
      let result: Float = a.div(a);
      let toStringResult11: string = result.toString();
      expect(toStringResult11).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1200
     * @tc.name testDiv012
     * @tc.desc Verify 1.0f/3.0f for Float.div returns IEEE 754 single precision approximation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op10: Float = new Float(3.0f);
      let a10: Float = new Float(1.0f);
      let result: Float = a10.div(op10);
      let isFiniteResult3: boolean = result.isFinite();
      expect(isFiniteResult3).assertTrue();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1300
     * @tc.name testDiv013
     * @tc.desc Verify zero divided by non-zero for Float.div returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op11: Float = new Float(5.0f);
      let a11: Float = new Float(0.0f);
      let result: Float = a11.div(op11);
      let toStringResult12: string = result.toString();
      expect(toStringResult12).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1400
     * @tc.name testDiv014
     * @tc.desc Verify negative zero divided by positive for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op12: Float = new Float(5.0f);
      let a12: Float = new Float(-0.0f);
      let result: Float = a12.div(op12);
      expect(result.equals(new Float(0.0f))).assertTrue();
      let isNegativeZero: boolean = 1.0f / result.toFloat() === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1500
     * @tc.name testDiv015
     * @tc.desc Verify positive divided by zero for Float.div returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op13: Float = new Float(0.0f);
      let a13: Float = new Float(5.0f);
      let result: Float = a13.div(op13);
      let isFiniteResult4: boolean = result.isFinite();
      expect(isFiniteResult4).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult13: string = result.toString();
      expect(toStringResult13).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1600
     * @tc.name testDiv016
     * @tc.desc Verify negative divided by zero for Float.div returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op14: Float = new Float(0.0f);
      let a14: Float = new Float(-5.0f);
      let result: Float = a14.div(op14);
      let isFiniteResult5: boolean = result.isFinite();
      expect(isFiniteResult5).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult14: string = result.toString();
      expect(toStringResult14).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1700
     * @tc.name testDiv017
     * @tc.desc Verify zero divided by zero for Float.div returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op15: Float = new Float(0.0f);
      let a15: Float = new Float(0.0f);
      let result: Float = a15.div(op15);
      let isNaNResult2: boolean = result.isNaN();
      expect(isNaNResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1800
     * @tc.name testDiv018
     * @tc.desc Verify NaN divided by arbitrary value for Float.div returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nan: Float = new Float(Float.NaN);
      let result: Float = nan.div(new Float(2.0f));
      let isNaNResult3: boolean = result.isNaN();
      expect(isNaNResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_1900
     * @tc.name testDiv019
     * @tc.desc Verify arbitrary value divided by NaN for Float.div returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op16: Float = new Float(Float.NaN);
      let a16: Float = new Float(5.0f);
      let result: Float = a16.div(op16);
      let isNaNResult4: boolean = result.isNaN();
      expect(isNaNResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2000
     * @tc.name testDiv020
     * @tc.desc Verify positive Infinity divided by positive Infinity for Float.div returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op17: Float = new Float(Float.POSITIVE_INFINITY);
      let a17: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a17.div(op17);
      let isNaNResult5: boolean = result.isNaN();
      expect(isNaNResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2100
     * @tc.name testDiv021
     * @tc.desc Verify negative Infinity divided by negative Infinity for Float.div returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op18: Float = new Float(Float.NEGATIVE_INFINITY);
      let a18: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a18.div(op18);
      let isNaNResult6: boolean = result.isNaN();
      expect(isNaNResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2200
     * @tc.name testDiv022
     * @tc.desc Verify positive Infinity divided by finite positive for Float.div returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op19: Float = new Float(2.0f);
      let a19: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a19.div(op19);
      let isFiniteResult6: boolean = result.isFinite();
      expect(isFiniteResult6).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult15: string = result.toString();
      expect(toStringResult15).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2300
     * @tc.name testDiv023
     * @tc.desc Verify positive Infinity divided by finite negative for Float.div returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op20: Float = new Float(-2.0f);
      let a20: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a20.div(op20);
      let isFiniteResult7: boolean = result.isFinite();
      expect(isFiniteResult7).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult16: string = result.toString();
      expect(toStringResult16).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2400
     * @tc.name testDiv024
     * @tc.desc Verify negative Infinity divided by finite positive for Float.div returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op21: Float = new Float(2.0f);
      let a21: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a21.div(op21);
      let isFiniteResult8: boolean = result.isFinite();
      expect(isFiniteResult8).assertFalse();
      expect(result.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult17: string = result.toString();
      expect(toStringResult17).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2500
     * @tc.name testDiv025
     * @tc.desc Verify finite positive divided by positive Infinity for Float.div returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op22: Float = new Float(Float.POSITIVE_INFINITY);
      let a22: Float = new Float(5.0f);
      let result: Float = a22.div(op22);
      let toStringResult18: string = result.toString();
      expect(toStringResult18).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2600
     * @tc.name testDiv026
     * @tc.desc Verify finite negative divided by positive Infinity for Float.div returns -0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op23: Float = new Float(Float.POSITIVE_INFINITY);
      let a23: Float = new Float(-5.0f);
      let result: Float = a23.div(op23);
      expect(result.equals(new Float(0.0f))).assertTrue();
      let isNegativeZero: boolean = 1.0f / result.toFloat() === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2700
     * @tc.name testDiv027
     * @tc.desc Verify finite positive divided by negative Infinity for Float.div returns -0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op24: Float = new Float(Float.NEGATIVE_INFINITY);
      let a24: Float = new Float(5.0f);
      let result: Float = a24.div(op24);
      expect(result.equals(new Float(0.0f))).assertTrue();
      let isNegativeZero: boolean = 1.0f / result.toFloat() === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2800
     * @tc.name testDiv028
     * @tc.desc Verify Float.MAX_VALUE divided by itself for Float.div returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Float = new Float(Float.MAX_VALUE);
      let result: Float = max.div(max);
      let toStringResult19: string = result.toString();
      expect(toStringResult19).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2900
     * @tc.name testDiv029
     * @tc.desc Verify Float.MIN_VALUE divided by itself for Float.div returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Float = new Float(Float.MIN_VALUE);
      let result: Float = min.div(min);
      let toStringResult20: string = result.toString();
      expect(toStringResult20).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_3000
     * @tc.name testDiv030
     * @tc.desc Verify Float.MAX_VALUE divided by 0.5f for Float.div overflows to Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op25: Float = new Float(0.5f);
      let a25: Float = new Float(Float.MAX_VALUE);
      let result: Float = a25.div(op25);
      let isFiniteResult9: boolean = result.isFinite();
      expect(isFiniteResult9).assertFalse();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult21: string = result.toString();
      expect(toStringResult21).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_3100
     * @tc.name testDiv031
     * @tc.desc Verify Float.MIN_VALUE divided by 2.0f for Float.div underflows to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op26: Float = new Float(2.0f);
      let a26: Float = new Float(Float.MIN_VALUE);
      let result: Float = a26.div(op26);
      let toStringResult22: string = result.toString();
      expect(toStringResult22).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_3200
     * @tc.name testDiv032
     * @tc.desc Verify Float.div returns new instance and original is unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(6.0f);
      let originalValue: string = a.toString();
      let result: Float = a.div(new Float(2.0f));
      let afterValue: string = a.toString();
      expect(originalValue).assertEqual(afterValue);
      expect(originalValue).assertEqual('6');
      let toStringResult23: string = result.toString();
      expect(toStringResult23).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_3300
     * @tc.name testDiv033
     * @tc.desc Verify Float.MAX_SAFE_INTEGER divided by 0.5f remains finite for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op27: Float = new Float(0.5f);
      let a27: Float = new Float(Float.MAX_SAFE_INTEGER);
      let result: Float = a27.div(op27);
      let isFiniteResult10: boolean = result.isFinite();
      expect(isFiniteResult10).assertTrue();
      expect(result.isGreaterThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_3400
     * @tc.name testDiv034
     * @tc.desc Verify Float.div returns a new instance different from the original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(6.0f);
      let result: Float = a.div(new Float(2.0f));
      let isSameReference: boolean = result === a;
      expect(isSameReference).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_3500
     * @tc.name testDiv035
     * @tc.desc Verify chain division for Float.div
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op28: Float = new Float(2.0f);
      let a28: Float = new Float(24.0f);
      let result: Float = a28.div(op28).div(new Float(3.0f)).div(new Float(4.0f));
      let toStringResult24: string = result.toString();
      expect(toStringResult24).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_3600
     * @tc.name testDiv036
     * @tc.desc Verify chain division does not affect the original instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Float = new Float(24.0f);
      let result: Float = a.div(new Float(2.0f)).div(new Float(3.0f));
      let toStringResult25: string = a.toString();
      expect(toStringResult25).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_3700
     * @tc.name testDiv037
     * @tc.desc Verify div with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDiv037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(6.0f);
      try {
        (f.div as Object as () => Float)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });
  });
}
