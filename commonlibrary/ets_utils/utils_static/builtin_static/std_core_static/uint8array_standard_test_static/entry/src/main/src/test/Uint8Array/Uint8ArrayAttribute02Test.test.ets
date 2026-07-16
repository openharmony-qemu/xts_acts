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

export default function Uint8ArrayAttribute02Test(): void {
  describe('Uint8ArrayAttribute02Test', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0010
     * @tc.name testUint8ArrayAttribute001
     * @tc.desc Verify BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0020
     * @tc.name testUint8ArrayAttribute002
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 with ArrayBuffer constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0030
     * @tc.name testUint8ArrayAttribute003
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 with ArrayBuffer+offset constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0040
     * @tc.name testUint8ArrayAttribute004
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 with array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0050
     * @tc.name testUint8ArrayAttribute005
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 with typed array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(5);
      const arr = new Uint8Array(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0060
     * @tc.name testUint8ArrayAttribute006
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 with Uint8Array.of constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0070
     * @tc.name testUint8ArrayAttribute007
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 with Uint8Array.from constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3]);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0080
     * @tc.name testUint8ArrayAttribute008
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 after subarray derivation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      const sub = arr.subarray(2, 5);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0090
     * @tc.name testUint8ArrayAttribute009
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 on map result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const mapped = arr.map((x) => x * 2);
      expect(mapped.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0100
     * @tc.name testUint8ArrayAttribute010
     * @tc.desc Verify BYTES_PER_ELEMENT is 1 on filter result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const filtered = arr.filter((x) => x > 2);
      expect(filtered.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0110
     * @tc.name testUint8ArrayAttribute011
     * @tc.desc Verify BYTES_PER_ELEMENT is always 1 across different constructors
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array(3);
      const arr2 = new Uint8Array(50);
      const arr3 = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(arr1.BYTES_PER_ELEMENT).assertEqual(1);
      expect(arr2.BYTES_PER_ELEMENT).assertEqual(1);
      expect(arr3.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0120
     * @tc.name testUint8ArrayAttribute012
     * @tc.desc Verify buffer is not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(arr.buffer).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0130
     * @tc.name testUint8ArrayAttribute013
     * @tc.desc Verify buffer is an ArrayBuffer instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0140
     * @tc.name testUint8ArrayAttribute014
     * @tc.desc Verify buffer.byteLength equals element count with length constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0150
     * @tc.name testUint8ArrayAttribute015
     * @tc.desc Verify buffer is same reference as input ArrayBuffer with ArrayBuffer constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0160
     * @tc.name testUint8ArrayAttribute016
     * @tc.desc Verify buffer is same reference as input ArrayBuffer with ArrayBuffer+offset constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0170
     * @tc.name testUint8ArrayAttribute017
     * @tc.desc Verify buffer is independent ArrayBuffer with array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0180
     * @tc.name testUint8ArrayAttribute018
     * @tc.desc Verify buffer is not source array's buffer with typed array constructor (deep copy)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(5);
      const arr = new Uint8Array(src);
      expect(arr.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0190
     * @tc.name testUint8ArrayAttribute019
     * @tc.desc Verify buffer is ArrayBuffer with Uint8Array.of constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0200
     * @tc.name testUint8ArrayAttribute020
     * @tc.desc Verify buffer is ArrayBuffer with Uint8Array.from constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3]);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0210
     * @tc.name testUint8ArrayAttribute021
     * @tc.desc Verify subarray shares same buffer reference as source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      const sub = arr.subarray(2, 5);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0220
     * @tc.name testUint8ArrayAttribute022
     * @tc.desc Verify slice has different buffer than source (new ArrayBuffer)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      const sliced = arr.slice(2, 5);
      expect(sliced.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0230
     * @tc.name testUint8ArrayAttribute023
     * @tc.desc Verify empty array buffer.byteLength is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0240
     * @tc.name testUint8ArrayAttribute024
     * @tc.desc Verify two Uint8Array views on same ArrayBuffer share buffer reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr1 = new Uint8Array(buf, 0, 8);
      const arr2 = new Uint8Array(buf, 8, 8);
      expect(arr1.buffer).assertEqual(arr2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0250
     * @tc.name testUint8ArrayAttribute025
     * @tc.desc Verify modification in one view is visible in another view with shared buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr1 = new Uint8Array(buf);
      const arr2 = new Uint8Array(buf);
      arr1.$_set(5, 200);
      expect(arr2.$_get(5)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0260
     * @tc.name testUint8ArrayAttribute026
     * @tc.desc Verify ArrayBuffer.isView returns true for Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0270
     * @tc.name testUint8ArrayAttribute027
     * @tc.desc Verify ArrayBuffer.isView returns false for arr.buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(ArrayBuffer.isView(arr.buffer)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0280
     * @tc.name testUint8ArrayAttribute028
     * @tc.desc Verify byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(arr.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0290
     * @tc.name testUint8ArrayAttribute029
     * @tc.desc Verify byteOffset is 0 with ArrayBuffer constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0300
     * @tc.name testUint8ArrayAttribute030
     * @tc.desc Verify byteOffset is specified offset with ArrayBuffer+offset constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0310
     * @tc.name testUint8ArrayAttribute031
     * @tc.desc Verify byteOffset is 3 with ArrayBuffer+3 byte offset constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 3, 8);
      expect(arr.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0320
     * @tc.name testUint8ArrayAttribute032
     * @tc.desc Verify byteOffset is 0 with array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0330
     * @tc.name testUint8ArrayAttribute033
     * @tc.desc Verify byteOffset is 0 with typed array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(5);
      const arr = new Uint8Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0340
     * @tc.name testUint8ArrayAttribute034
     * @tc.desc Verify byteOffset is 0 with Uint8Array.of
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0350
     * @tc.name testUint8ArrayAttribute035
     * @tc.desc Verify byteOffset is 0 with Uint8Array.from
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0360
     * @tc.name testUint8ArrayAttribute036
     * @tc.desc Verify subarray byteOffset is original byteOffset plus subarray start offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 2, 10);
      const sub = arr.subarray(3, 7);
      expect(sub.byteOffset).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0370
     * @tc.name testUint8ArrayAttribute037
     * @tc.desc Verify slice byteOffset is 0 (new buffer)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 2, 10);
      const sliced = arr.slice(3, 7);
      expect(sliced.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0380
     * @tc.name testUint8ArrayAttribute038
     * @tc.desc Verify byteOffset unchanged after fill operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      const prev = arr.byteOffset;
      arr.fill(128);
      expect(arr.byteOffset).assertEqual(prev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0390
     * @tc.name testUint8ArrayAttribute039
     * @tc.desc Verify byteOffset unchanged after copyWithin operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      const prev = arr.byteOffset;
      arr.copyWithin(0, 2);
      expect(arr.byteOffset).assertEqual(prev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0400
     * @tc.name testUint8ArrayAttribute040
     * @tc.desc Verify byteOffset unchanged after sort operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      arr.$_set(0, 5);
      arr.$_set(1, 3);
      arr.$_set(2, 1);
      const prev = arr.byteOffset;
      arr.sort();
      expect(arr.byteOffset).assertEqual(prev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0410
     * @tc.name testUint8ArrayAttribute041
     * @tc.desc Verify byteOffset + byteLength calculation is correct (offset 4 length 8)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      expect(arr.byteOffset + arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0420
     * @tc.name testUint8ArrayAttribute042
     * @tc.desc Verify byteLength is 8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0430
     * @tc.name testUint8ArrayAttribute043
     * @tc.desc Verify byteLength equals length (BYTES_PER_ELEMENT is 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0440
     * @tc.name testUint8ArrayAttribute044
     * @tc.desc Verify byteLength is N with length constructor N
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(15);
      expect(arr.byteLength).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0450
     * @tc.name testUint8ArrayAttribute045
     * @tc.desc Verify byteLength equals buffer size with full view ArrayBuffer constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Uint8Array(buf);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0460
     * @tc.name testUint8ArrayAttribute046
     * @tc.desc Verify byteLength is specified length with ArrayBuffer+offset+length constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Uint8Array(buf, 4, 10);
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0470
     * @tc.name testUint8ArrayAttribute047
     * @tc.desc Verify byteLength is remaining bytes with ArrayBuffer+offset constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Uint8Array(buf, 4);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0480
     * @tc.name testUint8ArrayAttribute048
     * @tc.desc Verify byteLength equals array element count with array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0490
     * @tc.name testUint8ArrayAttribute049
     * @tc.desc Verify byteLength equals source length with typed array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(7);
      const arr = new Uint8Array(src);
      expect(arr.byteLength).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0500
     * @tc.name testUint8ArrayAttribute050
     * @tc.desc Verify byteLength equals parameter count with Uint8Array.of
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0510
     * @tc.name testUint8ArrayAttribute051
     * @tc.desc Verify byteLength equals source array length with Uint8Array.from
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3]);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0520
     * @tc.name testUint8ArrayAttribute052
     * @tc.desc Verify subarray byteLength is sub-region byte count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const sub = arr.subarray(3, 8);
      expect(sub.byteLength).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0530
     * @tc.name testUint8ArrayAttribute053
     * @tc.desc Verify map result byteLength equals original array byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const mapped = arr.map((x) => x * 2);
      expect(mapped.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0540
     * @tc.name testUint8ArrayAttribute054
     * @tc.desc Verify filter result byteLength is filtered element count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const filtered = arr.filter((x) => x > 2);
      expect(filtered.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0550
     * @tc.name testUint8ArrayAttribute055
     * @tc.desc Verify empty array byteLength is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0560
     * @tc.name testUint8ArrayAttribute056
     * @tc.desc Verify byteLength unchanged after fill operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const prev = arr.byteLength;
      arr.fill(255);
      expect(arr.byteLength).assertEqual(prev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0570
     * @tc.name testUint8ArrayAttribute057
     * @tc.desc Verify byteLength unchanged after copyWithin operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const prev = arr.byteLength;
      arr.copyWithin(0, 3);
      expect(arr.byteLength).assertEqual(prev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0580
     * @tc.name testUint8ArrayAttribute058
     * @tc.desc Verify byteLength unchanged after sort operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1, 4, 2]);
      const prev = arr.byteLength;
      arr.sort();
      expect(arr.byteLength).assertEqual(prev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0590
     * @tc.name testUint8ArrayAttribute059
     * @tc.desc Verify byteLength unchanged after reverse operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const prev = arr.byteLength;
      arr.reverse();
      expect(arr.byteLength).assertEqual(prev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0600
     * @tc.name testUint8ArrayAttribute060
     * @tc.desc Verify byteLength unchanged after set operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const prev = arr.byteLength;
      arr.set([9, 8, 7], 2);
      expect(arr.byteLength).assertEqual(prev);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0610
     * @tc.name testUint8ArrayAttribute061
     * @tc.desc Verify length is N with length constructor N
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(12);
      expect(arr.length).assertEqual(12);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0620
     * @tc.name testUint8ArrayAttribute062
     * @tc.desc Verify length equals array element count with array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3, 4, 5, 6, 7];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0630
     * @tc.name testUint8ArrayAttribute063
     * @tc.desc Verify length equals source length with typed array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(9);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0640
     * @tc.name testUint8ArrayAttribute064
     * @tc.desc Verify length equals parameter count with Uint8Array.of
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0650
     * @tc.name testUint8ArrayAttribute065
     * @tc.desc Verify length equals source length with Uint8Array.from
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3]);
      expect(arr.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0660
     * @tc.name testUint8ArrayAttribute066
     * @tc.desc Verify single element array length is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0670
     * @tc.name testUint8ArrayAttribute067
     * @tc.desc Verify subarray length is sub-region element count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const sub = arr.subarray(3, 8);
      expect(sub.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0680
     * @tc.name testUint8ArrayAttribute068
     * @tc.desc Verify map result length equals original array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const mapped = arr.map((x) => x * 2);
      expect(mapped.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0690
     * @tc.name testUint8ArrayAttribute069
     * @tc.desc Verify filter result length is filtered element count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const filtered = arr.filter((x) => x > 2);
      expect(filtered.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0700
     * @tc.name testUint8ArrayAttribute070
     * @tc.desc Verify length unchanged after fill operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const prev = arr.length;
      arr.fill(255);
      expect(arr.length).assertEqual(prev);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0710
     * @tc.name testUint8ArrayAttribute071
     * @tc.desc Verify length unchanged after sort operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const prev = arr.length;
      arr.sort();
      expect(arr.length).assertEqual(prev);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0720
     * @tc.name testUint8ArrayAttribute072
     * @tc.desc Verify length unchanged after set operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const prev = arr.length;
      arr.set([1, 2, 3], 0);
      expect(arr.length).assertEqual(prev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0730
     * @tc.name testUint8ArrayAttribute073
     * @tc.desc Verify name is 'Uint8Array'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(arr.name).assertEqual('Uint8Array');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0740
     * @tc.name testUint8ArrayAttribute074
     * @tc.desc Verify name is 'Uint8Array' with ArrayBuffer constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0750
     * @tc.name testUint8ArrayAttribute075
     * @tc.desc Verify name is 'Uint8Array' with ArrayBuffer+offset+length constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0760
     * @tc.name testUint8ArrayAttribute076
     * @tc.desc Verify name is 'Uint8Array' with array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0770
     * @tc.name testUint8ArrayAttribute077
     * @tc.desc Verify name is 'Uint8Array' with typed array constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(5);
      const arr = new Uint8Array(src);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0780
     * @tc.name testUint8ArrayAttribute078
     * @tc.desc Verify name is 'Uint8Array' with Uint8Array.of
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0790
     * @tc.name testUint8ArrayAttribute079
     * @tc.desc Verify name is 'Uint8Array' with Uint8Array.from
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3]);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0800
     * @tc.name testUint8ArrayAttribute080
     * @tc.desc Verify name is 'Uint8Array' with subarray
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      const sub = arr.subarray(2, 5);
      expect(sub.name).assertEqual('Uint8Array');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0810
     * @tc.name testUint8ArrayAttribute081
     * @tc.desc Verify name is 'Uint8Array' with map result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const mapped = arr.map((x) => x * 2);
      expect(mapped.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0820
     * @tc.name testUint8ArrayAttribute082
     * @tc.desc Verify name is 'Uint8Array' with filter result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const filtered = arr.filter((x) => x > 2);
      expect(filtered.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0830
     * @tc.name testUint8ArrayAttribute083
     * @tc.desc Verify name is 'Uint8Array' after sort
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0840
     * @tc.name testUint8ArrayAttribute084
     * @tc.desc Verify name is 'Uint8Array' after reverse
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.reverse();
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0850
     * @tc.name testUint8ArrayAttribute085
     * @tc.desc Verify name is 'Uint8Array' after fill
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      arr.fill(128);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0860
     * @tc.name testUint8ArrayAttribute086
     * @tc.desc Verify name is 'Uint8Array' after copyWithin
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      arr.copyWithin(0, 2);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0870
     * @tc.name testUint8ArrayAttribute087
     * @tc.desc Verify BYTES_PER_ELEMENT is always 1 across constructors
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(3);
      const b = new Uint8Array(50);
      const c = new Uint8Array(100);
      expect(a.BYTES_PER_ELEMENT).assertEqual(1);
      expect(b.BYTES_PER_ELEMENT).assertEqual(1);
      expect(c.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0880
     * @tc.name testUint8ArrayAttribute088
     * @tc.desc Verify byteOffset is 0 across constructors
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(5);
      const b = new Uint8Array([1, 2, 3]);
      const c = Uint8Array.of(1, 2, 3, 4, 5);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0890
     * @tc.name testUint8ArrayAttribute089
     * @tc.desc Verify byteLength unchanged after element assignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const bl = arr.byteLength;
      arr[0] = 255;
      arr[9] = 128;
      expect(arr.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0900
     * @tc.name testUint8ArrayAttribute090
     * @tc.desc Verify length unchanged after element assignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const len = arr.length;
      arr[0] = 1;
      arr[9] = 2;
      expect(arr.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0910
     * @tc.name testUint8ArrayAttribute091
     * @tc.desc Verify name is always 'Uint8Array' across different constructors
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(0);
      const b = Uint8Array.of(1);
      const c = new Uint8Array([1, 2, 3]);
      const d = Uint8Array.from([1]);
      expect(a.name).assertEqual('Uint8Array');
      expect(b.name).assertEqual('Uint8Array');
      expect(c.name).assertEqual('Uint8Array');
      expect(d.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0920
     * @tc.name testUint8ArrayAttribute092
     * @tc.desc Verify fill returns this reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const result = arr.fill(0);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0930
     * @tc.name testUint8ArrayAttribute093
     * @tc.desc Verify copyWithin returns this reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.copyWithin(0, 2);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0940
     * @tc.name testUint8ArrayAttribute094
     * @tc.desc Verify sort returns this reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = arr.sort();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0950
     * @tc.name testUint8ArrayAttribute095
     * @tc.desc Verify reverse returns this reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0960
     * @tc.name testUint8ArrayAttribute096
     * @tc.desc Verify BYTES_PER_ELEMENT * length equals byteLength with length constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(25);
      expect(arr.BYTES_PER_ELEMENT * arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0970
     * @tc.name testUint8ArrayAttribute097
     * @tc.desc Verify BYTES_PER_ELEMENT * length equals byteLength with ArrayBuffer constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(30);
      const arr = new Uint8Array(buf, 0, 30);
      expect(arr.BYTES_PER_ELEMENT * arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0980
     * @tc.name testUint8ArrayAttribute098
     * @tc.desc Verify BYTES_PER_ELEMENT * length equals byteLength with Uint8Array.of
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5, 6, 7);
      expect(arr.BYTES_PER_ELEMENT * arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_0990
     * @tc.name testUint8ArrayAttribute099
     * @tc.desc Verify BYTES_PER_ELEMENT * length equals byteLength with Uint8Array.from
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([10, 20, 30, 40]);
      expect(arr.BYTES_PER_ELEMENT * arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_1000
     * @tc.name testUint8ArrayAttribute100
     * @tc.desc Verify BYTES_PER_ELEMENT * length equals byteLength with subarray derivation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const sub = arr.subarray(3, 8);
      expect(sub.BYTES_PER_ELEMENT * sub.length).assertEqual(sub.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_1010
     * @tc.name testUint8ArrayAttribute101
     * @tc.desc Verify byteOffset + byteLength equals buffer.byteLength (full view)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.byteOffset + arr.byteLength).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_1020
     * @tc.name testUint8ArrayAttribute102
     * @tc.desc Verify buffer.byteLength >= byteLength (partial view)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      expect(buf.byteLength >= arr.byteLength).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ATTRIBUTE02_1030
     * @tc.name testUint8ArrayAttribute103
     * @tc.desc Verify subarray length equals its byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayAttribute103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const sub = arr.subarray(3, 8);
      expect(sub.length).assertEqual(sub.byteLength);
    });

  });
}