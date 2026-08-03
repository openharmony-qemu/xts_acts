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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayWithTest(): void {
  describe('Uint8ArrayWithTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0100
     * @tc.name testUint8ArrayWith001
     * @tc.desc Verify with with two parameters index and value for normal call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const val: byte = 100;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0200
     * @tc.name testUint8ArrayWith002
     * @tc.desc Verify with with index=-5 wraps to valid index for negative index on length 5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const val: byte = 100;
      let arr2 = arr.with(-5, val);
      expect(arr2[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0300
     * @tc.name testUint8ArrayWith003
     * @tc.desc Verify with with index=0 replacing only element of length 1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5);
      const val: byte = 99;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0400
     * @tc.name testUint8ArrayWith004
     * @tc.desc Verify with with index=0 replacing first element of length 3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const val: byte = 100;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0500
     * @tc.name testUint8ArrayWith005
     * @tc.desc Verify with with index=2 replacing last element of length 3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const val: short = 200;
      const result: Uint8Array = arr.with(2, val);
      expect(result[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0600
     * @tc.name testUint8ArrayWith006
     * @tc.desc Verify with with index=-1 wraps to valid index for negative index on length 3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const val: short = 150;
      let arr2 = arr.with(-1, val);
      expect(arr2[2]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0700
     * @tc.name testUint8ArrayWith007
     * @tc.desc Verify with with index=-3 wraps to valid index for negative index on length 3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const val: byte = 50;
      let arr2 = arr.with(-3, val);
      expect(arr2[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0800
     * @tc.name testUint8ArrayWith008
     * @tc.desc Verify with with index=0 replacing first element of length 100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      const val: byte = 1;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_0900
     * @tc.name testUint8ArrayWith009
     * @tc.desc Verify with with index=99 replacing last element of length 100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      arr[99] = 0;
      const val: short = 255;
      const result: Uint8Array = arr.with(99, val);
      expect(result[99]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1000
     * @tc.name testUint8ArrayWith010
     * @tc.desc Verify with with index=-1 wraps to valid index for negative index on length 100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      const val: byte = 127;
      let arr2 = arr.with(-1, val);
      expect(arr2[99]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1100
     * @tc.name testUint8ArrayWith011
     * @tc.desc Verify with with index=-100 wraps to valid index for negative index on length 100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      const val: short = 128;
      let arr2 = arr.with(-1, val);
      expect(arr2[99]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1200
     * @tc.name testUint8ArrayWith012
     * @tc.desc Verify with with index=0 on subarray view replacing first element of view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const view: Uint8Array = arr.subarray(1, 4);
      const val: byte = 99;
      const result: Uint8Array = view.with(0, val);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1300
     * @tc.name testUint8ArrayWith013
     * @tc.desc Verify with with index=2 on subarray view replacing last element of view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const view: Uint8Array = arr.subarray(1, 4);
      const val: byte = 88;
      const result: Uint8Array = view.with(2, val);
      expect(result[2]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1400
     * @tc.name testUint8ArrayWith014
     * @tc.desc Verify with with index=0 on buffer+offset view replacing first element of view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8Array = new Uint8Array(buf, 2, 3);
      const val: byte = 77;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1500
     * @tc.name testUint8ArrayWith015
     * @tc.desc Verify with with expression index 1*0+0 for index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const val: byte = 99;
      const result: Uint8Array = arr.with(1 * 0, val);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1600
     * @tc.name testUint8ArrayWith016
     * @tc.desc Verify with with expression index 4/2 for index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const val: byte = 77;
      const result: Uint8Array = arr.with(4 / 2, val);
      expect(result[2]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1700
     * @tc.name testUint8ArrayWith017
     * @tc.desc Verify with with value=0 minimum value replacing element to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1800
     * @tc.name testUint8ArrayWith018
     * @tc.desc Verify with with value=255 maximum value replacing element to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 255;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_1900
     * @tc.name testUint8ArrayWith019
     * @tc.desc Verify with with value=1 minimum positive boundary for correct replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 1;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2000
     * @tc.name testUint8ArrayWith020
     * @tc.desc Verify with with value=127 middle value for correct replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 127;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2100
     * @tc.name testUint8ArrayWith021
     * @tc.desc Verify with with value=128 middle+1 value for correct replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 128;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2200
     * @tc.name testUint8ArrayWith022
     * @tc.desc Verify with with value=254 max-1 value for correct replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 254;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2300
     * @tc.name testUint8ArrayWith023
     * @tc.desc Verify with with value=0x00 hex minimum value for hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0x00;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2400
     * @tc.name testUint8ArrayWith024
     * @tc.desc Verify with with value=0xFF hex maximum value for hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0xFF;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2500
     * @tc.name testUint8ArrayWith025
     * @tc.desc Verify with with value=0x80 hex 128 for hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0x80;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2600
     * @tc.name testUint8ArrayWith026
     * @tc.desc Verify with with value=0x7F hex 127 for hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0x7F;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2700
     * @tc.name testUint8ArrayWith027
     * @tc.desc Verify with with value=0x0F hex 15 for hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0x0F;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2800
     * @tc.name testUint8ArrayWith028
     * @tc.desc Verify with with value=0xF0 hex 240 for hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0xF0;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(240);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_2900
     * @tc.name testUint8ArrayWith029
     * @tc.desc Verify with with value=0b00000000 binary minimum for binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0b00000000;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3000
     * @tc.name testUint8ArrayWith030
     * @tc.desc Verify with with value=0b11111111 binary maximum for binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0b11111111;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3100
     * @tc.name testUint8ArrayWith031
     * @tc.desc Verify with with value=0b10101010 binary 170 for binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0b10101010;
      const result: Uint8Array = arr.with(1, val);
      expect(result[1]).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3200
     * @tc.name testUint8ArrayWith032
     * @tc.desc Verify with returns a new Uint8Array not the same object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 5;
      const result: Uint8Array = arr.with(1, val);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3300
     * @tc.name testUint8ArrayWith033
     * @tc.desc Verify with returns Uint8Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 5;
      const result: Uint8Array = arr.with(1, val);
      expect(Class.of(result)).assertEqual(Class.of(arr));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3400
     * @tc.name testUint8ArrayWith034
     * @tc.desc Verify with returns new array with same length as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 5;
      const result: Uint8Array = arr.with(1, val);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3500
     * @tc.name testUint8ArrayWith035
     * @tc.desc Verify with returns new array with unchanged elements at other positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 5;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3600
     * @tc.name testUint8ArrayWith036
     * @tc.desc Verify original array is not modified after calling with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 5;
      const result: Uint8Array = arr.with(1, val);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3700
     * @tc.name testUint8ArrayWith037
     * @tc.desc Verify with returns new array with replaced element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(99);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3800
     * @tc.name testUint8ArrayWith038
     * @tc.desc Verify with returns new array with replaced element at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      const result: Uint8Array = arr.with(2, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_3900
     * @tc.name testUint8ArrayWith039
     * @tc.desc Verify with with index=-1 wraps to valid index for negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      let arr2 = arr.with(-1, val);
      expect(arr2[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4000
     * @tc.name testUint8ArrayWith040
     * @tc.desc Verify with with index=-3 wraps to valid index for negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      let arr2 = arr.with(-3, val);
      expect(arr2[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4100
     * @tc.name testUint8ArrayWith041
     * @tc.desc Verify with returns new array with replaced element on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const view: Uint8Array = arr.subarray(1, 4);
      const val: byte = 99;
      const result: Uint8Array = view.with(0, val);
      expect(result[0]).assertEqual(99);
      expect(result[1]).assertEqual(30);
      expect(result[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4200
     * @tc.name testUint8ArrayWith042
     * @tc.desc Verify with returns new array with replaced element using expression index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      const result: Uint8Array = arr.with(1 * 0, val);
      expect(result[0]).assertEqual(99);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4300
     * @tc.name testUint8ArrayWith043
     * @tc.desc Verify with returns new array with replaced element using expression index 4/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const val: byte = 77;
      const result: Uint8Array = arr.with(4 / 2, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(77);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4400
     * @tc.name testUint8ArrayWith044
     * @tc.desc Verify with returns array with replaced element value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4500
     * @tc.name testUint8ArrayWith045
     * @tc.desc Verify with returns array with replaced element value=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 255;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4600
     * @tc.name testUint8ArrayWith046
     * @tc.desc Verify with returns array with replaced element value=127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 127;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(127);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4700
     * @tc.name testUint8ArrayWith047
     * @tc.desc Verify with returns array with replaced element value=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 128;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(128);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4800
     * @tc.name testUint8ArrayWith048
     * @tc.desc Verify with returns array with replaced element value=0xFF hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0xFF;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_4900
     * @tc.name testUint8ArrayWith049
     * @tc.desc Verify with returns array with replaced element value=0x00 hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0x00;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5000
     * @tc.name testUint8ArrayWith050
     * @tc.desc Verify with returns array with replaced element value=0x80 hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0x80;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(128);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5100
     * @tc.name testUint8ArrayWith051
     * @tc.desc Verify with returns array with replaced element value=0x7F hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0x7F;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(127);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5200
     * @tc.name testUint8ArrayWith052
     * @tc.desc Verify with returns array with replaced element value=0b11111111 binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0b11111111;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5300
     * @tc.name testUint8ArrayWith053
     * @tc.desc Verify with returns array with replaced element value=0b00000000 binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 0b00000000;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5400
     * @tc.name testUint8ArrayWith054
     * @tc.desc Verify with returns array with replaced element value=0b10101010 binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: short = 0b10101010;
      const result: Uint8Array = arr.with(1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(170);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5500
     * @tc.name testUint8ArrayWith055
     * @tc.desc Verify with index=length throws RangeError for length 3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      try {
        arr.with(3, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5600
     * @tc.name testUint8ArrayWith056
     * @tc.desc Verify with index=length+1 throws RangeError for length 3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      try {
        arr.with(4, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5700
     * @tc.name testUint8ArrayWith057
     * @tc.desc Verify with index negative beyond range throws RangeError for length 3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      try {
        arr.with(-4, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5800
     * @tc.name testUint8ArrayWith058
     * @tc.desc Verify with index negative beyond range for length 5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const val: byte = 99;
      try {
        arr.with(-6, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_5900
     * @tc.name testUint8ArrayWith059
     * @tc.desc Verify with index=5 throws RangeError for length 3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      try {
        arr.with(5, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6000
     * @tc.name testUint8ArrayWith060
     * @tc.desc Verify with index=6 throws RangeError for length 4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      const val: byte = 99;
      try {
        arr.with(6, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6100
     * @tc.name testUint8ArrayWith061
     * @tc.desc Verify with index=1 throws RangeError for length 1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100);
      const val: byte = 99;
      try {
        arr.with(1, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6200
     * @tc.name testUint8ArrayWith062
     * @tc.desc Verify with index=-2 throws RangeError for length 1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100);
      const val: byte = 99;
      try {
        arr.with(-2, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6300
     * @tc.name testUint8ArrayWith063
     * @tc.desc Verify with index=100 throws RangeError for length 100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      const val: byte = 99;
      try {
        arr.with(100, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6400
     * @tc.name testUint8ArrayWith064
     * @tc.desc Verify with index=101 throws RangeError for length 100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      const val: byte = 99;
      try {
        arr.with(101, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6500
     * @tc.name testUint8ArrayWith065
     * @tc.desc Verify with index=-101 throws RangeError for length 100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      const val: byte = 99;
      try {
        arr.with(-101, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6600
     * @tc.name testUint8ArrayWith066
     * @tc.desc Verify with index=view.length throws RangeError on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const view: Uint8Array = arr.subarray(1, 4);
      const val: byte = 99;
      try {
        view.with(3, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6700
     * @tc.name testUint8ArrayWith067
     * @tc.desc Verify with index=view.length+1 throws RangeError on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const view: Uint8Array = arr.subarray(1, 4);
      const val: byte = 99;
      try {
        view.with(4, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6800
     * @tc.name testUint8ArrayWith068
     * @tc.desc Verify with index=view.length throws RangeError on buffer+offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8Array = new Uint8Array(buf, 2, 3);
      const val: byte = 99;
      try {
        arr.with(3, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_6900
     * @tc.name testUint8ArrayWith069
     * @tc.desc Verify with index large positive throws RangeError on buffer+offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8Array = new Uint8Array(buf, 2, 3);
      const val: byte = 99;
      try {
        arr.with(999, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_7000
     * @tc.name testUint8ArrayWith070
     * @tc.desc Verify with index large negative -9999 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const val: byte = 99;
      try {
        arr.with(-9999, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_7100
     * @tc.name testUint8ArrayWith071
     * @tc.desc Verify with index=0 value=0 on length 1 array returns new array with 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100);
      const val: byte = 0;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_7200
     * @tc.name testUint8ArrayWith072
     * @tc.desc Verify with index=0 value=255 on length 1 array returns new array with 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100);
      const val: short = 255;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_7300
     * @tc.name testUint8ArrayWith073
     * @tc.desc Verify with index=0 value=0xFF hex on length 1 array returns new array with 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100);
      const val: short = 0xFF;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_WITH01_7400
     * @tc.name testUint8ArrayWith074
     * @tc.desc Verify with index=0 value=0b11111111 binary on length 1 array returns new array with 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayWith074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100);
      const val: short = 0b11111111;
      const result: Uint8Array = arr.with(0, val);
      expect(result[0]).assertEqual(255);
    });
  });
}