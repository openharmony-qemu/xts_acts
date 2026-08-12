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

export default function int32ArrayCopyWithinPart02TestMindmapTestTest(): void {
  describe('Int32ArrayCopyWithinPart02TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0010
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest001
     * @tc.desc Verify copyWithin return value is Int32Array instance with 2 args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Object = arr.copyWithin(0, 1);
      expect(r instanceof Int32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0020
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest002
     * @tc.desc Verify copyWithin return value is Int32Array instance with 3 args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Object = arr.copyWithin(2, 0, 2);
      expect(r instanceof Int32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0030
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest003
     * @tc.desc Verify copyWithin self-copy (0,0) returns same array reference (no-op)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.copyWithin(0, 0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0040
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest004
     * @tc.desc Verify copyWithin return value is not Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Object = arr.copyWithin(1, 0);
      expect(r instanceof Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0050
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest005
     * @tc.desc Verify empty Int32Array copyWithin still returns Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Object = arr.copyWithin(0, 0);
      expect(r instanceof Int32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0060
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest006
     * @tc.desc Verify negative index copyWithin still returns Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Object = arr.copyWithin(-2, 0);
      expect(r instanceof Int32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0070
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest007
     * @tc.desc Verify single element array copyWithin returns Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Object = arr.copyWithin(0, 0);
      expect(r instanceof Int32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0080
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest008
     * @tc.desc Verify copyWithin on non-zero byteOffset view returns Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let view: Int32Array = new Int32Array(buf, 8, 4);
      view.$_set(0, 11);
      view.$_set(1, 22);
      view.$_set(2, 33);
      view.$_set(3, 44);
      let r: Object = view.copyWithin(2, 0);
      expect(r instanceof Int32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0090
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest009
     * @tc.desc Verify ArrayBuffer.isView returns true for copyWithin returned object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.copyWithin(0, 1);
      expect(ArrayBuffer.isView(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest010
     * @tc.desc Verify copyWithin returned object BYTES_PER_ELEMENT is still 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.copyWithin(0, 1);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0110
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest011
     * @tc.desc Verify 2-arg copyWithin returns same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.copyWithin(0, 1);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0120
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest012
     * @tc.desc Verify 3-arg copyWithin returns same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.copyWithin(2, 0, 3);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0130
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest013
     * @tc.desc Verify omitting end copies to end and returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      let r: Int32Array = arr.copyWithin(1, 2);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0140
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest014
     * @tc.desc Verify empty array copyWithin returns same empty array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.copyWithin(0, 0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0150
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest015
     * @tc.desc Verify negative target call returns same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let r: Int32Array = arr.copyWithin(-3, 0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0160
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest016
     * @tc.desc Verify no-op when start greater than or equal to end returns same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.copyWithin(0, 3, 2);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0170
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest017
     * @tc.desc Verify out-of-bounds target clamp still returns same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.copyWithin(99, 0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0180
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest018
     * @tc.desc Verify subarray copyWithin returns same subarray reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(1, 4);
      let r: Int32Array = sub.copyWithin(1, 0, 3);
      expect(r).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0190
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest019
     * @tc.desc Verify forward copy does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let before: int = arr.length;
      arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(before);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest020
     * @tc.desc Verify backward overlapping copy does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0210
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest021
     * @tc.desc Verify target out of bounds clamp leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(-100, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0220
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest022
     * @tc.desc Verify copyWithin does not change byteLength with default offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let beforeBl: int = arr.byteLength;
      arr.copyWithin(1, 3);
      expect(arr.byteLength).assertEqual(beforeBl);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0230
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest023
     * @tc.desc Verify copyWithin does not change byteOffset with default offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 0, 6);
      let beforeOff: int = arr.byteOffset;
      arr.copyWithin(2, 0, 3);
      expect(arr.byteOffset).assertEqual(beforeOff);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0240
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest024
     * @tc.desc Verify copyWithin on non-zero byteOffset view leaves byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 8, 4);
      let beforeOff: int = arr.byteOffset;
      arr.copyWithin(0, 1);
      expect(arr.byteOffset).assertEqual(beforeOff);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0250
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest025
     * @tc.desc Verify byteOffset 4 view after copyWithin still has byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 4, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      view.copyWithin(2, 0, 2);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(16);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0260
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest026
     * @tc.desc Verify zero-length subarray copyWithin leaves byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray(3, 3);
      sub.copyWithin(0, 0);
      expect(sub.length).assertEqual(0);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0270
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest027
     * @tc.desc Verify single element array after copyWithin has length 1 byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0280
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest028
     * @tc.desc Verify empty array after copyWithin has length 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0290
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest029
     * @tc.desc Verify returned value length equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.copyWithin(0, 2);
      expect(r.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest030
     * @tc.desc Verify returned value byteLength equals original array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.copyWithin(1, 0);
      expect(r.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0310
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest031
     * @tc.desc Verify returned value byteOffset equals original view byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let view: Int32Array = new Int32Array(buf, 12, 3);
      let r: Int32Array = view.copyWithin(1, 0);
      expect(r.byteOffset).assertEqual(view.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0320
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest032
     * @tc.desc Verify buffer property is still same ArrayBuffer instance after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let buf: ArrayBuffer = arr.buffer;
      arr.copyWithin(0, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0330
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest033
     * @tc.desc Verify buffer.byteLength unchanged after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let bufSize: int = arr.buffer.byteLength;
      arr.copyWithin(0, 2);
      expect(arr.buffer.byteLength).assertEqual(bufSize);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0340
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest034
     * @tc.desc Verify copyWithin chainable with reverse producing combined semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 2).reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0350
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest035
     * @tc.desc Verify copyWithin chainable with fill covering specified region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(2, 0, 2).fill(0, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0360
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest036
     * @tc.desc Verify copyWithin chainable with sort acting on same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 2);
      arr.copyWithin(0, 2).sort();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0370
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest037
     * @tc.desc Verify two consecutive copyWithin chain calls produce correct sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      arr.copyWithin(2, 0, 2).copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0380
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest038
     * @tc.desc Verify copyWithin chainable with set for single element write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let src: Int32Array = Int32Array.of(99);
      arr.copyWithin(0, 2, 3).set(src, 4);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0390
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest039
     * @tc.desc Verify copyWithin chain tail subarray returns view sharing original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.copyWithin(0, 2).subarray(0, 2);
      expect(sub.$_get(0)).assertEqual(3);
      expect(sub.$_get(1)).assertEqual(4);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest040
     * @tc.desc Verify copyWithin chainable with forEach observing modified values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let seen: Array<number> = new Array<number>();
      arr.copyWithin(1, 0, 2).forEach((v: number): void => { seen.push(v); });
      expect(seen.length).assertEqual(5);
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(1);
      expect(seen[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0410
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest041
     * @tc.desc Verify chained $_set modifies values reflecting back to original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.copyWithin(0, 2);
      r.$_set(0, 77);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0420
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest042
     * @tc.desc Verify copyWithin chain join string reflects copied content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let s: string = arr.copyWithin(0, 2).join(',');
      expect(s).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0430
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest043
     * @tc.desc Verify copyWithin chain at reads copied position value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let v: Number | undefined = arr.copyWithin(1, 3, 5).at(1);
      expect(v as Number).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0440
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest044
     * @tc.desc Verify copyWithin modifications visible to other Int32Array views on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      a.$_set(3, 44);
      a.copyWithin(2, 0, 2);
      expect(b.$_get(2)).assertEqual(11);
      expect(b.$_get(3)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0450
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest045
     * @tc.desc Verify copyWithin does not create new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.copyWithin(1, 0);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0460
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest046
     * @tc.desc Verify non-zero offset child view copyWithin changes reflect in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 8, 4);
      child.$_set(0, 100);
      child.$_set(1, 200);
      child.$_set(2, 300);
      child.$_set(3, 400);
      child.copyWithin(0, 2);
      expect(parent.$_get(2)).assertEqual(300);
      expect(parent.$_get(3)).assertEqual(400);
      expect(parent.$_get(4)).assertEqual(300);
      expect(parent.$_get(5)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0470
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest047
     * @tc.desc Verify subarray derived view copyWithin changes reflect in original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      let sub: Int32Array = arr.subarray(1, 5);
      sub.copyWithin(0, 2);
      expect(arr.$_get(1)).assertEqual(40);
      expect(arr.$_get(2)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(40);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0480
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest048
     * @tc.desc Verify offset 4 compact view copyWithin does not affect parent slot 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 999);
      let child: Int32Array = new Int32Array(buf, 4, 2);
      child.$_set(0, 11);
      child.$_set(1, 22);
      child.copyWithin(1, 0, 1);
      expect(parent.$_get(0)).assertEqual(999);
      expect(parent.$_get(1)).assertEqual(11);
      expect(parent.$_get(2)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0490
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest049
     * @tc.desc Verify zero-length subarray copyWithin does not throw or affect data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(4, 4);
      sub.copyWithin(0, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest050
     * @tc.desc Verify two overlapping subarray views sync updated after parent copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      arr.subarray(0, 4);
      let s2: Int32Array = arr.subarray(2, 6);
      arr.copyWithin(2, 0, 2);
      expect(s2.$_get(0)).assertEqual(1);
      expect(s2.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0510
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest051
     * @tc.desc Verify offset child view reads copied data after parent copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 8, 3);
      for (let i: int = 0; i < 5; i++) {
      parent.$_set(i, (i + 1) * 10);
      }
      parent.copyWithin(2, 0, 2);
      expect(child.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0520
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest052
     * @tc.desc Verify copyWithin(2,0) copies first two elements to positions 2 and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(2, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0530
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest053
     * @tc.desc Verify copyWithin(0,length-1) copies last element to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      arr.copyWithin(0, 4);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0540
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest054
     * @tc.desc Verify single element array copyWithin(0,0,1) preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      arr.copyWithin(0, 0, 1);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0550
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest055
     * @tc.desc Verify copyWithin(length-1,0,1) copies first element to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9, 10);
      arr.copyWithin(3, 0, 1);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0560
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest056
     * @tc.desc Verify end equals start empty interval no-op leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0570
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest057
     * @tc.desc Verify end less than start reverse interval no-op leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      arr.copyWithin(0, 2, 0);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0580
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest058
     * @tc.desc Verify backward overlap copyWithin uses memmove semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(1, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0590
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest059
     * @tc.desc Verify forward overlap copyWithin uses memmove semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest060
     * @tc.desc Verify all-same elements array copyWithin leaves all elements equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
      arr.copyWithin(1, 0);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0610
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest061
     * @tc.desc Verify copyWithin(0,0) self-copy preserves original content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0620
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest062
     * @tc.desc Verify INT_MAX value preserved after copyWithin transport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 2147483647);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      arr.$_set(3, 0);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(2147483647);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0630
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest063
     * @tc.desc Verify INT_MIN value preserved after copyWithin transport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, -2147483648);
      arr.$_set(1, 1);
      arr.$_set(2, 1);
      arr.$_set(3, 1);
      arr.copyWithin(3, 0, 1);
      expect(arr.$_get(3)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0640
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest064
     * @tc.desc Verify -1 value preserved as -1 after copyWithin transport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 0, 0);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0650
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest065
     * @tc.desc Verify zero value propagates correctly via copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2, 3);
      arr.copyWithin(1, 0, 1);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0660
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest066
     * @tc.desc Verify overflow -2147483649 ToInt32 wraps to 2147483647 after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, -2147483649);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      arr.copyWithin(1, 0, 1);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0670
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest067
     * @tc.desc Verify fractional 3 ToInt32 truncates to 3 after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 3);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0680
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest068
     * @tc.desc Verify negative fractional -3 ToInt32 truncates to -3 after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, -3);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      arr.copyWithin(1, 0, 1);
      expect(arr.$_get(1)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0690
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest069
     * @tc.desc Verify 4294967295 ToInt32 wraps to -1 after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 4294967295);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest070
     * @tc.desc Verify 4294967296 ToInt32 wraps to 0 after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 4294967296);
      arr.$_set(1, 1);
      arr.$_set(2, 1);
      arr.copyWithin(1, 0, 1);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0710
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest071
     * @tc.desc Verify overlapping transport of INT_MAX and INT_MIN combination preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 2147483647);
      arr.$_set(1, -2147483648);
      arr.$_set(2, 0);
      arr.$_set(3, 0);
      arr.copyWithin(2, 0, 2);
      expect(arr.$_get(2)).assertEqual(2147483647);
      expect(arr.$_get(3)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0720
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest072
     * @tc.desc Verify from(0) ToInt32 is 0 preserved after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(2);
      src.$_set(0, 0);
      src.$_set(1, 7);
      src.copyWithin(1, 0);
      expect(src.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0730
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest073
     * @tc.desc Verify from(-0) ToInt32 is 0 preserved after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(2);
      src.$_set(0, -0);
      src.$_set(1, 5);
      src.copyWithin(1, 0);
      expect(src.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0740
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest074
     * @tc.desc Verify from(2147483647.9) truncates to INT_MAX preserved after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.from([2147483647.9]);
      expect(src.$_get(0)).assertEqual(2147483647);
      src.copyWithin(0, 0);
      expect(src.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0750
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest075
     * @tc.desc Verify from(2147483648.0) wraps to INT_MIN preserved after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.from([2147483648.0]);
      expect(src.$_get(0)).assertEqual(-2147483648);
      src.copyWithin(0, 0);
      expect(src.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0760
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest076
     * @tc.desc Verify from(NaN) ToInt32 is 0 preserved in batch via copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.from([Double.NaN, Double.NaN, Double.NaN, Double.NaN]);
      src.copyWithin(2, 0, 2);
      expect(src.$_get(2)).assertEqual(0);
      expect(src.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0770
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest077
     * @tc.desc Verify -0 and +0 both treated as 0 after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -0);
      arr.copyWithin(0, 1);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0780
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest078
     * @tc.desc Verify target beyond length fully out-of-bounds copyWithin leaves elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(10, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0790
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest079
     * @tc.desc Verify start beyond length empty source range leaves elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 10);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest080
     * @tc.desc Verify end equals 0 explicit empty range copyWithin leaves elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.copyWithin(0, 0, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0810
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest081
     * @tc.desc Verify start equals end after clamp empty range copyWithin leaves elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.copyWithin(0, 5, 10);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0820
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest082
     * @tc.desc Verify length 2 array copyWithin(0,1,2) copies one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(8, 9);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0830
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest083
     * @tc.desc Verify target=-1 normalizes to length-1 copying to end and returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.copyWithin(-1, 0, 1);
      expect(r).assertEqual(arr);
      expect(arr.$_get(3)).assertEqual(1);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0840
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest084
     * @tc.desc Verify start=-2 copies from second-to-last element onward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, -2);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0850
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest085
     * @tc.desc Verify end=-1 means up to but not including last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, -1);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0860
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest086
     * @tc.desc Verify end=-length normalizes to 0 empty source range no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 0, -4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0870
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest087
     * @tc.desc Verify all three indices negative normalized correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      arr.copyWithin(-3, -5, -2);
      expect(arr.$_get(3)).assertEqual(20);
      expect(arr.$_get(4)).assertEqual(30);
      expect(arr.$_get(5)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0880
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest088
     * @tc.desc Verify very large end clamps to length equivalent to omitting end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let a2: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      a1.copyWithin(1, 0);
      a2.copyWithin(1, 0, 9999);
      expect(a1.$_get(1)).assertEqual(a2.$_get(1));
      expect(a1.$_get(4)).assertEqual(a2.$_get(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0890
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest089
     * @tc.desc Verify negative start beyond length clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(2, -100, 2);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest090
     * @tc.desc Verify large negative end less than -length clamps to 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 0, -100);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0910
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest091
     * @tc.desc Verify out-of-bounds parameters only silently clamp without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let threw: boolean = false;
      try {
      arr.copyWithin(100, -100, 100);
      } catch (e) {
      threw = true;
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0920
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest092
     * @tc.desc Verify empty array copyWithin with extreme indices does not throw and length stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let threw: boolean = false;
      try {
      arr.copyWithin(-999, 999, -999);
      } catch (e) {
      threw = true;
      }
      expect(threw).assertFalse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0930
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest093
     * @tc.desc Verify single element array multiple extreme index combinations do not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let threw: boolean = false;
      try {
      arr.copyWithin(0, 0);
      arr.copyWithin(-1, -1);
      arr.copyWithin(1, 1);
      } catch (e) {
      threw = true;
      }
      expect(threw).assertFalse();
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0940
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest094
     * @tc.desc Verify toString reflects new order after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 2);
      expect(arr.toString()).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0950
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest095
     * @tc.desc Verify toString stays unchanged on copyWithin no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let before: string = arr.toString();
      arr.copyWithin(0, 3);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0960
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest096
     * @tc.desc Verify $_get iteration yields new order after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(1, 0, 2);
      let collected: Array<number> = new Array<number>();
      for (let i: int = 0; i < arr.length; i++) {
      collected.push(arr.$_get(i));
      }
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(1);
      expect(collected[2]).assertEqual(2);
      expect(collected[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0970
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest097
     * @tc.desc Verify length 64 array copyWithin returns this and length stays 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(64);
      for (let i: int = 0; i < 64; i++) {
      arr.$_set(i, i);
      }
      let r: Int32Array = arr.copyWithin(16, 0, 16);
      expect(r).assertEqual(arr);
      expect(arr.length).assertEqual(64);
      expect(arr.byteLength).assertEqual(256);
      expect(arr.$_get(16)).assertEqual(0);
      expect(arr.$_get(31)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0980
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest098
     * @tc.desc Verify length 64 array tail copied to front values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(64);
      for (let i: int = 0; i < 64; i++) {
      arr.$_set(i, i);
      }
      arr.copyWithin(0, 48, 64);
      expect(arr.$_get(0)).assertEqual(48);
      expect(arr.$_get(15)).assertEqual(63);
      expect(arr.$_get(16)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_0990
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest099
     * @tc.desc Verify minimal 4-byte single element buffer copyWithin(0,0) does not overrun
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 77);
      view.copyWithin(0, 0);
      expect(view.$_get(0)).assertEqual(77);
      expect(view.length).assertEqual(1);
      expect(view.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayCopyWithinPart02TestMindmapTest100
     * @tc.desc Verify length 512 array copyWithin preserves length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayCopyWithinPart02TestMindmapTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(512);
      for (let i: int = 0; i < 512; i++) {
      arr.$_set(i, i + 1);
      }
      arr.copyWithin(256, 0, 256);
      expect(arr.length).assertEqual(512);
      expect(arr.byteLength).assertEqual(2048);
      expect(arr.$_get(256)).assertEqual(1);
      expect(arr.$_get(511)).assertEqual(256);
    });
  });
}
