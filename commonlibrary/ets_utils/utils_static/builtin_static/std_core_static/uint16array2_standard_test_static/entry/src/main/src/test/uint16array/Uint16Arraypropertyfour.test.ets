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

export default function uint16ArraypropertyfourTest(): void {
  describe('Uint16Arraypropertyfour', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0100
     * @tc.name testUint16Arraypropertyfour001
      * @tc.desc Verify a full six-byte buffer view contains three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0200
     * @tc.name testUint16Arraypropertyfour002
      * @tc.desc Verify the length constructor creates ten elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0300
     * @tc.name testUint16Arraypropertyfour003
      * @tc.desc Verify factory creation retains two supplied values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0400
     * @tc.name testUint16Arraypropertyfour004
      * @tc.desc Verify factory creation retains five supplied values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0500
     * @tc.name testUint16Arraypropertyfour005
      * @tc.desc Verify from preserves a four-value FixedArray count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20, 30, 40];
      let arr: Uint16Array = Uint16Array.from(src);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0600
     * @tc.name testUint16Arraypropertyfour006
      * @tc.desc Verify from consumes both inserted Set values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(5);
      s.add(10);
      let arr: Uint16Array = Uint16Array.from(s);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0700
     * @tc.name testUint16Arraypropertyfour007
      * @tc.desc Verify an offset buffer view spans the remaining three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0800
     * @tc.name testUint16Arraypropertyfour008
      * @tc.desc Verify an offset bounded view reports two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_0900
     * @tc.name testUint16Arraypropertyfour009
      * @tc.desc Verify a bounded subarray reports its three selected elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1000
     * @tc.name testUint16Arraypropertyfour010
      * @tc.desc Verify an open-ended subarray reports its remaining elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let sub: Uint16Array = arr.subarray(2);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1100
     * @tc.name testUint16Arraypropertyfour011
      * @tc.desc Verify a typed-array copy preserves the source element count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(1, 2, 3);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1200
     * @tc.name testUint16Arraypropertyfour012
      * @tc.desc Verify FixedArray integer construction preserves four elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [5, 10, 15, 20];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1300
     * @tc.name testUint16Arraypropertyfour013
      * @tc.desc Verify FixedArray number construction preserves three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1400
     * @tc.name testUint16Arraypropertyfour014
      * @tc.desc Verify a buffer-backed view reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1500
     * @tc.name testUint16Arraypropertyfour015
      * @tc.desc Verify a factory-created instance reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1600
     * @tc.name testUint16Arraypropertyfour016
      * @tc.desc Verify a from-created instance reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let arr: Uint16Array = Uint16Array.from(src);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1700
     * @tc.name testUint16Arraypropertyfour017
      * @tc.desc Verify a subarray view reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let sub: Uint16Array = arr.subarray(0, 2);
      expect(sub.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1800
     * @tc.name testUint16Arraypropertyfour018
      * @tc.desc Verify a typed-array copy reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(1, 2);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_1900
     * @tc.name testUint16Arraypropertyfour019
      * @tc.desc Verify an empty instance has byte length proportional to its count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.byteLength).assertEqual(arr.length * 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2000
     * @tc.name testUint16Arraypropertyfour020
      * @tc.desc Verify length-created storage uses two bytes per element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr.byteLength).assertEqual(arr.length * 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2100
     * @tc.name testUint16Arraypropertyfour021
      * @tc.desc Verify factory-created storage uses two bytes per element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      expect(arr.byteLength).assertEqual(arr.length * 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2200
     * @tc.name testUint16Arraypropertyfour022
      * @tc.desc Verify element width times length equals the view byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      expect(Uint16Array.BYTES_PER_ELEMENT * arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2300
     * @tc.name testUint16Arraypropertyfour023
      * @tc.desc Verify a full view byte length equals its backing buffer length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2400
     * @tc.name testUint16Arraypropertyfour024
      * @tc.desc Verify a bounded view can be shorter than its backing buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf, 2, 3);
      expect(arr.buffer.byteLength).assertEqual(10);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2500
     * @tc.name testUint16Arraypropertyfour025
      * @tc.desc Verify an interior view retains its offset, length, and buffer dimensions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf, 4, 2);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.buffer.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2600
     * @tc.name testUint16Arraypropertyfour026
      * @tc.desc Verify an unbounded offset view ends exactly at buffer capacity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteOffset + arr.byteLength).assertEqual(arr.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2700
     * @tc.name testUint16Arraypropertyfour027
      * @tc.desc Verify subarray offset advances by two bytes per skipped element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let sub: Uint16Array = arr.subarray(2);
      expect(sub.byteOffset).assertEqual(arr.byteOffset + 2 * Uint16Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2800
     * @tc.name testUint16Arraypropertyfour028
     * @tc.desc Verify sibling ArrayBuffer views share writes from the first view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      arr[0] = 0x1234;
      let view2: Uint16Array = new Uint16Array(buf, 0);
      expect(view2[0]).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_2900
     * @tc.name testUint16Arraypropertyfour029
      * @tc.desc Verify writes through a second buffer view update the first view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      arr[0] = 0;
      let view2: Uint16Array = new Uint16Array(buf, 0);
      view2[0] = 0xABCD;
      expect(arr[0]).assertEqual(0xABCD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3000
     * @tc.name testUint16Arraypropertyfour030
      * @tc.desc Verify a subarray element write updates its parent index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let sub: Uint16Array = arr.subarray(1, 3);
      sub[0] = 99;
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3100
     * @tc.name testUint16Arraypropertyfour031
      * @tc.desc Verify a parent element write updates the corresponding subarray index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let sub: Uint16Array = arr.subarray(1, 3);
      arr[1] = 77;
      expect(sub[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3200
     * @tc.name testUint16Arraypropertyfour032
      * @tc.desc Verify disjoint buffer views preserve values in separate ranges
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let v1: Uint16Array = new Uint16Array(buf, 0, 2);
      let v2: Uint16Array = new Uint16Array(buf, 4, 2);
      v1[0] = 0xAAAA;
      v2[0] = 0xBBBB;
      expect(v1[0]).assertEqual(0xAAAA);
      expect(v2[0]).assertEqual(0xBBBB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3300
     * @tc.name testUint16Arraypropertyfour033
      * @tc.desc Verify a zero-start subarray retains the parent byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let sub: Uint16Array = arr.subarray(0);
      expect(sub.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3400
     * @tc.name testUint16Arraypropertyfour034
      * @tc.desc Verify subarray start index two produces a four-byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let sub: Uint16Array = arr.subarray(2);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3500
     * @tc.name testUint16Arraypropertyfour035
      * @tc.desc Verify a subarray compounds its parent buffer offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Uint16Array = new Uint16Array(buf, 2, 4);
      let sub: Uint16Array = arr.subarray(1, 3);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3600
     * @tc.name testUint16Arraypropertyfour036
      * @tc.desc Verify set writes supplied values without changing trailing elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      let src: FixedArray<int> = [1, 2];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3700
     * @tc.name testUint16Arraypropertyfour037
      * @tc.desc Verify fill returns its receiver after replacing every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      let result: Uint16Array = arr.fill(5);
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3800
     * @tc.name testUint16Arraypropertyfour038
      * @tc.desc Verify copyWithin returns its receiver after moving the source suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let result: Uint16Array = arr.copyWithin(0, 2);
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_3900
     * @tc.name testUint16Arraypropertyfour039
      * @tc.desc Verify factory values including the Uint16 maximum retain three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 32768);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4000
     * @tc.name testUint16Arraypropertyfour040
      * @tc.desc Verify three boundary-valued factory elements occupy six bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 32768);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4100
     * @tc.name testUint16Arraypropertyfour041
      * @tc.desc Verify one hundred allocated elements occupy two hundred bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(100);
      expect(arr.byteLength).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4200
     * @tc.name testUint16Arraypropertyfour042
      * @tc.desc Verify one hundred allocated elements use a two-hundred-byte buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(100);
      expect(arr.buffer.byteLength).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4300
     * @tc.name testUint16Arraypropertyfour043
      * @tc.desc Verify a single factory value produces one element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4400
     * @tc.name testUint16Arraypropertyfour044
      * @tc.desc Verify one factory value occupies two bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4500
     * @tc.name testUint16Arraypropertyfour045
     * @tc.desc Verify reverse preserves dimensions and returns the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const b: ArrayBuffer = a.buffer;
      const r: Uint16Array = a.reverse();
      expect(r).assertEqual(a);
      expect(a.join(',')).assertEqual('3,2,1');
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4600
     * @tc.name testUint16Arraypropertyfour046
     * @tc.desc Verify sort preserves dimensions and returns the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(3, 1, 2);
      const r: Uint16Array = a.sort();
      expect(r).assertEqual(a);
      expect(a.join(',')).assertEqual('1,2,3');
      expect(a.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4700
     * @tc.name testUint16Arraypropertyfour047
     * @tc.desc Verify fill preserves view identity and changes only selected range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const b: ArrayBuffer = a.buffer;
      const r: Uint16Array = a.fill(9, 1, 3);
      expect(r).assertEqual(a);
      expect(a.join(',')).assertEqual('1,9,9,4');
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4800
     * @tc.name testUint16Arraypropertyfour048
     * @tc.desc Verify copyWithin preserves receiver identity with snapshot semantics
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const r: Uint16Array = a.copyWithin(1, 0, 3);
      expect(r).assertEqual(a);
      expect(a.join(',')).assertEqual('1,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_4900
     * @tc.name testUint16Arraypropertyfour049
     * @tc.desc Verify set preserves receiver dimensions and buffer identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const b: ArrayBuffer = a.buffer;
      a.set(Uint16Array.of(8, 9), 1);
      expect(a.join(',')).assertEqual('1,8,9,4');
      expect(a.buffer).assertEqual(b);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5000
     * @tc.name testUint16Arraypropertyfour050
     * @tc.desc Verify toReversed returns isolated storage and preserves receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const r: Uint16Array = a.toReversed();
      r[0] = 9;
      expect(a.join(',')).assertEqual('1,2,3');
      expect(r.join(',')).assertEqual('9,2,1');
      expect(r.buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5100
     * @tc.name testUint16Arraypropertyfour051
     * @tc.desc Verify toSorted returns isolated sorted storage and preserves receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(3, 1, 2);
      const r: Uint16Array = a.toSorted();
      r[0] = 9;
      expect(a.join(',')).assertEqual('3,1,2');
      expect(r.join(',')).assertEqual('9,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5200
     * @tc.name testUint16Arraypropertyfour052
     * @tc.desc Verify with returns isolated replacement storage and preserves receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const r: Uint16Array = a.with(1, 9);
      expect(a.join(',')).assertEqual('1,2,3');
      expect(r.join(',')).assertEqual('1,9,3');
      expect(r.buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5300
     * @tc.name testUint16Arraypropertyfour053
     * @tc.desc Verify slice returns isolated storage with copied content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const r: Uint16Array = a.slice(1, 3);
      r[0] = 20;
      expect(a.join(',')).assertEqual('1,2,3,4');
      expect(r.join(',')).assertEqual('20,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5400
     * @tc.name testUint16Arraypropertyfour054
     * @tc.desc Verify subarray returns shared storage with adjusted range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const r: Uint16Array = a.subarray(1, 3);
      r[0] = 20;
      expect(a.join(',')).assertEqual('1,20,3,4');
      expect(r.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5500
     * @tc.name testUint16Arraypropertyfour055
     * @tc.desc Verify valueOf returns the receiver and exposes later mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2);
      const r: Uint16Array = a.valueOf();
      a[1] = 22;
      expect(r).assertEqual(a);
      expect(r.join(',')).assertEqual('1,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5600
     * @tc.name testUint16Arraypropertyfour056
     * @tc.desc Verify map returns isolated transformed storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const r: Uint16Array = a.map((v: number): number => v * 2);
      r[0] = 9;
      expect(a.join(',')).assertEqual('1,2,3');
      expect(r.join(',')).assertEqual('9,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5700
     * @tc.name testUint16Arraypropertyfour057
     * @tc.desc Verify filter returns isolated selected storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const r: Uint16Array = a.filter((v: number): boolean => v % 2 === 0);
      r[0] = 20;
      expect(a.join(',')).assertEqual('1,2,3,4');
      expect(r.join(',')).assertEqual('20,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5800
     * @tc.name testUint16Arraypropertyfour058
     * @tc.desc Verify reduce observes values without changing receiver properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const b: ArrayBuffer = a.buffer;
      const sum: number = a.reduce((p: number, v: number): number => p + v, 0);
      expect(sum).assertEqual(6);
      expect(a.join(',')).assertEqual('1,2,3');
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_5900
     * @tc.name testUint16Arraypropertyfour059
     * @tc.desc Verify some short-circuit does not alter receiver properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const b: ArrayBuffer = a.buffer;
      const r: boolean = a.some((v: number): boolean => v === 2);
      expect(r).assertTrue();
      expect(a.join(',')).assertEqual('1,2,3');
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6000
     * @tc.name testUint16Arraypropertyfour060
     * @tc.desc Verify toString observes content without changing receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(10, 20);
      const b: ArrayBuffer = a.buffer;
      expect(a.toString()).assertEqual('10,20');
      expect(a.buffer).assertEqual(b);
      expect(a.join(',')).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6100
     * @tc.name testUint16Arraypropertyfour061
     * @tc.desc Verify values iterator observes content without changing receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(4, 5);
      const b: ArrayBuffer = a.buffer;
      const it: IterableIterator<Number> = a.values();
      expect(it.next().value).assertEqual(4);
      expect(it.next().value).assertEqual(5);
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6200
     * @tc.name testUint16Arraypropertyfour062
     * @tc.desc Verify entries iterator observes indexes and values without mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(7, 8);
      const iterator: IterableIterator<[int, number]> = a.entries();
      const first: [int, number] = iterator.next().value as [int, number];
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(7);
      expect(a.join(',')).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6300
     * @tc.name testUint16Arraypropertyfour063
     * @tc.desc Verify keys iterator observes index range without mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(7, 8, 9);
      const it: IterableIterator<int> = a.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(a.join(',')).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6400
     * @tc.name testUint16Arraypropertyfour064
     * @tc.desc Verify at observes content without changing receiver geometry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(4, 5, 6);
      const b: ArrayBuffer = a.buffer;
      expect(a.at(1)).assertEqual(5);
      expect(a.buffer).assertEqual(b);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6500
     * @tc.name testUint16Arraypropertyfour065
     * @tc.desc Verify includes observes membership without changing receiver content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(4, 5, 6);
      const r: boolean = a.includes(5);
      expect(r).assertTrue();
      expect(a.join(',')).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6600
     * @tc.name testUint16Arraypropertyfour066
     * @tc.desc Verify indexOf observes the first matching index without mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(4, 5, 4);
      expect(a.indexOf(4)).assertEqual(0);
      expect(a.join(',')).assertEqual('4,5,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6700
     * @tc.name testUint16Arraypropertyfour067
     * @tc.desc Verify lastIndexOf observes the final matching index without mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(4, 5, 4);
      expect(a.lastIndexOf(4)).assertEqual(2);
      expect(a.join(',')).assertEqual('4,5,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6800
     * @tc.name testUint16Arraypropertyfour068
     * @tc.desc Verify every traverses receiver without changing its backing storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(2, 4, 6);
      const b: ArrayBuffer = a.buffer;
      const r: boolean = a.every((v: number): boolean => v % 2 === 0);
      expect(r).assertTrue();
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_6900
     * @tc.name testUint16Arraypropertyfour069
     * @tc.desc Verify find returns a value without changing receiver content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(2, 5, 8);
      expect(a.find((v: number): boolean => v > 4)).assertEqual(5);
      expect(a.join(',')).assertEqual('2,5,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_7000
     * @tc.name testUint16Arraypropertyfour070
     * @tc.desc Verify findIndex returns an index without changing receiver content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(2, 5, 8);
      expect(a.findIndex((v: number): boolean => v === 8)).assertEqual(2);
      expect(a.join(',')).assertEqual('2,5,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_7100
     * @tc.name testUint16Arraypropertyfour071
     * @tc.desc Verify reduceRight observes content without changing receiver geometry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const b: ArrayBuffer = a.buffer;
      const r: number = a.reduceRight((p: number, v: number): number => p + v, 0);
      expect(r).assertEqual(6);
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_7200
     * @tc.name testUint16Arraypropertyfour072
     * @tc.desc Verify forEach may mutate content while preserving receiver identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      const b: ArrayBuffer = a.buffer;
      a.forEach((v: number, i: int, x: Uint16Array): void => {
        x[i] = v.toInt() * 2;
      });
      expect(a.join(',')).assertEqual('2,4,6');
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_7300
     * @tc.name testUint16Arraypropertyfour073
     * @tc.desc Verify join observes content with a custom separator without mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(1, 2, 3);
      expect(a.join('|')).assertEqual('1|2|3');
      expect(a.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_7400
     * @tc.name testUint16Arraypropertyfour074
     * @tc.desc Verify toLocaleString observes content without changing receiver storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(10, 20);
      const b: ArrayBuffer = a.buffer;
      const r: string = a.toLocaleString();
      expect(r).assertEqual('10,20');
      expect(a.buffer).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_2_02_7500
     * @tc.name testUint16Arraypropertyfour075
     * @tc.desc Verify scalar set preserves nonzero view geometry while propagating storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyfour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint16Array = new Uint16Array(b, 2, 3);
      a.set(1, 77);
      expect(a.byteOffset).assertEqual(2);
      expect(a.length).assertEqual(3);
      expect(new Uint16Array(b)[2]).assertEqual(77);
    });

  });
}
