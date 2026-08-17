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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0100
     * @tc.name testTypedUArraysFromTestFileB001
     * @tc.desc Verify Uint8Array.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(0, 1, 255);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(source[0]);
      expect(result[2]).assertEqual(source[2]);
      expect(result.buffer).not().assertEqual(source.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0200
     * @tc.name testTypedUArraysFromTestFileB002
     * @tc.desc Verify Uint8Array.from instanceof Uint8Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(10, 20, 30);
      let result = Uint8Array.from(source);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0300
     * @tc.name testTypedUArraysFromTestFileB003
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0400
     * @tc.name testTypedUArraysFromTestFileB004
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0500
     * @tc.name testTypedUArraysFromTestFileB005
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(5, 10, 15);
      let result = Uint8Array.from(source);
      const val3 = source[0];
      expect(val3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0600
     * @tc.name testTypedUArraysFromTestFileB006
     * @tc.desc Verify Uint8Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3, 4, 5);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0700
     * @tc.name testTypedUArraysFromTestFileB007
     * @tc.desc Verify Uint8Array.from byteLength length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3, 4);
      let result = Uint8Array.from(source);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0800
     * @tc.name testTypedUArraysFromTestFileB008
     * @tc.desc Verify Uint8Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(10, 20);
      let result = Uint8Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_0900
     * @tc.name testTypedUArraysFromTestFileB009
     * @tc.desc Verify Uint8Array.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array(0);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1000
     * @tc.name testTypedUArraysFromTestFileB010
     * @tc.desc Verify Uint8Array.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array(0);
      let result = Uint8Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1100
     * @tc.name testTypedUArraysFromTestFileB011
     * @tc.desc Verify Uint8Array.from length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(42);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1200
     * @tc.name testTypedUArraysFromTestFileB012
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(99);
      let result = Uint8Array.from(source);
      const val4 = result[0];
      expect(val4).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1300
     * @tc.name testTypedUArraysFromTestFileB013
     * @tc.desc Verify Uint8Array.from 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(255);
      let result = Uint8Array.from(source);
      const val5 = result[0];
      expect(val5).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1400
     * @tc.name testTypedUArraysFromTestFileB014
     * @tc.desc Verify Uint8Array.from 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(0xFF);
      let result = Uint8Array.from(source);
      const val6 = result[0];
      expect(val6).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1500
     * @tc.name testTypedUArraysFromTestFileB015
     * @tc.desc Verify Uint8Array.from 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(0x80);
      let result = Uint8Array.from(source);
      const val7 = result[0];
      expect(val7).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1600
     * @tc.name testTypedUArraysFromTestFileB016
     * @tc.desc Verify Uint8Array.from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(0, 0, 0, 0);
      let result = Uint8Array.from(source);
      const val8 = result[0];
      expect(val8).assertEqual(0);
      const val9 = result[3];
      expect(val9).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1700
     * @tc.name testTypedUArraysFromTestFileB017
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(7, 7, 7, 7, 7);
      let result = Uint8Array.from(source);
      const val10 = result[0];
      expect(val10).assertEqual(7);
      const val11 = result[4];
      expect(val11).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1800
     * @tc.name testTypedUArraysFromTestFileB018
     * @tc.desc Verify Uint8Array.from length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_1900
     * @tc.name testTypedUArraysFromTestFileB019
     * @tc.desc Verify Uint8Array.from byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
      let result = Uint8Array.from(source);
      expect(result.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2000
     * @tc.name testTypedUArraysFromTestFileB020
     * @tc.desc Verify Uint8Array.from hasOwnProperty length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(result.hasOwnProperty('length')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2100
     * @tc.name testTypedUArraysFromTestFileB021
     * @tc.desc Verify Uint8Array.from constructor Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2200
     * @tc.name testTypedUArraysFromTestFileB022
     * @tc.desc Verify Uint8Array.from BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2300
     * @tc.name testTypedUArraysFromTestFileB023
     * @tc.desc Verify Uint8Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2400
     * @tc.name testTypedUArraysFromTestFileB024
     * @tc.desc Verify Uint8Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(10, 20, 30);
      let result = Uint8Array.from(source, (v: number, k: number): number => k >= 0 ? v * 2 : v * 2);
      const val12 = source[0];
      expect(val12).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2500
     * @tc.name testTypedUArraysFromTestFileB025
     * @tc.desc Verify Uint16Array.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(0, 1, 65535);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(source[0]);
      expect(result[2]).assertEqual(source[2]);
      expect(result.buffer).not().assertEqual(source.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2600
     * @tc.name testTypedUArraysFromTestFileB026
     * @tc.desc Verify Uint16Array.from instanceof Uint16Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(100, 200, 300);
      let result = Uint16Array.from(source);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2700
     * @tc.name testTypedUArraysFromTestFileB027
     * @tc.desc Verify Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2800
     * @tc.name testTypedUArraysFromTestFileB028
     * @tc.desc Verify Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(5, 10, 15);
      let result = Uint16Array.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_2900
     * @tc.name testTypedUArraysFromTestFileB029
     * @tc.desc Verify Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source);
      const val17 = source[0];
      expect(val17).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3000
     * @tc.name testTypedUArraysFromTestFileB030
     * @tc.desc Verify Uint16Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3, 4, 5, 6);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3100
     * @tc.name testTypedUArraysFromTestFileB031
     * @tc.desc Verify Uint16Array.from byteLength length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3, 4);
      let result = Uint16Array.from(source);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3200
     * @tc.name testTypedUArraysFromTestFileB032
     * @tc.desc Verify Uint16Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(10, 20);
      let result = Uint16Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3300
     * @tc.name testTypedUArraysFromTestFileB033
     * @tc.desc Verify Uint16Array.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint16Array(0);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3400
     * @tc.name testTypedUArraysFromTestFileB034
     * @tc.desc Verify Uint16Array.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint16Array(0);
      let result = Uint16Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3500
     * @tc.name testTypedUArraysFromTestFileB035
     * @tc.desc Verify Uint16Array.from 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(65535);
      let result = Uint16Array.from(source);
      const val18 = result[0];
      expect(val18).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3600
     * @tc.name testTypedUArraysFromTestFileB036
     * @tc.desc Verify Uint16Array.from 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(0xFFFF);
      let result = Uint16Array.from(source);
      const val19 = result[0];
      expect(val19).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3700
     * @tc.name testTypedUArraysFromTestFileB037
     * @tc.desc Verify Uint16Array.from 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(0x8000);
      let result = Uint16Array.from(source);
      const val20 = result[0];
      expect(val20).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3800
     * @tc.name testTypedUArraysFromTestFileB038
     * @tc.desc Verify Uint16Array.from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(0, 0, 0);
      let result = Uint16Array.from(source);
      const val21 = result[0];
      expect(val21).assertEqual(0);
      const val22 = result[2];
      expect(val22).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_3900
     * @tc.name testTypedUArraysFromTestFileB039
     * @tc.desc Verify Uint16Array.from constructor Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4000
     * @tc.name testTypedUArraysFromTestFileB040
     * @tc.desc Verify Uint16Array.from BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2);
      let result = Uint16Array.from(source);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4100
     * @tc.name testTypedUArraysFromTestFileB041
     * @tc.desc Verify Uint16Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(10, 20, 30);
      let result = Uint16Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4200
     * @tc.name testTypedUArraysFromTestFileB042
     * @tc.desc Verify Uint16Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(100, 200, 300);
      let result = Uint16Array.from(source, (v: number, k: number): number => k >= 0 ? v * 2 : v * 2);
      const val23 = source[0];
      expect(val23).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4300
     * @tc.name testTypedUArraysFromTestFileB043
     * @tc.desc Verify Uint16Array.from mapfn byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source, (v: number, k: number): number => k >= 0 ? v : v);
      expect(result.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4400
     * @tc.name testTypedUArraysFromTestFileB044
     * @tc.desc Verify Uint16Array.from mapfn byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(5, 10);
      let result = Uint16Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4500
     * @tc.name testTypedUArraysFromTestFileB045
     * @tc.desc Verify Uint32Array.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(0, 1, 4294967295);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(source[0]);
      expect(result[2]).assertEqual(source[2]);
      expect(result.buffer).not().assertEqual(source.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4600
     * @tc.name testTypedUArraysFromTestFileB046
     * @tc.desc Verify Uint32Array.from instanceof Uint32Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1000, 2000, 3000);
      let result = Uint32Array.from(source);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4700
     * @tc.name testTypedUArraysFromTestFileB047
     * @tc.desc Verify Uint32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4800
     * @tc.name testTypedUArraysFromTestFileB048
     * @tc.desc Verify Uint32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(5, 10, 15);
      let result = Uint32Array.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_4900
     * @tc.name testTypedUArraysFromTestFileB049
     * @tc.desc Verify Uint32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3);
      let result = Uint32Array.from(source);
      const val27 = source[0];
      expect(val27).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST02_5000
     * @tc.name testTypedUArraysFromTestFileB050
     * @tc.desc Verify Uint32Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileB050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4, 5, 6, 7);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(7);
    });

  });
}
