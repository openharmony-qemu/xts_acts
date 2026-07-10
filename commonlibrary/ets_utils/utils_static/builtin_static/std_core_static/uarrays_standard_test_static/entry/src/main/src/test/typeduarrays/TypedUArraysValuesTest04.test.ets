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

export default function typedUArraysValuesTest04(): void {
  describe('TypedUArraysValuesTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0100
     * @tc.name testTypedUArraysValuesPart101_050
     * @tc.desc Verify Uint16Array 65537 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65537]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5100
     * @tc.name testTypedUArraysValuesPart101_051
     * @tc.desc Verify Uint16Array -1 values() 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5200
     * @tc.name testTypedUArraysValuesPart101_052
     * @tc.desc Verify Uint16Array 0x10000 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10000]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5300
     * @tc.name testTypedUArraysValuesPart101_053
     * @tc.desc Verify Uint16Array 0x10001 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10001]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5400
     * @tc.name testTypedUArraysValuesPart101_054
     * @tc.desc Verify Uint16Array 0xFFFFFFFF values() 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5500
     * @tc.name testTypedUArraysValuesPart101_055
     * @tc.desc Verify Uint32Array values() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const it = arr.values();
      let result = it.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5600
     * @tc.name testTypedUArraysValuesPart101_056
     * @tc.desc Verify Uint32Array [0]values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5700
     * @tc.name testTypedUArraysValuesPart101_057
     * @tc.desc Verify Uint32Array [1]values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5800
     * @tc.name testTypedUArraysValuesPart101_058
     * @tc.desc Verify Uint32Array [2147483647]values() 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483647]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_5900
     * @tc.name testTypedUArraysValuesPart101_059
     * @tc.desc Verify Uint32Array [4294967295]values() 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6000
     * @tc.name testTypedUArraysValuesPart101_060
     * @tc.desc Verify Uint32Array [0xFFFFFFFF]values() 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6100
     * @tc.name testTypedUArraysValuesPart101_061
     * @tc.desc Verify Uint32Array [0x80000000]values() 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x80000000]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0x80000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6200
     * @tc.name testTypedUArraysValuesPart101_062
     * @tc.desc Verify Uint32Array [1,2,3]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(1);
      expect(r2.value).assertEqual(2);
      expect(r3.value).assertEqual(3);
      expect(r4.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6300
     * @tc.name testTypedUArraysValuesPart101_063
     * @tc.desc Verify Uint32Array [0,4294967295,0]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 4294967295, 0]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(4294967295);
      expect(r3.value).assertEqual(0);
      expect(r4.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6400
     * @tc.name testTypedUArraysValuesPart101_064
     * @tc.desc Verify Uint32Array [0x01,0xFFFFFFFF,0x80000000]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x01, 0xFFFFFFFF, 0x80000000]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0x01);
      expect(r2.value).assertEqual(0xFFFFFFFF);
      expect(r3.value).assertEqual(0x80000000);
      expect(r4.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6500
     * @tc.name testTypedUArraysValuesPart101_065
     * @tc.desc Verify Uint32Array values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(0);
      expect(r3.value).assertEqual(0);
      expect(r4.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6600
     * @tc.name testTypedUArraysValuesPart101_066
     * @tc.desc Verify Uint32Array 4294967295 values() 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(4294967295);
      expect(r2.value).assertEqual(4294967295);
      expect(r3.value).assertEqual(4294967295);
      expect(r4.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6700
     * @tc.name testTypedUArraysValuesPart101_067
     * @tc.desc Verify Uint32Array 4294967296 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6800
     * @tc.name testTypedUArraysValuesPart101_068
     * @tc.desc Verify Uint32Array 4294967297 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967297]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_6900
     * @tc.name testTypedUArraysValuesPart101_069
     * @tc.desc Verify Uint32Array -1 values() 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7000
     * @tc.name testTypedUArraysValuesPart101_070
     * @tc.desc Verify Uint32Array 0x100000000 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x100000000]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7100
     * @tc.name testTypedUArraysValuesPart101_071
     * @tc.desc Verify Uint32Array 0x100000001 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x100000001]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7200
     * @tc.name testTypedUArraysValuesPart101_072
     * @tc.desc Verify BigUint64Array values() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const it = arr.values();
      let result = it.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7300
     * @tc.name testTypedUArraysValuesPart101_073
     * @tc.desc Verify BigUint64Array [0n]values() 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7400
     * @tc.name testTypedUArraysValuesPart101_074
     * @tc.desc Verify BigUint64Array [1n]values() 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7500
     * @tc.name testTypedUArraysValuesPart101_075
     * @tc.desc Verify BigUint64Array [BigInt('18446744073709551615')]values() BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7600
     * @tc.name testTypedUArraysValuesPart101_076
     * @tc.desc Verify BigUint64Array [0n,1n,BigInt('18446744073709551615')]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615')]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0n);
      expect(r2.value).assertEqual(1n);
      expect(r3.value).assertEqual(BigInt('18446744073709551615'));
      expect(r4.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7700
     * @tc.name testTypedUArraysValuesPart101_077
     * @tc.desc Verify BigUint64Array values() 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0n);
      expect(r2.value).assertEqual(0n);
      expect(r3.value).assertEqual(0n);
      expect(r4.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7800
     * @tc.name testTypedUArraysValuesPart101_078
     * @tc.desc Verify BigUint64Array values() BigInt('18446744073709551615'))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(BigInt('18446744073709551615'));
      expect(r2.value).assertEqual(BigInt('18446744073709551615'));
      expect(r3.value).assertEqual(BigInt('18446744073709551615'));
      expect(r4.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_7900
     * @tc.name testTypedUArraysValuesPart101_079
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551616') values() 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551616')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8000
     * @tc.name testTypedUArraysValuesPart101_080
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551617') values() 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551617')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8100
     * @tc.name testTypedUArraysValuesPart101_081
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        const it = arr.values();
        expect(it).not().assertEqual(null);
      } catch (e) {
        expect(e).not().assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8200
     * @tc.name testTypedUArraysValuesPart101_082
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      try {
        const it = arr.values();
        expect(it).not().assertEqual(null);
      } catch (e) {
        expect(e).not().assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8300
     * @tc.name testTypedUArraysValuesPart101_083
     * @tc.desc Verify values() BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n]);
      try {
        const it = arr.values();
        expect(it).not().assertEqual(null);
      } catch (e) {
        expect(e).not().assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8400
     * @tc.name testTypedUArraysValuesPart101_084
     * @tc.desc Verify values() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      expect(typeof it.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8500
     * @tc.name testTypedUArraysValuesPart101_085
     * @tc.desc Verify values() Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      expect(typeof it).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8600
     * @tc.name testTypedUArraysValuesPart101_086
     * @tc.desc Verify values() next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8700
     * @tc.name testTypedUArraysValuesPart101_087
     * @tc.desc Verify values() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      it.next();
      let result = it.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8800
     * @tc.name testTypedUArraysValuesPart101_088
     * @tc.desc Verify values() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      it.next();
      let result = it.next();
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_8900
     * @tc.name testTypedUArraysValuesPart101_089
     * @tc.desc Verify values() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const it = arr.values();
      let sum: number = 0;
      for (const v of it) {
        sum = sum + v;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9000
     * @tc.name testTypedUArraysValuesPart101_090
     * @tc.desc Verify values() Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15]);
      const it = arr.values();
      const collected = Array.from(it);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(5);
      expect(collected[1]).assertEqual(10);
      expect(collected[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9100
     * @tc.name testTypedUArraysValuesPart101_091
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      const collected = Array.from(it);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(2);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9200
     * @tc.name testTypedUArraysValuesPart101_092
     * @tc.desc Verify values() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const it = arr.values();
      let count = 0;
      for (const v of it) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9300
     * @tc.name testTypedUArraysValuesPart101_093
     * @tc.desc Verify values() Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const it = arr.values();
      const collected = Array.from(it);
      expect(collected.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9400
     * @tc.name testTypedUArraysValuesPart101_094
     * @tc.desc Verify values() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const it = arr.values();
      let count = 0;
      for (const v of it) {
        count = count + 1;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9500
     * @tc.name testTypedUArraysValuesPart101_095
     * @tc.desc Verify values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      let result = it.next();
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9600
     * @tc.name testTypedUArraysValuesPart101_096
     * @tc.desc Verify values() Uint16Array next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0xFFFF);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9700
     * @tc.name testTypedUArraysValuesPart101_097
     * @tc.desc Verify values() Uint32Array next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0xFFFFFFFF);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9800
     * @tc.name testTypedUArraysValuesPart101_098
     * @tc.desc Verify values() BigUint64Array next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(BigInt('18446744073709551615'));
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_9900
     * @tc.name testTypedUArraysValuesPart101_099
     * @tc.desc Verify values() Uint8ClampedArray next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBibrary_UTIL_TYPEDUARRAYS_VALUES_PART101_A100
     * @tc.name testTypedUArraysValuesPart101_100
     * @tc.desc Verify valueOf Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A200
     * @tc.name testTypedUArraysValuesPart101_101
     * @tc.desc Verify valueOf Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A300
     * @tc.name testTypedUArraysValuesPart101_102
     * @tc.desc Verify valueOf BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A400
     * @tc.name testTypedUArraysValuesPart101_103
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A500
     * @tc.name testTypedUArraysValuesPart101_104
     * @tc.desc Verify of Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A600
     * @tc.name testTypedUArraysValuesPart101_105
     * @tc.desc Verify of Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A700
     * @tc.name testTypedUArraysValuesPart101_106
     * @tc.desc Verify of BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(3n);
    });

  });
}
