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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysOverallTest02(): void {
  describe('TypedUArraysOverallTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0100
     * @tc.name testTypedUArraysOverall0102_001
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const parent = new Uint8Array(buf)
      const child = parent.subarray(2, 6)
      expect(child.buffer).assertEqual(parent.buffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0200
     * @tc.name testTypedUArraysOverall0102_002
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const parent = new Uint8Array(buf)
      const child = parent.subarray(2, 6)
      expect(child.buffer).assertEqual(buf)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0300
     * @tc.name testTypedUArraysOverall0102_003
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const v1 = new Uint8Array(buf, 0, 4)
      const v2 = new Uint8Array(buf, 4, 4)
      expect(v1.buffer).assertEqual(v2.buffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0400
     * @tc.name testTypedUArraysOverall0102_004
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8)
      const sub = arr.subarray(2, 6)
      expect(sub.buffer).assertEqual(arr.buffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0500
     * @tc.name testTypedUArraysOverall0102_005
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8)
      const sl = arr.slice(2, 6)
      expect(sl.buffer === arr.buffer).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0600
     * @tc.name testTypedUArraysOverall0102_006
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const arr = new Uint8Array(buf)
      expect(arr.buffer).assertEqual(buf)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0700
     * @tc.name testTypedUArraysOverall0102_007
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16)
      const arr = new Uint8Array(buf, 4)
      expect(arr.byteOffset).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0800
     * @tc.name testTypedUArraysOverall0102_008
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const arr = new Uint8Array(buf)
      expect(arr.byteLength).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_0900
     * @tc.name testTypedUArraysOverall0102_009
     * @tc.desc Verify isView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8)
      expect(arr.byteLength).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1000
     * @tc.name testTypedUArraysOverall0102_010
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const v1 = new Uint8Array(buf)
      const v2 = new Uint8Array(buf)
      expect(v1.buffer).assertEqual(v2.buffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1100
     * @tc.name testTypedUArraysOverall0102_011
     * @tc.desc Verify offset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16)
      const v1 = new Uint8Array(buf, 0)
      const v2 = new Uint8Array(buf, 8)
      expect(v1.buffer).assertEqual(v2.buffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1200
     * @tc.name testTypedUArraysOverall0102_012
     * @tc.desc Verify buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const v1 = new Uint8Array(buf)
      const v2 = new Uint16Array(buf)
      expect(v1.buffer).assertEqual(v2.buffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1300
     * @tc.name testTypedUArraysOverall0102_013
     * @tc.desc Verify buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const v1 = new Uint8Array(buf)
      const v2 = new BigUint64Array(buf)
      expect(v1.buffer).assertEqual(v2.buffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1400
     * @tc.name testTypedUArraysOverall0102_014
     * @tc.desc Verify buffer subarray subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(16)
      const sub1 = arr.subarray(2, 10)
      const sub2 = sub1.subarray(2, 6)
      expect(sub2.buffer).assertEqual(arr.buffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1500
     * @tc.name testTypedUArraysOverall0102_015
     * @tc.desc Verify BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1600
     * @tc.name testTypedUArraysOverall0102_016
     * @tc.desc Verify BYTES_PER_ELEMENT Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1700
     * @tc.name testTypedUArraysOverall0102_017
     * @tc.desc Verify BYTES_PER_ELEMENT Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1800
     * @tc.name testTypedUArraysOverall0102_018
     * @tc.desc Verify BYTES_PER_ELEMENT BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_1900
     * @tc.name testTypedUArraysOverall0102_019
     * @tc.desc Verify BYTES_PER_ELEMENT Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_2000
     * @tc.name testTypedUArraysOverall0102_020
     * @tc.desc Verify name Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_2100
     * @tc.name testTypedUArraysOverall0102_021
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10)
      expect(arr.length).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_2200
     * @tc.name testTypedUArraysOverall0102_022
     * @tc.desc Verify of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of()
      expect(arr.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_2300
     * @tc.name testTypedUArraysOverall0102_023
     * @tc.desc Verify of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42)
      expect(arr.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_2400
     * @tc.name testTypedUArraysOverall0102_024
     * @tc.desc Verify of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3)
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_2500
     * @tc.name testTypedUArraysOverall0102_025
     * @tc.desc Verify from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3])
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_2600
     * @tc.name testTypedUArraysOverall0102_026
     * @tc.desc Verify from typedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([4, 5, 6])
      const arr = Uint8Array.from(src)
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0102_2700
     * @tc.name testTypedUArraysOverall0102_027
     * @tc.desc Verify from iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0102_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iterable = [7, 8];
      const arr = Uint8Array.from(iterable)
      expect(arr.length).assertEqual(2)
    });

  });
}
