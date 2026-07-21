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

export default function typedUArraysToStringTest05(): void {
  describe('TypedUArraysToStringTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_0100
     * @tc.name testTypedUArraysToString01_001
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      arr.toString();
      const val3 = arr[0];
      expect(val3).assertEqual(1);
      const val4 = arr[1];
      expect(val4).assertEqual(2);
      const val5 = arr[2];
      expect(val5).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5100
     * @tc.name testTypedUArraysToString01_051
     * @tc.desc Verify Uint32Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      arr.toString();
      const val6 = arr[0];
      expect(val6).assertEqual(1);
      const val7 = arr[1];
      expect(val7).assertEqual(2);
      const val8 = arr[2];
      expect(val8).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5200
     * @tc.name testTypedUArraysToString01_052
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.toString();
      const val9 = arr[0];
      expect(val9).assertEqual(1n);
      const val10 = arr[1];
      expect(val10).assertEqual(2n);
      const val11 = arr[2];
      expect(val11).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5300
     * @tc.name testTypedUArraysToString01_053
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const r1 = arr.toString();
      const r2 = arr.toString();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5400
     * @tc.name testTypedUArraysToString01_054
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const r1 = arr.toString();
      const r2 = arr.toString();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5500
     * @tc.name testTypedUArraysToString01_055
     * @tc.desc Verify Uint8Array 0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5600
     * @tc.name testTypedUArraysToString01_056
     * @tc.desc Verify Uint8Array 127 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127, 128, 129]);
      let result = arr.toString();
      expect(result).assertEqual("127,128,129");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5700
     * @tc.name testTypedUArraysToString01_057
     * @tc.desc Verify Uint8Array 255 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 254, 253]);
      let result = arr.toString();
      expect(result).assertEqual("255,254,253");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5800
     * @tc.name testTypedUArraysToString01_058
     * @tc.desc Verify Uint8Array 0x80 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x80, 0x40, 0xC0]);
      let result = arr.toString();
      expect(result).assertEqual("128,64,192");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_5900
     * @tc.name testTypedUArraysToString01_059
     * @tc.desc Verify Uint8Array 0xFF toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0xFE, 0xFD]);
      let result = arr.toString();
      expect(result).assertEqual("255,254,253");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6000
     * @tc.name testTypedUArraysToString01_060
     * @tc.desc Verify Uint8Array 0b11111111 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b11111111, 0b10000000]);
      let result = arr.toString();
      expect(result).assertEqual("255,128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6100
     * @tc.name testTypedUArraysToString01_061
     * @tc.desc Verify Uint8Array 0b00000000 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b00000000, 0b00000001]);
      let result = arr.toString();
      expect(result).assertEqual("0,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6200
     * @tc.name testTypedUArraysToString01_062
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6300
     * @tc.name testTypedUArraysToString01_063
     * @tc.desc Verify Uint8Array 255 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255]);
      let result = arr.toString();
      expect(result).assertEqual("255,255,255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6400
     * @tc.name testTypedUArraysToString01_064
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42]);
      let result = arr.toString();
      expect(result).assertEqual("42,42,42,42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6500
     * @tc.name testTypedUArraysToString01_065
     * @tc.desc Verify Uint16Array 0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6600
     * @tc.name testTypedUArraysToString01_066
     * @tc.desc Verify Uint16Array 32767 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32767, 32768, 32769]);
      let result = arr.toString();
      expect(result).assertEqual("32767,32768,32769");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6700
     * @tc.name testTypedUArraysToString01_067
     * @tc.desc Verify Uint16Array 65535 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65534, 65533]);
      let result = arr.toString();
      expect(result).assertEqual("65535,65534,65533");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6800
     * @tc.name testTypedUArraysToString01_068
     * @tc.desc Verify Uint16Array 0x8000 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x8000, 0x4000, 0xC000]);
      let result = arr.toString();
      expect(result).assertEqual("32768,16384,49152");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_6900
     * @tc.name testTypedUArraysToString01_069
     * @tc.desc Verify Uint16Array 0xFFFF toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0xFFFE, 0xFFFD]);
      let result = arr.toString();
      expect(result).assertEqual("65535,65534,65533");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7000
     * @tc.name testTypedUArraysToString01_070
     * @tc.desc Verify Uint16Array 0b1111111111111111 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0b1111111111111111, 0b1000000000000000]);
      let result = arr.toString();
      expect(result).assertEqual("65535,32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7100
     * @tc.name testTypedUArraysToString01_071
     * @tc.desc Verify Uint16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0]);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7200
     * @tc.name testTypedUArraysToString01_072
     * @tc.desc Verify Uint16Array 65535 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65535, 65535]);
      let result = arr.toString();
      expect(result).assertEqual("65535,65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7300
     * @tc.name testTypedUArraysToString01_073
     * @tc.desc Verify Uint32Array 0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7400
     * @tc.name testTypedUArraysToString01_074
     * @tc.desc Verify Uint32Array 2147483647 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483647, 2147483648, 2147483649]);
      let result = arr.toString();
      expect(result).assertEqual("2147483647,2147483648,2147483649");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7500
     * @tc.name testTypedUArraysToString01_075
     * @tc.desc Verify Uint32Array 4294967295 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967294, 4294967293]);
      let result = arr.toString();
      expect(result).assertEqual("4294967295,4294967294,4294967293");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7600
     * @tc.name testTypedUArraysToString01_076
     * @tc.desc Verify Uint32Array 0x80000000 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x80000000, 0x40000000, 0xC0000000]);
      let result = arr.toString();
      expect(result).assertEqual("2147483648,1073741824,3221225472");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7700
     * @tc.name testTypedUArraysToString01_077
     * @tc.desc Verify Uint32Array 0xFFFFFFFF toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0xFFFFFFFE, 0xFFFFFFFD]);
      let result = arr.toString();
      expect(result).assertEqual("4294967295,4294967294,4294967293");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7800
     * @tc.name testTypedUArraysToString01_078
     * @tc.desc Verify Uint32Array 1e10 wrapping toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1e10, 1e5, 1000]);
      let result = arr.toString();
      expect(result).assertEqual("1410065408,100000,1000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_7900
     * @tc.name testTypedUArraysToString01_079
     * @tc.desc Verify Uint32Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0, 0]);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8000
     * @tc.name testTypedUArraysToString01_080
     * @tc.desc Verify Uint32Array 4294967295 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      let result = arr.toString();
      expect(result).assertEqual("4294967295,4294967295,4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8100
     * @tc.name testTypedUArraysToString01_081
     * @tc.desc Verify Uint8ClampedArray 0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8200
     * @tc.name testTypedUArraysToString01_082
     * @tc.desc Verify Uint8ClampedArray 127 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128, 129]);
      let result = arr.toString();
      expect(result).assertEqual("127,128,129");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8300
     * @tc.name testTypedUArraysToString01_083
     * @tc.desc Verify Uint8ClampedArray 255 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 254, 253]);
      let result = arr.toString();
      expect(result).assertEqual("255,254,253");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8400
     * @tc.name testTypedUArraysToString01_084
     * @tc.desc Verify Uint8ClampedArray 0x80 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x80, 0x40, 0xC0]);
      let result = arr.toString();
      expect(result).assertEqual("128,64,192");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8500
     * @tc.name testTypedUArraysToString01_085
     * @tc.desc Verify Uint8ClampedArray 0xFF toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0xFE, 0xFD]);
      let result = arr.toString();
      expect(result).assertEqual("255,254,253");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8600
     * @tc.name testTypedUArraysToString01_086
     * @tc.desc Verify Uint8ClampedArray toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8700
     * @tc.name testTypedUArraysToString01_087
     * @tc.desc Verify Uint8ClampedArray 255 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      let result = arr.toString();
      expect(result).assertEqual("255,255,255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8800
     * @tc.name testTypedUArraysToString01_088
     * @tc.desc Verify BigUint64Array 0n toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_8900
     * @tc.name testTypedUArraysToString01_089
     * @tc.desc Verify BigUint64Array 1n toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.toString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9000
     * @tc.name testTypedUArraysToString01_090
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551614')]);
      let result = arr.toString();
      expect(result).assertEqual("18446744073709551615,18446744073709551614");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9100
     * @tc.name testTypedUArraysToString01_091
     * @tc.desc Verify BigUint64Array BigInt('0xFFFFFFFFFFFFFFFF') toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('0xFFFFFFFFFFFFFFFF'), BigInt('0xFFFFFFFFFFFFFFFE')]);
      let result = arr.toString();
      expect(result).assertEqual("18446744073709551615,18446744073709551614");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9200
     * @tc.name testTypedUArraysToString01_092
     * @tc.desc Verify BigUint64Array BigInt('0x8000000000000000') toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('0x8000000000000000'), BigInt('0x4000000000000000')]);
      let result = arr.toString();
      expect(result).assertEqual("9223372036854775808,4611686018427387904");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9300
     * @tc.name testTypedUArraysToString01_093
     * @tc.desc Verify BigUint64Array BigInt('9223372036854775808') toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('9223372036854775808'), BigInt('9223372036854775807')]);
      let result = arr.toString();
      expect(result).assertEqual("9223372036854775808,9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9400
     * @tc.name testTypedUArraysToString01_094
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n]);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9500
     * @tc.name testTypedUArraysToString01_095
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      let result = arr.toString();
      expect(result).assertEqual("18446744073709551615,18446744073709551615");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9600
     * @tc.name testTypedUArraysToString01_096
     * @tc.desc Verify Uint8Array NaN toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9700
     * @tc.name testTypedUArraysToString01_097
     * @tc.desc Verify Uint16Array NaN toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.NaN, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9800
     * @tc.name testTypedUArraysToString01_098
     * @tc.desc Verify Uint32Array NaN toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([Number.NaN, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING01_9900
     * @tc.name testTypedUArraysToString01_099
     * @tc.desc Verify Uint8ClampedArray NaN toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

  });
}
