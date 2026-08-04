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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayConstructor03Test(): void {
  describe('Uint8ArrayConstructor03Test', (): void => {
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
     * @tc.name testUint8ArrayConstructor03_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0100
     * @tc.desc Verify constructor(length: number) with 1 parameter is valid
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5.0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0200
     * @tc.desc Verify length 0.0 creates empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0.0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0300
     * @tc.desc Verify length 2.0 creates 2-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(2.0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0400
     * @tc.desc Verify length 3.5 truncates to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3.5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0500
     * @tc.desc Verify length 1.999 truncates to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1.999);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0600
     * @tc.desc Verify length scientific notation 1e5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1e5);
      expect(arr.length).assertEqual(100000);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0700
     * @tc.desc Verify length scientific notation 1e6
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1e6);
      expect(arr.length).assertEqual(1000000);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0800
     * @tc.desc Verify length hexadecimal literal 0xFF
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0xFF);
      expect(arr.length).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_0900
     * @tc.desc Verify length hexadecimal literal 0xFFFF
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0xFFFF);
      expect(arr.length).assertEqual(65535);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1000
     * @tc.desc Verify length octal literal 0o377
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0o377);
      expect(arr.length).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1100
     * @tc.desc Verify length binary literal 0b11111111
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0b11111111);
      expect(arr.length).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1200
     * @tc.desc Verify length -1 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1300
     * @tc.desc Verify length -100 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(-100);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1400
     * @tc.desc Verify length -0 is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(-0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1500
     * @tc.desc Verify length -Infinity throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(Number.NEGATIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1600
     * @tc.desc Verify length NaN truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(Number.NaN);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1700
     * @tc.desc Verify length Number.MIN_VALUE truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(Number.MIN_VALUE);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1800
     * @tc.desc Verify length Number.MAX_SAFE_INTEGER throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(Number.MAX_SAFE_INTEGER);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_1900
     * @tc.desc Verify length 0x7FFFFFFF throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(0x7FFFFFFF);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2000
     * @tc.desc Verify length 5 byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2100
     * @tc.desc Verify length 5 buffer.byteLength is 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5.0);
      expect(arr.buffer.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2200
     * @tc.desc Verify length 5 name is Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5.0);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor03_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2300
     * @tc.desc Verify length 5 BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5.0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2400
     * @tc.desc Verify length 5 first element initialized to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2500
     * @tc.desc Verify length 5 last element initialized to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5.0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2600
     * @tc.desc Verify length 1 first element initialized to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2700
     * @tc.desc Verify length 100 length is 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100.0);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2800
     * @tc.desc Verify length Infinity throws exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_2900
     * @tc.desc Verify length Number.MAX_VALUE throws exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(Number.MAX_VALUE);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3000
     * @tc.desc Verify constructor(numbers: Array<int>) with 1 parameter is valid
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3100
     * @tc.desc Verify empty Array<int> creates empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3200
     * @tc.desc Verify single element 0 creates length 1 value 0 Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3300
     * @tc.desc Verify single element 255 creates length 1 value 255 Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [255];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3400
     * @tc.desc Verify single element 256 truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [256];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3500
     * @tc.desc Verify single element -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3600
     * @tc.desc Verify single element -128 wraps to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-128];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3700
     * @tc.desc Verify single element 1000 truncates to 232
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1000];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(232);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3800
     * @tc.desc Verify single element -1000 wraps to 24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1000];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(24);
    });

    

    /**
     * @tc.name testUint8ArrayConstructor03_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_3900
     * @tc.desc Verify single element 0x7F hexadecimal 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0x7F];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4000
     * @tc.desc Verify single element 0xFF hexadecimal 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0xFF];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4100
     * @tc.desc Verify single element 0o377 octal 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0o377];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4200
     * @tc.desc Verify single element 0b11111111 binary 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0b11111111];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4300
     * @tc.desc Verify single element -0 truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-0];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4400
     * @tc.desc Verify three boundary values 0,128,255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 128, 255];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(128);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4500
     * @tc.desc Verify five-element sequence [1,2,3,4,5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4600
     * @tc.desc Verify mid values [127,128]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [127, 128];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(127);
      expect(arr[1]).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4700
     * @tc.desc Verify all zeros [0,0,0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4800
     * @tc.desc Verify all max [255,255,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [255, 255, 255];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_4900
     * @tc.desc Verify alternating positive-negative values wrap [1,-1,1,-1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, -1, 1, -1];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[1]).assertEqual(255);
      expect(arr[3]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5000
     * @tc.desc Verify boundary overflow sequence [255,256,257]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [255, 256, 257];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5100
     * @tc.desc Verify negative overflow [0,256,0,256] via pair
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 256];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5200
     * @tc.desc Verify mixed [256,-1,300,-50]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [256, -1, 300, -50];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(44);
      expect(arr[3]).assertEqual(206);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5300
     * @tc.desc Verify 100-element validation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let i: int = 0;
      while (i < 100) {
        src.push(i);
        i++;
      }
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5400
     * @tc.desc Verify 100-element byteLength validation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let i: int = 0;
      while (i < 100) {
        src.push(i & 0xFF);
        i++;
      }
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr.byteLength).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5500
     * @tc.desc Verify non-empty array buffer.byteLength matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr.buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5600
     * @tc.desc Verify byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5700
     * @tc.desc Verify BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5800
     * @tc.desc Verify name is Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor03_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_5900
     * @tc.desc Verify subscript element values [0,1,2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 1, 2];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6000
     * @tc.desc Verify [127] subscript confirmation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [127];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(127);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6100
     * @tc.desc Verify [10,20,30] all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let arr: Uint8Array = new Uint8Array(src);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6200
     * @tc.desc Verify constructor(buf, offset, length) with 3 parameters is valid
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6300
     * @tc.desc Verify offset 0 length 2 first half
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6400
     * @tc.desc Verify offset 2 length 2 second half
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 2, 2);
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6500
     * @tc.desc Verify offset 1 length 3 middle part
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 1, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6600
     * @tc.desc Verify minimum buffer offset 0 length 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Uint8Array = new Uint8Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6700
     * @tc.desc Verify 10-byte buffer full coverage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint8Array = new Uint8Array(buf, 0, 10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6800
     * @tc.desc Verify buffer offset 50 length 50 second half view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(100);
      let arr: Uint8Array = new Uint8Array(buf, 50, 50);
      expect(arr.length).assertEqual(50);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_6900
     * @tc.desc Verify buffer offset 7 length 1 last byte view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 7, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7000
     * @tc.desc Verify buffer offset 0 length 256 full coverage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(256);
      let arr: Uint8Array = new Uint8Array(buf, 0, 256);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7100
     * @tc.desc Verify buffer offset 0 length 1024 full coverage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let arr: Uint8Array = new Uint8Array(buf, 0, 1024);
      expect(arr.length).assertEqual(1024);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7200
     * @tc.desc Verify 4-byte buffer offset 0 length 0 empty view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7300
     * @tc.desc Verify 4-byte buffer offset 4 length 0 empty view at end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 4, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7400
     * @tc.desc Verify 4-byte buffer offset 0 length 4 byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_075
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7500
     * @tc.desc Verify 4-byte buffer offset 2 length 2 byteOffset is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 2, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_076
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7600
     * @tc.desc Verify 4-byte buffer offset 0 length 4 BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_077
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7700
     * @tc.desc Verify 4-byte buffer offset 0 length 4 name is Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor03_078
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7800
     * @tc.desc Verify 4-byte buffer offset 0 length 4 buffer is same reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_079
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_7900
     * @tc.desc Verify 4-byte buffer offset 0 length 4 buffer.byteLength is 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_080
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8000
     * @tc.desc Verify 4-byte buffer offset 0 length 4 all elements initialized to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_081
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8100
     * @tc.desc Verify write 0xAB read back
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      arr[0] = 0xAB;
      expect(arr[0]).assertEqual(0xAB);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_082
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8200
     * @tc.desc Verify write 0xFF read back
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      arr[0] = 0xFF;
      expect(arr[0]).assertEqual(0xFF);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_083
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8300
     * @tc.desc Verify write 0x00 read back
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      arr[0] = 0x00;
      expect(arr[0]).assertEqual(0x00);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_084
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8400
     * @tc.desc Verify offset exceeds buffer size throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint8Array = new Uint8Array(buf, 5, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_085
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8500
     * @tc.desc Verify offset+length exceeds buffer size throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint8Array = new Uint8Array(buf, 2, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_086
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8600
     * @tc.desc Verify negative offset throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint8Array = new Uint8Array(buf, -1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_087
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8700
     * @tc.desc Verify negative length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint8Array = new Uint8Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_088
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8800
     * @tc.desc Verify offset+length arithmetic overflow throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint8Array = new Uint8Array(buf, 0, 0x7FFFFFFF);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArrayConstructor03_089
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_8900
     * @tc.desc Verify write through Uint8Array updates original buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf, 0, 4);
      arr[0] = 0xAB;
      let checkArr: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(checkArr[0]).assertEqual(0xAB);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_090
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_9000
     * @tc.desc Verify write through base array updates view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let baseArr: Uint8Array = new Uint8Array(buf, 0, 4);
      baseArr[1] = 0xCD;
      let view: Uint8Array = new Uint8Array(buf, 0, 4);
      expect(view[1]).assertEqual(0xCD);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_091
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_9100
     * @tc.desc Verify two different offset Uint8Arrays share buffer without interference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let front: Uint8Array = new Uint8Array(buf, 0, 2);
      let back: Uint8Array = new Uint8Array(buf, 2, 2);
      front[0] = 10;
      front[1] = 20;
      back[0] = 30;
      back[1] = 40;
      expect(front[0]).assertEqual(10);
      expect(front[1]).assertEqual(20);
      expect(back[0]).assertEqual(30);
      expect(back[1]).assertEqual(40);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_092
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_9200
     * @tc.desc Verify overlapping views write to same buffer position are mutually visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let whole: Uint8Array = new Uint8Array(buf, 0, 4);
      let partial: Uint8Array = new Uint8Array(buf, 1, 2);
      whole[1] = 0x77;
      expect(partial[0]).assertEqual(0x77);
      partial[1] = 0x88;
      expect(whole[2]).assertEqual(0x88);
    });

    /**
     * @tc.name testUint8ArrayConstructor03_093
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_03_9300
     * @tc.desc Verify multiple views share buffer with correct byte offsets
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor03_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let firstHalf: Uint8Array = new Uint8Array(buf, 0, 4);
      let secondHalf: Uint8Array = new Uint8Array(buf, 4, 4);
      firstHalf[3] = 0x11;
      secondHalf[0] = 0x22;
      let check: Uint8Array = new Uint8Array(buf, 0, 8);
      expect(check[3]).assertEqual(0x11);
      expect(check[4]).assertEqual(0x22);
    });
  });
}