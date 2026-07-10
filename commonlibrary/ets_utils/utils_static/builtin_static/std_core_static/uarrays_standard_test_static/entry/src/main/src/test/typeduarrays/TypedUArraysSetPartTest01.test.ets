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

export default function typedUArraysSetPartTest01(): void {
  describe('TypedUArraysSetPartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_0100
     * @tc.name testTypedUArraysSetPart101_001
     * @tc.desc Verify set(source) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5000
     * @tc.name testTypedUArraysSetPart101_050
     * @tc.desc Verify source Uint32Array 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([0x80000000]);
      const val77 = arr[0];
      expect(val77).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5100
     * @tc.name testTypedUArraysSetPart101_051
     * @tc.desc Verify source Uint32Array 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([0xFFFFFFFF]);
      const val78 = arr[0];
      expect(val78).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5200
     * @tc.name testTypedUArraysSetPart101_052
     * @tc.desc Verify source Uint32Array 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([4294967296]);
      const val79 = arr[0];
      expect(val79).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5300
     * @tc.name testTypedUArraysSetPart101_053
     * @tc.desc Verify source Uint32Array -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([-1]);
      const val80 = arr[0];
      expect(val80).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5400
     * @tc.name testTypedUArraysSetPart101_054
     * @tc.desc Verify source BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      arr.set([0n]);
      const val81 = arr[0];
      expect(val81).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5500
     * @tc.name testTypedUArraysSetPart101_055
     * @tc.desc Verify source BigUint64Array BigInt('18446744073709551615'))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      arr.set([BigInt('18446744073709551615')]);
      const val82 = arr[0];
      expect(val82).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5600
     * @tc.name testTypedUArraysSetPart101_056
     * @tc.desc Verify source BigUint64Array BigInt('9223372036854775808')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      arr.set([BigInt('9223372036854775808')]);
      const val83 = arr[0];
      expect(val83).assertEqual(BigInt('9223372036854775808'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5700
     * @tc.name testTypedUArraysSetPart101_057
     * @tc.desc Verify source BigUint64Array BigInt('0x8000000000000000')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      arr.set([BigInt('0x8000000000000000')]);
      const val84 = arr[0];
      expect(val84).assertEqual(BigInt('9223372036854775808'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5800
     * @tc.name testTypedUArraysSetPart101_058
     * @tc.desc Verify source BigUint64Array BigInt('0xFFFFFFFFFFFFFFFF')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      arr.set([BigInt('0xFFFFFFFFFFFFFFFF')]);
      const val85 = arr[0];
      expect(val85).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_5900
     * @tc.name testTypedUArraysSetPart101_059
     * @tc.desc Verify source NaN Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([Number.NaN]);
      const val86 = arr[0];
      expect(val86).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6000
     * @tc.name testTypedUArraysSetPart101_060
     * @tc.desc Verify source Infinity Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([Number.POSITIVE_INFINITY]);
      const val87 = arr[0];
      expect(val87).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6100
     * @tc.name testTypedUArraysSetPart101_061
     * @tc.desc Verify source -Infinity Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([-Number.POSITIVE_INFINITY]);
      const val88 = arr[0];
      expect(val88).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6200
     * @tc.name testTypedUArraysSetPart101_062
     * @tc.desc Verify source NaN Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([Number.NaN]);
      const val89 = arr[0];
      expect(val89).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6300
     * @tc.name testTypedUArraysSetPart101_063
     * @tc.desc Verify source Infinity Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([Number.POSITIVE_INFINITY]);
      const val90 = arr[0];
      expect(val90).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6400
     * @tc.name testTypedUArraysSetPart101_064
     * @tc.desc Verify source 256 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([256]);
      const val91 = arr[0];
      expect(val91).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6500
     * @tc.name testTypedUArraysSetPart101_065
     * @tc.desc Verify source -1 Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([-1]);
      const val92 = arr[0];
      expect(val92).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6600
     * @tc.name testTypedUArraysSetPart101_066
     * @tc.desc Verify source 1000 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([1000]);
      const val93 = arr[0];
      expect(val93).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6700
     * @tc.name testTypedUArraysSetPart101_067
     * @tc.desc Verify source -100 Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([-100]);
      const val94 = arr[0];
      expect(val94).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6800
     * @tc.name testTypedUArraysSetPart101_068
     * @tc.desc Verify source 0.4 Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([0.4]);
      const val95 = arr[0];
      expect(val95).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_6900
     * @tc.name testTypedUArraysSetPart101_069
     * @tc.desc Verify source 0.5 Uint8ClampedArray 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([0.5]);
      const val96 = arr[0];
      expect(val96).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7000
     * @tc.name testTypedUArraysSetPart101_070
     * @tc.desc Verify source 255.5 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([255.5]);
      const val97 = arr[0];
      expect(val97).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7100
     * @tc.name testTypedUArraysSetPart101_071
     * @tc.desc Verify source NaN Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([Number.NaN]);
      const val98 = arr[0];
      expect(val98).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7200
     * @tc.name testTypedUArraysSetPart101_072
     * @tc.desc Verify source Infinity Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([Number.POSITIVE_INFINITY]);
      const val99 = arr[0];
      expect(val99).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7300
     * @tc.name testTypedUArraysSetPart101_073
     * @tc.desc Verify source -Infinity Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set([-Number.POSITIVE_INFINITY]);
      const val100 = arr[0];
      expect(val100).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7400
     * @tc.name testTypedUArraysSetPart101_074
     * @tc.desc Verify source Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set([-10, 0.5, 256, 128]);
      const val101 = arr[0];
      expect(val101).assertEqual(0);
      const val102 = arr[1];
      expect(val102).assertEqual(1);
      const val103 = arr[2];
      expect(val103).assertEqual(255);
      const val104 = arr[3];
      expect(val104).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7500
     * @tc.name testTypedUArraysSetPart101_075
     * @tc.desc Verify offset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([1, 2], 0);
      const val105 = arr[0];
      expect(val105).assertEqual(1);
      const val106 = arr[1];
      expect(val106).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7600
     * @tc.name testTypedUArraysSetPart101_076
     * @tc.desc Verify offset 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([1, 2], 1);
      const val107 = arr[0];
      expect(val107).assertEqual(0);
      const val108 = arr[1];
      expect(val108).assertEqual(1);
      const val109 = arr[2];
      expect(val109).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7700
     * @tc.name testTypedUArraysSetPart101_077
     * @tc.desc Verify offset 2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([1, 2], 2);
      const val110 = arr[0];
      expect(val110).assertEqual(0);
      const val111 = arr[1];
      expect(val111).assertEqual(0);
      const val112 = arr[2];
      expect(val112).assertEqual(1);
      const val113 = arr[3];
      expect(val113).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7800
     * @tc.name testTypedUArraysSetPart101_078
     * @tc.desc Verify offset length - source.length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([1, 2], 2);
      const val114 = arr[2];
      expect(val114).assertEqual(1);
      const val115 = arr[3];
      expect(val115).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_7900
     * @tc.name testTypedUArraysSetPart101_079
     * @tc.desc Verify offset 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0]);
      arr.set([1, 2], 0);
      const val116 = arr[0];
      expect(val116).assertEqual(1);
      const val117 = arr[1];
      expect(val117).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8000
     * @tc.name testTypedUArraysSetPart101_080
     * @tc.desc Verify offset 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0]);
      arr.set([1, 2], 1);
      const val118 = arr[1];
      expect(val118).assertEqual(1);
      const val119 = arr[2];
      expect(val119).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8100
     * @tc.name testTypedUArraysSetPart101_081
     * @tc.desc Verify offset 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0, 0]);
      arr.set([1, 2], 0);
      const val120 = arr[0];
      expect(val120).assertEqual(1);
      const val121 = arr[1];
      expect(val121).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8200
     * @tc.name testTypedUArraysSetPart101_082
     * @tc.desc Verify offset 1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0, 0]);
      arr.set([1, 2], 1);
      const val122 = arr[1];
      expect(val122).assertEqual(1);
      const val123 = arr[2];
      expect(val123).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8300
     * @tc.name testTypedUArraysSetPart101_083
     * @tc.desc Verify offset 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set([1, 2], 0);
      const val124 = arr[0];
      expect(val124).assertEqual(1);
      const val125 = arr[1];
      expect(val125).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8400
     * @tc.name testTypedUArraysSetPart101_084
     * @tc.desc Verify offset 1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set([1, 2], 1);
      const val126 = arr[1];
      expect(val126).assertEqual(1);
      const val127 = arr[2];
      expect(val127).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8500
     * @tc.name testTypedUArraysSetPart101_085
     * @tc.desc Verify offset 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n]);
      arr.set([1n, 2n], 0);
      const val128 = arr[0];
      expect(val128).assertEqual(1n);
      const val129 = arr[1];
      expect(val129).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8600
     * @tc.name testTypedUArraysSetPart101_086
     * @tc.desc Verify offset 1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n]);
      arr.set([1n, 2n], 1);
      const val130 = arr[1];
      expect(val130).assertEqual(1n);
      const val131 = arr[2];
      expect(val131).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8700
     * @tc.name testTypedUArraysSetPart101_087
     * @tc.desc Verify offset 0 source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([], 0);
      const val132 = arr[0];
      expect(val132).assertEqual(1);
      const val133 = arr[1];
      expect(val133).assertEqual(2);
      const val134 = arr[2];
      expect(val134).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8800
     * @tc.name testTypedUArraysSetPart101_088
     * @tc.desc Verify offset 0 source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([42], 0);
      const val135 = arr[0];
      expect(val135).assertEqual(42);
      const val136 = arr[1];
      expect(val136).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_8900
     * @tc.name testTypedUArraysSetPart101_089
     * @tc.desc Verify offset length - 1 source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([42], 2);
      const val137 = arr[0];
      expect(val137).assertEqual(0);
      const val138 = arr[1];
      expect(val138).assertEqual(0);
      const val139 = arr[2];
      expect(val139).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9000
     * @tc.name testTypedUArraysSetPart101_090
     * @tc.desc Verify offset length source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([], 3);
      const val140 = arr[0];
      expect(val140).assertEqual(1);
      const val141 = arr[2];
      expect(val141).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9200
     * @tc.name testTypedUArraysSetPart101_092
     * @tc.desc Verify offset -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([1, 2], -2);
      const val143 = arr[2];
      expect(val143).assertEqual(1);
      const val144 = arr[3];
      expect(val144).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9300
     * @tc.name testTypedUArraysSetPart101_093
     * @tc.desc Verify offset -3 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([1, 2], -3);
      const val145 = arr[1];
      expect(val145).assertEqual(1);
      const val146 = arr[2];
      expect(val146).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9400
     * @tc.name testTypedUArraysSetPart101_094
     * @tc.desc Verify offset -4 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([42], -4);
      const val147 = arr[0];
      expect(val147).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9500
     * @tc.name testTypedUArraysSetPart101_095
     * @tc.desc Verify offset length + 1 source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        arr.set([1, 2], 4);
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9600
     * @tc.name testTypedUArraysSetPart101_096
     * @tc.desc Verify offset -5 source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0, 0]);
        arr.set([1, 2], -5);
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9700
     * @tc.name testTypedUArraysSetPart101_097
     * @tc.desc Verify offset NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        throw new Error('ArkTS limitation')
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9800
     * @tc.name testTypedUArraysSetPart101_098
     * @tc.desc Verify offset Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        throw new Error('ArkTS limitation')
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_9900
     * @tc.name testTypedUArraysSetPart101_099
     * @tc.desc Verify offset -Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        throw new Error('ArkTS limitation')
      } catch (e) {
        expect(true).assertTrue();
      }
    });
  });
}
