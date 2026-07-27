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

export default function uint16ArraypropertyoneTest(): void {
  describe('Uint16Arraypropertyone', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0100
     * @tc.name testUint16Arraypropertyone001
     * @tc.desc Verify empty Uint16Array has an ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array();
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0200
     * @tc.name testUint16Arraypropertyone002
      * @tc.desc Verify an empty instance reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array();
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0300
     * @tc.name testUint16Arraypropertyone003
     * @tc.desc Verify Uint16Array.BYTES_PER_ELEMENT is 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0400
     * @tc.name testUint16Arraypropertyone004
     * @tc.desc Verify length constructor exposes an ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(5);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0500
     * @tc.name testUint16Arraypropertyone005
      * @tc.desc Verify a length-created view begins at byte offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0600
     * @tc.name testUint16Arraypropertyone006
      * @tc.desc Verify five allocated elements occupy ten bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(5);
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0700
     * @tc.name testUint16Arraypropertyone007
      * @tc.desc Verify the length constructor retains its requested element count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0800
     * @tc.name testUint16Arraypropertyone008
      * @tc.desc Verify a length-created instance retains the Uint16Array name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(5);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_0900
     * @tc.name testUint16Arraypropertyone009
      * @tc.desc Verify FixedArray construction keeps three elements with two-byte width
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const arr: Uint16Array = new Uint16Array(src);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1000
     * @tc.name testUint16Arraypropertyone010
      * @tc.desc Verify a FixedArray copy starts at byte offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1100
     * @tc.name testUint16Arraypropertyone011
      * @tc.desc Verify three copied FixedArray values occupy six bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1200
     * @tc.name testUint16Arraypropertyone012
      * @tc.desc Verify FixedArray construction preserves the source element count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1300
     * @tc.name testUint16Arraypropertyone013
      * @tc.desc Verify a FixedArray copy reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1400
     * @tc.name testUint16Arraypropertyone014
     * @tc.desc Verify FixedArray constructor exposes an ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1500
     * @tc.name testUint16Arraypropertyone015
     * @tc.desc Verify ArrayBuffer constructor exposes three zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Uint16Array = new Uint16Array(buf);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(6);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1600
     * @tc.name testUint16Arraypropertyone016
      * @tc.desc Verify a buffer-backed view retains the supplied buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Uint16Array = new Uint16Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1700
     * @tc.name testUint16Arraypropertyone017
      * @tc.desc Verify a full buffer view starts at the buffer origin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Uint16Array = new Uint16Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1800
     * @tc.name testUint16Arraypropertyone018
      * @tc.desc Verify full buffer views share storage and expose the buffer byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Uint16Array = new Uint16Array(buf);
      expect(arr.byteLength).assertEqual(buf.byteLength);
      expect(arr.buffer).assertEqual(buf);
      arr[0] = 1234;
      const sharedView: Uint16Array = new Uint16Array(buf);
      expect(sharedView[0]).assertEqual(1234);
      sharedView[1] = 5678;
      expect(arr[1]).assertEqual(5678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_1900
     * @tc.name testUint16Arraypropertyone019
      * @tc.desc Verify a six-byte buffer produces three Uint16 elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Uint16Array = new Uint16Array(buf);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2000
     * @tc.name testUint16Arraypropertyone020
      * @tc.desc Verify a buffer-backed view reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Uint16Array = new Uint16Array(buf);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2100
     * @tc.name testUint16Arraypropertyone021
     * @tc.desc Verify Uint16Array copy constructor creates isolated storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = new Uint16Array(3);
      const arr: Uint16Array = new Uint16Array(src);
      src[0] = 123;
      expect(arr[0]).assertEqual(0);
      expect(arr.buffer).not().assertEqual(src.buffer);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2200
     * @tc.name testUint16Arraypropertyone022
      * @tc.desc Verify a typed-array copy is allocated at byte offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = new Uint16Array(3);
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2300
     * @tc.name testUint16Arraypropertyone023
     * @tc.desc Verify copy constructor preserves source byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = new Uint16Array(3);
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(src.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2400
     * @tc.name testUint16Arraypropertyone024
     * @tc.desc Verify copy constructor preserves source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = new Uint16Array(3);
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2500
     * @tc.name testUint16Arraypropertyone025
      * @tc.desc Verify a typed-array copy reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = new Uint16Array(3);
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2600
     * @tc.name testUint16Arraypropertyone026
     * @tc.desc Verify ArrayBuffer offset constructor exposes remaining elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2700
     * @tc.name testUint16Arraypropertyone027
      * @tc.desc Verify an offset view retains its source buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2800
     * @tc.name testUint16Arraypropertyone028
      * @tc.desc Verify an aligned offset is retained by the created view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_2900
     * @tc.name testUint16Arraypropertyone029
      * @tc.desc Verify a later aligned offset is retained by the created view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3000
     * @tc.name testUint16Arraypropertyone030
      * @tc.desc Verify an offset buffer view reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3100
     * @tc.name testUint16Arraypropertyone031
     * @tc.desc Verify ArrayBuffer offset and length constructor creates two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3200
     * @tc.name testUint16Arraypropertyone032
      * @tc.desc Verify a bounded view retains its source buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3300
     * @tc.name testUint16Arraypropertyone033
      * @tc.desc Verify a bounded view at origin retains zero byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3400
     * @tc.name testUint16Arraypropertyone034
      * @tc.desc Verify a bounded view retains its nonzero byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3500
     * @tc.name testUint16Arraypropertyone035
      * @tc.desc Verify two bounded elements expose a four-byte view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3600
     * @tc.name testUint16Arraypropertyone036
      * @tc.desc Verify a bounded buffer view exposes its requested element count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3700
     * @tc.name testUint16Arraypropertyone037
      * @tc.desc Verify a bounded buffer view reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3800
     * @tc.name testUint16Arraypropertyone038
      * @tc.desc Verify two allocated Uint16 elements occupy four bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_3900
     * @tc.name testUint16Arraypropertyone039
      * @tc.desc Verify the length constructor supports one hundred elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(100);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4000
     * @tc.name testUint16Arraypropertyone040
      * @tc.desc Verify the length constructor accepts the 65535-element boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0xFFFF);
      expect(arr.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4100
     * @tc.name testUint16Arraypropertyone041
     * @tc.desc Verify number length constructor truncates a positive fraction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(3.9);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4200
     * @tc.name testUint16Arraypropertyone042
     * @tc.desc Verify number length constructor accepts zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(0.0);
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4300
     * @tc.name testUint16Arraypropertyone043
     * @tc.desc Verify copy constructor copies converted content into isolated storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = new Uint16Array([-1, 65536, 2]);
      const a: Uint16Array = new Uint16Array(src);
      a[0] = 9;
      expect(src.join(',')).assertEqual('65535,0,2');
      expect(a.join(',')).assertEqual('9,0,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4400
     * @tc.name testUint16Arraypropertyone044
     * @tc.desc Verify FixedArray int constructor stores exact boundary content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: FixedArray<int> = [0, 32768, 65535];
      const a: Uint16Array = new Uint16Array(s);
      expect(a.join(',')).assertEqual('0,32768,65535');
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4500
     * @tc.name testUint16Arraypropertyone045
     * @tc.desc Verify FixedArray number constructor truncates and wraps
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: FixedArray<number> = [1.9, -1.2, 65536.8];
      const a: Uint16Array = new Uint16Array(s);
      expect(a.join(',')).assertEqual('1,65535,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4600
     * @tc.name testUint16Arraypropertyone046
     * @tc.desc Verify Array int constructor copies dynamic array content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<int> = [3, 1, 4, 1];
      const a: Uint16Array = new Uint16Array(s);
      s[0] = 9;
      expect(a.join(',')).assertEqual('3,1,4,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4700
     * @tc.name testUint16Arraypropertyone047
     * @tc.desc Verify Iterable Number constructor consumes all iterable elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<Number> = [2.0, 4.0, 8.0];
      const a: Uint16Array = new Uint16Array(s);
      expect(a.join(',')).assertEqual('2,4,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4800
     * @tc.name testUint16Arraypropertyone048
     * @tc.desc Verify ArrayBuffer constructor covers the complete buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint16Array = new Uint16Array(b);
      expect(a.buffer).assertEqual(b);
      expect(a.length).assertEqual(5);
      expect(a.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_4900
     * @tc.name testUint16Arraypropertyone049
     * @tc.desc Verify ArrayBuffer offset constructor covers the remaining aligned bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint16Array = new Uint16Array(b, 4);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5000
     * @tc.name testUint16Arraypropertyone050
     * @tc.desc Verify ArrayBuffer offset and length constructor selects an interior range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const a: Uint16Array = new Uint16Array(b, 4, 3);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5100
     * @tc.name testUint16Arraypropertyone051
     * @tc.desc Verify undefined offset and length cover the complete buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint16Array = new Uint16Array(b, undefined, undefined);
      expect(a.byteOffset).assertEqual(0);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5200
     * @tc.name testUint16Arraypropertyone052
     * @tc.desc Verify zero-length view may start at the buffer boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint16Array = new Uint16Array(b, 8, 0);
      expect(a.byteOffset).assertEqual(8);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5300
     * @tc.name testUint16Arraypropertyone053
     * @tc.desc Verify misaligned byte offset raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      try {
        const a: Uint16Array = new Uint16Array(b, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5400
     * @tc.name testUint16Arraypropertyone054
     * @tc.desc Verify byte offset beyond buffer raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      try {
        const a: Uint16Array = new Uint16Array(b, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5500
     * @tc.name testUint16Arraypropertyone055
     * @tc.desc Verify negative byte offset raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      try {
        const a: Uint16Array = new Uint16Array(b, -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5600
     * @tc.name testUint16Arraypropertyone056
     * @tc.desc Verify view length exceeding remaining bytes raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      try {
        const a: Uint16Array = new Uint16Array(b, 4, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5700
     * @tc.name testUint16Arraypropertyone057
     * @tc.desc Verify negative view length raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      try {
        const a: Uint16Array = new Uint16Array(b, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5800
     * @tc.name testUint16Arraypropertyone058
     * @tc.desc Verify negative array length raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a: Uint16Array = new Uint16Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_5900
     * @tc.name testUint16Arraypropertyone059
     * @tc.desc Verify fractional length below one truncates to an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(0.9);
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6000
     * @tc.name testUint16Arraypropertyone060
     * @tc.desc Verify integral number length creates zero-initialized elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(3.0);
      expect(a.join(',')).assertEqual('0,0,0');
      expect(a.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6100
     * @tc.name testUint16Arraypropertyone061
     * @tc.desc Verify empty FixedArray constructor creates an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: FixedArray<int> = [];
      const a: Uint16Array = new Uint16Array(s);
      expect(a.length).assertEqual(0);
      expect(a.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6200
     * @tc.name testUint16Arraypropertyone062
     * @tc.desc Verify single-element FixedArray constructor stores one converted value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: FixedArray<number> = [65537.9];
      const a: Uint16Array = new Uint16Array(s);
      expect(a.join(',')).assertEqual('1');
      expect(a.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6300
     * @tc.name testUint16Arraypropertyone063
     * @tc.desc Verify empty Array constructor creates independent empty storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<int> = [];
      const a: Uint16Array = new Uint16Array(s);
      const other: Uint16Array = new Uint16Array();
      expect(a.length).assertEqual(0);
      expect(a.buffer).not().assertEqual(other.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6400
     * @tc.name testUint16Arraypropertyone064
     * @tc.desc Verify empty copy constructor creates a distinct empty buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Uint16Array = new Uint16Array();
      const a: Uint16Array = new Uint16Array(s);
      expect(a.length).assertEqual(0);
      expect(a.buffer).not().assertEqual(s.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6500
     * @tc.name testUint16Arraypropertyone065
     * @tc.desc Verify zero-byte ArrayBuffer constructor creates an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(0);
      const a: Uint16Array = new Uint16Array(b);
      expect(a.buffer).assertEqual(b);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6600
     * @tc.name testUint16Arraypropertyone066
     * @tc.desc Verify byte offset equal to buffer length creates an empty remainder view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint16Array = new Uint16Array(b, 8);
      expect(a.byteOffset).assertEqual(8);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6700
     * @tc.name testUint16Arraypropertyone067
     * @tc.desc Verify explicit zero length creates an empty view at an interior offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint16Array = new Uint16Array(b, 4, 0);
      expect(a.byteOffset).assertEqual(4);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6800
     * @tc.name testUint16Arraypropertyone068
     * @tc.desc Verify fractional byte offset truncates before alignment validation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint16Array = new Uint16Array(b, 2.9);
      expect(a.byteOffset).assertEqual(2);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_6900
     * @tc.name testUint16Arraypropertyone069
     * @tc.desc Verify odd-sized ArrayBuffer raises RangeError for a full Uint16 view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(7);
      try {
        const a: Uint16Array = new Uint16Array(b);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7000
     * @tc.name testUint16Arraypropertyone070
      * @tc.desc Verify a bounded view retains its buffer reference and requested dimensions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(7);
      const view: Uint16Array = new Uint16Array(buffer, 2, 2);
      expect(view.byteOffset).assertEqual(2);
      expect(view.length).assertEqual(2);
      expect(view.byteLength).assertEqual(5);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7100
     * @tc.name testUint16Arraypropertyone071
     * @tc.desc Verify misaligned offset with explicit zero length still raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      try {
        const a: Uint16Array = new Uint16Array(b, 1, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7200
     * @tc.name testUint16Arraypropertyone072
     * @tc.desc Verify explicit length ending exactly at buffer boundary is valid
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const a: Uint16Array = new Uint16Array(b, 4, 4);
      expect(a.byteOffset + a.byteLength).assertEqual(12);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7300
     * @tc.name testUint16Arraypropertyone073
     * @tc.desc Verify explicit undefined offset with finite length starts at zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint16Array = new Uint16Array(b, undefined, 3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7400
     * @tc.name testUint16Arraypropertyone074
     * @tc.desc Verify finite offset with undefined length covers the remainder
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint16Array = new Uint16Array(b, 4, undefined);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7500
     * @tc.name testUint16Arraypropertyone075
     * @tc.desc Verify large but valid length retains exact dimensions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(1024);
      expect(a.length).assertEqual(1024);
      expect(a.byteLength).assertEqual(2048);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7600
     * @tc.name testUint16Arraypropertyone076
     * @tc.desc Verify copy constructor from a nonzero view resets byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const v: Uint16Array = new Uint16Array(b, 2, 3);
      v.set(Uint16Array.of(1, 2, 3));
      const a: Uint16Array = new Uint16Array(v);
      expect(a.byteOffset).assertEqual(0);
      expect(a.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7700
     * @tc.name testUint16Arraypropertyone077
     * @tc.desc Verify ArrayLike ArrayBuffer constructor retains the supplied buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(6);
      const a: Uint16Array = new Uint16Array(b);
      a[2] = 9;
      expect(new Uint16Array(b).join(',')).assertEqual('0,0,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_01_7800
     * @tc.name testUint16Arraypropertyone078
     * @tc.desc Verify constructor preserves source order for an Iterable Number input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertyone078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<Number> = [8.0, 2.0, 5.0];
      const a: Uint16Array = new Uint16Array(s);
      expect(a.join(',')).assertEqual('8,2,5');
    });

  });
}
