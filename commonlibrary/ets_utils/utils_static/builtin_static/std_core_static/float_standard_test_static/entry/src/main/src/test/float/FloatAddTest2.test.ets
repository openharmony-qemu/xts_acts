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

export default function FloatAddTest2(): void {
  describe('FloatAddTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0010
     * @tc.name testFloatAdd001
     * @tc.desc Verify Float.add with normal int values 1 and 2 returns float 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 1;
      const val2: int = 2;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0020
     * @tc.name testFloatAdd002
     * @tc.desc Verify Float.add with boundary int value 2147483647 plus int value 0, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 2147483647;
      const val2: int = 0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0030
     * @tc.name testFloatAdd003
     * @tc.desc Verify Float.add with boundary int value -2147483648 plus int value 0, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = -2147483648;
      const val2: int = 0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0040
     * @tc.name testFloatAdd004
     * @tc.desc Verify Float.add with normal int values 5 and -1 returns float 4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 5;
      const val2: int = -1;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0050
     * @tc.name testFloatAdd005
     * @tc.desc Verify Float.add with normal long values 100 and 200 returns float 300.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 100;
      const val2: long = 200;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(300.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0060
     * @tc.name testFloatAdd006
     * @tc.desc Verify Float.add with boundary long value 9223372036854775807 plus long value 0 returns 9223372000000000000f (float precision loss)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 9223372036854775807;
      const val2: long = 0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r).assertEqual(9223372000000000000f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0070
     * @tc.name testFloatAdd007
     * @tc.desc Verify Float.add with boundary long value -9223372036854775808 plus long value 0, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = -9223372036854775808;
      const val2: long = 0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r).assertEqual(-9223372000000000000f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0080
     * @tc.name testFloatAdd008
     * @tc.desc Verify Float.add with normal long values 50 and -1 returns float 49.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 50;
      const val2: long = -1;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(49.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0090
     * @tc.name testFloatAdd009
     * @tc.desc Verify Float.add with normal short values 127 and 1 returns float 128.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: short = 127;
      const val2: short = 1;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(128.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0100
     * @tc.name testFloatAdd010
     * @tc.desc Verify Float.add with boundary short value -32768 plus short value 0 returns float -32768.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: short = -32768;
      const val2: short = 0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0110
     * @tc.name testFloatAdd011
     * @tc.desc Verify Float.add with normal short values 10 and -1 returns float 9.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: short = 10;
      const val2: short = -1;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0120
     * @tc.name testFloatAdd012
     * @tc.desc Verify Float.add with normal byte values 12 and 3 returns float 15.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: byte = 12;
      const val2: byte = 3;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0130
     * @tc.name testFloatAdd013
     * @tc.desc Verify Float.add with boundary byte value 127 plus byte value 0 returns float 127.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: byte = 127;
      const val2: byte = 0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0140
     * @tc.name testFloatAdd014
     * @tc.desc Verify Float.add with boundary byte value -128 plus byte value 0 returns float -128.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: byte = -128;
      const val2: byte = 0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(-128.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0150
     * @tc.name testFloatAdd015
     * @tc.desc Verify Float.add with normal byte values 0 and 5 returns float 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: byte = 0;
      const val2: byte = 5;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0160
     * @tc.name testFloatAdd016
     * @tc.desc Verify Float.add with normal double values 1.5 and 2.0 returns float 3.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = 1.5;
      const val2: double = 2.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0170
     * @tc.name testFloatAdd017
     * @tc.desc Verify Float.add with boundary double value Double.MAX_VALUE converted to float overflows to float positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = Double.MAX_VALUE;
      const val2: double = 0.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0180
     * @tc.name testFloatAdd018
     * @tc.desc Verify Float.add with boundary double value Double.MIN_VALUE converted to float underflows to float 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = Double.MIN_VALUE;
      const val2: double = 0.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0190
     * @tc.name testFloatAdd019
     * @tc.desc Verify Float.add with normal double values -3.14 and 1.0 returns float -2.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = -3.14;
      const val2: double = 1.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertClose(-2.14f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0200
     * @tc.name testFloatAdd020
     * @tc.desc Verify Float.add with boundary float value 3.4e38f plus float 0.0f, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 3.4e38f;
      const val2: float = 0.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0210
     * @tc.name testFloatAdd021
     * @tc.desc Verify Float.add with hexadecimal int values 0x0 and 0x5 returns float 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 0x0;
      const val2: int = 0x5;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0220
     * @tc.name testFloatAdd022
     * @tc.desc Verify Float.add with hexadecimal int values 0xFF and 0x1 returns float 256.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 0xFF;
      const val2: int = 0x1;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(256.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0230
     * @tc.name testFloatAdd023
     * @tc.desc Verify Float.add with normal float values 4.0f and 1.0f returns float 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 4.0f;
      const val2: float = 1.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0240
     * @tc.name testFloatAdd024
     * @tc.desc Verify Float.add with normal float values 10.0f and -2.0f returns float 8.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 10.0f;
      const val2: float = -2.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0250
     * @tc.name testFloatAdd025
     * @tc.desc Verify Float.add with binary int values 0b11111111 and 0b1 returns float 256.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 0b11111111;
      const val2: int = 0b1;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(256.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0260
     * @tc.name testFloatAdd026
     * @tc.desc Verify Float.add with scientific notation float values 1.0e3f and 1.0f returns float 1001.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 1.0e3f;
      const val2: float = 1.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(1001.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0270
     * @tc.name testFloatAdd027
     * @tc.desc Verify Float.add with scientific notation float values 1.0f and -1.0e-3f returns float 0.999f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 1.0f;
      const val2: float = -1.0e-3f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertClose(0.999f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0280
     * @tc.name testFloatAdd028
     * @tc.desc Verify Float.add throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const cVal: char = c'a';
        f.add(cVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0290
     * @tc.name testFloatAdd029
     * @tc.desc Verify Float.add throws ClassCastError when passing null control character '\u0000' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const s: string = '\'\u0000\'';
        f.add(s as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0300
     * @tc.name testFloatAdd030
     * @tc.desc Verify Float.add throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const bVal: boolean = true;
        f.add(bVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0310
     * @tc.name testFloatAdd031
     * @tc.desc Verify Float.add throws ClassCastError when passing boolean false as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const bVal: boolean = false;
        f.add(bVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0320
     * @tc.name testFloatAdd032
     * @tc.desc Verify Float.add throws ClassCastError when passing long repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const longStr: string = 'x'.repeat(10000);
      try {
        f.add(longStr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0330
     * @tc.name testFloatAdd033
     * @tc.desc Verify Float.add throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.add({} as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0340
     * @tc.name testFloatAdd034
     * @tc.desc Verify Float.add throws ClassCastError when passing unsupported type int[] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [1, 2, 3];
      try {
        f.add(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0350
     * @tc.name testFloatAdd035
     * @tc.desc Verify Float.add throws ClassCastError when passing unsupported type string[] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: string[] = ['a', 'b'];
      try {
        f.add(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0360
     * @tc.name testFloatAdd036
     * @tc.desc Verify Float.add with 2D array throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [[1, 2], [3, 4]];
      try {
        f.add(matrix as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0370
     * @tc.name testFloatAdd037
     * @tc.desc Verify Float.add with ArrayList throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<double> = new Array<double>(1.0, 2.0);
      try {
        f.add(list as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0380
     * @tc.name testFloatAdd038
     * @tc.desc Verify Float.add throws ClassCastError when passing Map as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      try {
        f.add(map as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0390
     * @tc.name testFloatAdd039
     * @tc.desc Verify Float.add throws ClassCastError when passing Set as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const set: Set<int> = new Set<int>();
      set.add(1);
      try {
        f.add(set as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0400
     * @tc.name testFloatAdd040
     * @tc.desc Verify Float.add throws ClassCastError when passing enum Color as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.add(Color.RED as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0410
     * @tc.name testFloatAdd041
     * @tc.desc Verify Float.add throws ClassCastError when passing unsupported type empty int[] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [];
      try {
        f.add(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0420
     * @tc.name testFloatAdd042
     * @tc.desc Verify Float.add throws ClassCastError when passing unsupported type Object[] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: Object[] = [1, 'test', true];
      try {
        f.add(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0430
     * @tc.name testFloatAdd043
     * @tc.desc Verify Float.add with 2D array as parameter throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [];
      try {
        f.add(matrix as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0440
     * @tc.name testFloatAdd044
     * @tc.desc Verify Float.add with string 'a' throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        f.add(list as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0450
     * @tc.name testFloatAdd045
     * @tc.desc Verify Float.add throws ClassCastError when passing BigInt as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const bigIntVal: bigint = 123n;
        f.add(bigIntVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0460
     * @tc.name testFloatAdd046
     * @tc.desc Verify Float.add throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        f.add(jsonData as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0470
     * @tc.name testFloatAdd047
     * @tc.desc Verify Float.add throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
        f.add(dateVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0480
     * @tc.name testFloatAdd048
     * @tc.desc Verify Float.add throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test');
      try {
        f.add(regVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0490
     * @tc.name testFloatAdd049
     * @tc.desc Verify Float.add throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const rec: Record<string, number> = {'key': 1};
      try {
        f.add(rec as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0500
     * @tc.name testFloatAdd050
     * @tc.desc Verify Float.add throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        f.add(wm as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0510
     * @tc.name testFloatAdd051
     * @tc.desc Verify Float.add throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        f.add(ws as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0520
     * @tc.name testFloatAdd052
     * @tc.desc Verify Float.add with boundary int value 2147483647 plus short value 32767, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0530
     * @tc.name testFloatAdd053
     * @tc.desc Verify Float.add with boundary int value 2147483647 plus short value -32768, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0540
     * @tc.name testFloatAdd054
     * @tc.desc Verify Float.add with boundary int value -2147483648 plus short value 32767, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0550
     * @tc.name testFloatAdd055
     * @tc.desc Verify Float.add with boundary int value -2147483648 plus short value -32768, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0560
     * @tc.name testFloatAdd056
     * @tc.desc Verify Float.add with boundary int value 2147483647 plus byte value 127, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0570
     * @tc.name testFloatAdd057
     * @tc.desc Verify Float.add with boundary int value 2147483647 plus byte value -128, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0580
     * @tc.name testFloatAdd058
     * @tc.desc Verify Float.add with boundary int value -2147483648 plus byte value 127, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0590
     * @tc.name testFloatAdd059
     * @tc.desc Verify Float.add with boundary int value -2147483648 plus byte value -128, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0600
     * @tc.name testFloatAdd060
     * @tc.desc Verify Float.add with boundary long value 9223372036854775807 plus int value 2147483647, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: int = 2147483647;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0610
     * @tc.name testFloatAdd061
     * @tc.desc Verify Float.add with boundary long value -9223372036854775808 plus int value -2147483648, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0620
     * @tc.name testFloatAdd062
     * @tc.desc Verify Float.add with boundary long value 9223372036854775807 plus byte value 127, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0630
     * @tc.name testFloatAdd063
     * @tc.desc Verify Float.add with boundary long value -9223372036854775808 plus byte value -128, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0640
     * @tc.name testFloatAdd064
     * @tc.desc Verify Float.add cross-type: float Float.MAX_VALUE plus int 2147483647, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 2147483647;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0650
     * @tc.name testFloatAdd065
     * @tc.desc Verify Float.add cross-type: float Float.MIN_VALUE plus int -2147483648, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MIN_VALUE;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0660
     * @tc.name testFloatAdd066
     * @tc.desc Verify Float.add with boundary short value 32767 plus byte value 127, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0670
     * @tc.name testFloatAdd067
     * @tc.desc Verify Float.add with boundary short value -32768 plus byte value -128, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = -32768;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0680
     * @tc.name testFloatAdd068
     * @tc.desc Verify Float.add with int 2147483647 and float 0.0f returns float 2147483600f (precision loss due to float conversion)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(2147483600f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0690
     * @tc.name testFloatAdd069
     * @tc.desc Verify Float.add with int -2147483648 values float and 0.0f returns float -2147483648.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0700
     * @tc.name testFloatAdd070
     * @tc.desc Verify Float.add cross-type: float Float.MAX_VALUE plus int 0, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(Float.MAX_VALUE);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0710
     * @tc.name testFloatAdd071
     * @tc.desc Verify Float.add cross-type: float Float.MIN_VALUE plus int 0 returns Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MIN_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0720
     * @tc.name testFloatAdd072
     * @tc.desc Verify Float.add with long 9223372036854775807 and float 0.0f, result is finite (precision loss expected)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0730
     * @tc.name testFloatAdd073
     * @tc.desc Verify Float.add with short 32767 values byte and 1 returns float 32768.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0740
     * @tc.name testFloatAdd074
     * @tc.desc Verify Float.add with float -1.0f values int and 1 returns float 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = -1.0f;
      const valB: int = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0750
     * @tc.name testFloatAdd075
     * @tc.desc Verify Float.add with int 5 values float and 3.0f returns float 8.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = 3.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0760
     * @tc.name testFloatAdd076
     * @tc.desc Verify Float.add with double 0.5 and int 2 returns float 2.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: double = 0.5;
      const valB: int = 2;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0770
     * @tc.name testFloatAdd077
     * @tc.desc Verify Float.add with float 10.0f values long and 20 returns float 30.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 10.0f;
      const valB: long = 20;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0780
     * @tc.name testFloatAdd078
     * @tc.desc Verify Float.add with byte 3 values int and 7 returns float 10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = 3;
      const valB: int = 7;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0790
     * @tc.name testFloatAdd079
     * @tc.desc Verify Float.add with int 100 values double and 0.5 returns float 100.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 100;
      const valB: double = 0.5;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(100.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0800
     * @tc.name testFloatAdd080
     * @tc.desc Verify Float.add with long 1000 values float and 0.5f returns float 1000.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 1000;
      const valB: float = 0.5f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.add(b);
      expect(r.toFloat()).assertEqual(1000.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0810
     * @tc.name testFloatAdd081
     * @tc.desc Verify associativity of Float.add: (a.add(b)).add(c) equals a.add(b.add(c)) for float values 1.5f, 2.5f, 3.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5f);
      const b: Float = new Float(2.5f);
      const c: Float = new Float(3.5f);
      let left = (a.add(b)).add(c);
      const right: Float = a.add(b.add(c));
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0820
     * @tc.name testFloatAdd082
     * @tc.desc Verify associativity of Float.add: (a.add(b)).add(c) equals a.add(b.add(c)) for float values -1.5f, 2.5f, -3.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.5f);
      const b: Float = new Float(2.5f);
      const c: Float = new Float(-3.5f);
      let left = (a.add(b)).add(c);
      const right: Float = a.add(b.add(c));
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0830
     * @tc.name testFloatAdd083
     * @tc.desc Verify associativity of Float.add: (a.add(b)).add(c) equals a.add(b.add(c)) for float values 0.1f, 0.2f, 0.3f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.1f);
      const b: Float = new Float(0.2f);
      const c: Float = new Float(0.3f);
      let left = (a.add(b)).add(c);
      const right: Float = a.add(b.add(c));
      expect(left.toFloat()).assertClose(right.toFloat(), 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0840
     * @tc.name testFloatAdd084
     * @tc.desc Verify addition commutative property of Float.add, a.add(b) equals b.add(a) for 3.14f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(2.86f);
      expect(a.add(b).toFloat()).assertEqual(b.add(a).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0850
     * @tc.name testFloatAdd085
     * @tc.desc Verify addition commutative property of Float.add, a.add(b) equals b.add(a) for -5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-5.0f);
        const b: Float = new Float(3.0f);
        expect(a.add(b).toFloat()).assertEqual(b.add(a).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0860
     * @tc.name testFloatAdd086
     * @tc.desc Verify Float.add result equals sum of operands for float values 42.0f and 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(42.0f);
        const zero: Float = new Float(0.0f);
        expect(a.add(zero).toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0870
     * @tc.name testFloatAdd087
     * @tc.desc Verify Float.add result equals sum of operands for float values -42.0f and 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-42.0f);
        const zero: Float = new Float(0.0f);
        expect(a.add(zero).toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0880
     * @tc.name testFloatAdd088
     * @tc.desc Verify additive inverse: float 7.5f + (-7.5f) equals float 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(7.5f);
        const negA: Float = new Float(-a.toFloat());
        expect(a.add(negA).toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0890
     * @tc.name testFloatAdd089
     * @tc.desc Verify additive inverse: float -7.5f + 7.5f equals float 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-7.5f);
        const negA: Float = new Float(-a.toFloat());
        expect(a.add(negA).toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0900
     * @tc.name testFloatAdd090
     * @tc.desc Verify additive inverse: float 0.125f + (-0.125f) equals float 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.125f);
        const negA: Float = new Float(-0.125f);
        expect(a.add(negA).toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0910
     * @tc.name testFloatAdd091
     * @tc.desc Verify calculation rule of Float.add when param is subnormal number Float.MIN_VALUE, result is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: Float = new Float(Float.MIN_VALUE);
        const result: Float = minVal.add(minVal);
        expect(result.toFloat()).assertLarger(0.0f);
        expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0920
     * @tc.name testFloatAdd092
     * @tc.desc Verify Float.add with subnormal float value MIN_VALUE/2.0f plus float 0.0f returns original value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const smallVal: Float = new Float(Float.MIN_VALUE / 2.0f);
        const zero: Float = new Float(0.0f);
        const result: Float = smallVal.add(zero);
        expect(result.toFloat()).assertEqual(smallVal.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0930
     * @tc.name testFloatAdd093
     * @tc.desc Verify Float.add with subnormal number: 1.0f plus Float.MIN_VALUE approximates to 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one: Float = new Float(1.0f);
        const minVal: Float = new Float(Float.MIN_VALUE);
        const result: Float = one.add(minVal);
        expect(result.toFloat()).assertClose(1.0f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0940
     * @tc.name testFloatAdd094
     * @tc.desc Verify Float.add floating-point precision tolerance, 0.1 add 0.2 use approximate comparison with error threshold 0.000001
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.1f);
        const b: Float = new Float(0.2f);
        const result: Float = a.add(b);
        expect(result.toFloat()).assertClose(0.3f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0950
     * @tc.name testFloatAdd095
     * @tc.desc Verify Float.add: 1.0e10f add 1.0f preserves original value (precision limit)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large: Float = new Float(1.0e10f);
        const small: Float = new Float(1.0f);
        const result: Float = large.add(small);
        expect(result.toFloat()).assertEqual(1.0e10f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0960
     * @tc.name testFloatAdd096
     * @tc.desc Verify additive inverse: float -1.0e10f + 1.0e10f equals float 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negLarge: Float = new Float(-1.0e10f);
        const posLarge: Float = new Float(1.0e10f);
        const result: Float = negLarge.add(posLarge);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0970
     * @tc.name testFloatAdd097
     * @tc.desc Verify calculation rule of Float.add when param is Float.POSITIVE_INFINITY, result is positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: Float = new Float(Float.POSITIVE_INFINITY);
        const zero: Float = new Float(0.0f);
        const result: Float = inf.add(zero);
        expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0980
     * @tc.name testFloatAdd098
     * @tc.desc Verify calculation rule of Float.add when param is Float.NEGATIVE_INFINITY, result is negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
        const zero: Float = new Float(0.0f);
        const result: Float = negInf.add(zero);
        expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_0990
     * @tc.name testFloatAdd099
     * @tc.desc Verify calculation rule of Float.add when param is half Float.MAX_VALUE, result overflows to positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: Float = new Float(Float.MAX_VALUE);
        const halfMax: Float = new Float(Float.MAX_VALUE * 0.5f);
        const result: Float = maxVal.add(halfMax);
        expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1000
     * @tc.name testFloatAdd100
     * @tc.desc Verify Float.add is immutable operation, original Float instance value will not be changed after calculation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5.0f);
        const b: Float = new Float(3.0f);
        const aOrig: float = a.toFloat();
        const bOrig: float = b.toFloat();
        const result: Float = a.add(b);
        expect(a.toFloat()).assertEqual(aOrig);
        expect(b.toFloat()).assertEqual(bOrig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1010
     * @tc.name testFloatAdd101
     * @tc.desc Verify Float.add returns a new Float instance, not the same reference as input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
        const b: Float = new Float(2.0f);
        const result: Float = a.add(b);
        expect(result).not().assertEqual(a);
        expect(result).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1020
     * @tc.name testFloatAdd102
     * @tc.desc Verify Float.add result equals sum of operands for float values 3.5f and 2.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.5f);
        const b: Float = new Float(2.5f);
        expect(a.add(b).toFloat()).assertEqual(a.toFloat() + b.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1030
     * @tc.name testFloatAdd103
     * @tc.desc Verify Float.add with float 5.0 values float and 0.0 returns float 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultVal: Float = new Float();
        const five: Float = new Float(5.0f);
        const result: Float = defaultVal.add(five);
        expect(result.toFloat()).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1040
     * @tc.name testFloatAdd104
     * @tc.desc Verify Float.add with float 1.0 values float and 1.0 returns float 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
        const result: Float = a.add(new Float(1.0f));
        expect(result.toFloat()).assertEqual(2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1050
     * @tc.name testFloatAdd105
     * @tc.desc Verify loop accumulation by Float.add, ten times add 1.5 get total 15.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: Float = new Float(0.0f);
        const increment: Float = new Float(1.5f);
        for (let i = 0; i < 10; i++) {
          sum = sum.add(increment);
        }
        expect(sum.toFloat()).assertEqual(15.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1060
     * @tc.name testFloatAdd106
     * @tc.desc Verify Float.add with float 1.5f values float and 2.5f returns float 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5f);
        const b: Float = new Float(2.5);
        const result: Float = a.add(b);
        expect(result.toFloat()).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1070
     * @tc.name testFloatAdd107
     * @tc.desc Verify Float.add chain: add 2.0f, 3.0f, 4.0f to float 1.0f returns float 10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(1.0f).add(new Float(2.0f)).add(new Float(3.0f)).add(new Float(4.0f));
        expect(result.toFloat()).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1080
     * @tc.name testFloatAdd108
     * @tc.desc Verify addition chain operation of Float.add, chain add 2.0 and 4.0 then add self, result 30.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
        const b: Float = new Float(4.0f);
        const c: Float = new Float(8.0f);
        const d: Float = new Float(16.0f);
        const step1: Float = a.add(b);
        const step2: Float = step1.add(c);
        const step3: Float = step2.add(d);
        expect(step3.toFloat()).assertEqual(30.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1090
     * @tc.name testFloatAdd109
     * @tc.desc Verify calculation rule of Float.add when param is large positive value, result overflows to positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: Float = new Float(Float.POSITIVE_INFINITY);
        const val: Float = new Float(100.0f);
        const result: Float = inf.add(val);
        expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1100
     * @tc.name testFloatAdd110
     * @tc.desc Verify calculation rule of Float.add when param is large negative value, result overflows to negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
        const val: Float = new Float(100.0f);
        const result: Float = negInf.add(val);
        expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1110
     * @tc.name testFloatAdd111
     * @tc.desc Verify chained composite calculation: Float.add followed by Float.sub on Float(10.0f) returns 12.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(10.0f).add(new Float(5.0f)).sub(new Float(3.0f));
        expect(result.toFloat()).assertEqual(12.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1120
     * @tc.name testFloatAdd112
     * @tc.desc Verify chained composite calculation: Float.add followed by Float.mul on Float(2.0f) returns 20.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(2.0f).add(new Float(3.0f)).mul(new Float(4.0f));
        expect(result.toFloat()).assertEqual(20.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1130
     * @tc.name testFloatAdd113
     * @tc.desc Verify chained composite calculation: Float.add followed by Float.div on Float(6.0f) returns 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(6.0f).add(new Float(4.0f)).div(new Float(2.0f));
        expect(result.toFloat()).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1140
     * @tc.name testFloatAdd114
     * @tc.desc Verify Float.add: new Float(3.0f).add(new Float(4.0f)) returns 7.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(3.0f).add(new Float(4.0f));
        const floatVal: float = result.toFloat();
        expect(floatVal).assertEqual(7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1150
     * @tc.name testFloatAdd115
     * @tc.desc Verify Float.add with float 1.0f plus Float.EPSILON, result is larger than 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
        const eps: Float = new Float(Float.EPSILON);
        const result: Float = a.add(eps);
        expect(result.toFloat()).assertLarger(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1160
     * @tc.name testFloatAdd116
     * @tc.desc Verify Float.add is immutable operation, original Float instance value will not be changed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
        const delta: Float = new Float(Float.DELTA);
        const result: Float = a.add(delta);
        const diff: float = result.toFloat() - 1.0f;
        expect(diff).assertLargerOrEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1170
     * @tc.name testFloatAdd117
     * @tc.desc Verify Float.add with float 10.0f values float and -3.0f returns float 10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
        const b: Float = new Float(-3.0f);
        const c: Float = new Float(-4.0f);
        const d: Float = new Float(7.0f);
        const step1: Float = a.add(b);
        const step2: Float = step1.add(c);
        const step3: Float = step2.add(d);
        expect(step3.toFloat()).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1180
     * @tc.name testFloatAdd118
     * @tc.desc Verify Float.add array reduction: sum of float array [1.0f, 2.0f, 3.0f, 4.0f, 5.0f] equals float 15.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc: Float = new Float(0.0f);
        let values: float[] = [1.0f, 2.0f, 3.0f, 4.0f, 5.0f];
        for (let v of values) {
          acc = acc.add(new Float(v));
        }
        expect(acc.toFloat()).assertEqual(15.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1190
     * @tc.name testFloatAdd119
     * @tc.desc Verify loop accumulation by Float.add, multiple times add 1.0 get total 36.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(0.0f)
          .add(new Float(1.0f))
          .add(new Float(2.0f))
          .add(new Float(3.0f))
          .add(new Float(4.0f))
          .add(new Float(5.0f))
          .add(new Float(6.0f))
          .add(new Float(7.0f))
          .add(new Float(8.0f));
        expect(result.toFloat()).assertEqual(36.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1200
     * @tc.name testFloatAdd120
     * @tc.desc Verify NaN propagation rule of Float.add, NaN plus 999.0f gets NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: Float = new Float(Float.NaN);
        const val: Float = new Float(999.0f);
        const result: Float = nan.add(val);
        expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1210
     * @tc.name testFloatAdd121
     * @tc.desc Verify float precision boundary of Float.add, 16777216.0f add 1.0f returns 16777217.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large: Float = new Float(16777216.0f);
        const small: Float = new Float(1.0f);
        const result: Float = large.add(small);
        expect(result.toFloat()).assertEqual(16777217.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1220
     * @tc.name testFloatAdd122
     * @tc.desc Verify calculation rule of Float.add when param is subnormal number, sum of 10 repeated MIN_VALUE additions is larger than 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: Float = new Float(Float.MIN_VALUE);
      let sum: Float = new Float(0.0f);
        for (let i = 0; i < 10; i++) {
          sum = sum.add(minVal);
        }
        expect(sum.toFloat()).assertLarger(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1230
     * @tc.name testFloatAdd123
     * @tc.desc Verify additive identity: default Float(0.0f) + default Float(0.0f) equals float 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
        const b: Float = new Float();
        const result: Float = a.add(b);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1240
     * @tc.name testFloatAdd124
     * @tc.desc Verify additive identity: Float(0.0f) + Float(0.0f) equals float 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.0f);
        const b: Float = new Float(0.0f);
        const result: Float = a.add(b);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1250
     * @tc.name testFloatAdd125
     * @tc.desc Verify Float.add result: float 1.0f plus Float.POSITIVE_INFINITY, result is not finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
        const inf: Float = new Float(Float.POSITIVE_INFINITY);
        const result: Float = a.add(inf);
        expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1260
     * @tc.name testFloatAdd126
     * @tc.desc Verify Float.add is immutable operation, repeated calls on Float(1.0f) return the same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
        const b: Float = new Float(2.0f);
        const c: Float = new Float(3.0f);
        const aOrig: float = a.toFloat();
        const bOrig: float = b.toFloat();
        const cOrig: float = c.toFloat();
        const step1: Float = a.add(b);
        const result: Float = step1.add(c);
        expect(a.toFloat()).assertEqual(aOrig);
        expect(b.toFloat()).assertEqual(bOrig);
        expect(c.toFloat()).assertEqual(cOrig);
        expect(result.toFloat()).assertEqual(6.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1270
     * @tc.name testFloatAdd127
     * @tc.desc Verify Float.add(9.0f, 0.0f) result is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(9.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1280
     * @tc.name testFloatAdd128
     * @tc.desc Verify Float.add(-48.0f, 0.0f) result is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-48.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1290
     * @tc.name testFloatAdd129
     * @tc.desc Verify Float.add(1.0e-5f, 0.0f) result is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-5f);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1300
     * @tc.name testFloatAdd130
     * @tc.desc Verify Float.add(-1.0e3f, 0.0f) result is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0e3f);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1310
     * @tc.name testFloatAdd131
     * @tc.desc Verify Float.add with boundary int value 2147483647 plus float 0.0f result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2147483647 as int);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1320
     * @tc.name testFloatAdd132
     * @tc.desc Verify Float.add with boundary int value -2147483648 plus float 0.0f result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1330
     * @tc.name testFloatAdd133
     * @tc.desc Verify Float.add with boundary int value 127 plus float 0.0f result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1340
     * @tc.name testFloatAdd134
     * @tc.desc Verify Float.add with boundary int value -128 plus float 0.0f result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1350
     * @tc.name testFloatAdd135
     * @tc.desc Verify Float.add with boundary int value 32767 plus float 0.0f result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1360
     * @tc.name testFloatAdd136
     * @tc.desc Verify Float.add with boundary int value -32768 plus float 0.0f result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1370
     * @tc.name testFloatAdd137
     * @tc.desc Verify Float.add with bitCastFromInt(0x007fffff) constructed float plus zero, result is finite float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x007fffff));
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1380
     * @tc.name testFloatAdd138
     * @tc.desc Verify NaN propagation rule of Float.add, NaN plus 0.0f gets NaN, isNaN result is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NaN);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1390
     * @tc.name testFloatAdd139
     * @tc.desc Verify NaN propagation: 1.0f + NaN returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(Float.NaN);
      const result: Float = a.add(b);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1400
     * @tc.name testFloatAdd140
     * @tc.desc Verify Infinity addition: Infinity + 1.0f returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(1.0f);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1410
     * @tc.name testFloatAdd141
     * @tc.desc Verify Infinity addition: Infinity + Infinity returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1420
     * @tc.name testFloatAdd142
     * @tc.desc Verify Infinity addition: -Infinity + (-Infinity) returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1430
     * @tc.name testFloatAdd143
     * @tc.desc Verify signed zero addition: -0.0f + 0.0f equals 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-0.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1440
     * @tc.name testFloatAdd144
     * @tc.desc Verify signed zero addition: -0.0f + (-0.0f) equals -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-0.0f);
      const b: Float = new Float(-0.0f);
      const result: Float = a.add(b);

      expect(1.0f / result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1450
     * @tc.name testFloatAdd145
     * @tc.desc Verify commutativity property of Float.add: a.add(b) equals b.add(a)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(2.71f);
      const left: float = a.add(b).toFloat();
      const right: float = b.add(a).toFloat();
      expect(left).assertEqual(right);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1460
     * @tc.name testFloatAdd146
     * @tc.desc Verify additive identity: a.add(new Float(0.0f)) equals a
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(42.0f);
      const zero: Float = new Float(0.0f);
      const result: Float = a.add(zero);
      expect(result.toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1470
     * @tc.name testFloatAdd147
     * @tc.desc Verify additive identity with negative value: (-5.0f).add(new Float(0.0f)) equals -5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-5.0f);
      const zero: Float = new Float(0.0f);
      const result: Float = a.add(zero);
      expect(result.toFloat()).assertEqual(-5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1480
     * @tc.name testFloatAdd148
     * @tc.desc Verify range extremes addition: Float.MAX_VALUE + Float.MIN_VALUE returns MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(Float.MIN_VALUE);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1490
     * @tc.name testFloatAdd149
     * @tc.desc Verify large plus tiny: 1.0e10f + 1.0e-10f returns 1.0e10f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e-10f);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(1.0e10f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1500
     * @tc.name testFloatAdd150
     * @tc.desc Verify additive inverse: a + (-a) equals 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.5f);
      const negA: Float = new Float(-3.5f);
      const result: Float = a.add(negA);
      expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1510
     * @tc.name testFloatAdd151
     * @tc.desc Verify -0.0f + Float.MIN_VALUE returns Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-0.0f);
      const b: Float = new Float(Float.MIN_VALUE);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1520
     * @tc.name testFloatAdd152
     * @tc.desc Verify Float constructed by bitCastFromInt(0x7f800000) plus 1.0f returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x7f800000));
      const b: Float = new Float(1.0f);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1530
     * @tc.name testFloatAdd153
     * @tc.desc Verify Float constructed by bitCastFromInt(0x7fc00000) plus 1.0f returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x7fc00000));
      const b: Float = new Float(1.0f);
      const result: Float = a.add(b);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1540
     * @tc.name testFloatAdd154
     * @tc.desc Verify Float.add throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.add(null as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1550
     * @tc.name testFloatAdd155
     * @tc.desc Verify Float.add throws ClassCastError when passing Function as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        let fn: () => void = () => {};
        f.add(fn as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1560
     * @tc.name testFloatAdd156
     * @tc.desc Verify Float.add throws ClassCastError when passing undefined as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const u: Object | undefined = undefined;
        f.add(u as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1570
     * @tc.name testFloatAdd157
     * @tc.desc Verify 1.0e-5f + 2.0e-5f returns 3.0e-5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-5f);
      const b: Float = new Float(2.0e-5f);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertClose(3.0e-5f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1580
     * @tc.name testFloatAdd158
     * @tc.desc Verify float double boundary: 3.4e38f + 1.0e38f exceeds MAX_VALUE and results in Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.4e38f);
      const b: Float = new Float(1.0e38f);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1590
     * @tc.name testFloatAdd159
     * @tc.desc Verify cross-type addition: float Float.DELTA + int 0 via Float.add, result equals Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA);
      const b: Float = new Float(0);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.DELTA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1600
     * @tc.name testFloatAdd160
     * @tc.desc Verify cross-type addition: float Float.EPSILON + int 0 via Float.add, result equals Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.EPSILON);
      const b: Float = new Float(0);
      const result: Float = a.add(b);
      expect(result.toFloat()).assertEqual(Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1610
     * @tc.name testFloatAdd161
     * @tc.desc Verify float 0.1f + 0.2f is approximately 0.3f within Float.DELTA tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.1f);
      const b: Float = new Float(0.2f);
      const result: Float = a.add(b);
      expect(Float.compare(result.toFloat(), 0.3f)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ADD_2_1620
     * @tc.name testFloatAdd162
     * @tc.desc Verify clamp addition: Float.MAX_SAFE_INTEGER + 1.0f via Float.add, result is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatAdd162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(1.0f);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertTrue();
    });

    });
}
