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

export default function typedUArraysConstructorTest26(): void {
  describe('TypedUArraysConstructorTest26', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0010
     * @tc.name testTypedUArraysConstructor0402_001
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0580
     * @tc.name testTypedUArraysConstructor0402_058
     * @tc.desc Verify [4294967296,4294967297,4294967298] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr[0] = 0;
      arr[1] = 1;
      arr[2] = 2;
      expect(arr.length).assertEqual(3);
      const val95: number = arr[0];
      expect(val95).assertEqual(0);
      const val96: number = arr[1];
      expect(val96).assertEqual(1);
      const val97: number = arr[2];
      expect(val97).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0590
     * @tc.name testTypedUArraysConstructor0402_059
     * @tc.desc Verify [256,257,258] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [256, 257, 258];
      const arr = new Uint8ClampedArray(src);
      const val98: number = arr[0];
      expect(val98).assertEqual(0);
      const val99: number = arr[1];
      expect(val99).assertEqual(1);
      const val100: number = arr[2];
      expect(val100).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0600
     * @tc.name testTypedUArraysConstructor0402_060
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(16);
      const val101: number = arr[0];
      expect(val101).assertEqual(0);
      const val102: number = arr[15];
      expect(val102).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0610
     * @tc.name testTypedUArraysConstructor0402_061
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(16);
      const val103: number = arr[0];
      expect(val103).assertEqual(0);
      const val104: number = arr[15];
      expect(val104).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0620
     * @tc.name testTypedUArraysConstructor0402_062
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
      const arr = new Uint32Array(src);
      expect(arr.length).assertEqual(16);
      const val105: number = arr[0];
      expect(val105).assertEqual(0);
      const val106: number = arr[15];
      expect(val106).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0630
     * @tc.name testTypedUArraysConstructor0402_063
     * @tc.desc Verify [0n,1n,2n,3n,4n,5n,6n,7n,8n,9n,10n,11n,12n,13n,14n,15n] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n, 13n, 14n, 15n];
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(16);
      const val107: BigInt = arr[0];
      expect(val107).assertEqual(0n);
      const val108: BigInt = arr[15];
      expect(val108).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0640
     * @tc.name testTypedUArraysConstructor0402_064
     * @tc.desc Verify [1,2,3] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8ClampedArray(src);
      const val109: number = arr[0];
      expect(val109).assertEqual(1);
      const val110: number = arr[1];
      expect(val110).assertEqual(2);
      const val111: number = arr[2];
      expect(val111).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0650
     * @tc.name testTypedUArraysConstructor0402_065
     * @tc.desc Verify [0,128,255] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 128, 255];
      const arr = new Uint8ClampedArray(src);
      const val112: number = arr[0];
      expect(val112).assertEqual(0);
      const val113: number = arr[1];
      expect(val113).assertEqual(0);
      const val114: number = arr[2];
      expect(val114).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0660
     * @tc.name testTypedUArraysConstructor0402_066
     * @tc.desc Verify [0x00,0x80,0xFF] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x00, 0x80, 0xFF];
      const arr = new Uint8ClampedArray(src);
      const val115: number = arr[0];
      expect(val115).assertEqual(0);
      const val116: number = arr[1];
      expect(val116).assertEqual(0);
      const val117: number = arr[2];
      expect(val117).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0670
     * @tc.name testTypedUArraysConstructor0402_067
     * @tc.desc Verify [0,0,0,0,0] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 0, 0, 0, 0];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(5);
      const val118: number = arr[0];
      expect(val118).assertEqual(0);
      const val119: number = arr[4];
      expect(val119).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0680
     * @tc.name testTypedUArraysConstructor0402_068
     * @tc.desc Verify [255,255,255,255,255] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255, 255, 255, 255, 255];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(5);
      const val120: number = arr[0];
      expect(val120).assertEqual(255);
      const val121: number = arr[4];
      expect(val121).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0690
     * @tc.name testTypedUArraysConstructor0402_069
     * @tc.desc Verify [65535,65535,65535,65535,65535] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [65535, 65535, 65535, 65535, 65535];
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(5);
      const val122: number = arr[0];
      expect(val122).assertEqual(65535);
      const val123: number = arr[4];
      expect(val123).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0700
     * @tc.name testTypedUArraysConstructor0402_070
     * @tc.desc Verify [4294967295,4294967295,4294967295,4294967295,4294967295] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      arr[0] = 100;
      arr[1] = 200;
      arr[2] = 300;
      arr[3] = 400;
      arr[4] = 500;
      expect(arr.length).assertEqual(5);
      const val124: number = arr[0];
      expect(val124).assertEqual(100);
      const val125: number = arr[4];
      expect(val125).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0710
     * @tc.name testTypedUArraysConstructor0402_071
     * @tc.desc Verify [BigInt('18446744073709551615'),BigInt('18446744073709551615'),BigInt('18446744073709551615')] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')];
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
      const val126: BigInt = arr[0];
      expect(val126).assertEqual(BigInt('18446744073709551615'));
      const val127: BigInt = arr[2];
      expect(val127).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0720
     * @tc.name testTypedUArraysConstructor0402_072
     * @tc.desc Verify [0,1,2,3] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3];
      const arr = new Uint8ClampedArray(src);
      const val128: number = arr[0];
      expect(val128).assertEqual(0);
      const val129: number = arr[1];
      expect(val129).assertEqual(1);
      const val130: number = arr[2];
      expect(val130).assertEqual(2);
      const val131: number = arr[3];
      expect(val131).assertEqual(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0730
     * @tc.name testTypedUArraysConstructor0402_073
     * @tc.desc Verify [252,253,254,255] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [252, 253, 254, 255];
      const arr = new Uint8ClampedArray(src);
      const val132: number = arr[0];
      expect(val132).assertEqual(0);
      const val133: number = arr[1];
      expect(val133).assertEqual(0);
      const val134: number = arr[2];
      expect(val134).assertEqual(0);
      const val135: number = arr[3];
      expect(val135).assertEqual(0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0740
     * @tc.name testTypedUArraysConstructor0402_074
     * @tc.desc Verify [0,63,127,191,255] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 63, 127, 191, 255];
      const arr = new Uint8ClampedArray(src);
      const val136: number = arr[0];
      expect(val136).assertEqual(0);
      const val137: number = arr[1];
      expect(val137).assertEqual(63);
      const val138: number = arr[2];
      expect(val138).assertEqual(127);
      const val139: number = arr[3];
      expect(val139).assertEqual(0);
      const val140: number = arr[4];
      expect(val140).assertEqual(0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0750
     * @tc.name testTypedUArraysConstructor0402_075
     * @tc.desc Verify [0,1,2,3,4,5,6,7] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(8);
      const val141: number = arr[0];
      expect(val141).assertEqual(0);
      const val142: number = arr[7];
      expect(val142).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0760
     * @tc.name testTypedUArraysConstructor0402_076
     * @tc.desc Verify [0,0,0,0,0,0,0,0] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 0, 0, 0, 0, 0, 0, 0];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(8);
      const val143: number = arr[0];
      expect(val143).assertEqual(0);
      const val144: number = arr[7];
      expect(val144).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0770
     * @tc.name testTypedUArraysConstructor0402_077
     * @tc.desc Verify [255,255,255,255,255,255,255,255] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255, 255, 255, 255, 255, 255, 255, 255];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(8);
      const val145: number = arr[0];
      expect(val145).assertEqual(0);
      const val146: number = arr[7];
      expect(val146).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0780
     * @tc.name testTypedUArraysConstructor0402_078
     * @tc.desc Verify [128,128,128,128] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [128, 128, 128, 128];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(4);
      const val147: number = arr[0];
      expect(val147).assertEqual(0);
      const val148: number = arr[3];
      expect(val148).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0790
     * @tc.name testTypedUArraysConstructor0402_079
     * @tc.desc Verify [1,2,3,4,5] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3, 4, 5];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(5);
      const val149: number = arr[0];
      expect(val149).assertEqual(1);
      const val150: number = arr[4];
      expect(val150).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0800
     * @tc.name testTypedUArraysConstructor0402_080
     * @tc.desc Verify [10,20,30,40,50,60,70,80,90,100] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(10);
      const val151: number = arr[0];
      expect(val151).assertEqual(10);
      const val152: number = arr[9];
      expect(val152).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0810
     * @tc.name testTypedUArraysConstructor0402_081
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(20);
      const val153: number = arr[0];
      expect(val153).assertEqual(0);
      const val154: number = arr[19];
      expect(val154).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0820
     * @tc.name testTypedUArraysConstructor0402_082
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(20);
      const val155: number = arr[0];
      expect(val155).assertEqual(0);
      const val156: number = arr[19];
      expect(val156).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0830
     * @tc.name testTypedUArraysConstructor0402_083
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(20);
      const val157: number = arr[0];
      expect(val157).assertEqual(0);
      const val158: number = arr[19];
      expect(val158).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0840
     * @tc.name testTypedUArraysConstructor0402_084
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
      const arr = new Uint32Array(src);
      expect(arr.length).assertEqual(20);
      const val159: number = arr[0];
      expect(val159).assertEqual(0);
      const val160: number = arr[19];
      expect(val160).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0850
     * @tc.name testTypedUArraysConstructor0402_085
     * @tc.desc Verify [0n,1n,2n,3n,4n,5n,6n,7n,8n,9n,10n,11n,12n,13n,14n,15n,16n,17n,18n,19n] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n, 13n, 14n, 15n, 16n, 17n, 18n, 19n];
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(20);
      const val161: BigInt = arr[0];
      expect(val161).assertEqual(0n);
      const val162: BigInt = arr[19];
      expect(val162).assertEqual(19n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0860
     * @tc.name testTypedUArraysConstructor0402_086
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(30);
      const val163: number = arr[0];
      expect(val163).assertEqual(0);
      const val164: number = arr[29];
      expect(val164).assertEqual(29);
    });

  });
}
