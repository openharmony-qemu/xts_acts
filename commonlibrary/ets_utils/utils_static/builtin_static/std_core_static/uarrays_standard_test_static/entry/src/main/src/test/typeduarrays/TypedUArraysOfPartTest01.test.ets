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

export default function typedUArraysOfPartTest01(): void {
  describe('TypedUArraysOfPartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0100
     * @tc.name testTypedUArraysOfPart1_001
     * @tc.desc Verify Uint8Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4600
     * @tc.name testTypedUArraysOfPart1_046
     * @tc.desc Verify Uint8Array.of() 0x100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0x100);
      const val28 = arr[0] ;
      expect(val28).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4700
     * @tc.name testTypedUArraysOfPart1_047
     * @tc.desc Verify Uint8Array.of() NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(Number.NaN);
      const val29 = arr[0] ;
      expect(val29).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4800
     * @tc.name testTypedUArraysOfPart1_048
     * @tc.desc Verify Uint8Array.of() Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(Number.POSITIVE_INFINITY);
      const val30 = arr[0] ;
      expect(val30).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4900
     * @tc.name testTypedUArraysOfPart1_049
     * @tc.desc Verify Uint8ClampedArray.of() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(0);
      const val31 = arr[0] ;
      expect(val31).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5000
     * @tc.name testTypedUArraysOfPart1_050
     * @tc.desc Verify Uint8ClampedArray.of() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1);
      const val32 = arr[0] ;
      expect(val32).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5100
     * @tc.name testTypedUArraysOfPart1_051
     * @tc.desc Verify Uint8ClampedArray.of() 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(127);
      const val33 = arr[0] ;
      expect(val33).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5200
     * @tc.name testTypedUArraysOfPart1_052
     * @tc.desc Verify Uint8ClampedArray.of() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(255);
      const val34 = arr[0] ;
      expect(val34).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5300
     * @tc.name testTypedUArraysOfPart1_053
     * @tc.desc Verify Uint8ClampedArray.of() 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(0xFF);
      const val35 = arr[0] ;
      expect(val35).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5400
     * @tc.name testTypedUArraysOfPart1_054
     * @tc.desc Verify Uint8ClampedArray.of() 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(0x80);
      const val36 = arr[0] ;
      expect(val36).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5500
     * @tc.name testTypedUArraysOfPart1_055
     * @tc.desc Verify Uint8ClampedArray.of() -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(-1);
      const val37 = arr[0] ;
      expect(val37).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5600
     * @tc.name testTypedUArraysOfPart1_056
     * @tc.desc Verify Uint8ClampedArray.of() 256 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(256);
      const val38 = arr[0] ;
      expect(val38).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5700
     * @tc.name testTypedUArraysOfPart1_057
     * @tc.desc Verify Uint8ClampedArray.of() 0x100 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(0x100);
      const val39 = arr[0] ;
      expect(val39).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5800
     * @tc.name testTypedUArraysOfPart1_058
     * @tc.desc Verify Uint8ClampedArray.of() NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(Number.NaN);
      const val40 = arr[0] ;
      expect(val40).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_5900
     * @tc.name testTypedUArraysOfPart1_059
     * @tc.desc Verify Uint8ClampedArray.of() Infinity 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(Number.POSITIVE_INFINITY);
      const val41 = arr[0] ;
      expect(val41).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6000
     * @tc.name testTypedUArraysOfPart1_060
     * @tc.desc Verify Uint16Array.of() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const val42 = arr[0] ;
      expect(val42).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6100
     * @tc.name testTypedUArraysOfPart1_061
     * @tc.desc Verify Uint16Array.of() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1);
      const val43 = arr[0] ;
      expect(val43).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6200
     * @tc.name testTypedUArraysOfPart1_062
     * @tc.desc Verify Uint16Array.of() 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(32767);
      const val44 = arr[0] ;
      expect(val44).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6300
     * @tc.name testTypedUArraysOfPart1_063
     * @tc.desc Verify Uint16Array.of() 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const val45 = arr[0] ;
      expect(val45).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6400
     * @tc.name testTypedUArraysOfPart1_064
     * @tc.desc Verify Uint16Array.of() 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0xFFFF);
      const val46 = arr[0] ;
      expect(val46).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6500
     * @tc.name testTypedUArraysOfPart1_065
     * @tc.desc Verify Uint16Array.of() 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0x8000);
      const val47 = arr[0] ;
      expect(val47).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6600
     * @tc.name testTypedUArraysOfPart1_066
     * @tc.desc Verify Uint16Array.of() -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(-1);
      const val48 = arr[0] ;
      expect(val48).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6700
     * @tc.name testTypedUArraysOfPart1_067
     * @tc.desc Verify Uint16Array.of() 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65536);
      const val49 = arr[0] ;
      expect(val49).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6800
     * @tc.name testTypedUArraysOfPart1_068
     * @tc.desc Verify Uint16Array.of() 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0x10000);
      const val50 = arr[0] ;
      expect(val50).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_6900
     * @tc.name testTypedUArraysOfPart1_069
     * @tc.desc Verify Uint16Array.of() NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(Number.NaN);
      const val51 = arr[0] ;
      expect(val51).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7000
     * @tc.name testTypedUArraysOfPart1_070
     * @tc.desc Verify Uint16Array.of() Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(Number.POSITIVE_INFINITY);
      const val52 = arr[0] ;
      expect(val52).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7100
     * @tc.name testTypedUArraysOfPart1_071
     * @tc.desc Verify Uint32Array.of() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      const val53 = arr[0] ;
      expect(val53).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7200
     * @tc.name testTypedUArraysOfPart1_072
     * @tc.desc Verify Uint32Array.of() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const val54 = arr[0] ;
      expect(val54).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7300
     * @tc.name testTypedUArraysOfPart1_073
     * @tc.desc Verify Uint32Array.of() 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      const val55 = arr[0] ;
      expect(val55).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7400
     * @tc.name testTypedUArraysOfPart1_074
     * @tc.desc Verify Uint32Array.of() 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      const val56 = arr[0] ;
      expect(val56).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7500
     * @tc.name testTypedUArraysOfPart1_075
     * @tc.desc Verify Uint32Array.of() 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0xFFFFFFFF);
      const val57 = arr[0] ;
      expect(val57).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7600
     * @tc.name testTypedUArraysOfPart1_076
     * @tc.desc Verify Uint32Array.of() 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x80000000);
      const val58 = arr[0] ;
      expect(val58).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7700
     * @tc.name testTypedUArraysOfPart1_077
     * @tc.desc Verify Uint32Array.of() -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-1);
      const val59 = arr[0] ;
      expect(val59).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7800
     * @tc.name testTypedUArraysOfPart1_078
     * @tc.desc Verify Uint32Array.of() 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967296);
      const val60 = arr[0] ;
      expect(val60).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_7900
     * @tc.name testTypedUArraysOfPart1_079
     * @tc.desc Verify Uint32Array.of() 0x100000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x100000000);
      const val61 = arr[0] ;
      expect(val61).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8000
     * @tc.name testTypedUArraysOfPart1_080
     * @tc.desc Verify Uint32Array.of() NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(Number.NaN);
      const val62 = arr[0] ;
      expect(val62).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8100
     * @tc.name testTypedUArraysOfPart1_081
     * @tc.desc Verify Uint32Array.of() Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(Number.POSITIVE_INFINITY);
      const val63 = arr[0] ;
      expect(val63).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8200
     * @tc.name testTypedUArraysOfPart1_082
     * @tc.desc Verify BigUint64Array.of() 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(0n);
      const val64 = arr[0] ;
      expect(val64).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8300
     * @tc.name testTypedUArraysOfPart1_083
     * @tc.desc Verify BigUint64Array.of() 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n);
      const val65 = arr[0] ;
      expect(val65).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8400
     * @tc.name testTypedUArraysOfPart1_084
     * @tc.desc Verify BigUint64Array.of() BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(BigInt('18446744073709551615'));
      const val66 = arr[0] ;
      expect(val66).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8500
     * @tc.name testTypedUArraysOfPart1_085
     * @tc.desc Verify BigUint64Array.of() BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(BigInt('18446744073709551615'));
      const val67 = arr[0] ;
      expect(val67).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8600
     * @tc.name testTypedUArraysOfPart1_086
     * @tc.desc Verify BigUint64Array.of() BigInt('9223372036854775808')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(BigInt('9223372036854775808'));
      const val68 = arr[0] ;
      expect(val68).assertEqual(BigInt('9223372036854775808'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8700
     * @tc.name testTypedUArraysOfPart1_087
     * @tc.desc Verify BigUint64Array.of() -1n BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(-1n);
      const val69 = arr[0] ;
      expect(val69).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8800
     * @tc.name testTypedUArraysOfPart1_088
     * @tc.desc Verify BigUint64Array.of() 18446744073709551616n 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(18446744073709551616n);
      const val70 = arr[0] ;
      expect(val70).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_8900
     * @tc.name testTypedUArraysOfPart1_089
     * @tc.desc Verify BigUint64Array.of() 0x10000000000000000n 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(0n);
      const val71 = arr[0] ;
      expect(val71).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_9000
     * @tc.name testTypedUArraysOfPart1_090
     * @tc.desc Verify BigUint64Array.of() NaN 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        BigUint64Array.of(Number.NaN);
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_9100
     * @tc.name testTypedUArraysOfPart1_091
     * @tc.desc Verify BigUint64Array.of() Infinity 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart1_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        BigUint64Array.of(Number.POSITIVE_INFINITY);
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
