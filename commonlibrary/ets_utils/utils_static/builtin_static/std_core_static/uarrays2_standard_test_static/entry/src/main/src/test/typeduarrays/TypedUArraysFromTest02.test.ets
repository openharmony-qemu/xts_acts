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

export default function typedUArraysFromTest02(): void {
  describe('TypedUArraysFromTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0100
     * @tc.name testTypedUArraysFrom01_001
     * @tc.desc Verify Uint8Array.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(0, 1, 255);
      let result = Uint8Array.from(source);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0200
     * @tc.name testTypedUArraysFrom01_002
     * @tc.desc Verify Uint8Array.from instanceof Uint8Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(10, 20, 30);
      let result = Uint8Array.from(source);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0300
     * @tc.name testTypedUArraysFrom01_003
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(17, 85, 170);
      let result = Uint8Array.from(source);
      const val0 = result[0];
      expect(val0).assertEqual(17);
      const val1 = result[1];
      expect(val1).assertEqual(85);
      const val2 = result[2];
      expect(val2).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0400
     * @tc.name testTypedUArraysFrom01_004
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0500
     * @tc.name testTypedUArraysFrom01_005
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(5, 10, 15);
      let result = Uint8Array.from(source);
      const val3 = source[0];
      expect(val3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0600
     * @tc.name testTypedUArraysFrom01_006
     * @tc.desc Verify Uint8Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3, 4, 5);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0700
     * @tc.name testTypedUArraysFrom01_007
     * @tc.desc Verify Uint8Array.from byteLength length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3, 4);
      let result = Uint8Array.from(source);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0800
     * @tc.name testTypedUArraysFrom01_008
     * @tc.desc Verify Uint8Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(10, 20);
      let result = Uint8Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0900
     * @tc.name testTypedUArraysFrom01_009
     * @tc.desc Verify Uint8Array.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array(0);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1000
     * @tc.name testTypedUArraysFrom01_010
     * @tc.desc Verify Uint8Array.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array(0);
      let result = Uint8Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1100
     * @tc.name testTypedUArraysFrom01_011
     * @tc.desc Verify Uint8Array.from length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(42);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1200
     * @tc.name testTypedUArraysFrom01_012
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(99);
      let result = Uint8Array.from(source);
      const val4 = result[0];
      expect(val4).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1300
     * @tc.name testTypedUArraysFrom01_013
     * @tc.desc Verify Uint8Array.from 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(255);
      let result = Uint8Array.from(source);
      const val5 = result[0];
      expect(val5).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1400
     * @tc.name testTypedUArraysFrom01_014
     * @tc.desc Verify Uint8Array.from 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(0xFF);
      let result = Uint8Array.from(source);
      const val6 = result[0];
      expect(val6).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1500
     * @tc.name testTypedUArraysFrom01_015
     * @tc.desc Verify Uint8Array.from 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(0x80);
      let result = Uint8Array.from(source);
      const val7 = result[0];
      expect(val7).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1600
     * @tc.name testTypedUArraysFrom01_016
     * @tc.desc Verify Uint8Array.from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(0, 0, 0, 0);
      let result = Uint8Array.from(source);
      const val8 = result[0];
      expect(val8).assertEqual(0);
      const val9 = result[3];
      expect(val9).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1700
     * @tc.name testTypedUArraysFrom01_017
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(7, 7, 7, 7, 7);
      let result = Uint8Array.from(source);
      const val10 = result[0];
      expect(val10).assertEqual(7);
      const val11 = result[4];
      expect(val11).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1800
     * @tc.name testTypedUArraysFrom01_018
     * @tc.desc Verify Uint8Array.from length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_1900
     * @tc.name testTypedUArraysFrom01_019
     * @tc.desc Verify Uint8Array.from byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
      let result = Uint8Array.from(source);
      expect(result.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2000
     * @tc.name testTypedUArraysFrom01_020
     * @tc.desc Verify Uint8Array.from hasOwnProperty length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(result.hasOwnProperty('length')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2100
     * @tc.name testTypedUArraysFrom01_021
     * @tc.desc Verify Uint8Array.from constructor Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2200
     * @tc.name testTypedUArraysFrom01_022
     * @tc.desc Verify Uint8Array.from BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2300
     * @tc.name testTypedUArraysFrom01_023
     * @tc.desc Verify Uint8Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2400
     * @tc.name testTypedUArraysFrom01_024
     * @tc.desc Verify Uint8Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(10, 20, 30);
      let result = Uint8Array.from(source, (v: number, k: number): number => k >= 0 ? v * 2 : v * 2);
      const val12 = source[0];
      expect(val12).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2500
     * @tc.name testTypedUArraysFrom01_025
     * @tc.desc Verify Uint16Array.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(0, 1, 65535);
      let result = Uint16Array.from(source);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2600
     * @tc.name testTypedUArraysFrom01_026
     * @tc.desc Verify Uint16Array.from instanceof Uint16Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(100, 200, 300);
      let result = Uint16Array.from(source);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(Uint16Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2700
     * @tc.name testTypedUArraysFrom01_027
     * @tc.desc Verify Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(17, 85, 170, 255);
      let result = Uint16Array.from(source);
      const val13 = result[0];
      expect(val13).assertEqual(17);
      const val14 = result[1];
      expect(val14).assertEqual(85);
      const val15 = result[2];
      expect(val15).assertEqual(170);
      const val16 = result[3];
      expect(val16).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2800
     * @tc.name testTypedUArraysFrom01_028
     * @tc.desc Verify Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(5, 10, 15);
      let result = Uint16Array.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_2900
     * @tc.name testTypedUArraysFrom01_029
     * @tc.desc Verify Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source);
      const val17 = source[0];
      expect(val17).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3000
     * @tc.name testTypedUArraysFrom01_030
     * @tc.desc Verify Uint16Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3, 4, 5, 6);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3100
     * @tc.name testTypedUArraysFrom01_031
     * @tc.desc Verify Uint16Array.from byteLength length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3, 4);
      let result = Uint16Array.from(source);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3200
     * @tc.name testTypedUArraysFrom01_032
     * @tc.desc Verify Uint16Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(10, 20);
      let result = Uint16Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3300
     * @tc.name testTypedUArraysFrom01_033
     * @tc.desc Verify Uint16Array.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint16Array(0);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3400
     * @tc.name testTypedUArraysFrom01_034
     * @tc.desc Verify Uint16Array.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint16Array(0);
      let result = Uint16Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3500
     * @tc.name testTypedUArraysFrom01_035
     * @tc.desc Verify Uint16Array.from 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(65535);
      let result = Uint16Array.from(source);
      const val18 = result[0];
      expect(val18).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3600
     * @tc.name testTypedUArraysFrom01_036
     * @tc.desc Verify Uint16Array.from 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(0xFFFF);
      let result = Uint16Array.from(source);
      const val19 = result[0];
      expect(val19).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3700
     * @tc.name testTypedUArraysFrom01_037
     * @tc.desc Verify Uint16Array.from 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(0x8000);
      let result = Uint16Array.from(source);
      const val20 = result[0];
      expect(val20).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3800
     * @tc.name testTypedUArraysFrom01_038
     * @tc.desc Verify Uint16Array.from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(0, 0, 0);
      let result = Uint16Array.from(source);
      const val21 = result[0];
      expect(val21).assertEqual(0);
      const val22 = result[2];
      expect(val22).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_3900
     * @tc.name testTypedUArraysFrom01_039
     * @tc.desc Verify Uint16Array.from constructor Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4000
     * @tc.name testTypedUArraysFrom01_040
     * @tc.desc Verify Uint16Array.from BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2);
      let result = Uint16Array.from(source);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4100
     * @tc.name testTypedUArraysFrom01_041
     * @tc.desc Verify Uint16Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(10, 20, 30);
      let result = Uint16Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4200
     * @tc.name testTypedUArraysFrom01_042
     * @tc.desc Verify Uint16Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(100, 200, 300);
      let result = Uint16Array.from(source, (v: number, k: number): number => k >= 0 ? v * 2 : v * 2);
      const val23 = source[0];
      expect(val23).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4300
     * @tc.name testTypedUArraysFrom01_043
     * @tc.desc Verify Uint16Array.from mapfn byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source, (v: number, k: number): number => k >= 0 ? v : v);
      expect(result.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4400
     * @tc.name testTypedUArraysFrom01_044
     * @tc.desc Verify Uint16Array.from mapfn byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(5, 10);
      let result = Uint16Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4500
     * @tc.name testTypedUArraysFrom01_045
     * @tc.desc Verify Uint32Array.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(0, 1, 4294967295);
      let result = Uint32Array.from(source);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4600
     * @tc.name testTypedUArraysFrom01_046
     * @tc.desc Verify Uint32Array.from instanceof Uint32Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1000, 2000, 3000);
      let result = Uint32Array.from(source);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(Uint32Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4700
     * @tc.name testTypedUArraysFrom01_047
     * @tc.desc Verify Uint32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(17, 85, 170, 255, 512);
      let result = Uint32Array.from(source);
      const val24 = result[0];
      expect(val24).assertEqual(17);
      const val25 = result[2];
      expect(val25).assertEqual(170);
      const val26 = result[4];
      expect(val26).assertEqual(512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4800
     * @tc.name testTypedUArraysFrom01_048
     * @tc.desc Verify Uint32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(5, 10, 15);
      let result = Uint32Array.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_4900
     * @tc.name testTypedUArraysFrom01_049
     * @tc.desc Verify Uint32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3);
      let result = Uint32Array.from(source);
      const val27 = source[0];
      expect(val27).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5000
     * @tc.name testTypedUArraysFrom01_050
     * @tc.desc Verify Uint32Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4, 5, 6, 7);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(7);
    });

  });
}
