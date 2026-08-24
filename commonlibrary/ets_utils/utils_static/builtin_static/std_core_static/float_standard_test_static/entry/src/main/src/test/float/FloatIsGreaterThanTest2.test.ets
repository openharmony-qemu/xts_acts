'use static'

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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function FloatIsGreaterThanTest2(): void {
  describe('FloatIsGreaterThanTest2', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0100
     * @tc.name testFloatIsGreaterThan001
     * @tc.desc Verify isGreaterThan(int 3, int 3, Float new Float(val1)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 3;
      const val2: int = 3;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const greaterResult: boolean = a.isGreaterThan(b);
      expect(greaterResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0200
     * @tc.name testFloatIsGreaterThan002
     * @tc.desc Verify isGreaterThan(int 2147483647, Float new Float(val), Float new Float(val)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      const greaterResult: boolean = a.isGreaterThan(b);
      expect(greaterResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0300
     * @tc.name testFloatIsGreaterThan003
     * @tc.desc Verify isGreaterThan(long 100, long 50, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 100;
      const val2: long = 50;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const greaterResult: boolean = a.isGreaterThan(b);
      expect(greaterResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0400
     * @tc.name testFloatIsGreaterThan004
     * @tc.desc Verify isGreaterThan(double 3.0, double 2.0, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = 3.0;
      const val2: double = 2.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const greaterResult: boolean = a.isGreaterThan(b);
      expect(greaterResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0500
     * @tc.name testFloatIsGreaterThan005
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing int 1 upcast to Object then cast back to int as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (n: int) => boolean = objFunc as (n: int) => boolean;
        fakeParamFunc(1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0600
     * @tc.name testFloatIsGreaterThan006
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing long type 1 as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (l: long) => boolean = objFunc as (l: long) => boolean;
        fakeParamFunc(1 as long);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0700
     * @tc.name testFloatIsGreaterThan007
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type 1.0 as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (d: double) => boolean = objFunc as (d: double) => boolean;
        fakeParamFunc(1.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0800
     * @tc.name testFloatIsGreaterThan008
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (b: boolean) => boolean = objFunc as (b: boolean) => boolean;
        fakeParamFunc(true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_0900
     * @tc.name testFloatIsGreaterThan009
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (c: char) => boolean = objFunc as (c: char) => boolean;
        fakeParamFunc(c'a');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1000
     * @tc.name testFloatIsGreaterThan010
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (arg: Object | null) => boolean = objFunc as (arg: Object | null) => boolean;
        fakeParamFunc(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1100
     * @tc.name testFloatIsGreaterThan011
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing digit string '1' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (s: string) => boolean = objFunc as (s: string) => boolean;
        fakeParamFunc('1');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1200
     * @tc.name testFloatIsGreaterThan012
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type new Object() as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (o: Object) => boolean = objFunc as (o: Object) => boolean;
        fakeParamFunc(new Object());
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1300
     * @tc.name testFloatIsGreaterThan013
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type [1.0, 2.0] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (a: float[]) => boolean = objFunc as (a: float[]) => boolean;
        fakeParamFunc([1.0, 2.0]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1400
     * @tc.name testFloatIsGreaterThan014
     * @tc.desc Verify isGreaterThan() does not modify the original Float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      const original: float = f.toFloat();
      f.isGreaterThan(new Float(2.0));
      const greaterResult: float = f.toFloat();
      expect(greaterResult).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1500
     * @tc.name testFloatIsGreaterThan015
     * @tc.desc Verify isGreaterThan idempotency: multiple calls with the same input return the same boolean result (2.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0);
      const b: Float = new Float(1.0);
      const r1: boolean = a.isGreaterThan(b);
      const r2: boolean = a.isGreaterThan(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1600
     * @tc.name testFloatIsGreaterThan016
     * @tc.desc Verify isGreaterThan() throws ClassCastError when calling with no arguments (empty parameter)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: () => boolean = objFunc as () => boolean;
        fakeParamFunc();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1700
     * @tc.name testFloatIsGreaterThan017
     * @tc.desc Verify isGreaterThan(float 4.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      const greaterResult: boolean = f.isGreaterThan(new Float(3.0));
      expect(greaterResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1800
     * @tc.name testFloatIsGreaterThan018
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type '4e2d6587' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (s: string) => Float = objFunc as (s: string) => Float;
        fakeParamFunc('4e2d6587');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_1900
     * @tc.name testFloatIsGreaterThan019
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type longStr as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const longStr: string = 'x'.repeat(65535);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (s: string) => Float = objFunc as (s: string) => Float;
        fakeParamFunc(longStr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2000
     * @tc.name testFloatIsGreaterThan020
     * @tc.desc Verify isGreaterThan with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [];
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (a: int[]) => Float = objFunc as (a: int[]) => Float;
        fakeParamFunc(arr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2100
     * @tc.name testFloatIsGreaterThan021
     * @tc.desc Verify isGreaterThan with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: Object[] = [1, 'test', true];
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (a: Object[]) => Float = objFunc as (a: Object[]) => Float;
        fakeParamFunc(arr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2200
     * @tc.name testFloatIsGreaterThan022
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [];
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (m: int[][]) => Float = objFunc as (m: int[][]) => Float;
        fakeParamFunc(matrix);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2300
     * @tc.name testFloatIsGreaterThan023
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (l: Array<string>) => Float = objFunc as (l: Array<string>) => Float;
        fakeParamFunc(list);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2400
     * @tc.name testFloatIsGreaterThan024
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type 123.45 as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (b: Double) => Float = objFunc as (b: Double) => Float;
        fakeParamFunc(123.45);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2500
     * @tc.name testFloatIsGreaterThan025
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type bigVal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const bigVal: bigint = 123n;
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (bigVal: bigint) => boolean = objFunc as (bigVal: bigint) => boolean;
        fakeParamFunc(bigVal);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2600
     * @tc.name testFloatIsGreaterThan026
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type dateVal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (dateVal: Date) => boolean = objFunc as (dateVal: Date) => boolean;
        fakeParamFunc(dateVal);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2700
     * @tc.name testFloatIsGreaterThan027
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type regVal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test', '');
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (regVal: RegExp) => boolean = objFunc as (regVal: RegExp) => boolean;
        fakeParamFunc(regVal);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2800
     * @tc.name testFloatIsGreaterThan028
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type typedArr as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const typedArr: Int8Array = new Int8Array(4);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (typedArr: Int8Array) => boolean = objFunc as (typedArr: Int8Array) => boolean;
        fakeParamFunc(typedArr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_2900
     * @tc.name testFloatIsGreaterThan029
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const rec: Record<string, number> = {'key': 1};
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (rec: Record<string, number>) => boolean = objFunc as (rec: Record<string, number>) => boolean;
        fakeParamFunc(rec);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3000
     * @tc.name testFloatIsGreaterThan030
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (wm: WeakMap<Object, int>) => boolean = objFunc as (wm: WeakMap<Object, int>) => boolean;
        fakeParamFunc(wm);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3100
     * @tc.name testFloatIsGreaterThan031
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (ws: WeakSet<Object>) => boolean = objFunc as (ws: WeakSet<Object>) => boolean;
        fakeParamFunc(ws);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3200
     * @tc.name testFloatIsGreaterThan032
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing unsupported type jsonData as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const jsonData: Object = {};
      try {
        let methodFunc = f.isGreaterThan;
        const objFunc: Object = methodFunc as Object;
        let fakeParamFunc: (jsonData: Object) => boolean = objFunc as (jsonData: Object) => boolean;
        fakeParamFunc(jsonData);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3300
     * @tc.name testFloatIsGreaterThan033
     * @tc.desc Verify isGreaterThan( new Float(3.14f)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const result: boolean = a.isGreaterThan(a);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3400
     * @tc.name testFloatIsGreaterThan034
     * @tc.desc Verify isGreaterThan( new Float(-3.14f)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.14f);
      const result: boolean = a.isGreaterThan(a);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3500
     * @tc.name testFloatIsGreaterThan035
     * @tc.desc Verify isGreaterThan( new Float(3.0f),  new Float(2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(2.0f);
      const c: Float = new Float(1.0f);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isGreaterThan(c)).assertTrue();
      expect(a.isGreaterThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3600
     * @tc.name testFloatIsGreaterThan036
     * @tc.desc Verify isGreaterThan( new Float(-1.0f),  new Float(-2.0f)) returns true (chained 3 elements)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0f);
      const b: Float = new Float(-2.0f);
      const c: Float = new Float(-3.0f);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isGreaterThan(c)).assertTrue();
      expect(a.isGreaterThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3700
     * @tc.name testFloatIsGreaterThan037
     * @tc.desc Verify isGreaterThan(new Float(3.0f), new Float(2.0f)) returns true, and isGreaterThan(new Float(2.0f), new Float(2.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(2.0f);
      const c: Float = new Float(2.0f);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isGreaterThan(c)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3800
     * @tc.name testFloatIsGreaterThan038
     * @tc.desc Verify isGreaterThan( new Float(2.0f),  new Float(1.0f)) equaling notGreaterEqual
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(1.0f);
      const greaterThan: boolean = a.isGreaterThan(b);
      let notGreaterEqual = !b.isGreaterEqualThan(a);
      expect(greaterThan).assertEqual(notGreaterEqual);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_3900
     * @tc.name testFloatIsGreaterThan039
     * @tc.desc Verify isGreaterThan( new Float(Float.MIN_VALUE),  new Float(Float.MIN_VALUE / 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(Float.MIN_VALUE / 2.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4000
     * @tc.name testFloatIsGreaterThan040
     * @tc.desc Verify isGreaterThan( new Float(Float.MIN_VALUE / 2.0f),  new Float(0.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE / 2.0f);
      const b: Float = new Float(0.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4100
     * @tc.name testFloatIsGreaterThan041
     * @tc.desc Verify isGreaterThan( new Float(1.0f + Float.EPSILON / 2.0f),  new Float(1.0f)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f + Float.EPSILON / 2.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4200
     * @tc.name testFloatIsGreaterThan042
     * @tc.desc Verify isGreaterThan( new Float(1.0f + Float.EPSILON * 2.0f),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f + Float.EPSILON * 2.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4300
     * @tc.name testFloatIsGreaterThan043
     * @tc.desc Verify isGreaterThan( new Float(1.0e10f + 1000.0f),  new Float(1.0e10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f + 1000.0f);
      const b: Float = new Float(1.0e10f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4400
     * @tc.name testFloatIsGreaterThan044
     * @tc.desc Verify isGreaterThan( new Float(1.0e10f),  new Float(1.0e10f + 1000.0f)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f + 1000.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4500
     * @tc.name testFloatIsGreaterThan045
     * @tc.desc Verify isGreaterThan( new Float(2.0e-10f),  new Float(1.0e-10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0e-10f);
      const b: Float = new Float(1.0e-10f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4600
     * @tc.name testFloatIsGreaterThan046
     * @tc.desc Verify isGreaterThan( new Float(1.0e-10f),  new Float(2.0e-10f)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-10f);
      const b: Float = new Float(2.0e-10f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4700
     * @tc.name testFloatIsGreaterThan047
     * @tc.desc Verify isGreaterThan(new Float(3.14f), new Float(3.14f)) returns false for equal values, isGreaterEqualThan returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(3.14f);
      expect(a.isGreaterEqualThan(b)).assertTrue();
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4800
     * @tc.name testFloatIsGreaterThan048
     * @tc.desc Verify isGreaterThan( new Float(2.0f),  new Float(1.0f)) equaling compareResult
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(1.0f);
      const greaterThan: boolean = a.isGreaterThan(b);
      const compareResult: boolean = a.compareTo(b) === 1;
      expect(greaterThan).assertEqual(compareResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_4900
     * @tc.name testFloatIsGreaterThan049
     * @tc.desc Verify isGreaterThan(1.0f, 2.0f) returns false and compareTo returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      expect(a.compareTo(b)).assertEqual(-1);
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5000
     * @tc.name testFloatIsGreaterThan050
     * @tc.desc Verify isGreaterThan(7.77f, 7.77f) returns false and compareTo returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(7.77f);
      const b: Float = new Float(7.77f);
      expect(a.compareTo(b)).assertEqual(0);
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5100
     * @tc.name testFloatIsGreaterThan051
     * @tc.desc Verify isGreaterThan idempotency: multiple calls with the same input return the same boolean result (2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(1.0f);
      const idemResult1: boolean = a.isGreaterThan(b);
      const idemResult2: boolean = a.isGreaterThan(b);
      const idemResult3: boolean = a.isGreaterThan(b);
      expect(idemResult1).assertEqual(idemResult2);
      expect(idemResult2).assertEqual(idemResult3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5200
     * @tc.name testFloatIsGreaterThan052
     * @tc.desc Verify isGreaterThan( new Float(2.5f),  new Float(1.5f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.5f);
      const b: Float = new Float(1.5f);
      const result: boolean = a.isGreaterThan(b);
      const aAfter: Float = new Float(2.5f);
      expect(a.isGreaterEqualThan(aAfter) && aAfter.isGreaterEqualThan(a)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5300
     * @tc.name testFloatIsGreaterThan053
     * @tc.desc Verify isGreaterThan( new Float(2.5),  new Float(1.5)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.5);
      const b: Float = new Float(1.5);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5400
     * @tc.name testFloatIsGreaterThan054
     * @tc.desc Verify isGreaterThan( new Float(2.0),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5500
     * @tc.name testFloatIsGreaterThan055
     * @tc.desc Verify isGreaterThan( new Float(1.0f),  new Float()) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float();
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5600
     * @tc.name testFloatIsGreaterThan056
     * @tc.desc Verify isGreaterThan( new Float(),  new Float()) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float();
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5700
     * @tc.name testFloatIsGreaterThan057
     * @tc.desc Verify isGreaterThan( new Float(Float.MAX_SAFE_INTEGER + 1.0f),  new Float(Float.MAX_SAFE_INTEGER)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5800
     * @tc.name testFloatIsGreaterThan058
     * @tc.desc Verify isGreaterThan( new Float(Float.MAX_SAFE_INTEGER),  new Float(Float.MAX_SAFE_INTEGER)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_5900
     * @tc.name testFloatIsGreaterThan059
     * @tc.desc Verify isGreaterThan( new Float(Float.MAX_SAFE_INTEGER),  new Float(Float.MAX_SAFE_INTEGER)) returns
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6000
     * @tc.name testFloatIsGreaterThan060
     * @tc.desc Verify isGreaterThan( new Float(3.14f),  new Float(3.14f)) returns false, confirming the value is not greater than the compared value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(3.14f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6100
     * @tc.name testFloatIsGreaterThan061
     * @tc.desc Verify isGreaterThan( new Float(Float.POSITIVE_INFINITY),  new Float(Float.MAX_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(Float.MAX_VALUE);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6200
     * @tc.name testFloatIsGreaterThan062
     * @tc.desc Verify isGreaterThan( new Float(Float.MAX_VALUE),  new Float(Float.NEGATIVE_INFINITY)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6300
     * @tc.name testFloatIsGreaterThan063
     * @tc.desc Verify isGreaterThan( new Float(-1.0f),  new Float(-Float.MAX_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0f);
      const b: Float = new Float(-Float.MAX_VALUE);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6400
     * @tc.name testFloatIsGreaterThan064
     * @tc.desc Verify isGreaterThan( new Float(values[i]),  new Float(values[j])) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: float[] = [-3.0f, -1.0f, 0.0f, 1.0f, 3.0f, 100.0f];
      let allSymmetric: boolean = true;
      for (let i = 0; i < values.length; i++) {
        for (let j = 0; j < values.length; j++) {
          const a: Float = new Float(values[i]);
          const b: Float = new Float(values[j]);
          if (a.isGreaterThan(b) !== b.isLessThan(a)) {
            allSymmetric = false;
            expect(allSymmetric).assertTrue();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6500
     * @tc.name testFloatIsGreaterThan065
     * @tc.desc Verify isGreaterThan(new Float(3.0f), new Float(1.5f)) returns true, confirming 3.0f is greater than 1.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(1.5f);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isGreaterThan(a)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6600
     * @tc.name testFloatIsGreaterThan066
     * @tc.desc Verify isGreaterThan( new Float(1.0e3f),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e3f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6700
     * @tc.name testFloatIsGreaterThan067
     * @tc.desc Verify isGreaterThan( new Float(1.0e-5f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-5f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6800
     * @tc.name testFloatIsGreaterThan068
     * @tc.desc Verify isGreaterThan( new Float(-2147483648),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_6900
     * @tc.name testFloatIsGreaterThan069
     * @tc.desc Verify isGreaterThan( new Float(127),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7000
     * @tc.name testFloatIsGreaterThan070
     * @tc.desc Verify isGreaterThan( new Float(-128),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7100
     * @tc.name testFloatIsGreaterThan071
     * @tc.desc Verify isGreaterThan( new Float(32767),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7200
     * @tc.name testFloatIsGreaterThan072
     * @tc.desc Verify isGreaterThan( new Float(-32768),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7300
     * @tc.name testFloatIsGreaterThan073
     * @tc.desc Verify bitCastFromInt: result from expression returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7400
     * @tc.name testFloatIsGreaterThan074
     * @tc.desc Verify bitCastFromInt: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x40000000));
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7500
     * @tc.name testFloatIsGreaterThan075
     * @tc.desc Verify isGreaterThan( new Float(Float.NEGATIVE_INFINITY),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7600
     * @tc.name testFloatIsGreaterThan076
     * @tc.desc Verify isGreaterThan( new Float(-0.0f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-0.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7700
     * @tc.name testFloatIsGreaterThan077
     * @tc.desc Verify isGreaterThan( new Float(Float.MIN_VALUE),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7800
     * @tc.name testFloatIsGreaterThan078
     * @tc.desc Verify isGreaterThan with Float.DELTA and Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.EPSILON);
      const b: Float = new Float(Float.DELTA);
      const result: boolean = a.isGreaterThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATERTHAN_2_7900
     * @tc.name testFloatIsGreaterThan079
     * @tc.desc Verify isGreaterThan throws ClassCastError when passing null as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterThan079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.isGreaterThan(null as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

  });
}
