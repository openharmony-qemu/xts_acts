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

export default function FloatToInt2Test2(): void {
  describe('FloatToInt2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0100
     * @tc.name testFloatToInt001
     * @tc.desc Verify Float.toInt(int 42) returns 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      expect(Float.toInt(val)).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0200
     * @tc.name testFloatToInt002
     * @tc.desc Verify Float.toInt(long 100) returns 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      expect(Float.toInt(val)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0300
     * @tc.name testFloatToInt003
     * @tc.desc Verify Float.toInt(float -3.14f) returns -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      expect(Float.toInt(val)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0400
     * @tc.name testFloatToInt004
     * @tc.desc Verify Float.toInt(float 4.0f) returns 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      expect(Float.toInt(val)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0500
     * @tc.name testFloatToInt005
     * @tc.desc Verify Float.toInt(float 1.0e3f) returns 1000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      expect(Float.toInt(val)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0600
     * @tc.name testFloatToInt006
     * @tc.desc Verify Float.toInt throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toInt(null as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0700
     * @tc.name testFloatToInt007
     * @tc.desc Verify Float.toInt throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.toInt(bVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0800
     * @tc.name testFloatToInt008
     * @tc.desc Verify Float.toInt throws ClassCastError when passing digit string '1' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = '1';
        Float.toInt(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_0900
     * @tc.name testFloatToInt009
     * @tc.desc Verify Float.toInt throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.toInt(obj as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1000
     * @tc.name testFloatToInt010
     * @tc.desc Verify Float.toInt idempotency: multiple calls with float value 42.0f return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      const r1: int = Float.toInt(val);
      const r2: int = Float.toInt(val);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1100
     * @tc.name testFloatToInt011
     * @tc.desc Verify Float.toInt throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const longStr: string = 'x'.repeat(65535);
      try {
        Float.toInt(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1200
     * @tc.name testFloatToInt012
     * @tc.desc Verify Float.toInt with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: int[] = [];
      try {
        Float.toInt(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1300
     * @tc.name testFloatToInt013
     * @tc.desc Verify Float.toInt with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Object[] = [1, 'test', true];
      try {
        Float.toInt(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1400
     * @tc.name testFloatToInt014
     * @tc.desc Verify Float.toInt throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let matrix: int[][] = [];
      try {
        Float.toInt(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1500
     * @tc.name testFloatToInt015
     * @tc.desc Verify Float.toInt throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const list: Array<string> = new Array<string>('a', 'b');
      try {
        Float.toInt(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1600
     * @tc.name testFloatToInt016
     * @tc.desc Verify Float.toInt throws ClassCastError when passing BigInt as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const bigIntVal: bigint = 123n;
        Float.toInt(bigIntVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1700
     * @tc.name testFloatToInt017
     * @tc.desc Verify Float.toInt throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toInt({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1800
     * @tc.name testFloatToInt018
     * @tc.desc Verify Float.toInt throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.toInt(jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_1900
     * @tc.name testFloatToInt019
     * @tc.desc Verify Float.toInt throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.toInt(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2000
     * @tc.name testFloatToInt020
     * @tc.desc Verify Float.toInt throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.toInt(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2100
     * @tc.name testFloatToInt021
     * @tc.desc Verify Float.toInt throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      try {
        Float.toInt(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2200
     * @tc.name testFloatToInt022
     * @tc.desc Verify Float.toInt throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.toInt(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2300
     * @tc.name testFloatToInt023
     * @tc.desc Verify Float.toInt throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.toInt(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2400
     * @tc.name testFloatToInt024
     * @tc.desc Verify Float.toInt(-16777217.0f) returns -16777216
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-16777217.0f);
      expect(result).assertEqual(-16777216);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2500
     * @tc.name testFloatToInt025
     * @tc.desc Verify Float.toInt(-1.0e10f) returns -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-1.0e10f);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2600
     * @tc.name testFloatToInt026
     * @tc.desc Verify chained assertLargerOrEqual then assertLessOrEqual()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(2.147483647e9f);
      expect(result).assertLargerOrEqual(-2147483648);
      expect(result).assertLessOrEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2700
     * @tc.name testFloatToInt027
     * @tc.desc Verify Float.toInt idempotency: static and instance calls with float value 123456.0f return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 123456.0f;
      const staticResult: int = Float.toInt(v);
      const instanceResult: int = new Float(v).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2800
     * @tc.name testFloatToInt028
     * @tc.desc Verify Float.toInt idempotency: static and instance calls with float value NaN return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(Float.NaN);
      const instanceResult: int = new Float(Float.NaN).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_2900
     * @tc.name testFloatToInt029
     * @tc.desc Verify Float.toInt idempotency: static and instance calls with float value POSITIVE_INFINITY return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(Float.POSITIVE_INFINITY);
      const instanceResult: int = new Float(Float.POSITIVE_INFINITY).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3000
     * @tc.name testFloatToInt030
     * @tc.desc Verify Float.toInt idempotency: static and instance calls with float value NEGATIVE_INFINITY return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(Float.NEGATIVE_INFINITY);
      const instanceResult: int = new Float(Float.NEGATIVE_INFINITY).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3100
     * @tc.name testFloatToInt031
     * @tc.desc Verify Float.toInt idempotency: static and instance calls with float value MAX_VALUE return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(Float.MAX_VALUE);
      const instanceResult: int = new Float(Float.MAX_VALUE).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3200
     * @tc.name testFloatToInt032
     * @tc.desc Verify Float.toInt idempotency: static and instance calls with float value MIN_VALUE return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(Float.MIN_VALUE);
      const instanceResult: int = new Float(Float.MIN_VALUE).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3300
     * @tc.name testFloatToInt033
     * @tc.desc Verify Float.toInt idempotency: multiple calls with float value 100.0f and 200.0f return the same int sum result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: int = Float.toInt(100.0f) + Float.toInt(200.0f);
      expect(sum).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3400
     * @tc.name testFloatToInt034
     * @tc.desc Verify Float.toInt idempotency: multiple calls with float value 500.0f and 200.0f return the same int diff result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: int = Float.toInt(500.0f) - Float.toInt(200.0f);
      expect(diff).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3500
     * @tc.name testFloatToInt035
     * @tc.desc Verify Float.toInt idempotency: multiple calls with float value 10.0f and 30.0f return the same int product result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const product: int = Float.toInt(10.0f) * Float.toInt(30.0f);
      expect(product).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3600
     * @tc.name testFloatToInt036
     * @tc.desc Verify Float.toInt comparison: toInt(1000.0f) > toInt(500.0f) returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.toInt(1000.0f) > Float.toInt(500.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3700
     * @tc.name testFloatToInt037
     * @tc.desc Verify Float.toInt comparison: toInt(-500.0f) < toInt(0.0f) returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.toInt(-500.0f) < Float.toInt(0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3800
     * @tc.name testFloatToInt038
     * @tc.desc Verify Float.toInt idempotency: toInt(9999.0f) === toInt(9999.0f) returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.toInt(9999.0f) === Float.toInt(9999.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_3900
     * @tc.name testFloatToInt039
     * @tc.desc Verify Float.toInt(4095.0f) returns 0x0FFF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(4095.0f) & 0xFFFF;
      expect(result).assertEqual(0x0FFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4000
     * @tc.name testFloatToInt040
     * @tc.desc Verify Float.toInt(255.0f) returns 0xFFFF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(255.0f) | 0xFF00;
      expect(result).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4100
     * @tc.name testFloatToInt041
     * @tc.desc Verify Float.toInt(21845.0f) returns 0xAAAA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(21845.0f) ^ 0xFFFF;
      expect(result).assertEqual(0xAAAA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4200
     * @tc.name testFloatToInt042
     * @tc.desc Verify Float.toInt(Float.MAX_VALUE) returns 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(Float.MAX_VALUE);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4300
     * @tc.name testFloatToInt043
     * @tc.desc Verify Float.toInt(Float.MIN_VALUE) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(Float.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4400
     * @tc.name testFloatToInt044
     * @tc.desc Verify Float.toInt(Float.MAX_SAFE_INTEGER) returns Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(Float.MAX_SAFE_INTEGER);
      const f: float = new Float(result).toFloat();
      expect(f).assertEqual(Float.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4500
     * @tc.name testFloatToInt045
     * @tc.desc Verify Float.toInt(Float.MIN_VALUE / 2.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(Float.MIN_VALUE / 2.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4600
     * @tc.name testFloatToInt046
     * @tc.desc Verify Float.toInt(-Float.MIN_VALUE / 2.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-Float.MIN_VALUE / 2.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4700
     * @tc.name testFloatToInt047
     * @tc.desc Verify Float.toInt(1.5f + 0.5f) returns 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(1.5f + 0.5f);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4800
     * @tc.name testFloatToInt048
     * @tc.desc Verify Float.toInt batch correctness: converting float values 111.0f to 555.0f return correct int results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: int = Float.toInt(111.0f);
      const r2: int = Float.toInt(222.0f);
      const r3: int = Float.toInt(333.0f);
      const r4: int = Float.toInt(444.0f);
      const r5: int = Float.toInt(555.0f);
      expect(r1).assertEqual(111);
      expect(r2).assertEqual(222);
      expect(r3).assertEqual(333);
      expect(r4).assertEqual(444);
      expect(r5).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_4900
     * @tc.name testFloatToInt049
     * @tc.desc Verify Float.toInt with ternary operation: max of toInt(500.0f) and toInt(1000.0f) returns correct int
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: int = Float.toInt(500.0f);
      const b: int = Float.toInt(1000.0f);
      const max: int = a > b ? a : b;
      expect(max).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_5000
     * @tc.name testFloatToInt050
     * @tc.desc Verify Float.toInt idempotency: round-trip float value 12345.0f through toInt/toFloat returns correct int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(new Float(Float.toInt(12345.0f)).toFloat());
      expect(result).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_5100
     * @tc.name testFloatToInt051
     * @tc.desc Verify Float.toInt(2.0f) returns 2, used as array index to get 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30, 40, 50];
      const index: int = Float.toInt(2.0f);
      expect(arr[index]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_5200
     * @tc.name testFloatToInt052
     * @tc.desc Verify Float.toInt(-Float.MAX_SAFE_INTEGER) returns -Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-Float.MAX_SAFE_INTEGER);
      const f: float = new Float(result).toFloat();
      expect(f).assertEqual(-Float.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_5300
     * @tc.name testFloatToInt053
     * @tc.desc Verify consistency: Float.toInt(-0.0f) equals new Float(-0.0f).toInt()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(-0.0f);
      const instanceResult: int = new Float(-0.0f).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_5400
     * @tc.name testFloatToInt054
     * @tc.desc Verify consistency: Float.toInt(-MAX_SAFE_INTEGER) equals new Float(-MAX_SAFE_INTEGER).toInt()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(-Float.MAX_SAFE_INTEGER);
      const instanceResult: int = new Float(-Float.MAX_SAFE_INTEGER).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_5500
     * @tc.name testFloatToInt055
     * @tc.desc Verify consistency: Float.toInt(1.0e-3f) equals new Float(1.0e-3f).toInt()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(1.0e-3f);
      const instanceResult: int = new Float(1.0e-3f).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_TWO_5600
     * @tc.name testFloatToInt056
     * @tc.desc Verify consistency: Float.toInt(1.0e-10f) equals new Float(1.0e-10f).toInt()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: int = Float.toInt(1.0e-10f);
      const instanceResult: int = new Float(1.0e-10f).toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

  })
}
