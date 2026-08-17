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

export default function typedUArraysFromTest05(): void {
  describe('TypedUArraysFromTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0100
     * @tc.name testTypedUArraysFromTestFileE001
     * @tc.desc Verify Uint32Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4, 5, 6, 7);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0200
     * @tc.name testTypedUArraysFromTestFileE002
     * @tc.desc Verify Uint32Array.from byteLength length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4);
      let result = Uint32Array.from(source);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0300
     * @tc.name testTypedUArraysFromTestFileE003
     * @tc.desc Verify Uint32Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(10, 20);
      let result = Uint32Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0400
     * @tc.name testTypedUArraysFromTestFileE004
     * @tc.desc Verify Uint32Array.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint32Array(0);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0500
     * @tc.name testTypedUArraysFromTestFileE005
     * @tc.desc Verify Uint32Array.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint32Array(0);
      let result = Uint32Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0600
     * @tc.name testTypedUArraysFromTestFileE006
     * @tc.desc Verify Uint32Array.from 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(4294967295);
      let result = Uint32Array.from(source);
      const val28 = result[0];
      expect(val28).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0700
     * @tc.name testTypedUArraysFromTestFileE007
     * @tc.desc Verify Uint32Array.from 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(0xFFFFFFFF);
      let result = Uint32Array.from(source);
      const val29 = result[0];
      expect(val29).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0800
     * @tc.name testTypedUArraysFromTestFileE008
     * @tc.desc Verify Uint32Array.from 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(0x80000000);
      let result = Uint32Array.from(source);
      const val30 = result[0];
      expect(val30).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_0900
     * @tc.name testTypedUArraysFromTestFileE009
     * @tc.desc Verify Uint32Array.from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(0, 0, 0);
      let result = Uint32Array.from(source);
      const val31 = result[0];
      expect(val31).assertEqual(0);
      const val32 = result[2];
      expect(val32).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1000
     * @tc.name testTypedUArraysFromTestFileE010
     * @tc.desc Verify Uint32Array.from constructor Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1100
     * @tc.name testTypedUArraysFromTestFileE011
     * @tc.desc Verify Uint32Array.from BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2);
      let result = Uint32Array.from(source);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1200
     * @tc.name testTypedUArraysFromTestFileE012
     * @tc.desc Verify Uint32Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(10, 20, 30);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1300
     * @tc.name testTypedUArraysFromTestFileE013
     * @tc.desc Verify Uint32Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(100, 200, 300);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v * 2 : v * 2);
      const val33 = source[0];
      expect(val33).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1400
     * @tc.name testTypedUArraysFromTestFileE014
     * @tc.desc Verify Uint32Array.from mapfn byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v : v);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1500
     * @tc.name testTypedUArraysFromTestFileE015
     * @tc.desc Verify Uint32Array.from mapfn byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(5, 10);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1600
     * @tc.name testTypedUArraysFromTestFileE016
     * @tc.desc Verify Uint32Array.from mapfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4, 5);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v : v * k);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1700
     * @tc.name testTypedUArraysFromTestFileE017
     * @tc.desc Verify Uint8ClampedArray.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(0, 1, 255);
      let result = Uint8ClampedArray.from(source);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(source[0]);
      expect(result[2]).assertEqual(source[2]);
      expect(result.buffer).not().assertEqual(source.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1800
     * @tc.name testTypedUArraysFromTestFileE018
     * @tc.desc Verify Uint8ClampedArray.from instanceof Uint8ClampedArray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(100, 200, 255);
      let result = Uint8ClampedArray.from(source);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_1900
     * @tc.name testTypedUArraysFromTestFileE019
     * @tc.desc Verify Uint8ClampedArray.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(17, 85, 170);
      let result = Uint8ClampedArray.from(source);
      const val34 = result[0];
      expect(val34).assertEqual(17);
      const val35 = result[1];
      expect(val35).assertEqual(85);
      const val36 = result[2];
      expect(val36).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2000
     * @tc.name testTypedUArraysFromTestFileE020
     * @tc.desc Verify Uint8ClampedArray.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(5, 10, 15);
      let result = Uint8ClampedArray.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2100
     * @tc.name testTypedUArraysFromTestFileE021
     * @tc.desc Verify Uint8ClampedArray.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3);
      let result = Uint8ClampedArray.from(source);
      const val37 = source[0];
      expect(val37).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2200
     * @tc.name testTypedUArraysFromTestFileE022
     * @tc.desc Verify Uint8ClampedArray.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      let result = Uint8ClampedArray.from(source);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2300
     * @tc.name testTypedUArraysFromTestFileE023
     * @tc.desc Verify Uint8ClampedArray.from byteLength length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3, 4);
      let result = Uint8ClampedArray.from(source);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2400
     * @tc.name testTypedUArraysFromTestFileE024
     * @tc.desc Verify Uint8ClampedArray.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(10, 20);
      let result = Uint8ClampedArray.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2500
     * @tc.name testTypedUArraysFromTestFileE025
     * @tc.desc Verify Uint8ClampedArray.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8ClampedArray(0);
      let result = Uint8ClampedArray.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2600
     * @tc.name testTypedUArraysFromTestFileE026
     * @tc.desc Verify Uint8ClampedArray.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8ClampedArray(0);
      let result = Uint8ClampedArray.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2700
     * @tc.name testTypedUArraysFromTestFileE027
     * @tc.desc Verify Uint8ClampedArray.from 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(255);
      let result = Uint8ClampedArray.from(source);
      const val38 = result[0];
      expect(val38).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2800
     * @tc.name testTypedUArraysFromTestFileE028
     * @tc.desc Verify Uint8ClampedArray.from 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(0xFF);
      let result = Uint8ClampedArray.from(source);
      const val39 = result[0];
      expect(val39).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_2900
     * @tc.name testTypedUArraysFromTestFileE029
     * @tc.desc Verify Uint8ClampedArray.from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(0, 0, 0);
      let result = Uint8ClampedArray.from(source);
      const val40 = result[0];
      expect(val40).assertEqual(0);
      const val41 = result[2];
      expect(val41).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3000
     * @tc.name testTypedUArraysFromTestFileE030
     * @tc.desc Verify Uint8ClampedArray.from constructor Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2);
      let result = Uint8ClampedArray.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3100
     * @tc.name testTypedUArraysFromTestFileE031
     * @tc.desc Verify Uint8ClampedArray.from BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2);
      let result = Uint8ClampedArray.from(source);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3200
     * @tc.name testTypedUArraysFromTestFileE032
     * @tc.desc Verify Uint8ClampedArray.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(10, 20, 30);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3300
     * @tc.name testTypedUArraysFromTestFileE033
     * @tc.desc Verify Uint8ClampedArray.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(100, 200, 255);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v * 2 : v * 2);
      const val42 = source[0];
      expect(val42).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3400
     * @tc.name testTypedUArraysFromTestFileE034
     * @tc.desc Verify Uint8ClampedArray.from mapfn byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v : v);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3500
     * @tc.name testTypedUArraysFromTestFileE035
     * @tc.desc Verify Uint8ClampedArray.from mapfn byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(5, 10);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3600
     * @tc.name testTypedUArraysFromTestFileE036
     * @tc.desc Verify Uint8ClampedArray.from mapfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v : v * k);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3700
     * @tc.name testTypedUArraysFromTestFileE037
     * @tc.desc Verify BigUint64Array.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(0n, 1n, BigInt('18446744073709551615'));
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(source[0]);
      expect(result[2]).assertEqual(source[2]);
      expect(result.buffer).not().assertEqual(source.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3800
     * @tc.name testTypedUArraysFromTestFileE038
     * @tc.desc Verify BigUint64Array.from instanceof BigUint64Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(100n, 200n, 300n);
      let result = BigUint64Array.from(source);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_3900
     * @tc.name testTypedUArraysFromTestFileE039
     * @tc.desc Verify BigUint64Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(17n, 85n, 170n);
      let result = BigUint64Array.from(source);
      const val43 = result[0];
      expect(val43).assertEqual(17n);
      const val44 = result[1];
      expect(val44).assertEqual(85n);
      const val45 = result[2];
      expect(val45).assertEqual(170n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4000
     * @tc.name testTypedUArraysFromTestFileE040
     * @tc.desc Verify BigUint64Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(5n, 10n, 15n);
      let result = BigUint64Array.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4100
     * @tc.name testTypedUArraysFromTestFileE041
     * @tc.desc Verify BigUint64Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n);
      let result = BigUint64Array.from(source);
      const val46 = source[0];
      expect(val46).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4200
     * @tc.name testTypedUArraysFromTestFileE042
     * @tc.desc Verify BigUint64Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4300
     * @tc.name testTypedUArraysFromTestFileE043
     * @tc.desc Verify BigUint64Array.from byteLength length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n, 4n);
      let result = BigUint64Array.from(source);
      expect(result.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4400
     * @tc.name testTypedUArraysFromTestFileE044
     * @tc.desc Verify BigUint64Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(10n, 20n);
      let result = BigUint64Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4500
     * @tc.name testTypedUArraysFromTestFileE045
     * @tc.desc Verify BigUint64Array.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new BigUint64Array(0);
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4600
     * @tc.name testTypedUArraysFromTestFileE046
     * @tc.desc Verify BigUint64Array.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new BigUint64Array(0);
      let result = BigUint64Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4700
     * @tc.name testTypedUArraysFromTestFileE047
     * @tc.desc Verify BigUint64Array.from BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(BigInt('18446744073709551615'));
      let result = BigUint64Array.from(source);
      const val47 = result[0];
      expect(val47).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4800
     * @tc.name testTypedUArraysFromTestFileE048
     * @tc.desc Verify BigUint64Array.from 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(0n);
      let result = BigUint64Array.from(source);
      const val48 = result[0];
      expect(val48).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_4900
     * @tc.name testTypedUArraysFromTestFileE049
     * @tc.desc Verify BigUint64Array.from 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n);
      let result = BigUint64Array.from(source);
      const val49 = result[0];
      expect(val49).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST05_5000
     * @tc.name testTypedUArraysFromTestFileE050
     * @tc.desc Verify BigUint64Array.from 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(0n, 0n, 0n);
      let result = BigUint64Array.from(source);
      const val50 = result[0];
      expect(val50).assertEqual(0n);
      const val51 = result[2];
      expect(val51).assertEqual(0n);
    });

  });
}
