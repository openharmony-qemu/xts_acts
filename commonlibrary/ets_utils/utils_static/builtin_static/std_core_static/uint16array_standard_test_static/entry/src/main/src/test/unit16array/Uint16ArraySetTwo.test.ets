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

export default function uint16Array$Set02Test(): void {
  describe('Uint16Array$Set02Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0001
     * @tc.name testUint16ArraySetTwo001
     * @tc.desc Verify indexed set stores the assigned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 42;
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0002
     * @tc.name testUint16ArraySetTwo002
     * @tc.desc Verify indexed set stores the second assigned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 1;
      arr[1] = 2;
      expect(arr.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0003
     * @tc.name testUint16ArraySetTwo003
     * @tc.desc Verify set at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 100;
      expect(arr.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0004
     * @tc.name testUint16ArraySetTwo004
     * @tc.desc Verify set byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(4);
      expect(arr.at(4)).assertEqual(5);
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0005
     * @tc.name testUint16ArraySetTwo005
     * @tc.desc Verify subarray set byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Uint16Array = new Uint16Array(buf, 4, 5);
      let oldOffset: number = arr.byteOffset;
      arr[0] = 100;
      expect(arr.at(0)).assertEqual(100);
      expect(arr.byteOffset).assertEqual(oldOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0006
     * @tc.name testUint16ArraySetTwo006
     * @tc.desc Verify set length byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(8);
      arr[0] = 1;
      arr[7] = 65535;
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(7)).assertEqual(65535);
      expect(arr.length * 2).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0007
     * @tc.name testUint16ArraySetTwo007
     * @tc.desc Verify set BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 42;
      expect(arr.at(0)).assertEqual(42);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0008
     * @tc.name testUint16ArraySetTwo008
     * @tc.desc Verify set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf);
      let oldBuf: ArrayBuffer = arr.buffer;
      arr[0] = 100;
      expect(arr.at(0)).assertEqual(100);
      expect(arr.buffer).assertEqual(oldBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0009
     * @tc.name testUint16ArraySetTwo009
     * @tc.desc Verify set buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf);
      arr[0] = 100;
      expect(arr.at(0)).assertEqual(100);
      expect(arr.buffer.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0010
     * @tc.name testUint16ArraySetTwo010
     * @tc.desc Verify set ArrayBuffer.isView(arr) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 100;
      expect(arr.at(0)).assertEqual(100);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0011
     * @tc.name testUint16ArraySetTwo011
     * @tc.desc Verify set ArrayBuffer.isView(arr.buffer) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 100;
      expect(arr.at(0)).assertEqual(100);
      expect(ArrayBuffer.isView(arr.buffer)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0012
     * @tc.name testUint16ArraySetTwo012
     * @tc.desc Verify set DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf);
      let view: DataView = new DataView(buf);
      arr[0] = 65535;
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0013
     * @tc.name testUint16ArraySetTwo013
     * @tc.desc Verify set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf);
      let arr2: Uint16Array = new Uint16Array(buf);
      arr[0] = 50000;
      expect(arr2.at(0)).assertEqual(50000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0014
     * @tc.name testUint16ArraySetTwo014
     * @tc.desc Verify set index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr[0] = 99;
      expect(arr.at(0)).assertEqual(99);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0015
     * @tc.name testUint16ArraySetTwo015
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr[2] = 99;
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0016
     * @tc.name testUint16ArraySetTwo016
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300, 400, 500]);
      arr[2] = 999;
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(2)).assertEqual(999);
      expect(arr.at(3)).assertEqual(400);
      expect(arr.at(4)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0017
     * @tc.name testUint16ArraySetTwo017
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(4);
      arr[0] = 10;
      arr[2] = 20;
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(20);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0018
     * @tc.name testUint16ArraySetTwo018
     * @tc.desc Verify repeated writes to the same index retain the latest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 1;
      arr[0] = 2;
      arr[0] = 3;
      expect(arr.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0019
     * @tc.name testUint16ArraySetTwo019
     * @tc.desc Verify 0xFFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 0xFFFFF;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0020
     * @tc.name testUint16ArraySetTwo020
     * @tc.desc Verify 0b10000000000000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 0b10000000000000000;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0021
     * @tc.name testUint16ArraySetTwo021
     * @tc.desc Verify 0b11111111111111111 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 0b11111111111111111;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0022
     * @tc.name testUint16ArraySetTwo022
     * @tc.desc Verify 1e6 16960
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 1e6;
      expect(arr.at(0)).assertEqual(16960);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0023
     * @tc.name testUint16ArraySetTwo023
     * @tc.desc Verify 1e7 38528
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 1e7;
      expect(arr.at(0)).assertEqual(38528);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0024
     * @tc.name testUint16ArraySetTwo024
     * @tc.desc Verify -0xFFFF 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -0xFFFF;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0025
     * @tc.name testUint16ArraySetTwo025
     * @tc.desc Verify -0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -0x10000;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0026
     * @tc.name testUint16ArraySetTwo026
     * @tc.desc Verify -0b1111111111111111 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -0b1111111111111111;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0027
     * @tc.name testUint16ArraySetTwo027
     * @tc.desc Verify -1e4 55536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -1e4;
      expect(arr.at(0)).assertEqual(55536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0028
     * @tc.name testUint16ArraySetTwo028
     * @tc.desc Verify -1.5 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -1.5;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0029
     * @tc.name testUint16ArraySetTwo029
     * @tc.desc Verify -2.5 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -2.5;
      expect(arr.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0030
     * @tc.name testUint16ArraySetTwo030
     * @tc.desc Verify -32768.5 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -32768.5;
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0031
     * @tc.name testUint16ArraySetTwo031
     * @tc.desc Verify 0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 0.0;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0032
     * @tc.name testUint16ArraySetTwo032
     * @tc.desc Verify 3.14159 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 3.14159;
      expect(arr.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0033
     * @tc.name testUint16ArraySetTwo033
     * @tc.desc Verify -0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -0.0;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0034
     * @tc.name testUint16ArraySetTwo034
     * @tc.desc Verify 1e-10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 1e-10;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0035
     * @tc.name testUint16ArraySetTwo035
     * @tc.desc Verify 0xFFFFFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 0xFFFFFFFF;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0036
     * @tc.name testUint16ArraySetTwo036
     * @tc.desc Verify 0x100000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 0x100000000;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0037
     * @tc.name testUint16ArraySetTwo037
     * @tc.desc Verify 9007199254740991 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 9007199254740991;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0038
     * @tc.name testUint16ArraySetTwo038
     * @tc.desc Verify -9007199254740991 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -9007199254740991;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0039
     * @tc.name testUint16ArraySetTwo039
     * @tc.desc Verify 1e9 51712
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 1e9;
      expect(arr.at(0)).assertEqual(51712);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0040
     * @tc.name testUint16ArraySetTwo040
     * @tc.desc Verify 2e9 37888
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 2e9;
      expect(arr.at(0)).assertEqual(37888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0041
     * @tc.name testUint16ArraySetTwo041
     * @tc.desc Verify -1e9 13824
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -1e9;
      expect(arr.at(0)).assertEqual(13824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0042
     * @tc.name testUint16ArraySetTwo042
     * @tc.desc Verify -2e9 27648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = -2e9;
      expect(arr.at(0)).assertEqual(27648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0043
     * @tc.name testUint16ArraySetTwo043
     * @tc.desc Verify DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf);
      let view: DataView = new DataView(buf);
      arr[0] = 65536;
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0044
     * @tc.name testUint16ArraySetTwo044
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 0, 0, 0, 0]);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = -1;
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0045
     * @tc.name testUint16ArraySetTwo045
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 0, 0, 0, 0]);
      let sub: Uint16Array = arr.subarray(1, 4);
      arr[2] = -1;
      expect(sub.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0046
     * @tc.name testUint16ArraySetTwo046
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr1: Uint16Array = new Uint16Array(buf);
      let arr2: Uint16Array = new Uint16Array(buf);
      arr1[0] = 65537;
      expect(arr2.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0047
     * @tc.name testUint16ArraySetTwo047
     * @tc.desc Verify writing a wrapped value and then zero updates the indexed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 65536;
      expect(arr.at(0)).assertEqual(0);
      arr[0] = 0;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0048
     * @tc.name testUint16ArraySetTwo048
     * @tc.desc Verify writes to the first and last indices preserve both wrapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 65536;
      arr[4] = -1;
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0049
     * @tc.name testUint16ArraySetTwo049
     * @tc.desc Verify DataView offset boundary values 0 1 32767 32768 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer: ArrayBuffer = new ArrayBuffer(16);
      let arr: Uint16Array = new Uint16Array(buffer, 4, 5);
      arr[0] = 0;
      arr[1] = 1;
      arr[2] = 32767;
      arr[3] = 32768;
      arr[4] = 65535;
      let view: DataView = new DataView(buffer);
      expect(view.getUint16(4, true)).assertEqual(0);
      expect(view.getUint16(6, true)).assertEqual(1);
      expect(view.getUint16(8, true)).assertEqual(32767);
      expect(view.getUint16(10, true)).assertEqual(32768);
      expect(view.getUint16(12, true)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0050
     * @tc.name testUint16ArraySetTwo050
     * @tc.desc Verify subarray shared buffer 32768 65535 -1 wraps to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 0, 0, 0, 0, 0]);
      let sub: Uint16Array = arr.subarray(2, 5);
      sub[0] = 32768;
      sub[1] = 65535;
      sub[2] = -1;
      expect(arr.at(2)).assertEqual(32768);
      expect(arr.at(3)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0051
     * @tc.name testUint16ArraySetTwo051
     * @tc.desc Verify indexed set write through an offset view updates the backing array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
      view[0] = 20;
      expect(all.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0052
     * @tc.name testUint16ArraySetTwo052
     * @tc.desc Verify indexed set write through the backing array updates an offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
      all[2] = 30;
      expect(view.at(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0053
     * @tc.name testUint16ArraySetTwo053
     * @tc.desc Verify indexed set overlapping views expose a shared middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let first: Uint16Array = new Uint16Array(buffer, 0, 3);
      let second: Uint16Array = new Uint16Array(buffer, 2, 3);
      first[1] = 55;
      expect(second.at(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0054
     * @tc.name testUint16ArraySetTwo054
     * @tc.desc Verify indexed set writing the last view element uses a view-relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(10);
      let view: Uint16Array = new Uint16Array(buffer, 4, 2);
      view[1] = 77;
      let all: Uint16Array = new Uint16Array(buffer);
      expect(all.at(3)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0055
     * @tc.name testUint16ArraySetTwo055
     * @tc.desc Verify indexed set writing zero preserves length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[1] = 0;
      expect(arr.at(1)).assertEqual(0);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0056
     * @tc.name testUint16ArraySetTwo056
     * @tc.desc Verify indexed set writing maximum preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(10);
      let view: Uint16Array = new Uint16Array(buffer, 2, 3);
      view[0] = 65535;
      expect(view.at(0)).assertEqual(65535);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0057
     * @tc.name testUint16ArraySetTwo057
     * @tc.desc Verify indexed set multiple writes to distinct indices do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 11;
      arr[2] = 33;
      expect(arr.at(0)).assertEqual(11);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0058
     * @tc.name testUint16ArraySetTwo058
     * @tc.desc Verify indexed set write is visible through DataView read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buffer);
      arr[0] = 1234;
      let view: DataView = new DataView(buffer);
      expect(view.getUint16(0, true)).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0059
     * @tc.name testUint16ArraySetTwo059
     * @tc.desc Verify indexed set indexed write is visible through DataView little endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buffer);
      arr[1] = 4321;
      let view: DataView = new DataView(buffer);
      expect(view.getUint16(2, true)).assertEqual(4321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0060
     * @tc.name testUint16ArraySetTwo060
     * @tc.desc Verify indexed set fractional write truncates before sharing with alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(2);
      let first: Uint16Array = new Uint16Array(buffer);
      let second: Uint16Array = new Uint16Array(buffer);
      first[0] = 8.9;
      expect(second.at(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0061
     * @tc.name testUint16ArraySetTwo061
     * @tc.desc Verify indexed set negative write wraps before sharing with alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(2);
      let first: Uint16Array = new Uint16Array(buffer);
      let second: Uint16Array = new Uint16Array(buffer);
      first[0] = -2;
      expect(second.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0062
     * @tc.name testUint16ArraySetTwo062
     * @tc.desc Verify indexed set write above maximum wraps before sharing with alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(2);
      let first: Uint16Array = new Uint16Array(buffer);
      let second: Uint16Array = new Uint16Array(buffer);
      first[0] = 65538;
      expect(second.at(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0063
     * @tc.name testUint16ArraySetTwo063
     * @tc.desc Verify offset DataView and Uint16Array views use matching relative byte positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(12);
      let dataView: DataView = new DataView(buffer, 4, 4);
      let typedView: Uint16Array = new Uint16Array(buffer, 4, 2);
      dataView.setUint16(0, 0x1234, true);
      expect(typedView.at(0)).assertEqual(0x1234);
      typedView[1] = 0xABCD;
      expect(dataView.getUint16(2, true)).assertEqual(0xABCD);
      expect(new Uint16Array(buffer).at(1)).assertEqual(0);
      expect(new Uint16Array(buffer).at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_TWO_0064
     * @tc.name testUint16ArraySetTwo064
     * @tc.desc Verify an out-of-range write on an offset view cannot modify a backing element outside the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 2);
      try {
        view[2] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(backing.at(3)).assertEqual(40);
      expect(view.length).assertEqual(2);
    });

  });
}
