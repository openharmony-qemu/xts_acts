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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5100
     * @tc.name testTypedUArraysFrom01_050
     * @tc.desc Verify Uint32Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4, 5, 6, 7);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_0001
     * @tc.name testTypedUArraysFrom01_051
     * @tc.desc Verify Uint32Array.from byteLength length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4);
      let result = Uint32Array.from(source);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5200
     * @tc.name testTypedUArraysFrom01_052
     * @tc.desc Verify Uint32Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(10, 20);
      let result = Uint32Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5300
     * @tc.name testTypedUArraysFrom01_053
     * @tc.desc Verify Uint32Array.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint32Array(0);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5400
     * @tc.name testTypedUArraysFrom01_054
     * @tc.desc Verify Uint32Array.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint32Array(0);
      let result = Uint32Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5500
     * @tc.name testTypedUArraysFrom01_055
     * @tc.desc Verify Uint32Array.from 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(4294967295);
      let result = Uint32Array.from(source);
      const val28 = result[0];
      expect(val28).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5600
     * @tc.name testTypedUArraysFrom01_056
     * @tc.desc Verify Uint32Array.from 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(0xFFFFFFFF);
      let result = Uint32Array.from(source);
      const val29 = result[0];
      expect(val29).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5700
     * @tc.name testTypedUArraysFrom01_057
     * @tc.desc Verify Uint32Array.from 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(0x80000000);
      let result = Uint32Array.from(source);
      const val30 = result[0];
      expect(val30).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5800
     * @tc.name testTypedUArraysFrom01_058
     * @tc.desc Verify Uint32Array.from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(0, 0, 0);
      let result = Uint32Array.from(source);
      const val31 = result[0];
      expect(val31).assertEqual(0);
      const val32 = result[2];
      expect(val32).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_5900
     * @tc.name testTypedUArraysFrom01_059
     * @tc.desc Verify Uint32Array.from constructor Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6000
     * @tc.name testTypedUArraysFrom01_060
     * @tc.desc Verify Uint32Array.from BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2);
      let result = Uint32Array.from(source);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6100
     * @tc.name testTypedUArraysFrom01_061
     * @tc.desc Verify Uint32Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(10, 20, 30);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6200
     * @tc.name testTypedUArraysFrom01_062
     * @tc.desc Verify Uint32Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(100, 200, 300);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v * 2 : v * 2);
      const val33 = source[0];
      expect(val33).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6300
     * @tc.name testTypedUArraysFrom01_063
     * @tc.desc Verify Uint32Array.from mapfn byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v : v);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6400
     * @tc.name testTypedUArraysFrom01_064
     * @tc.desc Verify Uint32Array.from mapfn byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(5, 10);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6500
     * @tc.name testTypedUArraysFrom01_065
     * @tc.desc Verify Uint32Array.from mapfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4, 5);
      let result = Uint32Array.from(source, (v: number, k: number): number => k >= 0 ? v : v * k);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6600
     * @tc.name testTypedUArraysFrom01_066
     * @tc.desc Verify Uint8ClampedArray.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(0, 1, 255);
      let result = Uint8ClampedArray.from(source);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6700
     * @tc.name testTypedUArraysFrom01_067
     * @tc.desc Verify Uint8ClampedArray.from instanceof Uint8ClampedArray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(100, 200, 255);
      let result = Uint8ClampedArray.from(source);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6800
     * @tc.name testTypedUArraysFrom01_068
     * @tc.desc Verify Uint8ClampedArray.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_6900
     * @tc.name testTypedUArraysFrom01_069
     * @tc.desc Verify Uint8ClampedArray.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(5, 10, 15);
      let result = Uint8ClampedArray.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7000
     * @tc.name testTypedUArraysFrom01_070
     * @tc.desc Verify Uint8ClampedArray.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3);
      let result = Uint8ClampedArray.from(source);
      const val37 = source[0];
      expect(val37).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7100
     * @tc.name testTypedUArraysFrom01_071
     * @tc.desc Verify Uint8ClampedArray.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      let result = Uint8ClampedArray.from(source);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7200
     * @tc.name testTypedUArraysFrom01_072
     * @tc.desc Verify Uint8ClampedArray.from byteLength length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3, 4);
      let result = Uint8ClampedArray.from(source);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7300
     * @tc.name testTypedUArraysFrom01_073
     * @tc.desc Verify Uint8ClampedArray.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(10, 20);
      let result = Uint8ClampedArray.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7400
     * @tc.name testTypedUArraysFrom01_074
     * @tc.desc Verify Uint8ClampedArray.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8ClampedArray(0);
      let result = Uint8ClampedArray.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7500
     * @tc.name testTypedUArraysFrom01_075
     * @tc.desc Verify Uint8ClampedArray.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8ClampedArray(0);
      let result = Uint8ClampedArray.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7600
     * @tc.name testTypedUArraysFrom01_076
     * @tc.desc Verify Uint8ClampedArray.from 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(255);
      let result = Uint8ClampedArray.from(source);
      const val38 = result[0];
      expect(val38).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7700
     * @tc.name testTypedUArraysFrom01_077
     * @tc.desc Verify Uint8ClampedArray.from 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(0xFF);
      let result = Uint8ClampedArray.from(source);
      const val39 = result[0];
      expect(val39).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7800
     * @tc.name testTypedUArraysFrom01_078
     * @tc.desc Verify Uint8ClampedArray.from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(0, 0, 0);
      let result = Uint8ClampedArray.from(source);
      const val40 = result[0];
      expect(val40).assertEqual(0);
      const val41 = result[2];
      expect(val41).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_7900
     * @tc.name testTypedUArraysFrom01_079
     * @tc.desc Verify Uint8ClampedArray.from constructor Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2);
      let result = Uint8ClampedArray.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8000
     * @tc.name testTypedUArraysFrom01_080
     * @tc.desc Verify Uint8ClampedArray.from BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2);
      let result = Uint8ClampedArray.from(source);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8100
     * @tc.name testTypedUArraysFrom01_081
     * @tc.desc Verify Uint8ClampedArray.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(10, 20, 30);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8200
     * @tc.name testTypedUArraysFrom01_082
     * @tc.desc Verify Uint8ClampedArray.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(100, 200, 255);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v * 2 : v * 2);
      const val42 = source[0];
      expect(val42).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8300
     * @tc.name testTypedUArraysFrom01_083
     * @tc.desc Verify Uint8ClampedArray.from mapfn byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v : v);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8400
     * @tc.name testTypedUArraysFrom01_084
     * @tc.desc Verify Uint8ClampedArray.from mapfn byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(5, 10);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v : v + k);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8500
     * @tc.name testTypedUArraysFrom01_085
     * @tc.desc Verify Uint8ClampedArray.from mapfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      let result = Uint8ClampedArray.from(source, (v: number, k: number): number => k >= 0 ? v : v * k);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8600
     * @tc.name testTypedUArraysFrom01_086
     * @tc.desc Verify BigUint64Array.from typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(0n, 1n, BigInt('18446744073709551615'));
      let result = BigUint64Array.from(source);
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8700
     * @tc.name testTypedUArraysFrom01_087
     * @tc.desc Verify BigUint64Array.from instanceof BigUint64Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(100n, 200n, 300n);
      let result = BigUint64Array.from(source);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8800
     * @tc.name testTypedUArraysFrom01_088
     * @tc.desc Verify BigUint64Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_8900
     * @tc.name testTypedUArraysFrom01_089
     * @tc.desc Verify BigUint64Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(5n, 10n, 15n);
      let result = BigUint64Array.from(source);
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9000
     * @tc.name testTypedUArraysFrom01_090
     * @tc.desc Verify BigUint64Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n);
      let result = BigUint64Array.from(source);
      const val46 = source[0];
      expect(val46).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9100
     * @tc.name testTypedUArraysFrom01_091
     * @tc.desc Verify BigUint64Array.from length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9200
     * @tc.name testTypedUArraysFrom01_092
     * @tc.desc Verify BigUint64Array.from byteLength length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n, 4n);
      let result = BigUint64Array.from(source);
      expect(result.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9300
     * @tc.name testTypedUArraysFrom01_093
     * @tc.desc Verify BigUint64Array.from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(10n, 20n);
      let result = BigUint64Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9400
     * @tc.name testTypedUArraysFrom01_094
     * @tc.desc Verify BigUint64Array.from length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new BigUint64Array(0);
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9500
     * @tc.name testTypedUArraysFrom01_095
     * @tc.desc Verify BigUint64Array.from byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new BigUint64Array(0);
      let result = BigUint64Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9600
     * @tc.name testTypedUArraysFrom01_096
     * @tc.desc Verify BigUint64Array.from BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(BigInt('18446744073709551615'));
      let result = BigUint64Array.from(source);
      const val47 = result[0];
      expect(val47).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9700
     * @tc.name testTypedUArraysFrom01_097
     * @tc.desc Verify BigUint64Array.from 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(0n);
      let result = BigUint64Array.from(source);
      const val48 = result[0];
      expect(val48).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9800
     * @tc.name testTypedUArraysFrom01_098
     * @tc.desc Verify BigUint64Array.from 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n);
      let result = BigUint64Array.from(source);
      const val49 = result[0];
      expect(val49).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM01_9900
     * @tc.name testTypedUArraysFrom01_099
     * @tc.desc Verify BigUint64Array.from 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom01_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(0n, 0n, 0n);
      let result = BigUint64Array.from(source);
      const val50 = result[0];
      expect(val50).assertEqual(0n);
      const val51 = result[2];
      expect(val51).assertEqual(0n);
    });

  });
}
