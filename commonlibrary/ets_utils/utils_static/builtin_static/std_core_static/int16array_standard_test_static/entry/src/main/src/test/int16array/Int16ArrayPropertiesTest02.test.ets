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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayPropertiesTest02(): void {
  describe('Int16ArrayPropertiesTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0100
     * @tc.name testInt16ArrayPropertiesTestTwo001
     * @tc.desc Verify $_get(-length-1) keeps buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const bufBefore: ArrayBuffer = arr.buffer;
      try {
        arr.$_get(-arr.length - 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualBuffer: ArrayBuffer = arr.buffer;
      let expectedBuffer: ArrayBuffer = bufBefore;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0200
     * @tc.name testInt16ArrayPropertiesTestTwo002
     * @tc.desc Verify with(length) RangeError keeps buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const bufBefore: ArrayBuffer = arr.buffer;
      try {
        arr.with(arr.length, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualBuffer: ArrayBuffer = arr.buffer;
      let expectedBuffer: ArrayBuffer = bufBefore;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0300
     * @tc.name testInt16ArrayPropertiesTestTwo003
     * @tc.desc Verify with(length+1) RangeError leaves byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const boBefore: int = arr.byteOffset;
      try {
        arr.with(arr.length + 1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: number = boBefore;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0400
     * @tc.name testInt16ArrayPropertiesTestTwo004
     * @tc.desc Verify with(length+1) RangeError leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const blBefore: int = arr.byteLength;
      try {
        arr.with(arr.length + 1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: number = blBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0500
     * @tc.name testInt16ArrayPropertiesTestTwo005
     * @tc.desc Verify with(-length-1) RangeError leaves name unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const nameBefore: string = arr.name;
      try {
        arr.with(-arr.length - 1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualName: string = arr.name;
      let expectedName: string = nameBefore;
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0600
     * @tc.name testInt16ArrayPropertiesTestTwo006
     * @tc.desc Verify with(huge index) RangeError leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(2);
      const lenBefore: int = arr.length;
      try {
        arr.with(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: number = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0700
     * @tc.name testInt16ArrayPropertiesTestTwo007
     * @tc.desc Verify Int16Array(0) byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0800
     * @tc.name testInt16ArrayPropertiesTestTwo008
     * @tc.desc Verify Int16Array.of() BYTES_PER_ELEMENT is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of();
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 2;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_0900
     * @tc.name testInt16ArrayPropertiesTestTwo009
     * @tc.desc Verify copy-from empty Int16Array length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array();
      const arr = new Int16Array(src);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1000
     * @tc.name testInt16ArrayPropertiesTestTwo010
     * @tc.desc Verify Int16Array(1) byteLength is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(1);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1100
     * @tc.name testInt16ArrayPropertiesTestTwo011
     * @tc.desc Verify Int16Array(buf,0,1) byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0, 1);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1200
     * @tc.name testInt16ArrayPropertiesTestTwo012
     * @tc.desc Verify all-MIN Int16Array.of BYTES_PER_ELEMENT is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(-32768, -32768);
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 2;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1300
     * @tc.name testInt16ArrayPropertiesTestTwo013
     * @tc.desc Verify all-minus-one Int16Array.of byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(-1, -1, -1);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1400
     * @tc.name testInt16ArrayPropertiesTestTwo014
     * @tc.desc Verify all-same Int16Array.of buffer is non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5, 5, 5, 5, 5);
      let bufferValue: int = arr.buffer.byteLength;
      let expectedBuffer: int = arr.byteLength;
      expect(bufferValue).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1500
     * @tc.name testInt16ArrayPropertiesTestTwo015
     * @tc.desc Verify subarray(-1) clamps begin and keeps parent length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Int16Array([1, 2, 3, 4]);
      const child = parent.subarray(-1);
      let actualLength: int = child.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1600
     * @tc.name testInt16ArrayPropertiesTestTwo016
     * @tc.desc Verify subarray(length) returns empty view length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Int16Array([1, 2, 3, 4]);
      const child = parent.subarray(parent.length);
      let actualLength: int = child.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1700
     * @tc.name testInt16ArrayPropertiesTestTwo017
     * @tc.desc Verify subarray(length) returns empty view byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Int16Array([1, 2, 3, 4]);
      const child = parent.subarray(parent.length);
      let actualByteLength: int = child.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1800
     * @tc.name testInt16ArrayPropertiesTestTwo018
     * @tc.desc Verify subarray(0,-1) clamps end and result length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Int16Array([1, 2, 3, 4]);
      const child = parent.subarray(0, -1);
      let actualLength: int = child.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_1900
     * @tc.name testInt16ArrayPropertiesTestTwo019
     * @tc.desc Verify subarray(-3,-1) dual-negative clamp length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Int16Array([1, 2, 3, 4, 5]);
      const child = parent.subarray(-3, -1);
      let actualLength: int = child.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2000
     * @tc.name testInt16ArrayPropertiesTestTwo020
     * @tc.desc Verify subarray(length-1,length+1) returns single-element view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Int16Array([1, 2, 3, 4]);
      const child = parent.subarray(parent.length - 1, parent.length + 1);
      let actualLength: int = child.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2100
     * @tc.name testInt16ArrayPropertiesTestTwo021
     * @tc.desc Verify empty Int16Array byteLength equals length*BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array();
      const expected: int = arr.length * Int16Array.BYTES_PER_ELEMENT;
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: number = expected;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2200
     * @tc.name testInt16ArrayPropertiesTestTwo022
     * @tc.desc Verify all-same array byteLength equals length*BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(7, 7, 7, 7, 7);
      const expected: int = arr.length * Int16Array.BYTES_PER_ELEMENT;
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: number = expected;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2300
     * @tc.name testInt16ArrayPropertiesTestTwo023
     * @tc.desc Verify empty offset view satisfies byteOffset+byteLength<=buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2, 0);
      let actualByteLength: boolean = arr.byteOffset + arr.byteLength <= arr.buffer.byteLength;
      expect(actualByteLength).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2400
     * @tc.name testInt16ArrayPropertiesTestTwo024
     * @tc.desc Verify $_set MIN -32768 leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const lenBefore: int = arr.length;
      arr.$_set(1, -32768);
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2500
     * @tc.name testInt16ArrayPropertiesTestTwo025
     * @tc.desc Verify $_set NaN leaves byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const boBefore: int = arr.byteOffset;
      arr.$_set(0, Double.NaN);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = boBefore;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2600
     * @tc.name testInt16ArrayPropertiesTestTwo026
     * @tc.desc Verify Int16Array.from([Double.NaN,NaN]) length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [Double.NaN, Double.NaN];
      const arr = Int16Array.from(src);
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2700
     * @tc.name testInt16ArrayPropertiesTestTwo027
     * @tc.desc Verify new Int16Array(MAX_VALUE) throws RangeError for huge length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int16Array(1.7976931348623157e308);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2800
     * @tc.name testInt16ArrayPropertiesTestTwo028
     * @tc.desc Verify buffer new Int16Array ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let a: Int16Array = new Int16Array(buf);
      let b: Int16Array = new Int16Array(buf);
      let actualBuffer: ArrayBuffer = a.buffer;
      let expectedBuffer: ArrayBuffer = b.buffer;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_2900
     * @tc.name testInt16ArrayPropertiesTestTwo029
     * @tc.desc Verify $_set $_get new Int16Array ArrayBuffer; int16 truncation wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let a: Int16Array = new Int16Array(buf);
      let b: Int16Array = new Int16Array(buf);
      let c: Int16Array = new Int16Array(buf);
      a.$_set(0, -32768);
      let elementAt0: number = b.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt02: number = c.$_get(0);
      let expectedElement02: int = -32768;
      expect(elementAt02).assertEqual(expectedElement02);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3000
     * @tc.name testInt16ArrayPropertiesTestTwo030
     * @tc.desc Verify buffer $_get reverse Int16Array.of new Int16Array ArrayBuffer; property unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let a: Int16Array = Int16Array.of(10, 20, 30);
      let b: Int16Array = new Int16Array(a.buffer);
      a.reverse();
      let elementAt0: number = b.$_get(0);
      let expectedElement0: int = 30;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = b.$_get(1);
      let expectedElement1: int = 20;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = b.$_get(2);
      let expectedElement2: int = 10;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3100
     * @tc.name testInt16ArrayPropertiesTestTwo031
     * @tc.desc Verify $_set $_get subarray Int16Array.of; parent set -555 visible in child index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = Int16Array.of(0, 0, 0);
      let child: Int16Array = parent.subarray(0, 2);
      parent.$_set(0, -555);
      let elementAt0: number = child.$_get(0);
      let expectedElement0: int = -555;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3200
     * @tc.name testInt16ArrayPropertiesTestTwo032
     * @tc.desc Verify buffer subarray Int16Array.of; nested two-level subarray shares root buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      let mid: Int16Array = root.subarray(0, 4);
      let leaf: Int16Array = mid.subarray(1, 3);
      let actualBuffer: ArrayBuffer = leaf.buffer;
      let expectedBuffer: ArrayBuffer = root.buffer;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3300
     * @tc.name testInt16ArrayPropertiesTestTwo033
     * @tc.desc Verify $_get fill subarray Int16Array.of; fill child variable range 1-3 sets 99 in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let child: Int16Array = parent.subarray(1, 4);
      child.fill(99);
      let elementAt0: number = parent.$_get(0);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = parent.$_get(1);
      let expectedElement1: int = 99;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = parent.$_get(2);
      let expectedElement2: int = 99;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = parent.$_get(3);
      let expectedElement3: int = 99;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = parent.$_get(4);
      let expectedElement4: int = 5;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3400
     * @tc.name testInt16ArrayPropertiesTestTwo034
     * @tc.desc Verify length $_get fill new Int16Array; fill -32769 wraps to 32767 and length stays 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      arr.fill(-32769);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3500
     * @tc.name testInt16ArrayPropertiesTestTwo035
     * @tc.desc Verify $_get set Int16Array.of new Int16Array; source 32768 wraps to -32768 and 32767 kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0]);
      let src: Int16Array = Int16Array.of(32768, 32767);
      arr.set(src);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3600
     * @tc.name testInt16ArrayPropertiesTestTwo036
     * @tc.desc Verify $_get new Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32768, -32769]);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3700
     * @tc.name testInt16ArrayPropertiesTestTwo037
     * @tc.desc Verify $_get Int16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32768, -32769);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3800
     * @tc.name testInt16ArrayPropertiesTestTwo038
     * @tc.desc Verify $_get Int16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [32768, Double.NaN, Double.POSITIVE_INFINITY];
      let arr: Int16Array = Int16Array.from(source);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_3900
     * @tc.name testInt16ArrayPropertiesTestTwo039
     * @tc.desc Verify length set Int16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let src: Int16Array = Int16Array.of(1, 2);
      arr.set(src);
      let actualLength: int = arr.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4000
     * @tc.name testInt16ArrayPropertiesTestTwo040
     * @tc.desc Verify byteLength copyWithin Int16Array.of; property unchanged after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let blBefore: int = arr.byteLength;
      arr.copyWithin(0, 2);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: number = blBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4100
     * @tc.name testInt16ArrayPropertiesTestTwo041
     * @tc.desc Verify length fill new Int16Array; property unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      arr.fill(0);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4200
     * @tc.name testInt16ArrayPropertiesTestTwo042
     * @tc.desc Verify length reverse new Int16Array; property unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      arr.reverse();
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4300
     * @tc.name testInt16ArrayPropertiesTestTwo043
     * @tc.desc Verify length sort new Int16Array; property unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      arr.sort();
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4400
     * @tc.name testInt16ArrayPropertiesTestTwo044
     * @tc.desc Verify length copyWithin new Int16Array; property unchanged after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      arr.copyWithin(0, 0);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4500
     * @tc.name testInt16ArrayPropertiesTestTwo045
     * @tc.desc Verify fill and reverse preserve byteOffset, byteLength, and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      arr.fill(1).reverse();
      let actualLength: int = arr.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 8;
      expect(actualByteLength).assertEqual(expectedByteLength);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4600
     * @tc.name testInt16ArrayPropertiesTestTwo046
     * @tc.desc Verify fill and sort preserve length and expected element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(5).sort();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 5;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 5;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 5;
      expect(elementAt2).assertEqual(expectedElement2);
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4700
     * @tc.name testInt16ArrayPropertiesTestTwo047
     * @tc.desc Verify set and reverse produce expected values while preserving length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let src: Int16Array = Int16Array.of(1, 2, 3);
      arr.set(src);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 1;
      expect(elementAt2).assertEqual(expectedElement2);
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4800
     * @tc.name testInt16ArrayPropertiesTestTwo048
     * @tc.desc Verify forEach Int16Array.of; negative element -5 detected by callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, -5, 3);
      let hasNegative: boolean = false;
      arr.forEach((value: number, index: int, array: Int16Array): void => {
        if (value < 0) {
          hasNegative = true;
        }
      });
      expect(hasNegative).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_4900
     * @tc.name testInt16ArrayPropertiesTestTwo049
     * @tc.desc Verify $_get map Int16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6);
      let factor: number = 10;
      let result: Int16Array = arr.map((val: number, index: int, array: Int16Array): number => {
        return val * factor;
      });
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 20;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = 40;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = 60;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5000
     * @tc.name testInt16ArrayPropertiesTestTwo050
     * @tc.desc Verify length $_get filter Int16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 15, 8, 20, 3);
      let threshold: number = 10;
      let result: Int16Array = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > threshold;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 15;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = 20;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5100
     * @tc.name testInt16ArrayPropertiesTestTwo051
     * @tc.desc Verify $_get set subarray Int16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let src: Int16Array = Int16Array.of(10, 20, 30, 40);
      arr.set(src);
      let sub: Int16Array = arr.subarray(1, 3);
      let elementAt0: number = sub.$_get(0);
      let expectedElement0: int = 20;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sub.$_get(1);
      let expectedElement1: int = 30;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5200
     * @tc.name testInt16ArrayPropertiesTestTwo052
     * @tc.desc Verify $_set $_get forEach Int16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      arr.forEach((value: number, index: int, array: Int16Array): void => {
        if (index === 0) {
          array.$_set(2, 999);
        }
      });
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 999;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5300
     * @tc.name testInt16ArrayPropertiesTestTwo053
     * @tc.desc Verify $_set $_get forEach new Int16Array ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let a: Int16Array = new Int16Array(buf);
      let b: Int16Array = new Int16Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      let modified: boolean = false;
      a.forEach((value: number, index: int, array: Int16Array): void => {
        if (index === 0) {
          b.$_set(1, 999);
          modified = true;
        }
      });
      expect(modified).assertTrue();
      let elementAt1: number = b.$_get(1);
      let expectedElement1: int = 999;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5400
     * @tc.name testInt16ArrayPropertiesTestTwo054
     * @tc.desc Verify $_get copyWithin Int16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 2);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 4;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 4;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5500
     * @tc.name testInt16ArrayPropertiesTestTwo055
     * @tc.desc Verify name fill reverse sort Int16Array.of; name stays Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(30, 10, 20);
      arr.sort();
      arr.reverse();
      arr.fill(0);
      let actualName: string = arr.name;
      let expectedName: string = 'Int16Array';
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5600
     * @tc.name testInt16ArrayPropertiesTestTwo056
     * @tc.desc Verify name subarray Int16Array.of; name stays Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      let child: Int16Array = root.subarray(1, 5);
      let grandchild: Int16Array = child.subarray(0, 2);
      let actualName: string = root.name;
      let expectedName: string = 'Int16Array';
      expect(actualName).assertEqual(expectedName);
      let actualName2: string = child.name;
      let expectedName2: string = 'Int16Array';
      expect(actualName2).assertEqual(expectedName2);
      let actualName3: string = grandchild.name;
      let expectedName3: string = 'Int16Array';
      expect(actualName3).assertEqual(expectedName3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5700
     * @tc.name testInt16ArrayPropertiesTestTwo057
     * @tc.desc Verify byteLength length name fill set copyWithin; property unchanged after fill; property unchanged after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let src: Int16Array = Int16Array.of(1, 2);
      arr.set(src, 0);
      arr.copyWithin(2, 0, 2);
      arr.fill(99, 4);
      let actualLength: int = arr.length;
      let expectedLength: int = 5;
      expect(actualLength).assertEqual(expectedLength);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 10;
      expect(actualByteLength).assertEqual(expectedByteLength);
      let actualName: string = arr.name;
      let expectedName: string = 'Int16Array';
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5800
     * @tc.name testInt16ArrayPropertiesTestTwo058
     * @tc.desc Verify $_get rejects an object cast to int with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidIndex: int = unsupported as object as int;
        arr.$_get(invalidIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_5900
     * @tc.name testInt16ArrayPropertiesTestTwo059
     * @tc.desc Verify $_set rejects an object cast to int index with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidIndex: int = unsupported as object as int;
        arr.$_set(invalidIndex, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6000
     * @tc.name testInt16ArrayPropertiesTestTwo060
     * @tc.desc Verify $_set rejects an object cast to number value with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidValue: number = unsupported as object as number;
        arr.$_set(0, invalidValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6100
     * @tc.name testInt16ArrayPropertiesTestTwo061
     * @tc.desc Verify at rejects an object cast to int with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidIndex: int = unsupported as object as int;
        arr.at(invalidIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6200
     * @tc.name testInt16ArrayPropertiesTestTwo062
     * @tc.desc Verify copyWithin rejects an object cast to int target with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidTarget: int = unsupported as object as int;
        arr.copyWithin(invalidTarget, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6300
     * @tc.name testInt16ArrayPropertiesTestTwo063
     * @tc.desc Verify fill rejects an object cast to number with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidValue: number = unsupported as object as number;
        arr.fill(invalidValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6400
     * @tc.name testInt16ArrayPropertiesTestTwo064
     * @tc.desc Verify with rejects an object cast to int index with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidIndex: int = unsupported as object as int;
        arr.with(invalidIndex, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6500
     * @tc.name testInt16ArrayPropertiesTestTwo065
     * @tc.desc Verify with rejects an object cast to number value with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidValue: number = unsupported as object as number;
        arr.with(0, invalidValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6600
     * @tc.name testInt16ArrayPropertiesTestTwo066
     * @tc.desc Verify slice rejects an object cast to int with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidBegin: int = unsupported as object as int;
        arr.slice(invalidBegin);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6700
     * @tc.name testInt16ArrayPropertiesTestTwo067
     * @tc.desc Verify subarray rejects an object cast to int begin with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidBegin: int = unsupported as object as int;
        arr.subarray(invalidBegin);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_PROPERTIES_TWO_6800
     * @tc.name testInt16ArrayPropertiesTestTwo068
     * @tc.desc Verify set rejects an object cast to number value with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayPropertiesTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidValue: number = unsupported as object as number;
        arr.set(1, invalidValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
