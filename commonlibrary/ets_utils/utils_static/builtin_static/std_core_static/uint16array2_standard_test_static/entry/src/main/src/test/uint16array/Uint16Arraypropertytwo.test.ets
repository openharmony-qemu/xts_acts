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

export default function uint16ArraypropertytwoTest(): void {
  describe('Uint16Arraypropertytwo', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0100
     * @tc.name testUint16Arraypropertytwo001
      * @tc.desc Verify a zero decimal length creates an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0.0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0200
     * @tc.name testUint16Arraypropertytwo002
      * @tc.desc Verify a fractional length is truncated to three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(3.14);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0300
     * @tc.name testUint16Arraypropertytwo003
      * @tc.desc Verify a truncated fractional length allocates six bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(3.14);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0400
     * @tc.name testUint16Arraypropertytwo004
      * @tc.desc Verify a second fractional length truncates to two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(2.9);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0500
     * @tc.name testUint16Arraypropertytwo005
      * @tc.desc Verify two truncated elements occupy four bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(2.9);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0600
     * @tc.name testUint16Arraypropertytwo006
      * @tc.desc Verify a hexadecimal length literal creates sixteen elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0x10);
      expect(arr.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0700
     * @tc.name testUint16Arraypropertytwo007
      * @tc.desc Verify a hexadecimal length literal allocates thirty-two bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0x10);
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0800
     * @tc.name testUint16Arraypropertytwo008
      * @tc.desc Verify an octal length literal creates eight elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0o10);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_0900
     * @tc.name testUint16Arraypropertytwo009
      * @tc.desc Verify a binary length literal creates ten elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0b1010);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1000
     * @tc.name testUint16Arraypropertytwo010
      * @tc.desc Verify an exponential length literal creates ten elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(1e1);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1100
     * @tc.name testUint16Arraypropertytwo011
      * @tc.desc Verify an explicit zero buffer offset is retained
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1200
     * @tc.name testUint16Arraypropertytwo012
      * @tc.desc Verify an aligned two-byte buffer offset is retained
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1300
     * @tc.name testUint16Arraypropertytwo013
      * @tc.desc Verify an aligned four-byte buffer offset is retained
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1400
     * @tc.name testUint16Arraypropertytwo014
      * @tc.desc Verify an aligned boundary-near offset is retained
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 6);
      expect(arr.byteOffset).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1500
     * @tc.name testUint16Arraypropertytwo015
      * @tc.desc Verify a decimal zero offset is normalized to the origin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1600
     * @tc.name testUint16Arraypropertytwo016
      * @tc.desc Verify a fractional aligned offset is truncated before use
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2.9);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1700
     * @tc.name testUint16Arraypropertytwo017
      * @tc.desc Verify an integral decimal offset is retained
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 4.0);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1800
     * @tc.name testUint16Arraypropertytwo018
      * @tc.desc Verify omitted offset and length default to the buffer origin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, undefined, undefined);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_1900
     * @tc.name testUint16Arraypropertytwo019
      * @tc.desc Verify omitted offset and length span the entire buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, undefined, undefined);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2000
     * @tc.name testUint16Arraypropertytwo020
      * @tc.desc Verify omitted view bounds expose the full buffer byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, undefined, undefined);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2100
     * @tc.name testUint16Arraypropertytwo021
      * @tc.desc Verify a hexadecimal byte offset is retained
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Uint16Array = new Uint16Array(buf, 0x10);
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2200
     * @tc.name testUint16Arraypropertytwo022
      * @tc.desc Verify an explicit zero-length view contains no elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2300
     * @tc.name testUint16Arraypropertytwo023
      * @tc.desc Verify an explicit zero-length view occupies no bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2400
     * @tc.name testUint16Arraypropertytwo024
      * @tc.desc Verify a one-element bounded view reports one element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2500
     * @tc.name testUint16Arraypropertytwo025
      * @tc.desc Verify a one-element bounded view occupies two bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 1);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2600
     * @tc.name testUint16Arraypropertytwo026
      * @tc.desc Verify a bounded view retains its two-byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2700
     * @tc.name testUint16Arraypropertytwo027
      * @tc.desc Verify a bounded view reports its two requested elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2800
     * @tc.name testUint16Arraypropertytwo028
      * @tc.desc Verify a two-element bounded view occupies four bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_2900
     * @tc.name testUint16Arraypropertytwo029
      * @tc.desc Verify a full eight-byte buffer view contains four elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3000
     * @tc.name testUint16Arraypropertytwo030
      * @tc.desc Verify a four-element bounded view occupies eight bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 0, 4);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3100
     * @tc.name testUint16Arraypropertytwo031
      * @tc.desc Verify an empty FixedArray produces an empty typed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3200
     * @tc.name testUint16Arraypropertytwo032
      * @tc.desc Verify an empty FixedArray produces a zero-byte view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3300
     * @tc.name testUint16Arraypropertytwo033
      * @tc.desc Verify a single FixedArray value produces one typed element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [5];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3400
     * @tc.name testUint16Arraypropertytwo034
      * @tc.desc Verify one copied FixedArray value occupies two bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [5];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3500
     * @tc.name testUint16Arraypropertytwo035
      * @tc.desc Verify a two-value FixedArray including the Uint16 maximum keeps its length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0, 0xFFFF];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3600
     * @tc.name testUint16Arraypropertytwo036
      * @tc.desc Verify two copied FixedArray values occupy four bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0, 0xFFFF];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3700
     * @tc.name testUint16Arraypropertytwo037
      * @tc.desc Verify an Array copy is allocated at byte offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [1, 2, 3, 4, 5];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3800
     * @tc.name testUint16Arraypropertytwo038
      * @tc.desc Verify a zero-byte buffer creates a zero-byte view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(new ArrayBuffer(0));
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_3900
     * @tc.name testUint16Arraypropertytwo039
      * @tc.desc Verify a ten-byte buffer creates five Uint16 elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(new ArrayBuffer(10));
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4000
     * @tc.name testUint16Arraypropertytwo040
      * @tc.desc Verify byte length remains twice the element count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(15);
      expect(arr.byteLength).assertEqual(arr.length * 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4100
     * @tc.name testUint16Arraypropertytwo041
      * @tc.desc Verify a length-created instance reports the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(3);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4200
     * @tc.name testUint16Arraypropertytwo042
      * @tc.desc Verify empty, length, and factory instances share the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array();
      const b: Uint16Array = new Uint16Array(5);
      const c: Uint16Array = Uint16Array.of(1, 2);
      expect(a.name).assertEqual('Uint16Array');
      expect(b.name).assertEqual('Uint16Array');
      expect(c.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4300
     * @tc.name testUint16Arraypropertytwo043
      * @tc.desc Verify a bounded view reports both backing and view byte lengths
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(arr.buffer.byteLength).assertEqual(8);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4400
     * @tc.name testUint16Arraypropertytwo044
      * @tc.desc Verify disjoint views retain one shared buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const v1: Uint16Array = new Uint16Array(buf, 0, 2);
      const v2: Uint16Array = new Uint16Array(buf, 4, 2);
      expect(v1.buffer).assertEqual(v2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4500
     * @tc.name testUint16Arraypropertytwo045
      * @tc.desc Verify sibling views retain their distinct byte offsets
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const v1: Uint16Array = new Uint16Array(buf, 0, 2);
      const v2: Uint16Array = new Uint16Array(buf, 4, 2);
      expect(v1.byteOffset).assertEqual(0);
      expect(v2.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4600
     * @tc.name testUint16Arraypropertytwo046
      * @tc.desc Verify sibling views report byte lengths from their element counts
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const v1: Uint16Array = new Uint16Array(buf, 0, 3);
      const v2: Uint16Array = new Uint16Array(buf, 6, 1);
      expect(v1.byteLength).assertEqual(6);
      expect(v2.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4700
     * @tc.name testUint16Arraypropertytwo047
      * @tc.desc Verify sibling views report their independent element counts
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const v1: Uint16Array = new Uint16Array(buf, 0, 3);
      const v2: Uint16Array = new Uint16Array(buf, 6, 1);
      expect(v1.length).assertEqual(3);
      expect(v2.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4800
     * @tc.name testUint16Arraypropertytwo048
     * @tc.desc Verify little-endian DataView write is read as 0x1234
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint16Array = new Uint16Array(buf, 0, 2);
      const view: DataView = new DataView(buf);
      view.setUint16(0, 0x1234, true);
      expect(arr[0]).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_4900
     * @tc.name testUint16Arraypropertytwo049
      * @tc.desc Verify factory and buffer-created arrays own separate storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ofArr: Uint16Array = Uint16Array.of(1, 2);
      const bufArr: Uint16Array = new Uint16Array(new ArrayBuffer(4));
      expect(ofArr.buffer).not().assertEqual(bufArr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5000
     * @tc.name testUint16Arraypropertytwo050
      * @tc.desc Verify from-created and length-created arrays own separate storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromArr: Uint16Array = Uint16Array.from([1, 2]);
      const manualArr: Uint16Array = new Uint16Array(2);
      expect(fromArr.buffer).not().assertEqual(manualArr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5100
     * @tc.name testUint16Arraypropertytwo051
     * @tc.desc Verify constructor converts negative and overflow integers exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array([-1, -2, 65536, 65537]);
      expect(a.join(',')).assertEqual('65535,65534,0,1');
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5200
     * @tc.name testUint16Arraypropertytwo052
     * @tc.desc Verify constructor truncates positive and negative fractions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array([1.9, 2.1, -0.9, -2.9]);
      expect(a.join(',')).assertEqual('1,2,0,65534');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5300
     * @tc.name testUint16Arraypropertytwo053
     * @tc.desc Verify constructor converts nonfinite numbers to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      expect(a.join(',')).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5400
     * @tc.name testUint16Arraypropertytwo054
     * @tc.desc Verify Uint16Array of stores exact fixed arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(0, 1, 32768, 65535);
      expect(a.join(',')).assertEqual('0,1,32768,65535');
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5500
     * @tc.name testUint16Arraypropertytwo055
     * @tc.desc Verify Uint16Array of converts numeric arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(-1, 65536, 3.9);
      expect(a.join(',')).assertEqual('65535,0,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5600
     * @tc.name testUint16Arraypropertytwo056
     * @tc.desc Verify Uint16Array from FixedArray int copies exact values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: FixedArray<int> = [2, 4, 8];
      const a: Uint16Array = Uint16Array.from(s);
      expect(a.join(',')).assertEqual('2,4,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5700
     * @tc.name testUint16Arraypropertytwo057
     * @tc.desc Verify Uint16Array from Array number applies Uint16 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [-1.2, 65537.8, 7.9];
      const a: Uint16Array = Uint16Array.from(s);
      expect(a.join(',')).assertEqual('65535,1,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5800
     * @tc.name testUint16Arraypropertytwo058
     * @tc.desc Verify Uint16Array from typed array allocates independent storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Uint16Array = Uint16Array.of(1, 2, 3);
      const a: Uint16Array = Uint16Array.from(s);
      a[0] = 9;
      expect(s.join(',')).assertEqual('1,2,3');
      expect(a.join(',')).assertEqual('9,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_5900
     * @tc.name testUint16Arraypropertytwo059
     * @tc.desc Verify Uint16Array from iterable applies map function by index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [10, 20, 30];
      const a: Uint16Array = Uint16Array.from(s, (v: number, i: number): number => v + i);
      expect(a.join(',')).assertEqual('10,21,32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6000
     * @tc.name testUint16Arraypropertytwo060
     * @tc.desc Verify Uint16Array from map function results undergo Uint16 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [1, 2, 3];
      const a: Uint16Array = Uint16Array.from(s, (v: number, i: number): number => i === 0 ? -1 : 65536 + v);
      expect(a.join(',')).assertEqual('65535,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6100
     * @tc.name testUint16Arraypropertytwo061
     * @tc.desc Verify Uint16Array from empty input yields zero dimensions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [];
      const a: Uint16Array = Uint16Array.from(s);
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6200
     * @tc.name testUint16Arraypropertytwo062
     * @tc.desc Verify of single argument preserves Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(65535);
      expect(a[0]).assertEqual(65535);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6300
     * @tc.name testUint16Arraypropertytwo063
     * @tc.desc Verify of no arguments returns an empty typed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of();
      expect(a.length).assertEqual(0);
      expect(a.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6400
     * @tc.name testUint16Arraypropertytwo064
     * @tc.desc Verify from source mutation after construction does not affect result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [1, 2, 3];
      const a: Uint16Array = Uint16Array.from(s);
      s[1] = 22;
      expect(a.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6500
     * @tc.name testUint16Arraypropertytwo065
     * @tc.desc Verify constructor source mutation after construction does not affect result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<int> = [4, 5, 6];
      const a: Uint16Array = new Uint16Array(s);
      s[2] = 66;
      expect(a.join(',')).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6600
     * @tc.name testUint16Arraypropertytwo066
     * @tc.desc Verify from map function is called once per element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [1, 2, 3, 4];
      let calls: int = 0;
      const a: Uint16Array = Uint16Array.from(s, (v: number, i: number): number => {
        calls++;
        return v;
      });
      expect(a.join(',')).assertEqual('1,2,3,4');
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6700
     * @tc.name testUint16Arraypropertytwo067
     * @tc.desc Verify from map function receives ascending indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [9, 9, 9];
      let order: int = 0;
      const a: Uint16Array = Uint16Array.from(source, (value: number, index: number): number => {
        order = order * 10 + index.toInt();
        return index;
      });
      expect(a.join(',')).assertEqual('0,1,2');
      expect(order).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6800
     * @tc.name testUint16Arraypropertytwo068
     * @tc.desc Verify from propagates map function Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [1, 2, 3];
      try {
        const a: Uint16Array = Uint16Array.from(s, (v: number, i: number): number => {
          if (i === 1) {
            throw new Error('map stop');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('map stop');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_6900
     * @tc.name testUint16Arraypropertytwo069
     * @tc.desc Verify constructor handles multiple wrap periods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array([131072, 131073, -131073]);
      expect(a.join(',')).assertEqual('0,1,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_7000
     * @tc.name testUint16Arraypropertytwo070
     * @tc.desc Verify from preserves decimal order rather than sorting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.from([10, 2, 30]);
      expect(a.join(',')).assertEqual('10,2,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_7100
     * @tc.name testUint16Arraypropertytwo071
     * @tc.desc Verify of preserves argument order rather than sorting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(30, 2, 10);
      expect(a.join(',')).assertEqual('30,2,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_7200
     * @tc.name testUint16Arraypropertytwo072
     * @tc.desc Verify constructor byte length equals converted element count times two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array([1.1, 2.2, 3.3, 4.4, 5.5]);
      expect(a.join(',')).assertEqual('1,2,3,4,5');
      expect(a.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_7300
     * @tc.name testUint16Arraypropertytwo073
     * @tc.desc Verify from Set int consumes insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(3);
      s.add(1);
      s.add(2);
      const a: Uint16Array = Uint16Array.from(s);
      expect(a.join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_7400
     * @tc.name testUint16Arraypropertytwo074
     * @tc.desc Verify from duplicate source values preserves duplicates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.from([7, 7, 8, 8]);
      expect(a.join(',')).assertEqual('7,7,8,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_1_02_7500
     * @tc.name testUint16Arraypropertytwo075
     * @tc.desc Verify of duplicate arguments preserves duplicates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arraypropertytwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(5, 5, 5);
      expect(a.join(',')).assertEqual('5,5,5');
    });

  });
}
