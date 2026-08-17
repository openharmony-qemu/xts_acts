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

export default function typedUArraysReverseTest04(): void {
  describe('TypedUArraysReverseTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0100
     * @tc.name testTypedUArraysReverseTestFileD001
     * @tc.desc Verify Uint8Array reverse with boundary range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 127, 255]);
      arr.reverse();
      expect(arr[0]).assertEqual(255);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0200
     * @tc.name testTypedUArraysReverseTestFileD002
     * @tc.desc Verify Uint16Array reverse with boundary range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0300
     * @tc.name testTypedUArraysReverseTestFileD003
     * @tc.desc Verify Uint32Array reverse with boundary range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483647, 4294967295]);
      arr.reverse();
      expect(arr[0]).assertEqual(4294967295);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0400
     * @tc.name testTypedUArraysReverseTestFileD004
     * @tc.desc Verify Uint8ClampedArray reverse with boundary range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 255]);
      arr.reverse();
      expect(arr[0]).assertEqual(255);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0500
     * @tc.name testTypedUArraysReverseTestFileD005
     * @tc.desc Verify BigUint64Array reverse with boundary range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 9223372036854775807n, BigInt('18446744073709551615')]);
      arr.reverse();
      expect(arr[0]).assertEqual(BigInt('18446744073709551615'));
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0600
     * @tc.name testTypedUArraysReverseTestFileD006
     * @tc.desc Verify Uint8Array reverse with hex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x01]);
      arr.reverse();
      expect(arr[0]).assertEqual(0x01);
      expect(arr[2]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0700
     * @tc.name testTypedUArraysReverseTestFileD007
     * @tc.desc Verify Uint16Array reverse with hex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x8000, 0x0001]);
      arr.reverse();
      expect(arr[0]).assertEqual(0x0001);
      expect(arr[2]).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0800
     * @tc.name testTypedUArraysReverseTestFileD008
     * @tc.desc Verify Uint32Array reverse with hex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x80000000, 0x00000001]);
      arr.reverse();
      expect(arr[0]).assertEqual(0x00000001);
      expect(arr[2]).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_0900
     * @tc.name testTypedUArraysReverseTestFileD009
     * @tc.desc Verify new Uint8Array(5) reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.reverse()).assertEqual(arr);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1000
     * @tc.name testTypedUArraysReverseTestFileD010
     * @tc.desc Verify Uint8Array([1,2,3]) reverse modifies elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.reverse()).assertEqual(arr);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1100
     * @tc.name testTypedUArraysReverseTestFileD011
     * @tc.desc Verify new Uint8Array(buffer) reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1200
     * @tc.name testTypedUArraysReverseTestFileD012
     * @tc.desc Verify new Uint8Array(buffer, 2, 3) reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 3);
      expect(arr.reverse()).assertEqual(arr);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1300
     * @tc.name testTypedUArraysReverseTestFileD013
     * @tc.desc Verify new Uint16Array(buffer) reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint16Array(buf);
      expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1400
     * @tc.name testTypedUArraysReverseTestFileD014
     * @tc.desc Verify Uint8Array reverse modifies in place correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1500
     * @tc.name testTypedUArraysReverseTestFileD015
     * @tc.desc Verify reverse twice returns to original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      arr.reverse();
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1600
     * @tc.name testTypedUArraysReverseTestFileD016
     * @tc.desc Verify already-reversed array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 4, 3, 2, 1]);
      arr.reverse();
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1700
     * @tc.name testTypedUArraysReverseTestFileD017
     * @tc.desc Verify reverse matches expected reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const expected = new Uint8Array([3, 2, 1]);
      arr.reverse();
      expect(arr[0]).assertEqual(expected[0]);
      expect(arr[1]).assertEqual(expected[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1800
     * @tc.name testTypedUArraysReverseTestFileD018
     * @tc.desc Verify all zero array reverse stays all zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_1900
     * @tc.name testTypedUArraysReverseTestFileD019
     * @tc.desc Verify all same value array reverse stays same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      arr.reverse();
      expect(arr[0]).assertEqual(7);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_2000
     * @tc.name testTypedUArraysReverseTestFileD020
     * @tc.desc Verify palindrome array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 2, 1]);
      arr.reverse();
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_2100
     * @tc.name testTypedUArraysReverseTestFileD021
     * @tc.desc Verify Uint16Array reverse with hex sequential values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x0001, 0x0002, 0x0003, 0x0004]);
      arr.reverse();
      expect(arr[0]).assertEqual(0x0004);
      expect(arr[3]).assertEqual(0x0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST04_2200
     * @tc.name testTypedUArraysReverseTestFileD022
     * @tc.desc Verify BigUint64Array reverse with sequential values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      arr.reverse();
      expect(arr[0]).assertEqual(4n);
      expect(arr[3]).assertEqual(1n);
    });

  });
}
