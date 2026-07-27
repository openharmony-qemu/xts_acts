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

function numberToBigint(value: number): bigint {
  let result: bigint = 0n;
  for (let i: number = 0; i < value; i++) {
    result += 1n;
  }
  return result;
}

export default function typedUArraysFromTest06(): void {
  describe('TypedUArraysFromTest06', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3900
     * @tc.name testTypedUArraysFrom03039
     * @tc.desc Verify from mapfn Infinity Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src, (x: number): number => x >= 0 ? 1.0 / 0.0 : 1.0 / 0.0);
      const val91 = result[0];
      expect(val91).assertEqual(255);
      const val92 = result[1];
      expect(val92).assertEqual(255);
      const val93 = result[2];
      expect(val93).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4000
     * @tc.name testTypedUArraysFrom03040
     * @tc.desc Verify from mapfn NaN 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src, (x: number): number => x >= 0 ? 0.0 / 0.0 : 0.0 / 0.0);
      const val94 = result[0];
      expect(val94).assertEqual(0);
      const val95 = result[1];
      expect(val95).assertEqual(0);
      const val96 = result[2];
      expect(val96).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4100
     * @tc.name testTypedUArraysFrom03041
     * @tc.desc Verify from thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src, (x: number): number => x * 3);
      const val97 = result[0];
      expect(val97).assertEqual(3);
      const val98 = result[1];
      expect(val98).assertEqual(6);
      const val99 = result[2];
      expect(val99).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4200
     * @tc.name testTypedUArraysFrom03042
     * @tc.desc Verify from thisArg Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint16Array.from(src, (x: number): number => x + 100);
      const val100 = result[0];
      expect(val100).assertEqual(110);
      const val101 = result[1];
      expect(val101).assertEqual(120);
      const val102 = result[2];
      expect(val102).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4300
     * @tc.name testTypedUArraysFrom03043
     * @tc.desc Verify from thisArg Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrCtx: Array<number> = [100, 200, 300];
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from([arrCtx[0] + src[0], arrCtx[1] + src[1], arrCtx[2] + src[2]]);
      const val103 = result[0];
      expect(val103).assertEqual(101);
      const val104 = result[1];
      expect(val104).assertEqual(202);
      const val105 = result[2];
      expect(val105).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4400
     * @tc.name testTypedUArraysFrom03044
     * @tc.desc Verify from thisArg Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint8ClampedArray.from(src);
      const val106 = result[0];
      expect(val106).assertEqual(10);
      const val107 = result[2];
      expect(val107).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4500
     * @tc.name testTypedUArraysFrom03045
     * @tc.desc Verify from thisArg BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1n, 2n, 3n];
      let result = BigUint64Array.from(src, (x: bigint): bigint => x * 2n);
      const val108 = result[0];
      expect(val108).assertEqual(2n);
      const val109 = result[1];
      expect(val109).assertEqual(4n);
      const val110 = result[2];
      expect(val110).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4600
     * @tc.name testTypedUArraysFrom03046
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20, 30]);
      let result = Uint8Array.from(src);
      const val111 = src[0];
      expect(val111).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4700
     * @tc.name testTypedUArraysFrom03047
     * @tc.desc Verify from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      let result = Uint16Array.from(src);
      const val112 = src[0];
      expect(val112).assertEqual(1);
      const val113 = src[1];
      expect(val113).assertEqual(2);
      const val114 = src[2];
      expect(val114).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4800
     * @tc.name testTypedUArraysFrom03048
     * @tc.desc Verify from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([100, 200, 300]);
      let result = Uint32Array.from(src);
      const val115 = src[1];
      expect(val115).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_4900
     * @tc.name testTypedUArraysFrom03049
     * @tc.desc Verify from Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 128, 255]);
      let result = Uint8ClampedArray.from(src);
      const val116 = src[2];
      expect(val116).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5000
     * @tc.name testTypedUArraysFrom03050
     * @tc.desc Verify from BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      const val117 = src[0];
      expect(val117).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5100
     * @tc.name testTypedUArraysFrom03051
     * @tc.desc Verify from buffer buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      let result = Uint8Array.from(src);
      expect(result.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5200
     * @tc.name testTypedUArraysFrom03052
     * @tc.desc Verify from buffer buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      expect(result.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5300
     * @tc.name testTypedUArraysFrom03053
     * @tc.desc Verify from Uint8Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20, 255]);
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(3);
      const val118 = result[0];
      expect(val118).assertEqual(10);
      const val119 = result[1];
      expect(val119).assertEqual(20);
      const val120 = result[2];
      expect(val120).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5400
     * @tc.name testTypedUArraysFrom03054
     * @tc.desc Verify from Uint8Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20, 30]);
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(3);
      const val121 = result[0];
      expect(val121).assertEqual(10);
      const val122 = result[2];
      expect(val122).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5500
     * @tc.name testTypedUArraysFrom03055
     * @tc.desc Verify from Uint16Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([256, 512, 1024]);
      let result = Uint8Array.from(src);
      const val123 = result[0];
      expect(val123).assertEqual(0);
      const val124 = result[1];
      expect(val124).assertEqual(0);
      const val125 = result[2];
      expect(val125).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5600
     * @tc.name testTypedUArraysFrom03056
     * @tc.desc Verify from Uint16Array Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([256, 512]);
      let result = Uint8ClampedArray.from(src);
      const val126 = result[0];
      expect(val126).assertEqual(255);
      const val127 = result[1];
      expect(val127).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5700
     * @tc.name testTypedUArraysFrom03057
     * @tc.desc Verify from Uint32Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([65536, 131072]);
      let result = Uint16Array.from(src);
      const val128 = result[0];
      expect(val128).assertEqual(0);
      const val129 = result[1];
      expect(val129).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5800
     * @tc.name testTypedUArraysFrom03058
     * @tc.desc Verify from Uint8ClampedArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([0, 128, 255]);
      let result = Uint16Array.from(src);
      const val130 = result[0];
      expect(val130).assertEqual(0);
      const val131 = result[1];
      expect(val131).assertEqual(128);
      const val132 = result[2];
      expect(val132).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_5900
     * @tc.name testTypedUArraysFrom03059
     * @tc.desc Verify from Uint8ClampedArray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 200]);
      let result = Uint32Array.from(src);
      const val133 = result[0];
      expect(val133).assertEqual(10);
      const val134 = result[1];
      expect(val134).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6000
     * @tc.name testTypedUArraysFrom03060
     * @tc.desc Verify from Array<bigint> Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [10n, 255n, 300n];
      let result = Uint8Array.from(src, (x: bigint): number => Number(x));
      const val135 = result[0];
      expect(val135).assertEqual(10);
      const val136 = result[1];
      expect(val136).assertEqual(255);
      const val137 = result[2];
      expect(val137).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6100
     * @tc.name testTypedUArraysFrom03061
     * @tc.desc Verify from Array<bigint> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [100n, 1000n, 65535n];
      let result = Uint16Array.from(src, (x: bigint): number => Number(x));
      const val138 = result[0];
      expect(val138).assertEqual(100);
      const val139 = result[1];
      expect(val139).assertEqual(1000);
      const val140 = result[2];
      expect(val140).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6200
     * @tc.name testTypedUArraysFrom03062
     * @tc.desc Verify from Array<number> BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = BigUint64Array.from(src, (x: number): bigint => numberToBigint(x));
      const val141 = result[0];
      expect(val141).assertEqual(10n);
      const val142 = result[1];
      expect(val142).assertEqual(20n);
      const val143 = result[2];
      expect(val143).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6300
     * @tc.name testTypedUArraysFrom03063
     * @tc.desc Verify from BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6400
     * @tc.name testTypedUArraysFrom03064
     * @tc.desc Verify from byteOffset 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6500
     * @tc.name testTypedUArraysFrom03065
     * @tc.desc Verify from byteLength Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6600
     * @tc.name testTypedUArraysFrom03066
     * @tc.desc Verify from constructor Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      let result = Uint8ClampedArray.from(src);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6700
     * @tc.name testTypedUArraysFrom03067
     * @tc.desc Verify from constructor BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n];
      let result = BigUint64Array.from(src);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6800
     * @tc.name testTypedUArraysFrom03068
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_6900
     * @tc.name testTypedUArraysFrom03069
     * @tc.desc Verify from empty source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_7000
     * @tc.name testTypedUArraysFrom03070
     * @tc.desc Verify from empty source Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_7100
     * @tc.name testTypedUArraysFrom03071
     * @tc.desc Verify from source Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_7200
     * @tc.name testTypedUArraysFrom03072
     * @tc.desc Verify from source Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8ClampedArray.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_7300
     * @tc.name testTypedUArraysFrom03073
     * @tc.desc Verify from source BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_7400
     * @tc.name testTypedUArraysFrom03074
     * @tc.desc Verify from mapfn Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_7500
     * @tc.name testTypedUArraysFrom03075
     * @tc.desc Verify from mapfn BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom03075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(3);
    });

  });
}
