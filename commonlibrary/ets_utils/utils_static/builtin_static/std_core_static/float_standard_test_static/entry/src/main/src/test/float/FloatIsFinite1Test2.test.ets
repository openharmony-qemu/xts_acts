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

export default function FloatIsFinite1Test2(): void {
  describe('FloatIsFinite1Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0100
     * @tc.name testFloatIsFiniteStatic001
     * @tc.desc Verify Float.isFinite(int 1) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 1;
      expect(Float.isFinite(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0200
     * @tc.name testFloatIsFiniteStatic002
     * @tc.desc Verify Float.isFinite(int -2147483648) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      expect(Float.isFinite(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0300
     * @tc.name testFloatIsFiniteStatic003
     * @tc.desc Verify Float.isFinite(long 100) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      expect(Float.isFinite(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0400
     * @tc.name testFloatIsFiniteStatic004
     * @tc.desc Verify Float.isFinite(float 9999999999999999f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 9999999999999999f;
      expect(Float.isFinite(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0500
     * @tc.name testFloatIsFiniteStatic005
     * @tc.desc Verify Float.isFinite(float 1.0e3f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      expect(Float.isFinite(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0600
     * @tc.name testFloatIsFiniteStatic006
     * @tc.desc Verify Float.isFinite(float 1.0e-10f) returns true, confirming the input is finite (static)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e-10f;
      expect(Float.isFinite(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0700
     * @tc.name testFloatIsFiniteStatic007
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.isFinite(bVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0800
     * @tc.name testFloatIsFiniteStatic008
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const cVal: char = c'a';
        Float.isFinite(cVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_0900
     * @tc.name testFloatIsFiniteStatic009
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing empty string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = '';
        Float.isFinite(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1000
     * @tc.name testFloatIsFiniteStatic010
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.isFinite(obj as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1100
     * @tc.name testFloatIsFiniteStatic011
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing array as parameter for 'ClassCastError' (static)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.isFinite([1.0] as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1200
     * @tc.name testFloatIsFiniteStatic012
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.isFinite(null as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1300
     * @tc.name testFloatIsFiniteStatic013
     * @tc.desc Verify Float.isFinite idempotency: multiple calls with float value 1.0f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.isFinite(1.0f);
      const r2: boolean = Float.isFinite(1.0f);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1400
     * @tc.name testFloatIsFiniteStatic014
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const longStr: string = 'x'.repeat(65535);
      try {
        Float.isFinite(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1500
     * @tc.name testFloatIsFiniteStatic015
     * @tc.desc Verify Float.isFinite with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: int[] = [];
      try {
        Float.isFinite(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1600
     * @tc.name testFloatIsFiniteStatic016
     * @tc.desc Verify Float.isFinite with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Object[] = [1, 'test', true];
      try {
        Float.isFinite(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1700
     * @tc.name testFloatIsFiniteStatic017
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let matrix: int[][] = [];
      try {
        Float.isFinite(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1800
     * @tc.name testFloatIsFiniteStatic018
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const list: Array<string> = new Array<string>('a', 'b');
      try {
        Float.isFinite(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_1900
     * @tc.name testFloatIsFiniteStatic019
     * @tc.desc Verify Float.isFinite(short -32768) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const r: boolean = Float.isFinite(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2000
     * @tc.name testFloatIsFiniteStatic020
     * @tc.desc Verify Float.isFinite(byte 12) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const r: boolean = Float.isFinite(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2100
     * @tc.name testFloatIsFiniteStatic021
     * @tc.desc Verify Float.isFinite(byte -128) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const r: boolean = Float.isFinite(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2200
     * @tc.name testFloatIsFiniteStatic022
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.isFinite({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2300
     * @tc.name testFloatIsFiniteStatic023
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.isFinite(jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2400
     * @tc.name testFloatIsFiniteStatic024
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: bigint = 123n;
      try {
        Float.isFinite(bigVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2500
     * @tc.name testFloatIsFiniteStatic025
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.isFinite(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2600
     * @tc.name testFloatIsFiniteStatic026
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.isFinite(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2700
     * @tc.name testFloatIsFiniteStatic027
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      try {
        Float.isFinite(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2800
     * @tc.name testFloatIsFiniteStatic028
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.isFinite(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_2900
     * @tc.name testFloatIsFiniteStatic029
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.isFinite(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3000
     * @tc.name testFloatIsFiniteStatic030
     * @tc.desc Verify Float.isFinite(Float.MIN_VALUE / 2.0f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(Float.MIN_VALUE / 2.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3100
     * @tc.name testFloatIsFiniteStatic031
     * @tc.desc Verify Float.isFinite(-Float.MIN_VALUE / 2.0f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(-Float.MIN_VALUE / 2.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3200
     * @tc.name testFloatIsFiniteStatic032
     * @tc.desc Verify bitCastFromInt: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.bitCastFromInt(0x00000001);
      const result: boolean = Float.isFinite(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3300
     * @tc.name testFloatIsFiniteStatic033
     * @tc.desc Verify static Float.isFinite matches instance isFinite() for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isFinite(Float.NaN);
      const instanceResult: boolean = new Float(Float.NaN).isFinite();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3400
     * @tc.name testFloatIsFiniteStatic034
     * @tc.desc Verify static Float.isFinite matches instance isFinite() for Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isFinite(Float.POSITIVE_INFINITY);
      const instanceResult: boolean = new Float(Float.POSITIVE_INFINITY).isFinite();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3500
     * @tc.name testFloatIsFiniteStatic035
     * @tc.desc Verify static Float.isFinite matches instance isFinite() for 3.14f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isFinite(3.14f);
      const instanceResult: boolean = new Float(3.14f).isFinite();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3600
     * @tc.name testFloatIsFiniteStatic036
     * @tc.desc Verify Float.isFinite(Float.MAX_VALUE / 2.0f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(Float.MAX_VALUE / 2.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3700
     * @tc.name testFloatIsFiniteStatic037
     * @tc.desc Verify Float.isFinite(Float.MAX_VALUE * 0.999f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(Float.MAX_VALUE * 0.999f);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3800
     * @tc.name testFloatIsFiniteStatic038
     * @tc.desc Verify Float.isFinite(-Float.MAX_VALUE * 2.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(-Float.MAX_VALUE * 2.0f);
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_3900
     * @tc.name testFloatIsFiniteStatic039
     * @tc.desc Verify Float.isFinite(Float.EPSILON) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(Float.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4000
     * @tc.name testFloatIsFiniteStatic040
     * @tc.desc Verify Float.isFinite after null narrowing on float value, returns true, confirming finite value survives null-safety check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float | null = 1.0f;
      expect(val).not().assertNull();
      const result: boolean = Float.isFinite(val!);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4100
     * @tc.name testFloatIsFiniteStatic041
     * @tc.desc Verify Float.isFinite after null narrowing on NaN value, returns false, confirming NaN is not finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float | null = Float.NaN;
      expect(val).not().assertNull();
      const result: boolean = Float.isFinite(val!);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4200
     * @tc.name testFloatIsFiniteStatic042
     * @tc.desc Verify Float.isFinite(2147483647) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(2147483647 as int);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4300
     * @tc.name testFloatIsFiniteStatic043
     * @tc.desc Verify Float.isFinite(-2147483648) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(-2147483648 as int);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4400
     * @tc.name testFloatIsFiniteStatic044
     * @tc.desc Verify Float.isFinite(127) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(127 as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4500
     * @tc.name testFloatIsFiniteStatic045
     * @tc.desc Verify Float.isFinite(-128) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(-128 as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4600
     * @tc.name testFloatIsFiniteStatic046
     * @tc.desc Verify Float.isFinite(32767) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(32767 as short);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4700
     * @tc.name testFloatIsFiniteStatic047
     * @tc.desc Verify Float.isFinite(-32768) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(-32768 as short);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4800
     * @tc.name testFloatIsFiniteStatic048
     * @tc.desc Verify bitCastFromInt: result from expression returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isFinite(Float.bitCastFromInt(0x3f800000));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_STATIC_ONE_4900
     * @tc.name testFloatIsFiniteStatic049
     * @tc.desc Verify Float.isFinite throws ClassCastError when passing Function as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteStatic049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: () => void = (): void => {};
        Float.isFinite(fn as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

  });
}
