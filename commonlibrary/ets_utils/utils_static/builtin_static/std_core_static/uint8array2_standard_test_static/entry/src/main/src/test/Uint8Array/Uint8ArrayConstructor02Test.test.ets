'use static';

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
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayConstructor02Test(): void {
  describe('Uint8ArrayConstructor02Test', (): void => {
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
     * @tc.name testUint8ArrayConstructor02_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0010
     * @tc.desc Verify constructor with one int parameter creates Uint8Array with correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0020
     * @tc.desc Verify constructor with int literal 0 as parameter creates empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0030
     * @tc.desc Verify constructor with length 1 (minimum non-zero length)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0040
     * @tc.desc Verify constructor with length 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0050
     * @tc.desc Verify constructor with length 10 (typical medium length)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0060
     * @tc.desc Verify constructor with length 100 (larger length)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0070
     * @tc.desc Verify constructor with length 127 (uint8 mid value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(127);
      expect(arr.length).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0080
     * @tc.desc Verify constructor with length 128 (uint8 mid value + 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(128);
      expect(arr.length).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0090
     * @tc.desc Verify constructor with length 255 (uint8 max value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(255);
      expect(arr.length).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0100
     * @tc.desc Verify constructor with length 63 (octal 0o77)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0o77);
      expect(arr.length).assertEqual(63);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0110
     * @tc.desc Verify constructor with length 0xFF (hex literal)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0xFF);
      expect(arr.length).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0120
     * @tc.desc Verify constructor with length 0b1010 (binary literal)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0b1010);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0130
     * @tc.desc Verify constructor with length -1 (negative value throws RangeError)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor02_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0140
     * @tc.desc Verify constructor with length -2147483648 (int min value throws RangeError)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor02_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0150
     * @tc.desc Verify constructor with length -0 (negative zero treated as 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(-0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0160
     * @tc.desc Verify constructor with length as addition expression (5+3)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = 5 + 3;
      let arr: Uint8Array = new Uint8Array(len);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0170
     * @tc.desc Verify constructor with length as subtraction expression (10-2)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = 10 - 2;
      let arr: Uint8Array = new Uint8Array(len);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0180
     * @tc.desc Verify constructor with length as multiplication expression (3*7)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = 3 * 7;
      let arr: Uint8Array = new Uint8Array(len);
      expect(arr.length).assertEqual(21);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0190
     * @tc.desc Verify constructor with length as division expression (100/10)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = 100 / 10;
      let arr: Uint8Array = new Uint8Array(len);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0200
     * @tc.desc Verify constructor with length passed via int variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = 50;
      let arr: Uint8Array = new Uint8Array(len);
      expect(arr.length).assertEqual(50);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0210
     * @tc.desc Verify constructor with length 1e1 (scientific notation integer value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1e1);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0220
     * @tc.desc Verify constructor with length 0x0 (hex zero)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0x0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0230
     * @tc.desc Verify constructor returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0240
     * @tc.desc Verify byteLength equals passed length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(7);
      expect(arr.byteLength).assertEqual(7);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0250
     * @tc.desc Verify byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0260
     * @tc.desc Verify BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0270
     * @tc.desc Verify name is "Uint8Array"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(2);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor02_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0280
     * @tc.desc Verify buffer is not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(4);
      let buffer: ArrayBuffer = arr.buffer;
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0290
     * @tc.desc Verify buffer.byteLength is greater than or equal to byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(10);
      expect(arr.buffer.byteLength >= arr.byteLength).assertTrue();
    });

    /**
     * @tc.name testUint8ArrayConstructor02_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0300
     * @tc.desc Verify length=0 throws RangeError for $_get(0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor02_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0310
     * @tc.desc Verify length=3 initializes all elements to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0320
     * @tc.desc Verify length=100 initializes first, middle, and last elements to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(49)).assertEqual(0);
      expect(arr.$_get(99)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0330
     * @tc.desc Verify constructor with FixedArray<number> parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [1.0, 2.0, 3.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0340
     * @tc.desc Verify constructor with implicit type inferred number array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0350
     * @tc.desc Verify constructor with empty FixedArray creates empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0360
     * @tc.desc Verify constructor with single element 0.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0370
     * @tc.desc Verify constructor with single element 255.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [255.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0380
     * @tc.desc Verify constructor with multiple elements [1.0, 2.0, 3.0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [1.0, 2.0, 3.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0390
     * @tc.desc Verify constructor with boundary value set [0.0, 127.0, 128.0, 255.0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.0, 127.0, 128.0, 255.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(127);
      expect(arr.$_get(2)).assertEqual(128);
      expect(arr.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0400
     * @tc.desc Verify constructor with 10 elements all 0.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(5)).assertEqual(0);
      expect(arr.$_get(9)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0410
     * @tc.desc Verify constructor with 10 elements all 255.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(255);
      expect(arr.$_get(9)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0420
     * @tc.desc Verify constructor with hex literal elements [0x10, 0xFF, 0x80]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0x10, 0xFF, 0x80];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(255);
      expect(arr.$_get(2)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0430
     * @tc.desc Verify constructor with binary literal elements [0b1111, 0b10101010]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0b1111, 0b10101010];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(15);
      expect(arr.$_get(1)).assertEqual(170);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0440
     * @tc.desc Verify constructor with octal literal elements [0o77, 0o200]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0o77, 0o200];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(63);
      expect(arr.$_get(1)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0450
     * @tc.desc Verify constructor with scientific notation elements [1e2, 1.5e2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [1e2, 1.5e2];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(150);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0460
     * @tc.desc Verify constructor with positive decimal elements [3.14, 2.718]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [3.14, 2.718];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0470
     * @tc.desc Verify constructor with negative zero element [-0.0 truncated to 0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [-0.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0480
     * @tc.desc Verify constructor with positive sign literal elements [+0.0, +127.0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [+0.0, +127.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0490
     * @tc.desc Verify constructor with 100 elements array validates length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0,
        10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0,
        20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0,
        30.0, 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0,
        40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0,
        50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0,
        60.0, 61.0, 62.0, 63.0, 64.0, 65.0, 66.0, 67.0, 68.0, 69.0,
        70.0, 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0,
        80.0, 81.0, 82.0, 83.0, 84.0, 85.0, 86.0, 87.0, 88.0, 89.0,
        90.0, 91.0, 92.0, 93.0, 94.0, 95.0, 96.0, 97.0, 98.0, 99.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0500
     * @tc.desc Verify constructor with alternating boundary values [0.0, 255.0, 0.0, 255.0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.0, 255.0, 0.0, 255.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(255);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0510
     * @tc.desc Verify constructor with boundary-adjacent decimal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.001, 0.999, 254.999, 255.001];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(254);
      expect(arr.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0520
     * @tc.desc Verify constructor with overflow value [256.0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [256.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0530
     * @tc.desc Verify constructor with underflow value [-1.0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [-1.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0540
     * @tc.desc Verify constructor with mixed exception values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [256.0, -1.0, 128.0, 0.0, 255.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(255);
      expect(arr.$_get(2)).assertEqual(128);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0550
     * @tc.desc Verify length equals input FixedArray length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [10.0, 20.0, 30.0, 40.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0560
     * @tc.desc Verify byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [1.0, 2.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0570
     * @tc.desc Verify byteLength equals element count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [5.0, 10.0, 15.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0580
     * @tc.desc Verify buffer is not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [7.0, 8.0];
      let arr: Uint8Array = new Uint8Array(nums);
      let buffer: ArrayBuffer = arr.buffer;
      expect(buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0590
     * @tc.desc Verify name is "Uint8Array"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [1.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor02_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0600
     * @tc.desc Verify Uint8Array does not share data with source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [100.0, 200.0];
      let arr: Uint8Array = new Uint8Array(nums);
      nums[0] = 999.0;
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0610
     * @tc.desc Verify instanceof Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.0, 1.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0620
     * @tc.desc Verify [257.0] wraps to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [257.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0630
     * @tc.desc Verify [511.0] wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [511.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0640
     * @tc.desc Verify [512.0] wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [512.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0650
     * @tc.desc Verify [1000.0] wraps to 232
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [1000.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(232);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0660
     * @tc.desc Verify [-2.0] wraps to 254
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [-2.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(254);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0670
     * @tc.desc Verify [-255.0] wraps to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [-255.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0680
     * @tc.desc Verify [-256.0] wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [-256.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0690
     * @tc.desc Verify [-300.0] wraps to 212 (-300 & 0xFF)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [-300.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(212);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0700
     * @tc.desc Verify [3.14] truncated to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [3.14];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0710
     * @tc.desc Verify [0.5] truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [0.5];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0720
     * @tc.desc Verify [127.5] truncated to 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [127.5];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0730
     * @tc.desc Verify [255.9] truncated to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [255.9];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0740
     * @tc.desc Verify [256.9] overflow truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [256.9];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_075
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0750
     * @tc.desc Verify [-0.5] truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [-0.5];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_076
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0760
     * @tc.desc Verify [-127.5] wraps to 129
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [-127.5];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(129);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_077
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0770
     * @tc.desc Verify [1e10] huge positive number truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [1e10];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_078
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0780
     * @tc.desc Verify [42] single element array construction succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: FixedArray<number> = [42.0];
      let arr: Uint8Array = new Uint8Array(nums);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_079
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0790
     * @tc.desc Verify constructor with ArrayBuffer and number offset two parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_080
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0800
     * @tc.desc Verify constructor with ArrayBuffer and large buffer validation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_081
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0810
     * @tc.desc Verify constructor with 4-byte ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_082
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0820
     * @tc.desc Verify constructor with empty ArrayBuffer (0 bytes)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_083
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0830
     * @tc.desc Verify constructor with 1-byte ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_084
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0840
     * @tc.desc Verify offset 0.0 creates view from buffer start position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_085
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0850
     * @tc.desc Verify byteOffset 1.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 1.0);
      expect(arr.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_086
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0860
     * @tc.desc Verify byteOffset 2.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 2.0);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_087
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0870
     * @tc.desc Verify byteOffset 7.0 (8-byte buffer last valid offset)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 7.0);
      expect(arr.byteOffset).assertEqual(7);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_088
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0880
     * @tc.desc Verify byteOffset 0.5 (float truncated to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_089
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0890
     * @tc.desc Verify byteOffset 1.5 (float truncated to 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 1.5);
      expect(arr.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_090
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0900
     * @tc.desc Verify byteOffset 3.7 (float truncated to 3)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 3.7);
      expect(arr.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_091
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0910
     * @tc.desc Verify byteOffset 0xFF (hex literal 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(300);
      let arr: Uint8Array = new Uint8Array(buf, 0xFF);
      expect(arr.byteOffset).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_092
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0920
     * @tc.desc Verify byteOffset -0.0 (negative zero treated as 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, -0.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_093
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0930
     * @tc.desc Verify byteOffset 2.999 (float truncated to 2)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 2.999);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_094
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0940
     * @tc.desc Verify byteOffset 0b10 (binary literal 2)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 0b10);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_095
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0950
     * @tc.desc Verify byteOffset 0o10 (octal literal 8)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Uint8Array = new Uint8Array(buf, 0o10);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_096
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0960
     * @tc.desc Verify byteOffset equals buffer byte count minus 1, view has 1 byte remaining
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 3.0);
      expect(arr.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_097
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0970
     * @tc.desc Verify byteOffset equals buffer byte count, view length is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 4.0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_098
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0980
     * @tc.desc Verify byteOffset 1e1 (scientific notation 10)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Uint8Array = new Uint8Array(buf, 1e1);
      expect(arr.byteOffset).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_099
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_0990
     * @tc.desc Verify byteLength equals buffer byte count minus offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 3.0);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_100
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1000
     * @tc.desc Verify length equals byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint8Array = new Uint8Array(buf, 4.0);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_101
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1010
     * @tc.desc Verify BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_102
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1020
     * @tc.desc Verify name is "Uint8Array"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor02_103
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1030
     * @tc.desc Verify buffer is not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      let buffer: ArrayBuffer = arr.buffer;
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_104
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1040
     * @tc.desc Verify buffer.byteLength is greater than or equal to byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 2.0);
      expect(arr.buffer.byteLength >= arr.byteLength).assertTrue();
    });

    /**
     * @tc.name testUint8ArrayConstructor02_105
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1050
     * @tc.desc Verify offset 2 view length equals buffer byte count minus 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 2.0);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_106
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1060
     * @tc.desc Verify offset 7 view length equals 1 (8-byte buffer)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 7.0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_107
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1070
     * @tc.desc Verify offset 5 view byteOffset equals 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint8Array = new Uint8Array(buf, 5.0);
      expect(arr.byteOffset).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_108
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1080
     * @tc.desc Verify offset 0 view buffer.byteLength is greater than or equal to byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      expect(arr.buffer.byteLength >= arr.byteLength).assertTrue();
    });

    /**
     * @tc.name testUint8ArrayConstructor02_109
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1090
     * @tc.desc Verify writing to Uint8Array view is observable through buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      arr.$_set(0, 42);
      let view: DataView = new DataView(buf);
      expect(view.getUint8(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_110
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1100
     * @tc.desc Verify modifying buffer content is observable through Uint8Array view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0.0);
      let view: DataView = new DataView(buf);
      view.setUint8(0, 77);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_111
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1110
     * @tc.desc Verify two Uint8Array views sharing same buffer are mutually visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr1: Uint8Array = new Uint8Array(buf, 0.0);
      let arr2: Uint8Array = new Uint8Array(buf, 0.0);
      arr1.$_set(1, 33);
      expect(arr2.$_get(1)).assertEqual(33);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_112
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1120
     * @tc.desc Verify offset view and non-offset view share buffer data correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let base: Uint8Array = new Uint8Array(buf, 0.0);
      let offset: Uint8Array = new Uint8Array(buf, 4.0);
      base.$_set(3, 11);
      base.$_set(4, 22);
      expect(offset.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_113
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1130
     * @tc.desc Verify writing to different offset views does not overlap
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let low: Uint8Array = new Uint8Array(buf, 0.0);
      let high: Uint8Array = new Uint8Array(buf, 3.0);
      low.$_set(2, 99);
      high.$_set(0, 88);
      expect(low.$_get(2)).assertEqual(99);
      expect(high.$_get(0)).assertEqual(88);
      expect(low.$_get(3)).assertEqual(88);
    });

    /**
     * @tc.name testUint8ArrayConstructor02_114
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_02_1140
     * @tc.desc Verify offset view write is observable through DataView
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor02_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 2.0);
      arr.$_set(0, 10);
      let view: DataView = new DataView(buf);
      expect(view.getUint8(2)).assertEqual(10);
    });
  });
}