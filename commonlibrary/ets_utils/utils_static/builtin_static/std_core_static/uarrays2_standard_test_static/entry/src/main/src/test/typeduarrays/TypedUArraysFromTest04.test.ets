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

export default function typedUArraysFromTest04(): void {
  describe('TypedUArraysFromTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0100
     * @tc.name testTypedUArraysFromTestFileD001
     * @tc.desc Verify from source Uint8Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20, 30]);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
      const val0 = result[0];
      expect(val0).assertEqual(10);
      const val1 = result[1];
      expect(val1).assertEqual(20);
      const val2 = result[2];
      expect(val2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0200
     * @tc.name testTypedUArraysFromTestFileD002
     * @tc.desc Verify from source Uint16Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([100, 200, 300]);
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(3);
      const val3 = result[0];
      expect(val3).assertEqual(100);
      const val4 = result[2];
      expect(val4).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0300
     * @tc.name testTypedUArraysFromTestFileD003
     * @tc.desc Verify from source Uint32Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1000, 2000, 3000]);
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(3);
      const val5 = result[0];
      expect(val5).assertEqual(1000);
      const val6 = result[2];
      expect(val6).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0400
     * @tc.name testTypedUArraysFromTestFileD004
     * @tc.desc Verify from source Uint8ClampedArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 128, 255]);
      let result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(3);
      const val7 = result[0];
      expect(val7).assertEqual(10);
      const val8 = result[1];
      expect(val8).assertEqual(128);
      const val9 = result[2];
      expect(val9).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0500
     * @tc.name testTypedUArraysFromTestFileD005
     * @tc.desc Verify from source BigUint64Array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(3);
      const val10 = result[0];
      expect(val10).assertEqual(1n);
      const val11 = result[2];
      expect(val11).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0600
     * @tc.name testTypedUArraysFromTestFileD006
     * @tc.desc Verify from source Uint16Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([100, 200, 300]);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
      const val12 = result[0];
      expect(val12).assertEqual(100);
      const val13 = result[1];
      expect(val13).assertEqual(200);
      const val14 = result[2];
      expect(val14).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0700
     * @tc.name testTypedUArraysFromTestFileD007
     * @tc.desc Verify from source Uint32Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([65536, 131072]);
      let result = Uint16Array.from(src);
      const val15 = result[0];
      expect(val15).assertEqual(0);
      const val16 = result[1];
      expect(val16).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0800
     * @tc.name testTypedUArraysFromTestFileD008
     * @tc.desc Verify from source BigUint64Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([4294967296n, 8589934592n]);
      let result = Uint32Array.from([Number(src[0]), Number(src[1])]);
      const val17 = result[0];
      expect(val17).assertEqual(0);
      const val18 = result[1];
      expect(val18).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_0900
     * @tc.name testTypedUArraysFromTestFileD009
     * @tc.desc Verify from source Uint8ClampedArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 200, 255]);
      let result = Uint16Array.from(src);
      const val19 = result[0];
      expect(val19).assertEqual(10);
      const val20 = result[1];
      expect(val20).assertEqual(200);
      const val21 = result[2];
      expect(val21).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1000
     * @tc.name testTypedUArraysFromTestFileD010
     * @tc.desc Verify from source Uint16Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3, 4, 5]);
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(5);
      const val22 = result[4];
      expect(val22).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1100
     * @tc.name testTypedUArraysFromTestFileD011
     * @tc.desc Verify from source Uint32Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([10, 20, 30, 40]);
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(4);
      const val23 = result[3];
      expect(val23).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1200
     * @tc.name testTypedUArraysFromTestFileD012
     * @tc.desc Verify from source Uint8ClampedArray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 200]);
      let result = BigUint64Array.from([numberToBigint(src[0]), numberToBigint(src[1])]);
      const val24 = result[0];
      expect(val24).assertEqual(10n);
      const val25 = result[1];
      expect(val25).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1300
     * @tc.name testTypedUArraysFromTestFileD013
     * @tc.desc Verify from source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([65, 66, 67]);
      expect(result.length).assertEqual(3);
      const val26 = result[0];
      expect(val26).assertEqual(65);
      const val27 = result[1];
      expect(val27).assertEqual(66);
      const val28 = result[2];
      expect(val28).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1400
     * @tc.name testTypedUArraysFromTestFileD014
     * @tc.desc Verify from source "hello" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([104, 101, 108, 108, 111]);
      expect(result.length).assertEqual(5);
      const val29 = result[0];
      expect(val29).assertEqual(104);
      const val30 = result[1];
      expect(val30).assertEqual(101);
      const val31 = result[2];
      expect(val31).assertEqual(108);
      const val32 = result[3];
      expect(val32).assertEqual(108);
      const val33 = result[4];
      expect(val33).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1500
     * @tc.name testTypedUArraysFromTestFileD015
     * @tc.desc Verify from source Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([]);
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1600
     * @tc.name testTypedUArraysFromTestFileD016
     * @tc.desc Verify from source "0" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([48]);
      expect(result.length).assertEqual(1);
      const val34 = result[0];
      expect(val34).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1700
     * @tc.name testTypedUArraysFromTestFileD017
     * @tc.desc Verify from source "123" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([49, 50, 51]);
      expect(result.length).assertEqual(3);
      const val35 = result[0];
      expect(val35).assertEqual(49);
      const val36 = result[1];
      expect(val36).assertEqual(50);
      const val37 = result[2];
      expect(val37).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1800
     * @tc.name testTypedUArraysFromTestFileD018
     * @tc.desc Verify from source "!@#" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([33, 64, 35]);
      expect(result.length).assertEqual(3);
      const val38 = result[0];
      expect(val38).assertEqual(33);
      const val39 = result[1];
      expect(val39).assertEqual(64);
      const val40 = result[2];
      expect(val40).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_1900
     * @tc.name testTypedUArraysFromTestFileD019
     * @tc.desc Verify from source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.from([97, 98, 99, 100, 101, 102, 103, 104]);
      expect(result.length).assertEqual(8);
      const val41 = result[0];
      expect(val41).assertEqual(97);
      const val42 = result[7];
      expect(val42).assertEqual(104);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2000
     * @tc.name testTypedUArraysFromTestFileD020
     * @tc.desc Verify from source Set<number> Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(10);
      src.add(20);
      src.add(30);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
      const val43 = result[0];
      expect(val43).assertEqual(10);
      const val44 = result[1];
      expect(val44).assertEqual(20);
      const val45 = result[2];
      expect(val45).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2100
     * @tc.name testTypedUArraysFromTestFileD021
     * @tc.desc Verify from source Set<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(100);
      src.add(200);
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(2);
      const val46 = result[0];
      expect(val46).assertEqual(100);
      const val47 = result[1];
      expect(val47).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2200
     * @tc.name testTypedUArraysFromTestFileD022
     * @tc.desc Verify from source Set<number> Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1000);
      src.add(2000);
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(2);
      const val48 = result[0];
      expect(val48).assertEqual(1000);
      const val49 = result[1];
      expect(val49).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2300
     * @tc.name testTypedUArraysFromTestFileD023
     * @tc.desc Verify from source Set<number> Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(0);
      src.add(128);
      src.add(255);
      let result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(3);
      const val50 = result[0];
      expect(val50).assertEqual(0);
      const val51 = result[1];
      expect(val51).assertEqual(128);
      const val52 = result[2];
      expect(val52).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2400
     * @tc.name testTypedUArraysFromTestFileD024
     * @tc.desc Verify from source Set<bigint> BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<bigint>();
      src.add(1n);
      src.add(2n);
      src.add(3n);
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(3);
      const val53 = result[0];
      expect(val53).assertEqual(1n);
      const val54 = result[1];
      expect(val54).assertEqual(2n);
      const val55 = result[2];
      expect(val55).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2500
     * @tc.name testTypedUArraysFromTestFileD025
     * @tc.desc Verify from source Set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2600
     * @tc.name testTypedUArraysFromTestFileD026
     * @tc.desc Verify from source Set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(42);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(1);
      const val56 = result[0];
      expect(val56).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2700
     * @tc.name testTypedUArraysFromTestFileD027
     * @tc.desc Verify from source 100 Array<number> Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i % 256);
      }
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(100);
      const val57 = result[0];
      expect(val57).assertEqual(0);
      const val58 = result[99];
      expect(val58).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2800
     * @tc.name testTypedUArraysFromTestFileD028
     * @tc.desc Verify from source 100 Array<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i * 100);
      }
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(100);
      const val59 = result[0];
      expect(val59).assertEqual(0);
      const val60 = result[99];
      expect(val60).assertEqual(9900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_2900
     * @tc.name testTypedUArraysFromTestFileD029
     * @tc.desc Verify from source 200 Uint8Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(200);
      for (let i = 0; i < 200; i++) {
        src[i.toInt()] = i;
      }
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(200);
      const val61 = result[0];
      expect(val61).assertEqual(0);
      const val62 = result[199];
      expect(val62).assertEqual(199);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3000
     * @tc.name testTypedUArraysFromTestFileD030
     * @tc.desc Verify from source 50 BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<bigint> = [];
      for (let i = 0; i < 50; i++) {
        src.push(numberToBigint(i));
      }
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(50);
      const val63 = result[0];
      expect(val63).assertEqual(0n);
      const val64 = result[49];
      expect(val64).assertEqual(49n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3100
     * @tc.name testTypedUArraysFromTestFileD031
     * @tc.desc Verify from mapfn mapfn Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30, 40];
      let result = Uint8Array.from(src, (x: number): number => x * 2);
      const val65 = result[0];
      expect(val65).assertEqual(20);
      const val66 = result[1];
      expect(val66).assertEqual(40);
      const val67 = result[2];
      expect(val67).assertEqual(60);
      const val68 = result[3];
      expect(val68).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3200
     * @tc.name testTypedUArraysFromTestFileD032
     * @tc.desc Verify from mapfn mapfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4];
      let result = Uint16Array.from(src, (x: number, i: number): number => i % 2 === 0 ? x : x * 10);
      const val69 = result[0];
      expect(val69).assertEqual(1);
      const val70 = result[1];
      expect(val70).assertEqual(20);
      const val71 = result[2];
      expect(val71).assertEqual(3);
      const val72 = result[3];
      expect(val72).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3300
     * @tc.name testTypedUArraysFromTestFileD033
     * @tc.desc Verify from mapfn Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lookup: Map<string, number> = new Map<string, number>();
      lookup.set("a", 1);
      lookup.set("b", 2);
      lookup.set("c", 3);
      const src: Array<string> = ["a", "b", "c"];
      let result = Uint32Array.from(src, (x: string): number => lookup.get(x)!);
      const val73 = result[0];
      expect(val73).assertEqual(1);
      const val74 = result[1];
      expect(val74).assertEqual(2);
      const val75 = result[2];
      expect(val75).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3400
     * @tc.name testTypedUArraysFromTestFileD034
     * @tc.desc Verify from mapfn Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleFn = (x: number): number => x * 2;
      const addOne = (x: number): number => x + 1;
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src, (x: number): number => doubleFn(x) + addOne(x));
      const val76 = result[0];
      expect(val76).assertEqual(4);
      const val77 = result[1];
      expect(val77).assertEqual(7);
      const val78 = result[2];
      expect(val78).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3500
     * @tc.name testTypedUArraysFromTestFileD035
     * @tc.desc Verify from mapfn BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = BigUint64Array.from(src, (x: number): bigint => (numberToBigint(x) * 10n));
      const val79 = result[0];
      expect(val79).assertEqual(10n);
      const val80 = result[1];
      expect(val80).assertEqual(20n);
      const val81 = result[2];
      expect(val81).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3600
     * @tc.name testTypedUArraysFromTestFileD036
     * @tc.desc Verify from mapfn BigInt Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src, (x: number): number => x * 100);
      const val82 = result[0];
      expect(val82).assertEqual(100);
      const val83 = result[1];
      expect(val83).assertEqual(200);
      const val84 = result[2];
      expect(val84).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3700
     * @tc.name testTypedUArraysFromTestFileD037
     * @tc.desc Verify from mapfn index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 0, 0, 0, 0];
      let result = Uint8Array.from(src, (x: number, i: number): number => x >= 0 ? i * 10 : i * 10);
      const val85 = result[0];
      expect(val85).assertEqual(0);
      const val86 = result[1];
      expect(val86).assertEqual(10);
      const val87 = result[4];
      expect(val87).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMTEST04_3800
     * @tc.name testTypedUArraysFromTestFileD038
     * @tc.desc Verify from mapfn Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromTestFileD038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src, (x: number): number => 256 - x);
      const val88 = result[0];
      expect(val88).assertEqual(255);
      const val89 = result[1];
      expect(val89).assertEqual(254);
      const val90 = result[2];
      expect(val90).assertEqual(253);
    });

  });
}
