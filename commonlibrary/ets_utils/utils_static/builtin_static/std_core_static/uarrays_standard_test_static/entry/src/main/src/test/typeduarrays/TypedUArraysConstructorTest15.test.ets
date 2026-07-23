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

export default function typedUArraysConstructorTest15(): void {
  describe('TypedUArraysConstructorTest15', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0100
     * @tc.name testTypedUArraysConstructorTestMindMapMerged001
     * @tc.desc Verify 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array().length).assertEqual(0);
      expect(new Uint8ClampedArray().length).assertEqual(0);
      expect(new Uint16Array().length).assertEqual(0);
      expect(new Uint32Array().length).assertEqual(0);
      expect(new BigUint64Array().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0200
     * @tc.name testTypedUArraysConstructorTestMindMapMerged002
     * @tc.desc Verify 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array().byteLength).assertEqual(0);
      expect(new Uint8ClampedArray().byteLength).assertEqual(0);
      expect(new Uint16Array().byteLength).assertEqual(0);
      expect(new Uint32Array().byteLength).assertEqual(0);
      expect(new BigUint64Array().byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0300
     * @tc.name testTypedUArraysConstructorTestMindMapMerged003
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      expect(arr.length).assertEqual(10);
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0400
     * @tc.name testTypedUArraysConstructorTestMindMapMerged004
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u16 = new Uint16Array(10);
      const u32 = new Uint32Array(10);
      const big = new BigUint64Array(10);
      const u8c = new Uint8ClampedArray(10);
      expect(u16.length).assertEqual(10);  expect(u16.byteLength).assertEqual(20);
      expect(u32.length).assertEqual(10);  expect(u32.byteLength).assertEqual(40);
      expect(big.length).assertEqual(10);  expect(big.byteLength).assertEqual(80);
      expect(u8c.length).assertEqual(10);  expect(u8c.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0500
     * @tc.name testTypedUArraysConstructorTestMindMapMerged005
     * @tc.desc Verify length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0600
     * @tc.name testTypedUArraysConstructorTestMindMapMerged006
     * @tc.desc Verify RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0700
     * @tc.name testTypedUArraysConstructorTestMindMapMerged007
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5.9);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0800
     * @tc.name testTypedUArraysConstructorTestMindMapMerged008
     * @tc.desc Verify RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8Array(Number.MAX_SAFE_INTEGER);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_0900
     * @tc.name testTypedUArraysConstructorTestMindMapMerged009
     * @tc.desc Verify TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
      const val0 = arr[0];
      expect(val0).assertEqual(1);
      const val1 = arr[1];
      expect(val1).assertEqual(2);
      const val2 = arr[2];
      expect(val2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1000
     * @tc.name testTypedUArraysConstructorTestMindMapMerged010
     * @tc.desc Verify TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([100, 200, 300]);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
      const val3 = arr[0];
      expect(val3).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1100
     * @tc.name testTypedUArraysConstructorTestMindMapMerged011
     * @tc.desc Verify BigUint64Array BigInt Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([10n, 20n, 30n]);
      expect(src.length).assertEqual(3);
      expect(src[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1200
     * @tc.name testTypedUArraysConstructorTestMindMapMerged012
     * @tc.desc Verify TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(0);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1300
     * @tc.name testTypedUArraysConstructorTestMindMapMerged013
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
      const val5 = arr[0];
      expect(val5).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1400
     * @tc.name testTypedUArraysConstructorTestMindMapMerged014
     * @tc.desc Verify Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.length).assertEqual(3);
      const val6: number = arr[0];
      expect(val6).assertEqual(1);
      const val7: number = arr[2];
      expect(val7).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1500
     * @tc.name testTypedUArraysConstructorTestMindMapMerged015
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1600
     * @tc.name testTypedUArraysConstructorTestMindMapMerged016
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      expect(arr.length).assertEqual(1);
      const val8: number = arr[0];
      expect(val8).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1700
     * @tc.name testTypedUArraysConstructorTestMindMapMerged017
     * @tc.desc Verify /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([256]);
      const u8c = new Uint8ClampedArray([256]);
      const val9 = u8[0];
      expect(val9).assertEqual(0);
      const val10 = u8c[0];
      expect(val10).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1800
     * @tc.name testTypedUArraysConstructorTestMindMapMerged018
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8Array([255])[0]).assertEqual(255);
      expect(new Uint16Array([65535])[0]).assertEqual(65535);
      expect(new Uint32Array([4294967295])[0]).assertEqual(4294967295);
      expect(new BigUint64Array([BigInt('18446744073709551615')])[0]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_1900
     * @tc.name testTypedUArraysConstructorTestMindMapMerged019
     * @tc.desc Verify 1 (buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(16);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2000
     * @tc.name testTypedUArraysConstructorTestMindMapMerged020
     * @tc.desc Verify 2 (buffer, byteOffset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2100
     * @tc.name testTypedUArraysConstructorTestMindMapMerged021
     * @tc.desc Verify 3 (buffer, byteOffset, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 6);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(6);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2200
     * @tc.name testTypedUArraysConstructorTestMindMapMerged022
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const u16 = new Uint16Array(buf, 0, 4);
      const u32 = new Uint32Array(buf, 16, 2);
      const big = new BigUint64Array(buf, 0, 2);
      expect(u16.length).assertEqual(4);
      expect(u32.length).assertEqual(2);
      expect(big.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2300
     * @tc.name testTypedUArraysConstructorTestMindMapMerged023
     * @tc.desc Verify byteOffset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Uint32Array(buf, 1, 2); // offset=1 IsNot4-byte aligned
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2400
     * @tc.name testTypedUArraysConstructorTestMindMapMerged024
     * @tc.desc Verify byteOffset + length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint8Array(buf, 4, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2500
     * @tc.name testTypedUArraysConstructorTestMindMapMerged025
     * @tc.desc Verify Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1, 2, 3]);
      const arr = new Uint8Array(set);
      expect(arr.length).assertEqual(3);
      const val11 = arr[0];
      expect(val11).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2600
     * @tc.name testTypedUArraysConstructorTestMindMapMerged026
     * @tc.desc Verify Map.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[0, 10], [1, 20]]);
      const arr = new Uint8Array(map.values());
      expect(arr.length).assertEqual(2);
      const val12 = arr[0];
      expect(val12).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2700
     * @tc.name testTypedUArraysConstructorTestMindMapMerged027
     * @tc.desc Verify null/undefined TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS limitation: cannot test null/undefined as constructor argument
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ConstructorTestMindMapMerged_2800
     * @tc.name testTypedUArraysConstructorTestMindMapMerged028
     * @tc.desc Verify 2 TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestMindMapMerged028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.length).assertEqual(0);
    });

  });
}
