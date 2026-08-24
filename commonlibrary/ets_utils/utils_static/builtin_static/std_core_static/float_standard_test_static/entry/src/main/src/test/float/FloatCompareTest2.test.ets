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
enum Color { RED, GREEN, BLUE }
class JsonData {
  key: int = 0;
}

export default function FloatCompareTest2(): void {
  describe('FloatCompareTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0100
     * @tc.name testFloatCompare001
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type 1, 2.0 as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.compare(1, 2.0 as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0200
     * @tc.name testFloatCompare002
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type 1 as long, 2.0 as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.compare(1 as long, 2.0 as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0300
     * @tc.name testFloatCompare003
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type boolean as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.compare(bVal as Object as float, 2.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0400
     * @tc.name testFloatCompare004
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type char as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const cVal: char = c'a';
        Float.compare(cVal as Object as float, 2.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0500
     * @tc.name testFloatCompare005
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const sVal: string = '1';
        Float.compare(sVal as Object as float, 2.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0600
     * @tc.name testFloatCompare006
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type Object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.compare(obj as Object as float, 2.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0700
     * @tc.name testFloatCompare007
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type float[] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: float[] = [1.0f];
        Float.compare(arr as Object as float, 2.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0800
     * @tc.name testFloatCompare008
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type Array<double> as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const numList: Array<double> = new Array<double>();
        numList.push(1.0);
        numList.push(2.0);
        Float.compare(f, numList as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_0900
     * @tc.name testFloatCompare009
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type Map as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const m: Map<string, float> = new Map<string, float>();
        Float.compare(m as Object as float, 2.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1000
     * @tc.name testFloatCompare010
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type enum Color as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.compare(Color.RED as Object as float, 2.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1100
     * @tc.name testFloatCompare011
     * @tc.desc Verify Float.compare idempotency: multiple calls with equal float values 1.0f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.compare(1.0f, 1.0f);
      const r2: boolean = Float.compare(1.0f, 1.0f);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1200
     * @tc.name testFloatCompare012
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type int as second parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const val: int = 1;
        Float.compare(f, val as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1300
     * @tc.name testFloatCompare013
     * @tc.desc Verify Float.compare throws ClassCastError when passing Chinese text string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
        try {
          const s: string = '中文';
        Float.compare(f, s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1400
     * @tc.name testFloatCompare014
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, longStr as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1500
     * @tc.name testFloatCompare015
     * @tc.desc Verify Float.compare with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1600
     * @tc.name testFloatCompare016
     * @tc.desc Verify Float.compare with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1700
     * @tc.name testFloatCompare017
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1800
     * @tc.name testFloatCompare018
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, list as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<string> = new Array<string>('a', 'b');
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_1900
     * @tc.name testFloatCompare019
     * @tc.desc Verify Float.compare(int 2147483647, float 2147483647.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 2147483647.0f;
      const r: boolean = Float.compare(valA, valB);
      expect(r).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2000
     * @tc.name testFloatCompare020
     * @tc.desc Verify Float.compare(long 9223372036854775807, float 9223372036854775807.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: float = 9223372036854775807.0f;
      const r: boolean = Float.compare(valA, valB);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2100
     * @tc.name testFloatCompare021
     * @tc.desc Verify Float.compare(short 32767, int 32767)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: int = 32767;
      const r: boolean = Float.compare(valA, valB);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2200
     * @tc.name testFloatCompare022
     * @tc.desc Verify Float.compare(byte -128, short -128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = -128;
      const valB: short = -128;
      const r: boolean = Float.compare(valA, valB);
      expect(r).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2300
     * @tc.name testFloatCompare023
     * @tc.desc Verify Float.compare(float -0.0f, float 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = -0.0f;
      const valB: float = 0.0f;
      const r: boolean = Float.compare(valA, valB);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2400
     * @tc.name testFloatCompare024
     * @tc.desc Verify Float.compare(float 5.0f, float 5.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 5.0f;
      const valB: float = 5.0f;
      const r: boolean = Float.compare(valA, valB);
      expect(r).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2500
     * @tc.name testFloatCompare025
     * @tc.desc Verify Float.compare with equal boundary long values 9223372036854775807 returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 9223372036854775807;
      const r: boolean = Float.compare(val, val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2600
     * @tc.name testFloatCompare026
     * @tc.desc Verify Float.compare with equal boundary long values -9223372036854775808 returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = -9223372036854775808;
      const r: boolean = Float.compare(val, val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2700
     * @tc.name testFloatCompare027
     * @tc.desc Verify Float.compare with equal boundary short values 127 returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 127 as short;
      const r: boolean = Float.compare(val, val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2800
     * @tc.name testFloatCompare028
     * @tc.desc Verify Float.compare with equal boundary short values -32768 returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const r: boolean = Float.compare(val, val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_2900
     * @tc.name testFloatCompare029
     * @tc.desc Verify Float.compare with equal normal byte values 12 returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const r: boolean = Float.compare(val, val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3000
     * @tc.name testFloatCompare030
     * @tc.desc Verify Float.compare with equal boundary byte values -128 returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const r: boolean = Float.compare(val, val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3100
     * @tc.name testFloatCompare031
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, {} as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, {} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3200
     * @tc.name testFloatCompare032
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, jsonData as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.compare(f, jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3300
     * @tc.name testFloatCompare033
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, bigVal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: bigint = 123n;
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, bigVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3400
     * @tc.name testFloatCompare034
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, dateVal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3500
     * @tc.name testFloatCompare035
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, regVal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3600
     * @tc.name testFloatCompare036
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, rec as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3700
     * @tc.name testFloatCompare037
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, wm as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3800
     * @tc.name testFloatCompare038
     * @tc.desc Verify Float.compare throws ClassCastError when passing unsupported type f, ws as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      const f: Float = new Float(1.0);
      try {
        Float.compare(f, ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_3900
     * @tc.name testFloatCompare039
     * @tc.desc Verify Float.compare idempotency: symmetrical calls with float values 1.0f and 2.0f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.compare(1.0f, 2.0f);
      const r2: boolean = Float.compare(2.0f, 1.0f);
      expect(r1).assertEqual(r2);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4000
     * @tc.name testFloatCompare040
     * @tc.desc Verify Float.compare idempotency: symmetrical calls with float values -3.0f and -1.0f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.compare(-3.0f, -1.0f);
      const r2: boolean = Float.compare(-1.0f, -3.0f);
      expect(r1).assertEqual(r2);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4100
     * @tc.name testFloatCompare041
     * @tc.desc Verify Float.compare idempotency: symmetrical calls with float values -1.0f and 1.0f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.compare(-1.0f, 1.0f);
      const r2: boolean = Float.compare(1.0f, -1.0f);
      expect(r1).assertEqual(r2);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4200
     * @tc.name testFloatCompare042
     * @tc.desc Verify Float.compare idempotency: symmetrical calls with float values 1.0e-10f and 2.0e-10f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.compare(1.0e-10f, 2.0e-10f);
      const r2: boolean = Float.compare(2.0e-10f, 1.0e-10f);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4300
     * @tc.name testFloatCompare043
     * @tc.desc Verify Float.compare(0.0f, Float.DELTA / 2.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(0.0f, Float.DELTA / 2.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4400
     * @tc.name testFloatCompare044
     * @tc.desc Verify Float.compare(0.0f, Float.DELTA) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(0.0f, Float.DELTA);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4500
     * @tc.name testFloatCompare045
     * @tc.desc Verify Float.compare(0.0f, -Float.DELTA * 2.0f) returns false, values are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(0.0f, -Float.DELTA * 2.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4600
     * @tc.name testFloatCompare046
     * @tc.desc Verify Float.compare(Float.MIN_VALUE / 2.0f, 0.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.MIN_VALUE / 2.0f, 0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4700
     * @tc.name testFloatCompare047
     * @tc.desc Verify Float.compare(Float.MIN_VALUE / 2.0f, Float.MIN_VALUE / 4.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.MIN_VALUE / 2.0f, Float.MIN_VALUE / 4.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4800
     * @tc.name testFloatCompare048
     * @tc.desc Verify Float.compare(Float.MIN_VALUE, Float.MIN_VALUE * 2.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.MIN_VALUE, Float.MIN_VALUE * 2.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_4900
     * @tc.name testFloatCompare049
     * @tc.desc Verify Float.compare(-Float.MAX_VALUE, -Float.MAX_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(-Float.MAX_VALUE, -Float.MAX_VALUE);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5000
     * @tc.name testFloatCompare050
     * @tc.desc Verify Float.compare(float 1.0f, float 1.0f) returns toResult === 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: float = 1.0f;
      const b: float = 1.0f;
      const cmpResult: boolean = Float.compare(a, b);
      let toResult: int = new Float(a).compareTo(new Float(b));
      expect(cmpResult).assertEqual(toResult === 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5100
     * @tc.name testFloatCompare051
     * @tc.desc Verify Float.compare(1.0e10f, 1.0e10f + 1.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(1.0e10f, 1.0e10f + 1.0f);
      expect(result).assertTrue();
    });

    ;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5200
     * @tc.name testFloatCompare052
     * @tc.desc Verify chained not then assertNull() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lhs: float | null = 1.5f;
      const rhs: float = 1.5f;
      expect(lhs).not().assertNull();
      const result: boolean = Float.compare(lhs!, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5300
     * @tc.name testFloatCompare053
     * @tc.desc Verify chained not then assertUndefined() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rhs: float | undefined = 2.0f;
      const lhs: float = 2.0f;
      expect(rhs).not().assertUndefined();
      const result: boolean = Float.compare(lhs, rhs!);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5400
     * @tc.name testFloatCompare054
     * @tc.desc Verify Float.compare(Float.MAX_SAFE_INTEGER, Float.MAX_SAFE_INTEGER) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.MAX_SAFE_INTEGER, Float.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5500
     * @tc.name testFloatCompare055
     * @tc.desc Verify Float.compare with equal boundary float values MAX_SAFE_INTEGER + 1.0f returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_SAFE_INTEGER + 1.0f;
      const result: boolean = Float.compare(val, val);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5600
     * @tc.name testFloatCompare056
     * @tc.desc Verify Float.compare(1.0f + 0.5f, 1.5f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(1.0f + 0.5f, 1.5f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5700
     * @tc.name testFloatCompare057
     * @tc.desc Verify Float.compare(0.5f, 0.5f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(0.5f, 0.5f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5800
     * @tc.name testFloatCompare058
     * @tc.desc Verify Float.compare(Float.EPSILON, Float.EPSILON) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.EPSILON, Float.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_5900
     * @tc.name testFloatCompare059
     * @tc.desc Verify Float.compare(Float.DELTA, Float.DELTA) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.DELTA, Float.DELTA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6000
     * @tc.name testFloatCompare060
     * @tc.desc Verify Float.compare(Float.EPSILON, Float.DELTA) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.EPSILON, Float.DELTA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6100
     * @tc.name testFloatCompare061
     * @tc.desc Verify Float.compare(Float.EPSILON, Float.MAX_SAFE_INTEGER) returns false, values are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.EPSILON, Float.MAX_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6200
     * @tc.name testFloatCompare062
     * @tc.desc Verify Float.compare(Float.DELTA, Float.MAX_SAFE_INTEGER) returns false, values are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.DELTA, Float.MAX_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6300
     * @tc.name testFloatCompare063
     * @tc.desc Verify Float.compare(1.0e-3f, 0.001f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(1.0e-3f, 0.001f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6400
     * @tc.name testFloatCompare064
     * @tc.desc Verify Float.compare idempotency: 3 calls with equal float values 3.0f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.compare(3.0f, 3.0f);
      const r2: boolean = Float.compare(3.0f, 3.0f);
      const r3: boolean = Float.compare(3.0f, 3.0f);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6500
     * @tc.name testFloatCompare065
     * @tc.desc Verify Float.compare(-1.0e10f, -1.0e10f - 1.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(-1.0e10f, -1.0e10f - 1.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6600
     * @tc.name testFloatCompare066
     * @tc.desc Verify Float.compare with equal boundary float values -MAX_SAFE_INTEGER returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MAX_SAFE_INTEGER;
      const result: boolean = Float.compare(val, val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6700
     * @tc.name testFloatCompare067
     * @tc.desc Verify Float.compare(Float.MAX_SAFE_INTEGER, -Float.MAX_SAFE_INTEGER) returns false, values are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.MAX_SAFE_INTEGER, -Float.MAX_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6800
     * @tc.name testFloatCompare068
     * @tc.desc Verify Float.compare(1.0f, 1.0f + Float.EPSILON / 2.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(1.0f, 1.0f + Float.EPSILON / 2.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_6900
     * @tc.name testFloatCompare069
     * @tc.desc Verify Float.compare(1.0f, 1.0f + Float.EPSILON * 2.0f) returns false, values are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(1.0f, 1.0f + Float.EPSILON * 2.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7000
     * @tc.name testFloatCompare070
     * @tc.desc Verify Float.compare( new Float(9.0f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(9.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7100
     * @tc.name testFloatCompare071
     * @tc.desc Verify Float.compare( new Float(-48.0f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-48.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7200
     * @tc.name testFloatCompare072
     * @tc.desc Verify Float.compare( new Float(1.0e-5f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-5f);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7300
     * @tc.name testFloatCompare073
     * @tc.desc Verify Float.compare( new Float(-1.0e3f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0e3f);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7400
     * @tc.name testFloatCompare074
     * @tc.desc Verify Float.compare( new Float(1.0e10f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7500
     * @tc.name testFloatCompare075
     * @tc.desc Verify Float.compare( new Float(2147483647),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2147483647 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7600
     * @tc.name testFloatCompare076
     * @tc.desc Verify Float.compare( new Float(-2147483648),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7700
     * @tc.name testFloatCompare077
     * @tc.desc Verify Float.compare( new Float(127),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7800
     * @tc.name testFloatCompare078
     * @tc.desc Verify Float.compare( new Float(-128),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_7900
     * @tc.name testFloatCompare079
     * @tc.desc Verify Float.compare( new Float(32767),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_8000
     * @tc.name testFloatCompare080
     * @tc.desc Verify Float.compare( new Float(-32768),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_8100
     * @tc.name testFloatCompare081
     * @tc.desc Verify bitCastFromInt: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_8200
     * @tc.name testFloatCompare082
     * @tc.desc Verify bitCastFromInt: result from expression returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x40000000));
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_8300
     * @tc.name testFloatCompare083
     * @tc.desc Verify Float.compare( new Float(Float.NaN),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NaN);
      const b: Float = new Float(1.0f);
      const result: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_8400
     * @tc.name testFloatCompare084
     * @tc.desc Verify Float.compare(Float.NaN, Float.MAX_SAFE_INTEGER) returns false, values are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(Float.NaN, Float.MAX_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_8500
     * @tc.name testFloatCompare085
     * @tc.desc Verify Float.compare(1.0f, 1.0f + Float.EPSILON) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(1.0f, 1.0f + Float.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2_8600
     * @tc.name testFloatCompare086
     * @tc.desc Verify Float.compare(1.0f, 1.0f + Float.DELTA * 2) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompare086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.compare(1.0f, 1.0f + Float.DELTA * 2);
      expect(result).assertFalse();
    });

  })
}
