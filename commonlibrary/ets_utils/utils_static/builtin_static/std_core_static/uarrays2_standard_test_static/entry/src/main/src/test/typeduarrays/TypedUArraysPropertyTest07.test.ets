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

export default function typedUArraysPropertyTest07(): void {
  describe('TypedUArraysPropertyTest07', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0100
     * @tc.name testTypedUArraysPropertyTestMindMapMerged001
     * @tc.desc Verify Uint16Array.BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0200
     * @tc.name testTypedUArraysPropertyTestMindMapMerged002
     * @tc.desc Verify Uint32Array.BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0300
     * @tc.name testTypedUArraysPropertyTestMindMapMerged003
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      expect(Boolean(arr.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0400
     * @tc.name testTypedUArraysPropertyTestMindMapMerged004
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array(4);
      const u16 = new Uint16Array(4);
      const u32 = new Uint32Array(4);
      const big = new BigUint64Array(4);
      expect(Boolean(u8.buffer)).assertTrue();
      expect(Boolean(u16.buffer)).assertTrue();
      expect(Boolean(u32.buffer)).assertTrue();
      expect(Boolean(big.buffer)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0500
     * @tc.name testTypedUArraysPropertyTestMindMapMerged005
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array(4).byteOffset).assertEqual(0);
      expect(new Uint16Array(4).byteOffset).assertEqual(0);
      expect(new Uint32Array(4).byteOffset).assertEqual(0);
      expect(new BigUint64Array(4).byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0600
     * @tc.name testTypedUArraysPropertyTestMindMapMerged006
     * @tc.desc Verify offset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint8Array(buf, 4, 8);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0700
     * @tc.name testTypedUArraysPropertyTestMindMapMerged007
     * @tc.desc Verify offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const u16 = new Uint16Array(buf, 4, 4);
      const u32 = new Uint32Array(buf, 8, 2);
      const big = new BigUint64Array(buf, 16, 1);
      expect(u16.byteOffset).assertEqual(4);
      expect(u32.byteOffset).assertEqual(8);
      expect(big.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0800
     * @tc.name testTypedUArraysPropertyTestMindMapMerged008
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const sub = arr.subarray(2);
      expect(sub.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_0900
     * @tc.name testTypedUArraysPropertyTestMindMapMerged009
     * @tc.desc Verify byteLength = length BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array(10).byteLength).assertEqual(10);
      expect(new Uint16Array(10).byteLength).assertEqual(20);
      expect(new Uint32Array(10).byteLength).assertEqual(40);
      expect(new BigUint64Array(10).byteLength).assertEqual(80);
      expect(new Uint8ClampedArray(10).byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1000
     * @tc.name testTypedUArraysPropertyTestMindMapMerged010
     * @tc.desc Verify byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array(0).byteLength).assertEqual(0);
      expect(new Uint16Array(0).byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1100
     * @tc.name testTypedUArraysPropertyTestMindMapMerged011
     * @tc.desc Verify offset byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint8Array(buf, 4, 8);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1200
     * @tc.name testTypedUArraysPropertyTestMindMapMerged012
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array(5).length).assertEqual(5);
      expect(new Uint16Array(5).length).assertEqual(5);
      expect(new Uint32Array(5).length).assertEqual(5);
      expect(new BigUint64Array(5).length).assertEqual(5);
      expect(new Uint8ClampedArray(5).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1300
     * @tc.name testTypedUArraysPropertyTestMindMapMerged013
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array([1, 2, 3]).length).assertEqual(3);
      expect(new Uint16Array([1, 2, 3, 4]).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1400
     * @tc.name testTypedUArraysPropertyTestMindMapMerged014
     * @tc.desc Verify ArrayBuffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      expect(new Uint8Array(buf).length).assertEqual(16);
      expect(new Uint16Array(buf).length).assertEqual(8);
      expect(new Uint32Array(buf).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1500
     * @tc.name testTypedUArraysPropertyTestMindMapMerged015
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array(0).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1600
     * @tc.name testTypedUArraysPropertyTestMindMapMerged016
     * @tc.desc Verify name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array(1).length).assertEqual(1);
      expect(new Uint8ClampedArray(1).length).assertEqual(1);
      expect(new Uint16Array(1).length).assertEqual(1);
      expect(new Uint32Array(1).length).assertEqual(1);
      expect(new BigUint64Array(1).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1700
     * @tc.name testTypedUArraysPropertyTestMindMapMerged017
     * @tc.desc Verify name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('Uint8Array').assertEqual('Uint8Array');
      expect('Uint16Array').assertEqual('Uint16Array');
      expect('Uint32Array').assertEqual('Uint32Array');
      expect('BigUint64Array').assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1800
     * @tc.name testTypedUArraysPropertyTestMindMapMerged018
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(Boolean(arr.buffer)).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_1900
     * @tc.name testTypedUArraysPropertyTestMindMapMerged019
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8Array([10, 20, 30, 40]);
      const sub = parent.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.byteLength).assertEqual(2);
      expect(sub.byteOffset).assertEqual(1);
      expect(sub.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_2000
     * @tc.name testTypedUArraysPropertyTestMindMapMerged020
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8Array([10, 20, 30, 40]);
      const sliced = parent.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.byteOffset).assertEqual(0);
      expect(sliced.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_2100
     * @tc.name testTypedUArraysPropertyTestMindMapMerged021
     * @tc.desc Verify ArrayBuffer.isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.isView(new Uint8Array(4))).assertTrue();
      expect(ArrayBuffer.isView(new Uint16Array(4))).assertTrue();
      expect(ArrayBuffer.isView(new Uint32Array(4))).assertTrue();
      expect(ArrayBuffer.isView(new BigUint64Array(4))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PropertyTestMindMapMerged_2200
     * @tc.name testTypedUArraysPropertyTestMindMapMerged022
     * @tc.desc Verify TypedArray Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestMindMapMerged022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Array.isArray(new Uint8Array(4))).assertFalse();
      expect(Array.isArray(new Uint16Array(4))).assertFalse();
      expect(Array.isArray(new Uint32Array(4))).assertFalse();
      expect(Array.isArray(new BigUint64Array(4))).assertFalse();
    });

  });
}
