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

export default function Uint8ArrayIncludes02Test(): void {
  describe('Uint8ArrayIncludes02Test', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0100
     * @tc.name testUint8ArrayIncludes001
     * @tc.desc Verify includes returns boolean type when fromIndex exceeds length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let result: boolean = arr.includes(10, 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0200
     * @tc.name testUint8ArrayIncludes002
     * @tc.desc Verify includes returns boolean type on single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(42);
      let result: boolean = arr.includes(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0300
     * @tc.name testUint8ArrayIncludes003
     * @tc.desc Verify includes returns boolean type on array with all identical elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(7, 7, 7, 7, 7);
      let result: boolean = arr.includes(7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0400
     * @tc.name testUint8ArrayIncludes004
     * @tc.desc Verify includes returns true when finding first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0500
     * @tc.name testUint8ArrayIncludes005
     * @tc.desc Verify includes returns true when finding middle element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(20)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0600
     * @tc.name testUint8ArrayIncludes006
     * @tc.desc Verify includes returns true when finding last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(30)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0700
     * @tc.name testUint8ArrayIncludes007
     * @tc.desc Verify includes returns true when finding uint8 minimum value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 128, 255);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0800
     * @tc.name testUint8ArrayIncludes008
     * @tc.desc Verify includes returns true when finding uint8 maximum value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 128, 255);
      expect(arr.includes(255)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_0900
     * @tc.name testUint8ArrayIncludes009
     * @tc.desc Verify includes returns true when finding middle value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(127, 200);
      expect(arr.includes(127)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1000
     * @tc.name testUint8ArrayIncludes010
     * @tc.desc Verify includes returns true when finding middle value plus one (128)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(128, 200);
      expect(arr.includes(128)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1100
     * @tc.name testUint8ArrayIncludes011
     * @tc.desc Verify includes returns true when hex literal 0xFF matches 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(255);
      expect(arr.includes(0xFF)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1200
     * @tc.name testUint8ArrayIncludes012
     * @tc.desc Verify includes returns true when hex literal 0x80 matches 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(128);
      expect(arr.includes(0x80)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1300
     * @tc.name testUint8ArrayIncludes013
     * @tc.desc Verify includes returns true when hex literal 0x00 matches 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 2);
      expect(arr.includes(0x00)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1400
     * @tc.name testUint8ArrayIncludes014
     * @tc.desc Verify includes returns true when binary literal 0b11111111 matches 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(255);
      expect(arr.includes(0b11111111)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1500
     * @tc.name testUint8ArrayIncludes015
     * @tc.desc Verify includes returns true when octal literal 0o377 matches 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(255);
      expect(arr.includes(0o377)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1600
     * @tc.name testUint8ArrayIncludes016
     * @tc.desc Verify includes returns true when binary literal 0b101010 matches 42
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(42);
      expect(arr.includes(0b101010)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1700
     * @tc.name testUint8ArrayIncludes017
     * @tc.desc Verify includes returns true when float 127.0 matches integer 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(127);
      expect(arr.includes(127.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1800
     * @tc.name testUint8ArrayIncludes018
     * @tc.desc Verify includes returns true when float 255.0 matches integer 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(255);
      expect(arr.includes(255.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_1900
     * @tc.name testUint8ArrayIncludes019
     * @tc.desc Verify includes returns true when math expression 10+20 matches array element 30
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30);
      expect(arr.includes(10 + 20)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2000
     * @tc.name testUint8ArrayIncludes020
     * @tc.desc Verify includes returns true when finding first occurrence of duplicate element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 10, 15);
      expect(arr.includes(10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2100
     * @tc.name testUint8ArrayIncludes021
     * @tc.desc Verify includes returns true when finding element in array with all identical elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(3, 3, 3, 3);
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2200
     * @tc.name testUint8ArrayIncludes022
     * @tc.desc Verify includes returns true when finding unique element in single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(99);
      expect(arr.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2300
     * @tc.name testUint8ArrayIncludes023
     * @tc.desc Verify includes returns true when finding element in long array (100 elements)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      arr[99] = 77;
      expect(arr.includes(77)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2400
     * @tc.name testUint8ArrayIncludes024
     * @tc.desc Verify includes returns false when element does not exist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2500
     * @tc.name testUint8ArrayIncludes025
     * @tc.desc Verify includes returns false for any element on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      expect(arr.includes(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2600
     * @tc.name testUint8ArrayIncludes026
     * @tc.desc Verify includes returns false when search value 256 (out of uint8 range) not in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.includes(256)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2700
     * @tc.name testUint8ArrayIncludes027
     * @tc.desc Verify includes returns false when search value -1 (below uint8 range) not in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(254, 253);
      expect(arr.includes(-1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2800
     * @tc.name testUint8ArrayIncludes028
     * @tc.desc Verify includes returns false when searching for Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 128, 255);
      expect(arr.includes(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_2900
     * @tc.name testUint8ArrayIncludes029
     * @tc.desc Verify includes returns false when searching for -Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 128, 255);
      expect(arr.includes(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3000
     * @tc.name testUint8ArrayIncludes030
     * @tc.desc Verify includes returns false when searching for hex 0x100 (256) not in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.includes(0x100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3100
     * @tc.name testUint8ArrayIncludes031
     * @tc.desc Verify includes returns false when searching for very large value 1e10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 128, 255);
      expect(arr.includes(1e10)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3200
     * @tc.name testUint8ArrayIncludes032
     * @tc.desc Verify includes returns false when searching for non-matching value in single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(42);
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3300
     * @tc.name testUint8ArrayIncludes033
     * @tc.desc Verify includes returns false when searching for different value in all identical elements array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(7, 7, 7, 7);
      expect(arr.includes(8)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3400
     * @tc.name testUint8ArrayIncludes034
     * @tc.desc Verify includes returns false when searching for 0x1FF (511) out of uint8 range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(254, 0);
      expect(arr.includes(511)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3500
     * @tc.name testUint8ArrayIncludes035
     * @tc.desc Verify includes returns false when searching for 0b100000000 (256)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2);
      expect(arr.includes(0b100000000)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3600
     * @tc.name testUint8ArrayIncludes036
     * @tc.desc Verify includes with fromIndex=0 finds element from beginning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(10, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3700
     * @tc.name testUint8ArrayIncludes037
     * @tc.desc Verify includes with fromIndex=1 skips first element and finds subsequent element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(20, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3800
     * @tc.name testUint8ArrayIncludes038
     * @tc.desc Verify includes with fromIndex=1 cannot find first element 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(10, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_3900
     * @tc.name testUint8ArrayIncludes039
     * @tc.desc Verify includes with fromIndex=2 finds last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(30, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4000
     * @tc.name testUint8ArrayIncludes040
     * @tc.desc Verify includes with fromIndex equal to length returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(10, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4100
     * @tc.name testUint8ArrayIncludes041
     * @tc.desc Verify includes with fromIndex greater than length returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(20, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4200
     * @tc.name testUint8ArrayIncludes042
     * @tc.desc Verify includes with fromIndex=0 on empty array returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      expect(arr.includes(0, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4300
     * @tc.name testUint8ArrayIncludes043
     * @tc.desc Verify includes with fromIndex after element occurrence returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15, 20);
      expect(arr.includes(10, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4400
     * @tc.name testUint8ArrayIncludes044
     * @tc.desc Verify includes with fromIndex=2 finds element at position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15, 20);
      expect(arr.includes(15, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4500
     * @tc.name testUint8ArrayIncludes045
     * @tc.desc Verify includes with fromIndex=0 finds first occurrence of duplicate element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 1, 3);
      expect(arr.includes(1, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4600
     * @tc.name testUint8ArrayIncludes046
     * @tc.desc Verify includes with fromIndex=1 skips first 1 and finds second 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 1, 3);
      expect(arr.includes(1, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4700
     * @tc.name testUint8ArrayIncludes047
     * @tc.desc Verify includes with fromIndex=3 does not cover first 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 1, 3);
      expect(arr.includes(1, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4800
     * @tc.name testUint8ArrayIncludes048
     * @tc.desc Verify includes with fromIndex=-1 finds last element from end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(30, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_4900
     * @tc.name testUint8ArrayIncludes049
     * @tc.desc Verify includes with fromIndex=-1 cannot find previous element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(20, -1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5000
     * @tc.name testUint8ArrayIncludes050
     * @tc.desc Verify includes with fromIndex=-2 finds last element from second last position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(30, -2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5100
     * @tc.name testUint8ArrayIncludes051
     * @tc.desc Verify includes with fromIndex=-2 finds second last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(20, -2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5200
     * @tc.name testUint8ArrayIncludes052
     * @tc.desc Verify includes with fromIndex=-length (equals 0) finds first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(10, -3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5300
     * @tc.name testUint8ArrayIncludes053
     * @tc.desc Verify includes with fromIndex=-(length+1) truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(10, -4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5400
     * @tc.name testUint8ArrayIncludes054
     * @tc.desc Verify includes with fromIndex=-(length+5) truncated to 0 finds element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(20, -8)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5500
     * @tc.name testUint8ArrayIncludes055
     * @tc.desc Verify includes with fromIndex=-1 finds unique element in single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(42);
      expect(arr.includes(42, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5600
     * @tc.name testUint8ArrayIncludes056
     * @tc.desc Verify includes with fromIndex=-1 on empty array returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      expect(arr.includes(0, -1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5700
     * @tc.name testUint8ArrayIncludes057
     * @tc.desc Verify includes with fromIndex=-2 finds element in single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(42);
      expect(arr.includes(42, -2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5800
     * @tc.name testUint8ArrayIncludes058
     * @tc.desc Verify includes with fromIndex=-1 finds last duplicate element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 10, 15);
      expect(arr.includes(10, -1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_5900
     * @tc.name testUint8ArrayIncludes059
     * @tc.desc Verify includes with fromIndex=-2 finds second last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 10, 15);
      expect(arr.includes(10, -2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6000
     * @tc.name testUint8ArrayIncludes060
     * @tc.desc Verify includes with fromIndex=0 finds first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15);
      expect(arr.includes(5, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6100
     * @tc.name testUint8ArrayIncludes061
     * @tc.desc Verify includes with fromIndex=-0 behaves like 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15);
      expect(arr.includes(5, -0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6200
     * @tc.name testUint8ArrayIncludes062
     * @tc.desc Verify includes with fromIndex=-0 does not skip any elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(10, -0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6300
     * @tc.name testUint8ArrayIncludes063
     * @tc.desc Verify includes with fromIndex=0 and -0 return same result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(10, 0)).assertEqual(arr.includes(10, -0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6400
     * @tc.name testUint8ArrayIncludes064
     * @tc.desc Verify includes with fromIndex=-0 and 0 return same false on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      expect(arr.includes(0, 0)).assertEqual(arr.includes(0, -0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6500
     * @tc.name testUint8ArrayIncludes065
     * @tc.desc Verify includes with fromIndex=-0 and 0 return same false for non-existent value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      expect(arr.includes(99, 0)).assertEqual(arr.includes(99, -0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6600
     * @tc.name testUint8ArrayIncludes066
     * @tc.desc Verify array elements unchanged after includes returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.includes(20);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6700
     * @tc.name testUint8ArrayIncludes067
     * @tc.desc Verify array unchanged after includes returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.includes(99);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6800
     * @tc.name testUint8ArrayIncludes068
     * @tc.desc Verify array unchanged after includes with fromIndex=2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15);
      arr.includes(15, 2);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(1)).assertEqual(10);
      expect(arr.at(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_6900
     * @tc.name testUint8ArrayIncludes069
     * @tc.desc Verify array unchanged after includes with negative fromIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15);
      arr.includes(5, -3);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(1)).assertEqual(10);
      expect(arr.at(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7000
     * @tc.name testUint8ArrayIncludes070
     * @tc.desc Verify empty array remains empty after includes call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      arr.includes(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7100
     * @tc.name testUint8ArrayIncludes071
     * @tc.desc Verify array unchanged after multiple includes calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(2, 4, 6, 8);
      arr.includes(4);
      arr.includes(6);
      arr.includes(8);
      expect(arr.at(0)).assertEqual(2);
      expect(arr.at(1)).assertEqual(4);
      expect(arr.at(2)).assertEqual(6);
      expect(arr.at(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7200
     * @tc.name testUint8ArrayIncludes072
     * @tc.desc Verify array unchanged after includes with fromIndex exceeding length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(3, 6, 9);
      arr.includes(3, 10);
      expect(arr.at(0)).assertEqual(3);
      expect(arr.at(1)).assertEqual(6);
      expect(arr.at(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7300
     * @tc.name testUint8ArrayIncludes073
     * @tc.desc Verify array unchanged after includes calls with boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 127);
      arr.includes(0);
      arr.includes(255);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(255);
      expect(arr.at(2)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7400
     * @tc.name testUint8ArrayIncludes074
     * @tc.desc Verify array constructed with index assignment unchanged after includes call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(4);
      arr[0] = 11;
      arr[1] = 22;
      arr[2] = 33;
      arr[3] = 44;
      arr.includes(22);
      expect(arr.at(0)).assertEqual(11);
      expect(arr.at(1)).assertEqual(22);
      expect(arr.at(2)).assertEqual(33);
      expect(arr.at(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7500
     * @tc.name testUint8ArrayIncludes075
     * @tc.desc Verify length unchanged after includes returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let before: int = arr.length;
      arr.includes(2);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7600
     * @tc.name testUint8ArrayIncludes076
     * @tc.desc Verify length unchanged after includes returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let before: int = arr.length;
      arr.includes(99);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7700
     * @tc.name testUint8ArrayIncludes077
     * @tc.desc Verify buffer reference unchanged after includes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let before: ArrayBuffer = arr.buffer;
      arr.includes(2);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7800
     * @tc.name testUint8ArrayIncludes078
     * @tc.desc Verify byteLength unchanged after includes on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let before: int = arr.byteLength;
      arr.includes(0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_7900
     * @tc.name testUint8ArrayIncludes079
     * @tc.desc Verify buffer unchanged after includes on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let before: ArrayBuffer = arr.buffer;
      arr.includes(0);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8000
     * @tc.name testUint8ArrayIncludes080
     * @tc.desc Verify includes on view reflects parent array changes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let view: Uint8Array = arr.subarray(0, 2);
      arr[0] = 99;
      expect(view.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8100
     * @tc.name testUint8ArrayIncludes081
     * @tc.desc Verify includes on view does not affect parent array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let view: Uint8Array = arr.subarray(0, 2);
      view.includes(10);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8200
     * @tc.name testUint8ArrayIncludes082
     * @tc.desc Verify includes on view with fromIndex works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(30, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8300
     * @tc.name testUint8ArrayIncludes083
     * @tc.desc Verify includes on view with negative fromIndex works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(30, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8400
     * @tc.name testUint8ArrayIncludes084
     * @tc.desc Verify includes on view with fromIndex=0 finds first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(20, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8500
     * @tc.name testUint8ArrayIncludes085
     * @tc.desc Verify includes on view with fromIndex exceeding view length returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(20, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8600
     * @tc.name testUint8ArrayIncludes086
     * @tc.desc Verify includes on view with negative fromIndex beyond view start returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(10, -5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8700
     * @tc.name testUint8ArrayIncludes087
     * @tc.desc Verify includes on view with negative fromIndex within view range works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(20, -2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8800
     * @tc.name testUint8ArrayIncludes088
     * @tc.desc Verify includes on view with negative fromIndex truncated to 0 works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(20, -10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_8900
     * @tc.name testUint8ArrayIncludes089
     * @tc.desc Verify includes on view with fromIndex=0 and -0 return same result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(20, 0)).assertEqual(view.includes(20, -0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_9000
     * @tc.name testUint8ArrayIncludes090
     * @tc.desc Verify includes on view with fromIndex=0 and -0 return same false for non-existent value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let view: Uint8Array = arr.subarray(1, 3);
      expect(view.includes(99, 0)).assertEqual(view.includes(99, -0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_9100
     * @tc.name testUint8ArrayIncludes091
     * @tc.desc Verify includes on view with fromIndex=0 and -0 return same false on empty view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Uint8Array = new Uint8Array(buf, 0, 0);
      expect(view.includes(0, 0)).assertEqual(view.includes(0, -0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_9200
     * @tc.name testUint8ArrayIncludes092
     * @tc.desc Verify includes returns same true result on two calls with same parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let r1: boolean = arr.includes(20);
      let r2: boolean = arr.includes(20);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_9300
     * @tc.name testUint8ArrayIncludes093
     * @tc.desc Verify includes returns same false result on two calls with same parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let r1: boolean = arr.includes(99);
      let r2: boolean = arr.includes(99);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_9400
     * @tc.name testUint8ArrayIncludes094
     * @tc.desc Verify includes with fromIndex returns same result on two calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let r1: boolean = arr.includes(30, -1);
      let r2: boolean = arr.includes(30, -1);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_9500
     * @tc.name testUint8ArrayIncludes095
     * @tc.desc Verify includes return value consistent with indexOf when element found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15);
      expect(arr.includes(10)).assertEqual(arr.indexOf(10) !== -1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_9600
     * @tc.name testUint8ArrayIncludes096
     * @tc.desc Verify includes return value consistent with indexOf when element not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15);
      expect(arr.includes(99)).assertEqual(arr.indexOf(99) !== -1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INCLUDES02_9700
     * @tc.name testUint8ArrayIncludes097
     * @tc.desc Verify includes on view returns same result on two calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIncludes097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let view: Uint8Array = arr.subarray(2, 5);
      let r1: boolean = view.includes(3);
      let r2: boolean = view.includes(3);
      expect(r1).assertEqual(r2);
    });
  });
}