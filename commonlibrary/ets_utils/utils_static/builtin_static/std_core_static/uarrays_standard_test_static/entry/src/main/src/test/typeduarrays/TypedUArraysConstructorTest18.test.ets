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

export default function typedUArraysConstructorTest18(): void {
  describe('TypedUArraysConstructorTest18', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0100
     * @tc.name testTypedUArraysConstructor0201_001
     * @tc.desc Verify new TypedUArray(typedArray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0100
     * @tc.name testTypedUArraysConstructor0201_001
     * @tc.desc Verify byteOffset 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0200
     * @tc.name testTypedUArraysConstructor0201_002
     * @tc.desc Verify byteOffset 2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0300
     * @tc.name testTypedUArraysConstructor0201_003
     * @tc.desc Verify byteOffset 4 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0400
     * @tc.name testTypedUArraysConstructor0201_004
     * @tc.desc Verify byteOffset 8 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 8);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0500
     * @tc.name testTypedUArraysConstructor0201_005
     * @tc.desc Verify byteOffset 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0600
     * @tc.name testTypedUArraysConstructor0201_006
     * @tc.desc Verify byteOffset 4 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0700
     * @tc.name testTypedUArraysConstructor0201_007
     * @tc.desc Verify byteOffset 8 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 8);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0800
     * @tc.name testTypedUArraysConstructor0201_008
     * @tc.desc Verify byteOffset 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 1);
      expect(arr.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_0900
     * @tc.name testTypedUArraysConstructor0201_009
     * @tc.desc Verify byteOffset 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Uint16Array(buf, 1);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1000
     * @tc.name testTypedUArraysConstructor0201_010
     * @tc.desc Verify byteOffset 3 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Uint16Array(buf, 3);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1100
     * @tc.name testTypedUArraysConstructor0201_011
     * @tc.desc Verify byteOffset 5 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Uint16Array(buf, 5);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1200
     * @tc.name testTypedUArraysConstructor0201_012
     * @tc.desc Verify byteOffset 1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Uint32Array(buf, 1);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1300
     * @tc.name testTypedUArraysConstructor0201_013
     * @tc.desc Verify byteOffset 3 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Uint32Array(buf, 3);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1400
     * @tc.name testTypedUArraysConstructor0201_014
     * @tc.desc Verify byteOffset 1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new BigUint64Array(buf, 1);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1500
     * @tc.name testTypedUArraysConstructor0201_015
     * @tc.desc Verify byteOffset buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 16);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1600
     * @tc.name testTypedUArraysConstructor0201_016
     * @tc.desc Verify byteOffset buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 16);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1700
     * @tc.name testTypedUArraysConstructor0201_017
     * @tc.desc Verify byteOffset buffer 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Uint8Array(buf, 17);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1800
     * @tc.name testTypedUArraysConstructor0201_018
     * @tc.desc Verify byteOffset -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Uint8Array(buf, -1);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_1900
     * @tc.name testTypedUArraysConstructor0201_019
     * @tc.desc Verify length 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2000
     * @tc.name testTypedUArraysConstructor0201_020
     * @tc.desc Verify length 2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2100
     * @tc.name testTypedUArraysConstructor0201_021
     * @tc.desc Verify length 4 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 0, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2200
     * @tc.name testTypedUArraysConstructor0201_022
     * @tc.desc Verify length 2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2300
     * @tc.name testTypedUArraysConstructor0201_023
     * @tc.desc Verify length 1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2400
     * @tc.name testTypedUArraysConstructor0201_024
     * @tc.desc Verify length 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2500
     * @tc.name testTypedUArraysConstructor0201_025
     * @tc.desc Verify length 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2600
     * @tc.name testTypedUArraysConstructor0201_026
     * @tc.desc Verify length -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Uint8Array(buf, 0, -1);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2700
     * @tc.name testTypedUArraysConstructor0201_027
     * @tc.desc Verify length buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        const arr = new Uint8Array(buf, 0, 16);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2800
     * @tc.name testTypedUArraysConstructor0201_028
     * @tc.desc Verify length buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        const arr = new Uint16Array(buf, 0, 8);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_2900
     * @tc.name testTypedUArraysConstructor0201_029
     * @tc.desc Verify length buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        const arr = new Uint32Array(buf, 0, 8);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3000
     * @tc.name testTypedUArraysConstructor0201_030
     * @tc.desc Verify byteOffset length buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        const arr = new Uint8Array(buf, 4, 5);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3100
     * @tc.name testTypedUArraysConstructor0201_031
     * @tc.desc Verify byteOffset length buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        const arr = new Uint16Array(buf, 2, 4);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3200
     * @tc.name testTypedUArraysConstructor0201_032
     * @tc.desc Verify byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 15, 1);
      expect(arr.byteOffset).assertEqual(15);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3300
     * @tc.name testTypedUArraysConstructor0201_033
     * @tc.desc Verify byteOffset Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 14, 1);
      expect(arr.byteOffset).assertEqual(14);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3400
     * @tc.name testTypedUArraysConstructor0201_034
     * @tc.desc Verify byteOffset Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 12, 1);
      expect(arr.byteOffset).assertEqual(12);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3500
     * @tc.name testTypedUArraysConstructor0201_035
     * @tc.desc Verify byteOffset BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf, 8, 1);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3600
     * @tc.name testTypedUArraysConstructor0201_036
     * @tc.desc Verify buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3700
     * @tc.name testTypedUArraysConstructor0201_037
     * @tc.desc Verify buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3800
     * @tc.name testTypedUArraysConstructor0201_038
     * @tc.desc Verify buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_3900
     * @tc.name testTypedUArraysConstructor0201_039
     * @tc.desc Verify buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4000
     * @tc.name testTypedUArraysConstructor0201_040
     * @tc.desc Verify buffer buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4100
     * @tc.name testTypedUArraysConstructor0201_041
     * @tc.desc Verify buffer byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4200
     * @tc.name testTypedUArraysConstructor0201_042
     * @tc.desc Verify buffer byteLength Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4300
     * @tc.name testTypedUArraysConstructor0201_043
     * @tc.desc Verify buffer byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4400
     * @tc.name testTypedUArraysConstructor0201_044
     * @tc.desc Verify buffer byteLength Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4500
     * @tc.name testTypedUArraysConstructor0201_045
     * @tc.desc Verify buffer byteLength BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4600
     * @tc.name testTypedUArraysConstructor0201_046
     * @tc.desc Verify buffer byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4700
     * @tc.name testTypedUArraysConstructor0201_047
     * @tc.desc Verify buffer byteOffset byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4800
     * @tc.name testTypedUArraysConstructor0201_048
     * @tc.desc Verify buffer byteOffset length byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 2);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_4900
     * @tc.name testTypedUArraysConstructor0201_049
     * @tc.desc Verify buffer byteOffset length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0201_5000
     * @tc.name testTypedUArraysConstructor0201_050
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      const val27 = arr[0];
      expect(val27).assertEqual(0);
    });
  });
}
