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

export default function Uint8ArrayCopyWithin01Test(): void {
  describe('Uint8ArrayCopyWithin01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0100
     * @tc.name testUint8ArrayCopyWithin01_001
     * @tc.desc Verify copyWithin with 2 parameters, end defaults to array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(50);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0200
     * @tc.name testUint8ArrayCopyWithin01_002
     * @tc.desc Verify copyWithin with 3 parameters, explicit end limit
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 2, 4);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0300
     * @tc.name testUint8ArrayCopyWithin01_003
     * @tc.desc Verify copyWithin with target greater than start
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(3, 0);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0400
     * @tc.name testUint8ArrayCopyWithin01_004
     * @tc.desc Verify copyWithin with 3 parameters equivalent to 2 parameters with explicit end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(3, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0500
     * @tc.name testUint8ArrayCopyWithin01_005
     * @tc.desc Verify copyWithin with target equals start equals 0, copy all to same position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0600
     * @tc.name testUint8ArrayCopyWithin01_006
     * @tc.desc Verify copyWithin with end equals start, empty range no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 3, 3);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0700
     * @tc.name testUint8ArrayCopyWithin01_007
     * @tc.desc Verify copyWithin with target equals array length, no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(5, 0);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0800
     * @tc.name testUint8ArrayCopyWithin01_008
     * @tc.desc Verify copyWithin with single element copy (end=start+1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 4, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_0900
     * @tc.name testUint8ArrayCopyWithin01_009
     * @tc.desc Verify copyWithin with start equals array length, empty range no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1000
     * @tc.name testUint8ArrayCopyWithin01_010
     * @tc.desc Verify copyWithin with target greater than start and no overlap
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(2, 0, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1100
     * @tc.name testUint8ArrayCopyWithin01_011
     * @tc.desc Verify copyWithin with target=0 minimum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1200
     * @tc.name testUint8ArrayCopyWithin01_012
     * @tc.desc Verify copyWithin with target=1 positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(1, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1300
     * @tc.name testUint8ArrayCopyWithin01_013
     * @tc.desc Verify copyWithin with target=2 middle value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(2, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1400
     * @tc.name testUint8ArrayCopyWithin01_014
     * @tc.desc Verify copyWithin with target=4 maximum value (equals length-1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(4, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1500
     * @tc.name testUint8ArrayCopyWithin01_015
     * @tc.desc Verify copyWithin with target=5 equals length, no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(5, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1600
     * @tc.name testUint8ArrayCopyWithin01_016
     * @tc.desc Verify copyWithin with target=6 greater than length, no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(6, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1700
     * @tc.name testUint8ArrayCopyWithin01_017
     * @tc.desc Verify copyWithin with target=100 far greater than length, no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(100, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1800
     * @tc.name testUint8ArrayCopyWithin01_018
     * @tc.desc Verify copyWithin with target=-1 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(-1, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_1900
     * @tc.name testUint8ArrayCopyWithin01_019
     * @tc.desc Verify copyWithin with target=-2 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(-2, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2000
     * @tc.name testUint8ArrayCopyWithin01_020
     * @tc.desc Verify copyWithin with target=-3 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(-3, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2100
     * @tc.name testUint8ArrayCopyWithin01_021
     * @tc.desc Verify copyWithin with target=-4 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(-4, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2200
     * @tc.name testUint8ArrayCopyWithin01_022
     * @tc.desc Verify copyWithin with target=-5 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(-5, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2300
     * @tc.name testUint8ArrayCopyWithin01_023
     * @tc.desc Verify copyWithin with target=-6 less than -length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(-6, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2400
     * @tc.name testUint8ArrayCopyWithin01_024
     * @tc.desc Verify copyWithin with target=-100 extreme negative
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(-100, 0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2500
     * @tc.name testUint8ArrayCopyWithin01_025
     * @tc.desc Verify copyWithin with length=1 array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10]);
      const ret = arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(1);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2600
     * @tc.name testUint8ArrayCopyWithin01_026
     * @tc.desc Verify copyWithin with length=2 array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20]);
      const ret = arr.copyWithin(1, 0);
      expect(arr.length).assertEqual(2);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2700
     * @tc.name testUint8ArrayCopyWithin01_027
     * @tc.desc Verify copyWithin with Uint8 boundary value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2, 3, 4]);
      const ret = arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2800
     * @tc.name testUint8ArrayCopyWithin01_028
     * @tc.desc Verify copyWithin with Uint8 boundary value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 254, 253, 252, 251]);
      const ret = arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(253);
      expect(arr[1]).assertEqual(252);
      expect(arr[2]).assertEqual(251);
      expect(arr[3]).assertEqual(252);
      expect(arr[4]).assertEqual(251);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_2900
     * @tc.name testUint8ArrayCopyWithin01_029
     * @tc.desc Verify copyWithin with mixed Uint8 boundary values 0 and 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 255, 128, 64, 32]);
      const ret = arr.copyWithin(1, 3);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(64);
      expect(arr[2]).assertEqual(32);
      expect(arr[3]).assertEqual(64);
      expect(arr[4]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3000
     * @tc.name testUint8ArrayCopyWithin01_030
     * @tc.desc Verify copyWithin with overlapping region target in [start, end)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(1, 0, 4);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(30);
      expect(arr[4]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3100
     * @tc.name testUint8ArrayCopyWithin01_031
     * @tc.desc Verify copyWithin with empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const ret = arr.copyWithin(0, 0, 0);
      expect(arr.length).assertEqual(0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3200
     * @tc.name testUint8ArrayCopyWithin01_032
     * @tc.desc Verify copyWithin with start=0 copies entire array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3300
     * @tc.name testUint8ArrayCopyWithin01_033
     * @tc.desc Verify copyWithin with start=1 positive index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 1, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(30);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(50);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3400
     * @tc.name testUint8ArrayCopyWithin01_034
     * @tc.desc Verify copyWithin with start=2 middle index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 2, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(50);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3500
     * @tc.name testUint8ArrayCopyWithin01_035
     * @tc.desc Verify copyWithin with start=3 later index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 3, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(40);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3600
     * @tc.name testUint8ArrayCopyWithin01_036
     * @tc.desc Verify copyWithin with start=5 equals length, no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 5, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3700
     * @tc.name testUint8ArrayCopyWithin01_037
     * @tc.desc Verify copyWithin with start=6 greater than length, no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 6, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3800
     * @tc.name testUint8ArrayCopyWithin01_038
     * @tc.desc Verify copyWithin with start=100 far greater than length, no operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 100, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_3900
     * @tc.name testUint8ArrayCopyWithin01_039
     * @tc.desc Verify copyWithin with start=-1 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, -1, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4000
     * @tc.name testUint8ArrayCopyWithin01_040
     * @tc.desc Verify copyWithin with start=-2 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, -2, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(40);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4100
     * @tc.name testUint8ArrayCopyWithin01_041
     * @tc.desc Verify copyWithin with start=-3 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, -3, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(50);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4200
     * @tc.name testUint8ArrayCopyWithin01_042
     * @tc.desc Verify copyWithin with start=-4 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, -4, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(30);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(50);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4300
     * @tc.name testUint8ArrayCopyWithin01_043
     * @tc.desc Verify copyWithin with start=-5 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, -5, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4400
     * @tc.name testUint8ArrayCopyWithin01_044
     * @tc.desc Verify copyWithin with start=-6 less than -length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, -6, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4500
     * @tc.name testUint8ArrayCopyWithin01_045
     * @tc.desc Verify copyWithin with start=-100 extreme negative
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, -100, 5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4600
     * @tc.name testUint8ArrayCopyWithin01_046
     * @tc.desc Verify copyWithin with end=0 minimum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 0);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4700
     * @tc.name testUint8ArrayCopyWithin01_047
     * @tc.desc Verify copyWithin with end=1 positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 1);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4800
     * @tc.name testUint8ArrayCopyWithin01_048
     * @tc.desc Verify copyWithin with end=3 value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 3);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_4900
     * @tc.name testUint8ArrayCopyWithin01_049
     * @tc.desc Verify copyWithin with end=6 greater than length, clamped to length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 6);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5000
     * @tc.name testUint8ArrayCopyWithin01_050
     * @tc.desc Verify copyWithin with end=100 far greater than length, clamped to length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 100);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5100
     * @tc.name testUint8ArrayCopyWithin01_051
     * @tc.desc Verify copyWithin with end=-1 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, -1);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5200
     * @tc.name testUint8ArrayCopyWithin01_052
     * @tc.desc Verify copyWithin with end=-5 negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, -5);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5300
     * @tc.name testUint8ArrayCopyWithin01_053
     * @tc.desc Verify copyWithin with end=-6 negative index less than -length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, -6);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5400
     * @tc.name testUint8ArrayCopyWithin01_054
     * @tc.desc Verify copyWithin with end=-100 extreme negative
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, -100);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5500
     * @tc.name testUint8ArrayCopyWithin01_055
     * @tc.desc Verify copyWithin with length=3 array and different element values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([100, 200, 255]);
      const ret = arr.copyWithin(0, 1);
      expect(arr.length).assertEqual(3);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(200);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5600
     * @tc.name testUint8ArrayCopyWithin01_056
     * @tc.desc Verify copyWithin with end=2 hex literal 0x02
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 0x02);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5700
     * @tc.name testUint8ArrayCopyWithin01_057
     * @tc.desc Verify copyWithin with end=5 hex literal 0x05
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 0x05);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5800
     * @tc.name testUint8ArrayCopyWithin01_058
     * @tc.desc Verify copyWithin with Uint8Array containing only 0 values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 0, 0, 0, 0]);
      const ret = arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_5900
     * @tc.name testUint8ArrayCopyWithin01_059
     * @tc.desc Verify copyWithin with Uint8Array containing only 255 values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 255, 255, 255, 255]);
      const ret = arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
      expect(arr[3]).assertEqual(255);
      expect(arr[4]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_01_6000
     * @tc.name testUint8ArrayCopyWithin01_060
     * @tc.desc Verify copyWithin with end=2 octal literal 0o2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const ret = arr.copyWithin(0, 0, 0o2);
      expect(arr.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

  });
}
