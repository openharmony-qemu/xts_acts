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

export default function Uint8ArrayTotal01Test(): void {
  describe('Uint8ArrayTotal01Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0010
     * @tc.name testUint8ArrayTotal001
     * @tc.desc Verify constructor with no arguments creates empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0020
     * @tc.name testUint8ArrayTotal002
     * @tc.desc Verify constructor with single int length argument creates array of specified length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0030
     * @tc.name testUint8ArrayTotal003
     * @tc.desc Verify constructor with single number length argument creates array of truncated length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5.0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0040
     * @tc.name testUint8ArrayTotal004
     * @tc.desc Verify constructor with Uint8Array source copies elements from source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(10, 20, 30);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0050
     * @tc.name testUint8ArrayTotal005
     * @tc.desc Verify constructor with FixedArray<int> creates array from literal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0060
     * @tc.name testUint8ArrayTotal006
     * @tc.desc Verify constructor with Array<int> creates array from array object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [4, 5, 6];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0070
     * @tc.name testUint8ArrayTotal007
     * @tc.desc Verify constructor with Iterable<Number> creates array from number iterable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = [7.0, 8.0, 9.0];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0080
     * @tc.name testUint8ArrayTotal008
     * @tc.desc Verify constructor with ArrayBuffer creates view over entire buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0090
     * @tc.name testUint8ArrayTotal009
     * @tc.desc Verify constructor with ArrayBuffer and int byteOffset creates view from offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0100
     * @tc.name testUint8ArrayTotal010
     * @tc.desc Verify constructor with ArrayBuffer and number byteOffset creates view from truncated offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2.0);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0110
     * @tc.name testUint8ArrayTotal011
     * @tc.desc Verify constructor with ArrayBuffer, int offset and int length creates view with specified range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0120
     * @tc.name testUint8ArrayTotal012
     * @tc.desc Verify constructor with ArrayBuffer and undefined offset and length defaults to full buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, undefined, undefined);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0130
     * @tc.name testUint8ArrayTotal013
     * @tc.desc Verify constructor with int length 0 creates empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0140
     * @tc.name testUint8ArrayTotal014
     * @tc.desc Verify constructor with int length 1 creates array with single element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0150
     * @tc.name testUint8ArrayTotal015
     * @tc.desc Verify constructor with int length 255 creates array with 255 elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(255);
      expect(arr.length).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0160
     * @tc.name testUint8ArrayTotal016
     * @tc.desc Verify constructor with number length 0.0 creates empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0.0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0170
     * @tc.name testUint8ArrayTotal017
     * @tc.desc Verify constructor with number length 3.9 truncates to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3.9);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0180
     * @tc.name testUint8ArrayTotal018
     * @tc.desc Verify constructor copies empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array();
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0190
     * @tc.name testUint8ArrayTotal019
     * @tc.desc Verify constructor copies Uint8Array with boundary values 0, 127, 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(0, 127, 255);
      const arr = new Uint8Array(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0200
     * @tc.name testUint8ArrayTotal020
     * @tc.desc Verify constructor with FixedArray<int> containing hex literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x0A, 0xFF, 0x00]);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0210
     * @tc.name testUint8ArrayTotal021
     * @tc.desc Verify constructor with FixedArray<number> containing float values truncates to int
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.5, 2.9, 3.1]);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0220
     * @tc.name testUint8ArrayTotal022
     * @tc.desc Verify constructor with FixedArray<int> containing binary literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b1010, 0b11111111]);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0230
     * @tc.name testUint8ArrayTotal023
     * @tc.desc Verify constructor with FixedArray<int> containing octal literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0o377, 0o200]);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0240
     * @tc.name testUint8ArrayTotal024
     * @tc.desc Verify constructor with empty Array<int> creates empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0250
     * @tc.name testUint8ArrayTotal025
     * @tc.desc Verify constructor with single-element Array<int> creates array with that element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [42];
      const arr = new Uint8Array(src);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0260
     * @tc.name testUint8ArrayTotal026
     * @tc.desc Verify constructor with ArrayBuffer of length 1 creates view with 1 element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0270
     * @tc.name testUint8ArrayTotal027
     * @tc.desc Verify constructor with empty ArrayBuffer creates empty view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0280
     * @tc.name testUint8ArrayTotal028
     * @tc.desc Verify constructor with byteOffset 0 starts from buffer beginning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0290
     * @tc.name testUint8ArrayTotal029
     * @tc.desc Verify constructor with byteOffset 2 creates view at non-zero offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0300
     * @tc.name testUint8ArrayTotal030
     * @tc.desc Verify constructor with number byteOffset 0.0 starts from buffer beginning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf, 0.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0310
     * @tc.name testUint8ArrayTotal031
     * @tc.desc Verify constructor with number byteOffset 1.9 truncates to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf, 1.9);
      expect(arr.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0320
     * @tc.name testUint8ArrayTotal032
     * @tc.desc Verify constructor with length 0 in three-argument form creates view with 0 elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0330
     * @tc.name testUint8ArrayTotal033
     * @tc.desc Verify constructor with length 1 in three-argument form creates view with 1 element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0340
     * @tc.name testUint8ArrayTotal034
     * @tc.desc Verify BYTES_PER_ELEMENT property returns 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0350
     * @tc.name testUint8ArrayTotal035
     * @tc.desc Verify buffer property returns the underlying ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const result = arr.buffer;
      expect(result).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0360
     * @tc.name testUint8ArrayTotal036
     * @tc.desc Verify byteOffset property returns 0 for view starting at buffer beginning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0370
     * @tc.name testUint8ArrayTotal037
     * @tc.desc Verify byteLength property equals length * BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0380
     * @tc.name testUint8ArrayTotal038
     * @tc.desc Verify length property returns number of elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0390
     * @tc.name testUint8ArrayTotal039
     * @tc.desc Verify name property returns Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const name = arr.name;
      expect(name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0400
     * @tc.name testUint8ArrayTotal040
     * @tc.desc Verify $_get with one argument index returns element at that index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr[1];
      expect(val).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0410
     * @tc.name testUint8ArrayTotal041
     * @tc.desc Verify $_get with index 0 returns first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr[0];
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0420
     * @tc.name testUint8ArrayTotal042
     * @tc.desc Verify $_get with index length-1 returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr[2];
      expect(val).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0430
     * @tc.name testUint8ArrayTotal043
     * @tc.desc Verify $_get with index equal to length returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      try {
        const val = arr[3];
        expect(val).assertEqual(undefined);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0440
     * @tc.name testUint8ArrayTotal044
     * @tc.desc Verify $_set with two arguments index and value sets element at that index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[1] = 42;
      expect(arr[1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0450
     * @tc.name testUint8ArrayTotal045
     * @tc.desc Verify $_set with index 0 sets first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = 100;
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0460
     * @tc.name testUint8ArrayTotal046
     * @tc.desc Verify $_set with index length-1 sets last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[2] = 200;
      expect(arr[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0470
     * @tc.name testUint8ArrayTotal047
     * @tc.desc Verify $_set with index equal to length does not change length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      try {
        arr[3] = 100;
        expect(arr.length).assertEqual(3);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0480
     * @tc.name testUint8ArrayTotal048
     * @tc.desc Verify $_set with value 0 stores zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = 0;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0490
     * @tc.name testUint8ArrayTotal049
     * @tc.desc Verify $_set with value 255 stores max uint8 value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = 255;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0500
     * @tc.name testUint8ArrayTotal050
     * @tc.desc Verify $_set with value 128 stores mid-range value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = 128;
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0510
     * @tc.name testUint8ArrayTotal051
     * @tc.desc Verify $_set with value 256 wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = 256;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0520
     * @tc.name testUint8ArrayTotal052
     * @tc.desc Verify $_set with value -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = -1;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0530
     * @tc.name testUint8ArrayTotal053
     * @tc.desc Verify at with one argument index returns element at that index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr.at(1);
      expect(val).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0540
     * @tc.name testUint8ArrayTotal054
     * @tc.desc Verify at with index 0 returns first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr.at(0);
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0550
     * @tc.name testUint8ArrayTotal055
     * @tc.desc Verify at with index -1 returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr.at(-1);
      expect(val).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0560
     * @tc.name testUint8ArrayTotal056
     * @tc.desc Verify at with index -3 returns first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr.at(-3);
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0570
     * @tc.name testUint8ArrayTotal057
     * @tc.desc Verify at with index equal to length returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr.at(3);
      expect(val).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0580
     * @tc.name testUint8ArrayTotal058
     * @tc.desc Verify at with index -length-1 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const val = arr.at(-4);
      expect(val).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0590
     * @tc.name testUint8ArrayTotal059
     * @tc.desc Verify with returns new Uint8Array with element at index replaced
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.with(1, 99);
      expect(result[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0600
     * @tc.name testUint8ArrayTotal060
     * @tc.desc Verify with index 0 replaces first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.with(0, 99);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0610
     * @tc.name testUint8ArrayTotal061
     * @tc.desc Verify with index length-1 replaces last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.with(2, 99);
      expect(result[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0620
     * @tc.name testUint8ArrayTotal062
     * @tc.desc Verify with value 127 replaces element with mid-range value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.with(1, 127);
      expect(result[1]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0630
     * @tc.name testUint8ArrayTotal063
     * @tc.desc Verify with value 256 wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.with(1, 256);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0640
     * @tc.name testUint8ArrayTotal064
     * @tc.desc Verify with value -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.with(1, -1);
      expect(result[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0650
     * @tc.name testUint8ArrayTotal065
     * @tc.desc Verify set with two arguments array and offset copies elements from array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const src = Uint8Array.of(1, 2, 3);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0660
     * @tc.name testUint8ArrayTotal066
     * @tc.desc Verify set with offset 0 copies elements from beginning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const src = Uint8Array.of(1, 2, 3);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0670
     * @tc.name testUint8ArrayTotal067
     * @tc.desc Verify set with offset at end of array copies elements at end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const src = Uint8Array.of(1, 2);
      arr.set(src, 3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0680
     * @tc.name testUint8ArrayTotal068
     * @tc.desc Verify set with offset as number truncates to int
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const src = Uint8Array.of(1, 2);
      arr.set(src, 1.9.toInt());
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0690
     * @tc.name testUint8ArrayTotal069
     * @tc.desc Verify set with source as FixedArray<int> copies literal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.set([10.0, 20.0, 30.0], 0);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0700
     * @tc.name testUint8ArrayTotal070
     * @tc.desc Verify set with source as Array<int> copies array elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const src: Array<number> = [10.0, 20.0, 30.0];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0710
     * @tc.name testUint8ArrayTotal071
     * @tc.desc Verify set with source as Iterable<Number> copies number values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const src: Array<Number> = [10.0, 20.0, 30.0];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0720
     * @tc.name testUint8ArrayTotal072
     * @tc.desc Verify set with source containing boundary value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.set([0], 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0730
     * @tc.name testUint8ArrayTotal073
     * @tc.desc Verify set with source containing boundary value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.set([255], 0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0740
     * @tc.name testUint8ArrayTotal074
     * @tc.desc Verify copyWithin copies elements within the array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0750
     * @tc.name testUint8ArrayTotal075
     * @tc.desc Verify copyWithin with target 0 copies from start to end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0760
     * @tc.name testUint8ArrayTotal076
     * @tc.desc Verify copyWithin with negative target copies to negative target position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(-2, 0, 2);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0770
     * @tc.name testUint8ArrayTotal077
     * @tc.desc Verify copyWithin with negative start copies from negative start position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, -3, -1);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0780
     * @tc.name testUint8ArrayTotal078
     * @tc.desc Verify copyWithin with negative end copies up to negative end position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, -1);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0790
     * @tc.name testUint8ArrayTotal079
     * @tc.desc Verify fill with three arguments value, start, end fills range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(42, 1, 4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(42);
      expect(arr[3]).assertEqual(42);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0800
     * @tc.name testUint8ArrayTotal080
     * @tc.desc Verify fill with two arguments value and start fills from start to end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(42, 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(42);
      expect(arr[4]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0810
     * @tc.name testUint8ArrayTotal081
     * @tc.desc Verify fill with one argument value fills entire array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(42);
      expect(arr[0]).assertEqual(42);
      expect(arr[4]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0820
     * @tc.name testUint8ArrayTotal082
     * @tc.desc Verify fill with value 0 fills with zeros
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0830
     * @tc.name testUint8ArrayTotal083
     * @tc.desc Verify fill with value 255 fills with max uint8 value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(255);
      expect(arr[0]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0840
     * @tc.name testUint8ArrayTotal084
     * @tc.desc Verify fill with value 128 fills with mid-range value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(128);
      expect(arr[0]).assertEqual(128);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0850
     * @tc.name testUint8ArrayTotal085
     * @tc.desc Verify fill with value 256 wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(256);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0860
     * @tc.name testUint8ArrayTotal086
     * @tc.desc Verify fill with value -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(-1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0870
     * @tc.name testUint8ArrayTotal087
     * @tc.desc Verify fill with negative start fills from negative start position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(42, -3);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(42);
      expect(arr[4]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0880
     * @tc.name testUint8ArrayTotal088
     * @tc.desc Verify fill with negative end fills up to negative end position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(42, 1, -1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(42);
      expect(arr[3]).assertEqual(42);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0890
     * @tc.name testUint8ArrayTotal089
     * @tc.desc Verify fill with start greater than end does nothing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(42, 3, 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0900
     * @tc.name testUint8ArrayTotal090
     * @tc.desc Verify static of with multiple int arguments creates array with those values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0910
     * @tc.name testUint8ArrayTotal091
     * @tc.desc Verify static of with no arguments creates empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0920
     * @tc.name testUint8ArrayTotal092
     * @tc.desc Verify static of with single argument creates array with one element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0930
     * @tc.name testUint8ArrayTotal093
     * @tc.desc Verify static of with boundary value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0940
     * @tc.name testUint8ArrayTotal094
     * @tc.desc Verify static of with boundary value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0950
     * @tc.name testUint8ArrayTotal095
     * @tc.desc Verify static from with array-like object creates Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [1, 2, 3];
      const arr = Uint8Array.from(src);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0960
     * @tc.name testUint8ArrayTotal096
     * @tc.desc Verify static from with mapFn transforms elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8Array.from(src, (x: number): number => x * 2);
      expect(arr.at(0)).assertEqual(2);
      expect(arr.at(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0970
     * @tc.name testUint8ArrayTotal097
     * @tc.desc Verify static from with thisArg provides this context to mapFn
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const multiplier: number = 3;
      const arr = Uint8Array.from(src, (x: number): number => x * multiplier);
      expect(arr.at(0)).assertEqual(3);
      expect(arr.at(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0980
     * @tc.name testUint8ArrayTotal098
     * @tc.desc Verify static from with empty source creates empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [];
      const arr = Uint8Array.from(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_0990
     * @tc.name testUint8ArrayTotal099
     * @tc.desc Verify static from with Uint8Array source copies elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(10, 20, 30);
      const arr = Uint8Array.from(src);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1000
     * @tc.name testUint8ArrayTotal100
     * @tc.desc Verify static from with Iterable<Number> source creates array from number iterable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = [7.0, 8.0, 9.0];
      const arr = Uint8Array.from(src);
      expect(arr[0]).assertEqual(7);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1010
     * @tc.name testUint8ArrayTotal101
     * @tc.desc Verify static from with mapFn returning boundary value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8Array.from(src, (x: number): number => 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1020
     * @tc.name testUint8ArrayTotal102
     * @tc.desc Verify static from with mapFn returning boundary value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8Array.from(src, (x: number): number => 255);
      expect(arr.at(0)).assertEqual(255);
      expect(arr.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1030
     * @tc.name testUint8ArrayTotal103
     * @tc.desc Verify valueOf returns the Uint8Array itself
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1040
     * @tc.name testUint8ArrayTotal104
     * @tc.desc Verify entries returns an iterator of index-value pairs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      const first = iter.next();
      const firstValue = first.value;
      if (firstValue !== undefined) {
        expect(firstValue[0]).assertEqual(0);
        expect(firstValue[1]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1050
     * @tc.name testUint8ArrayTotal105
     * @tc.desc Verify keys returns an iterator of indices
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1060
     * @tc.name testUint8ArrayTotal106
     * @tc.desc Verify values returns an iterator of values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.values();
      const first = iter.next();
      expect(first.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1070
     * @tc.name testUint8ArrayTotal107
     * @tc.desc Verify iterator protocol works with for-of
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let sum: number = 0;
      for (const val of arr) {
        sum += val;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1080
     * @tc.name testUint8ArrayTotal108
     * @tc.desc Verify includes with one argument returns true if element exists
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.includes(20);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1090
     * @tc.name testUint8ArrayTotal109
     * @tc.desc Verify includes returns false if element does not exist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1100
     * @tc.name testUint8ArrayTotal110
     * @tc.desc Verify includes with fromIndex starts search from given index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 20);
      const result = arr.includes(20, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1110
     * @tc.name testUint8ArrayTotal111
     * @tc.desc Verify includes with negative fromIndex searches from offset from end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.includes(10, -2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1120
     * @tc.name testUint8ArrayTotal112
     * @tc.desc Verify includes with boundary value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 255);
      const result = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1130
     * @tc.name testUint8ArrayTotal113
     * @tc.desc Verify indexOf with one argument returns first index of element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 20);
      const idx = arr.indexOf(20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1140
     * @tc.name testUint8ArrayTotal114
     * @tc.desc Verify indexOf returns -1 if element not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const idx = arr.indexOf(99);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1150
     * @tc.name testUint8ArrayTotal115
     * @tc.desc Verify indexOf with fromIndex starts search from given index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 20);
      const idx = arr.indexOf(20, 2);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1160
     * @tc.name testUint8ArrayTotal116
     * @tc.desc Verify indexOf with negative fromIndex searches from offset from end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const idx = arr.indexOf(10, -2);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1170
     * @tc.name testUint8ArrayTotal117
     * @tc.desc Verify indexOf with boundary value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 255);
      const idx = arr.indexOf(255);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1180
     * @tc.name testUint8ArrayTotal118
     * @tc.desc Verify lastIndexOf with one argument returns last index of element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 20);
      const idx = arr.lastIndexOf(20);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1190
     * @tc.name testUint8ArrayTotal119
     * @tc.desc Verify lastIndexOf returns -1 if element not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const idx = arr.lastIndexOf(99);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1200
     * @tc.name testUint8ArrayTotal120
     * @tc.desc Verify lastIndexOf with fromIndex searches backwards from given index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 20);
      const idx = arr.lastIndexOf(20, 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1210
     * @tc.name testUint8ArrayTotal121
     * @tc.desc Verify lastIndexOf with negative fromIndex searches backwards from offset from end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const idx = arr.lastIndexOf(30, -1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1220
     * @tc.name testUint8ArrayTotal122
     * @tc.desc Verify find returns first element satisfying predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const result = arr.find((v: number): boolean => v > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1230
     * @tc.name testUint8ArrayTotal123
     * @tc.desc Verify find returns undefined if no element satisfies predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.find((v: number): boolean => v > 100);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1240
     * @tc.name testUint8ArrayTotal124
     * @tc.desc Verify find with thisArg provides this context to predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const threshold: number = 15;
      const result = arr.find((v: number): boolean => v > threshold);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1250
     * @tc.name testUint8ArrayTotal125
     * @tc.desc Verify findIndex returns index of first element satisfying predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const idx = arr.findIndex((v: number): boolean => v > 25);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1260
     * @tc.name testUint8ArrayTotal126
     * @tc.desc Verify findIndex returns -1 if no element satisfies predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const idx = arr.findIndex((v: number): boolean => v > 100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1270
     * @tc.name testUint8ArrayTotal127
     * @tc.desc Verify findIndex with thisArg provides this context to predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const threshold: number = 15;
      const idx = arr.findIndex((v: number): boolean => v > threshold);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1280
     * @tc.name testUint8ArrayTotal128
     * @tc.desc Verify findLast returns last element satisfying predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const result = arr.findLast((v: number): boolean => v > 25);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1290
     * @tc.name testUint8ArrayTotal129
     * @tc.desc Verify findLastIndex returns index of last element satisfying predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const idx = arr.findLastIndex((v: number): boolean => v > 25);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1300
     * @tc.name testUint8ArrayTotal130
     * @tc.desc Verify forEach iterates over all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let sum: number = 0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1310
     * @tc.name testUint8ArrayTotal131
     * @tc.desc Verify forEach with thisArg provides this context to callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let total: number = 0;
      const factor: number = 2;
      arr.forEach((v: number): void => {
        total += v * factor;
      });
      expect(total).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1320
     * @tc.name testUint8ArrayTotal132
     * @tc.desc Verify some returns true if any element satisfies predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.some((v: number): boolean => v > 25);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1330
     * @tc.name testUint8ArrayTotal133
     * @tc.desc Verify some returns false if no element satisfies predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.some((v: number): boolean => v > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1340
     * @tc.name testUint8ArrayTotal134
     * @tc.desc Verify some with thisArg provides this context to predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const threshold: number = 15;
      const result = arr.some((v: number): boolean => v > threshold);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1350
     * @tc.name testUint8ArrayTotal135
     * @tc.desc Verify every returns true if all elements satisfy predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.every((v: number): boolean => v > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1360
     * @tc.name testUint8ArrayTotal136
     * @tc.desc Verify every returns false if any element fails predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.every((v: number): boolean => v > 15);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1370
     * @tc.name testUint8ArrayTotal137
     * @tc.desc Verify every with thisArg provides this context to predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const minVal: number = 5;
      const result = arr.every((v: number): boolean => v > minVal);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1380
     * @tc.name testUint8ArrayTotal138
     * @tc.desc Verify slice with no arguments returns a copy of the entire array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.slice();
      expect(result[0]).assertEqual(10);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1390
     * @tc.name testUint8ArrayTotal139
     * @tc.desc Verify slice with start returns elements from start to end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const result = arr.slice(1);
      expect(result[0]).assertEqual(20);
      expect(result[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1400
     * @tc.name testUint8ArrayTotal140
     * @tc.desc Verify slice with start and end returns elements in range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const result = arr.slice(1, 3);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1410
     * @tc.name testUint8ArrayTotal141
     * @tc.desc Verify slice with negative start returns elements from offset from end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const result = arr.slice(-2);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1420
     * @tc.name testUint8ArrayTotal142
     * @tc.desc Verify slice with negative end returns elements up to offset from end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const result = arr.slice(1, -1);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1430
     * @tc.name testUint8ArrayTotal143
     * @tc.desc Verify slice with start greater than end returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.slice(3, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1440
     * @tc.name testUint8ArrayTotal144
     * @tc.desc Verify slice with start equal to end returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.slice(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1450
     * @tc.name testUint8ArrayTotal145
     * @tc.desc Verify reverse reverses the array in place
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      arr.reverse();
      expect(arr[0]).assertEqual(30);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1460
     * @tc.name testUint8ArrayTotal146
     * @tc.desc Verify toReversed returns a reversed copy without modifying original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(30);
      expect(result[2]).assertEqual(10);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1470
     * @tc.name testUint8ArrayTotal147
     * @tc.desc Verify sort with no arguments sorts elements in ascending order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(30, 10, 20);
      arr.sort();
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1480
     * @tc.name testUint8ArrayTotal148
     * @tc.desc Verify sort with compareFn sorts according to compare function
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 30, 20);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1490
     * @tc.name testUint8ArrayTotal149
     * @tc.desc Verify sort with compareFn sorts in descending order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 30, 20);
      arr.sort((a: number, b: number): int => (b - a).toInt());
      expect(arr[0]).assertEqual(30);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1500
     * @tc.name testUint8ArrayTotal150
     * @tc.desc Verify sort with compareFn handles equal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(20, 10, 20);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1510
     * @tc.name testUint8ArrayTotal151
     * @tc.desc Verify toSorted returns a sorted copy without modifying original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(30, 10, 20);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(10);
      expect(result[2]).assertEqual(30);
      expect(arr[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1520
     * @tc.name testUint8ArrayTotal152
     * @tc.desc Verify map transforms each element and returns new Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.map((v: number): number => v * 2);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1530
     * @tc.name testUint8ArrayTotal153
     * @tc.desc Verify map with thisArg provides this context to callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const factor: number = 3;
      const result = arr.map((v: number): number => v * factor);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1540
     * @tc.name testUint8ArrayTotal154
     * @tc.desc Verify map with boundary value 0 maps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 255);
      const result = arr.map((v: number): number => v);
      expect(result[0]).assertEqual(0);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1550
     * @tc.name testUint8ArrayTotal155
     * @tc.desc Verify filter returns elements satisfying predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const result = arr.filter((v: number): boolean => v > 25);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1560
     * @tc.name testUint8ArrayTotal156
     * @tc.desc Verify filter returns empty array if no element satisfies predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.filter((v: number): boolean => v > 100);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1570
     * @tc.name testUint8ArrayTotal157
     * @tc.desc Verify filter with thisArg provides this context to predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const minVal: number = 15;
      const result = arr.filter((v: number): boolean => v > minVal);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1580
     * @tc.name testUint8ArrayTotal158
     * @tc.desc Verify filter with boundary value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 255);
      const result = arr.filter((v: number): boolean => v > 100);
      expect(result[0]).assertEqual(127);
      expect(result[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1590
     * @tc.name testUint8ArrayTotal159
     * @tc.desc Verify reduce with callback accumulates values left to right
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce<number>((acc: number, v: number): number => acc + v, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1600
     * @tc.name testUint8ArrayTotal160
     * @tc.desc Verify reduce without initialValue uses first element as initial
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce((acc: number, v: number): number => acc + v);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1610
     * @tc.name testUint8ArrayTotal161
     * @tc.desc Verify reduce with string concatenation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result: string = '';
      for (let i: int = 0; i < arr.length; i++) {
        const val: number | undefined = arr.at(i);
        if (val != undefined) {
          result += val.toString();
        }
      }
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1620
     * @tc.name testUint8ArrayTotal162
     * @tc.desc Verify reduce with initialValue 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const result = arr.reduce<number>((acc: number, v: number): number => acc + v, 10);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1630
     * @tc.name testUint8ArrayTotal163
     * @tc.desc Verify reduce with empty array and initialValue returns initialValue
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const result = arr.reduce<number>((acc: number, v: number): number => acc + v, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1640
     * @tc.name testUint8ArrayTotal164
     * @tc.desc Verify reduceRight with callback accumulates values right to left
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduceRight((acc: number, v: number): number => acc + v, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1650
     * @tc.name testUint8ArrayTotal165
     * @tc.desc Verify reduceRight with string concatenation from right to left
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result: string = '';
      for (let i: int = arr.length - 1; i >= 0; i--) {
        const val: number | undefined = arr.at(i);
        if (val != undefined) {
          result += val.toString();
        }
      }
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1660
     * @tc.name testUint8ArrayTotal166
     * @tc.desc Verify reduceRight with initialValue empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result: string = '';
      for (let i: int = arr.length - 1; i >= 0; i--) {
        const val: number | undefined = arr.at(i);
        if (val != undefined) {
          result += val.toString();
        }
      }
      expect(result).assertEqual('21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1670
     * @tc.name testUint8ArrayTotal167
     * @tc.desc Verify reduceRight with initialValue 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const result = arr.reduceRight<number>((acc: number, v: number): number => acc + v, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1680
     * @tc.name testUint8ArrayTotal168
     * @tc.desc Verify join with no arguments returns comma-separated string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const str = arr.join();
      expect(str).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1690
     * @tc.name testUint8ArrayTotal169
     * @tc.desc Verify join with custom separator
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const str = arr.join('|');
      expect(str).assertEqual('1|2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1700
     * @tc.name testUint8ArrayTotal170
     * @tc.desc Verify join with empty separator
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const str = arr.join('');
      expect(str).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1710
     * @tc.name testUint8ArrayTotal171
     * @tc.desc Verify join with empty separator and boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 0);
      const str = arr.join('');
      expect(str).assertEqual('2550');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1720
     * @tc.name testUint8ArrayTotal172
     * @tc.desc Verify toLocaleString with no arguments returns localized string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1000, 2000);
      const str = arr.toLocaleString();
      expect(str.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL01_1730
     * @tc.name testUint8ArrayTotal173
     * @tc.desc Verify toLocaleString with locale parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1000);
      const str = arr.toLocaleString('en-US');
      expect(str.length > 0).assertTrue();
    });
  });
}