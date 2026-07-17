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

export default function uint16ArrayConstructor201Test(): void {
  describe('Uint16ArrayConstructor201Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0100
     * @tc.name testUint16ArrayConstructor201_001
     * @tc.desc Verify 1 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0200
     * @tc.name testUint16ArrayConstructor201_002
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0300
     * @tc.name testUint16ArrayConstructor201_003
     * @tc.desc Verify length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0400
     * @tc.name testUint16ArrayConstructor201_004
     * @tc.desc Verify length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(100);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0500
     * @tc.name testUint16ArrayConstructor201_005
     * @tc.desc Verify length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(65535);
      expect(arr.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0600
     * @tc.name testUint16ArrayConstructor201_006
     * @tc.desc Verify byteLength length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0700
     * @tc.name testUint16ArrayConstructor201_007
     * @tc.desc Verify byteLength length BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0800
     * @tc.name testUint16ArrayConstructor201_008
     * @tc.desc Verify 65535 byteLength 131070
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(65535);
      expect(arr.byteLength).assertEqual(131070);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_0900
     * @tc.name testUint16ArrayConstructor201_009
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      expect(arr.buffer.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1000
     * @tc.name testUint16ArrayConstructor201_010
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1100
     * @tc.name testUint16ArrayConstructor201_011
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1200
     * @tc.name testUint16ArrayConstructor201_012
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1300
     * @tc.name testUint16ArrayConstructor201_013
     * @tc.desc Verify toString 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr.toString()).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1400
     * @tc.name testUint16ArrayConstructor201_014
     * @tc.desc Verify arr[0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(1);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1500
     * @tc.name testUint16ArrayConstructor201_015
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(4);
      let allZero: boolean = arr[0] === 0 && arr[1] === 0 && arr[2] === 0 && arr[3] === 0;
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1600
     * @tc.name testUint16ArrayConstructor201_016
     * @tc.desc Verify length -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let arr: Uint16Array = new Uint16Array((-1));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1700
     * @tc.name testUint16ArrayConstructor201_017
     * @tc.desc Verify length int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let arr: Uint16Array = new Uint16Array((-0x80000000));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1800
     * @tc.name testUint16ArrayConstructor201_018
     * @tc.desc Verify 1 FixedArray<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_1900
     * @tc.name testUint16ArrayConstructor201_019
     * @tc.desc Verify FixedArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2000
     * @tc.name testUint16ArrayConstructor201_020
     * @tc.desc Verify 1e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1e3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2100
     * @tc.name testUint16ArrayConstructor201_021
     * @tc.desc Verify 2e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [2e4];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(20000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2200
     * @tc.name testUint16ArrayConstructor201_022
     * @tc.desc Verify 65537 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [65537.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2300
     * @tc.name testUint16ArrayConstructor201_023
     * @tc.desc Verify -65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [-65536.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2400
     * @tc.name testUint16ArrayConstructor201_024
     * @tc.desc Verify -65537 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [-65537.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2500
     * @tc.name testUint16ArrayConstructor201_025
     * @tc.desc Verify 65536*2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [131072.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2600
     * @tc.name testUint16ArrayConstructor201_026
     * @tc.desc Verify FixedArray values are copied into Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0.0, 65535.0, 32768.0, 100.0, 1.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(32768);
      expect(arr.at(3)).assertEqual(100);
      expect(arr.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2700
     * @tc.name testUint16ArrayConstructor201_027
     * @tc.desc Verify repeated FixedArray values are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [42.0, 42.0, 42.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2800
     * @tc.name testUint16ArrayConstructor201_028
     * @tc.desc Verify 1e-10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1e-10];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_2900
     * @tc.name testUint16ArrayConstructor201_029
     * @tc.desc Verify 2.999 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [2.999];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3000
     * @tc.name testUint16ArrayConstructor201_030
     * @tc.desc Verify 0.999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0.999];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3100
     * @tc.name testUint16ArrayConstructor201_031
     * @tc.desc Verify 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3200
     * @tc.name testUint16ArrayConstructor201_032
     * @tc.desc Verify 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [9007199254740991.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3300
     * @tc.name testUint16ArrayConstructor201_033
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3400
     * @tc.name testUint16ArrayConstructor201_034
     * @tc.desc Verify byteLength length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3500
     * @tc.name testUint16ArrayConstructor201_035
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.0, 2.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3600
     * @tc.name testUint16ArrayConstructor201_036
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.0, 2.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3700
     * @tc.name testUint16ArrayConstructor201_037
     * @tc.desc Verify FixedArray elements preserve order in Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [100.0, 200.0, 300.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3800
     * @tc.name testUint16ArrayConstructor201_038
     * @tc.desc Verify 100 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = new FixedArray<number>(100);
      for (let i: int = 0; i < 100; i++) {
        src[i] = 1.0 * i;
      }
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_3900
     * @tc.name testUint16ArrayConstructor201_039
     * @tc.desc Verify FixedArray byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4000
     * @tc.name testUint16ArrayConstructor201_040
     * @tc.desc Verify FixedArray buffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4100
     * @tc.name testUint16ArrayConstructor201_041
     * @tc.desc Verify Uint16Array copies values independently from source FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [42.0];
      let arr: Uint16Array = new Uint16Array(src);
      src[0] = 99.0;
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4200
     * @tc.name testUint16ArrayConstructor201_042
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4300
     * @tc.name testUint16ArrayConstructor201_043
     * @tc.desc Verify 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4400
     * @tc.name testUint16ArrayConstructor201_044
     * @tc.desc Verify 4 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4500
     * @tc.name testUint16ArrayConstructor201_045
     * @tc.desc Verify 2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4600
     * @tc.name testUint16ArrayConstructor201_046
     * @tc.desc Verify 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4700
     * @tc.name testUint16ArrayConstructor201_047
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4800
     * @tc.name testUint16ArrayConstructor201_048
     * @tc.desc Verify byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2.0);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_4900
     * @tc.name testUint16ArrayConstructor201_049
     * @tc.desc Verify byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 4.0);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5000
     * @tc.name testUint16ArrayConstructor201_050
     * @tc.desc Verify byteOffset 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 6.0);
      expect(arr.byteOffset).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5100
     * @tc.name testUint16ArrayConstructor201_051
     * @tc.desc Verify byteOffset buffer 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 6.0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5200
     * @tc.name testUint16ArrayConstructor201_052
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 8.0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5300
     * @tc.name testUint16ArrayConstructor201_053
     * @tc.desc Verify byteOffset 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5400
     * @tc.name testUint16ArrayConstructor201_054
     * @tc.desc Verify byteOffset 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5500
     * @tc.name testUint16ArrayConstructor201_055
     * @tc.desc Verify byteOffset 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 2.0);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5600
     * @tc.name testUint16ArrayConstructor201_056
     * @tc.desc Verify byteOffset 2.5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 2.5);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5700
     * @tc.name testUint16ArrayConstructor201_057
     * @tc.desc Verify byteOffset 1.5 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 1.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5800
     * @tc.name testUint16ArrayConstructor201_058
     * @tc.desc Verify new Uint16Array(length) with length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(2);
      arr[0] = 65535;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_5900
     * @tc.name testUint16ArrayConstructor201_059
     * @tc.desc Verify new Uint16Array(FixedArray<number>) with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0, 1, 32767, 32768, 65534, 65535];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(3)).assertEqual(32768);
      expect(arr.at(4)).assertEqual(65534);
      expect(arr.at(5)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR201_6000
     * @tc.name testUint16ArrayConstructor201_060
     * @tc.desc Verify new Uint16Array(length) returns the array itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor201_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      expect(arr instanceof Uint16Array).assertTrue();
    });

  });
}
