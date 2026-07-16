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
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayIncludes01Test(): void {
  describe('Uint8ArrayIncludes01Test', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0100
     * @tc.name testUint8ArrayIncludes001
     * @tc.desc Verify includes with only searchElement parameter, fromIndex omitted uses default 0, element exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0200
     * @tc.name testUint8ArrayIncludes002
     * @tc.desc Verify includes with both searchElement and fromIndex parameters, explicitly specifying search start position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(20, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0300
     * @tc.name testUint8ArrayIncludes003
     * @tc.desc Verify searchElement as minimum value 0, element 0 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0400
     * @tc.name testUint8ArrayIncludes004
     * @tc.desc Verify searchElement as maximum value 255, element 255 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(255);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0500
     * @tc.name testUint8ArrayIncludes005
     * @tc.desc Verify searchElement as middle value 127, element 127 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(127);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0600
     * @tc.name testUint8ArrayIncludes006
     * @tc.desc Verify searchElement as 128, element 128 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([128, 0, 255]);
      let result: boolean = arr.includes(128);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0700
     * @tc.name testUint8ArrayIncludes007
     * @tc.desc Verify searchElement as 0 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 127, 255]);
      let result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0800
     * @tc.name testUint8ArrayIncludes008
     * @tc.desc Verify searchElement as 255 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 254]);
      let result: boolean = arr.includes(255);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_0900
     * @tc.name testUint8ArrayIncludes009
     * @tc.desc Verify searchElement as 127 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let result: boolean = arr.includes(127);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1000
     * @tc.name testUint8ArrayIncludes010
     * @tc.desc Verify searchElement as 128 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(128);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1100
     * @tc.name testUint8ArrayIncludes011
     * @tc.desc Verify searchElement as 256 (truncated to 0), element 0 exists in array, returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(256);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1200
     * @tc.name testUint8ArrayIncludes012
     * @tc.desc Verify searchElement as 256 (truncated to 0), element 0 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 127, 255]);
      let result: boolean = arr.includes(256);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1300
     * @tc.name testUint8ArrayIncludes013
     * @tc.desc Verify searchElement as -1 (wrapped to 255), element 255 exists in array, returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(-1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1400
     * @tc.name testUint8ArrayIncludes014
     * @tc.desc Verify searchElement as -1 (wrapped to 255), element 255 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 254]);
      let result: boolean = arr.includes(-1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1500
     * @tc.name testUint8ArrayIncludes015
     * @tc.desc Verify searchElement as 511 (511&0xFF=255), element 255 exists in array, returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 0, 1]);
      let result: boolean = arr.includes(511);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1600
     * @tc.name testUint8ArrayIncludes016
     * @tc.desc Verify searchElement as 511 (511&0xFF=255), element 255 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([254, 0, 1]);
      let result: boolean = arr.includes(511);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1700
     * @tc.name testUint8ArrayIncludes017
     * @tc.desc Verify searchElement as -255 (wrapped to 1), element 1 exists in array, returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 0, 2]);
      let result: boolean = arr.includes(-255);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1800
     * @tc.name testUint8ArrayIncludes018
     * @tc.desc Verify searchElement as -255 (wrapped to 1), element 1 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 2, 3]);
      let result: boolean = arr.includes(-255);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_1900
     * @tc.name testUint8ArrayIncludes019
     * @tc.desc Verify searchElement as 257 (257&0xFF=1), element 1 exists in array, returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 0, 255]);
      let result: boolean = arr.includes(257);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2000
     * @tc.name testUint8ArrayIncludes020
     * @tc.desc Verify searchElement as 257 (257&0xFF=1), element 1 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([2, 0, 255]);
      let result: boolean = arr.includes(257);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2100
     * @tc.name testUint8ArrayIncludes021
     * @tc.desc Verify searchElement as -2 (wrapped to 254), element 254 exists in array, returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([254, 0, 127]);
      let result: boolean = arr.includes(-2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2200
     * @tc.name testUint8ArrayIncludes022
     * @tc.desc Verify searchElement as -2 (wrapped to 254), element 254 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 0, 127]);
      let result: boolean = arr.includes(-2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2300
     * @tc.name testUint8ArrayIncludes023
     * @tc.desc Verify searchElement as -256 (wrapped to 0), element 0 exists in array, returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(-256);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2400
     * @tc.name testUint8ArrayIncludes024
     * @tc.desc Verify searchElement as -256 (wrapped to 0), element 0 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 127, 255]);
      let result: boolean = arr.includes(-256);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2500
     * @tc.name testUint8ArrayIncludes025
     * @tc.desc Verify searchElement as 0xFF (255), element 255 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 0, 127]);
      let result: boolean = arr.includes(0xFF);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2600
     * @tc.name testUint8ArrayIncludes026
     * @tc.desc Verify searchElement as 0xFF (255), element 255 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([254, 0, 127]);
      let result: boolean = arr.includes(0xFF);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2700
     * @tc.name testUint8ArrayIncludes027
     * @tc.desc Verify searchElement as 0x80 (128), element 128 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([128, 0, 255]);
      let result: boolean = arr.includes(0x80);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2800
     * @tc.name testUint8ArrayIncludes028
     * @tc.desc Verify searchElement as 0x80 (128), element 128 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([127, 0, 255]);
      let result: boolean = arr.includes(0x80);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_2900
     * @tc.name testUint8ArrayIncludes029
     * @tc.desc Verify searchElement as 0x100 (256, truncated to 0), element 0 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(0x100);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3000
     * @tc.name testUint8ArrayIncludes030
     * @tc.desc Verify searchElement as 0x100 (256, truncated to 0), element 0 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 127, 255]);
      let result: boolean = arr.includes(0x100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3100
     * @tc.name testUint8ArrayIncludes031
     * @tc.desc Verify searchElement as 0x0A (10), element 10 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 127]);
      let result: boolean = arr.includes(0x0A);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3200
     * @tc.name testUint8ArrayIncludes032
     * @tc.desc Verify searchElement as 0x0A (10), element 10 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([11, 20, 127]);
      let result: boolean = arr.includes(0x0A);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3300
     * @tc.name testUint8ArrayIncludes033
     * @tc.desc Verify searchElement as 0o200 (128), element 128 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([128, 0, 255]);
      let result: boolean = arr.includes(0o200);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3400
     * @tc.name testUint8ArrayIncludes034
     * @tc.desc Verify searchElement as 0o200 (128), element 128 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([129, 0, 255]);
      let result: boolean = arr.includes(0o200);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3500
     * @tc.name testUint8ArrayIncludes035
     * @tc.desc Verify searchElement as 0o377 (255), element 255 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 0, 127]);
      let result: boolean = arr.includes(0o377);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3600
     * @tc.name testUint8ArrayIncludes036
     * @tc.desc Verify searchElement as 0o377 (255), element 255 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([254, 0, 127]);
      let result: boolean = arr.includes(0o377);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3700
     * @tc.name testUint8ArrayIncludes037
     * @tc.desc Verify searchElement as 0o12 (10), element 10 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 0, 255]);
      let result: boolean = arr.includes(0o12);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3800
     * @tc.name testUint8ArrayIncludes038
     * @tc.desc Verify searchElement as 0o12 (10), element 10 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([11, 0, 255]);
      let result: boolean = arr.includes(0o12);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_3900
     * @tc.name testUint8ArrayIncludes039
     * @tc.desc Verify searchElement as 0b0 (0), element 0 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(0b0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4000
     * @tc.name testUint8ArrayIncludes040
     * @tc.desc Verify searchElement as 0b0 (0), element 0 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 127, 255]);
      let result: boolean = arr.includes(0b0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4100
     * @tc.name testUint8ArrayIncludes041
     * @tc.desc Verify searchElement as 0b11111111 (255), element 255 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 0, 127]);
      let result: boolean = arr.includes(0b11111111);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4200
     * @tc.name testUint8ArrayIncludes042
     * @tc.desc Verify searchElement as 0b11111111 (255), element 255 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([254, 0, 127]);
      let result: boolean = arr.includes(0b11111111);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4300
     * @tc.name testUint8ArrayIncludes043
     * @tc.desc Verify searchElement as 0b10000000 (128), element 128 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([128, 0, 255]);
      let result: boolean = arr.includes(0b10000000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4400
     * @tc.name testUint8ArrayIncludes044
     * @tc.desc Verify searchElement as 0b10000000 (128), element 128 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([127, 0, 255]);
      let result: boolean = arr.includes(0b10000000);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4500
     * @tc.name testUint8ArrayIncludes045
     * @tc.desc Verify searchElement as 1e0 (1), element 1 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 127, 255]);
      let result: boolean = arr.includes(1e0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4600
     * @tc.name testUint8ArrayIncludes046
     * @tc.desc Verify searchElement as 1e0 (1), element 1 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([2, 127, 255]);
      let result: boolean = arr.includes(1e0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4700
     * @tc.name testUint8ArrayIncludes047
     * @tc.desc Verify searchElement as 1e2 (100), element 100 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([100, 0, 255]);
      let result: boolean = arr.includes(1e2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4800
     * @tc.name testUint8ArrayIncludes048
     * @tc.desc Verify searchElement as 1e2 (100), element 100 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([99, 0, 255]);
      let result: boolean = arr.includes(1e2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_4900
     * @tc.name testUint8ArrayIncludes049
     * @tc.desc Verify searchElement as 2.55e2 (255), element 255 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 0, 127]);
      let result: boolean = arr.includes(2.55e2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5000
     * @tc.name testUint8ArrayIncludes050
     * @tc.desc Verify searchElement as 2.55e2 (255), element 255 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([254, 0, 127]);
      let result: boolean = arr.includes(2.55e2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5100
     * @tc.name testUint8ArrayIncludes051
     * @tc.desc Verify searchElement as 2.9 (truncated to 2), element 2 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 2, 255]);
      let result: boolean = arr.includes(2.9.toInt());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5200
     * @tc.name testUint8ArrayIncludes052
     * @tc.desc Verify searchElement as 2.9 (truncated to 2), element 2 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 3, 255]);
      let result: boolean = arr.includes(2.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5300
     * @tc.name testUint8ArrayIncludes053
     * @tc.desc Verify searchElement as 127.9 (truncated to 127), element 127 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(127.9.toInt());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5400
     * @tc.name testUint8ArrayIncludes054
     * @tc.desc Verify searchElement as 127.9 (truncated to 127), element 127 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let result: boolean = arr.includes(127.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5500
     * @tc.name testUint8ArrayIncludes055
     * @tc.desc Verify searchElement as 3.0, element 3 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 3, 255]);
      let result: boolean = arr.includes(3.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5600
     * @tc.name testUint8ArrayIncludes056
     * @tc.desc Verify searchElement as 3.0, element 3 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 4, 255]);
      let result: boolean = arr.includes(3.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5700
     * @tc.name testUint8ArrayIncludes057
     * @tc.desc Verify searchElement as 0.1 (truncated to 0), element 0 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 127, 255]);
      let result: boolean = arr.includes(0.1.toInt());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5800
     * @tc.name testUint8ArrayIncludes058
     * @tc.desc Verify searchElement as 0.1 (truncated to 0), element 0 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 127, 255]);
      let result: boolean = arr.includes(0.1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_5900
     * @tc.name testUint8ArrayIncludes059
     * @tc.desc Verify searchElement as 254.9 (truncated to 254), element 254 exists in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([254, 0, 127]);
      let result: boolean = arr.includes(254.9.toInt());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6000
     * @tc.name testUint8ArrayIncludes060
     * @tc.desc Verify searchElement as 254.9 (truncated to 254), element 254 does not exist in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 0, 127]);
      let result: boolean = arr.includes(254.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6100
     * @tc.name testUint8ArrayIncludes061
     * @tc.desc Verify single element array, element exists
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5]);
      let result: boolean = arr.includes(5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6200
     * @tc.name testUint8ArrayIncludes062
     * @tc.desc Verify single element array, element does not match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5]);
      let result: boolean = arr.includes(6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6300
     * @tc.name testUint8ArrayIncludes063
     * @tc.desc Verify empty array search 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6400
     * @tc.name testUint8ArrayIncludes064
     * @tc.desc Verify empty array search 255 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: boolean = arr.includes(255);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6500
     * @tc.name testUint8ArrayIncludes065
     * @tc.desc Verify empty array search overflow value 256 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: boolean = arr.includes(256);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6600
     * @tc.name testUint8ArrayIncludes066
     * @tc.desc Verify fromIndex omitted defaults to 0, target element does not exist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6700
     * @tc.name testUint8ArrayIncludes067
     * @tc.desc Verify fromIndex as 0 searches entire array, target element exists
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6800
     * @tc.name testUint8ArrayIncludes068
     * @tc.desc Verify fromIndex as 0 searches entire array, target element does not exist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(99, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_6900
     * @tc.name testUint8ArrayIncludes069
     * @tc.desc Verify fromIndex as -0 (equivalent to 0), target element exists
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, -0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7000
     * @tc.name testUint8ArrayIncludes070
     * @tc.desc Verify fromIndex as -0 searches entire array, target element does not exist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(99, -0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7100
     * @tc.name testUint8ArrayIncludes071
     * @tc.desc Verify fromIndex as 1 skips first element, first element 10 is skipped returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7200
     * @tc.name testUint8ArrayIncludes072
     * @tc.desc Verify fromIndex as 1, target element 30 can be found at index 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(30, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7300
     * @tc.name testUint8ArrayIncludes073
     * @tc.desc Verify fromIndex equals array length 3, all elements skipped returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7400
     * @tc.name testUint8ArrayIncludes074
     * @tc.desc Verify fromIndex greater than array length, all elements skipped returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(20, 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7500
     * @tc.name testUint8ArrayIncludes075
     * @tc.desc Verify fromIndex as very large positive value, all elements skipped returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, 9999);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7600
     * @tc.name testUint8ArrayIncludes076
     * @tc.desc Verify fromIndex as -1 searches from last position, last element 30 matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(30, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7700
     * @tc.name testUint8ArrayIncludes077
     * @tc.desc Verify fromIndex as -1 searches from last position, previous element 20 is skipped
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(20, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7800
     * @tc.name testUint8ArrayIncludes078
     * @tc.desc Verify fromIndex as -2 searches from second last position, last element 30 can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(30, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_7900
     * @tc.name testUint8ArrayIncludes079
     * @tc.desc Verify fromIndex as -2, second last element 20 can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(20, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8000
     * @tc.name testUint8ArrayIncludes080
     * @tc.desc Verify fromIndex as -3 (truncated to 0), first element 10 can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8100
     * @tc.name testUint8ArrayIncludes081
     * @tc.desc Verify fromIndex less than -length (-4 truncated to 0), first element 10 can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, -4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8200
     * @tc.name testUint8ArrayIncludes082
     * @tc.desc Verify fromIndex as very large negative -999 (truncated to 0), target element can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, -999);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8300
     * @tc.name testUint8ArrayIncludes083
     * @tc.desc Verify fromIndex as -2 skips index 0's 10, returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, -2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8400
     * @tc.name testUint8ArrayIncludes084
     * @tc.desc Verify fromIndex as 1.0 (truncated to 1), target element 20 can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(20, 1.0.toInt());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8500
     * @tc.name testUint8ArrayIncludes085
     * @tc.desc Verify fromIndex as 1.9 (truncated to 1), target element 20 can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(20, 1.9.toInt());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8600
     * @tc.name testUint8ArrayIncludes086
     * @tc.desc Verify fromIndex as 2.5 (truncated to 2), target element 20 is skipped returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(20, 2.5.toInt());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8700
     * @tc.name testUint8ArrayIncludes087
     * @tc.desc Verify fromIndex as 0.9 (truncated to 0), target element can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, 0.9.toInt());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8800
     * @tc.name testUint8ArrayIncludes088
     * @tc.desc Verify fromIndex as NaN (truncated to 0), target element can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(10, Number.NaN.toInt());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_8900
     * @tc.name testUint8ArrayIncludes089
     * @tc.desc Verify fromIndex as NaN searches for non-existent element returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: boolean = arr.includes(99, Number.NaN.toInt());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9000
     * @tc.name testUint8ArrayIncludes090
     * @tc.desc Verify single element array, fromIndex as -1 searches last position, element can be found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5]);
      let result: boolean = arr.includes(5, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9100
     * @tc.name testUint8ArrayIncludes091
     * @tc.desc Verify single element array, fromIndex as 1 out of bounds returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5]);
      let result: boolean = arr.includes(5, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9200
     * @tc.name testUint8ArrayIncludes092
     * @tc.desc Verify single element array, fromIndex as -2 searches entire array, element found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5]);
      let result: boolean = arr.includes(5, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9300
     * @tc.name testUint8ArrayIncludes093
     * @tc.desc Verify empty array with fromIndex as 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: boolean = arr.includes(0, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9400
     * @tc.name testUint8ArrayIncludes094
     * @tc.desc Verify empty array with fromIndex as -1 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: boolean = arr.includes(0, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9500
     * @tc.name testUint8ArrayIncludes095
     * @tc.desc Verify empty array with fromIndex as -0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: boolean = arr.includes(0, -0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9600
     * @tc.name testUint8ArrayIncludes096
     * @tc.desc Verify fromIndex=1 and searchElement as 256 (truncated to 0), array index 1 has 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 0, 255]);
      let result: boolean = arr.includes(256, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9700
     * @tc.name testUint8ArrayIncludes097
     * @tc.desc Verify fromIndex=2 and searchElement as -1 (wrapped to 255), array index 2 has 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 0, 255]);
      let result: boolean = arr.includes(-1, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES01_9800
     * @tc.name testUint8ArrayIncludes098
     * @tc.desc Verify fromIndex=1 and searchElement as -1 (wrapped to 255), index 0's 255 is skipped
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 0, 127]);
      let result: boolean = arr.includes(-1, 1);
      expect(result).assertFalse();
    });
  });
}