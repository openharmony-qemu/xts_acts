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

export default function FloatToDouble2Test2(): void {
  describe('FloatToDouble2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0100
     * @tc.name testFloatToDouble001
     * @tc.desc Verify Float.toDouble(int 42) returns 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      expect(Float.toDouble(val)).assertEqual(42.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0200
     * @tc.name testFloatToDouble002
     * @tc.desc Verify Float.toDouble(float -3.14f) returns -3.140000104904175
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      expect(Float.toDouble(val)).assertEqual(-3.140000104904175);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0300
     * @tc.name testFloatToDouble003
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toDouble(null as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0400
     * @tc.name testFloatToDouble004
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.toDouble(bVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0500
     * @tc.name testFloatToDouble005
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing unsupported type '1.0' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = '1.0';
        Float.toDouble(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0600
     * @tc.name testFloatToDouble006
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.toDouble(obj as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0700
     * @tc.name testFloatToDouble007
     * @tc.desc Verify Float.toDouble idempotency: multiple calls with float value 42.0f return the same double result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      const r1: double = Float.toDouble(val);
      const r2: double = Float.toDouble(val);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0800
     * @tc.name testFloatToDouble008
     * @tc.desc Verify Float.toDouble(Float.NaN) result is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      const doubleVal: Double = Float.toDouble(val);
      expect(isNaN(doubleVal)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_0900
     * @tc.name testFloatToDouble009
     * @tc.desc Verify Float.toDouble(float Float.POSITIVE_INFINITY) returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      expect(Float.toDouble(val)).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1000
     * @tc.name testFloatToDouble010
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        Float.toDouble(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1100
     * @tc.name testFloatToDouble011
     * @tc.desc Verify Float.toDouble with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      try {
        Float.toDouble(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1200
     * @tc.name testFloatToDouble012
     * @tc.desc Verify Float.toDouble with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      try {
        Float.toDouble(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1300
     * @tc.name testFloatToDouble013
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      try {
        Float.toDouble(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1400
     * @tc.name testFloatToDouble014
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toDouble({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1500
     * @tc.name testFloatToDouble015
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: bigint = 123n;
      try {
        Float.toDouble(bigVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1600
     * @tc.name testFloatToDouble016
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.toDouble(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1700
     * @tc.name testFloatToDouble017
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.toDouble(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1800
     * @tc.name testFloatToDouble018
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      try {
        Float.toDouble(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_1900
     * @tc.name testFloatToDouble019
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.toDouble(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2000
     * @tc.name testFloatToDouble020
     * @tc.desc Verify Float.toDouble throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.toDouble(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2100
     * @tc.name testFloatToDouble021
     * @tc.desc Verify Float.toDouble(Float.MIN_VALUE / 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.MIN_VALUE / 2.0f);
      expect(result).assertLargerOrEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2200
     * @tc.name testFloatToDouble022
     * @tc.desc Verify Float.toDouble(-Float.MIN_VALUE / 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-Float.MIN_VALUE / 2.0f);
      expect(result).assertLessOrEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2300
     * @tc.name testFloatToDouble023
     * @tc.desc Verify Float.toDouble(Float.MAX_SAFE_INTEGER) returns 16777215.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(Float.MAX_SAFE_INTEGER)).assertEqual(16777215.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2400
     * @tc.name testFloatToDouble024
     * @tc.desc Verify Float.toDouble(-Float.MAX_SAFE_INTEGER) returns -16777215.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(-Float.MAX_SAFE_INTEGER)).assertEqual(-16777215.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2500
     * @tc.name testFloatToDouble025
     * @tc.desc Verify Float.toDouble(Float.DELTA)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.DELTA);
      expect(result).assertLarger(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2600
     * @tc.name testFloatToDouble026
     * @tc.desc Verify Float.toDouble(Float.EPSILON)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.EPSILON);
      expect(result).assertLarger(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2700
     * @tc.name testFloatToDouble027
     * @tc.desc Verify Float.toDouble idempotency: multiple calls with the same input return the same double result (instanceResult)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 3.14f;
      const staticResult: double = Float.toDouble(v);
      const instanceResult: double = new Float(v).toDouble();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2800
     * @tc.name testFloatToDouble028
     * @tc.desc Verify Float.toDouble(float Float.NaN): result is double value, true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: double = Float.toDouble(Float.NaN);
      const instanceResult: double = new Float(Float.NaN).toDouble();
      expect(isNaN(staticResult)).assertTrue();
      expect(isNaN(instanceResult)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_2900
     * @tc.name testFloatToDouble029
     * @tc.desc Verify Float.toDouble idempotency: multiple calls with the same input return the same double result (Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: double = Float.toDouble(Float.POSITIVE_INFINITY);
      const instanceResult: double = new Float(Float.POSITIVE_INFINITY).toDouble();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3000
     * @tc.name testFloatToDouble030
     * @tc.desc Verify Float.toDouble idempotency: multiple calls with the same input return the same double result (Float.NEGATIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: double = Float.toDouble(Float.NEGATIVE_INFINITY);
      const instanceResult: double = new Float(Float.NEGATIVE_INFINITY).toDouble();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3100
     * @tc.name testFloatToDouble031
     * @tc.desc Verify Float.toDouble idempotency: multiple calls with the same input return the same double result (Float.MAX_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: double = Float.toDouble(Float.MAX_VALUE);
      const instanceResult: double = new Float(Float.MAX_VALUE).toDouble();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3200
     * @tc.name testFloatToDouble032
     * @tc.desc Verify Float.toDouble idempotency: multiple calls with the same input return the same double result (Float.MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: double = Float.toDouble(Float.MIN_VALUE);
      const instanceResult: double = new Float(Float.MIN_VALUE).toDouble();
      expect(staticResult).assertEqual(instanceResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3300
     * @tc.name testFloatToDouble033
     * @tc.desc Verify Float.toDouble(1.5f) plus Float.toDouble(2.5f) equals 4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: double = Float.toDouble(1.5f) + Float.toDouble(2.5f);
      expect(sum).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3400
     * @tc.name testFloatToDouble034
     * @tc.desc Verify Float.toDouble(3.0f) times Float.toDouble(4.0f) equals 12.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const product: double = Float.toDouble(3.0f) * Float.toDouble(4.0f);
      expect(product).assertEqual(12.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3500
     * @tc.name testFloatToDouble035
     * @tc.desc Verify Float.toDouble(1000.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: double = Float.toDouble(1000.0f);
      const b: double = Float.toDouble(500.0f);
      expect(a).assertLarger(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3600
     * @tc.name testFloatToDouble036
     * @tc.desc Verify Float.toDouble(-100.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: double = Float.toDouble(-100.0f);
      const b: double = Float.toDouble(0.0f);
      expect(a).assertLess(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3700
     * @tc.name testFloatToDouble037
     * @tc.desc Verify Float.toDouble(1.0f + 0.5f) returns 1.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(1.0f + 0.5f)).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3800
     * @tc.name testFloatToDouble038
     * @tc.desc Verify Float.toDouble(3.0f * 2.0f) returns 6.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(3.0f * 2.0f)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_3900
     * @tc.name testFloatToDouble039
     * @tc.desc Verify Float.toDouble(3.14f) returns approx 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = 3.14f;
      const result: double = Float.toDouble(f);
      expect(result).assertClose(3.14, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4000
     * @tc.name testFloatToDouble040
     * @tc.desc Verify Float.toDouble(val) returns approx 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float | null = 3.14f;
      if (val !== null) {
        expect(Float.toDouble(val)).assertClose(3.14, 1e-6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4100
     * @tc.name testFloatToDouble041
     * @tc.desc Verify Float.toDouble(val) returns approx 2.71
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float | undefined = 2.71f;
      if (val !== undefined) {
        expect(Float.toDouble(val)).assertClose(2.71, 1e-6);
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4200
     * @tc.name testFloatToDouble042
     * @tc.desc Verify Float.toDouble(-0.0f) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1.0 / Float.toDouble(-0.0f)).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4300
     * @tc.name testFloatToDouble043
     * @tc.desc Verify Float.toDouble(Float.NEGATIVE_INFINITY) returns Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(Float.NEGATIVE_INFINITY)).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4400
     * @tc.name testFloatToDouble044
     * @tc.desc Verify Float.toDouble(Float.MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.MIN_VALUE);
      expect(result).assertLarger(Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4500
     * @tc.name testFloatToDouble045
     * @tc.desc Verify Float.toDouble(0.1f) returns approx 0.1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(0.1f);
      expect(result).assertClose(0.1, 1e-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4600
     * @tc.name testFloatToDouble046
     * @tc.desc Verify Float.toDouble(Float.MAX_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.MAX_VALUE);
      expect(result).assertLarger(0.0);
      expect(result).assertLess(1.0e308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4700
     * @tc.name testFloatToDouble047
     * @tc.desc Verify Float.toDouble(10.0f / 3.0f) returns approx 3.333333
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(10.0f / 3.0f);
      expect(result).assertClose(3.333333, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4800
     * @tc.name testFloatToDouble048
     * @tc.desc Verify Float.toDouble(1.0f) through Float.toDouble(5.0f) return themselves
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(1.0f)).assertEqual(1.0);
      expect(Float.toDouble(2.0f)).assertEqual(2.0);
      expect(Float.toDouble(3.0f)).assertEqual(3.0);
      expect(Float.toDouble(4.0f)).assertEqual(4.0);
      expect(Float.toDouble(5.0f)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_4900
     * @tc.name testFloatToDouble049
     * @tc.desc Verify Float.toDouble idempotency: multiple calls with the same input return the same double result (r2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 3.14f;
      const r1: double = Float.toDouble(v);
      const r2: double = Float.toDouble(v);
      const r3: double = Float.toDouble(v);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertClose(3.14, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5000
     * @tc.name testFloatToDouble050
     * @tc.desc Verify Float.toDouble(10.0f - 3.0f) returns 7.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(10.0f - 3.0f)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5100
     * @tc.name testFloatToDouble051
     * @tc.desc Verify Float.toDouble(1.0e3f) returns 1000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(1.0e3f);
      expect(result).assertEqual(1000f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5200
     * @tc.name testFloatToDouble052
     * @tc.desc Verify Float.toDouble(1.0e-5f) returns 0.000009999999747378752
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(1.0e-5f);
      expect(result).assertEqual(0.000009999999747378752);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5300
     * @tc.name testFloatToDouble053
     * @tc.desc Verify Float.toDouble(-1.0e3f) returns -1000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-1.0e3f);
      expect(result).assertEqual(-1000f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5400
     * @tc.name testFloatToDouble054
     * @tc.desc Verify Float.toDouble(2147483647) returns 2147483648.0 (precision loss)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(2147483647 as int);
      expect(result).assertEqual(2147483648f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5500
     * @tc.name testFloatToDouble055
     * @tc.desc Verify Float.toDouble(-2147483648) returns -2147483648.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-2147483648 as int);
      expect(result).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5600
     * @tc.name testFloatToDouble056
     * @tc.desc Verify Float.toDouble(127) returns 127.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(127 as byte);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5700
     * @tc.name testFloatToDouble057
     * @tc.desc Verify Float.toDouble(-128) returns -128.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-128 as byte);
      expect(result).assertEqual(-128f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5800
     * @tc.name testFloatToDouble058
     * @tc.desc Verify Float.toDouble(32767) returns 32767.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(32767 as short);
      expect(result).assertEqual(32767f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_5900
     * @tc.name testFloatToDouble059
     * @tc.desc Verify Float.toDouble(-32768) returns -32768.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-32768 as short);
      expect(result).assertEqual(-32768f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6000
     * @tc.name testFloatToDouble060
     * @tc.desc Verify Float.toDouble(Float.bitCastFromInt(0x3f800000) returns 1.0 (0x3f800000 = 1.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.bitCastFromInt(0x3f800000));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6100
     * @tc.name testFloatToDouble061
     * @tc.desc Verify Float.toDouble(Float.bitCastFromInt(0x40000000) returns 2.0 (0x40000000 = 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.bitCastFromInt(0x40000000));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6200
     * @tc.name testFloatToDouble062
     * @tc.desc Verify Float.toDouble(Float.NaN) returns NaN (Float.NaN toDouble is NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6300
     * @tc.name testFloatToDouble063
     * @tc.desc Verify Float.toDouble(Float.POSITIVE_INFINITY) returns POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.POSITIVE_INFINITY);
      expect(Double.isFinite(result)).assertFalse();
      expect(Double.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6400
     * @tc.name testFloatToDouble064
     * @tc.desc Verify Float.toDouble(Float.NEGATIVE_INFINITY) returns NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.NEGATIVE_INFINITY);
      expect(Double.isFinite(result)).assertFalse();
      expect(Double.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6500
     * @tc.name testFloatToDouble065
     * @tc.desc Verify Float.toDouble(9999999999999999f) handles precision overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(9999999999999999f)).assertEqual(10000000272564224f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6600
     * @tc.name testFloatToDouble066
     * @tc.desc Verify instance.toDouble() matches Float.toDouble() for Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Double = new Float(Float.MAX_SAFE_INTEGER).toDouble();
      let staticResult:Double = Float.toDouble(Float.MAX_SAFE_INTEGER);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6700
     * @tc.name testFloatToDouble067
     * @tc.desc Verify instance.toDouble() matches Float.toDouble() for -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Double = new Float(-0.0f).toDouble();
      let staticResult:Double = Float.toDouble(-0.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6800
     * @tc.name testFloatToDouble068
     * @tc.desc Verify instance.toDouble() matches Float.toDouble() for Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Double = new Float(Float.DELTA).toDouble();
      let staticResult:Double = Float.toDouble(Float.DELTA);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_6900
     * @tc.name testFloatToDouble069
     * @tc.desc Verify Float.toDouble(-1.0e-3f) returns -0.001
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(-1.0e-3f)).assertEqual(-0.0010000000474974513f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_7000
     * @tc.name testFloatToDouble070
     * @tc.desc Verify instance.toDouble() matches Float.toDouble() for 1.0e38f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Double = new Float(1.0e38f).toDouble();
      let staticResult:Double = Float.toDouble(1.0e38f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_7100
     * @tc.name testFloatToDouble071
     * @tc.desc Verify Float.toDouble(Float.DELTA) returns DELTA as double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(Float.DELTA)).assertEqual(Float.DELTA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_TWO_7200
     * @tc.name testFloatToDouble072
     * @tc.desc Verify Float.toDouble(Float.EPSILON) returns EPSILON as double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toDouble(Float.EPSILON)).assertEqual(Float.EPSILON);
    });


  });
}
