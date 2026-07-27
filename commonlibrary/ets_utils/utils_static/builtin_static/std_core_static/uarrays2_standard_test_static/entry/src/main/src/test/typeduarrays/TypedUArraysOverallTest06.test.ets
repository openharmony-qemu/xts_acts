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

export default function typedUArraysOverallTest06(): void {
  describe('TypedUArraysOverallTest06', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0100
     * @tc.name testTypedUArraysOverall0101_001
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0200
     * @tc.name testTypedUArraysOverall0101_002
     * @tc.desc Verify null buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8Array(-1)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0300
     * @tc.name testTypedUArraysOverall0101_003
     * @tc.desc Verify offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16)
      const arr = new Uint8Array(buf, 0)
      expect(arr.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0400
     * @tc.name testTypedUArraysOverall0101_004
     * @tc.desc Verify offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16)
      const arr = new Uint16Array(buf, 4)
      expect(arr.byteOffset).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0500
     * @tc.name testTypedUArraysOverall0101_005
     * @tc.desc Verify offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16)
      const arr = new Uint8Array(buf, 3)
      expect(arr.byteOffset).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0600
     * @tc.name testTypedUArraysOverall0101_006
     * @tc.desc Verify offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16)
        new Uint8Array(buf, -1)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0700
     * @tc.name testTypedUArraysOverall0101_007
     * @tc.desc Verify offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16)
        new Uint8Array(buf, 100)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0800
     * @tc.name testTypedUArraysOverall0101_008
     * @tc.desc Verify offset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16)
      const arr = new Uint8Array(buf, 16)
      expect(arr.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_0900
     * @tc.name testTypedUArraysOverall0101_009
     * @tc.desc Verify offset 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256)
      const arr = new Uint8Array(buf, 0xFF)
      expect(arr.byteOffset).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1000
     * @tc.name testTypedUArraysOverall0101_010
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      expect(arr[0]).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1100
     * @tc.name testTypedUArraysOverall0101_011
     * @tc.desc Verify index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      expect(arr[1]).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1200
     * @tc.name testTypedUArraysOverall0101_012
     * @tc.desc Verify index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      expect(arr[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1300
     * @tc.name testTypedUArraysOverall0101_013
     * @tc.desc Verify index length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      try {
        let val = arr[3];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1400
     * @tc.name testTypedUArraysOverall0101_014
     * @tc.desc Verify index length+1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      try {
        arr[4];
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('invalid index');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1500
     * @tc.name testTypedUArraysOverall0101_015
     * @tc.desc Verify index -1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      try {
        let val = arr[-1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1600
     * @tc.name testTypedUArraysOverall0101_016
     * @tc.desc Verify index -length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      try {
        let val = arr[-3];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1700
     * @tc.name testTypedUArraysOverall0101_017
     * @tc.desc Verify index -length-1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      try {
        let val = arr[-4];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1800
     * @tc.name testTypedUArraysOverall0101_018
     * @tc.desc Verify index MAX_SAFE_INTEGER undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      try {
        let val = arr[2147483647];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_1900
     * @tc.name testTypedUArraysOverall0101_019
     * @tc.desc Verify index 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(256)
      arr[0xFF] = 42;
      expect(arr[0xFF]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2000
     * @tc.name testTypedUArraysOverall0101_020
     * @tc.desc Verify index 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3)
      arr[0] = 100;
      expect(arr[0]).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2100
     * @tc.name testTypedUArraysOverall0101_021
     * @tc.desc Verify index 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3)
      arr[0] = 100n;
      expect(arr[0]).assertEqual(100n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2200
     * @tc.name testTypedUArraysOverall0101_022
     * @tc.desc Verify value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2300
     * @tc.name testTypedUArraysOverall0101_023
     * @tc.desc Verify value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      arr[0] = 1;
      expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2400
     * @tc.name testTypedUArraysOverall0101_024
     * @tc.desc Verify value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      arr[0] = 127;
      expect(arr[0]).assertEqual(127)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2500
     * @tc.name testTypedUArraysOverall0101_025
     * @tc.desc Verify value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      arr[0] = 255;
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2600
     * @tc.name testTypedUArraysOverall0101_026
     * @tc.desc Verify value 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      arr[0] = 0xFF;
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_7500

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2700
     * @tc.name testTypedUArraysOverall0101_027
     * @tc.desc Verify value 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2800
     * @tc.name testTypedUArraysOverall0101_028
     * @tc.desc Verify value NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_2900
     * @tc.name testTypedUArraysOverall0101_029
     * @tc.desc Verify value Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3000
     * @tc.name testTypedUArraysOverall0101_030
     * @tc.desc Verify value 0x100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3100
     * @tc.name testTypedUArraysOverall0101_031
     * @tc.desc Verify value 0xFFFF Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3)
      arr[0] = 0xFFFF;
      expect(arr[0]).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3200
     * @tc.name testTypedUArraysOverall0101_032
     * @tc.desc Verify value 0xFFFFFFFF Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3)
      arr[0] = 0xFFFFFFFF;
      expect(arr[0]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3300
     * @tc.name testTypedUArraysOverall0101_033
     * @tc.desc Verify set array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5)
      arr.set([1, 2, 3])
      expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3400
     * @tc.name testTypedUArraysOverall0101_034
     * @tc.desc Verify set typedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5)
      const src = new Uint8Array([4, 5, 6])
      arr.set(src)
      expect(arr[0]).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3500
     * @tc.name testTypedUArraysOverall0101_035
     * @tc.desc Verify set array offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5)
      arr.set([1, 2, 3], 2)
      expect(arr[2]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3600
     * @tc.name testTypedUArraysOverall0101_036
     * @tc.desc Verify set typedArray offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5)
      const src = new Uint8Array([7, 8, 9])
      arr.set(src, 2)
      expect(arr[2]).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3700
     * @tc.name testTypedUArraysOverall0101_037
     * @tc.desc Verify set iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5)
      arr.set([10, 20]);
      expect(arr[0]).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3800
     * @tc.name testTypedUArraysOverall0101_038
     * @tc.desc Verify fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5)
      arr.fill(42)
      expect(arr[0]).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_3900
     * @tc.name testTypedUArraysOverall0101_039
     * @tc.desc Verify Uint8ClampedArray 256 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3)
      arr[0] = 256;
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4000
     * @tc.name testTypedUArraysOverall0101_040
     * @tc.desc Verify Uint8ClampedArray -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4100
     * @tc.name testTypedUArraysOverall0101_041
     * @tc.desc Verify Uint8ClampedArray 511 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3)
      arr[0] = 511;
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4200
     * @tc.name testTypedUArraysOverall0101_042
     * @tc.desc Verify Uint8ClampedArray -100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4300
     * @tc.name testTypedUArraysOverall0101_043
     * @tc.desc Verify Uint8ClampedArray 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4400
     * @tc.name testTypedUArraysOverall0101_044
     * @tc.desc Verify Uint8Array 256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4500
     * @tc.name testTypedUArraysOverall0101_045
     * @tc.desc Verify Uint8Array 257 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3)
      arr[0] = 257;
      expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4600
     * @tc.name testTypedUArraysOverall0101_046
     * @tc.desc Verify Uint16Array 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4700
     * @tc.name testTypedUArraysOverall0101_047
     * @tc.desc Verify Uint32Array 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3)
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4800
     * @tc.name testTypedUArraysOverall0101_048
     * @tc.desc Verify BigUint64Array 18446744073709551616n 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3)
      expect(arr[0]).assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_4900
     * @tc.name testTypedUArraysOverall0101_049
     * @tc.desc Verify Uint8ClampedArray 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3)
      arr[0] = 255;
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Overall0101_5000
     * @tc.name testTypedUArraysOverall0101_050
     * @tc.desc Verify Uint8ClampedArray 128 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverall0101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3)
      arr[0] = 128;
      expect(arr[0]).assertEqual(128)
    });
  });
}
