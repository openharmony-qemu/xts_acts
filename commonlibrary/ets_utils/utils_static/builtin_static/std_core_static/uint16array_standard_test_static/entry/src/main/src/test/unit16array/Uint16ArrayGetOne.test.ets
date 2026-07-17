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

export default function uint16Array$Get01Test(): void {
  describe('Uint16Array$Get01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0001
     * @tc.name testUint16Array$Get01_001
     * @tc.desc Verify $_get returns the element at index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(42);
      let v = arr.$_get(0);
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0002
     * @tc.name testUint16Array$Get01_002
     * @tc.desc Verify $_get on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array();
      try {
        let v = arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0003
     * @tc.name testUint16Array$Get01_003
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let v = arr.$_get(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0004
     * @tc.name testUint16Array$Get01_004
     * @tc.desc Verify index=0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65535);
      let v = arr.$_get(0);
      expect(v).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0005
     * @tc.name testUint16Array$Get01_005
     * @tc.desc Verify index=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0006
     * @tc.name testUint16Array$Get01_006
     * @tc.desc Verify index=0 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(32768);
      let v = arr.$_get(0);
      expect(v).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0007
     * @tc.name testUint16Array$Get01_007
     * @tc.desc Verify index=0 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(32767);
      let v = arr.$_get(0);
      expect(v).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0008
     * @tc.name testUint16Array$Get01_008
     * @tc.desc Verify index=0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1);
      let v = arr.$_get(0);
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0009
     * @tc.name testUint16Array$Get01_009
     * @tc.desc Verify index=0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(255);
      let v = arr.$_get(0);
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0010
     * @tc.name testUint16Array$Get01_010
     * @tc.desc Verify index=0 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65534);
      let v = arr.$_get(0);
      expect(v).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0011
     * @tc.name testUint16Array$Get01_011
     * @tc.desc Verify index=0 from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.from(Array.of<number>(10.0, 20.0, 30.0), (v: Double): Double => v);
      let v = arr.$_get(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0012
     * @tc.name testUint16Array$Get01_012
     * @tc.desc Verify index=0 from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.from(Array.of<number>(1.0, 2.0, 3.0), (v: Double): Double => v * 10.0);
      let v = arr.$_get(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0013
     * @tc.name testUint16Array$Get01_013
     * @tc.desc Verify index=length index=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      try {
        let v = arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0014
     * @tc.name testUint16Array$Get01_014
     * @tc.desc Verify index=length index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(42);
      try {
        let v = arr.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0015
     * @tc.name testUint16Array$Get01_015
     * @tc.desc Verify index=length+10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(42);
      try {
        let v = arr.$_get(11);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0016
     * @tc.name testUint16Array$Get01_016
     * @tc.desc Verify index=65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3);
      try {
        let v = arr.$_get(65535);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0017
     * @tc.name testUint16Array$Get01_017
     * @tc.desc Verify index=2147483647 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3);
      try {
        let v = arr.$_get(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0018
     * @tc.name testUint16Array$Get01_018
     * @tc.desc Verify index=0x7FFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2);
      try {
        let v = arr.$_get(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0019
     * @tc.name testUint16Array$Get01_019
     * @tc.desc Verify index=0x10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2);
      try {
        let v = arr.$_get(0x10000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0020
     * @tc.name testUint16Array$Get01_020
     * @tc.desc Verify $_get with index -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      try {
        let v = arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0021
     * @tc.name testUint16Array$Get01_021
     * @tc.desc Verify index=-2147483648 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3);
      try {
        let v = arr.$_get(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0022
     * @tc.name testUint16Array$Get01_022
     * @tc.desc Verify index=-65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3);
      try {
        let v = arr.$_get(-65535);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0023
     * @tc.name testUint16Array$Get01_023
     * @tc.desc Verify $_get with index -1 on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array();
      try {
        let v = arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0024
     * @tc.name testUint16Array$Get01_024
     * @tc.desc Verify 100 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0025
     * @tc.name testUint16Array$Get01_025
     * @tc.desc Verify 100 index=49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(49);
      expect(v).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0026
     * @tc.name testUint16Array$Get01_026
     * @tc.desc Verify 100 index=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(99);
      expect(v).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0027
     * @tc.name testUint16Array$Get01_027
     * @tc.desc Verify $_get at index 100 for length 100 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      try {
        let v = arr.$_get(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0028
     * @tc.name testUint16Array$Get01_028
     * @tc.desc Verify $_get at index -1 for length 100 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      try {
        let v = arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0029
     * @tc.name testUint16Array$Get01_029
     * @tc.desc Verify 1000 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0030
     * @tc.name testUint16Array$Get01_030
     * @tc.desc Verify 1000 index=500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(500);
      expect(v).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0031
     * @tc.name testUint16Array$Get01_031
     * @tc.desc Verify 1000 index=999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(999);
      expect(v).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0032
     * @tc.name testUint16Array$Get01_032
     * @tc.desc Verify index=0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(256);
      for (let i = 0; i < 256; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(0xFF);
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0033
     * @tc.name testUint16Array$Get01_033
     * @tc.desc Verify index=0xFF+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        let arr = new Uint16Array(256);
        for (let i = 0; i < 256; i++) {
          arr.$_set(i, i);
        }
        let v = arr.$_get(0x100);
        expect().assertFail();
      }catch(e){
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0034
     * @tc.name testUint16Array$Get01_034
     * @tc.desc Verify index=0o77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(0o77);
      expect(v).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0035
     * @tc.name testUint16Array$Get01_035
     * @tc.desc Verify index=0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      let v = arr.$_get(0b1010);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0036
     * @tc.name testUint16Array$Get01_036
     * @tc.desc Verify index=0xA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0,1,2,3,4,5,6,7,8,9,20);
      let v = arr.$_get(0xA);
      expect(v).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0037
     * @tc.name testUint16Array$Get01_037
     * @tc.desc Verify $_get $_set 100 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.$_set(0, 100);
      let v = arr.$_get(0);
      expect(v).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0038
     * @tc.name testUint16Array$Get01_038
     * @tc.desc Verify $_get $_set 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.$_set(0, 65535);
      let v = arr.$_get(0);
      expect(v).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0039
     * @tc.name testUint16Array$Get01_039
     * @tc.desc Verify $_get $_set 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.$_set(0, 0);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0040
     * @tc.name testUint16Array$Get01_040
     * @tc.desc Verify $_get $_set 32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.$_set(0, 32768);
      let v = arr.$_get(0);
      expect(v).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0041
     * @tc.name testUint16Array$Get01_041
     * @tc.desc Verify $_get $_set 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.$_set(0, 1);
      let v = arr.$_get(0);
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0042
     * @tc.name testUint16Array$Get01_042
     * @tc.desc Verify $_get of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(5, 10, 15);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0043
     * @tc.name testUint16Array$Get01_043
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let arr = new Uint16Array(src);
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(200);
      expect(arr.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0044
     * @tc.name testUint16Array$Get01_044
     * @tc.desc Verify $_get FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([7, 14, 21]);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(14);
      expect(arr.$_get(2)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0045
     * @tc.name testUint16Array$Get01_045
     * @tc.desc Verify $_get number 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0046
     * @tc.name testUint16Array$Get01_046
     * @tc.desc Verify $_get returns the stored number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(42);
      let v = arr.$_get(0);
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0047
     * @tc.name testUint16Array$Get01_047
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(99, 199, 299);
      let v1 = arr.$_get(1);
      let v2 = arr.$_get(1);
      expect(v1).assertEqual(v2);
      expect(v1).assertEqual(199);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0048
     * @tc.name testUint16Array$Get01_048
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3);
      let lenBefore = arr.length;
      let v = arr.$_get(0);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0049
     * @tc.name testUint16Array$Get01_049
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let v = arr.$_get(1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0050
     * @tc.name testUint16Array$Get01_050
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3, 4, 5);
      for (let i = 0; i < 5; i++) {
        expect(arr.$_get(i)).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0051
     * @tc.name testUint16Array$Get01_051
     * @tc.desc Verify $_get $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.$_set(0, 5);
      expect(arr.$_get(0)).assertEqual(5);
      arr.$_set(0, 10);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0052
     * @tc.name testUint16Array$Get01_052
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3);
      arr.$_set(1, 99);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0053
     * @tc.name testUint16Array$Get01_053
     * @tc.desc Verify $_get of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0, 1, 32767, 32768, 65534, 65535);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(32767);
      expect(arr.$_get(3)).assertEqual(32768);
      expect(arr.$_get(4)).assertEqual(65534);
      expect(arr.$_get(5)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0054
     * @tc.name testUint16Array$Get01_054
     * @tc.desc Verify of(65536) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65536);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0055
     * @tc.name testUint16Array$Get01_055
     * @tc.desc Verify of(65537) 1 $_get(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65537);
      let v = arr.$_get(0);
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0056
     * @tc.name testUint16Array$Get01_056
     * @tc.desc Verify of(131071) 65535 $_get(0) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(131071);
      let v = arr.$_get(0);
      expect(v).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0057
     * @tc.name testUint16Array$Get01_057
     * @tc.desc Verify of(-1) 65535 $_get(0) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(-1);
      let v = arr.$_get(0);
      expect(v).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0058
     * @tc.name testUint16Array$Get01_058
     * @tc.desc Verify of(-65536) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(-65536);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0059
     * @tc.name testUint16Array$Get01_059
     * @tc.desc Verify of(-65537) 65535 $_get(0) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(-65537);
      let v = arr.$_get(0);
      expect(v).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0060
     * @tc.name testUint16Array$Get01_060
     * @tc.desc Verify of(3.14) 3 $_get(0) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(3.14);
      let v = arr.$_get(0);
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0061
     * @tc.name testUint16Array$Get01_061
     * @tc.desc Verify of(65535.9) 65535 $_get(0) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65535.9);
      let v = arr.$_get(0);
      expect(v).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0062
     * @tc.name testUint16Array$Get01_062
     * @tc.desc Verify of(0.999) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0.999);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0063
     * @tc.name testUint16Array$Get01_063
     * @tc.desc Verify of(-0.5) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(-0.5);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0064
     * @tc.name testUint16Array$Get01_064
     * @tc.desc Verify of(NaN) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(Number.NaN);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0065
     * @tc.name testUint16Array$Get01_065
     * @tc.desc Verify of(Infinity) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(Number.POSITIVE_INFINITY);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0066
     * @tc.name testUint16Array$Get01_066
     * @tc.desc Verify of(-Infinity) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(-Number.POSITIVE_INFINITY);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0067
     * @tc.name testUint16Array$Get01_067
     * @tc.desc Verify of(65536*2) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(131072);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0068
     * @tc.name testUint16Array$Get01_068
     * @tc.desc Verify of(-65536*2) 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(-131072);
      let v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0069
     * @tc.name testUint16Array$Get01_069
     * @tc.desc Verify of(-2) 65534 $_get(0) 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(-2);
      let v = arr.$_get(0);
      expect(v).assertEqual(65534);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0070
     * @tc.name testUint16Array$Get01_070
     * @tc.desc Verify of(1e5) 100000%65536=34464 $_get(0) 34464
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(100000);
      let v = arr.$_get(0);
      expect(v).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0071
     * @tc.name testUint16Array$Get01_071
     * @tc.desc Verify $_get with Int.MAX_VALUE throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2);
      try {
        let v = arr.$_get(0x7FFFFFFF);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0072
     * @tc.name testUint16Array$Get01_072
     * @tc.desc Verify $_get with Int.MIN_VALUE throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2);
      try {
        let v = arr.$_get(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0073
     * @tc.name testUint16Array$Get01_073
     * @tc.desc Verify $_get with index 65537 on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array();
      try {
        let v = arr.$_get(65537);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0074
     * @tc.name testUint16Array$Get01_074
     * @tc.desc Verify $_get with float index 2.9 (should truncate to 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40);
      let v = arr.$_get(Double.toInt(2.9));
      expect(v).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0075
     * @tc.name testUint16Array$Get01_075
     * @tc.desc Verify $_get on ArrayBuffer view with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(12);
      let view1 = new Uint16Array(buffer, 2, 4);
      view1.$_set(0, 100);
      view1.$_set(1, 200);
      view1.$_set(2, 300);
      view1.$_set(3, 400);
      let view2 = new Uint16Array(buffer, 2, 4);
      expect(view2.$_get(0)).assertEqual(100);
      expect(view2.$_get(2)).assertEqual(300);
      expect(view2.$_get(3)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0076
     * @tc.name testUint16Array$Get01_076
     * @tc.desc Verify $_get with multiple boundary values in one array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0, 1, 32767, 32768, 65534, 65535);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(32767);
      expect(arr.$_get(3)).assertEqual(32768);
      expect(arr.$_get(5)).assertEqual(65535);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0077
     * @tc.name testUint16Array$Get01_077
     * @tc.desc Verify indexed get offset-view index zero reads from its byte offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(10, 20, 30);
      let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
      expect(view.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0078
     * @tc.name testUint16Array$Get01_078
     * @tc.desc Verify indexed get offset-view last index reads the final view element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
      expect(view.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0079
     * @tc.name testUint16Array$Get01_079
     * @tc.desc Verify indexed get read reflects a write through an overlapping view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let first: Uint16Array = new Uint16Array(buffer, 0, 3);
      let second: Uint16Array = new Uint16Array(buffer, 2, 3);
      second[0] = 91;
      expect(first.$_get(1)).assertEqual(91);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0080
     * @tc.name testUint16Array$Get01_080
     * @tc.desc Verify indexed get read reflects a DataView little-endian write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(4);
      let view: DataView = new DataView(buffer);
      view.setUint16(2, 2048, true);
      let arr: Uint16Array = new Uint16Array(buffer);
      expect(arr.$_get(1)).assertEqual(2048);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0081
     * @tc.name testUint16Array$Get01_081
     * @tc.desc Verify indexed get read of maximum Uint16 returns a number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let value: number = arr.$_get(0);
      expect(value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0082
     * @tc.name testUint16Array$Get01_082
     * @tc.desc Verify indexed get repeated indexed reads do not change receiver metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      arr.$_get(0);
      arr.$_get(1);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_$_GET01_0083
     * @tc.name testUint16Array$Get01_083
     * @tc.desc Verify an out-of-range read on an offset view cannot access a backing element outside the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16Array$Get01_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 2);
      try {
        view.$_get(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(backing.at(3)).assertEqual(40);
    });

  });
}
