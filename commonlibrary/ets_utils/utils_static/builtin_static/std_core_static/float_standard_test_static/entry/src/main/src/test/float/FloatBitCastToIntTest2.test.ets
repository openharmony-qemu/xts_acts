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

export default function FloatBitCastToIntTest2(): void {
  describe('FloatBitCastToIntTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0100
     * @tc.name testFloatBitCastToInt001
     * @tc.desc Verify Float.bitCastToInt(float 1.0e3f) returns 0x447a0000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      const result: int = Float.bitCastToInt(val);
      expect(result).assertEqual(0x447a0000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0200
     * @tc.name testFloatBitCastToInt002
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.bitCastToInt(bVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0300
     * @tc.name testFloatBitCastToInt003
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const cVal: char = c'a';
        Float.bitCastToInt(cVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0400
     * @tc.name testFloatBitCastToInt004
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing empty string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = '';
        Float.bitCastToInt(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0500
     * @tc.name testFloatBitCastToInt005
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.bitCastToInt(obj as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0600
     * @tc.name testFloatBitCastToInt006
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing array as parameter for 'ClassCastError'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.bitCastToInt([1.0] as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0700
     * @tc.name testFloatBitCastToInt007
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing unsupported type numList as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const numList: Array<double> = new Array<double>(1.0, 2.0);
        Float.bitCastToInt(numList as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0800
     * @tc.name testFloatBitCastToInt008
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing unsupported type new Map<string, float>( as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.bitCastToInt(new Map<string, float>() as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_0900
     * @tc.name testFloatBitCastToInt009
     * @tc.desc Verify Float.bitCastToInt(1.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: float = 1.0f;
      const bits: int = Float.bitCastToInt(original);
      const roundTrip: float = Float.bitCastFromInt(bits);
      expect(roundTrip).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1000
     * @tc.name testFloatBitCastToInt010
     * @tc.desc Verify Float.bitCastToInt idempotency: multiple calls with the same input return the same int result (r2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0f;
      const r1: int = Float.bitCastToInt(val);
      const r2: int = Float.bitCastToInt(val);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(0x3f800000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1100
     * @tc.name testFloatBitCastToInt011
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        Float.bitCastToInt(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1200
     * @tc.name testFloatBitCastToInt012
     * @tc.desc Verify Float.bitCastToInt with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      try {
        Float.bitCastToInt(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1300
     * @tc.name testFloatBitCastToInt013
     * @tc.desc Verify Float.bitCastToInt with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      try {
        Float.bitCastToInt(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1400
     * @tc.name testFloatBitCastToInt014
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      try {
        Float.bitCastToInt(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1500
     * @tc.name testFloatBitCastToInt015
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        Float.bitCastToInt(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1600
     * @tc.name testFloatBitCastToInt016
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing BigInt as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bigIntVal: bigint = 123n;
        Float.bitCastToInt(bigIntVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1700
     * @tc.name testFloatBitCastToInt017
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.bitCastToInt({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1800
     * @tc.name testFloatBitCastToInt018
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.bitCastToInt(jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_1900
     * @tc.name testFloatBitCastToInt019
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.bitCastToInt(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2000
     * @tc.name testFloatBitCastToInt020
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.bitCastToInt(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2100
     * @tc.name testFloatBitCastToInt021
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      try {
        Float.bitCastToInt(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2200
     * @tc.name testFloatBitCastToInt022
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.bitCastToInt(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2300
     * @tc.name testFloatBitCastToInt023
     * @tc.desc Verify Float.bitCastToInt throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.bitCastToInt(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2400
     * @tc.name testFloatBitCastToInt024
     * @tc.desc Verify Float.bitCastToInt(10.0f) returns 0x41200000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits1: int = Float.bitCastToInt(10.0f);
      expect(bits1).assertEqual(0x41200000);
      const bits2: int = Float.bitCastToInt(100.0f);
      expect(bits2).assertEqual(0x42c80000);
      const bits3: int = Float.bitCastToInt(1000.0f);
      expect(bits3).assertEqual(0x447a0000);
      const bits4: int = Float.bitCastToInt(10000.0f);
      expect(bits4).assertEqual(0x461c4000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2500
     * @tc.name testFloatBitCastToInt025
     * @tc.desc Verify Float.bitCastToInt( Float.MIN_VALUE * 2.0f) returns 0x00000002
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MIN_VALUE * 2.0f;
      const bits: int = Float.bitCastToInt(val);
      expect(bits).assertEqual(0x00000002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2600
     * @tc.name testFloatBitCastToInt026
     * @tc.desc Verify Float.bitCastToInt(-Float.MIN_VALUE) returns 0x80000001
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(-Float.MIN_VALUE);
      expect(bits).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2700
     * @tc.name testFloatBitCastToInt027
     * @tc.desc Verify Float.bitCastToInt(Float.bitCastFromInt(original))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: int = 0x3f800000;
      const f: float = Float.bitCastFromInt(original);
      const back: int = Float.bitCastToInt(f);
      expect(back).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2800
     * @tc.name testFloatBitCastToInt028
     * @tc.desc Verify Float.bitCastToInt idempotency: multiple calls with the same input return the same int result (bits2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits1: int = Float.bitCastToInt(123.456f);
      const bits2: int = Float.bitCastToInt(123.456f);
      expect(bits1).assertEqual(bits2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_2900
     * @tc.name testFloatBitCastToInt029
     * @tc.desc Verify Float.bitCastToInt idempotency: multiple calls with the same input return the same int result (negZeroBits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posZeroBits: int = Float.bitCastToInt(0.0f);
      const negZeroBits: int = Float.bitCastToInt(-0.0f);
      expect(posZeroBits).not().assertEqual(negZeroBits);
      expect(posZeroBits).assertEqual(0x00000000);
      expect(negZeroBits).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3000
     * @tc.name testFloatBitCastToInt030
     * @tc.desc Verify Float.bitCastToInt idempotency: multiple calls with the same input return the same int result (negInfBits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posInfBits: int = Float.bitCastToInt(Float.POSITIVE_INFINITY);
      const negInfBits: int = Float.bitCastToInt(Float.NEGATIVE_INFINITY);
      expect(posInfBits).not().assertEqual(negInfBits);
      expect(posInfBits).assertEqual(0x7f800000);
      expect(negInfBits).assertEqual(-8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3100
     * @tc.name testFloatBitCastToInt031
     * @tc.desc Verify Float.bitCastToInt(Float.MAX_SAFE_INTEGER) returns 1266679807
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(Float.MAX_SAFE_INTEGER);
      expect(bits).assertEqual(1266679807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3200
     * @tc.name testFloatBitCastToInt032
     * @tc.desc Verify Float.bitCastToInt(-Float.MAX_SAFE_INTEGER) returns -880803841
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(-Float.MAX_SAFE_INTEGER);
      expect(bits).assertEqual(-880803841);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3300
     * @tc.name testFloatBitCastToInt033
     * @tc.desc Verify Float.bitCastToInt(Float.EPSILON) returns 872415232
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(Float.EPSILON);
      expect(bits).assertEqual(872415232);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3400
     * @tc.name testFloatBitCastToInt034
     * @tc.desc Verify Float.bitCastToInt(Float.DELTA) returns 872415232
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(Float.DELTA);
      expect(bits).assertEqual(872415232);
      expect(bits).assertLargerOrEqual(-2147483648);
      expect(bits).assertLessOrEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3500
     * @tc.name testFloatBitCastToInt035
     * @tc.desc Verify Float.bitCastToInt(1.0f) returns 0x3f800000, then adds 1 to get 0x3f800001
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(1.0f);
      let result = bits + 1;
      expect(result).assertEqual(0x3f800001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3600
     * @tc.name testFloatBitCastToInt036
     * @tc.desc Verify Float.bitCastToInt(1.0f) returns 0x3f800000 for 1065353216
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(1.0f);
      let magnitude = bits & 0x7fffffff;
      expect(magnitude).assertEqual(1065353216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3700
     * @tc.name testFloatBitCastToInt037
     * @tc.desc Verify Float.bitCastToInt(2.5f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = 2.5f;
      const bits: int = Float.bitCastToInt(original);
      const restored: float = Float.bitCastFromInt(bits);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3800
     * @tc.name testFloatBitCastToInt038
     * @tc.desc Verify Float.bitCastToInt idempotency: multiple calls with the same input return the same int result (0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posBits: int = Float.bitCastToInt(1.0f);
      const negBits: int = Float.bitCastToInt(-1.0f);
      let posSign = (posBits >>> 31) & 1;
      let negSign = (negBits >>> 31) & 1;
      expect(posSign).assertEqual(0);
      expect(negSign).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_3900
     * @tc.name testFloatBitCastToInt039
     * @tc.desc Verify Float.bitCastToInt(2.0f) returns 128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(2.0f);
      let exponent = (bits >>> 23) & 0xff;
      expect(exponent).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_4000
     * @tc.name testFloatBitCastToInt040
     * @tc.desc Verify Float.bitCastToInt(1.5f) returns 0x400000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = Float.bitCastToInt(1.5f);
      let mantissa = bits & 0x007fffff;
      expect(mantissa).assertEqual(0x400000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_4100
     * @tc.name testFloatBitCastToInt041
     * @tc.desc Verify Float.bitCastToInt( -Float.MIN_VALUE * 2.0f) returns 0x80000002
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = -Float.MIN_VALUE * 2.0f;
      const bits: int = Float.bitCastToInt(val);
      expect(bits).assertEqual(-2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_4200
     * @tc.name testFloatBitCastToInt042
     * @tc.desc Verify Float.bitCastToInt idempotency: multiple calls with the same input return the same int result (3.14f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.14f);
      const bits: int = Float.bitCastToInt(f.toFloat());
      const expectedBits: int = Float.bitCastToInt(3.14f);
      expect(bits).assertEqual(expectedBits);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_4300
     * @tc.name testFloatBitCastToInt043
     * @tc.desc Verify Float.bitCastToInt(f.toFloat()) returns 0x00000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const bits: int = Float.bitCastToInt(f.toFloat());
      expect(bits).assertEqual(0x00000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2_4400
     * @tc.name testFloatBitCastToInt044
     * @tc.desc Verify toInt() on Float(1.0e3f) from bitCastToInt test file returns 1000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastToInt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0e3f);
      const result: int = f.toInt();
      expect(result).assertEqual(1000);
    });

  });
}
