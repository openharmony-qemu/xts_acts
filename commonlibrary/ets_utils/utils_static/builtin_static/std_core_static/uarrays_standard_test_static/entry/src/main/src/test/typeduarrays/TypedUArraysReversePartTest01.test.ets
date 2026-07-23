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

export default function typedUArraysReversePartTest01(): void {
  describe('TypedUArraysReversePartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0100
     * @tc.name testTypedUArraysReversePart101_001
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5000
     * @tc.name testTypedUArraysReversePart101_050
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x1, 0x2, 0x3, 0xFF]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val72 = arr[3] ;
      expect(val72).assertEqual(0x1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5100
     * @tc.name testTypedUArraysReversePart101_051
     * @tc.desc Verify Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x1, 0x2, 0x3, 0xFFFF]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val74 = arr[3] ;
      expect(val74).assertEqual(0x1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5200
     * @tc.name testTypedUArraysReversePart101_052
     * @tc.desc Verify Uint32Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x1, 0x2, 0x3, 0xFFFFFFFF]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val76 = arr[3] ;
      expect(val76).assertEqual(0x1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5300
     * @tc.name testTypedUArraysReversePart101_053
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0o1, 0o2, 0o3, 0o377]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val78 = arr[3] ;
      expect(val78).assertEqual(0o1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5400
     * @tc.name testTypedUArraysReversePart101_054
     * @tc.desc Verify Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0o1, 0o2, 0o3, 0o177777]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val80 = arr[3] ;
      expect(val80).assertEqual(0o1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5500
     * @tc.name testTypedUArraysReversePart101_055
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b1, 0b10, 0b11, 0b11111111]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val82 = arr[3] ;
      expect(val82).assertEqual(0b1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5600
     * @tc.name testTypedUArraysReversePart101_056
     * @tc.desc Verify Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0b1, 0b10, 0b11, 0b1111111111111111]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val84 = arr[3] ;
      expect(val84).assertEqual(0b1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5700
     * @tc.name testTypedUArraysReversePart101_057
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1e2, 2e2, 3e2]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val86 = arr[2] ;
      expect(val86).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5800
     * @tc.name testTypedUArraysReversePart101_058
     * @tc.desc Verify Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1e2, 2e2, 3e2]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val88 = arr[2] ;
      expect(val88).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_5900
     * @tc.name testTypedUArraysReversePart101_059
     * @tc.desc Verify 256 Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val90 = arr[2] ;
      expect(val90).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6000
     * @tc.name testTypedUArraysReversePart101_060
     * @tc.desc Verify 65536 Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val92 = arr[2] ;
      expect(val92).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6100
     * @tc.name testTypedUArraysReversePart101_061
     * @tc.desc Verify 4294967296 Uint32Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val94 = arr[2] ;
      expect(val94).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6200
     * @tc.name testTypedUArraysReversePart101_062
     * @tc.desc Verify 18446744073709551616n BigUint64Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([18446744073709551616n, 0n, 1n]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val96 = arr[2];
      expect(val96).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6300
     * @tc.name testTypedUArraysReversePart101_063
     * @tc.desc Verify 0x100 Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x100, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val98 = arr[2] ;
      expect(val98).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6400
     * @tc.name testTypedUArraysReversePart101_064
     * @tc.desc Verify 0x10000 Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10000, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val100 = arr[2] ;
      expect(val100).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6500
     * @tc.name testTypedUArraysReversePart101_065
     * @tc.desc Verify 0x100000000 Uint32Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x100000000, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val102 = arr[2] ;
      expect(val102).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6600
     * @tc.name testTypedUArraysReversePart101_066
     * @tc.desc Verify -1 Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val104 = arr[2] ;
      expect(val104).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6700
     * @tc.name testTypedUArraysReversePart101_067
     * @tc.desc Verify -1 Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val106 = arr[2] ;
      expect(val106).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6800
     * @tc.name testTypedUArraysReversePart101_068
     * @tc.desc Verify -1 Uint32Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val108 = arr[2] ;
      expect(val108).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_6900
     * @tc.name testTypedUArraysReversePart101_069
     * @tc.desc Verify 256 Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val110 = arr[2] ;
      expect(val110).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7000
     * @tc.name testTypedUArraysReversePart101_070
     * @tc.desc Verify -1 Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val112 = arr[2] ;
      expect(val112).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7100
     * @tc.name testTypedUArraysReversePart101_071
     * @tc.desc Verify 1000 Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1000, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val114 = arr[2] ;
      expect(val114).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7200
     * @tc.name testTypedUArraysReversePart101_072
     * @tc.desc Verify -1000 Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1000, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val116 = arr[2] ;
      expect(val116).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7300
     * @tc.name testTypedUArraysReversePart101_073
     * @tc.desc Verify 255.9 Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255.9, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val118 = arr[2] ;
      expect(val118).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7400
     * @tc.name testTypedUArraysReversePart101_074
     * @tc.desc Verify -0.5 Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-0.5, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val120 = arr[2] ;
      expect(val120).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7500
     * @tc.name testTypedUArraysReversePart101_075
     * @tc.desc Verify Infinity Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val122 = arr[2] ;
      expect(val122).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7600
     * @tc.name testTypedUArraysReversePart101_076
     * @tc.desc Verify -Infinity Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val124 = arr[2] ;
      expect(val124).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7700
     * @tc.name testTypedUArraysReversePart101_077
     * @tc.desc Verify NaN Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 0, 1]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      const val126 = arr[2] ;
      expect(val126).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7800
     * @tc.name testTypedUArraysReversePart101_078
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_7900
     * @tc.name testTypedUArraysReversePart101_079
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8000
     * @tc.name testTypedUArraysReversePart101_080
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8100
     * @tc.name testTypedUArraysReversePart101_081
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8200
     * @tc.name testTypedUArraysReversePart101_082
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8300
     * @tc.name testTypedUArraysReversePart101_083
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8400
     * @tc.name testTypedUArraysReversePart101_084
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8500
     * @tc.name testTypedUArraysReversePart101_085
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8600
     * @tc.name testTypedUArraysReversePart101_086
     * @tc.desc Verify reverse length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const lenBefore = arr.length;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8700
     * @tc.name testTypedUArraysReversePart101_087
     * @tc.desc Verify reverse length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const lenBefore = arr.length;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8800
     * @tc.name testTypedUArraysReversePart101_088
     * @tc.desc Verify reverse BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const bpe = Uint8Array.BYTES_PER_ELEMENT;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_8900
     * @tc.name testTypedUArraysReversePart101_089
     * @tc.desc Verify reverse BYTES_PER_ELEMENT Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const bpe = Uint16Array.BYTES_PER_ELEMENT;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9000
     * @tc.name testTypedUArraysReversePart101_090
     * @tc.desc Verify reverse BYTES_PER_ELEMENT Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const bpe = Uint32Array.BYTES_PER_ELEMENT;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9100
     * @tc.name testTypedUArraysReversePart101_091
     * @tc.desc Verify reverse BYTES_PER_ELEMENT BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const bpe = BigUint64Array.BYTES_PER_ELEMENT;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9200
     * @tc.name testTypedUArraysReversePart101_092
     * @tc.desc Verify reverse byteLength Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const bl = arr.byteLength;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(arr.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9300
     * @tc.name testTypedUArraysReversePart101_093
     * @tc.desc Verify reverse byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      const bl = arr.byteLength;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(arr.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9400
     * @tc.name testTypedUArraysReversePart101_094
     * @tc.desc Verify reverse byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint8Array(buffer, 4, 4);
      const bo = arr.byteOffset;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(arr.byteOffset).assertEqual(bo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9500
     * @tc.name testTypedUArraysReversePart101_095
     * @tc.desc Verify reverse byteOffset Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint16Array(buffer, 4, 4);
      const bo = arr.byteOffset;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(arr.byteOffset).assertEqual(bo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9600
     * @tc.name testTypedUArraysReversePart101_096
     * @tc.desc Verify reverse buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(12);
      const arr = new Uint8Array(buffer);
      const bufBefore = arr.buffer;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(arr.buffer === bufBefore).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9700
     * @tc.name testTypedUArraysReversePart101_097
     * @tc.desc Verify reverse buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(12);
      const arr = new Uint16Array(buffer);
      const bufBefore = arr.buffer;
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(arr.buffer === bufBefore).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9800
     * @tc.name testTypedUArraysReversePart101_098
     * @tc.desc Verify reverse constructor.name Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(result instanceof Uint8Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_9900
     * @tc.name testTypedUArraysReversePart101_099
     * @tc.desc Verify reverse constructor.name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result === arr).assertTrue();
      expect(result instanceof Uint16Array).assertTrue();
    });
  });
}
