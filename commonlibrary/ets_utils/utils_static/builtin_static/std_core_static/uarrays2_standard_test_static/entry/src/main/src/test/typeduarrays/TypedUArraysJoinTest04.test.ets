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

export default function typedUArraysJoinTest04(): void {
  describe('TypedUArraysJoinTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0100
     * @tc.name testTypedUArraysJoinTestFileD001
     * @tc.desc Verify buffer join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr1 = new Uint8Array(buffer, 0, 4);
      const arr2 = new Uint8Array(buffer, 4, 4);
      const result1 = arr1.join(",");
      const result2 = arr2.join(",");
      expect(result1).assertEqual("0,0,0,0");
      expect(result2).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0200
     * @tc.name testTypedUArraysJoinTestFileD002
     * @tc.desc Verify Uint8Array buffer join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const arr = new Uint8Array(buffer);
      arr.join();
      const check = new Uint8Array(buffer);
      const val0 = check[0];
      expect(val0).assertEqual(0);
      const val1 = check[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0300
     * @tc.name testTypedUArraysJoinTestFileD003
     * @tc.desc Verify Uint16Array buffer join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer);
      arr.join();
      const check = new Uint16Array(buffer);
      const val2 = check[0];
      expect(val2).assertEqual(0);
      const val3 = check[1];
      expect(val3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0400
     * @tc.name testTypedUArraysJoinTestFileD004
     * @tc.desc Verify BigUint64Array buffer join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new BigUint64Array(buffer);
      arr.join();
      const check = new BigUint64Array(buffer);
      const val8 = check[0];
      expect(val8).assertEqual(0n);
      const val9 = check[1];
      expect(val9).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0500
     * @tc.name testTypedUArraysJoinTestFileD005
     * @tc.desc Verify join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      sub.join("-");
      const val10 = arr[0] ;
      expect(val10).assertEqual(1);
      const val11 = arr[1] ;
      expect(val11).assertEqual(2);
      const val12 = arr[2] ;
      expect(val12).assertEqual(3);
      const val13 = arr[3] ;
      expect(val13).assertEqual(4);
      const val14 = arr[4] ;
      expect(val14).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0600
     * @tc.name testTypedUArraysJoinTestFileD006
     * @tc.desc Verify slice join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sliced = arr.slice(1, 4);
      sliced.join("|");
      const val15 = arr[0] ;
      expect(val15).assertEqual(1);
      const val16 = arr[1] ;
      expect(val16).assertEqual(2);
      const val17 = arr[2] ;
      expect(val17).assertEqual(3);
      const val18 = arr[3] ;
      expect(val18).assertEqual(4);
      const val19 = arr[4] ;
      expect(val19).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0700
     * @tc.name testTypedUArraysJoinTestFileD007
     * @tc.desc Verify buffer Uint8Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const arr = new Uint8Array(buffer);
      let result = arr.join(",");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0800
     * @tc.name testTypedUArraysJoinTestFileD008
     * @tc.desc Verify buffer Uint16Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const arr = new Uint16Array(buffer);
      let result = arr.join("|");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_0900
     * @tc.name testTypedUArraysJoinTestFileD009
     * @tc.desc Verify buffer Uint32Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const arr = new Uint32Array(buffer);
      let result = arr.join("-");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1000
     * @tc.name testTypedUArraysJoinTestFileD010
     * @tc.desc Verify buffer Uint8ClampedArray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buffer);
      let result = arr.join("");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1100
     * @tc.name testTypedUArraysJoinTestFileD011
     * @tc.desc Verify join length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      sub.join("-");
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1200
     * @tc.name testTypedUArraysJoinTestFileD012
     * @tc.desc Verify slice join length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sliced = arr.slice(1, 4);
      sliced.join("|");
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1300
     * @tc.name testTypedUArraysJoinTestFileD013
     * @tc.desc Verify buffer Uint8Array join byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer);
      arr.join();
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1400
     * @tc.name testTypedUArraysJoinTestFileD014
     * @tc.desc Verify buffer BigUint64Array join byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new BigUint64Array(buffer);
      arr.join();
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1500
     * @tc.name testTypedUArraysJoinTestFileD015
     * @tc.desc Verify join byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      sub.join("-");
      expect(sub.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1600
     * @tc.name testTypedUArraysJoinTestFileD016
     * @tc.desc Verify slice join slice byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sliced = arr.slice(1, 4);
      sliced.join("|");
      expect(sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1700
     * @tc.name testTypedUArraysJoinTestFileD017
     * @tc.desc Verify buffer Uint16Array join byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint16Array(buffer, 4, 3);
      arr.join();
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1800
     * @tc.name testTypedUArraysJoinTestFileD018
     * @tc.desc Verify buffer Uint32Array join byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint32Array(buffer, 0, 2);
      arr.join();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_1900
     * @tc.name testTypedUArraysJoinTestFileD019
     * @tc.desc Verify join byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      sub.join("-");
      expect(sub.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_2000
     * @tc.name testTypedUArraysJoinTestFileD020
     * @tc.desc Verify slice join slice byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sliced = arr.slice(1, 4);
      sliced.join("|");
      expect(sliced.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_2100
     * @tc.name testTypedUArraysJoinTestFileD021
     * @tc.desc Verify buffer Uint8Array join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const arr = new Uint8Array(buffer);
      arr.join();
      const check = new Uint8Array(buffer);
      const val20 = check[0];
      expect(val20).assertEqual(0);
      const val21 = check[1];
      expect(val21).assertEqual(0);
      const val22 = check[2];
      expect(val22).assertEqual(0);
      const val23 = check[3];
      expect(val23).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_2200
     * @tc.name testTypedUArraysJoinTestFileD022
     * @tc.desc Verify join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x11, 0x22, 0x33, 0x44, 0x55]);
      const sub = arr.subarray(1, 4);
      sub.join("-");
      const val34 = arr[0] ;
      expect(val34).assertEqual(0x11);
      const val35 = arr[1] ;
      expect(val35).assertEqual(0x22);
      const val36 = arr[2] ;
      expect(val36).assertEqual(0x33);
      const val37 = arr[3] ;
      expect(val37).assertEqual(0x44);
      const val38 = arr[4] ;
      expect(val38).assertEqual(0x55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_2300
     * @tc.name testTypedUArraysJoinTestFileD023
     * @tc.desc Verify slice join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x11, 0x22, 0x33, 0x44, 0x55]);
      const sliced = arr.slice(1, 4);
      sliced.join("|");
      const val39 = arr[0] ;
      expect(val39).assertEqual(0x11);
      const val40 = arr[1] ;
      expect(val40).assertEqual(0x22);
      const val41 = arr[2] ;
      expect(val41).assertEqual(0x33);
      const val42 = arr[3] ;
      expect(val42).assertEqual(0x44);
      const val43 = arr[4] ;
      expect(val43).assertEqual(0x55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_2400
     * @tc.name testTypedUArraysJoinTestFileD024
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6]);
      const sub1 = arr.subarray(0, 3);
      const sub2 = arr.subarray(3, 6);
      const result1 = sub1.join(",");
      const result2 = sub2.join("|");
      expect(result1).assertEqual("1,2,3");
      expect(result2).assertEqual("4|5|6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOINTEST04_2500
     * @tc.name testTypedUArraysJoinTestFileD025
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub1 = arr.subarray(0, 3);
      const sub2 = arr.subarray(2, 5);
      const result1 = sub1.join("-");
      const result2 = sub2.join("+");
      expect(result1).assertEqual("1-2-3");
      expect(result2).assertEqual("3+4+5");
    });

  });
}
