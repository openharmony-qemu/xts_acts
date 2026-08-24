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
class JsonData {
  key: int = 0;
}

export default function FloatConstructor3Test2(): void {
  describe('FloatConstructor3Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0100
     * @tc.name testFloatConstructorDouble001
     * @tc.desc Verify isFinite() on Float(9223372036854775807) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 9223372036854775807;
      const f: Float = new Float(val);
      expect(f.isFinite()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0200
     * @tc.name testFloatConstructorDouble002
     * @tc.desc Verify toFloat() on Float(-3.14) returns -3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = -3.14;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(-3.14f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0300
     * @tc.name testFloatConstructorDouble003
     * @tc.desc Verify toFloat() on Float(-1.0e-50) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = -1.0e-50;
      const f: Float = new Float(val);
      expect(1.0f / f.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0400
     * @tc.name testFloatConstructorDouble004
     * @tc.desc Verify 1.0f / toFloat() on Float(0.0) returns Float.POSITIVE_INFINITY (confirming sign of zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 0.0;
      const f: Float = new Float(val);
      const signCheck: float = 1.0f / f.toFloat();
      expect(Float.isFinite(signCheck)).assertFalse(); expect(Float.isNaN(signCheck)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0500
     * @tc.name testFloatConstructorDouble005
     * @tc.desc Verify 1.0f / toFloat() on Float(-0.0) returns Float.NEGATIVE_INFINITY (confirming sign of negative zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = -0.0;
      const f: Float = new Float(val);
      const signCheck: float = 1.0f / f.toFloat();
      expect(Float.isFinite(signCheck)).assertFalse(); expect(Float.isNaN(signCheck)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0600
     * @tc.name testFloatConstructorDouble006
     * @tc.desc Verify toFloat() on Float(1.5f) returns 1.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(1.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0700
     * @tc.name testFloatConstructorDouble007
     * @tc.desc Verify toFloat() on Float(1.0f) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 1.0f;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0800
     * @tc.name testFloatConstructorDouble008
     * @tc.desc Verify toFloat() on Float(-1024.0f) returns -1024.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = -1024.0f;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(-1024.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_0900
     * @tc.name testFloatConstructorDouble009
     * @tc.desc Verify toFloat() on Float(1.0e-10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 1.0e-10;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertLarger(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1000
     * @tc.name testFloatConstructorDouble010
     * @tc.desc Verify toFloat() on Float(1.0e6) returns 1000000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 1.0e6;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(1000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1100
     * @tc.name testFloatConstructorDouble011
     * @tc.desc Verify Float constructor: toFloat() on double value Double.NaN, isNaN returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = Double.NaN;
      const f: Float = new Float(val);
      expect(isNaN(f.toFloat())).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1200
     * @tc.name testFloatConstructorDouble012
     * @tc.desc Verify toFloat() on Float(16777219.0) returns 16777220.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 16777219.0;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(16777220.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1300
     * @tc.name testFloatConstructorDouble013
     * @tc.desc Verify toFloat() on Float(1.0000000000000001) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 1.0000000000000001;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1400
     * @tc.name testFloatConstructorDouble014
     * @tc.desc Verify constructor(true) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(true as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1500
     * @tc.name testFloatConstructorDouble015
     * @tc.desc Verify constructor([1]) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float([1] as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1600
     * @tc.name testFloatConstructorDouble016
     * @tc.desc Verify constructor(new Object()) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(new Object() as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1700
     * @tc.name testFloatConstructorDouble017
     * @tc.desc Verify constructor(new Map<string, double>()) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(new Map<string, double>() as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1800
     * @tc.name testFloatConstructorDouble018
     * @tc.desc Verify constructor with Chinese string argument throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float('中文' as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_1900
     * @tc.name testFloatConstructorDouble019
     * @tc.desc Verify constructor('x'.repeat(65535)) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(longStr as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2000
     * @tc.name testFloatConstructorDouble020
     * @tc.desc Verify Float constructor with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(arr as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2100
     * @tc.name testFloatConstructorDouble021
     * @tc.desc Verify Float constructor with mixed array [1, 'test', true] throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(arr as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2200
     * @tc.name testFloatConstructorDouble022
     * @tc.desc Verify constructor(matrix) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(matrix as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2300
     * @tc.name testFloatConstructorDouble023
     * @tc.desc Verify constructor(list) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(list as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2400
     * @tc.name testFloatConstructorDouble024
     * @tc.desc Verify constructor(123n) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(123n as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2500
     * @tc.name testFloatConstructorDouble025
     * @tc.desc Verify toFloat() on Float(Float.NaN) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2600
     * @tc.name testFloatConstructorDouble026
     * @tc.desc Verify constructor with empty Object cast to double throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float({} as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2700
     * @tc.name testFloatConstructorDouble027
     * @tc.desc Verify constructor(new JsonData()) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        new Float(jsonData as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2800
     * @tc.name testFloatConstructorDouble028
     * @tc.desc Verify constructor(123n) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: bigint = 123n;
      try {
        new Float(bigVal as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_2900
     * @tc.name testFloatConstructorDouble029
     * @tc.desc Verify constructor(new Date()) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        new Float(dateVal as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3000
     * @tc.name testFloatConstructorDouble030
     * @tc.desc Verify constructor(new RegExp('test')) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        new Float(regVal as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3100
     * @tc.name testFloatConstructorDouble031
     * @tc.desc Verify constructor(rec) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = { 'key': 1 };
      try {
        new Float(rec as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3200
     * @tc.name testFloatConstructorDouble032
     * @tc.desc Verify constructor(wm) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        new Float(wm as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3300
     * @tc.name testFloatConstructorDouble033
     * @tc.desc Verify new Float(double) throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        new Float(ws as Object as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3400
     * @tc.name testFloatConstructorDouble034
     * @tc.desc Verify Float constructor: toFloat() on float value 1.0e-6, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e-6);
      expect(value.toFloat()).assertClose(0.000001, Float.EPSILON);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3500
     * @tc.name testFloatConstructorDouble035
     * @tc.desc Verify Float constructor: toFloat() on double value -1.0e-6 returns approx -0.000001 and is less than 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-1.0e-6);
      expect(value.toFloat()).assertClose(-0.000001, Float.EPSILON);
      expect(value.isLessThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3600
     * @tc.name testFloatConstructorDouble036
     * @tc.desc Verify toFloat() on Float(-1.0e6) returns -1000000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-1.0e6);
      expect(value.toFloat()).assertEqual(-1000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3700
     * @tc.name testFloatConstructorDouble037
     * @tc.desc Verify isFinite() on Float(1.0e10) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e10);
      expect(value.isFinite()).assertTrue();
      expect(value.toFloat()).assertClose(1.0e10, 1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3800
     * @tc.name testFloatConstructorDouble038
     * @tc.desc Verify isFinite() on Float(1.0e-20) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e-20);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_3900
     * @tc.name testFloatConstructorDouble039
     * @tc.desc Verify isFinite() on Float(1.0e-45) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e-45);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4000
     * @tc.name testFloatConstructorDouble040
     * @tc.desc Verify isFinite() on Float(1.0 / 3.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0 / 3.0);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(0.0))).assertTrue();
      expect(value.isLessThan(new Float(1.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4100
     * @tc.name testFloatConstructorDouble041
     * @tc.desc Verify toFloat() on Float(0.25) returns 0.25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(0.25);
      expect(value.toFloat()).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4200
     * @tc.name testFloatConstructorDouble042
     * @tc.desc Verify toFloat() on Float(2.0) returns 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: Array<number> = [2.0, 4.0, 8.0, 16.0];
      for (const input of testCases) {
        const value: Float = new Float(input);
        expect(value.toFloat()).assertEqual(input);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4300
     * @tc.name testFloatConstructorDouble043
     * @tc.desc Verify isFinite() on Float(-3.4028234E38) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-3.4028234E38);
      expect(value.isFinite()).assertTrue();
      expect(value.isLessThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4400
     * @tc.name testFloatConstructorDouble044
     * @tc.desc Verify isFinite() on Float(Float.MAX_VALUE) returns Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MAX_VALUE);
      expect(value.isFinite()).assertTrue();
      expect(value.toFloat()).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4500
     * @tc.name testFloatConstructorDouble045
     * @tc.desc Verify isFinite() on Float(Float.MIN_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MIN_VALUE);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4600
     * @tc.name testFloatConstructorDouble046
     * @tc.desc Verify isFinite() on Float(3.4028235E38) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(3.4028235E38);
      expect(value.isFinite()).assertTrue();
      const diff: float = value.toFloat() - Float.MAX_VALUE;
      const isClose: boolean = Math.abs(diff) <= 0.0 || Math.abs(diff) <= 1.0e33;
      expect(isClose).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4700
     * @tc.name testFloatConstructorDouble047
     * @tc.desc Verify toFloat() on Float(1.0e-46) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e-46);
      expect(value.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4800
     * @tc.name testFloatConstructorDouble048
     * @tc.desc Verify toFloat() on Float(-1.0e-46) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-1.0e-46);
      expect(1.0f / value.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_4900
     * @tc.name testFloatConstructorDouble049
     * @tc.desc Verify isFinite() on Float(7.0e-46) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(7.0e-46);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterEqualThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5000
     * @tc.name testFloatConstructorDouble050
     * @tc.desc Verify isFinite() on Float(2147483647.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(2147483647.0);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5100
     * @tc.name testFloatConstructorDouble051
     * @tc.desc Verify isFinite() on Float(2147483648.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(2147483648.0);
      expect(value.isFinite()).assertTrue();
      expect(value.toFloat()).assertClose(2147483648.0, 1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5200
     * @tc.name testFloatConstructorDouble052
     * @tc.desc Verify isFinite() on Float(9007199254740991.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(9007199254740991.0);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5300
     * @tc.name testFloatConstructorDouble053
     * @tc.desc Verify isFinite() on Float(-2147483648.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-2147483648.0);
      expect(value.isFinite()).assertTrue();
      expect(value.isLessThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5400
     * @tc.name testFloatConstructorDouble054
     * @tc.desc Verify isFinite() on Float(9007199254740992.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(9007199254740992.0);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5500
     * @tc.name testFloatConstructorDouble055
     * @tc.desc Verify add(new Float(2.5)) returns 4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(1.5).add(new Float(2.5));
      expect(result.toFloat()).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5600
     * @tc.name testFloatConstructorDouble056
     * @tc.desc Verify div: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(10.0).div(new Float(3.0));
      expect(result.isFinite()).assertTrue();
      expect(result.isGreaterThan(new Float(3.33))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5700
     * @tc.name testFloatConstructorDouble057
     * @tc.desc Verify mul(new Float(2.0)) returns 10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(5.0).mul(new Float(2.0));
      expect(result.toFloat()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5800
     * @tc.name testFloatConstructorDouble058
     * @tc.desc Verify sub( new Float(10.5),  new Float(3.2)) returns approx 7.3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.5);
      const b: Float = new Float(3.2);
      const result: Float = a.sub(b);
      expect(result.toFloat()).assertClose(7.3, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_5900
     * @tc.name testFloatConstructorDouble059
     * @tc.desc Verify add( new Float(0.1),  new Float(0.2)) returns approx 0.3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.1);
      const b: Float = new Float(0.2);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertClose(0.3, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6000
     * @tc.name testFloatConstructorDouble060
     * @tc.desc Verify mul( new Float(10000.0),  new Float(10000.0)) returns 100000000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10000.0);
      const b: Float = new Float(10000.0);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(100000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6100
     * @tc.name testFloatConstructorDouble061
     * @tc.desc Verify div( new Float(1.0)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0);
      const zero: Float = new Float(0.0);
      const result: Float = a.div(zero);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6200
     * @tc.name testFloatConstructorDouble062
     * @tc.desc Verify isLessThan( new Float(3.14),  new Float(3.15)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14);
      const b: Float = new Float(3.15);
      expect(a.isLessThan(b)).assertTrue();
      expect(b.isLessThan(a)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6300
     * @tc.name testFloatConstructorDouble063
     * @tc.desc Verify isLessEqualThan( new Float(5.0),  new Float(5.0)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5.0);
      const b: Float = new Float(5.0);
      const c: Float = new Float(5.1);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(a.isLessEqualThan(c)).assertTrue();
      expect(c.isLessEqualThan(a)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6400
     * @tc.name testFloatConstructorDouble064
     * @tc.desc Verify isGreaterThan( new Float(100.0),  new Float(99.99)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(100.0);
      const b: Float = new Float(99.99);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isGreaterThan(a)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6500
     * @tc.name testFloatConstructorDouble065
     * @tc.desc Verify isGreaterEqualThan( new Float(7.0),  new Float(7.0)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(7.0);
      const b: Float = new Float(7.0);
      const c: Float = new Float(6.9);
      expect(a.isGreaterEqualThan(b)).assertTrue();
      expect(a.isGreaterEqualThan(c)).assertTrue();
      expect(c.isGreaterEqualThan(a)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6600
     * @tc.name testFloatConstructorDouble066
     * @tc.desc Verify new Float(double): compareTo returns negative, positive, and zero for different values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0);
      const b: Float = new Float(2.0);
      const c: Float = new Float(1.0);
      expect(a.compareTo(b)).assertLess(0);
      expect(b.compareTo(a)).assertLarger(0);
      expect(a.compareTo(c)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6700
     * @tc.name testFloatConstructorDouble067
     * @tc.desc Verify equals( new Float(3.14),  new Float(3.14)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14);
      const b: Float = new Float(3.14);
      const c: Float = new Float(3.15);
      expect(a.equals(b)).assertTrue();
      expect(a.equals(c)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6800
     * @tc.name testFloatConstructorDouble068
     * @tc.desc Verify toByte() on Float(42.7) returns 42 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(42.7);
      expect(value.toByte()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_6900
     * @tc.name testFloatConstructorDouble069
     * @tc.desc Verify toShort() on Float(12345.67) returns 12345 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(12345.67);
      expect(value.toShort()).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7000
     * @tc.name testFloatConstructorDouble070
     * @tc.desc Verify toInt() on Float(99999.99) returns 99999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(99999.99);
      expect(value.toInt()).assertEqual(99999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7100
     * @tc.name testFloatConstructorDouble071
     * @tc.desc Verify Float constructor: toDouble() on float value 3.14, result is double value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(3.14);
      const d: double = value.toDouble();
      const isClose: boolean = Math.abs(d - 3.14) < 1.0e-6;
      expect(isClose).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7200
     * @tc.name testFloatConstructorDouble072
     * @tc.desc Verify isNaN() on Float(42.0) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(42.0);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7300
     * @tc.name testFloatConstructorDouble073
     * @tc.desc Verify isNaN() on Float(Double.NaN) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Double.NaN);
      expect(value.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7400
     * @tc.name testFloatConstructorDouble074
     * @tc.desc Verify isInteger() on Float(100.0) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intValue: Float = new Float(100.0);
      const fracValue: Float = new Float(100.5);
      expect(intValue.isInteger()).assertTrue();
      expect(fracValue.isInteger()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7500
     * @tc.name testFloatConstructorDouble075
     * @tc.desc Verify isSafeInteger() on Float(1000.0) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const safeValue: Float = new Float(1000.0);
      const largeValue: Float = new Float(20000000.0);
      expect(safeValue.isSafeInteger()).assertTrue();
      const isSafeCheck: boolean = largeValue.isSafeInteger();
      expect(isSafeCheck).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7600
     * @tc.name testFloatConstructorDouble076
     * @tc.desc Verify toFloat() on Float(1.0) returns 0x3f800000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0);
      const bits: int = Float.bitCastToInt(value.toFloat());
      expect(bits).assertEqual(0x3f800000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7700
     * @tc.name testFloatConstructorDouble077
     * @tc.desc Verify toFloat() on Float(-2.0) returns 0xc0000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-2.0);
      const bits: int = Float.bitCastToInt(value.toFloat());
      expect(bits).assertEqual(-1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7800
     * @tc.name testFloatConstructorDouble078
     * @tc.desc Verify Float(1.5) and Float(1.5f) are equal and have same toFloat() result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromDouble: Float = new Float(1.5);
      const fromFloat: Float = new Float(1.5f);
      expect(fromDouble.equals(fromFloat)).assertTrue();
      expect(fromDouble.toFloat()).assertEqual(fromFloat.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_7900
     * @tc.name testFloatConstructorDouble079
     * @tc.desc Verify Float(0.0) and Float(0.0f) have same toFloat() result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromDouble: Float = new Float(0.0);
      const fromFloat: Float = new Float(0.0f);
      expect(fromDouble.toFloat()).assertEqual(fromFloat.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8000
     * @tc.name testFloatConstructorDouble080
     * @tc.desc Verify 1.0 / Float(-0.0).toFloat() equals 1.0 / Float(-0.0f).toFloat() (both negative infinity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromDouble: Float = new Float(-0.0);
      const fromFloat: Float = new Float(-0.0f);
      expect(1.0 / fromDouble.toFloat()).assertEqual(1.0 / fromFloat.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8100
     * @tc.name testFloatConstructorDouble081
     * @tc.desc Verify toFloat() on Float(1.0), Float(2.0), Float(3.0) returns 1.0, 2.0, 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0);
      const b: Float = new Float(2.0);
      const c: Float = new Float(3.0);
      expect(a.toFloat()).assertEqual(1.0);
      expect(b.toFloat()).assertEqual(2.0);
      expect(c.toFloat()).assertEqual(3.0);
      expect(a.equals(b)).assertFalse();
      expect(b.equals(c)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8200
     * @tc.name testFloatConstructorDouble082
     * @tc.desc Verify constructor(val as double) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const val: double | null = null;
        new Float(val as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8300
     * @tc.name testFloatConstructorDouble083
     * @tc.desc Verify constructor(val) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const val: double | undefined = undefined;
        new Float(val as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8400
     * @tc.name testFloatConstructorDouble084
     * @tc.desc Verify Float constructed from toFloat() of another Float(3.14) is equal to the original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Float = new Float(3.14);
      const copy: Float = new Float(original.toFloat());
      expect(copy.equals(original)).assertTrue();
      expect(copy.toFloat()).assertEqual(original.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8500
     * @tc.name testFloatConstructorDouble085
     * @tc.desc Verify Float constructor: toFloat() on double value 2.71828, reconstructing from toFloat() result yields equal Float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Float = new Float(2.71828);
      const copy: Float = new Float(original.toFloat() as float);
      expect(copy.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8600
     * @tc.name testFloatConstructorDouble086
     * @tc.desc Verify toFloat() on Float(5.0) returns 10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5.0);
      const b: Float = new Float(a.toFloat());
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8700
     * @tc.name testFloatConstructorDouble087
     * @tc.desc Verify toFloat() on Float((1.0 + 2.0) returns 9.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float((1.0 + 2.0) * 3.0);
      expect(value.toFloat()).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8800
     * @tc.name testFloatConstructorDouble088
     * @tc.desc Verify isFinite() on Float(Math.sqrt(2.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Math.sqrt(2.0));
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(1.414))).assertTrue();
      expect(value.isLessThan(new Float(1.415))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_8900
     * @tc.name testFloatConstructorDouble089
     * @tc.desc Verify isFinite() on Float(Math.PI) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Math.PI);
      expect(value.isFinite()).assertTrue();
      expect(value.isGreaterThan(new Float(3.14159))).assertTrue();
      expect(value.isLessThan(new Float(3.141593))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_9000
     * @tc.name testFloatConstructorDouble090
     * @tc.desc Verify constructor(double) with Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Double.POSITIVE_INFINITY);
      expect(f.isFinite()).assertFalse();
      expect(f.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_9100
     * @tc.name testFloatConstructorDouble091
     * @tc.desc Verify constructor(double) with Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Double.NEGATIVE_INFINITY);
      expect(f.isFinite()).assertFalse();
      expect(f.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_9200
     * @tc.name testFloatConstructorDouble092
     * @tc.desc Verify constructor(double) with Double.MAX_VALUE converts to Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Double.MAX_VALUE);
      expect(f.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_9300
     * @tc.name testFloatConstructorDouble093
     * @tc.desc Verify constructor(double) with -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-0.0);
      expect(1.0f / f.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_DOUBLE_9400
     * @tc.name testFloatConstructorDouble094
     * @tc.desc Verify constructor(double) with 1.0e-308 (extreme small double)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorDouble094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0e-308);
      expect(f.toFloat()).assertEqual(0.0f);
    });
  })
}
