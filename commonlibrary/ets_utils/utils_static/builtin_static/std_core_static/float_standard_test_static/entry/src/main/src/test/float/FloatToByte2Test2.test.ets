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

export default function FloatToByte2Test2(): void {
  describe('FloatToByte2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0100
     * @tc.name testFloatToByte001
     * @tc.desc Verify Float.toByte(int 42) returns 42 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      expect(Float.toByte(val)).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0200
     * @tc.name testFloatToByte002
     * @tc.desc Verify Float.toByte(float 4.0f) returns 4 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      expect(Float.toByte(val)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0300
     * @tc.name testFloatToByte003
     * @tc.desc Verify Float.toByte(float 1.0e2f) returns 100 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e2f;
      expect(Float.toByte(val)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0400
     * @tc.name testFloatToByte004
     * @tc.desc Verify Float.toByte throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toByte(null as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0500
     * @tc.name testFloatToByte005
     * @tc.desc Verify Float.toByte throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.toByte(bVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0600
     * @tc.name testFloatToByte006
     * @tc.desc Verify Float.toByte throws ClassCastError when passing digit string '1' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = '1';
        Float.toByte(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0700
     * @tc.name testFloatToByte007
     * @tc.desc Verify Float.toByte throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.toByte(obj as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0800
     * @tc.name testFloatToByte008
     * @tc.desc Verify Float.toByte idempotency: multiple calls with float value 42.0f return the same byte result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      const r1: byte = Float.toByte(val);
      const r2: byte = Float.toByte(val);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_0900
     * @tc.name testFloatToByte009
     * @tc.desc Verify Float.toByte throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        Float.toByte(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1000
     * @tc.name testFloatToByte010
     * @tc.desc Verify Float.toByte with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      try {
        Float.toByte(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1100
     * @tc.name testFloatToByte011
     * @tc.desc Verify Float.toByte with mixed array [1, 'test', true] throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      try {
        Float.toByte(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1200
     * @tc.name testFloatToByte012
     * @tc.desc Verify Float.toByte throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      try {
        Float.toByte(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1300
     * @tc.name testFloatToByte013
     * @tc.desc Verify Float.toByte throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        Float.toByte(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1400
     * @tc.name testFloatToByte014
     * @tc.desc Verify Float.toByte throws ClassCastError when passing BigInt as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bigIntVal: bigint = 123n;
        Float.toByte(bigIntVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1500
     * @tc.name testFloatToByte015
     * @tc.desc Verify Float.toByte throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toByte({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1600
     * @tc.name testFloatToByte016
     * @tc.desc Verify Float.toByte throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.toByte(jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1700
     * @tc.name testFloatToByte017
     * @tc.desc Verify Float.toByte throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.toByte(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1800
     * @tc.name testFloatToByte018
     * @tc.desc Verify Float.toByte throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.toByte(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_1900
     * @tc.name testFloatToByte019
     * @tc.desc Verify Float.toByte throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      try {
        Float.toByte(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2000
     * @tc.name testFloatToByte020
     * @tc.desc Verify Float.toByte throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.toByte(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2100
     * @tc.name testFloatToByte021
     * @tc.desc Verify Float.toByte throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.toByte(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2200
     * @tc.name testFloatToByte022
     * @tc.desc Verify Float.toByte(Float.MIN_VALUE / 2.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(Float.MIN_VALUE / 2.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2300
     * @tc.name testFloatToByte023
     * @tc.desc Verify Float.toByte(-Float.MIN_VALUE / 2.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-Float.MIN_VALUE / 2.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2400
     * @tc.name testFloatToByte024
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (instanceResult)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 42.0f;
      const staticResult: byte = Float.toByte(v);
      const instanceResult: byte = new Float(v).toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2500
     * @tc.name testFloatToByte025
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: byte = Float.toByte(Float.NaN);
      const instanceResult: byte = new Float(Float.NaN).toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2600
     * @tc.name testFloatToByte026
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: byte = Float.toByte(Float.POSITIVE_INFINITY);
      const instanceResult: byte = new Float(Float.POSITIVE_INFINITY).toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2700
     * @tc.name testFloatToByte027
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (Float.NEGATIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: byte = Float.toByte(Float.NEGATIVE_INFINITY);
      const instanceResult: byte = new Float(Float.NEGATIVE_INFINITY).toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2800
     * @tc.name testFloatToByte028
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (Float.MAX_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: byte = Float.toByte(Float.MAX_VALUE);
      const instanceResult: byte = new Float(Float.MAX_VALUE).toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_2900
     * @tc.name testFloatToByte029
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (Float.MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: byte = Float.toByte(Float.MIN_VALUE);
      const instanceResult: byte = new Float(Float.MIN_VALUE).toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3000
     * @tc.name testFloatToByte030
     * @tc.desc Verify Float.toByte sum: toByte(10.0f) + toByte(20.0f) returns 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: int = Float.toByte(10.0f) + Float.toByte(20.0f);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3100
     * @tc.name testFloatToByte031
     * @tc.desc Verify Float.toByte comparison: toByte(100.0f) in expression returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.toByte(100.0f) > Float.toByte(50.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3200
     * @tc.name testFloatToByte032
     * @tc.desc Verify Float.toByte comparison: toByte(-50.0f) in expression returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.toByte(-50.0f) < Float.toByte(0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3300
     * @tc.name testFloatToByte033
     * @tc.desc Verify Float.toByte(100.0f) returns 100.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const roundTrip: float = new Float(Float.toByte(100.0f)).toFloat();
      expect(roundTrip).assertEqual(100.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3400
     * @tc.name testFloatToByte034
     * @tc.desc Verify Float.toByte(-100.0f) returns -100.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const roundTrip: float = new Float(Float.toByte(-100.0f)).toFloat();
      expect(roundTrip).assertEqual(-100.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3500
     * @tc.name testFloatToByte035
     * @tc.desc Verify chained not then assertNull() returns 77
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: float | null = 77.0f;
      expect(value).not().assertNull();
      const result: byte = Float.toByte(value!);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3600
     * @tc.name testFloatToByte036
     * @tc.desc Verify chained not then assertUndefined() returns 33
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: float | undefined = 33.0f;
      expect(value).not().assertUndefined();
      const result: byte = Float.toByte(value!);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3700
     * @tc.name testFloatToByte037
     * @tc.desc Verify chained assertLargerOrEqual then assertLessOrEqual()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(Float.MAX_SAFE_INTEGER);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLessOrEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3800
     * @tc.name testFloatToByte038
     * @tc.desc Verify Float.toByte(1.0f + 0.5f) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(1.0f + 0.5f);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_3900
     * @tc.name testFloatToByte039
     * @tc.desc Verify Float.toByte(100.0f / 3.0f) returns 33
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(100.0f / 3.0f);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4000
     * @tc.name testFloatToByte040
     * @tc.desc Verify Float.toByte(2.0f) returns 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30, 40, 50];
      const index: byte = Float.toByte(2.0f);
      expect(arr[index]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4100
     * @tc.name testFloatToByte041
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: byte = Float.toByte(10.0f);
      const r2: byte = Float.toByte(20.0f);
      const r3: byte = Float.toByte(30.0f);
      const r4: byte = Float.toByte(40.0f);
      const r5: byte = Float.toByte(50.0f);
      expect(r1).assertEqual(10);
      expect(r2).assertEqual(20);
      expect(r3).assertEqual(30);
      expect(r4).assertEqual(40);
      expect(r5).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4200
     * @tc.name testFloatToByte042
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (100)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = Float.toByte(50.0f);
      const b: byte = Float.toByte(100.0f);
      const max: byte = a > b ? a : b;
      expect(max).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4300
     * @tc.name testFloatToByte043
     * @tc.desc Verify Float.toByte idempotency: multiple calls with the same input return the same byte result (Float.toByte(42.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(new Float(Float.toByte(42.0f)).toFloat());
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4400
     * @tc.name testFloatToByte044
     * @tc.desc Verify Float.toByte(100.0f * 2.0f) returns -56 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(100.0f * 2.0f);
      expect(result).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4500
     * @tc.name testFloatToByte045
     * @tc.desc Verify Float.toByte(50.0f - 30.0f) returns 20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(50.0f - 30.0f);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4600
     * @tc.name testFloatToByte046
     * @tc.desc Verify Float.toByte(127.0f) returns 127.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Float.toByte(127.0f);
      const back: float = new Float(b).toFloat();
      expect(back).assertEqual(127.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4700
     * @tc.name testFloatToByte047
     * @tc.desc Verify Float.toByte(-128.0f) returns -128.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Float.toByte(-128.0f);
      const back: float = new Float(b).toFloat();
      expect(back).assertEqual(-128.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4800
     * @tc.name testFloatToByte048
     * @tc.desc Verify Float.toByte(-Float.MAX_SAFE_INTEGER) returns value within byte range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-Float.MAX_SAFE_INTEGER);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLessOrEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_4900
     * @tc.name testFloatToByte049
     * @tc.desc Verify consistency: Float.toByte(-0.0f) equals instance.toByte(-0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: byte = Float.toByte(-0.0f);
      const instanceResult: byte = new Float(-0.0f).toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_TWO_5000
     * @tc.name testFloatToByte050
     * @tc.desc Verify consistency: Float.toByte(1.0e-10f) equals instance.toByte(1.0e-10f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: byte = Float.toByte(1.0e-10f);
      const instanceResult: byte = new Float(1.0e-10f).toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

  })
}
