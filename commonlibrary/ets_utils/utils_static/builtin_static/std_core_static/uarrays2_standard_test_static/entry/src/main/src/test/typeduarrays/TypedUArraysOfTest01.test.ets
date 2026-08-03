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

export default function typedUArraysOfTest01(): void {
  describe('TypedUArraysOfTest01', (): void => {
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
     * @tc.name testTypedUArraysOfTestFileA001
     * @tc.desc Verify Uint8Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0200
     * @tc.name testTypedUArraysOfTestFileA002
     * @tc.desc Verify Uint8Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0300
     * @tc.name testTypedUArraysOfTestFileA003
     * @tc.desc Verify Uint8Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0400
     * @tc.name testTypedUArraysOfTestFileA004
     * @tc.desc Verify Uint8Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0500
     * @tc.name testTypedUArraysOfTestFileA005
     * @tc.desc Verify Uint8Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0600
     * @tc.name testTypedUArraysOfTestFileA006
     * @tc.desc Verify Uint8Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0700
     * @tc.name testTypedUArraysOfTestFileA007
     * @tc.desc Verify Uint8Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0800
     * @tc.name testTypedUArraysOfTestFileA008
     * @tc.desc Verify Uint8ClampedArray.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_0900
     * @tc.name testTypedUArraysOfTestFileA009
     * @tc.desc Verify Uint8ClampedArray.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1000
     * @tc.name testTypedUArraysOfTestFileA010
     * @tc.desc Verify Uint8ClampedArray.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1100
     * @tc.name testTypedUArraysOfTestFileA011
     * @tc.desc Verify Uint8ClampedArray.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1200
     * @tc.name testTypedUArraysOfTestFileA012
     * @tc.desc Verify Uint8ClampedArray.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1300
     * @tc.name testTypedUArraysOfTestFileA013
     * @tc.desc Verify Uint16Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1400
     * @tc.name testTypedUArraysOfTestFileA014
     * @tc.desc Verify Uint16Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1500
     * @tc.name testTypedUArraysOfTestFileA015
     * @tc.desc Verify Uint16Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1600
     * @tc.name testTypedUArraysOfTestFileA016
     * @tc.desc Verify Uint16Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1700
     * @tc.name testTypedUArraysOfTestFileA017
     * @tc.desc Verify Uint16Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1800
     * @tc.name testTypedUArraysOfTestFileA018
     * @tc.desc Verify Uint32Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_1900
     * @tc.name testTypedUArraysOfTestFileA019
     * @tc.desc Verify Uint32Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2000
     * @tc.name testTypedUArraysOfTestFileA020
     * @tc.desc Verify Uint32Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2100
     * @tc.name testTypedUArraysOfTestFileA021
     * @tc.desc Verify Uint32Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2200
     * @tc.name testTypedUArraysOfTestFileA022
     * @tc.desc Verify Uint32Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2300
     * @tc.name testTypedUArraysOfTestFileA023
     * @tc.desc Verify BigUint64Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2400
     * @tc.name testTypedUArraysOfTestFileA024
     * @tc.desc Verify BigUint64Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(42n);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2500
     * @tc.name testTypedUArraysOfTestFileA025
     * @tc.desc Verify BigUint64Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2600
     * @tc.name testTypedUArraysOfTestFileA026
     * @tc.desc Verify BigUint64Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2700
     * @tc.name testTypedUArraysOfTestFileA027
     * @tc.desc Verify BigUint64Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2800
     * @tc.name testTypedUArraysOfTestFileA028
     * @tc.desc Verify Uint8Array.of() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42);
      const val0 = arr[0] ;
      expect(val0).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_2900
     * @tc.name testTypedUArraysOfTestFileA029
     * @tc.desc Verify Uint8ClampedArray.of() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(42);
      const val1 = arr[0] ;
      expect(val1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3000
     * @tc.name testTypedUArraysOfTestFileA030
     * @tc.desc Verify Uint16Array.of() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(42);
      const val2 = arr[0] ;
      expect(val2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3100
     * @tc.name testTypedUArraysOfTestFileA031
     * @tc.desc Verify Uint32Array.of() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      const val3 = arr[0] ;
      expect(val3).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3200
     * @tc.name testTypedUArraysOfTestFileA032
     * @tc.desc Verify BigUint64Array.of() BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(42n);
      const val4 = arr[0] ;
      expect(val4).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3300
     * @tc.name testTypedUArraysOfTestFileA033
     * @tc.desc Verify BigUint64Array.of() BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      const val5 = arr[0] ;
      expect(val5).assertEqual(1n);
      const val6 = arr[1] ;
      expect(val6).assertEqual(2n);
      const val7 = arr[2] ;
      expect(val7).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3400
     * @tc.name testTypedUArraysOfTestFileA034
     * @tc.desc Verify Uint8Array.of() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const val8 = arr[0] ;
      expect(val8).assertEqual(1);
      const val9 = arr[1] ;
      expect(val9).assertEqual(2);
      const val10 = arr[2] ;
      expect(val10).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3500
     * @tc.name testTypedUArraysOfTestFileA035
     * @tc.desc Verify Uint16Array.of() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3);
      const val11 = arr[0] ;
      expect(val11).assertEqual(1);
      const val12 = arr[1] ;
      expect(val12).assertEqual(2);
      const val13 = arr[2] ;
      expect(val13).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3600
     * @tc.name testTypedUArraysOfTestFileA036
     * @tc.desc Verify Uint32Array.of() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const val14 = arr[0] ;
      expect(val14).assertEqual(1);
      const val15 = arr[1] ;
      expect(val15).assertEqual(2);
      const val16 = arr[2] ;
      expect(val16).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3700
     * @tc.name testTypedUArraysOfTestFileA037
     * @tc.desc Verify Uint8ClampedArray.of() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      const val17 = arr[0] ;
      expect(val17).assertEqual(1);
      const val18 = arr[1] ;
      expect(val18).assertEqual(2);
      const val19 = arr[2] ;
      expect(val19).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3800
     * @tc.name testTypedUArraysOfTestFileA038
     * @tc.desc Verify Uint8Array.of() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      const val20 = arr[0] ;
      expect(val20).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_3900
     * @tc.name testTypedUArraysOfTestFileA039
     * @tc.desc Verify Uint8Array.of() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      const val21 = arr[0] ;
      expect(val21).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4000
     * @tc.name testTypedUArraysOfTestFileA040
     * @tc.desc Verify Uint8Array.of() 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(127);
      const val22 = arr[0] ;
      expect(val22).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4100
     * @tc.name testTypedUArraysOfTestFileA041
     * @tc.desc Verify Uint8Array.of() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255);
      const val23 = arr[0] ;
      expect(val23).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4200
     * @tc.name testTypedUArraysOfTestFileA042
     * @tc.desc Verify Uint8Array.of() 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0xFF);
      const val24 = arr[0] ;
      expect(val24).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4300
     * @tc.name testTypedUArraysOfTestFileA043
     * @tc.desc Verify Uint8Array.of() 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0x80);
      const val25 = arr[0] ;
      expect(val25).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4400
     * @tc.name testTypedUArraysOfTestFileA044
     * @tc.desc Verify Uint8Array.of() -1 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(-1);
      const val26 = arr[0] ;
      expect(val26).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART1_4500
     * @tc.name testTypedUArraysOfTestFileA045
     * @tc.desc Verify Uint8Array.of() 256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(256);
      const val27 = arr[0] ;
      expect(val27).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYSOFTEST01_4600
     * @tc.name testTypedUArraysOfTestFileA046
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0x100);
      const val28 = arr[0];
      expect(val28).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_4700
     * @tc.name testTypedUArraysOfTestFileA047
     * @tc.desc Verify Uint8Array constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_4800
     * @tc.name testTypedUArraysOfTestFileA048
     * @tc.desc Verify Uint16Array constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_4900
     * @tc.name testTypedUArraysOfTestFileA049
     * @tc.desc Verify Uint32Array constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_5000
     * @tc.name testTypedUArraysOfTestFileA050
     * @tc.desc Verify BigUint64Array constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_5100
     * @tc.name testTypedUArraysOfTestFileA051
     * @tc.desc Verify Uint8ClampedArray constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_5200
     * @tc.name testTypedUArraysOfTestFileA052
     * @tc.desc Verify Uint8Array constructor from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const arr = new Uint8Array(buffer);
      expect(arr.length).assertEqual(4);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_5300
     * @tc.name testTypedUArraysOfTestFileA053
     * @tc.desc Verify Uint16Array constructor from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const arr = new Uint16Array(buffer);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_5400
     * @tc.name testTypedUArraysOfTestFileA054
     * @tc.desc Verify Uint32Array constructor from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint32Array(buffer);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_5500
     * @tc.name testTypedUArraysOfTestFileA055
     * @tc.desc Verify BigUint64Array constructor from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new BigUint64Array(buffer);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_5600
     * @tc.name testTypedUArraysOfTestFileA056
     * @tc.desc Verify Uint8ClampedArray constructor from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buffer);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_5700
     * @tc.name testTypedUArraysOfTestFileA057
     * @tc.desc Verify Uint8Array BYTES_PER_ELEMENT property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_5800
     * @tc.name testTypedUArraysOfTestFileA058
     * @tc.desc Verify Uint16Array BYTES_PER_ELEMENT property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_5900
     * @tc.name testTypedUArraysOfTestFileA059
     * @tc.desc Verify Uint32Array BYTES_PER_ELEMENT property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_6000
     * @tc.name testTypedUArraysOfTestFileA060
     * @tc.desc Verify BigUint64Array BYTES_PER_ELEMENT property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_6100
     * @tc.name testTypedUArraysOfTestFileA061
     * @tc.desc Verify Uint8ClampedArray BYTES_PER_ELEMENT property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_0600
     * @tc.name testTypedUArraysProperty006
     * @tc.desc Verify Uint8Array buffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_6200
     * @tc.name testTypedUArraysOfTestFileA062
     * @tc.desc Verify Uint8Array buffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      const buf = arr.buffer;
      expect(buf).not().assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_6300
     * @tc.name testTypedUArraysOfTestFileA063
     * @tc.desc Verify Uint8Array byteOffset property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileA063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      expect(arr.byteOffset).assertEqual(0);
    });

  });
}
