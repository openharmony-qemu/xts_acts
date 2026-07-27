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

export default function typedUArraysKeysTest04(): void {
  describe('TypedUArraysKeysTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5100
     * @tc.name testTypedUArraysKeysPart101_050
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5100
     * @tc.name testTypedUArraysKeysPart101_051
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('9223372036854775808'), 0n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5200
     * @tc.name testTypedUArraysKeysPart101_052
     * @tc.desc Verify new Uint8Array(3) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5300
     * @tc.name testTypedUArraysKeysPart101_053
     * @tc.desc Verify new Uint8Array([1,2,3]) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5400
     * @tc.name testTypedUArraysKeysPart101_054
     * @tc.desc Verify new Uint8Array(0) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5500
     * @tc.name testTypedUArraysKeysPart101_055
     * @tc.desc Verify new Uint8ClampedArray(3) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5600
     * @tc.name testTypedUArraysKeysPart101_056
     * @tc.desc Verify new Uint8ClampedArray([1,2,3]) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5700
     * @tc.name testTypedUArraysKeysPart101_057
     * @tc.desc Verify new Uint8ClampedArray(0) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5800
     * @tc.name testTypedUArraysKeysPart101_058
     * @tc.desc Verify new Uint16Array(3) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5900
     * @tc.name testTypedUArraysKeysPart101_059
     * @tc.desc Verify new Uint16Array([1,2,3]) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6000
     * @tc.name testTypedUArraysKeysPart101_060
     * @tc.desc Verify new Uint16Array(0) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6100
     * @tc.name testTypedUArraysKeysPart101_061
     * @tc.desc Verify new Uint32Array(3) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6200
     * @tc.name testTypedUArraysKeysPart101_062
     * @tc.desc Verify new Uint32Array([1,2,3]) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6300
     * @tc.name testTypedUArraysKeysPart101_063
     * @tc.desc Verify new Uint32Array(0) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6400
     * @tc.name testTypedUArraysKeysPart101_064
     * @tc.desc Verify new BigUint64Array(3) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6500
     * @tc.name testTypedUArraysKeysPart101_065
     * @tc.desc Verify new BigUint64Array([1n,2n,3n]) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6600
     * @tc.name testTypedUArraysKeysPart101_066
     * @tc.desc Verify new BigUint64Array(0) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6700
     * @tc.name testTypedUArraysKeysPart101_067
     * @tc.desc Verify new Uint8Array(buffer, offset, length) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint8Array(buffer, 4, 3);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6800
     * @tc.name testTypedUArraysKeysPart101_068
     * @tc.desc Verify new Uint16Array(buffer, offset, length) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint16Array(buffer, 4, 2);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_6900
     * @tc.name testTypedUArraysKeysPart101_069
     * @tc.desc Verify new Uint32Array(buffer, offset, length) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32);
      const arr = new Uint32Array(buffer, 8, 2);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7000
     * @tc.name testTypedUArraysKeysPart101_070
     * @tc.desc Verify new BigUint64Array(buffer, offset, length) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32);
      const arr = new BigUint64Array(buffer, 8, 2);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7100
     * @tc.name testTypedUArraysKeysPart101_071
     * @tc.desc Verify new Uint8Array(new ArrayBuffer(0)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const arr = new Uint8Array(buffer);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7200
     * @tc.name testTypedUArraysKeysPart101_072
     * @tc.desc Verify new Uint8Array(new ArrayBuffer(8)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer);
      const iter = arr.keys();
      for (let i = 0; i < 8; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7300
     * @tc.name testTypedUArraysKeysPart101_073
     * @tc.desc Verify new Uint16Array(new ArrayBuffer(8)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer);
      const iter = arr.keys();
      for (let i = 0; i < 4; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7400
     * @tc.name testTypedUArraysKeysPart101_074
     * @tc.desc Verify new Uint32Array(new ArrayBuffer(8)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint32Array(buffer);
      const iter = arr.keys();
      for (let i = 0; i < 2; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7500
     * @tc.name testTypedUArraysKeysPart101_075
     * @tc.desc Verify new BigUint64Array(new ArrayBuffer(8)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new BigUint64Array(buffer);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7600
     * @tc.name testTypedUArraysKeysPart101_076
     * @tc.desc Verify new Uint8Array(new ArrayBuffer(64)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(64);
      const arr = new Uint8Array(buffer);
      const iter = arr.keys();
      for (let i = 0; i < 64; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7700
     * @tc.name testTypedUArraysKeysPart101_077
     * @tc.desc Verify new Uint16Array(new ArrayBuffer(64)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(64);
      const arr = new Uint16Array(buffer);
      const iter = arr.keys();
      for (let i = 0; i < 32; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7800
     * @tc.name testTypedUArraysKeysPart101_078
     * @tc.desc Verify new Uint32Array(new ArrayBuffer(64)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(64);
      const arr = new Uint32Array(buffer);
      const iter = arr.keys();
      for (let i = 0; i < 16; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_7900
     * @tc.name testTypedUArraysKeysPart101_079
     * @tc.desc Verify new BigUint64Array(new ArrayBuffer(64)) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(64);
      const arr = new BigUint64Array(buffer);
      const iter = arr.keys();
      for (let i = 0; i < 8; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8000
     * @tc.name testTypedUArraysKeysPart101_080
     * @tc.desc Verify Uint8Array 128 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([128, 128, 128, 128]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8100
     * @tc.name testTypedUArraysKeysPart101_081
     * @tc.desc Verify Uint16Array 32768 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32768, 32768, 32768, 32768]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8200
     * @tc.name testTypedUArraysKeysPart101_082
     * @tc.desc Verify Uint32Array 2147483648 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483648, 2147483648, 2147483648, 2147483648]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8300
     * @tc.name testTypedUArraysKeysPart101_083
     * @tc.desc Verify BigUint64Array 1n keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 1n, 1n, 1n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8400
     * @tc.name testTypedUArraysKeysPart101_084
     * @tc.desc Verify Uint8ClampedArray 128 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 128, 128, 128]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8500
     * @tc.name testTypedUArraysKeysPart101_085
     * @tc.desc Verify Uint8Array 0o377 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0o377, 0o200, 0o000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8600
     * @tc.name testTypedUArraysKeysPart101_086
     * @tc.desc Verify Uint8Array 0b11111111 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b11111111, 0b10000000, 0b00000000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8700
     * @tc.name testTypedUArraysKeysPart101_087
     * @tc.desc Verify Uint16Array 0o177777 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0o177777, 0o100000, 0o000000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8800
     * @tc.name testTypedUArraysKeysPart101_088
     * @tc.desc Verify Uint16Array 0b1111111111111111 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0b1111111111111111, 0b1000000000000000, 0b0000000000000000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_8900
     * @tc.name testTypedUArraysKeysPart101_089
     * @tc.desc Verify Uint32Array 0o37777777777 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0o37777777777, 0o20000000000, 0o00000000000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9000
     * @tc.name testTypedUArraysKeysPart101_090
     * @tc.desc Verify Uint32Array 0b11111111111111111111111111111111 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0b11111111111111111111111111111111, 0b10000000000000000000000000000000, 0b00000000000000000000000000000000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9100
     * @tc.name testTypedUArraysKeysPart101_091
     * @tc.desc Verify BigUint64Array 1777777777777777777777n, 8) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('9223372036854775808'), 0n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9200
     * @tc.name testTypedUArraysKeysPart101_092
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('9223372036854775808'), 0n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9300
     * @tc.name testTypedUArraysKeysPart101_093
     * @tc.desc Verify Uint8Array 1000 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      const iter = arr.keys();
      for (let i = 0; i < 1000; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9400
     * @tc.name testTypedUArraysKeysPart101_094
     * @tc.desc Verify Uint16Array 1000 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1000);
      const iter = arr.keys();
      for (let i = 0; i < 1000; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9500
     * @tc.name testTypedUArraysKeysPart101_095
     * @tc.desc Verify Uint32Array 1000 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1000);
      const iter = arr.keys();
      for (let i = 0; i < 1000; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9600
     * @tc.name testTypedUArraysKeysPart101_096
     * @tc.desc Verify BigUint64Array 1000 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(1000);
      const iter = arr.keys();
      for (let i = 0; i < 1000; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9700
     * @tc.name testTypedUArraysKeysPart101_097
     * @tc.desc Verify Uint8Array keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9800
     * @tc.name testTypedUArraysKeysPart101_098
     * @tc.desc Verify Uint8Array keys length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_9900
     * @tc.name testTypedUArraysKeysPart101_099
     * @tc.desc Verify Uint16Array keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

  });
}
