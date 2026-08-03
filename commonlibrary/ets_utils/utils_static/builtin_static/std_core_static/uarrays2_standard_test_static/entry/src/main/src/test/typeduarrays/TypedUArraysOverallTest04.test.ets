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

export default function typedUArraysOverallTest04(): void {
  describe('TypedUArraysOverallTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0100
     * @tc.name testTypedUArraysOverallTestFileD001
     * @tc.desc Verify Uint8ClampedArray 300 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 300;
      const val0 = arr[0];
      expect(val0).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0200
     * @tc.name testTypedUArraysOverallTestFileD002
     * @tc.desc Verify Uint8ClampedArray 255.5 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 255.5;
      const val1 = arr[0];
      expect(val1).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0300
     * @tc.name testTypedUArraysOverallTestFileD003
     * @tc.desc Verify Uint8ClampedArray 0.4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0.4;
      const val2 = arr[0];
      expect(val2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0400
     * @tc.name testTypedUArraysOverallTestFileD004
     * @tc.desc Verify Uint8ClampedArray 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0.5;
      const val3 = arr[0];
      expect(val3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0500
     * @tc.name testTypedUArraysOverallTestFileD005
     * @tc.desc Verify Uint8ClampedArray NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.NaN;
      const val4 = arr[0];
      expect(val4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0600
     * @tc.name testTypedUArraysOverallTestFileD006
     * @tc.desc Verify Uint8ClampedArray Infinity 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.POSITIVE_INFINITY;
      const val5 = arr[0];
      expect(val5).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0700
     * @tc.name testTypedUArraysOverallTestFileD007
     * @tc.desc Verify Uint8ClampedArray -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.NEGATIVE_INFINITY;
      const val6 = arr[0];
      expect(val6).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0800
     * @tc.name testTypedUArraysOverallTestFileD008
     * @tc.desc Verify Uint8Array Uint16Array ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const u8 = new Uint8Array(buf);
      u8[0] = 0x12;
      u8[1] = 0x34;
      const u16 = new Uint16Array(buf);
      const val7 = u16[0];
      expect(val7).assertEqual(0x3412);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_0900
     * @tc.name testTypedUArraysOverallTestFileD009
     * @tc.desc Verify Uint16Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const u16 = new Uint16Array(buf);
      u16[0] = 0x1234;
      const u8 = new Uint8Array(buf);
      const val8 = u8[0];
      expect(val8).assertEqual(0x34);
      const val9 = u8[1];
      expect(val9).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_1000
     * @tc.name testTypedUArraysOverallTestFileD010
     * @tc.desc Verify Uint8Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const u8 = new Uint8Array(buf);
      u8[0] = 0x11;
      u8[1] = 0x22;
      u8[2] = 0x33;
      u8[3] = 0x44;
      const u32 = new Uint32Array(buf);
      const val10 = u32[0];
      expect(val10).assertEqual(0x44332211);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_1100
     * @tc.name testTypedUArraysOverallTestFileD011
     * @tc.desc Verify Uint32Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const u32 = new Uint32Array(buf);
      u32[0] = 0x11223344;
      const u8 = new Uint8Array(buf);
      const val11 = u8[0];
      expect(val11).assertEqual(0x44);
      const val12 = u8[1];
      expect(val12).assertEqual(0x33);
      const val13 = u8[2];
      expect(val13).assertEqual(0x22);
      const val14 = u8[3];
      expect(val14).assertEqual(0x11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_1200
     * @tc.name testTypedUArraysOverallTestFileD012
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      sub[0] = 100;
      const val15 = arr[1];
      expect(val15).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_1300
     * @tc.name testTypedUArraysOverallTestFileD013
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      arr[2] = 200;
      const val16 = sub[1];
      expect(val16).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_1400
     * @tc.name testTypedUArraysOverallTestFileD014
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub1 = arr.subarray(0, 3);
      const sub2 = arr.subarray(2, 5);
      sub1[2] = 99;
      const val17 = sub2[0];
      expect(val17).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_1500
     * @tc.name testTypedUArraysOverallTestFileD015
     * @tc.desc Verify Uint8Array Uint8ClampedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const u8 = new Uint8Array(buf);
      u8[0] = 0x12;
      const u8c = new Uint8ClampedArray(buf);
      const val18 = u8c[0];
      expect(val18).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_1600
     * @tc.name testTypedUArraysOverallTestFileD016
     * @tc.desc Verify ArrayBuffer offset Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 4, 2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0202_1700
     * @tc.name testTypedUArraysOverallTestFileD017
     * @tc.desc Verify ArrayBuffer offset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverallTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 2, 4);
      expect(arr.length).assertEqual(4);
      expect(arr.byteOffset).assertEqual(2);
    });

  });
}
