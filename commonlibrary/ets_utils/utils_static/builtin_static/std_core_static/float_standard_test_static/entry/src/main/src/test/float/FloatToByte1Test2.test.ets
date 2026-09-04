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

export default function FloatToByte1Test2(): void {
  describe('FloatToByte1Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0100
     * @tc.name testFloatToByte001
     * @tc.desc Verify toByte() on Float(42) returns 42 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      const f: Float = new Float(val);
      expect(f.toByte()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0200
     * @tc.name testFloatToByte002
     * @tc.desc Verify toByte() on Float(100) returns 100 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      const f: Float = new Float(val);
      expect(f.toByte()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0300
     * @tc.name testFloatToByte003
     * @tc.desc Verify toByte() on Float(123.45) returns 123 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 123.45;
      const f: Float = new Float(val);
      expect(f.toByte()).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0400
     * @tc.name testFloatToByte004
     * @tc.desc Verify toByte() on Float(-50.0f) returns -50 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -50.0f;
      const f: Float = new Float(val);
      expect(f.toByte()).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0500
     * @tc.name testFloatToByte005
     * @tc.desc Verify toByte() on Float(4.0f) returns 4 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.toByte()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0600
     * @tc.name testFloatToByte006
     * @tc.desc Verify toByte() on Float(1.0e2f) returns 100 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e2f;
      const f: Float = new Float(val);
      expect(f.toByte()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0700
     * @tc.name testFloatToByte007
     * @tc.desc Verify toByte throws ClassCastError when passing int 1 upcast to Object then cast to float as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const val: int = 1;
        Float.toByte(val as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0800
     * @tc.name testFloatToByte008
     * @tc.desc Verify toByte() on Float(42.0) returns 42 as byte for original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const original: float = f.toFloat();
      f.toByte();
      expect(f.toFloat()).assertEqual(original);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_0900
     * @tc.name testFloatToByte009
     * @tc.desc Verify toByte() throws ClassCastError when passing {} as Object as float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const valF: float = {} as Object as float;
        const f: Float = new Float(valF);
        f.toByte();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1000
     * @tc.name testFloatToByte010
     * @tc.desc Verify chained assertLargerOrEqual then assertLessOrEqual() on Float(testValues[i])
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: float[] = [Float.MAX_VALUE, Float.MIN_VALUE, 999999.0f, -999999.0f, 0.0f, 127.0f, -128.0f];
      for (let i = 0; i < testValues.length; i++) {
        const result: byte = new Float(testValues[i]).toByte();
        expect(result).assertLargerOrEqual(-128);
        expect(result).assertLessOrEqual(127);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1100
     * @tc.name testFloatToByte011
     * @tc.desc Verify toByte() on Float(100.0f) returns 100.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteVal: byte = new Float(100.0f).toByte();
      const floatVal: float = new Float(byteVal).toFloat();
      expect(floatVal).assertEqual(100.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1200
     * @tc.name testFloatToByte012
     * @tc.desc Verify toByte() on Float(-1.0f) returns -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteVal: byte = new Float(-1.0f).toByte();
      const floatVal: float = new Float(byteVal).toFloat();
      expect(floatVal).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1300
     * @tc.name testFloatToByte013
     * @tc.desc Verify toByte() on Float(0.0f) minus 5 equals -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(0.0f).toByte() - 5;
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1400
     * @tc.name testFloatToByte014
     * @tc.desc Verify toByte() on Float(42.0f) returns 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(42.0f).toByte() | 0x00;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1500
     * @tc.name testFloatToByte015
     * @tc.desc Verify toByte() on Float(0.0f) XOR 0xFF equals 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(0.0f).toByte() ^ 0xFF;
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1600
     * @tc.name testFloatToByte016
     * @tc.desc Verify chained assertLargerOrEqual then assertLessOrEqual() on Float(Float.MAX_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.MAX_SAFE_INTEGER).toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLessOrEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1700
     * @tc.name testFloatToByte017
     * @tc.desc Verify toByte idempotency: same input multiple calls return the same byte result (12.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: byte = new Float(12.0f).toByte();
      const staticResult: byte = Float.toByte(12.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1800
     * @tc.name testFloatToByte018
     * @tc.desc Verify toByte() on Float(127.0f) equals Float.toByte(127.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(127.0f).toByte()).assertEqual(Float.toByte(127.0f));
      expect(new Float(-128.0f).toByte()).assertEqual(Float.toByte(-128.0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_1900
     * @tc.name testFloatToByte019
     * @tc.desc Verify toByte() on Float(50.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(50.0f).toByte();
      expect(result).assertLess(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2000
     * @tc.name testFloatToByte020
     * @tc.desc Verify toByte() on Float(50) returns 50 via variable equaling 50
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 50;
      const result: byte = new Float(val).toByte();
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2100
     * @tc.name testFloatToByte021
     * @tc.desc Verify toByte() on Float(127) returns 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 127 as byte;
      const result: byte = new Float(val).toByte();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2200
     * @tc.name testFloatToByte022
     * @tc.desc Verify toByte() on Float(-128) returns -128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const result: byte = new Float(val).toByte();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2300
     * @tc.name testFloatToByte023
     * @tc.desc Verify toByte() on Float(0) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 0 as byte;
      const result: byte = new Float(val).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2400
     * @tc.name testFloatToByte024
     * @tc.desc Verify toByte idempotency: same input multiple calls return the same byte result (42.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = new Float(42.0f).toByte();
      const b: byte = new Float(42.0f).toByte();
      expect(Float.compare(a, b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2500
     * @tc.name testFloatToByte025
     * @tc.desc Verify toByte() on Float(1.0f): result is byte value, expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(1.0f).toByte();
      let matched: boolean = false;
      switch (result) {
        case 1:
        matched = true;
        break;
        default:
        break;
      }
      expect(matched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2600
     * @tc.name testFloatToByte026
     * @tc.desc Verify toByte() on Float(2.0f) used as array index retrieves 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30, 40, 50];
      const idx: byte = new Float(2.0f).toByte();
      expect(arr[idx]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2700
     * @tc.name testFloatToByte027
     * @tc.desc Verify toByte() on Float(42.0f) used as Map key retrieves 'forty-two'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      const key: byte = new Float(42.0f).toByte();
      map.set(key, 'forty-two');
      expect(map.get(key)).assertEqual('forty-two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2800
     * @tc.name testFloatToByte028
     * @tc.desc Verify toByte idempotency: same input multiple calls return the same byte result (10.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = new Float(10.0f).toByte();
      const b: byte = new Float(5.0f).toByte();
      const result: int = (a + b) * 2 - 10;
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_2900
     * @tc.name testFloatToByte029
     * @tc.desc Verify toByte() on Float(NaN) returns 0 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.NaN).toByte();
      expect(result).assertEqual(0 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3000
     * @tc.name testFloatToByte030
     * @tc.desc Verify toByte() on Float(POSITIVE_INFINITY) returns -1 as byte (POSITIVE_INFINITY truncates to -1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.POSITIVE_INFINITY).toByte();
      expect(result).assertEqual(-1 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3100
     * @tc.name testFloatToByte031
     * @tc.desc Verify toByte() on Float(NEGATIVE_INFINITY) returns 0 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.NEGATIVE_INFINITY).toByte();
      expect(result).assertEqual(0 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3200
     * @tc.name testFloatToByte032
     * @tc.desc Verify toByte() on Float(-Float.MAX_SAFE_INTEGER) returns value within byte range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-Float.MAX_SAFE_INTEGER).toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLessOrEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3300
     * @tc.name testFloatToByte033
     * @tc.desc Verify toByte() on Float(1.0e-3f) returns 0 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(1.0e-3f).toByte();
      expect(result).assertEqual(0 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3400
     * @tc.name testFloatToByte034
     * @tc.desc Verify toByte() on Float(1.0e10f) returns -1 as byte (1.0e10f truncates to -1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(1.0e10f).toByte();
      expect(result).assertEqual(-1 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3500
     * @tc.name testFloatToByte035
     * @tc.desc Verify consistency: instance.toByte(NaN) equals Float.toByte(NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: byte = new Float(Float.NaN).toByte();
      const staticResult: byte = Float.toByte(Float.NaN);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3600
     * @tc.name testFloatToByte036
     * @tc.desc Verify consistency: instance.toByte(POSITIVE_INFINITY) equals Float.toByte(POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: byte = new Float(Float.POSITIVE_INFINITY).toByte();
      const staticResult: byte = Float.toByte(Float.POSITIVE_INFINITY);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3700
     * @tc.name testFloatToByte037
     * @tc.desc Verify toByte() on Float(0.0f / 0.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(0.0f / 0.0f).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3800
     * @tc.name testFloatToByte038
     * @tc.desc Verify toByte() on Float(383.0f) returns 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowByte: byte = new Float(383.0f).toByte();
      const normalByte: byte = new Float(127.0f).toByte();
      let isEqual:boolean = overflowByte===normalByte
      expect(normalByte).assertEqual(127);
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_3900
     * @tc.name testFloatToByte039
     * @tc.desc Verify toByte() on Float(127.1f) returns 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float(127.1f);
      let firstByte: byte = f1.toByte();
      const f2: Float = new Float(127.9f);
      const secondByte: byte = f2.toByte();
      let isEqual:boolean = firstByte===secondByte
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_4000
     * @tc.name testFloatToByte040
     * @tc.desc Verify toByte() on Float(-128.1f) returns -128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float(-128.1f);
      const f2: Float = new Float(-128.9f);
      let firstByte: byte = f1.toByte();
      let secondByte: byte = f2.toByte();
      let isEqual:boolean = firstByte===secondByte
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_4100
     * @tc.name testFloatToByte041
     * @tc.desc Verify toByte() on Float(130.0f) returns -126
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(130.0f);
      const result: byte = f.toByte();
      expect(result).assertEqual(-126);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_4200
     * @tc.name testFloatToByte042
     * @tc.desc Verify toByte() on Float(513.0f) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(513.0f);
      const result: byte = f.toByte();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_4300
     * @tc.name testFloatToByte043
     * @tc.desc Verify toByte() on Float(1023.0f) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1023.0f);
      const result: byte = f.toByte();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_ONE_4400
     * @tc.name testFloatToByte044
     * @tc.desc Verify toByte() on Float(Float.MAX_SAFE_INTEGER) returns -1 due to truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToByte044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: byte = f.toByte();
      expect(result).assertEqual(-1);
    });


  });
}
