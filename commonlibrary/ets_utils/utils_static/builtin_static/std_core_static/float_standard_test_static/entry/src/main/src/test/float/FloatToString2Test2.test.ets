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

export default function FloatToString2Test2(): void {
  describe('FloatToString2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0100
     * @tc.name testFloatToString001
     * @tc.desc Verify Float.toString(float -3.14f) returns '-3.14'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      expect(Float.toString(val)).assertEqual('-3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0200
     * @tc.name testFloatToString002
     * @tc.desc Verify Float.toString(float 4.0f) returns '4'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      expect(Float.toString(val)).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0300
     * @tc.name testFloatToString003
     * @tc.desc Verify Float.toString(float 1.0e3f) returns '1000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      expect(Float.toString(val)).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0400
     * @tc.name testFloatToString004
     * @tc.desc Verify Float.toString(float Float.NaN) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      expect(Float.toString(val)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0500
     * @tc.name testFloatToString005
     * @tc.desc Verify Float.toString(float Float.POSITIVE_INFINITY) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      expect(Float.toString(val)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0600
     * @tc.name testFloatToString006
     * @tc.desc Verify Float.toString(float Float.NEGATIVE_INFINITY) returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY;
      expect(Float.toString(val)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0700
     * @tc.name testFloatToString007
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing null value as parameter for 'ClassCastError'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toString(null as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0800
     * @tc.name testFloatToString008
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.toString(bVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_0900
     * @tc.name testFloatToString009
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.toString(obj as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1000
     * @tc.name testFloatToString010
     * @tc.desc Verify Float.toString(float) idempotency: multiple calls with float value 42.0f return the same string result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      const r1: string = Float.toString(val);
      const r2: string = Float.toString(val);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1100
     * @tc.name testFloatToString011
     * @tc.desc Verify Float.toString(float 42.0f) returns '42'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      expect(Float.toString(val)).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1200
     * @tc.name testFloatToString012
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing Chinese text string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = '中文';
        Float.toString(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1300
     * @tc.name testFloatToString013
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        Float.toString(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1400
     * @tc.name testFloatToString014
     * @tc.desc Verify Float.toString with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      try {
        Float.toString(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1500
     * @tc.name testFloatToString015
     * @tc.desc Verify Float.toString with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      try {
        Float.toString(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1600
     * @tc.name testFloatToString016
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      try {
        Float.toString(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1700
     * @tc.name testFloatToString017
     * @tc.desc Verify Float.toString with string 'a' throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        Float.toString(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1800
     * @tc.name testFloatToString018
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toString({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_1900
     * @tc.name testFloatToString019
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.toString(jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2000
     * @tc.name testFloatToString020
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: bigint = 123n;
      try {
        Float.toString(bigVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2100
     * @tc.name testFloatToString021
     * @tc.desc Verify Float.toString with Date object throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.toString(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2200
     * @tc.name testFloatToString022
     * @tc.desc Verify Float.toString with RegExp object throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.toString(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2300
     * @tc.name testFloatToString023
     * @tc.desc Verify Float.toString with Record throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = { 'key': 1 };
      try {
        Float.toString(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2400
     * @tc.name testFloatToString024
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.toString(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2500
     * @tc.name testFloatToString025
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.toString(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2600
     * @tc.name testFloatToString026
     * @tc.desc Verify Float.toString(Float.MAX_VALUE) returns '3.4028235e+38' equaling '3.4028235e+38'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_VALUE);
      expect(result).assertEqual('3.4028235e+38');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2700
     * @tc.name testFloatToString027
     * @tc.desc Verify Float.toString(-Float.MIN_VALUE) returns '-1e-45'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-Float.MIN_VALUE)).assertEqual('-1e-45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2800
     * @tc.name testFloatToString028
     * @tc.desc Verify Float.toString(42.5f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 42.5f;
      expect(Float.toString(v)).assertEqual(new Float(v).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_2900
     * @tc.name testFloatToString029
     * @tc.desc Verify Float.toString(255.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 255.0f;
      expect(Float.toString(v)).assertEqual(Float.toString(v, 10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3000
     * @tc.name testFloatToString030
     * @tc.desc Verify Float.toString(3.14f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(3.14f)).assertEqual(Float.toString(3.14f, 10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3100
     * @tc.name testFloatToString031
     * @tc.desc Verify Float.toString(1.0f) returns '1' equaling '1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(1.0f)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3200
     * @tc.name testFloatToString032
     * @tc.desc Verify Float.toString(2.0f) returns '2'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(2.0f)).assertEqual('2');
      expect(Float.toString(4.0f)).assertEqual('4');
      expect(Float.toString(8.0f)).assertEqual('8');
      expect(Float.toString(16.0f)).assertEqual('16');
      expect(Float.toString(32.0f)).assertEqual('32');
      expect(Float.toString(64.0f)).assertEqual('64');
      expect(Float.toString(128.0f)).assertEqual('128');
      expect(Float.toString(256.0f)).assertEqual('256');
      expect(Float.toString(512.0f)).assertEqual('512');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3300
     * @tc.name testFloatToString033
     * @tc.desc Verify Float.toString(9.0f) returns '9'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(9.0f);
      expect(result).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3400
     * @tc.name testFloatToString034
     * @tc.desc Verify Float.toString(3.14f) returns '3.14' equaling '3.14'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = 3.14f;
      expect(Float.toString(f)).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3500
     * @tc.name testFloatToString035
     * @tc.desc Verify Float.toString(-0.1f) returns '-0.1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-0.1f)).assertEqual('-0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3600
     * @tc.name testFloatToString036
     * @tc.desc Verify Float.toString(Float.MIN_VALUE) returns '1e-45'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.MIN_VALUE)).assertEqual('1e-45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3700
     * @tc.name testFloatToString037
     * @tc.desc Verify Float.toString(Float.MAX_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.MAX_VALUE)).assertEqual(new Float(Float.MAX_VALUE).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3800
     * @tc.name testFloatToString038
     * @tc.desc Verify Float.toString(Float.MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.MIN_VALUE)).assertEqual(new Float(Float.MIN_VALUE).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_3900
     * @tc.name testFloatToString039
     * @tc.desc Verify Float.toString(Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN)).assertEqual(new Float(Float.NaN).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4000
     * @tc.name testFloatToString040
     * @tc.desc Verify Float.toString(float) throws ClassCastError when passing unsupported type 37 as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const val: int = 37;
        Float.toString(val as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4100
     * @tc.name testFloatToString041
     * @tc.desc Verify Float.toString(0.0001f) returns '0.0001'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(0.0001f)).assertEqual('0.0001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4200
     * @tc.name testFloatToString042
     * @tc.desc Verify Float.toString(1.0f + 2.0f) returns '3'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(1.0f + 2.0f)).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4300
     * @tc.name testFloatToString043
     * @tc.desc Verify Float.toString(3.0f * 4.0f) returns '12'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(3.0f * 4.0f)).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4400
     * @tc.name testFloatToString044
     * @tc.desc Verify consistency: Float.toString(f) equals new Float(f).toString()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = 255.0f;
      expect(Float.toString(f)).assertEqual(new Float(f).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4500
     * @tc.name testFloatToString045
     * @tc.desc Verify Float.toString(0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.0f);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4600
     * @tc.name testFloatToString046
     * @tc.desc Verify Float.toString(-0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-0.0f);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4700
     * @tc.name testFloatToString047
     * @tc.desc Verify Float.toString(0.5f) returns '0.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.5f);
      expect(result).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4800
     * @tc.name testFloatToString048
     * @tc.desc Verify Float.toString(0.25f) returns '0.25'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.25f);
      expect(result).assertEqual('0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_4900
     * @tc.name testFloatToString049
     * @tc.desc Verify Float.toString(0.125f) returns '0.125'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.125f);
      expect(result).assertEqual('0.125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5000
     * @tc.name testFloatToString050
     * @tc.desc Verify Float.toString(-0.5f) returns '-0.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-0.5f);
      expect(result).assertEqual('-0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5100
     * @tc.name testFloatToString051
     * @tc.desc Verify Float.toString(-0.25f) returns '-0.25'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-0.25f);
      expect(result).assertEqual('-0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5200
     * @tc.name testFloatToString052
     * @tc.desc Verify Float.toString(-0.125f) returns '-0.125'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-0.125f);
      expect(result).assertEqual('-0.125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5300
     * @tc.name testFloatToString053
     * @tc.desc Verify Float.toString(1.0f/3.0f) returns '0.33333334'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(1.0f / 3.0f);
      expect(result).assertEqual('0.33333334');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5400
     * @tc.name testFloatToString054
     * @tc.desc Verify Float.toString(Float.MAX_SAFE_INTEGER) returns '16777215'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_SAFE_INTEGER);
      expect(result).assertEqual('16777215');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5500
     * @tc.name testFloatToString055
     * @tc.desc Verify Float.toString(-Float.MAX_SAFE_INTEGER) returns '-16777215'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-Float.MAX_SAFE_INTEGER);
      expect(result).assertEqual('-16777215');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5600
     * @tc.name testFloatToString056
     * @tc.desc Verify Float.toString(Float.DELTA) returns scientific notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.DELTA);
      expect(result).assertContain('1.19');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5700
     * @tc.name testFloatToString057
     * @tc.desc Verify Float.toString(Float.EPSILON) returns scientific notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.EPSILON);
      expect(result).assertContain('1.19');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART2_5800
     * @tc.name testFloatToString058
     * @tc.desc Verify Float.toString(16777216.0f) returns '16777216'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(16777216.0f);
      expect(result).assertEqual('16777216');
    });

  });
}
