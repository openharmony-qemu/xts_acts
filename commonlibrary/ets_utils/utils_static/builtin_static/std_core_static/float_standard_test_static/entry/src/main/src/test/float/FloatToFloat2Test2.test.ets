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

export default function FloatToFloat2Test2(): void {
  describe('FloatToFloat2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0100
     * @tc.name testFloatToFloat001
     * @tc.desc Verify Float.toFloat(int 42) returns 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      expect(Float.toFloat(val)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0200
     * @tc.name testFloatToFloat002
     * @tc.desc Verify Float.toFloat(int 2147483647): isFinite returns boolean true, value is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      expect(isFinite(Float.toFloat(val))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0300
     * @tc.name testFloatToFloat003
     * @tc.desc Verify Float.toFloat(long 100) returns 100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      expect(Float.toFloat(val)).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0400
     * @tc.name testFloatToFloat004
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toFloat(null as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0500
     * @tc.name testFloatToFloat005
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.toFloat(bVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0600
     * @tc.name testFloatToFloat006
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing unsupported type '1.0' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = '1.0';
        Float.toFloat(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0700
     * @tc.name testFloatToFloat007
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.toFloat(obj as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0800
     * @tc.name testFloatToFloat008
     * @tc.desc Verify Float.toFloat idempotency: multiple calls with float value 42.0f return the same float result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      const r1: float = Float.toFloat(val);
      const r2: float = Float.toFloat(val);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_0900
     * @tc.name testFloatToFloat009
     * @tc.desc Verify Float.toFloat(float Float.NaN): isNaN returns boolean true, value is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      expect(isNaN(Float.toFloat(val))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1000
     * @tc.name testFloatToFloat010
     * @tc.desc Verify Float.toFloat(float Float.POSITIVE_INFINITY) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      expect(Float.toFloat(val)).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1100
     * @tc.name testFloatToFloat011
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        Float.toFloat(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1200
     * @tc.name testFloatToFloat012
     * @tc.desc Verify Float.toFloat with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      try {
        Float.toFloat(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1300
     * @tc.name testFloatToFloat013
     * @tc.desc Verify Float.toFloat with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      try {
        Float.toFloat(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1400
     * @tc.name testFloatToFloat014
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      try {
        Float.toFloat(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1500
     * @tc.name testFloatToFloat015
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        Float.toFloat(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1600
     * @tc.name testFloatToFloat016
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toFloat({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1700
     * @tc.name testFloatToFloat017
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.toFloat(jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1800
     * @tc.name testFloatToFloat018
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: bigint = 123n;
      try {
        Float.toFloat(bigVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_1900
     * @tc.name testFloatToFloat019
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.toFloat(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2000
     * @tc.name testFloatToFloat020
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.toFloat(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2100
     * @tc.name testFloatToFloat021
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      try {
        Float.toFloat(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2200
     * @tc.name testFloatToFloat022
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.toFloat(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2300
     * @tc.name testFloatToFloat023
     * @tc.desc Verify Float.toFloat throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.toFloat(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2400
     * @tc.name testFloatToFloat024
     * @tc.desc Verify Float.toFloat(float Float.MIN_VALUE / 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MIN_VALUE / 2.0f;
      expect(Float.toFloat(val)).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2500
     * @tc.name testFloatToFloat025
     * @tc.desc Verify Float.toFloat(float -Float.MIN_VALUE / 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MIN_VALUE / 2.0f;
      expect(Float.toFloat(val)).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2600
     * @tc.name testFloatToFloat026
     * @tc.desc Verify Float.toFloat(-Float.MAX_SAFE_INTEGER) returns -Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(-Float.MAX_SAFE_INTEGER)).assertEqual(-Float.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2700
     * @tc.name testFloatToFloat027
     * @tc.desc Verify Float.toFloat(3.14f) static vs instance consistency: Float.toFloat(v) equals new Float(v).toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 3.14f;
      const staticResult: float = Float.toFloat(v);
      const instanceResult: float = new Float(v).toFloat();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2800
     * @tc.name testFloatToFloat028
     * @tc.desc Verify Float.toFloat(Float.NaN) static vs instance consistency: both isNaN static and instance results are true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: float = Float.toFloat(Float.NaN);
      const instanceResult: float = new Float(Float.NaN).toFloat();
      expect(isNaN(staticResult)).assertTrue();
      expect(isNaN(instanceResult)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_2900
     * @tc.name testFloatToFloat029
     * @tc.desc Verify Float.toFloat(POSITIVE_INFINITY) static vs instance consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: float = Float.toFloat(Float.POSITIVE_INFINITY);
      const instanceResult: float = new Float(Float.POSITIVE_INFINITY).toFloat();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3000
     * @tc.name testFloatToFloat030
     * @tc.desc Verify Float.toFloat(NEGATIVE_INFINITY) static vs instance consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: float = Float.toFloat(Float.NEGATIVE_INFINITY);
      const instanceResult: float = new Float(Float.NEGATIVE_INFINITY).toFloat();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3100
     * @tc.name testFloatToFloat031
     * @tc.desc Verify Float.toFloat(MAX_VALUE) static vs instance consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: float = Float.toFloat(Float.MAX_VALUE);
      const instanceResult: float = new Float(Float.MAX_VALUE).toFloat();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3200
     * @tc.name testFloatToFloat032
     * @tc.desc Verify Float.toFloat(MIN_VALUE) static vs instance consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: float = Float.toFloat(Float.MIN_VALUE);
      const instanceResult: float = new Float(Float.MIN_VALUE).toFloat();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3300
     * @tc.name testFloatToFloat033
     * @tc.desc Verify Float.toFloat idempotency: multiple calls with float value 3.14f return the same float result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: float = Float.toFloat(3.14f);
      const b: float = Float.toFloat(3.14f);
      expect(Float.compare(a, b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3400
     * @tc.name testFloatToFloat034
     * @tc.desc Verify Float.toFloat(float 42.0f): isFinite returns boolean true, value is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(42.0f);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3500
     * @tc.name testFloatToFloat035
     * @tc.desc Verify Float.toFloat(float 100.0f): Float.isInteger returns boolean true, value is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(100.0f);
      expect(Float.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3600
     * @tc.name testFloatToFloat036
     * @tc.desc Verify Float.toFloat(float 1000.0f): Float.isSafeInteger returns boolean true, value is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(1000.0f);
      expect(Float.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3700
     * @tc.name testFloatToFloat037
     * @tc.desc Verify Float.toFloat(10.0f) returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(10.0f);
      expect(Float.toByte(result)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3800
     * @tc.name testFloatToFloat038
     * @tc.desc Verify Float.toFloat(25.0f) returns 25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(25.0f);
      expect(Float.toInt(result)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_3900
     * @tc.name testFloatToFloat039
     * @tc.desc Verify Float.toFloat(3.14f) returns approx 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(3.14f);
      expect(Float.toDouble(result)).assertClose(3.14, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4000
     * @tc.name testFloatToFloat040
     * @tc.desc Verify Float.toFloat(1.0f) returns 0x3F800000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(1.0f);
      const bits: int = Float.bitCastToInt(result);
      expect(bits).assertEqual(0x3F800000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4100
     * @tc.name testFloatToFloat041
     * @tc.desc Verify Float.toFloat(1.0f + 2.0f) returns 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(1.0f + 2.0f)).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4200
     * @tc.name testFloatToFloat042
     * @tc.desc Verify Float.toFloat(10.0f / 3.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: float = 10.0f / 3.0f;
      expect(Float.toFloat(10.0f / 3.0f)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4300
     * @tc.name testFloatToFloat043
     * @tc.desc Verify Float.toFloat(Float.toFloat(Float.toFloat(1.0f))) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(Float.toFloat(Float.toFloat(1.0f)))).assertEqual(1.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4400
     * @tc.name testFloatToFloat044
     * @tc.desc Verify Float.toFloat(val) returns 2.71f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float | undefined = 2.71f;
      if (val !== undefined) {
        expect(Float.toFloat(val)).assertEqual(2.71f);
      }else{
        expect().assertFail()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4500
     * @tc.name testFloatToFloat045
     * @tc.desc Verify Float.toFloat(-0.0f) returns -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1.0f / Float.toFloat(-0.0f)).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4600
     * @tc.name testFloatToFloat046
     * @tc.desc Verify Float.toFloat(Float.POSITIVE_INFINITY) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(Float.POSITIVE_INFINITY)).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4700
     * @tc.name testFloatToFloat047
     * @tc.desc Verify Float.toFloat(Float.NEGATIVE_INFINITY) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(Float.NEGATIVE_INFINITY)).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4800
     * @tc.name testFloatToFloat048
     * @tc.desc Verify Float.toFloat(Float.MAX_VALUE) returns Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(Float.MAX_VALUE)).assertEqual(Float.MAX_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_4900
     * @tc.name testFloatToFloat049
     * @tc.desc Verify Float.toFloat(16777216.0f) returns 16777216.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(16777216.0f)).assertEqual(16777216.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5000
     * @tc.name testFloatToFloat050
     * @tc.desc Verify Float.toFloat(3.14f) returns 3.14f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 3.14f;
      const result: float = Float.toFloat(v);
      const f: Float = new Float(result);
      expect(f.toFloat()).assertEqual(3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5100
     * @tc.name testFloatToFloat051
     * @tc.desc Verify Float.toFloat(Float.POSITIVE_INFINITY): result false finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.POSITIVE_INFINITY);
      expect(isFinite(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5200
     * @tc.name testFloatToFloat052
     * @tc.desc Verify Float.toFloat(10.0f - 3.0f) returns 7.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(10.0f - 3.0f)).assertEqual(7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5300
     * @tc.name testFloatToFloat053
     * @tc.desc Verify Float.toFloat(1.0f) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(1.0f)).assertEqual(1.0f);
      expect(Float.toFloat(2.0f)).assertEqual(2.0f);
      expect(Float.toFloat(3.0f)).assertEqual(3.0f);
      expect(Float.toFloat(4.0f)).assertEqual(4.0f);
      expect(Float.toFloat(5.0f)).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5400
     * @tc.name testFloatToFloat054
     * @tc.desc Verify toFloat() does not modify the original Float(2147483647) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(2147483647 as int);
      expect(result).assertEqual(2147483600f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5500
     * @tc.name testFloatToFloat055
     * @tc.desc Verify toFloat() does not modify the original Float(127 as byte) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(127 as byte);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5600
     * @tc.name testFloatToFloat056
     * @tc.desc Verify toFloat() does not modify the original Float(-32768 as short) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(-32768 as short);
      expect(result).assertEqual(-32768f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5700
     * @tc.name testFloatToFloat057
     * @tc.desc Verify toFloat() does not modify the original Float(1) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.bitCastFromInt(0x3f800000));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5800
     * @tc.name testFloatToFloat058
     * @tc.desc Verify toFloat() does not modify the original Float(Float.NaN) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_5900
     * @tc.name testFloatToFloat059
     * @tc.desc Verify toFloat() does not modify the original Float(Float.POSITIVE_INFINITY) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.POSITIVE_INFINITY);
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_6000
     * @tc.name testFloatToFloat060
     * @tc.desc Verify toFloat() does not modify the original Float(Float.NEGATIVE_INFINITY) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.NEGATIVE_INFINITY);
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_6100
     * @tc.name testFloatToFloat061
     * @tc.desc Verify Float.toFloat(9999999999999999f) handles precision overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(9999999999999999f)).assertEqual(1.0e16f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_6200
     * @tc.name testFloatToFloat062
     * @tc.desc Verify Float.toFloat(-1.0e-3f) returns -0.001f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(-1.0e-3f)).assertEqual(-1.0e-3f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_6300
     * @tc.name testFloatToFloat063
     * @tc.desc Verify Float.toFloat(Float.DELTA) returns Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(Float.DELTA)).assertEqual(Float.DELTA);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_TWO_6400
     * @tc.name testFloatToFloat064
     * @tc.desc Verify Float.toFloat(Float.MAX_SAFE_INTEGER) returns MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toFloat(Float.MAX_SAFE_INTEGER)).assertEqual(Float.MAX_SAFE_INTEGER);
    });

  });
}
