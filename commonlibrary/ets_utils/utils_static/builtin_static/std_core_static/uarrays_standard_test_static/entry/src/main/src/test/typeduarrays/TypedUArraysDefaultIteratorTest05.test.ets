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

export default function typedUArraysDefaultIteratorTest05(): void {
  describe('TypedUArraysDefaultIteratorTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4100
     * @tc.name testTypedUArraysDefaultIterator02041
     * @tc.desc Verify Uint8ClampedArray [0,255,0] iterates to 255 at second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 0]);
      const it = arr.values();
      it.next();
      const r2 = it.next();
      expect(r2.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4200
     * @tc.name testTypedUArraysDefaultIterator02042
     * @tc.desc Verify Uint16Array [0x01,0xFFFF,0x8000] 0x01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x01, 0xFFFF, 0x8000]);
      const it = arr.values();
      const r1 = it.next();
      expect(r1.value).assertEqual(0x01);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4300
     * @tc.name testTypedUArraysDefaultIterator02043
     * @tc.desc Verify Uint16Array [0x01,0xFFFF,0x8000] 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x01, 0xFFFF, 0x8000]);
      const it = arr.values();
      it.next();
      const r2 = it.next();
      expect(r2.value).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4400
     * @tc.name testTypedUArraysDefaultIterator02044
     * @tc.desc Verify Uint32Array [0x01,0xFFFFFFFF,0x80000000] 0x01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x01, 0xFFFFFFFF, 0x80000000]);
      const it = arr.values();
      const r1 = it.next();
      expect(r1.value).assertEqual(0x01);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4500
     * @tc.name testTypedUArraysDefaultIterator02045
     * @tc.desc Verify Uint32Array [0x01,0xFFFFFFFF,0x80000000] 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x01, 0xFFFFFFFF, 0x80000000]);
      const it = arr.values();
      it.next();
      const r2 = it.next();
      expect(r2.value).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4600
     * @tc.name testTypedUArraysDefaultIterator02046
     * @tc.desc Verify BigUint64Array [0n,1n,BigInt('18446744073709551615') 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615')]);
      const it = arr.values();
      const r1 = it.next();
      expect(r1.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4700
     * @tc.name testTypedUArraysDefaultIterator02047
     * @tc.desc Verify BigUint64Array [0n,1n,BigInt('18446744073709551615') 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615')]);
      const it = arr.values();
      it.next();
      const r2 = it.next();
      expect(r2.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4800
     * @tc.name testTypedUArraysDefaultIterator02048
     * @tc.desc Verify BigUint64Array [0n,1n,BigInt('18446744073709551615') BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615')]);
      const it = arr.values();
      it.next();
      it.next();
      const r3 = it.next();
      expect(r3.value).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_4900
     * @tc.name testTypedUArraysDefaultIterator02049
     * @tc.desc Verify Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(0);
      expect(r3.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5000
     * @tc.name testTypedUArraysDefaultIterator02050
     * @tc.desc Verify Uint8ClampedArray 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      expect(r1.value).assertEqual(255);
      expect(r2.value).assertEqual(255);
      expect(r3.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5100
     * @tc.name testTypedUArraysDefaultIterator02051
     * @tc.desc Verify Uint16Array 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65535, 65535]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      expect(r1.value).assertEqual(65535);
      expect(r2.value).assertEqual(65535);
      expect(r3.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5200
     * @tc.name testTypedUArraysDefaultIterator02052
     * @tc.desc Verify Uint32Array 4294967295 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      expect(r1.value).assertEqual(4294967295);
      expect(r2.value).assertEqual(4294967295);
      expect(r3.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5300
     * @tc.name testTypedUArraysDefaultIterator02053
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      expect(r1.value).assertEqual(BigInt('18446744073709551615'));
      expect(r2.value).assertEqual(BigInt('18446744073709551615'));
      expect(r3.value).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5400
     * @tc.name testTypedUArraysDefaultIterator02054
     * @tc.desc Verify Uint8Array 256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5500
     * @tc.name testTypedUArraysDefaultIterator02055
     * @tc.desc Verify Uint8Array -1 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5600
     * @tc.name testTypedUArraysDefaultIterator02056
     * @tc.desc Verify Uint8ClampedArray 256 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5700
     * @tc.name testTypedUArraysDefaultIterator02057
     * @tc.desc Verify Uint8ClampedArray -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5800
     * @tc.name testTypedUArraysDefaultIterator02058
     * @tc.desc Verify Uint16Array 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_5900
     * @tc.name testTypedUArraysDefaultIterator02059
     * @tc.desc Verify Uint16Array -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6000
     * @tc.name testTypedUArraysDefaultIterator02060
     * @tc.desc Verify Uint32Array 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6100
     * @tc.name testTypedUArraysDefaultIterator02061
     * @tc.desc Verify Uint32Array -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6200
     * @tc.name testTypedUArraysDefaultIterator02062
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551616') 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6300
     * @tc.name testTypedUArraysDefaultIterator02063
     * @tc.desc Verify Uint8Array NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6400
     * @tc.name testTypedUArraysDefaultIterator02064
     * @tc.desc Verify Uint8ClampedArray Infinity 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6500
     * @tc.name testTypedUArraysDefaultIterator02065
     * @tc.desc Verify Uint16Array Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6600
     * @tc.name testTypedUArraysDefaultIterator02066
     * @tc.desc Verify Uint32Array -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6700
     * @tc.name testTypedUArraysDefaultIterator02067
     * @tc.desc Verify Uint8Array 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6800
     * @tc.name testTypedUArraysDefaultIterator02068
     * @tc.desc Verify Uint8ClampedArray 0.5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_6900
     * @tc.name testTypedUArraysDefaultIterator02069
     * @tc.desc Verify Uint8Array 1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.9]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7000
     * @tc.name testTypedUArraysDefaultIterator02070
     * @tc.desc Verify Uint8ClampedArray 1.9 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1.9]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7100
     * @tc.name testTypedUArraysDefaultIterator02071
     * @tc.desc Verify Uint8Array 0x100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7200
     * @tc.name testTypedUArraysDefaultIterator02072
     * @tc.desc Verify Uint8ClampedArray 0x100 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x100]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7300
     * @tc.name testTypedUArraysDefaultIterator02073
     * @tc.desc Verify Uint16Array 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7400
     * @tc.name testTypedUArraysDefaultIterator02074
     * @tc.desc Verify Uint32Array 0x100000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7500
     * @tc.name testTypedUArraysDefaultIterator02075
     * @tc.desc Verify Uint8Array 0xFFFFFFFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7600
     * @tc.name testTypedUArraysDefaultIterator02076
     * @tc.desc Verify Uint16Array 0xFFFFFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7700
     * @tc.name testTypedUArraysDefaultIterator02077
     * @tc.desc Verify Uint8ClampedArray 0xFFFFFFFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7800
     * @tc.name testTypedUArraysDefaultIterator02078
     * @tc.desc Verify Uint16Array 0x10001 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10001]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_7900
     * @tc.name testTypedUArraysDefaultIterator02079
     * @tc.desc Verify Uint32Array 0x100000001 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x100000001]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator02_8000
     * @tc.name testTypedUArraysDefaultIterator02080
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551617') 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator02080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551617')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1n);
    });

  });
}
