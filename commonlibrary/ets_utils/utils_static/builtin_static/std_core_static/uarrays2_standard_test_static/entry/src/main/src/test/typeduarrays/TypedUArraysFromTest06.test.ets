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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0100
     * @tc.name testTypedUArraysFromTestFileF001
     * @tc.desc Verify from mapfn Infinity Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0200
     * @tc.name testTypedUArraysFromTestFileF002
     * @tc.desc Verify from mapfn NaN 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0300
     * @tc.name testTypedUArraysFromTestFileF003
     * @tc.desc Verify from thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0400
     * @tc.name testTypedUArraysFromTestFileF004
     * @tc.desc Verify from thisArg Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0500
     * @tc.name testTypedUArraysFromTestFileF005
     * @tc.desc Verify from thisArg Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0600
     * @tc.name testTypedUArraysFromTestFileF006
     * @tc.desc Verify from thisArg Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint8ClampedArray.from(src);
      const val106 = result[0];
      expect(val106).assertEqual(10);
      const val107 = result[2];
      expect(val107).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0700
     * @tc.name testTypedUArraysFromTestFileF007
     * @tc.desc Verify from thisArg BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0800
     * @tc.name testTypedUArraysFromTestFileF008
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20, 30]);
      let result = Uint8Array.from(src);
      const val111 = src[0];
      expect(val111).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_0900
     * @tc.name testTypedUArraysFromTestFileF009
     * @tc.desc Verify from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1000
     * @tc.name testTypedUArraysFromTestFileF010
     * @tc.desc Verify from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([100, 200, 300]);
      let result = Uint32Array.from(src);
      const val115 = src[1];
      expect(val115).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1100
     * @tc.name testTypedUArraysFromTestFileF011
     * @tc.desc Verify from Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 128, 255]);
      let result = Uint8ClampedArray.from(src);
      const val116 = src[2];
      expect(val116).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1200
     * @tc.name testTypedUArraysFromTestFileF012
     * @tc.desc Verify from BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      const val117 = src[0];
      expect(val117).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1300
     * @tc.name testTypedUArraysFromTestFileF013
     * @tc.desc Verify from buffer buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      let result = Uint8Array.from(src);
      expect(result.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1400
     * @tc.name testTypedUArraysFromTestFileF014
     * @tc.desc Verify from buffer buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      expect(result.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1500
     * @tc.name testTypedUArraysFromTestFileF015
     * @tc.desc Verify from Uint8Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1600
     * @tc.name testTypedUArraysFromTestFileF016
     * @tc.desc Verify from Uint8Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20, 30]);
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(3);
      const val121 = result[0];
      expect(val121).assertEqual(10);
      const val122 = result[2];
      expect(val122).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1700
     * @tc.name testTypedUArraysFromTestFileF017
     * @tc.desc Verify from Uint16Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1800
     * @tc.name testTypedUArraysFromTestFileF018
     * @tc.desc Verify from Uint16Array Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([256, 512]);
      let result = Uint8ClampedArray.from(src);
      const val126 = result[0];
      expect(val126).assertEqual(255);
      const val127 = result[1];
      expect(val127).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_1900
     * @tc.name testTypedUArraysFromTestFileF019
     * @tc.desc Verify from Uint32Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([65536, 131072]);
      let result = Uint16Array.from(src);
      const val128 = result[0];
      expect(val128).assertEqual(0);
      const val129 = result[1];
      expect(val129).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2000
     * @tc.name testTypedUArraysFromTestFileF020
     * @tc.desc Verify from Uint8ClampedArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2100
     * @tc.name testTypedUArraysFromTestFileF021
     * @tc.desc Verify from Uint8ClampedArray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 200]);
      let result = Uint32Array.from(src);
      const val133 = result[0];
      expect(val133).assertEqual(10);
      const val134 = result[1];
      expect(val134).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2200
     * @tc.name testTypedUArraysFromTestFileF022
     * @tc.desc Verify from Array<bigint> Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2300
     * @tc.name testTypedUArraysFromTestFileF023
     * @tc.desc Verify from Array<bigint> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2400
     * @tc.name testTypedUArraysFromTestFileF024
     * @tc.desc Verify from Array<number> BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2500
     * @tc.name testTypedUArraysFromTestFileF025
     * @tc.desc Verify from BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2600
     * @tc.name testTypedUArraysFromTestFileF026
     * @tc.desc Verify from byteOffset 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2700
     * @tc.name testTypedUArraysFromTestFileF027
     * @tc.desc Verify from byteLength Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2800
     * @tc.name testTypedUArraysFromTestFileF028
     * @tc.desc Verify from constructor Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      let result = Uint8ClampedArray.from(src);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_2900
     * @tc.name testTypedUArraysFromTestFileF029
     * @tc.desc Verify from constructor BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n];
      let result = BigUint64Array.from(src);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3000
     * @tc.name testTypedUArraysFromTestFileF030
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3100
     * @tc.name testTypedUArraysFromTestFileF031
     * @tc.desc Verify from empty source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3200
     * @tc.name testTypedUArraysFromTestFileF032
     * @tc.desc Verify from empty source Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3300
     * @tc.name testTypedUArraysFromTestFileF033
     * @tc.desc Verify from source Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3400
     * @tc.name testTypedUArraysFromTestFileF034
     * @tc.desc Verify from source Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8ClampedArray.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3500
     * @tc.name testTypedUArraysFromTestFileF035
     * @tc.desc Verify from source BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.from([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3600
     * @tc.name testTypedUArraysFromTestFileF036
     * @tc.desc Verify from mapfn Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM03_3700
     * @tc.name testTypedUArraysFromTestFileF037
     * @tc.desc Verify from mapfn BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileF037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(3);
    });

  });
}
