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

export default function typedUArraysValuesTest01(): void {
  describe('TypedUArraysValuesTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0100
     * @tc.name testTypedUArraysValuesPart101_001
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0200
     * @tc.name testTypedUArraysValuesPart101_002
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0300
     * @tc.name testTypedUArraysValuesPart101_003
     * @tc.desc Verify Uint8Array values() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const it = arr.values();
      let result = it.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0400
     * @tc.name testTypedUArraysValuesPart101_004
     * @tc.desc Verify Uint8Array [0]values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0500
     * @tc.name testTypedUArraysValuesPart101_005
     * @tc.desc Verify Uint8Array [1]values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0600
     * @tc.name testTypedUArraysValuesPart101_006
     * @tc.desc Verify Uint8Array [127]values() 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0700
     * @tc.name testTypedUArraysValuesPart101_007
     * @tc.desc Verify Uint8Array [255]values() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0800
     * @tc.name testTypedUArraysValuesPart101_008
     * @tc.desc Verify Uint8Array [0xFF]values() 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0900
     * @tc.name testTypedUArraysValuesPart101_009
     * @tc.desc Verify Uint8Array [0x80]values() 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x80]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0x80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1000
     * @tc.name testTypedUArraysValuesPart101_010
     * @tc.desc Verify Uint8Array [1,2,3]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(1);
      expect(r2.value).assertEqual(2);
      expect(r3.value).assertEqual(3);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1100
     * @tc.name testTypedUArraysValuesPart101_011
     * @tc.desc Verify Uint8Array [0,255,0]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 255, 0]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(255);
      expect(r3.value).assertEqual(0);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1200
     * @tc.name testTypedUArraysValuesPart101_012
     * @tc.desc Verify Uint8Array [0x01,0xFF,0x80]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x01, 0xFF, 0x80]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0x01);
      expect(r2.value).assertEqual(0xFF);
      expect(r3.value).assertEqual(0x80);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1300
     * @tc.name testTypedUArraysValuesPart101_013
     * @tc.desc Verify Uint8Array values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(0);
      expect(r3.value).assertEqual(0);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1400
     * @tc.name testTypedUArraysValuesPart101_014
     * @tc.desc Verify Uint8Array 255 values() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(255);
      expect(r2.value).assertEqual(255);
      expect(r3.value).assertEqual(255);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1500
     * @tc.name testTypedUArraysValuesPart101_015
     * @tc.desc Verify Uint8Array 256 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1600
     * @tc.name testTypedUArraysValuesPart101_016
     * @tc.desc Verify Uint8Array 257 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([257]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1700
     * @tc.name testTypedUArraysValuesPart101_017
     * @tc.desc Verify Uint8Array -1 values() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1800
     * @tc.name testTypedUArraysValuesPart101_018
     * @tc.desc Verify Uint8Array 0x100 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x100]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1900
     * @tc.name testTypedUArraysValuesPart101_019
     * @tc.desc Verify Uint8Array 0x101 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x101]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2000
     * @tc.name testTypedUArraysValuesPart101_020
     * @tc.desc Verify Uint8Array 0xFFFFFFFF values() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2100
     * @tc.name testTypedUArraysValuesPart101_021
     * @tc.desc Verify Uint8ClampedArray 256 values() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2200
     * @tc.name testTypedUArraysValuesPart101_022
     * @tc.desc Verify Uint8ClampedArray -1 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2300
     * @tc.name testTypedUArraysValuesPart101_023
     * @tc.desc Verify Uint8ClampedArray 0x100 values() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x100]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2400
     * @tc.name testTypedUArraysValuesPart101_024
     * @tc.desc Verify Uint16Array [32767]values() 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32767]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2500
     * @tc.name testTypedUArraysValuesPart101_025
     * @tc.desc Verify Uint16Array [65535]values() 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2600
     * @tc.name testTypedUArraysValuesPart101_026
     * @tc.desc Verify Uint16Array [0xFFFF]values() 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2700
     * @tc.name testTypedUArraysValuesPart101_027
     * @tc.desc Verify Uint16Array [0x8000]values() 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x8000]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0x8000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2800
     * @tc.name testTypedUArraysValuesPart101_028
     * @tc.desc Verify Uint16Array [0,65535,0]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 65535, 0]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(65535);
      expect(r3.value).assertEqual(0);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2900
     * @tc.name testTypedUArraysValuesPart101_029
     * @tc.desc Verify Uint16Array [0x01,0xFFFF,0x8000]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x01, 0xFFFF, 0x8000]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0x01);
      expect(r2.value).assertEqual(0xFFFF);
      expect(r3.value).assertEqual(0x8000);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3000
     * @tc.name testTypedUArraysValuesPart101_030
     * @tc.desc Verify Uint16Array 65535 values() 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65535, 65535]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(65535);
      expect(r2.value).assertEqual(65535);
      expect(r3.value).assertEqual(65535);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3100
     * @tc.name testTypedUArraysValuesPart101_031
     * @tc.desc Verify Uint16Array 65536 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3200
     * @tc.name testTypedUArraysValuesPart101_032
     * @tc.desc Verify Uint16Array 65537 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65537]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3300
     * @tc.name testTypedUArraysValuesPart101_033
     * @tc.desc Verify BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3400
     * @tc.name testTypedUArraysValuesPart101_034
     * @tc.desc Verify BYTES_PER_ELEMENT Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3500
     * @tc.name testTypedUArraysValuesPart101_035
     * @tc.desc Verify byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3600
     * @tc.name testTypedUArraysValuesPart101_036
     * @tc.desc Verify byteLength Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3700
     * @tc.name testTypedUArraysValuesPart101_037
     * @tc.desc Verify byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      expect(arr.byteLength).assertEqual(6);
    });

  });
}
