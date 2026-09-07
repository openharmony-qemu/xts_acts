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

export default function FloatToString3Test2(): void {
  describe('FloatToString3Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0100
     * @tc.name testFloatToString001
     * @tc.desc Verify toString(int) throws ClassCastError when passing Chinese text string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const s: string = '中文';
        f.toString(s as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0200
     * @tc.name testFloatToString002
     * @tc.desc Verify toString(int) throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        const f: Float = new Float(1.0);
        f.toString(longStr as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0300
     * @tc.name testFloatToString003
     * @tc.desc Verify toString(int) throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const bigVal: bigint = 123n;
      try {
        const f: Float = new Float(1.0);
        f.toString(bigVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0400
     * @tc.name testFloatToString004
     * @tc.desc Verify toString(int) throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
        const f: Float = new Float(1.0);
        f.toString(dateVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0500
     * @tc.name testFloatToString005
     * @tc.desc Verify toString(int) throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test');
      try {
        const f: Float = new Float(1.0);
        f.toString(regVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0600
     * @tc.name testFloatToString006
     * @tc.desc Verify toString(int) throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        const f: Float = new Float(1.0);
        f.toString(wm as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0700
     * @tc.name testFloatToString007
     * @tc.desc Verify toString(int) throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        const f: Float = new Float(1.0);
        f.toString(ws as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0800
     * @tc.name testFloatToString008
     * @tc.desc Verify toString(int) throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        const f: Float = new Float(1.0);
        f.toString(jsonData as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_0900
     * @tc.name testFloatToString009
     * @tc.desc Verify toString(float 10.0f, radix 2) returns '1010'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 10.0f;
      const f: Float = new Float(val);
      expect(f.toString(2)).assertEqual('1010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1000
     * @tc.name testFloatToString010
     * @tc.desc Verify toString(float 255.0f, radix 16) returns 'ff'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 255.0f;
      const f: Float = new Float(val);
      expect(f.toString(16)).assertEqual('ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1100
     * @tc.name testFloatToString011
     * @tc.desc Verify toString(int 42) returns '42'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      const f: Float = new Float(val);
      expect(f.toString(10)).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1200
     * @tc.name testFloatToString012
     * @tc.desc Verify toString(long 100, radix 8) returns '144'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      const f: Float = new Float(val);
      expect(f.toString(8)).assertEqual('144');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1300
     * @tc.name testFloatToString013
     * @tc.desc Verify toString(float -255.0f) returns '-ff'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -255.0f;
      const f: Float = new Float(val);
      expect(f.toString(16)).assertEqual('-ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1400
     * @tc.name testFloatToString014
     * @tc.desc Verify toString(float 1.0e3f, radix 2) returns '1111101000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      const f: Float = new Float(val);
      expect(f.toString(2)).assertEqual('1111101000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1500
     * @tc.name testFloatToString015
     * @tc.desc Verify toString(float Float.NaN) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      const f: Float = new Float(val);
      expect(f.toString(16)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1600
     * @tc.name testFloatToString016
     * @tc.desc Verify toString(float Float.POSITIVE_INFINITY) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.toString(8)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1700
     * @tc.name testFloatToString017
     * @tc.desc Verify toString(float Float.NEGATIVE_INFINITY) returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.toString(2)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1800
     * @tc.name testFloatToString018
     * @tc.desc Verify toString(16) for 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const original: float = f.toFloat();
      f.toString(16);
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_1900
     * @tc.name testFloatToString019
     * @tc.desc Verify toString(Float(255.0), radix 16) idempotency: multiple calls return the same string result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(255.0);
      const r1: string = f.toString(16);
      const r2: string = f.toString(16);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2000
     * @tc.name testFloatToString020
     * @tc.desc Verify toString(Float new Float(100.0)) returns '144'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(100.0);
      expect(val.toString(8)).assertEqual('144');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2100
     * @tc.name testFloatToString021
     * @tc.desc Verify toString(16) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      expect(f.toString(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2200
     * @tc.name testFloatToString022
     * @tc.desc Verify toString(Float(255.0f), radix 2) returns '11111111'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(255.0f).toString(2);
      expect(result).assertEqual('11111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2300
     * @tc.name testFloatToString023
     * @tc.desc Verify toString(Float(10.0f), radix 16) returns 'a'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(10.0f).toString(16);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2400
     * @tc.name testFloatToString024
     * @tc.desc Verify toString(3) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(0.0f).toString(3)).assertEqual('0');
      expect(new Float(2.0f).toString(3)).assertEqual('2');
      expect(new Float(3.0f).toString(3)).assertEqual('10');
      expect(new Float(9.0f).toString(3)).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2500
     * @tc.name testFloatToString025
     * @tc.desc Verify toString(11) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(0.0f).toString(11)).assertEqual('0');
      expect(new Float(10.0f).toString(11)).assertEqual('a');
      expect(new Float(11.0f).toString(11)).assertEqual('10');
      expect(new Float(121.0f).toString(11)).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2600
     * @tc.name testFloatToString026
     * @tc.desc Verify toString(16) for Float.toString(v, r)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 255.0f;
      const r: int = 16;
      expect(new Float(v).toString(r)).assertEqual(Float.toString(v, r));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2700
     * @tc.name testFloatToString027
     * @tc.desc Verify toString(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 1024.0f;
      expect(new Float(v).toString(2)).assertEqual(Float.toString(v, 2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2800
     * @tc.name testFloatToString028
     * @tc.desc Verify toString(10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 42.5f;
      expect(new Float(v).toString(10)).assertEqual(new Float(v).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_2900
     * @tc.name testFloatToString029
     * @tc.desc Verify toString(10) returns f.toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.14f);
      expect(f.toString(10)).assertEqual(f.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3000
     * @tc.name testFloatToString030
     * @tc.desc Verify toString(10) returns '3.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(3.5f).toString(10)).assertEqual('3.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3100
     * @tc.name testFloatToString031
     * @tc.desc Verify toString(10) returns '-3.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(-3.5f).toString(10)).assertEqual('-3.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3200
     * @tc.name testFloatToString032
     * @tc.desc Verify toString(2) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      for (let r: int = 2; r <= 36; r++) {
        expect(f.toString(r)).assertEqual('0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3300
     * @tc.name testFloatToString033
     * @tc.desc Verify toString(2) on -0.0f returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(-0.0f).toString(2)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3400
     * @tc.name testFloatToString034
     * @tc.desc Verify toString(36) on -0.0f returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(-0.0f).toString(36)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3500
     * @tc.name testFloatToString035
     * @tc.desc Verify toString(2) on NaN returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.NaN).toString(2)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3600
     * @tc.name testFloatToString036
     * @tc.desc Verify toString(8) on NaN returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.NaN).toString(8)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3700
     * @tc.name testFloatToString037
     * @tc.desc Verify toString(10) on NaN returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.NaN).toString(10)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3800
     * @tc.name testFloatToString038
     * @tc.desc Verify toString(36) on NaN returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.NaN).toString(36)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_3900
     * @tc.name testFloatToString039
     * @tc.desc Verify toString(3) on POSITIVE_INFINITY returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.POSITIVE_INFINITY).toString(3)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4000
     * @tc.name testFloatToString040
     * @tc.desc Verify toString(16) on POSITIVE_INFINITY returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.POSITIVE_INFINITY).toString(16)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4100
     * @tc.name testFloatToString041
     * @tc.desc Verify toString(36) on POSITIVE_INFINITY returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.POSITIVE_INFINITY).toString(36)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4200
     * @tc.name testFloatToString042
     * @tc.desc Verify toString(3) on NEGATIVE_INFINITY returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.NEGATIVE_INFINITY).toString(3)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4300
     * @tc.name testFloatToString043
     * @tc.desc Verify toString(16) on NEGATIVE_INFINITY returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.NEGATIVE_INFINITY).toString(16)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4400
     * @tc.name testFloatToString044
     * @tc.desc Verify toString(36) on NEGATIVE_INFINITY returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.NEGATIVE_INFINITY).toString(36)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4500
     * @tc.name testFloatToString045
     * @tc.desc Verify toString(2) returns '1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(1.0f).toString(2)).assertEqual('1');
      expect(new Float(2.0f).toString(2)).assertEqual('10');
      expect(new Float(4.0f).toString(2)).assertEqual('100');
      expect(new Float(8.0f).toString(2)).assertEqual('1000');
      expect(new Float(16.0f).toString(2)).assertEqual('10000');
      expect(new Float(32.0f).toString(2)).assertEqual('100000');
      expect(new Float(64.0f).toString(2)).assertEqual('1000000');
      expect(new Float(128.0f).toString(2)).assertEqual('10000000');
      expect(new Float(256.0f).toString(2)).assertEqual('100000000');
      expect(new Float(512.0f).toString(2)).assertEqual('1000000000');
      expect(new Float(1024.0f).toString(2)).assertEqual('10000000000');
      expect(new Float(2048.0f).toString(2)).assertEqual('100000000000');
      expect(new Float(4096.0f).toString(2)).assertEqual('1000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4600
     * @tc.name testFloatToString046
     * @tc.desc Verify toString(8) returns '1000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(512.0f).toString(8)).assertEqual('1000');
      expect(new Float(4096.0f).toString(8)).assertEqual('10000');
      expect(new Float(32768.0f).toString(8)).assertEqual('100000');
      expect(new Float(262144.0f).toString(8)).assertEqual('1000000');
      expect(new Float(2097152.0f).toString(8)).assertEqual('10000000');
      expect(new Float(16777216.0f).toString(8)).assertEqual('100000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4700
     * @tc.name testFloatToString047
     * @tc.desc Verify toString(10) returns '3.4028235e+38'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.MAX_VALUE).toString(10)).assertEqual('3.4028235e+38');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4800
     * @tc.name testFloatToString048
     * @tc.desc Verify toString(10) returns '1e-45'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(Float.MIN_VALUE).toString(10)).assertEqual('1e-45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_4900
     * @tc.name testFloatToString049
     * @tc.desc Verify toString(16) returns 'FF'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(255.0f).toString(16).toUpperCase();
      expect(result).assertEqual('FF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5000
     * @tc.name testFloatToString050
     * @tc.desc Verify toString(16) returns 'ff' for 255.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(255.0);
      expect(f.toString(16)).assertEqual('ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5100
     * @tc.name testFloatToString051
     * @tc.desc Verify toString(16) idempotency: multiple calls with float value 255.0f return the same string result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(255.0f);
      const r1: string = f.toString(16);
      const r2: string = f.toString(16);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5200
     * @tc.name testFloatToString052
     * @tc.desc Verify toString(byte 127) returns '1111111'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 127 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(2);
      expect(result).assertEqual('1111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5300
     * @tc.name testFloatToString053
     * @tc.desc Verify toString(byte 127) returns '177'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 127 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(8);
      expect(result).assertEqual('177');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5400
     * @tc.name testFloatToString054
     * @tc.desc Verify toString(byte 127) returns '127'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 127 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(10);
      expect(result).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5500
     * @tc.name testFloatToString055
     * @tc.desc Verify toString(byte 127) returns '7f'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 127 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(16);
      expect(result).assertEqual('7f');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5600
     * @tc.name testFloatToString056
     * @tc.desc Verify toString(byte 127) returns '3j'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 127 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(36);
      expect(result).assertEqual('3j');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5700
     * @tc.name testFloatToString057
     * @tc.desc Verify toString(byte -128) returns '-200'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(8);
      expect(result).assertEqual('-200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5800
     * @tc.name testFloatToString058
     * @tc.desc Verify toString(byte -128) returns '-128'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(10);
      expect(result).assertEqual('-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_5900
     * @tc.name testFloatToString059
     * @tc.desc Verify toString(byte -128) returns '-80'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(16);
      expect(result).assertEqual('-80');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6000
     * @tc.name testFloatToString060
     * @tc.desc Verify toString(byte -128) returns '-3k'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const f: Float = new Float(val);
      const result: string = f.toString(36);
      expect(result).assertEqual('-3k');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6100
     * @tc.name testFloatToString061
     * @tc.desc Verify toString(short 32767) returns '77777'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 32767 as short;
      const f: Float = new Float(val);
      const result: string = f.toString(8);
      expect(result).assertEqual('77777');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6200
     * @tc.name testFloatToString062
     * @tc.desc Verify toString(short 32767) returns '32767'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 32767 as short;
      const f: Float = new Float(val);
      const result: string = f.toString(10);
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6300
     * @tc.name testFloatToString063
     * @tc.desc Verify toString(short 32767) returns '7fff'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 32767 as short;
      const f: Float = new Float(val);
      const result: string = f.toString(16);
      expect(result).assertEqual('7fff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6400
     * @tc.name testFloatToString064
     * @tc.desc Verify toString(short 32767) returns 'pa7'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 32767 as short;
      const f: Float = new Float(val);
      const result: string = f.toString(36);
      expect(result).assertEqual('pa7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6500
     * @tc.name testFloatToString065
     * @tc.desc Verify toString(short -32768) returns '-100000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const f: Float = new Float(val);
      const result: string = f.toString(8);
      expect(result).assertEqual('-100000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6600
     * @tc.name testFloatToString066
     * @tc.desc Verify toString(short -32768) returns '-pa8'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const f: Float = new Float(val);
      const result: string = f.toString(36);
      expect(result).assertEqual('-pa8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6700
     * @tc.name testFloatToString067
     * @tc.desc Verify toString(int 2147483647) returns '2147483600'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const f: Float = new Float(val);
      const result: string = f.toString(10);
      expect(result).assertEqual('2147483600');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6800
     * @tc.name testFloatToString068
     * @tc.desc Verify toString(int 2147483647) returns 'zik10k'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const f: Float = new Float(val);
      const result: string = f.toString(36);
      expect(result).assertEqual('zik10k');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_6900
     * @tc.name testFloatToString069
     * @tc.desc Verify toString(int -2147483648) returns '-2147483600'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      const f: Float = new Float(val);
      const result: string = f.toString(10);
      expect(result).assertEqual('-2147483600');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7000
     * @tc.name testFloatToString070
     * @tc.desc Verify toString(int -2147483648) returns '-zik10k'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      const f: Float = new Float(val);
      const result: string = f.toString(36);
      expect(result).assertEqual('-zik10k');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7100
     * @tc.name testFloatToString071
     * @tc.desc Verify toString(int 2147483647) returns '80000000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const f: Float = new Float(val);
      const result: string = f.toString(16);
      expect(result).assertEqual('80000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7200
     * @tc.name testFloatToString072
     * @tc.desc Verify toString(int -2147483648) returns '-80000000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      const f: Float = new Float(val);
      const result: string = f.toString(16);
      expect(result).assertEqual('-80000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7300
     * @tc.name testFloatToString073
     * @tc.desc Verify toString(2) on Float(0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      const result: string = f.toString(2);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7400
     * @tc.name testFloatToString074
     * @tc.desc Verify toString(2) on Float(1.0f) returns '1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0f);
      const result: string = f.toString(2);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7500
     * @tc.name testFloatToString075
     * @tc.desc Verify toString(2) on Float(42.0f) returns '101010'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0f);
      const result: string = f.toString(2);
      expect(result).assertEqual('101010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7600
     * @tc.name testFloatToString076
     * @tc.desc Verify toString(2) on Float(-1.0f) returns '-1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1.0f);
      const result: string = f.toString(2);
      expect(result).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7700
     * @tc.name testFloatToString077
     * @tc.desc Verify toString(2) on Float(-255.0f) returns '-11111111'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-255.0f);
      const result: string = f.toString(2);
      expect(result).assertEqual('-11111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7800
     * @tc.name testFloatToString078
     * @tc.desc Verify toString(8) on Float(0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      const result: string = f.toString(8);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_7900
     * @tc.name testFloatToString079
     * @tc.desc Verify toString(10) on Float(0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      const result: string = f.toString(10);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_8000
     * @tc.name testFloatToString080
     * @tc.desc Verify toString(16) on Float(0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      const result: string = f.toString(16);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_8100
     * @tc.name testFloatToString081
     * @tc.desc Verify toString(16) on Float(4096.0f) returns '1000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(4096.0f);
      const result: string = f.toString(16);
      expect(result).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_8200
     * @tc.name testFloatToString082
     * @tc.desc Verify toString(16) on Float(-16.0f) returns '-10'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-16.0f);
      const result: string = f.toString(16);
      expect(result).assertEqual('-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_8300
     * @tc.name testFloatToString083
     * @tc.desc Verify toString(36) on Float(0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      const result: string = f.toString(36);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_8400
     * @tc.name testFloatToString084
     * @tc.desc Verify toString(36) on Float(36.0f) returns '10'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(36.0f);
      const result: string = f.toString(36);
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_8500
     * @tc.name testFloatToString085
     * @tc.desc Verify toString(36) on Float(100.0f) returns '2s'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(100.0f);
      const result: string = f.toString(36);
      expect(result).assertEqual('2s');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_8600
     * @tc.name testFloatToString086
     * @tc.desc Verify toString(36) on Float(-36.0f) returns '-10'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-36.0f);
      const result: string = f.toString(36);
      expect(result).assertEqual('-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART3_8700
     * @tc.name testFloatToString087
     * @tc.desc Verify toString(2) on Float(Float.POSITIVE_INFINITY) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.POSITIVE_INFINITY);
      const result: string = f.toString(2);
      expect(result).assertEqual('Infinity');
    });

  })
}
