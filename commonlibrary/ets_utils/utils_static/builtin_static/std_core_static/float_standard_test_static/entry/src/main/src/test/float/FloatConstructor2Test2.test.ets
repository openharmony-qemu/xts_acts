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

export default function FloatConstructor2Test2(): void {
  describe('FloatConstructor2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0010
     * @tc.name testFloatConstructorFloat001
     * @tc.desc Verify toFloat() on Float(3) returns 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 3;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0020
     * @tc.name testFloatConstructorFloat002
     * @tc.desc Verify toFloat() on Float(127) returns 127.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 127 as short;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0030
     * @tc.name testFloatConstructorFloat003
     * @tc.desc Verify toFloat() on Float(-32768) returns -32768.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0040
     * @tc.name testFloatConstructorFloat004
     * @tc.desc Verify toFloat() on Float(12) returns 12.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(12.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0050
     * @tc.name testFloatConstructorFloat005
     * @tc.desc Verify toFloat() on Float(-128) returns -128.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(-128.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0060
     * @tc.name testFloatConstructorFloat006
     * @tc.desc Verify toFloat() on Float(9.0f) returns 9.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 9.0f;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0070
     * @tc.name testFloatConstructorFloat007
     * @tc.desc Verify toFloat() on Float(-4.0f) returns -4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -4.0f;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(-4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0080
     * @tc.name testFloatConstructorFloat008
     * @tc.desc Verify toFloat() on Float(0xFF) returns 255.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 0xFF;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(255.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0090
     * @tc.name testFloatConstructorFloat009
     * @tc.desc Verify toFloat() on Float(0o10) returns 8.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 0o10;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0100
     * @tc.name testFloatConstructorFloat010
     * @tc.desc Verify toFloat() on Float(0o77) returns 63.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 0o77;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(63.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0110
     * @tc.name testFloatConstructorFloat011
     * @tc.desc Verify toFloat() on Float(0b1010) returns 10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 0b1010;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0120
     * @tc.name testFloatConstructorFloat012
     * @tc.desc Verify toFloat() on Float(1.0e-10f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e-10f;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertLarger(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0130
     * @tc.name testFloatConstructorFloat013
     * @tc.desc Verify toFloat() on Float(-1.0e-40f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -1.0e-40f;
      const f: Float = new Float(val);
      expect(f.toFloat()).assertLess(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0140
     * @tc.name testFloatConstructorFloat014
     * @tc.desc Verify toString(float Float.POSITIVE_INFINITY) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0150
     * @tc.name testFloatConstructorFloat015
     * @tc.desc Verify toString(float Float.NEGATIVE_INFINITY) returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0160
     * @tc.name testFloatConstructorFloat016
     * @tc.desc Verify 1.0f / toFloat() on Float(-0.0f) returns Float.NEGATIVE_INFINITY (confirming sign of negative zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f;
      const f: Float = new Float(val);
      const signCheck: float = 1.0f / f.toFloat();
      expect(Float.isFinite(signCheck)).assertFalse(); expect(Float.isNaN(signCheck)).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0170
     * @tc.name testFloatConstructorFloat017
     * @tc.desc Verify toByte() on Float(1.5f) returns 1 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      const f: Float = new Float(val);
      expect(f.toByte()).assertEqual(1 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0180
     * @tc.name testFloatConstructorFloat018
     * @tc.desc Verify toShort() on Float(1024.0f) returns 1024 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1024.0f;
      const f: Float = new Float(val);
      expect(f.toShort()).assertEqual(1024 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0190
     * @tc.name testFloatConstructorFloat019
     * @tc.desc Verify toLong() on Float(100.0f) returns 100 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 100.0f;
      const f: Float = new Float(val);
      expect(f.toLong()).assertEqual(100 as long);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0200
     * @tc.name testFloatConstructorFloat020
     * @tc.desc Verify equals(float 0.5f, float 2.5f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 0.5f;
      const val2: float = 2.5f;
      const f1: Float = new Float(val1);
      const f2: Float = new Float(val2);
      expect(f1.equals(f2)).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0210
     * @tc.name testFloatConstructorFloat021
     * @tc.desc Verify constructor(true) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(true as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0220
     * @tc.name testFloatConstructorFloat022
     * @tc.desc Verify constructor([1]) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float([1] as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0230
     * @tc.name testFloatConstructorFloat023
     * @tc.desc Verify constructor(new Object()) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(new Object() as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0240
     * @tc.name testFloatConstructorFloat024
     * @tc.desc Verify constructor('😀') throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float('😀' as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0250
     * @tc.name testFloatConstructorFloat025
     * @tc.desc Verify constructor('x'.repeat(65535)) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'x'.repeat(65535);
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0260
     * @tc.name testFloatConstructorFloat026
     * @tc.desc Verify Float constructor with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0270
     * @tc.name testFloatConstructorFloat027
     * @tc.desc Verify Float constructor with mixed array [1, 'test', true] throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1, 'test', true];
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0280
     * @tc.name testFloatConstructorFloat028
     * @tc.desc Verify constructor(matrix) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: int[][] = [];
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0290
     * @tc.name testFloatConstructorFloat029
     * @tc.desc Verify constructor(list) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0300
     * @tc.name testFloatConstructorFloat030
     * @tc.desc Verify constructor(123n) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const methodFunc: Object = new Object();
        const objFunc: Object = methodFunc as Object;
        new Float(123n as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0310
     * @tc.name testFloatConstructorFloat031
     * @tc.desc Verify constructor({} as Object as float) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0320
     * @tc.name testFloatConstructorFloat032
     * @tc.desc Verify constructor(new JsonData()) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        new Float(jsonData as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0330
     * @tc.name testFloatConstructorFloat033
     * @tc.desc Verify constructor(123n) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: bigint = 123n;
      try {
        new Float(bigVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0340
     * @tc.name testFloatConstructorFloat034
     * @tc.desc Verify constructor(new Date()) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        new Float(dateVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0350
     * @tc.name testFloatConstructorFloat035
     * @tc.desc Verify constructor(new RegExp('test')) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        new Float(regVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0360
     * @tc.name testFloatConstructorFloat036
     * @tc.desc Verify constructor(rec) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {'key': 1};
      try {
        new Float(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0370
     * @tc.name testFloatConstructorFloat037
     * @tc.desc Verify constructor(wm) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        new Float(wm as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0380
     * @tc.name testFloatConstructorFloat038
     * @tc.desc Verify new Float(float) throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        new Float(ws as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0390
     * @tc.name testFloatConstructorFloat039
     * @tc.desc Verify Float constructor: toFloat() on float value 1.0e-3f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e-3f);
      expect(value.toFloat()).assertLarger(0.0f);
      expect(value.toFloat()).assertLess(1.0f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0400
     * @tc.name testFloatConstructorFloat040
     * @tc.desc Verify Float constructor: toFloat() on float value 1.4e-45f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.4e-45f);
      expect(value.toFloat()).assertLarger(0.0f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0410
     * @tc.name testFloatConstructorFloat041
     * @tc.desc Verify Float constructor: toFloat() on float value -1.0e10f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-1.0e10f);
      expect(value.toFloat()).assertLess(0.0f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0420
     * @tc.name testFloatConstructorFloat042
     * @tc.desc Verify Float constructor: toFloat() on float value 1.0e-5f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e-5f);
      expect(value.toFloat()).assertLarger(0.0f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0430
     * @tc.name testFloatConstructorFloat043
     * @tc.desc Verify Float constructor: toFloat() on float value -1.0e-3f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-1.0e-3f);
      expect(value.toFloat()).assertLess(0.0f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0440
     * @tc.name testFloatConstructorFloat044
     * @tc.desc Verify toFloat() on Float(4194304.0f) returns 4194304.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(4194304.0f);
      expect(value.toFloat()).assertEqual(4194304.0f);
      expect(value.isInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0450
     * @tc.name testFloatConstructorFloat045
     * @tc.desc Verify Float constructor: toFloat() on float value Float.MIN_VALUE / 4.0f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MIN_VALUE / 4.0f);
      expect(value.toFloat()).assertLargerOrEqual(0.0f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0460
     * @tc.name testFloatConstructorFloat046
     * @tc.desc Verify Float constructor: toFloat() on float value Float.MIN_VALUE * 3.0f / 2.0f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const subnormalVal: float = Float.MIN_VALUE * 3.0f / 2.0f;
      const value: Float = new Float(subnormalVal);
      expect(value.toFloat()).assertLarger(Float.MIN_VALUE);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0470
     * @tc.name testFloatConstructorFloat047
     * @tc.desc Verify Float constructor: toFloat() on float value -Float.MIN_VALUE / 4.0f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-Float.MIN_VALUE / 4.0f);
      expect(value.toFloat()).assertLessOrEqual(0.0f);
      expect(value.toFloat()).assertLarger(-Float.MIN_VALUE);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0480
     * @tc.name testFloatConstructorFloat048
     * @tc.desc Verify isGreaterThan(new Float(0.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const subnormal: Float = new Float(Float.MIN_VALUE / 2.0f);
      const zero: Float = new Float(0.0f);
      expect(subnormal.isGreaterThan(zero)).assertFalse();
      expect(subnormal.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0490
     * @tc.name testFloatConstructorFloat049
     * @tc.desc Verify add(new Float(2.5f)) returns 7.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(1.5f).add(new Float(2.5f)).add(new Float(3.0f));
      expect(result.toFloat()).assertEqual(7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0500
     * @tc.name testFloatConstructorFloat050
     * @tc.desc Verify sub(new Float(3.0f)) returns 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(10.0f).sub(new Float(3.0f)).sub(new Float(2.0f));
      expect(result.toFloat()).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0510
     * @tc.name testFloatConstructorFloat051
     * @tc.desc Verify mul(new Float(3.0f)) returns 24.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(2.0f).mul(new Float(3.0f)).mul(new Float(4.0f));
      expect(result.toFloat()).assertEqual(24.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0520
     * @tc.name testFloatConstructorFloat052
     * @tc.desc Verify div(new Float(2.0f)) returns 10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(100.0f).div(new Float(2.0f)).div(new Float(5.0f));
      expect(result.toFloat()).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0530
     * @tc.name testFloatConstructorFloat053
     * @tc.desc Verify chained add then mul() on Float(1.0f) returns 9.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(1.0f).add(new Float(2.0f)).mul(new Float(3.0f));
      expect(result.toFloat()).assertEqual(9.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0540
     * @tc.name testFloatConstructorFloat054
     * @tc.desc Verify chained add then sub() on Float(5.0f) returns 6.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(5.0f).add(new Float(3.0f)).sub(new Float(2.0f));
      expect(result.toFloat()).assertEqual(6.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0550
     * @tc.name testFloatConstructorFloat055
     * @tc.desc Verify chained mul then div() on Float(6.0f) returns 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(6.0f).mul(new Float(2.0f)).div(new Float(3.0f));
      expect(result.toFloat()).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0560
     * @tc.name testFloatConstructorFloat056
     * @tc.desc Verify compareTo(new Float(2.0f))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cmpResult: int = new Float(1.5f).compareTo(new Float(2.0f));
      expect(cmpResult).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0570
     * @tc.name testFloatConstructorFloat057
     * @tc.desc Verify isLessThan(new Float(5.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isLess: boolean = new Float(1.0f).isLessThan(new Float(5.0f));
      expect(isLess).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0580
     * @tc.name testFloatConstructorFloat058
     * @tc.desc Verify isLessEqualThan(new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isLessEq: boolean = new Float(1.0f).isLessEqualThan(new Float(1.0f));
      expect(isLessEq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0590
     * @tc.name testFloatConstructorFloat059
     * @tc.desc Verify isGreaterThan(new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isGreater: boolean = new Float(10.0f).isGreaterThan(new Float(1.0f));
      expect(isGreater).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0600
     * @tc.name testFloatConstructorFloat060
     * @tc.desc Verify isGreaterEqualThan(new Float(10.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isGreaterEq: boolean = new Float(10.0f).isGreaterEqualThan(new Float(10.0f));
      expect(isGreaterEq).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0610
     * @tc.name testFloatConstructorFloat061
     * @tc.desc Verify toFloat() on Float(1.0f), Float(2.0f), Float(3.0f) returns 1.0f, 2.0f, 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const c: Float = new Float(3.0f);
      expect(a.toFloat()).assertEqual(1.0f);
      expect(b.toFloat()).assertEqual(2.0f);
      expect(c.toFloat()).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0620
     * @tc.name testFloatConstructorFloat062
     * @tc.desc Verify add( new Float(10.0f),  new Float(10.0f)) returns 15.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
      const b: Float = new Float(10.0f);
      const aResult: Float = a.add(new Float(5.0f));
      const bResult: Float = b.sub(new Float(3.0f));
      expect(aResult.toFloat()).assertEqual(15.0f);
      expect(bResult.toFloat()).assertEqual(7.0f);
      expect(a.toFloat()).assertEqual(10.0f);
      expect(b.toFloat()).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0630
     * @tc.name testFloatConstructorFloat063
     * @tc.desc Verify equals( new Float(1.5f),  new Float(1.5f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5f);
      const b: Float = new Float(1.5f);
      const c: Float = new Float(2.5f);
      expect(a.equals(b)).assertTrue();
      expect(a.equals(c)).assertFalse();
      expect(b.equals(c)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0640
     * @tc.name testFloatConstructorFloat064
     * @tc.desc Verify Float(1.5f) equals Float(1.5 as double) and toFloat() values match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatFromFloat: Float = new Float(1.5f);
      const floatFromDouble: Float = new Float(1.5 as double);
      expect(floatFromFloat.equals(floatFromDouble)).assertTrue();
      expect(floatFromFloat.toFloat()).assertEqual(floatFromDouble.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0650
     * @tc.name testFloatConstructorFloat065
     * @tc.desc Verify Float(3.14f) equals Float(3.14 as double)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatFromFloat: Float = new Float(3.14f);
      const floatFromDouble: Float = new Float(3.14 as double);
      expect(floatFromFloat.equals(floatFromDouble)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0660
     * @tc.name testFloatConstructorFloat066
     * @tc.desc Verify toInt() on Float(100.0f) returns floatFromDouble.toInt()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatFromFloat: Float = new Float(100.0f);
      const floatFromDouble: Float = new Float(100.0 as double);
      expect(floatFromFloat.equals(floatFromDouble)).assertTrue();
      expect(floatFromFloat.toInt()).assertEqual(floatFromDouble.toInt());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0670
     * @tc.name testFloatConstructorFloat067
     * @tc.desc Verify toFloat() on Float(0.0f) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatFromFloat: Float = new Float(0.0f);
      const floatFromDouble: Float = new Float(0.0 as double);
      expect(floatFromFloat.equals(floatFromDouble)).assertTrue();
      expect(floatFromFloat.toFloat()).assertEqual(0.0f);
      expect(floatFromDouble.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0680
     * @tc.name testFloatConstructorFloat068
     * @tc.desc Verify chained not then assertUndefined() on Float(3.14f) returns 3.14f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Float | undefined = undefined;
      value = new Float(3.14f);
      expect(value).not().assertUndefined();
      if (value !== undefined) {
        expect(value.toFloat()).assertEqual(3.14f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0690
     * @tc.name testFloatConstructorFloat069
     * @tc.desc Verify toFloat() on Float(5.0f) returns 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float | null = new Float(5.0f);
      if (value !== null) {
        expect(value.toFloat()).assertEqual(5.0f);
        expect(value.isInteger()).assertTrue();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0700
     * @tc.name testFloatConstructorFloat070
     * @tc.desc Verify chained not then assertUndefined() on Float(99.0f) returns 99.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float | undefined = new Float(99.0f);
      expect(result).not().assertUndefined();
      if (result !== undefined) {
        expect(result.toFloat()).assertEqual(99.0f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0710
     * @tc.name testFloatConstructorFloat071
     * @tc.desc Verify isFinite() on Float(7.5f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Float | null = null;
      let wasNull: boolean = true;
      value = new Float(7.5f);
      if (value !== null) {
        wasNull = false;
        expect(value.isFinite()).assertTrue();
      }
      expect(wasNull).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0720
     * @tc.name testFloatConstructorFloat072
     * @tc.desc Verify Float constructor: toFloat() on float NaN, isNaN returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: Float = new Float(Float.NaN);
      expect(isNaN(nanValue.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0730
     * @tc.name testFloatConstructorFloat073
     * @tc.desc Verify Float constructor: toFloat() on float 3.14f, isFinite returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(3.14f);
      expect(isFinite(value.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0740
     * @tc.name testFloatConstructorFloat074
     * @tc.desc Verify Float constructor: toFloat() on float 42.0f, Float.isInteger returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(42.0f);
      expect(Float.isInteger(value.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0750
     * @tc.name testFloatConstructorFloat075
     * @tc.desc Verify Float constructor: toFloat() on float 100.0f, Float.isSafeInteger returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(100.0f);
      expect(Float.isSafeInteger(value.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0760
     * @tc.name testFloatConstructorFloat076
     * @tc.desc Verify Float.toString(toFloat()) on Float(3.14f) returns '3.14'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(3.14f);
      const str: string = Float.toString(value.toFloat());
      expect(str).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0770
     * @tc.name testFloatConstructorFloat077
     * @tc.desc Verify toFloat() on Float(1.5f) returns 1.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Float = new Float(1.5f);
      const copy: Float = new Float(original.toFloat());
      expect(copy.toFloat()).assertEqual(1.5f);
      expect(original.equals(copy)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0780
     * @tc.name testFloatConstructorFloat078
     * @tc.desc Verify reconstructing Float from source.toFloat() preserves value and equals source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float = new Float(3.14f);
      const target: Float = new Float(source.toFloat());
      expect(target.toFloat()).assertEqual(3.14f);
      expect(source.equals(target)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0790
     * @tc.name testFloatConstructorFloat079
     * @tc.desc Verify toFloat() on Float(Float.NaN) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: Float = new Float(Float.NaN);
      const nanCopy: Float = new Float(nanValue.toFloat());
      expect(nanCopy.isNaN()).assertTrue();
      expect(isNaN(nanCopy.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0800
     * @tc.name testFloatConstructorFloat080
     * @tc.desc Verify Float constructor: toFloat() on float POSITIVE_INFINITY, isFinite returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const infValue: Float = new Float(Float.POSITIVE_INFINITY);
      const infCopy: Float = new Float(infValue.toFloat());
      expect(infCopy.isFinite()).assertFalse();
      expect(infCopy.isGreaterThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0810
     * @tc.name testFloatConstructorFloat081
     * @tc.desc Verify toFloat() on Float(Float.DELTA) returns Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.DELTA);
      expect(value.toFloat()).assertEqual(Float.DELTA);
      expect(value.toFloat()).assertLarger(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0820
     * @tc.name testFloatConstructorFloat082
     * @tc.desc Verify isNaN() on Float(1.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0f);
      expect(value.isNaN()).assertFalse();
      expect(value.isFinite()).assertTrue();
      expect(value.isInteger()).assertTrue();
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0830
     * @tc.name testFloatConstructorFloat083
     * @tc.desc Verify toFloat() on Float(-Float.MAX_VALUE) returns -Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-Float.MAX_VALUE);
      expect(value.toFloat()).assertEqual(-Float.MAX_VALUE);
      expect(value.isFinite()).assertTrue();
      expect(value.toFloat()).assertLess(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0840
     * @tc.name testFloatConstructorFloat084
     * @tc.desc Verify toFloat() on Float(0.5f) returns 0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(0.5f);
      expect(value.toFloat()).assertEqual(0.5f);
      expect(value.isInteger()).assertFalse();
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0850
     * @tc.name testFloatConstructorFloat085
     * @tc.desc Verify toFloat() on Float(-0.5f) returns -0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-0.5f);
      expect(value.toFloat()).assertEqual(-0.5f);
      expect(value.toFloat()).assertLess(0.0f);
      expect(value.isInteger()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0860
     * @tc.name testFloatConstructorFloat086
     * @tc.desc Verify isFinite() on Float(9.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(9.0f);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0870
     * @tc.name testFloatConstructorFloat087
     * @tc.desc Verify isFinite() on Float(-48.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-48.0f);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0880
     * @tc.name testFloatConstructorFloat088
     * @tc.desc Verify isFinite() on Float(1.0e3f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0e3f);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0890
     * @tc.name testFloatConstructorFloat089
     * @tc.desc Verify isFinite() on Float(1.0e-5f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0e-5f);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0900
     * @tc.name testFloatConstructorFloat090
     * @tc.desc Verify isFinite() on Float(-1.0e3f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1.0e3f);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0910
     * @tc.name testFloatConstructorFloat091
     * @tc.desc Verify isFinite() on Float(2147483647) returns true for 2147483647 (instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2147483647 as int);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0920
     * @tc.name testFloatConstructorFloat092
     * @tc.desc Verify isFinite() on Float(-2147483648) returns true for -2147483648 (instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-2147483648 as int);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0930
     * @tc.name testFloatConstructorFloat093
     * @tc.desc Verify constructor(float) with Float.NaN creates NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NaN);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0940
     * @tc.name testFloatConstructorFloat094
     * @tc.desc Verify constructor(float) with Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.POSITIVE_INFINITY);
      expect(f.isFinite()).assertFalse();
      expect(f.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0950
     * @tc.name testFloatConstructorFloat095
     * @tc.desc Verify constructor(float) with Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NEGATIVE_INFINITY);
      expect(f.isFinite()).assertFalse();
      expect(f.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0960
     * @tc.name testFloatConstructorFloat096
     * @tc.desc Verify constructor(float) with Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.DELTA);
      expect(f.isFinite()).assertTrue();
      expect(f.toFloat()).assertEqual(Float.DELTA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0970
     * @tc.name testFloatConstructorFloat097
     * @tc.desc Verify constructor(float) with Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.EPSILON);
      expect(f.isFinite()).assertTrue();
      expect(f.toFloat()).assertEqual(Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0980
     * @tc.name testFloatConstructorFloat098
     * @tc.desc Verify constructor(float) with Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MAX_SAFE_INTEGER);
      expect(f.isFinite()).assertTrue();
      expect(f.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_0990
     * @tc.name testFloatConstructorFloat099
     * @tc.desc Verify constructor(float) with -Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-Float.MAX_SAFE_INTEGER);
      expect(f.isFinite()).assertTrue();
      expect(f.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_FLOAT_1000
     * @tc.name testFloatConstructorFloat100
     * @tc.desc Verify constructor(float) with Float.MAX_SAFE_INTEGER + 1.0f is not safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatConstructorFloat100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      expect(f.isFinite()).assertTrue();
      expect(f.isSafeInteger()).assertFalse();
    });

  });
}
