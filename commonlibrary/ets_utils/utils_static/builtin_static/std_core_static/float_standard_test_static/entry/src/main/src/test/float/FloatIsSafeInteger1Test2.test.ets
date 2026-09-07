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
import Utils from '../../test/Util.test';
class JsonData {
  key: int = 0;
}

interface SafeIntegerTestCase {
  input: float;
  expectSafe: boolean;
}

export default function FloatIsSafeInteger1Test2(): void {
  describe('FloatIsSafeInteger1Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0100
     * @tc.name testFloatIsSafeIntegerStatic001
     * @tc.desc Verify Float.isSafeInteger(int 1) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 1;
      expect(Float.isSafeInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0200
     * @tc.name testFloatIsSafeIntegerStatic002
     * @tc.desc Verify Float.isSafeInteger(int -2147483648) returns false (-2147483648 is not safe integer in float)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      expect(Float.isSafeInteger(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0300
     * @tc.name testFloatIsSafeIntegerStatic003
     * @tc.desc Verify Float.isSafeInteger(long 100) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      expect(Float.isSafeInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0400
     * @tc.name testFloatIsSafeIntegerStatic004
     * @tc.desc Verify Float.isSafeInteger(float Float.NaN) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      expect(Float.isSafeInteger(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0500
     * @tc.name testFloatIsSafeIntegerStatic005
     * @tc.desc Verify Float.isSafeInteger(float 0.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.0f;
      expect(Float.isSafeInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0600
     * @tc.name testFloatIsSafeIntegerStatic006
     * @tc.desc Verify Float.isSafeInteger(float -0.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f;
      expect(Float.isSafeInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0700
     * @tc.name testFloatIsSafeIntegerStatic007
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.isSafeInteger(bVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0800
     * @tc.name testFloatIsSafeIntegerStatic008
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const cVal: char = c'a';
        Float.isSafeInteger(cVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_0900
     * @tc.name testFloatIsSafeIntegerStatic009
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.isSafeInteger(obj as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1000
     * @tc.name testFloatIsSafeIntegerStatic010
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing array as parameter for 'ClassCastError'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.isSafeInteger([1.0] as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1100
     * @tc.name testFloatIsSafeIntegerStatic011
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.isSafeInteger(null as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1200
     * @tc.name testFloatIsSafeIntegerStatic012
     * @tc.desc Verify Float.isSafeInteger idempotency: multiple calls with float value 1.0f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.isSafeInteger(1.0f);
      const r2: boolean = Float.isSafeInteger(1.0f);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1300
     * @tc.name testFloatIsSafeIntegerStatic013
     * @tc.desc Verify Float.isSafeInteger(float Float.MAX_SAFE_INTEGER) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_SAFE_INTEGER;
      expect(Float.isSafeInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1400
     * @tc.name testFloatIsSafeIntegerStatic014
     * @tc.desc Verify Float.isSafeInteger(float Float.MAX_SAFE_INTEGER + 1.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_SAFE_INTEGER + 1.0f;
      expect(Float.isSafeInteger(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1500
     * @tc.name testFloatIsSafeIntegerStatic015
     * @tc.desc Verify Float.isSafeInteger(float 16777216.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 16777216.0f;
      expect(Float.isSafeInteger(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1600
     * @tc.name testFloatIsSafeIntegerStatic016
     * @tc.desc Verify Float.isSafeInteger(float 8.0f / 2.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 8.0f / 2.0f;
      expect(Float.isSafeInteger(val)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1700
     * @tc.name testFloatIsSafeIntegerStatic017
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        Float.isSafeInteger(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1800
     * @tc.name testFloatIsSafeIntegerStatic018
     * @tc.desc Verify Float.isSafeInteger with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      try {
        Float.isSafeInteger(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_1900
     * @tc.name testFloatIsSafeIntegerStatic019
     * @tc.desc Verify Float.isSafeInteger with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      try {
        Float.isSafeInteger(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2000
     * @tc.name testFloatIsSafeIntegerStatic020
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      try {
        Float.isSafeInteger(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2100
     * @tc.name testFloatIsSafeIntegerStatic021
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        Float.isSafeInteger(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2200
     * @tc.name testFloatIsSafeIntegerStatic022
     * @tc.desc Verify Float.isSafeInteger(float Float.MAX_VALUE) returns false (Float.MAX_VALUE is not safe integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_VALUE;
      const r: boolean = Float.isSafeInteger(val);
      expect(r).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2300
     * @tc.name testFloatIsSafeIntegerStatic023
     * @tc.desc Verify Float.isSafeInteger(short -32768) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const r: boolean = Float.isSafeInteger(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2400
     * @tc.name testFloatIsSafeIntegerStatic024
     * @tc.desc Verify Float.isSafeInteger(byte 12) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const r: boolean = Float.isSafeInteger(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2500
     * @tc.name testFloatIsSafeIntegerStatic025
     * @tc.desc Verify Float.isSafeInteger(byte -128) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const r: boolean = Float.isSafeInteger(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2600
     * @tc.name testFloatIsSafeIntegerStatic026
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.isSafeInteger({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2700
     * @tc.name testFloatIsSafeIntegerStatic027
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.isSafeInteger(jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2800
     * @tc.name testFloatIsSafeIntegerStatic028
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: bigint = 123n;
      try {
        Float.isSafeInteger(bigVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_2900
     * @tc.name testFloatIsSafeIntegerStatic029
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.isSafeInteger(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3000
     * @tc.name testFloatIsSafeIntegerStatic030
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.isSafeInteger(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3100
     * @tc.name testFloatIsSafeIntegerStatic031
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      try {
        Float.isSafeInteger(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3200
     * @tc.name testFloatIsSafeIntegerStatic032
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.isSafeInteger(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3300
     * @tc.name testFloatIsSafeIntegerStatic033
     * @tc.desc Verify Float.isSafeInteger throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.isSafeInteger(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3400
     * @tc.name testFloatIsSafeIntegerStatic034
     * @tc.desc Verify Float.isSafeInteger(100.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases = [
      100.0f,
      1000.0f,
      10000.0f,
      100000.0f,
      1000000.0f,
      10000000.0f
      ];

      for (const val of testCases) {
        const result: boolean = Float.isSafeInteger(val);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3500
     * @tc.name testFloatIsSafeIntegerStatic035
     * @tc.desc Verify Float.isSafeInteger(100.0f) static method consistent with instance isSafeInteger() on new Float(100.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isSafeInteger(100.0f);
      const instanceResult: boolean = new Float(100.0f).isSafeInteger();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3600
     * @tc.name testFloatIsSafeIntegerStatic036
     * @tc.desc Verify Float.isSafeInteger(Float.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isSafeInteger(Float.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3700
     * @tc.name testFloatIsSafeIntegerStatic037
     * @tc.desc Verify Float.isSafeInteger returns true for power-of-two float values from 4.0f to 8388608.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: float[] = [
      4.0f, 8.0f, 16.0f, 32.0f, 64.0f, 128.0f,
      256.0f, 512.0f, 1024.0f, 2048.0f, 4096.0f, 8192.0f,
      16384.0f, 32768.0f, 65536.0f, 131072.0f, 262144.0f, 524288.0f,
      1048576.0f, 2097152.0f, 4194304.0f, 8388608.0f
      ];

      for (const val of testValues) {
        const result: boolean = Float.isSafeInteger(val);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3800
     * @tc.name testFloatIsSafeIntegerStatic038
     * @tc.desc Verify Float.isSafeInteger(100.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isSafe: boolean = Float.isSafeInteger(100.0f);
      const isInt: boolean = Float.isInteger(100.0f);
      expect(isSafe).assertTrue();
      expect(isInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_3900
     * @tc.name testFloatIsSafeIntegerStatic039
     * @tc.desc Verify Float.isSafeInteger(127) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(127 as byte);
      const result: boolean = f.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_4000
     * @tc.name testFloatIsSafeIntegerStatic040
     * @tc.desc Verify Float.isSafeInteger(-128) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-128 as byte);
      const result: boolean = f.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_4100
     * @tc.name testFloatIsSafeIntegerStatic041
     * @tc.desc Verify Float.isSafeInteger(32767) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(32767 as short);
      const result: boolean = f.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_4200
     * @tc.name testFloatIsSafeIntegerStatic042
     * @tc.desc Verify Float.isSafeInteger(-32768) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-32768 as short);
      const result: boolean = f.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_4300
     * @tc.name testFloatIsSafeIntegerStatic043
     * @tc.desc Verify Float.isSafeInteger(Float.bitCastFromInt(0x3f800000)) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const result: boolean = f.isSafeInteger();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_STATIC_ONE_4400
     * @tc.name testFloatIsSafeIntegerStatic044
     * @tc.desc Verify static Float.isSafeInteger with exponential-notation float inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerStatic044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: SafeIntegerTestCase[] = [
      { input: 1.0e3f, expectSafe: true },
      { input: 1.0e7f, expectSafe: true },
      { input: -1.0e7f, expectSafe: true }
      ];

      for (const item of testCases) {
        const result: boolean = Float.isSafeInteger(item.input);
        if (item.expectSafe) {
          expect(result).assertTrue();
        } else {
          expect(result).assertFalse();
        }
      }
    });

  })
}
