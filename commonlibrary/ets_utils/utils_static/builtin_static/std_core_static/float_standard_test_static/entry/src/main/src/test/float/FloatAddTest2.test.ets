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

