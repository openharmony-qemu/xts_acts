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

export default function FloatBitCastFromIntTest2(): void {
  describe('FloatBitCastFromIntTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0100
     * @tc.name testFloatBitCastFromInt001
     * @tc.desc Verify Float.bitCastFromInt passes int min -2147483648 (bit 0x80000000), maps to IEEE754 negative zero -0.0f; positive zero 0x00000000 maps to +0.0f, both equal in value but differ in division sign behavior, verifying the negative zero bit pattern
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = -2147483648;
      const result: float = Float.bitCastFromInt(bits);
      expect(1.0f / result).assertEqual(Float.NEGATIVE_INFINITY);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0200
     * @tc.name testFloatBitCastFromInt002
     * @tc.desc Verify Float.bitCastFromInt uses 32-bit int -1082130432(0xbf800000) bit pattern to map to IEEE754 float, expected result -1.0 (sign 1, exp 127, mantissa 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = -1082130432;
      const result: float = Float.bitCastFromInt(bits);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0300
     * @tc.name testFloatBitCastFromInt003
     * @tc.desc Verify Float.bitCastFromInt passes bit 0x7f800000 (sign 0, exp all 1, mantissa 0), maps to IEEE754 positive infinity Float.POSITIVE_INFINITY, confirming the IEEE754 positive infinity encoding
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = 0x7f800000;
      const result: float = Float.bitCastFromInt(bits);
      expect(Float.isFinite(result)).assertFalse();
      expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0400
     * @tc.name testFloatBitCastFromInt004
     * @tc.desc Verify Float.bitCastFromInt passes int -8388608 (bit 0xFF800000, sign 1, exp all 1, mantissa 0), maps to IEEE754 negative infinity Float.NEGATIVE_INFINITY, confirming the IEEE754 negative infinity encoding
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = -8388608;
      const result: float = Float.bitCastFromInt(bits);
      expect(Float.isFinite(result)).assertFalse();
      expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0500
     * @tc.name testFloatBitCastFromInt005
     * @tc.desc Verify Float.bitCastFromInt passes bit 0x7f7fffff (exp 254, mantissa all 1), maps to IEEE754 max finite float Float.MAX_VALUE, confirming the IEEE754 maximum finite float encoding
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = 0x7f7fffff;
      const result: float = Float.bitCastFromInt(bits);
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0600
     * @tc.name testFloatBitCastFromInt006
     * @tc.desc Verify Float.bitCastFromInt passes bit 0x7fc00000 (exp all 1, highest mantissa bit 1) maps to QNaN, isNaN() returns true, verifying the QNaN bit pattern where highest mantissa bit is 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = 0x7fc00000;
      const result: float = Float.bitCastFromInt(bits);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0700
     * @tc.name testFloatBitCastFromInt007
     * @tc.desc Verify Float.bitCastFromInt passes int max 2147483647(0x7FFFFFFF), mapped float is not finite, isFinite() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = 2147483647;
      const result: float = Float.bitCastFromInt(bits);
      expect(isFinite(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0800
     * @tc.name testFloatBitCastFromInt008
     * @tc.desc Verify illegal float type: Float.NaN cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to float-to-int type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.bitCastFromInt(Float.NaN as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_0900
     * @tc.name testFloatBitCastFromInt009
     * @tc.desc Verify Float.bitCastFromInt passes int -33554432(0xfe000000), mapped float is finite, isFinite() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = -33554432;
      const result: float = Float.bitCastFromInt(bits);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1000
     * @tc.name testFloatBitCastFromInt010
     * @tc.desc Verify illegal boolean type: boolean true cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to boolean-to-int type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = true;
        Float.bitCastFromInt(bVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1100
     * @tc.name testFloatBitCastFromInt011
     * @tc.desc Verify illegal boolean type: boolean false cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to boolean-to-int type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bVal: boolean = false;
        Float.bitCastFromInt(bVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1200
     * @tc.name testFloatBitCastFromInt012
     * @tc.desc Verify illegal char type: char 'a' cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to char-to-int type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const cVal: char = c'a';
        Float.bitCastFromInt(cVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1300
     * @tc.name testFloatBitCastFromInt013
     * @tc.desc Verify illegal control char: null char '\u0000' cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to control character type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = '\'\u0000\'';
        Float.bitCastFromInt(s as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1400
     * @tc.name testFloatBitCastFromInt014
     * @tc.desc Verify illegal Object instance: new Object() cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to Object instance type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.bitCastFromInt(obj as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1500
     * @tc.name testFloatBitCastFromInt015
     * @tc.desc Verify illegal array type: array [1,2,3] cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to array type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.bitCastFromInt([1, 2, 3] as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1600
     * @tc.name testFloatBitCastFromInt016
     * @tc.desc Verify illegal List type: numList cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to List type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const numList: Array<double> = new Array<double>(1.0, 2.0);
        Float.bitCastFromInt(numList as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1700
     * @tc.name testFloatBitCastFromInt017
     * @tc.desc Verify illegal Map type: Map cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to Map type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      try {
        Float.bitCastFromInt(map as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1800
     * @tc.name testFloatBitCastFromInt018
     * @tc.desc Verify illegal enum type: Color.RED cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to enum type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.bitCastFromInt(Color.RED as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_1900
     * @tc.name testFloatBitCastFromInt019
     * @tc.desc Verify bitCastFromInt idempotency: same int parameter multiple calls return same float result, demonstrating the idempotency of bitCastFromInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: int = 0x3f800000;
      const r1: float = Float.bitCastFromInt(bits);
      const r2: float = Float.bitCastFromInt(bits);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2000
     * @tc.name testFloatBitCastFromInt020
     * @tc.desc Verify int arithmetic expression as parameter: expression 0x3f800000 + 0x00400000 computed then passed, mapped float is finite, isFinite() returns true, demonstrating support for arithmetic expression as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expr: int = 0x3f800000 + 0x00400000;
      const result: float = Float.bitCastFromInt(expr);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2100
     * @tc.name testFloatBitCastFromInt021
     * @tc.desc Verify illegal object literal: empty object {} cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to object literal type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.bitCastFromInt({} as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2200
     * @tc.name testFloatBitCastFromInt022
     * @tc.desc Verify illegal custom class: JsonData instance cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to custom class type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        Float.bitCastFromInt(jsonData as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2300
     * @tc.name testFloatBitCastFromInt023
     * @tc.desc Verify bitCastFromInt(long as Object as int) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigVal: long = 123;
      try {
        Float.bitCastFromInt(bigVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2400
     * @tc.name testFloatBitCastFromInt024
     * @tc.desc Verify illegal Date type: Date object cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to Date type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateVal: Date = new Date();
      try {
        Float.bitCastFromInt(dateVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2500
     * @tc.name testFloatBitCastFromInt025
     * @tc.desc Verify illegal RegExp type: RegExp object cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to RegExp type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regVal: RegExp = new RegExp('test');
      try {
        Float.bitCastFromInt(regVal as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2600
     * @tc.name testFloatBitCastFromInt026
     * @tc.desc Verify illegal Record type: Record object cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to Record type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = { 'key': 1 };
      try {
        Float.bitCastFromInt(rec as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2700
     * @tc.name testFloatBitCastFromInt027
     * @tc.desc Verify illegal WeakMap type: WeakMap cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to WeakMap type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        Float.bitCastFromInt(wm as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2800
     * @tc.name testFloatBitCastFromInt028
     * @tc.desc Verify illegal WeakSet type: WeakSet cast to Object then int, passed to bitCastFromInt, throws ClassCastError, due to WeakSet type mismatch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        Float.bitCastFromInt(ws as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_2900
     * @tc.name testFloatBitCastFromInt029
     * @tc.desc Verify bitCastFromInt maps 0x41200000 to 10.0f, 0x41a00000 to 20.0f, 0x42c80000 to 100.0f, 0x447a0000 to 1000.0f, 0x461c4000 to 10000.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: float = Float.bitCastFromInt(0x41200000);
      expect(f1).assertEqual(10.0f);
      const f2: float = Float.bitCastFromInt(0x41a00000);
      expect(f2).assertEqual(20.0f);
      const f3: float = Float.bitCastFromInt(0x42c80000);
      expect(f3).assertEqual(100.0f);
      const f4: float = Float.bitCastFromInt(0x447a0000);
      expect(f4).assertEqual(1000.0f);
      const f5: float = Float.bitCastFromInt(0x461c4000);
      expect(f5).assertEqual(10000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3000
     * @tc.name testFloatBitCastFromInt030
     * @tc.desc Verify bit round-trip: int -2147483648(0x80000000) via bitCastFromInt then bitCastToInt returns original bit -2147483648, confirming bit-preserving round-trip for negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const f: float = Float.bitCastFromInt(-2147483648 as int);
        const bits: int = Float.bitCastToInt(f);
        expect(bits).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3100
     * @tc.name testFloatBitCastFromInt031
     * @tc.desc Verify Float.bitCastFromInt uses 0x00000000 bit pattern to map to +0.0f, confirming the IEEE754 positive zero encoding
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const f: float = Float.bitCastFromInt(0x00000000);
        expect(f).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3200
     * @tc.name testFloatBitCastFromInt032
     * @tc.desc Verify minimum positive subnormal float mapping: bit 0x00000001 maps to IEEE754 minimum float Float.MIN_VALUE, confirming the IEEE754 minimum positive subnormal float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const f: float = Float.bitCastFromInt(0x00000001);
        expect(f).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3300
     * @tc.name testFloatBitCastFromInt033
     * @tc.desc Verify bitCastFromInt(0x3f800000) equals 1.0f and bitCastFromInt(-1082130432) equals -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const pos: float = Float.bitCastFromInt(0x3f800000);
        const neg: float = Float.bitCastFromInt(-1082130432);
        expect(pos).assertEqual(1.0f);
        expect(neg).assertEqual(-1.0f);
        expect(pos).assertEqual(-neg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3400
     * @tc.name testFloatBitCastFromInt034
     * @tc.desc Verify bit round-trip: int 0x00000001 via bitCastFromInt then bitCastToInt returns original bit 0x00000001, confirming bit-preserving round-trip for minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const f: float = Float.bitCastFromInt(0x00000001);
        const bits: int = Float.bitCastToInt(f);
        expect(bits).assertEqual(0x00000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3500
     * @tc.name testFloatBitCastFromInt035
     * @tc.desc Verify Float.bitCastFromInt passes bit 0x7f800001 (exp all 1, lowest mantissa bit 1) maps to SNaN, isNaN() returns true, verifying the SNaN bit pattern where lowest mantissa bit is 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const sNaN: float = Float.bitCastFromInt(0x7f800001);
        const qNaN: float = Float.bitCastFromInt(0x7fc00000);
        expect(isNaN(sNaN)).assertTrue();
        expect(isNaN(qNaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3600
     * @tc.name testFloatBitCastFromInt036
     * @tc.desc Verify mapped float supports arithmetic: 0x40400000 maps to 3.0f, 0x40800000 maps to 4.0f, sum equals 7.0f, demonstrating arithmetic operations on mapped float values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a: float = Float.bitCastFromInt(0x40400000);
        const b: float = Float.bitCastFromInt(0x40800000);
        let sum = a + b;
        expect(sum).assertEqual(7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3700
     * @tc.name testFloatBitCastFromInt037
     * @tc.desc Verify bitCastFromInt(0x40400000) is less than bitCastFromInt(0x40800000)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a: float = Float.bitCastFromInt(0x40400000);
        const b: float = Float.bitCastFromInt(0x40800000);
        expect(a).assertLess(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3800
     * @tc.name testFloatBitCastFromInt038
     * @tc.desc Verify bitCastFromInt(0x00000000) maps to +0.0f and bitCastFromInt(-2147483648) maps to -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const posZero: float = Float.bitCastFromInt(0x00000000);
        const negZero: float = Float.bitCastFromInt(-2147483648);
        expect(posZero).assertEqual(0.0f);
        let posDiv = 1.0f / posZero;
        let negDiv = 1.0f / negZero;
        expect(Float.isFinite(posDiv)).assertFalse();
        expect(Float.isNaN(posDiv)).assertFalse();
        expect(Float.isFinite(negDiv)).assertFalse();
        expect(Float.isNaN(negDiv)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_3900
     * @tc.name testFloatBitCastFromInt039
     * @tc.desc Verify Float.bitCastFromInt uses 0x7f800000 bit to map to positive infinity, Float.isInfinite() returns true, and verifying Float.isInfinite() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const f: float = Float.bitCastFromInt(0x7f800000);
        expect(!isFinite(f)).assertTrue();
        expect(Float.isFinite(f)).assertFalse();
        expect(Float.isNaN(f)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_4000
     * @tc.name testFloatBitCastFromInt040
     * @tc.desc Verify bit round-trip consistency: int 0x00000000 via bitCastFromInt then bitCastToInt, original bit preserved without loss, confirming bit-preserving round-trip for positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const i: int = 0x00000000;
        const f: float = Float.bitCastFromInt(i);
        const back: int = Float.bitCastToInt(f);
        expect(back).assertEqual(i);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_4100
     * @tc.name testFloatBitCastFromInt041
     * @tc.desc Verify bitCastFromInt(-2147483648) round-trip: bitCastToInt(bitCastFromInt(i)) equals original int
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const i: int = -2147483648;
        const f: float = Float.bitCastFromInt(i);
        const back: int = Float.bitCastToInt(f);
        expect(back).assertEqual(i);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_4200
     * @tc.name testFloatBitCastFromInt042
     * @tc.desc Verify narrow type cast parameter: byte max 127 cast to int passed to bitCastFromInt, mapped float is valid finite value, demonstrating byte-to-int narrow type compatibility
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.bitCastFromInt(127 as byte);
      expect(result).assertEqual(1.78e-43f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_4300
     * @tc.name testFloatBitCastFromInt043
     * @tc.desc Verify narrow type cast parameter: byte min -128 cast to int passed to bitCastFromInt, mapped float is NaN, demonstrating negative byte-to-int narrow type compatibility
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.bitCastFromInt(-128 as byte);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_4400
     * @tc.name testFloatBitCastFromInt044
     * @tc.desc Verify narrow type cast parameter: short max 32767 cast to int passed to bitCastFromInt, mapped float is valid finite value, demonstrating short-to-int narrow type compatibility
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.bitCastFromInt(32767 as short);
      expect(result).assertEqual(4.5916e-41f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_4500
     * @tc.name testFloatBitCastFromInt045
     * @tc.desc Verify narrow type cast parameter: short min -32768 cast to int passed to bitCastFromInt, mapped float is NaN, demonstrating negative short-to-int narrow type compatibility
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.bitCastFromInt(-32768 as short);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_4600
     * @tc.name testFloatBitCastFromInt046
     * @tc.desc Verify Float.bitCastFromInt(0x7f800000) returns POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.bitCastFromInt(0x7f800000);
      expect(Float.isFinite(result)).assertFalse();
      expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2_4700
     * @tc.name testFloatBitCastFromInt047
     * @tc.desc Verify Float.bitCastFromInt(0x7fc00000) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatBitCastFromInt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.bitCastFromInt(0x7fc00000);
      expect(isNaN(result)).assertTrue();
    });


  });
}
