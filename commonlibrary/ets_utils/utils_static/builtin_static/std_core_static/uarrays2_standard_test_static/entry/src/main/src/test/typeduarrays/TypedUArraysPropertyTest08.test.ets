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

function _getNullArg(): ArrayBuffer | null {
  return null;
}

function _getUndefinedArg(): ArrayBuffer | undefined {
  return undefined;
}

function _getInvalidArg(): ArrayBuffer {
  return new ArrayBuffer(0);
}

export default function typedUArraysPropertyTest08(): void {
  describe('TypedUArraysPropertyTest08', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0100
     * @tc.name testTypedUArraysProperty030201_001
     * @tc.desc Verify length Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8Array(Number.POSITIVE_INFINITY)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0200
     * @tc.name testTypedUArraysProperty030201_002
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8Array(Number.MAX_SAFE_INTEGER)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0300
     * @tc.name testTypedUArraysProperty030201_003
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(new ArrayBuffer(8));
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0400
     * @tc.name testTypedUArraysProperty030201_004
     * @tc.desc Verify offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Uint8Array(buf, -1, 4)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0500
     * @tc.name testTypedUArraysProperty030201_005
     * @tc.desc Verify offset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        new Uint8Array(buf, 10, 4)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0600
     * @tc.name testTypedUArraysProperty030201_006
     * @tc.desc Verify length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        new Uint8Array(buf, 0, 10)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0700
     * @tc.name testTypedUArraysProperty030201_007
     * @tc.desc Verify offset length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        new Uint8Array(buf, 4, 8)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0800
     * @tc.name testTypedUArraysProperty030201_008
     * @tc.desc Verify NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, Number.NaN, 3]);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_0900
     * @tc.name testTypedUArraysProperty030201_009
     * @tc.desc Verify Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, Number.POSITIVE_INFINITY, 3]);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1000
     * @tc.name testTypedUArraysProperty030201_010
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, -1, 3]);
      expect(arr[1]).assertEqual(255);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1100
     * @tc.name testTypedUArraysProperty030201_011
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 512, 3]);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1200
     * @tc.name testTypedUArraysProperty030201_012
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1300
     * @tc.name testTypedUArraysProperty030201_013
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      expect(arr.length).assertEqual(1);
      expect(typeof arr[0]).assertEqual('number');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1400
     * @tc.name testTypedUArraysProperty030201_014
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(20);
      const sub1 = arr.subarray(2, 10);
      const sub2 = sub1.subarray(2, 6);
      expect(sub2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1500
     * @tc.name testTypedUArraysProperty030201_015
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(20);
      const sub1 = arr.subarray(2, 10);
      const sub2 = sub1.subarray(2, 6);
      expect(typeof arr[4]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1600
     * @tc.name testTypedUArraysProperty030201_016
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(20);
      const sub1 = arr.subarray(2, 10);
      const sub2 = sub1.subarray(2, 6);
      expect(sub2.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1700
     * @tc.name testTypedUArraysProperty030201_017
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      const u16 = new Uint16Array(buf);
      const u32 = new Uint32Array(buf);
      expect(typeof u16[0]).assertEqual('number');
      expect(typeof u32[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1800
     * @tc.name testTypedUArraysProperty030201_018
     * @tc.desc Verify offset Uint16Array Uint8Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      const u16 = new Uint16Array(buf, 2, 3);
      expect(typeof u16[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_1900
     * @tc.name testTypedUArraysProperty030201_019
     * @tc.desc Verify offset Uint32Array Uint8Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      const u32 = new Uint32Array(buf, 4, 1);
      expect(typeof u32[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_2000
     * @tc.name testTypedUArraysProperty030201_020
     * @tc.desc Verify BigUint64Array Uint8Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      const bu64 = new BigUint64Array(buf);
      expect(typeof bu64[0]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_2100
     * @tc.name testTypedUArraysProperty030201_021
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const u8 = new Uint8Array(buf);
      const u32 = new Uint32Array(buf);
      expect(typeof u8[0]).assertEqual('number');
      expect(typeof u8[1]).assertEqual('number');
      expect(typeof u8[2]).assertEqual('number');
      expect(typeof u8[3]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property03_0201_2200
     * @tc.name testTypedUArraysProperty030201_022
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysProperty030201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 4);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

  });
}
