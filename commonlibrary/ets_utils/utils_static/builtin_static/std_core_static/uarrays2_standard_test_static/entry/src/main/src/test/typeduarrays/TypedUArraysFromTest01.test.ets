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

export default function typedUArraysFromTest01(): void {
  describe('TypedUArraysFromTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0100
     * @tc.name testTypedUArraysFromTestFileA001
     * @tc.desc Verify from Array<number> 42 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [42, 42, 42];
      let result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(3);
      const val0 = result[0];
      expect(val0).assertEqual(42);
      const val1 = result[1];
      expect(val1).assertEqual(42);
      const val2 = result[2];
      expect(val2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0200
     * @tc.name testTypedUArraysFromTestFileA002
     * @tc.desc Verify from Iterable<bigint> 42n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [42n, 42n, 42n];
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(3);
      const val3 = result[0];
      expect(val3).assertEqual(42n);
      const val4 = result[1];
      expect(val4).assertEqual(42n);
      const val5 = result[2];
      expect(val5).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0300
     * @tc.name testTypedUArraysFromTestFileA003
     * @tc.desc Verify from Array<number> 0xFF Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0xFF];
      let result = Uint8Array.from(src);
      const val6 = result[0];
      expect(val6).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0400
     * @tc.name testTypedUArraysFromTestFileA004
     * @tc.desc Verify from Array<number> 0xFFFF Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0xFFFF];
      let result = Uint16Array.from(src);
      const val7 = result[0];
      expect(val7).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0500
     * @tc.name testTypedUArraysFromTestFileA005
     * @tc.desc Verify from Array<number> 0xFFFFFFFF Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0xFFFFFFFF];
      let result = Uint32Array.from(src);
      const val8 = result[0];
      expect(val8).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0600
     * @tc.name testTypedUArraysFromTestFileA006
     * @tc.desc Verify from Array<number> 0x80 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x80];
      let result = Uint8Array.from(src);
      const val9 = result[0];
      expect(val9).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0700
     * @tc.name testTypedUArraysFromTestFileA007
     * @tc.desc Verify from Array<number> 0x8000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x8000];
      let result = Uint16Array.from(src);
      const val10 = result[0];
      expect(val10).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0800
     * @tc.name testTypedUArraysFromTestFileA008
     * @tc.desc Verify from Array<number> 0x80000000 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x80000000];
      let result = Uint32Array.from(src);
      const val11 = result[0];
      expect(val11).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_0900
     * @tc.name testTypedUArraysFromTestFileA009
     * @tc.desc Verify from Array<number> 100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i);
      }
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(100);
      const val12 = result[0];
      expect(val12).assertEqual(0);
      const val13 = result[99];
      expect(val13).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1000
     * @tc.name testTypedUArraysFromTestFileA010
     * @tc.desc Verify from Array<number> 100 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i* 100);
      }
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(100);
      const val14 = result[0];
      expect(val14).assertEqual(0);
      const val15 = result[99];
      expect(val15).assertEqual(9900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1100
     * @tc.name testTypedUArraysFromTestFileA011
     * @tc.desc Verify from Array<number> 100 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i* 1000);
      }
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(100);
      const val16 = result[0];
      expect(val16).assertEqual(0);
      const val17 = result[99];
      expect(val17).assertEqual(99000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1200
     * @tc.name testTypedUArraysFromTestFileA012
     * @tc.desc Verify from mapfn 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint8Array.from(src, (value: number): number => value === value ? 1 : 1);
      expect(result.length).assertEqual(3);
      const val18 = result[0];
      expect(val18).assertEqual(1);
      const val19 = result[1];
      expect(val19).assertEqual(1);
      const val20 = result[2];
      expect(val20).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1300
     * @tc.name testTypedUArraysFromTestFileA013
     * @tc.desc Verify from mapfn 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint16Array.from(src, (value: number): number => value === value ? 1 : 1);
      expect(result.length).assertEqual(3);
      const val21 = result[0];
      expect(val21).assertEqual(1);
      const val22 = result[1];
      expect(val22).assertEqual(1);
      const val23 = result[2];
      expect(val23).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1400
     * @tc.name testTypedUArraysFromTestFileA014
     * @tc.desc Verify from mapfn 1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint32Array.from(src, (value: number): number => value === value ? 1 : 1);
      expect(result.length).assertEqual(3);
      const val24 = result[0];
      expect(val24).assertEqual(1);
      const val25 = result[1];
      expect(val25).assertEqual(1);
      const val26 = result[2];
      expect(val26).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1500
     * @tc.name testTypedUArraysFromTestFileA015
     * @tc.desc Verify from mapfn 1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint8ClampedArray.from(src, (value: number): number => value === value ? 1 : 1);
      expect(result.length).assertEqual(3);
      const val27 = result[0];
      expect(val27).assertEqual(1);
      const val28 = result[1];
      expect(val28).assertEqual(1);
      const val29 = result[2];
      expect(val29).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1600
     * @tc.name testTypedUArraysFromTestFileA016
     * @tc.desc Verify from mapfn 1n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [10n, 20n, 30n];
      let result = BigUint64Array.from(src, (value: bigint): bigint => value === value ? 1n : 1n);
      expect(result.length).assertEqual(3);
      const val30 = result[0];
      expect(val30).assertEqual(1n);
      const val31 = result[1];
      expect(val31).assertEqual(1n);
      const val32 = result[2];
      expect(val32).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1700
     * @tc.name testTypedUArraysFromTestFileA017
     * @tc.desc Verify from mapfn k Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint8Array.from(src, (v: number, k: number): number => v === v ? k : k);
      expect(result.length).assertEqual(3);
      const val33 = result[0];
      expect(val33).assertEqual(0);
      const val34 = result[1];
      expect(val34).assertEqual(1);
      const val35 = result[2];
      expect(val35).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1800
     * @tc.name testTypedUArraysFromTestFileA018
     * @tc.desc Verify from mapfn k Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint16Array.from(src, (v: number, k: number): number => v === v ? k : k);
      expect(result.length).assertEqual(3);
      const val36 = result[0];
      expect(val36).assertEqual(0);
      const val37 = result[1];
      expect(val37).assertEqual(1);
      const val38 = result[2];
      expect(val38).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_1900
     * @tc.name testTypedUArraysFromTestFileA019
     * @tc.desc Verify from mapfn numberToBigint(k) BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [10n, 20n, 30n];
      let result = BigUint64Array.from(src, (v: bigint, k: number): bigint => v === v ? numberToBigint(k) : numberToBigint(k));
      expect(result.length).assertEqual(3);
      const val39 = result[0];
      expect(val39).assertEqual(0n);
      const val40 = result[1];
      expect(val40).assertEqual(1n);
      const val41 = result[2];
      expect(val41).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2000
     * @tc.name testTypedUArraysFromTestFileA020
     * @tc.desc Verify from mapfn v * 2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint8Array.from(src, (v, k) => v * 2);
      expect(result.length).assertEqual(3);
      const val42 = result[0];
      expect(val42).assertEqual(20);
      const val43 = result[1];
      expect(val43).assertEqual(40);
      const val44 = result[2];
      expect(val44).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2100
     * @tc.name testTypedUArraysFromTestFileA021
     * @tc.desc Verify from mapfn v * 2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint16Array.from(src, (v, k) => v * 2);
      expect(result.length).assertEqual(3);
      const val45 = result[0];
      expect(val45).assertEqual(20);
      const val46 = result[1];
      expect(val46).assertEqual(40);
      const val47 = result[2];
      expect(val47).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2200
     * @tc.name testTypedUArraysFromTestFileA022
     * @tc.desc Verify from mapfn v * 2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint32Array.from(src, (v, k) => v * 2);
      expect(result.length).assertEqual(3);
      const val48 = result[0];
      expect(val48).assertEqual(20);
      const val49 = result[1];
      expect(val49).assertEqual(40);
      const val50 = result[2];
      expect(val50).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2300
     * @tc.name testTypedUArraysFromTestFileA023
     * @tc.desc Verify from mapfn v * 2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let result = Uint8ClampedArray.from(src, (v, k) => v * 2);
      expect(result.length).assertEqual(3);
      const val51 = result[0];
      expect(val51).assertEqual(20);
      const val52 = result[1];
      expect(val52).assertEqual(40);
      const val53 = result[2];
      expect(val53).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2400
     * @tc.name testTypedUArraysFromTestFileA024
     * @tc.desc Verify from mapfn v * 2n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [10n, 20n, 30n];
      let result = BigUint64Array.from(src, (v, k) => v * 2n);
      expect(result.length).assertEqual(3);
      const val54 = result[0];
      expect(val54).assertEqual(20n);
      const val55 = result[1];
      expect(val55).assertEqual(40n);
      const val56 = result[2];
      expect(val56).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2500
     * @tc.name testTypedUArraysFromTestFileA025
     * @tc.desc Verify from mapfn Uint8Array 255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src, (value: number): number => value === value ? 255 : 255);
      expect(result.length).assertEqual(3);
      const val57 = result[0];
      expect(val57).assertEqual(255);
      const val58 = result[1];
      expect(val58).assertEqual(255);
      const val59 = result[2];
      expect(val59).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2600
     * @tc.name testTypedUArraysFromTestFileA026
     * @tc.desc Verify from mapfn Uint16Array 65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src, (value: number): number => value === value ? 65535 : 65535);
      expect(result.length).assertEqual(3);
      const val60 = result[0];
      expect(val60).assertEqual(65535);
      const val61 = result[1];
      expect(val61).assertEqual(65535);
      const val62 = result[2];
      expect(val62).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2700
     * @tc.name testTypedUArraysFromTestFileA027
     * @tc.desc Verify from mapfn Uint32Array 4294967295 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src, (value: number): number => value === value ? 4294967295 : 4294967295);
      expect(result.length).assertEqual(3);
      const val63 = result[0];
      expect(val63).assertEqual(4294967295);
      const val64 = result[1];
      expect(val64).assertEqual(4294967295);
      const val65 = result[2];
      expect(val65).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2800
     * @tc.name testTypedUArraysFromTestFileA028
     * @tc.desc Verify from mapfn BigUint64Array BigInt('18446744073709551615') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src, (value: bigint): bigint => value === value ? BigInt('18446744073709551615') : BigInt('18446744073709551615'));
      expect(result.length).assertEqual(3);
      const val66 = result[0];
      expect(val66).assertEqual(BigInt('18446744073709551615'));
      const val67 = result[1];
      expect(val67).assertEqual(BigInt('18446744073709551615'));
      const val68 = result[2];
      expect(val68).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_2900
     * @tc.name testTypedUArraysFromTestFileA029
     * @tc.desc Verify from mapfn 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src, (value: number): number => value === value ? 0 : 0);
      expect(result.length).assertEqual(3);
      const val69 = result[0];
      expect(val69).assertEqual(0);
      const val70 = result[1];
      expect(val70).assertEqual(0);
      const val71 = result[2];
      expect(val71).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3000
     * @tc.name testTypedUArraysFromTestFileA030
     * @tc.desc Verify from mapfn 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src, (value: number): number => value === value ? 0 : 0);
      expect(result.length).assertEqual(3);
      const val72 = result[0];
      expect(val72).assertEqual(0);
      const val73 = result[1];
      expect(val73).assertEqual(0);
      const val74 = result[2];
      expect(val74).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3100
     * @tc.name testTypedUArraysFromTestFileA031
     * @tc.desc Verify from mapfn 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src, (value: number): number => value === value ? 0 : 0);
      expect(result.length).assertEqual(3);
      const val75 = result[0];
      expect(val75).assertEqual(0);
      const val76 = result[1];
      expect(val76).assertEqual(0);
      const val77 = result[2];
      expect(val77).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3200
     * @tc.name testTypedUArraysFromTestFileA032
     * @tc.desc Verify from mapfn 0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src, (value: bigint): bigint => value === value ? 0n : 0n);
      expect(result.length).assertEqual(3);
      const val78 = result[0];
      expect(val78).assertEqual(0n);
      const val79 = result[1];
      expect(val79).assertEqual(0n);
      const val80 = result[2];
      expect(val80).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3300
     * @tc.name testTypedUArraysFromTestFileA033
     * @tc.desc Verify from mapfn Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const result = Uint8Array.from(src, (value: number): number => value + 1);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3400
     * @tc.name testTypedUArraysFromTestFileA034
     * @tc.desc Verify from mapfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      const result = Uint16Array.from(src, (value: number): number => value + 1);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3500
     * @tc.name testTypedUArraysFromTestFileA035
     * @tc.desc Verify from mapfn Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1, 2, 3]);
      const result = Uint32Array.from(src, (value: number): number => value + 1);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3600
     * @tc.name testTypedUArraysFromTestFileA036
     * @tc.desc Verify from mapfn Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const result = Uint8ClampedArray.from(src, (value: number): number => value + 1);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3700
     * @tc.name testTypedUArraysFromTestFileA037
     * @tc.desc Verify from mapfn BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      const result = BigUint64Array.from(src, (value: bigint): bigint => value + 1n);
      expect(result[0]).assertEqual(2n);
      expect(result[1]).assertEqual(3n);
      expect(result[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3800
     * @tc.name testTypedUArraysFromTestFileA038
     * @tc.desc Verify from mapfn Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const multiplier = 3;
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src, (v, k) => v * multiplier);
      expect(result.length).assertEqual(3);
      const val81 = result[0];
      expect(val81).assertEqual(3);
      const val82 = result[1];
      expect(val82).assertEqual(6);
      const val83 = result[2];
      expect(val83).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_3900
     * @tc.name testTypedUArraysFromTestFileA039
     * @tc.desc Verify from mapfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const multiplier = 3;
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src, (v, k) => v * multiplier);
      expect(result.length).assertEqual(3);
      const val84 = result[0];
      expect(val84).assertEqual(3);
      const val85 = result[1];
      expect(val85).assertEqual(6);
      const val86 = result[2];
      expect(val86).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4000
     * @tc.name testTypedUArraysFromTestFileA040
     * @tc.desc Verify from mapfn Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const multiplier = 3;
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src, (v, k) => v * multiplier);
      expect(result.length).assertEqual(3);
      const val87 = result[0];
      expect(val87).assertEqual(3);
      const val88 = result[1];
      expect(val88).assertEqual(6);
      const val89 = result[2];
      expect(val89).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4100
     * @tc.name testTypedUArraysFromTestFileA041
     * @tc.desc Verify from mapfn BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const multiplier = 3n;
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src, (v, k) => v * multiplier);
      expect(result.length).assertEqual(3);
      const val90 = result[0];
      expect(val90).assertEqual(3n);
      const val91 = result[1];
      expect(val91).assertEqual(6n);
      const val92 = result[2];
      expect(val92).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4200
     * @tc.name testTypedUArraysFromTestFileA042
     * @tc.desc Verify from mapfn Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src, (v, k) => v * 100);
      expect(result.length).assertEqual(3);
      const val93 = result[0];
      expect(val93).assertEqual(100);
      const val94 = result[1];
      expect(val94).assertEqual(200);
      const val95 = result[2];
      expect(val95).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4300
     * @tc.name testTypedUArraysFromTestFileA043
     * @tc.desc Verify from mapfn throws TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      try {
        Uint8Array.from(src, (value: number): number => {
          throw new TypeError('mapfn failed ' + value.toString());
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4400
     * @tc.name testTypedUArraysFromTestFileA044
     * @tc.desc Verify from [1,2,3] Uint8Array vs Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint8Array.from(src);
      const r2 = Uint16Array.from(src);
      expect(r1.length).assertEqual(r2.length);
      const val99 = r1[0];
      expect(val99).assertEqual(r2[0]);
      const val100 = r1[1];
      expect(val100).assertEqual(r2[1]);
      const val101 = r1[2];
      expect(val101).assertEqual(r2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4500
     * @tc.name testTypedUArraysFromTestFileA045
     * @tc.desc Verify from [1,2,3] Uint8Array vs Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint8Array.from(src);
      const r2 = Uint32Array.from(src);
      expect(r1.length).assertEqual(r2.length);
      const val102 = r1[0];
      expect(val102).assertEqual(r2[0]);
      const val103 = r1[1];
      expect(val103).assertEqual(r2[1]);
      const val104 = r1[2];
      expect(val104).assertEqual(r2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4600
     * @tc.name testTypedUArraysFromTestFileA046
     * @tc.desc Verify from [1,2,3] Uint16Array vs Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint16Array.from(src);
      const r2 = Uint32Array.from(src);
      expect(r1.length).assertEqual(r2.length);
      const val105 = r1[0];
      expect(val105).assertEqual(r2[0]);
      const val106 = r1[1];
      expect(val106).assertEqual(r2[1]);
      const val107 = r1[2];
      expect(val107).assertEqual(r2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4700
     * @tc.name testTypedUArraysFromTestFileA047
     * @tc.desc Verify from [1,2,3] Uint8ClampedArray vs Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint8ClampedArray.from(src);
      const r2 = Uint8Array.from(src);
      expect(r1.length).assertEqual(r2.length);
      const val108 = r1[0];
      expect(val108).assertEqual(r2[0]);
      const val109 = r1[1];
      expect(val109).assertEqual(r2[1]);
      const val110 = r1[2];
      expect(val110).assertEqual(r2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4800
     * @tc.name testTypedUArraysFromTestFileA048
     * @tc.desc Verify from byteLength Uint8Array vs Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint8Array.from(src);
      const r2 = Uint16Array.from(src);
      expect(r1.byteLength).assertEqual(3);
      expect(r2.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_4900
     * @tc.name testTypedUArraysFromTestFileA049
     * @tc.desc Verify from byteLength Uint8Array vs Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint8Array.from(src);
      const r2 = Uint32Array.from(src);
      expect(r1.byteLength).assertEqual(3);
      expect(r2.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_5000
     * @tc.name testTypedUArraysFromTestFileA050
     * @tc.desc Verify from byteLength Uint16Array vs Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint16Array.from(src);
      const r2 = Uint32Array.from(src);
      expect(r1.byteLength).assertEqual(6);
      expect(r2.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_5100
     * @tc.name testTypedUArraysFromTestFileA051
     * @tc.desc Verify from byteLength Uint8ClampedArray vs Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint8ClampedArray.from(src);
      const r2 = Uint16Array.from(src);
      expect(r1.byteLength).assertEqual(3);
      expect(r2.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_5200
     * @tc.name testTypedUArraysFromTestFileA052
     * @tc.desc Verify from byteLength BigUint64Array vs Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      const r1 = BigUint64Array.from(src);
      const r2 = Uint32Array.from([1, 2, 3]);
      expect(r1.byteLength).assertEqual(24);
      expect(r2.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_5300
     * @tc.name testTypedUArraysFromTestFileA053
     * @tc.desc Verify from 300 Uint8Array 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300];
      let result = Uint8Array.from(src);
      const val111 = result[0];
      expect(val111).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_5400
     * @tc.name testTypedUArraysFromTestFileA054
     * @tc.desc Verify from 300 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300];
      let result = Uint8ClampedArray.from(src);
      const val112 = result[0];
      expect(val112).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST01_5500
     * @tc.name testTypedUArraysFromTestFileA055
     * @tc.desc Verify from 300 Uint16Array 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileA055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300];
      let result = Uint16Array.from(src);
      const val113 = result[0];
      expect(val113).assertEqual(300);
    });

  });
}
