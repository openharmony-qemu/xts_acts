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

export default function typedUArraysSetTest05(): void {
  describe('TypedUArraysSetTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0001
     * @tc.name testTypedUArraysSet02001
     * @tc.desc Verify set(source) 8 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const big = new BigUint64Array(buffer);
      const u32 = new Uint32Array(buffer);
      big.set([BigInt('0x123456789ABCDEF0')]);
      const val128 = u32[0];
      expect(val128).assertEqual(0x9ABCDEF0);
      const val129 = u32[1];
      expect(val129).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0002
     * @tc.name testTypedUArraysSet02045
     * @tc.desc Verify set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.set([11, 22, 33, 44, 55]);
      const val130 = arr[0];
      expect(val130).assertEqual(11);
      const val131 = arr[1];
      expect(val131).assertEqual(22);
      const val132 = arr[2];
      expect(val132).assertEqual(33);
      const val133 = arr[3];
      expect(val133).assertEqual(44);
      const val134 = arr[4];
      expect(val134).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0003
     * @tc.name testTypedUArraysSet02046
     * @tc.desc Verify set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      arr.set([100, 200, 300, 400]);
      let sum = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i.toInt()];
      }
      expect(sum).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0004
     * @tc.name testTypedUArraysSet02047
     * @tc.desc Verify set Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(6);
      arr.set([1, 2, 3, 4, 5, 6]);
      const val135 = arr[arr.length - 1];
      expect(val135).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0005
     * @tc.name testTypedUArraysSet02048
     * @tc.desc Verify set Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.set([0, 128, 255]);
      const val136 = arr[0];
      expect(val136).assertEqual(0);
      const val137 = arr[1];
      expect(val137).assertEqual(128);
      const val138 = arr[2];
      expect(val138).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0006
     * @tc.name testTypedUArraysSet02049
     * @tc.desc Verify set BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(4);
      arr.set([0n, 1n, BigInt('18446744073709551615'), BigInt('0xABCDEF0123456789')]);
      const val139 = arr[0];
      expect(val139).assertEqual(0n);
      const val140 = arr[1];
      expect(val140).assertEqual(1n);
      const val141 = arr[2];
      expect(val141).assertEqual(BigInt('18446744073709551615'));
      const val142 = arr[3];
      expect(val142).assertEqual(BigInt('0xABCDEF0123456789'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0007
     * @tc.name testTypedUArraysSet02050
     * @tc.desc Verify set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.set([1, 2, 3], 0);
      const val143 = arr[0];
      expect(val143).assertEqual(1);
      const val144 = arr[1];
      expect(val144).assertEqual(2);
      const val145 = arr[2];
      expect(val145).assertEqual(3);
      const val146 = arr[3];
      expect(val146).assertEqual(0);
      const val147 = arr[4];
      expect(val147).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5100
     * @tc.name testTypedUArraysSet02051
     * @tc.desc Verify Uint16Array source set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const src = new Uint16Array([256, 512, 1024]);
      arr.set(src);
      const val148 = arr[0];
      expect(val148).assertEqual(0);
      const val149 = arr[1];
      expect(val149).assertEqual(0);
      const val150 = arr[2];
      expect(val150).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5200
     * @tc.name testTypedUArraysSet02052
     * @tc.desc Verify Uint32Array source set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0]);
      const src = new Uint32Array([65536, 131072]);
      arr.set(src);
      const val151 = arr[0];
      expect(val151).assertEqual(0);
      const val152 = arr[1];
      expect(val152).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5300
     * @tc.name testTypedUArraysSet02053
     * @tc.desc Verify Uint8Array source set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const src = new Uint8Array([10, 20, 255]);
      arr.set(src);
      const val153 = arr[0];
      expect(val153).assertEqual(10);
      const val154 = arr[1];
      expect(val154).assertEqual(20);
      const val155 = arr[2];
      expect(val155).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5400
     * @tc.name testTypedUArraysSet02054
     * @tc.desc Verify Uint8ClampedArray source set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const src = new Uint8ClampedArray([0, 128, 255]);
      arr.set(src);
      const val156 = arr[0];
      expect(val156).assertEqual(0);
      const val157 = arr[1];
      expect(val157).assertEqual(128);
      const val158 = arr[2];
      expect(val158).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5500
     * @tc.name testTypedUArraysSet02055
     * @tc.desc Verify Uint8ClampedArray source set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0]);
      const src = new Uint8ClampedArray([10, 200]);
      arr.set(src);
      const val159 = arr[0];
      expect(val159).assertEqual(10);
      const val160 = arr[1];
      expect(val160).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5600
     * @tc.name testTypedUArraysSet02056
     * @tc.desc Verify Uint16Array source set Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src = new Uint16Array([256, 512]);
      arr.set(src);
      const val161 = arr[0];
      expect(val161).assertEqual(255);
      const val162 = arr[1];
      expect(val162).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5700
     * @tc.name testTypedUArraysSet02057
     * @tc.desc Verify Uint8Array source set BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n]);
      const src = new BigUint64Array([10n, 255n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5800
     * @tc.name testTypedUArraysSet02058
     * @tc.desc Verify Uint16Array source set BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n]);
      const src = new BigUint64Array([300n, 400n]);
      arr.set(src);
      expect(arr[0]).assertEqual(300n);
      expect(arr[1]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5900
     * @tc.name testTypedUArraysSet02059
     * @tc.desc Verify BigUint64Array source set Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0]);
      const src = new BigUint64Array([BigInt('0x100000000'), BigInt('0x200000000')]);
      for (let i = 0; i < src.length; i++) {
        arr[i.toInt()] = Number(src[i.toInt()]);
      }
      const val167 = arr[0];
      expect(val167).assertEqual(0);
      const val168 = arr[1];
      expect(val168).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6000
     * @tc.name testTypedUArraysSet02060
     * @tc.desc Verify BigUint64Array source set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0]);
      const src = new BigUint64Array([BigInt('0x10000'), BigInt('0x20000')]);
      for (let i = 0; i < src.length; i++) {
        arr[i.toInt()] = Number(src[i.toInt()]);
      }
      const val169 = arr[0];
      expect(val169).assertEqual(0);
      const val170 = arr[1];
      expect(val170).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6100
     * @tc.name testTypedUArraysSet02061
     * @tc.desc Verify BigUint64Array set source BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      arr.set([100n, 200n, 300n]);
      const val171 = arr[0];
      expect(val171).assertEqual(100n);
      const val172 = arr[1];
      expect(val172).assertEqual(200n);
      const val173 = arr[2];
      expect(val173).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6200
     * @tc.name testTypedUArraysSet02062
     * @tc.desc Verify BigUint64Array set source BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      arr.set([0n, 1n, BigInt('18446744073709551615')]);
      const val174 = arr[0];
      expect(val174).assertEqual(0n);
      const val175 = arr[1];
      expect(val175).assertEqual(1n);
      const val176 = arr[2];
      expect(val176).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6300
     * @tc.name testTypedUArraysSet02063
     * @tc.desc Verify BigUint64Array set BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      arr.set([BigInt('18446744073709551616')]);
      const val177 = arr[0];
      expect(val177).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6400
     * @tc.name testTypedUArraysSet02064
     * @tc.desc Verify BigUint64Array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const src = new BigUint64Array([99n, 88n, 77n]);
      arr.set(src);
      const val178 = arr[0];
      expect(val178).assertEqual(99n);
      const val179 = arr[1];
      expect(val179).assertEqual(88n);
      const val180 = arr[2];
      expect(val180).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6500
     * @tc.name testTypedUArraysSet02065
     * @tc.desc Verify BigUint64Array set offset=2 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const src = new BigUint64Array([10n, 20n]);
      arr.set(src, 2);
      const val181 = arr[0];
      expect(val181).assertEqual(1n);
      const val182 = arr[1];
      expect(val182).assertEqual(2n);
      const val183 = arr[2];
      expect(val183).assertEqual(10n);
      const val184 = arr[3];
      expect(val184).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6600
     * @tc.name testTypedUArraysSet02066
     * @tc.desc Verify source Uint8Array offset=1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set(new Uint8Array([10, 20]), 1);
      const val185 = arr[0];
      expect(val185).assertEqual(0);
      const val186 = arr[1];
      expect(val186).assertEqual(10);
      const val187 = arr[2];
      expect(val187).assertEqual(20);
      const val188 = arr[3];
      expect(val188).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6700
     * @tc.name testTypedUArraysSet02067
     * @tc.desc Verify source Uint16Array offset=2 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0]);
      arr.set(new Uint16Array([999]), 2);
      const val189 = arr[0];
      expect(val189).assertEqual(0);
      const val190 = arr[2];
      expect(val190).assertEqual(999);
      const val191 = arr[3];
      expect(val191).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6800
     * @tc.name testTypedUArraysSet02068
     * @tc.desc Verify set set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([1, 2, 3]);
      arr.set([255, 0, 128]);
      const val192 = arr[0];
      expect(val192).assertEqual(255);
      const val193 = arr[1];
      expect(val193).assertEqual(0);
      const val194 = arr[2];
      expect(val194).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_6900
     * @tc.name testTypedUArraysSet02069
     * @tc.desc Verify Uint8ClampedArray set +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set([-1, 128, 256, 100]);
      const val195 = arr[0];
      expect(val195).assertEqual(0);
      const val196 = arr[1];
      expect(val196).assertEqual(128);
      const val197 = arr[2];
      expect(val197).assertEqual(255);
      const val198 = arr[3];
      expect(val198).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7000
     * @tc.name testTypedUArraysSet02070
     * @tc.desc Verify set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const src = new Uint8Array([1, 2, 3]);
      arr.set(src, 97);
      const val199 = arr[96];
      expect(val199).assertEqual(0);
      const val200 = arr[97];
      expect(val200).assertEqual(1);
      const val201 = arr[98];
      expect(val201).assertEqual(2);
      const val202 = arr[99];
      expect(val202).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7100
     * @tc.name testTypedUArraysSet02071
     * @tc.desc Verify set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(50);
      const src = new Uint16Array([10, 20]);
      arr.set(src, 48);

      expect(arr[47]).assertEqual(0);
      expect(arr[48]).assertEqual(10);
      expect(arr[49]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7200
     * @tc.name testTypedUArraysSet02072
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.set([1, 2], 0);
      arr.set([3, 4, 5], 2);
      const val206 = arr[0];
      expect(val206).assertEqual(1);
      const val207 = arr[1];
      expect(val207).assertEqual(2);
      const val208 = arr[2];
      expect(val208).assertEqual(3);
      const val209 = arr[3];
      expect(val209).assertEqual(4);
      const val210 = arr[4];
      expect(val210).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7300
     * @tc.name testTypedUArraysSet02073
     * @tc.desc Verify set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.set([65535, 65535, 65535]);
      const val211 = arr[0];
      expect(val211).assertEqual(65535);
      const val212 = arr[1];
      expect(val212).assertEqual(65535);
      const val213 = arr[2];
      expect(val213).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7400
     * @tc.name testTypedUArraysSet02074
     * @tc.desc Verify set 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0, 0]);
      arr.set([4294967295, 0, 4294967295, 0]);
      const val214 = arr[0];
      expect(val214).assertEqual(4294967295);
      const val215 = arr[1];
      expect(val215).assertEqual(0);
      const val216 = arr[2];
      expect(val216).assertEqual(4294967295);
      const val217 = arr[3];
      expect(val217).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7500
     * @tc.name testTypedUArraysSet02075
     * @tc.desc Verify set Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.set([0, 0, 0]);
      arr.set([100, 100, 100]);
      arr.set([255, 255, 255]);
      const val218 = arr[0];
      expect(val218).assertEqual(255);
      const val219 = arr[1];
      expect(val219).assertEqual(255);
      const val220 = arr[2];
      expect(val220).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7600
     * @tc.name testTypedUArraysSet02076
     * @tc.desc Verify set undefined Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const ret = arr.set([1, 2, 3]);
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7700
     * @tc.name testTypedUArraysSet02077
     * @tc.desc Verify set length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      const lenBefore = arr.length;
      arr.set([99], 2);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7800
     * @tc.name testTypedUArraysSet02078
     * @tc.desc Verify set Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.set([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_7900
     * @tc.name testTypedUArraysSet02079
     * @tc.desc Verify set Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 20, 30]);
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(src);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_8000
     * @tc.name testTypedUArraysSet02080
     * @tc.desc Verify set BigUint64Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const byteLenBefore = arr.byteLength;
      arr.set([1n, 2n, 3n]);
      expect(arr.byteLength).assertEqual(byteLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_8100
     * @tc.name testTypedUArraysSet02081
     * @tc.desc Verify offset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0, 0]);
        arr.set([1, 2, 3], -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_8200
     * @tc.name testTypedUArraysSet02082
     * @tc.desc Verify offset Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint16Array([0, 0, 0, 0]);
        arr.set([1, 2, 3], 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_8300
     * @tc.name testTypedUArraysSet02083
     * @tc.desc Verify source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0]);
        const src = new Uint8Array([1, 2, 3]);
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_8400
     * @tc.name testTypedUArraysSet02084
     * @tc.desc Verify source TypedArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const empty = new Uint8Array(0);
      arr.set(empty);
      const val222 = arr[0];
      expect(val222).assertEqual(1);
      const val223 = arr[1];
      expect(val223).assertEqual(2);
      const val224 = arr[2];
      expect(val224).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_8500
     * @tc.name testTypedUArraysSet02085
     * @tc.desc Verify offset BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new BigUint64Array([0n, 0n, 0n]);
        arr.set([1n, 2n], -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_8600
     * @tc.name testTypedUArraysSet02086
     * @tc.desc Verify Uint8Array->Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSet02086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint16Array([0, 0, 0]);
        const src = new Uint8Array([1, 2, 3, 4]);
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
