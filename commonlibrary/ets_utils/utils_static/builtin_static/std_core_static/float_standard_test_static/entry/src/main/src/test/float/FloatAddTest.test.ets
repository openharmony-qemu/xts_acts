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

export default function FloatAddTest(): void {
  describe('FloatAddTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0100
     * @tc.name testAdd001
     * @tc.desc Verify normal parameter count(1 param) for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op1: Float = new Float(2.0f);
      let a1: Float = new Float(1.5f);
      let result: Float = a1.add(op1);
      let expectedValue: Float = new Float(3.5f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0200
     * @tc.name testAdd002
     * @tc.desc Verify negative zero plus negative zero for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op2: Float = new Float(-0.0f);
      let a2: Float = new Float(-0.0f);
      let result: Float = a2.add(op2);
      let expectedZero: Float = new Float(0.0f);
      expect(result).assertEqual(expectedZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0300
     * @tc.name testAdd003
     * @tc.desc Verify negative float plus negative zero for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op3: Float = new Float(-0.0f);
      let a3: Float = new Float(-5.0f);
      let result: Float = a3.add(op3);
      let expectedValue: Float = new Float(-5.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0400
     * @tc.name testAdd004
     * @tc.desc Verify finite value plus NaN for Float.add returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op5: Float = new Float(Float.NaN);
      let a5: Float = new Float(1.5f);
      let result: Float = a5.add(op5);
      let isNaNResult: boolean = result.isNaN();
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0500
     * @tc.name testAdd005
     * @tc.desc Verify negative Infinity plus negative Infinity for Float.add returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op6: Float = new Float(Float.NEGATIVE_INFINITY);
      let a6: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a6.add(op6);
      let isFiniteResult2: boolean = result.isFinite();
      expect(isFiniteResult2).assertFalse();
      let zeroForCompare2: Float = new Float(0.0f);
      expect(result.isLessThan(zeroForCompare2)).assertTrue();
      let negInfinity: Float = new Float(Float.NEGATIVE_INFINITY);
      expect(result).assertEqual(negInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0600
     * @tc.name testAdd006
     * @tc.desc Verify finite positive plus positive Infinity for Float.add returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op7: Float = new Float(Float.POSITIVE_INFINITY);
      let a7: Float = new Float(1.5f);
      let result: Float = a7.add(op7);
      let isFiniteResult3: boolean = result.isFinite();
      expect(isFiniteResult3).assertFalse();
      let zeroForCompare3: Float = new Float(0.0f);
      expect(result.isGreaterThan(zeroForCompare3)).assertTrue();
      let posInfinityFor6: Float = new Float(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(posInfinityFor6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0700
     * @tc.name testAdd007
     * @tc.desc Verify Float.MAX_VALUE plus itself overflows to Infinity for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op8: Float = new Float(Float.MAX_VALUE);
      let a8: Float = new Float(Float.MAX_VALUE);
      let result: Float = a8.add(op8);
      let isFiniteResult4: boolean = result.isFinite();
      expect(isFiniteResult4).assertFalse();
      let zeroForCompare4: Float = new Float(0.0f);
      expect(result.isGreaterThan(zeroForCompare4)).assertTrue();
      let posInfinityFor7: Float = new Float(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(posInfinityFor7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0800
     * @tc.name testAdd008
     * @tc.desc Verify positive float plus positive float for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op9: Float = new Float(20.0f);
      let a9: Float = new Float(10.0f);
      let result: Float = a9.add(op9);
      let expectedValue: Float = new Float(30.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_0900
     * @tc.name testAdd009
     * @tc.desc Verify positive float plus negative float for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op10: Float = new Float(-1.0f);
      let a10: Float = new Float(3.0f);
      let result: Float = a10.add(op10);
      let expectedValue: Float = new Float(2.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1000
     * @tc.name testAdd010
     * @tc.desc Verify negative float plus negative float for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op11: Float = new Float(-2.0f);
      let a11: Float = new Float(-1.5f);
      let result: Float = a11.add(op11);
      let expectedValue: Float = new Float(-3.5f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1100
     * @tc.name testAdd011
     * @tc.desc Verify negative float plus positive float for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op12: Float = new Float(5.0f);
      let a12: Float = new Float(-3.0f);
      let result: Float = a12.add(op12);
      let expectedValue: Float = new Float(2.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1200
     * @tc.name testAdd012
     * @tc.desc Verify positive zero plus positive zero for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op13: Float = new Float(0.0f);
      let a13: Float = new Float(0.0f);
      let result: Float = a13.add(op13);
      let expectedZero: Float = new Float(0.0f);
      expect(result).assertEqual(expectedZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1300
     * @tc.name testAdd013
     * @tc.desc Verify negative zero plus positive zero for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op14: Float = new Float(0.0f);
      let a14: Float = new Float(-0.0f);
      let result: Float = a14.add(op14);
      let expectedZero: Float = new Float(0.0f);
      expect(result).assertEqual(expectedZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1400
     * @tc.name testAdd014
     * @tc.desc Verify positive float plus zero for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op15: Float = new Float(0.0f);
      let a15: Float = new Float(5.0f);
      let result: Float = a15.add(op15);
      let expectedValue: Float = new Float(5.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1500
     * @tc.name testAdd015
     * @tc.desc Verify zero plus negative float for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op16: Float = new Float(-3.0f);
      let a16: Float = new Float(0.0f);
      let result: Float = a16.add(op16);
      let expectedValue: Float = new Float(-3.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1600
     * @tc.name testAdd016
     * @tc.desc Verify NaN plus finite value for Float.add returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op17: Float = new Float(1.0f);
      let a17: Float = new Float(Float.NaN);
      let result: Float = a17.add(op17);
      let isNaNResult2: boolean = result.isNaN();
      expect(isNaNResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1700
     * @tc.name testAdd017
     * @tc.desc Verify positive Infinity plus finite positive for Float.add returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op18: Float = new Float(1.0f);
      let a18: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a18.add(op18);
      let isFiniteResult5: boolean = result.isFinite();
      expect(isFiniteResult5).assertFalse();
      let zeroForCompare5: Float = new Float(0.0f);
      expect(result.isGreaterThan(zeroForCompare5)).assertTrue();
      let posInfinityFor17: Float = new Float(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(posInfinityFor17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1800
     * @tc.name testAdd018
     * @tc.desc Verify negative Infinity plus finite negative for Float.add returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op19: Float = new Float(-1.0f);
      let a19: Float = new Float(Float.NEGATIVE_INFINITY);
      let result: Float = a19.add(op19);
      let isFiniteResult6: boolean = result.isFinite();
      expect(isFiniteResult6).assertFalse();
      let zeroForCompare6: Float = new Float(0.0f);
      expect(result.isLessThan(zeroForCompare6)).assertTrue();
      let negInfinityFor18: Float = new Float(Float.NEGATIVE_INFINITY);
      expect(result).assertEqual(negInfinityFor18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_1900
     * @tc.name testAdd019
     * @tc.desc Verify positive Infinity plus negative Infinity for Float.add returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op20: Float = new Float(Float.NEGATIVE_INFINITY);
      let a20: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a20.add(op20);
      let isNaNResult3: boolean = result.isNaN();
      expect(isNaNResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2000
     * @tc.name testAdd020
     * @tc.desc Verify positive Infinity plus positive Infinity for Float.add returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op21: Float = new Float(Float.POSITIVE_INFINITY);
      let a21: Float = new Float(Float.POSITIVE_INFINITY);
      let result: Float = a21.add(op21);
      let isFiniteResult7: boolean = result.isFinite();
      expect(isFiniteResult7).assertFalse();
      let zeroForCompare7: Float = new Float(0.0f);
      expect(result.isGreaterThan(zeroForCompare7)).assertTrue();
      let posInfinityFor20: Float = new Float(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(posInfinityFor20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2100
     * @tc.name testAdd021
     * @tc.desc Verify NaN plus NaN for Float.add returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op22: Float = new Float(Float.NaN);
      let a22: Float = new Float(Float.NaN);
      let result: Float = a22.add(op22);
      let isNaNResult4: boolean = result.isNaN();
      expect(isNaNResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2200
     * @tc.name testAdd022
     * @tc.desc Verify Float.MAX_VALUE plus 1.0f for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op23: Float = new Float(1.0f);
      let a23: Float = new Float(Float.MAX_VALUE);
      let result: Float = a23.add(op23);
      let isFiniteResult8: boolean = result.isFinite();
      expect(isFiniteResult8).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2300
     * @tc.name testAdd023
     * @tc.desc Verify Float.MIN_VALUE plus 0.0f for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op24: Float = new Float(0.0f);
      let a24: Float = new Float(Float.MIN_VALUE);
      let result: Float = a24.add(op24);
      let expectedMinValue: Float = new Float(Float.MIN_VALUE);
      expect(result).assertEqual(expectedMinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2400
     * @tc.name testAdd024
     * @tc.desc Verify large overflow for Float.add results in Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op25: Float = new Float(3.4e38f);
      let a25: Float = new Float(3.4e38f);
      let result: Float = a25.add(op25);
      let isFiniteResult9: boolean = result.isFinite();
      expect(isFiniteResult9).assertFalse();
      let zeroForCompare9: Float = new Float(0.0f);
      expect(result.isGreaterThan(zeroForCompare9)).assertTrue();
      let posInfinityFor24: Float = new Float(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(posInfinityFor24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2500
     * @tc.name testAdd025
     * @tc.desc Verify Float.add does not modify the current instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: Float = f.add(new Float(2.0f));
      let expectedFValue: Float = new Float(1.5f);
      expect(f).assertEqual(expectedFValue);
      let expectedResultValue: Float = new Float(3.5f);
      expect(result).assertEqual(expectedResultValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2600
     * @tc.name testAdd026
     * @tc.desc Verify Float.add returns a new instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      let result: Float = f.add(new Float(1.0f));
      let isSameReference: boolean = result === f;
      expect(isSameReference).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2700
     * @tc.name testAdd027
     * @tc.desc Verify Float.add return type is Float instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op26: Float = new Float(2.0f);
      let a26: Float = new Float(1.5f);
      let result: Float = a26.add(op26);
      let isCorrectValue: boolean = result.toFloat() === 3.5f;
      expect(isCorrectValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2800
     * @tc.name testAdd028
     * @tc.desc Verify Float.add result can call toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l1: Float = new Float(1.5f);
      let r1: Float = new Float(2.0f);
      let result: string = l1.add(r1).toString();
      expect(result).assertEqual('3.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2900
     * @tc.name testAdd029
     * @tc.desc Verify chain call for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op27: Float = new Float(2.0f);
      let a27: Float = new Float(1.0f);
      let result: Float = a27.add(op27).add(new Float(3.0f));
      let expectedValue: Float = new Float(6.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_3000
     * @tc.name testAdd030
     * @tc.desc Verify Float.MIN_VALUE subnormal addition for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op28: Float = new Float(Float.MIN_VALUE);
      let a28: Float = new Float(Float.MIN_VALUE);
      let result: Float = a28.add(op28);
      let isFiniteResult10: boolean = result.isFinite();
      expect(isFiniteResult10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_3100
     * @tc.name testAdd031
     * @tc.desc Verify add with default-constructed Float (initial value 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float();
      let result: Float = f.add(new Float(3.0f));
      let expectedValue: Float = new Float(3.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_3200
     * @tc.name testAdd032
     * @tc.desc Verify Float.add after narrowing Float|null union operand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let other: Float | null = new Float(2.0f);
      let f: Float = new Float(1.0f);
      expect(other !== null).assertTrue();
      let result: Float = f.add(other!);
      let expectedValue: Float = new Float(3.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_3300
     * @tc.name testAdd033
     * @tc.desc Verify Float.add after narrowing Float|undefined union operand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let other: Float | undefined = new Float(4.0f);
      let f: Float = new Float(3.0f);
      expect(other !== undefined).assertTrue();
      let result: Float = f.add(other!);
      let expectedValue: Float = new Float(7.0f);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_3400
     * @tc.name testAdd034
     * @tc.desc Verify add with 0 parameters throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float = new Float(1.5f);
      try {
        (f.add as Object as () => Float)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_3500
     * @tc.name testAdd035
     * @tc.desc Verify === operator behavior on Float objects vs primitives for Float.add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testAdd035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: Float = new Float(3.0f);
      let f2: Float = new Float(3.0f);
      // === compares values for Float (value semantics in ArkTS)
      let sameRef: boolean = f1 === f1;
      expect(sameRef).assertTrue();
      let sameValueDiffObj: boolean = f1 === f2;
      expect(sameValueDiffObj).assertTrue();
      // === directly on Float add result
      let operand: Float = new Float(2.0f);
      let result: Float = f1.add(operand);
      let expected: Float = new Float(5.0f);
      let directEquals: boolean = result === expected;
      expect(directEquals).assertTrue();
    });
  });
}
