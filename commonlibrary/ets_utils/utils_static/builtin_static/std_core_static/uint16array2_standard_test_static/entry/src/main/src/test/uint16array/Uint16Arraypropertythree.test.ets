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

export default function uint16ArraypropertythreeTest(): void {
  describe('Uint16Arraypropertythree', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0100
     * @tc.name testUint16Arraypropertythree001
     * @tc.desc Verify length constructor creates three zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(6);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0200
     * @tc.name testUint16Arraypropertythree002
     * @tc.desc Verify empty constructor creates an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0300
     * @tc.name testUint16Arraypropertythree003
     * @tc.desc Verify ArrayBuffer constructor shares the input buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0400
     * @tc.name testUint16Arraypropertythree004
     * @tc.desc Verify Uint16Array.of stores all supplied elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      expect(arr.length).assertEqual(3);
      expect(arr.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0500
     * @tc.name testUint16Arraypropertythree005
     * @tc.desc Verify Uint16Array.from copies FixedArray elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4, 5];
      let arr: Uint16Array = Uint16Array.from(src);
      expect(arr.length).assertEqual(5);
      expect(arr.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0600
     * @tc.name testUint16Arraypropertythree006
     * @tc.desc Verify ArrayBuffer offset constructor retains the buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0700
     * @tc.name testUint16Arraypropertythree007
     * @tc.desc Verify length constructor allocates an ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr.buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0800
     * @tc.name testUint16Arraypropertythree008
     * @tc.desc Verify buffer-backed Uint16Array exposes an ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_0900
     * @tc.name testUint16Arraypropertythree009
     * @tc.desc Verify subarray exposes an ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let sub: Uint16Array = arr.subarray(0, 2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1000
     * @tc.name testUint16Arraypropertythree010
     * @tc.desc Verify ArrayBuffer constructor retains the input buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1100
     * @tc.name testUint16Arraypropertythree011
     * @tc.desc Verify subarray(1, 3) shares the source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let sub: Uint16Array = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1200
     * @tc.name testUint16Arraypropertythree012
     * @tc.desc Verify separate length constructors allocate distinct buffers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Uint16Array = new Uint16Array(3);
      let arr2: Uint16Array = new Uint16Array(3);
      expect(arr1.buffer).not().assertEqual(arr2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1300
     * @tc.name testUint16Arraypropertythree013
      * @tc.desc Verify from creates storage independent of its typed-array source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(1, 2, 3);
      let dst: Uint16Array = Uint16Array.from(src);
      expect(dst.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1400
     * @tc.name testUint16Arraypropertythree014
      * @tc.desc Verify an empty instance owns a zero-byte backing buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1500
     * @tc.name testUint16Arraypropertythree015
      * @tc.desc Verify three allocated elements use a six-byte backing buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr.buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1600
     * @tc.name testUint16Arraypropertythree016
      * @tc.desc Verify five allocated elements use a ten-byte backing buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      expect(arr.buffer.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1700
     * @tc.name testUint16Arraypropertythree017
      * @tc.desc Verify from allocates two backing bytes per copied value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4];
      let arr: Uint16Array = Uint16Array.from(src);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1800
     * @tc.name testUint16Arraypropertythree018
      * @tc.desc Verify of allocates two backing bytes per supplied value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      expect(arr.buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_1900
     * @tc.name testUint16Arraypropertythree019
      * @tc.desc Verify a bounded view retains the complete backing buffer length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf, 2, 3);
      expect(arr.buffer.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2000
     * @tc.name testUint16Arraypropertythree020
     * @tc.desc Verify length constructor has byteOffset 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2100
     * @tc.name testUint16Arraypropertythree021
     * @tc.desc Verify empty constructor has byteOffset 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2200
     * @tc.name testUint16Arraypropertythree022
      * @tc.desc Verify a buffer view at origin reports zero byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2300
     * @tc.name testUint16Arraypropertythree023
      * @tc.desc Verify factory-created arrays begin at byte offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2400
     * @tc.name testUint16Arraypropertythree024
      * @tc.desc Verify from-created arrays begin at byte offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let arr: Uint16Array = Uint16Array.from(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2500
     * @tc.name testUint16Arraypropertythree025
      * @tc.desc Verify typed-array copies begin at byte offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(1, 2);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2600
     * @tc.name testUint16Arraypropertythree026
      * @tc.desc Verify an offset buffer view retains a two-byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2700
     * @tc.name testUint16Arraypropertythree027
      * @tc.desc Verify an offset buffer view retains a four-byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2800
     * @tc.name testUint16Arraypropertythree028
      * @tc.desc Verify a bounded offset view retains its two-byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_2900
     * @tc.name testUint16Arraypropertythree029
      * @tc.desc Verify subarray advances byte offset by one Uint16 element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let sub: Uint16Array = arr.subarray(1);
      expect(sub.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3000
     * @tc.name testUint16Arraypropertythree030
      * @tc.desc Verify a later subarray advances byte offset by two Uint16 elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(2, 4);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3100
     * @tc.name testUint16Arraypropertythree031
      * @tc.desc Verify three allocated elements expose six view bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3200
     * @tc.name testUint16Arraypropertythree032
      * @tc.desc Verify three factory values expose six view bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3300
     * @tc.name testUint16Arraypropertythree033
      * @tc.desc Verify a two-element subarray exposes four view bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let sub: Uint16Array = arr.subarray(1, 3);
      expect(sub.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3400
     * @tc.name testUint16Arraypropertythree034
      * @tc.desc Verify the empty constructor reports zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3500
     * @tc.name testUint16Arraypropertythree035
      * @tc.desc Verify from preserves the four-element source count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4];
      let arr: Uint16Array = Uint16Array.from(src);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3600
     * @tc.name testUint16Arraypropertythree036
      * @tc.desc Verify a bounded subarray reports two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let sub: Uint16Array = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3700
     * @tc.name testUint16Arraypropertythree037
      * @tc.desc Verify an open-ended subarray retains the remaining three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(2);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3800
     * @tc.name testUint16Arraypropertythree038
      * @tc.desc Verify a length-created instance reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(1);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_3900
     * @tc.name testUint16Arraypropertythree039
     * @tc.desc Verify two disjoint views share one buffer without overlapping values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const left: Uint16Array = new Uint16Array(b, 0, 2);
      const right: Uint16Array = new Uint16Array(b, 8, 2);
      left.set(Uint16Array.of(1, 2));
      right.set(Uint16Array.of(5, 6));
      expect(new Uint16Array(b).join(',')).assertEqual('1,2,0,0,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4000
     * @tc.name testUint16Arraypropertythree040
     * @tc.desc Verify overlapping views propagate writes at the shared element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint16Array = new Uint16Array(b, 0, 4);
      const v: Uint16Array = new Uint16Array(b, 4, 2);
      a[2] = 22;
      expect(v[0]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4100
     * @tc.name testUint16Arraypropertythree041
     * @tc.desc Verify subarray byte offset advances by begin times element size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(new ArrayBuffer(14), 2, 5);
      const v: Uint16Array = a.subarray(2, 4);
      expect(v.byteOffset).assertEqual(6);
      expect(v.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4200
     * @tc.name testUint16Arraypropertythree042
     * @tc.desc Verify nested subarray composes byte offsets
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(new ArrayBuffer(16), 2, 6);
      const first: Uint16Array = a.subarray(1, 5);
      const second: Uint16Array = first.subarray(2, 4);
      expect(first.byteOffset).assertEqual(4);
      expect(second.byteOffset).assertEqual(8);
      expect(second.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4300
     * @tc.name testUint16Arraypropertythree043
     * @tc.desc Verify nested subarray write propagates to root view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const first: Uint16Array = a.subarray(1, 5);
      const second: Uint16Array = first.subarray(1, 3);
      second[0] = 30;
      expect(a.join(',')).assertEqual('1,2,30,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4400
     * @tc.name testUint16Arraypropertythree044
     * @tc.desc Verify zero-length subarray keeps the computed interior offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const v: Uint16Array = a.subarray(2, 2);
      expect(v.length).assertEqual(0);
      expect(v.byteOffset).assertEqual(a.byteOffset + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4500
     * @tc.name testUint16Arraypropertythree045
     * @tc.desc Verify subarray ending at parent boundary shares final elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const v: Uint16Array = a.subarray(2);
      v[1] = 40;
      expect(a.join(',')).assertEqual('1,2,3,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4600
     * @tc.name testUint16Arraypropertythree046
     * @tc.desc Verify negative subarray bounds compute a shared suffix range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const v: Uint16Array = a.subarray(-3, -1);
      expect(v.join(',')).assertEqual('3,4');
      expect(v.byteOffset).assertEqual(a.byteOffset + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4700
     * @tc.name testUint16Arraypropertythree047
     * @tc.desc Verify full view and offset view expose the same backing buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const all: Uint16Array = new Uint16Array(b);
      const v: Uint16Array = new Uint16Array(b, 2, 3);
      expect(v.buffer).assertEqual(all.buffer);
      v[2] = 33;
      expect(all[3]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4800
     * @tc.name testUint16Arraypropertythree048
     * @tc.desc Verify view range may end exactly at buffer capacity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(14);
      const v: Uint16Array = new Uint16Array(b, 6, 4);
      expect(v.byteOffset + v.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_4900
     * @tc.name testUint16Arraypropertythree049
     * @tc.desc Verify multiple nested views retain the original buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(16);
      const root: Uint16Array = new Uint16Array(b);
      const a: Uint16Array = root.subarray(1, 7);
      const d: Uint16Array = a.subarray(2, 4);
      expect(d.buffer).assertEqual(b);
      expect(d.byteOffset).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5000
     * @tc.name testUint16Arraypropertythree050
     * @tc.desc Verify write through root is visible in nested view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const nested: Uint16Array = root.subarray(1, 4).subarray(1, 2);
      root[2] = 30;
      expect(nested[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5100
     * @tc.name testUint16Arraypropertythree051
     * @tc.desc Verify write through nested view is visible in sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const left: Uint16Array = root.subarray(1, 4);
      const nested: Uint16Array = left.subarray(1, 2);
      const sibling: Uint16Array = root.subarray(2, 5);
      nested[0] = 33;
      expect(sibling[0]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5200
     * @tc.name testUint16Arraypropertythree052
     * @tc.desc Verify nonoverlapping sibling views do not propagate element writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6);
      const left: Uint16Array = root.subarray(0, 2);
      const right: Uint16Array = root.subarray(4, 6);
      left[0] = 10;
      expect(right.join(',')).assertEqual('5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5300
     * @tc.name testUint16Arraypropertythree053
     * @tc.desc Verify subarray length follows clamped negative bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const v: Uint16Array = root.subarray(-99, 99);
      expect(v.length).assertEqual(5);
      expect(v.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5400
     * @tc.name testUint16Arraypropertythree054
     * @tc.desc Verify subarray begin below negative length clamps to the root start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const v: Uint16Array = root.subarray(-99, 2);
      v[0] = 10;
      expect(root.join(',')).assertEqual('10,2,3,4');
      expect(v.byteOffset).assertEqual(root.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5500
     * @tc.name testUint16Arraypropertythree055
     * @tc.desc Verify subarray end above length clamps to the root end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const v: Uint16Array = root.subarray(2, 99);
      v[1] = 40;
      expect(root.join(',')).assertEqual('1,2,3,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5600
     * @tc.name testUint16Arraypropertythree056
     * @tc.desc Verify subarray begin greater than end creates an empty view at begin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const v: Uint16Array = root.subarray(3, 1);
      expect(v.length).assertEqual(0);
      expect(v.byteOffset).assertEqual(root.byteOffset + 6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5700
     * @tc.name testUint16Arraypropertythree057
     * @tc.desc Verify reverse on a view propagates reordered values to the root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(9, 1, 2, 3, 8);
      const v: Uint16Array = root.subarray(1, 4);
      v.reverse();
      expect(root.join(',')).assertEqual('9,3,2,1,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5800
     * @tc.name testUint16Arraypropertythree058
     * @tc.desc Verify sort on a view propagates reordered values to the root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(9, 3, 1, 2, 8);
      const v: Uint16Array = root.subarray(1, 4);
      v.sort();
      expect(root.join(',')).assertEqual('9,1,2,3,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_5900
     * @tc.name testUint16Arraypropertythree059
     * @tc.desc Verify fill on a nested view propagates only its range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const v: Uint16Array = root.subarray(1, 5).subarray(1, 3);
      v.fill(9);
      expect(root.join(',')).assertEqual('1,2,9,9,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6000
     * @tc.name testUint16Arraypropertythree060
     * @tc.desc Verify set on a nested view respects nested view boundaries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const v: Uint16Array = root.subarray(1, 5).subarray(1, 3);
      v.set(Uint16Array.of(8, 9));
      expect(root.join(',')).assertEqual('1,2,8,9,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6100
     * @tc.name testUint16Arraypropertythree061
     * @tc.desc Verify copyWithin on a view propagates its snapshot to the root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(9, 1, 2, 3, 4, 8);
      const v: Uint16Array = root.subarray(1, 5);
      v.copyWithin(1, 0, 3);
      expect(root.join(',')).assertEqual('9,1,1,2,3,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6200
     * @tc.name testUint16Arraypropertythree062
     * @tc.desc Verify scalar assignment through a final-element view updates the root end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const v: Uint16Array = root.subarray(-1);
      v[0] = 44;
      expect(root.join(',')).assertEqual('1,2,3,44');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6300
     * @tc.name testUint16Arraypropertythree063
     * @tc.desc Verify nested negative bounds compose from the immediate parent length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6);
      const first: Uint16Array = root.subarray(1, 6);
      const second: Uint16Array = first.subarray(-3, -1);
      expect(second.join(',')).assertEqual('4,5');
      expect(second.byteOffset).assertEqual(root.byteOffset + 6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6400
     * @tc.name testUint16Arraypropertythree064
     * @tc.desc Verify zero-length nested view retains its parent buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3);
      const first: Uint16Array = root.subarray(1);
      const second: Uint16Array = first.subarray(1, 1);
      expect(second.buffer).assertEqual(root.buffer);
      expect(second.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6500
     * @tc.name testUint16Arraypropertythree065
     * @tc.desc Verify full-range subarray aliases every root element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3);
      const v: Uint16Array = root.subarray();
      v[1] = 22;
      expect(root.join(',')).assertEqual('1,22,3');
      expect(v.byteLength).assertEqual(root.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6600
     * @tc.name testUint16Arraypropertythree066
     * @tc.desc Verify offset ArrayBuffer view subarray composes absolute offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(16);
      const root: Uint16Array = new Uint16Array(b, 4, 5);
      const v: Uint16Array = root.subarray(2, 4);
      expect(v.byteOffset).assertEqual(8);
      expect(v.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6700
     * @tc.name testUint16Arraypropertythree067
     * @tc.desc Verify view created with undefined length shares the remaining buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const root: Uint16Array = new Uint16Array(b, 4, undefined);
      root[0] = 11;
      expect(new Uint16Array(b)[2]).assertEqual(11);
      expect(root.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6800
     * @tc.name testUint16Arraypropertythree068
     * @tc.desc Verify two identical-range views observe each other immediately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint16Array = new Uint16Array(b, 2, 2);
      const v: Uint16Array = new Uint16Array(b, 2, 2);
      a[1] = 77;
      expect(v.join(',')).assertEqual('0,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_6900
     * @tc.name testUint16Arraypropertythree069
     * @tc.desc Verify partially overlapping views share only their intersection
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const left: Uint16Array = new Uint16Array(b, 0, 3);
      const right: Uint16Array = new Uint16Array(b, 4, 3);
      left.set(Uint16Array.of(1, 2, 3));
      right[0] = 30;
      expect(left.join(',')).assertEqual('1,2,30');
      expect(right.join(',')).assertEqual('30,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_7000
     * @tc.name testUint16Arraypropertythree070
     * @tc.desc Verify subarray of a zero-length boundary view remains at the boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const root: Uint16Array = new Uint16Array(b, 8, 0);
      const v: Uint16Array = root.subarray();
      expect(v.byteOffset).assertEqual(8);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_7100
     * @tc.name testUint16Arraypropertythree071
     * @tc.desc Verify nested view byte length is independent of unused backing capacity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(20);
      const root: Uint16Array = new Uint16Array(b, 4, 6);
      const v: Uint16Array = root.subarray(1, 3);
      expect(v.byteLength).assertEqual(4);
      expect(b.byteLength - v.byteOffset - v.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_7200
     * @tc.name testUint16Arraypropertythree072
     * @tc.desc Verify shared propagation works at the Uint16 maximum boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = new Uint16Array(3);
      const v: Uint16Array = root.subarray(1, 2);
      v[0] = 65535;
      expect(root.join(',')).assertEqual('0,65535,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_7300
     * @tc.name testUint16Arraypropertythree073
     * @tc.desc Verify shared propagation applies Uint16 conversion before storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = new Uint16Array(3);
      const v: Uint16Array = root.subarray(1, 2);
      v[0] = -1;
      expect(root.join(',')).assertEqual('0,65535,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_7400
     * @tc.name testUint16Arraypropertythree074
     * @tc.desc Verify view mutation does not alter elements before or after its range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      const v: Uint16Array = root.subarray(1, 4);
      v.fill(7);
      expect(root.join(',')).assertEqual('10,7,7,7,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_01_7500
     * @tc.name testUint16Arraypropertythree075
     * @tc.desc Verify nested subarray mutation propagates to root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertythree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const nested: Uint16Array = root.subarray(1, 4).subarray(1, 2);
      nested[0] = 33;
      expect(root.join(',')).assertEqual('1,2,33,4');
    });

  });
}
