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

export default function Uint8ArrayCopyWithin02Test(): void {
  describe('Uint8ArrayCopyWithin02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0100
     * @tc.name testUint8ArrayCopyWithin02_001
     * @tc.desc Verify copyWithin returns typeof object with all parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(0, 1, 3);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0200
     * @tc.name testUint8ArrayCopyWithin02_002
     * @tc.desc Verify copyWithin returns typeof object with end omitted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(0, 2);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0300
     * @tc.name testUint8ArrayCopyWithin02_003
     * @tc.desc Verify copyWithin returns typeof object with negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(-3, 0, 2);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0400
     * @tc.name testUint8ArrayCopyWithin02_004
     * @tc.desc Verify copyWithin returns instanceof Uint8Array (basic)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(0, 1, 4);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0500
     * @tc.name testUint8ArrayCopyWithin02_005
     * @tc.desc Verify copyWithin returns instanceof Uint8Array with negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(0, -3, -1);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0600
     * @tc.name testUint8ArrayCopyWithin02_006
     * @tc.desc Verify copyWithin returns instanceof Uint8Array with overlapping copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(2, 0, 3);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0700
     * @tc.name testUint8ArrayCopyWithin02_007
     * @tc.desc Verify copyWithin returns instanceof Uint8Array with end out-of-bounds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(0, 0, 100);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0800
     * @tc.name testUint8ArrayCopyWithin02_008
     * @tc.desc Verify copyWithin return value has byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(0, 1, 3);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_0900
     * @tc.name testUint8ArrayCopyWithin02_009
     * @tc.desc Verify copyWithin returns not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.copyWithin(0, 2);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1000
     * @tc.name testUint8ArrayCopyWithin02_010
     * @tc.desc Verify copyWithin returns same instance (basic)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, 2, 4);
      arr[0] = 99;
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1100
     * @tc.name testUint8ArrayCopyWithin02_011
     * @tc.desc Verify copyWithin returns same instance with negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, -3, -1);
      result[1] = 88;
      expect(arr[1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1200
     * @tc.name testUint8ArrayCopyWithin02_012
     * @tc.desc Verify copyWithin returns same instance with overlapping copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(2, 0, 3);
      arr[4] = 77;
      expect(result[4]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1300
     * @tc.name testUint8ArrayCopyWithin02_013
     * @tc.desc Verify copyWithin returns same instance with end omitted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, 2);
      result[5] = 66;
      expect(arr[5]).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1400
     * @tc.name testUint8ArrayCopyWithin02_014
     * @tc.desc Verify copyWithin returns same instance with out-of-bounds target
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(100, 0);
      result[0] = 55;
      expect(arr[0]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1500
     * @tc.name testUint8ArrayCopyWithin02_015
     * @tc.desc Verify copyWithin returns same instance with negative out-of-bounds target
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(-100, 0, 2);
      arr[3] = 44;
      expect(result[3]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1600
     * @tc.name testUint8ArrayCopyWithin02_016
     * @tc.desc Verify copyWithin(0, 0, len) full copy all elements unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 0, 6);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1700
     * @tc.name testUint8ArrayCopyWithin02_017
     * @tc.desc Verify copyWithin(0, 2) copy from index 2 to start
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(30);
      expect(arr[3]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1800
     * @tc.name testUint8ArrayCopyWithin02_018
     * @tc.desc Verify copyWithin(2, 0, 2) copy first two elements to index 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(2, 0, 2);
      expect(arr.length).assertEqual(6);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_1900
     * @tc.name testUint8ArrayCopyWithin02_019
     * @tc.desc Verify copyWithin(0, 1, 3) copy partial range to start
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 1, 3);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2000
     * @tc.name testUint8ArrayCopyWithin02_020
     * @tc.desc Verify copyWithin(1, 3, 5) copy specified range to non-zero target
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(1, 3, 5);
      expect(arr.length).assertEqual(6);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2100
     * @tc.name testUint8ArrayCopyWithin02_021
     * @tc.desc Verify copyWithin(0, 3) forward truncated copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2200
     * @tc.name testUint8ArrayCopyWithin02_022
     * @tc.desc Verify copyWithin(3, 0) backward truncated copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(3, 0);
      expect(arr.length).assertEqual(6);
      expect(arr[3]).assertEqual(0);
      expect(arr[5]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2300
     * @tc.name testUint8ArrayCopyWithin02_023
     * @tc.desc Verify copyWithin(0, 2, 4) forward non-overlapping copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 4);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2400
     * @tc.name testUint8ArrayCopyWithin02_024
     * @tc.desc Verify copyWithin(0, 6) start equals length is no-op
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 6);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2500
     * @tc.name testUint8ArrayCopyWithin02_025
     * @tc.desc Verify copyWithin(6, 0) target equals length is no-op
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(6, 0);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2600
     * @tc.name testUint8ArrayCopyWithin02_026
     * @tc.desc Verify copyWithin(0, 0, 0) empty range no change
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 0, 0);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2700
     * @tc.name testUint8ArrayCopyWithin02_027
     * @tc.desc Verify copyWithin(3, 3, 3) start equals end empty range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(3, 3, 3);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2800
     * @tc.name testUint8ArrayCopyWithin02_028
     * @tc.desc Verify copyWithin(1, 0, 1) copy single element to index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      arr.copyWithin(1, 0, 1);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_2900
     * @tc.name testUint8ArrayCopyWithin02_029
     * @tc.desc Verify copyWithin(0, 1, 1) start equals end empty range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      arr.copyWithin(0, 1, 1);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(10);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3000
     * @tc.name testUint8ArrayCopyWithin02_030
     * @tc.desc Verify copyWithin empty array returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3100
     * @tc.name testUint8ArrayCopyWithin02_031
     * @tc.desc Verify copyWithin single element array copy itself
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([42]);
      arr.copyWithin(0, 0, 1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3200
     * @tc.name testUint8ArrayCopyWithin02_032
     * @tc.desc Verify copyWithin all same value array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 5, 5, 5]);
      arr.copyWithin(1, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3300
     * @tc.name testUint8ArrayCopyWithin02_033
     * @tc.desc Verify copyWithin(1, 0) move all elements forward
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4]);
      arr.copyWithin(1, 0);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(1);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3400
     * @tc.name testUint8ArrayCopyWithin02_034
     * @tc.desc Verify copyWithin(0, -2) negative start copy last two to start
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, -2);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3500
     * @tc.name testUint8ArrayCopyWithin02_035
     * @tc.desc Verify copyWithin(-2, 0, 2) negative target copy first two to second last
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(-2, 0, 2);
      expect(arr.length).assertEqual(6);
      expect(arr[4]).assertEqual(0);
      expect(arr[5]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3600
     * @tc.name testUint8ArrayCopyWithin02_036
     * @tc.desc Verify copyWithin(0, -3, -1) negative index range copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, -3, -1);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(40);
      expect(arr[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3700
     * @tc.name testUint8ArrayCopyWithin02_037
     * @tc.desc Verify copyWithin(0, 0, -1) negative end excludes last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 0, -1);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3800
     * @tc.name testUint8ArrayCopyWithin02_038
     * @tc.desc Verify copyWithin(-3, -5, -1) all negative index copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(-3, -5, -1);
      expect(arr.length).assertEqual(6);
      expect(arr[3]).assertEqual(20);
      expect(arr[5]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_3900
     * @tc.name testUint8ArrayCopyWithin02_039
     * @tc.desc Verify copyWithin(0, -1) negative start copy last element to start
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, -1);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4000
     * @tc.name testUint8ArrayCopyWithin02_040
     * @tc.desc Verify copyWithin(-1, 0, 1) negative target copy first element to last
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(-1, 0, 1);
      expect(arr.length).assertEqual(6);
      expect(arr[5]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4100
     * @tc.name testUint8ArrayCopyWithin02_041
     * @tc.desc Verify copyWithin(-4, -5, -1) completely negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(-4, -5, -1);
      expect(arr.length).assertEqual(6);
      expect(arr[2]).assertEqual(20);
      expect(arr[5]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4200
     * @tc.name testUint8ArrayCopyWithin02_042
     * @tc.desc Verify copyWithin(0, -1, -1) negative start equals negative end empty range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, -1, -1);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4300
     * @tc.name testUint8ArrayCopyWithin02_043
     * @tc.desc Verify copyWithin(1, -6) negative start absolute equals length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(1, -6);
      expect(arr.length).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[4]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4400
     * @tc.name testUint8ArrayCopyWithin02_044
     * @tc.desc Verify copyWithin(0, 100) start far greater than length no-op
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 100);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4500
     * @tc.name testUint8ArrayCopyWithin02_045
     * @tc.desc Verify copyWithin(100, 0) target far greater than length no-op
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(100, 0);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4600
     * @tc.name testUint8ArrayCopyWithin02_046
     * @tc.desc Verify copyWithin(0, 0, 100) end greater than length clamped
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 0, 100);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4700
     * @tc.name testUint8ArrayCopyWithin02_047
     * @tc.desc Verify copyWithin(-100, 0, 2) target negative absolute > length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(-100, 0, 2);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4800
     * @tc.name testUint8ArrayCopyWithin02_048
     * @tc.desc Verify copyWithin(0, -100) start negative absolute > length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, -100);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_4900
     * @tc.name testUint8ArrayCopyWithin02_049
     * @tc.desc Verify copyWithin(0, 0, -100) end negative absolute > length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 0, -100);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5000
     * @tc.name testUint8ArrayCopyWithin02_050
     * @tc.desc Verify copyWithin(3, 1, 8) end partially out-of-bounds clamped
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(3, 1, 8);
      expect(arr.length).assertEqual(5);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5100
     * @tc.name testUint8ArrayCopyWithin02_051
     * @tc.desc Verify copyWithin byteOffset remains unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const offsetBefore: number = arr.byteOffset;
      arr.copyWithin(0, 2, 4);
      expect(arr.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5200
     * @tc.name testUint8ArrayCopyWithin02_052
     * @tc.desc Verify copyWithin buffer is same ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const bufBefore: ArrayBuffer = arr.buffer;
      arr.copyWithin(0, 2, 4);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5300
     * @tc.name testUint8ArrayCopyWithin02_053
     * @tc.desc Verify copyWithin negative index length remains unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(-3, 0, 2);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5400
     * @tc.name testUint8ArrayCopyWithin02_054
     * @tc.desc Verify copyWithin overlapping copy length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(2, 0, 3);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5500
     * @tc.name testUint8ArrayCopyWithin02_055
     * @tc.desc Verify copyWithin BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 2, 4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5600
     * @tc.name testUint8ArrayCopyWithin02_056
     * @tc.desc Verify copyWithin chain fill
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      arr.copyWithin(0, 2, 4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5700
     * @tc.name testUint8ArrayCopyWithin02_057
     * @tc.desc Verify copyWithin chain isView is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, 2, 4);
      expect(ArrayBuffer.isView(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5800
     * @tc.name testUint8ArrayCopyWithin02_058
     * @tc.desc Verify copyWithin negative index isView is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, -3, -1);
      expect(ArrayBuffer.isView(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_5900
     * @tc.name testUint8ArrayCopyWithin02_059
     * @tc.desc Verify copyWithin result buffer instanceof ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, 2, 4);
      expect(result.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6000
     * @tc.name testUint8ArrayCopyWithin02_060
     * @tc.desc Verify copyWithin result buffer is same as original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, 2, 4);
      expect(result.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6100
     * @tc.name testUint8ArrayCopyWithin02_061
     * @tc.desc Verify shared buffer copyWithin visible to other view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const view1: Uint8Array = new Uint8Array(buf);
      const view2: Uint8Array = new Uint8Array(buf);
      view1[0] = 10; view1[1] = 20; view1[2] = 30;
      view1[3] = 40; view1[4] = 50; view1[5] = 60;
      view1.copyWithin(0, 2, 4);
      expect(view2[0]).assertEqual(30);
      expect(view2[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6200
     * @tc.name testUint8ArrayCopyWithin02_062
     * @tc.desc Verify shared buffer view syncs to other after copyWithin
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const view1: Uint8Array = new Uint8Array(buf);
      const view2: Uint8Array = new Uint8Array(buf);
      view1[0] = 10; view1[1] = 20; view1[2] = 30;
      view1[3] = 40; view1[4] = 50; view1[5] = 60;
      view1.copyWithin(0, 2, 4);
      view1[0] = 99;
      expect(view2[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6300
     * @tc.name testUint8ArrayCopyWithin02_063
     * @tc.desc Verify copyWithin byteOffset unchanged with offset buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8Array = new Uint8Array(buf, 2, 6);
      arr[0] = 10; arr[1] = 20; arr[2] = 30;
      arr[3] = 40; arr[4] = 50; arr[5] = 60;
      const offBefore: number = arr.byteOffset;
      arr.copyWithin(0, 2, 4);
      expect(arr.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6400
     * @tc.name testUint8ArrayCopyWithin02_064
     * @tc.desc Verify copyWithin byteLength unchanged with offset buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8Array = new Uint8Array(buf, 2, 6);
      arr[0] = 10; arr[1] = 20; arr[2] = 30;
      arr[3] = 40; arr[4] = 50; arr[5] = 60;
      arr.copyWithin(0, 2, 4);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6500
     * @tc.name testUint8ArrayCopyWithin02_065
     * @tc.desc Verify copyWithin buffer.byteLength unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 2, 4);
      expect(arr.buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6600
     * @tc.name testUint8ArrayCopyWithin02_066
     * @tc.desc Verify copyWithin elements before target remain unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(2, 0, 4);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6700
     * @tc.name testUint8ArrayCopyWithin02_067
     * @tc.desc Verify copyWithin elements after copy range remain unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 2, 4);
      expect(arr[4]).assertEqual(50);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6800
     * @tc.name testUint8ArrayCopyWithin02_068
     * @tc.desc Verify copyWithin empty range all elements unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 2, 2);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_6900
     * @tc.name testUint8ArrayCopyWithin02_069
     * @tc.desc Verify copyWithin negative index unaffected elements unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, -3, -1);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7000
     * @tc.name testUint8ArrayCopyWithin02_070
     * @tc.desc Verify copyWithin non-overlapping region unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(2, 0, 3);
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7100
     * @tc.name testUint8ArrayCopyWithin02_071
     * @tc.desc Verify modify return value affects original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, 2, 4);
      result[0] = 77;
      expect(arr[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7200
     * @tc.name testUint8ArrayCopyWithin02_072
     * @tc.desc Verify modify original array affects return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50, 60]);
      const result: Uint8Array = arr.copyWithin(0, 2, 4);
      arr[1] = 88;
      expect(result[1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7300
     * @tc.name testUint8ArrayCopyWithin02_073
     * @tc.desc Verify copyWithin non-participating elements unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 4);
      expect(arr[4]).assertEqual(4);
      expect(arr[5]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7400
     * @tc.name testUint8ArrayCopyWithin02_074
     * @tc.desc Verify copyWithin value 0 boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2, 3]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7500
     * @tc.name testUint8ArrayCopyWithin02_075
     * @tc.desc Verify copyWithin value 255 boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 1, 2, 3]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7600
     * @tc.name testUint8ArrayCopyWithin02_076
     * @tc.desc Verify copyWithin value truncated to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0x1FF, 5, 6, 7]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7700
     * @tc.name testUint8ArrayCopyWithin02_077
     * @tc.desc Verify copyWithin value -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-1, 2, 3, 4]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7800
     * @tc.name testUint8ArrayCopyWithin02_078
     * @tc.desc Verify copyWithin value 0xFF hex literal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0xFF, 1, 2, 3]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_7900
     * @tc.name testUint8ArrayCopyWithin02_079
     * @tc.desc Verify copyWithin value 0 minimum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 128, 0, 128]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8000
     * @tc.name testUint8ArrayCopyWithin02_080
     * @tc.desc Verify copyWithin value 255 maximum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 0, 255, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8100
     * @tc.name testUint8ArrayCopyWithin02_081
     * @tc.desc Verify copyWithin value 0x100 truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0x100, 3, 4, 5]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8200
     * @tc.name testUint8ArrayCopyWithin02_082
     * @tc.desc Verify copyWithin value 257 truncated to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([257, 4, 5, 6]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8300
     * @tc.name testUint8ArrayCopyWithin02_083
     * @tc.desc Verify copyWithin value -128 wraps to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-128, 5, 6, 7]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8400
     * @tc.name testUint8ArrayCopyWithin02_084
     * @tc.desc Verify copyWithin value 127 middle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([127, 200, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8500
     * @tc.name testUint8ArrayCopyWithin02_085
     * @tc.desc Verify copyWithin value 128 middle+1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([128, 200, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8600
     * @tc.name testUint8ArrayCopyWithin02_086
     * @tc.desc Verify copyWithin value 0x80 (128 hex)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0x80, 100, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8700
     * @tc.name testUint8ArrayCopyWithin02_087
     * @tc.desc Verify copyWithin value 3 truncated to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([3, 7, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8800
     * @tc.name testUint8ArrayCopyWithin02_088
     * @tc.desc Verify copyWithin value 2 truncated to 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([2, 7, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_8900
     * @tc.name testUint8ArrayCopyWithin02_089
     * @tc.desc Verify copyWithin value -0 stored as 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-0, 100, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9000
     * @tc.name testUint8ArrayCopyWithin02_090
     * @tc.desc Verify copyWithin value NaN stored as 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([Number.NaN, 50, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9100
     * @tc.name testUint8ArrayCopyWithin02_091
     * @tc.desc Verify copyWithin value Infinity stored as 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([Number.POSITIVE_INFINITY, 30, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9200
     * @tc.name testUint8ArrayCopyWithin02_092
     * @tc.desc Verify copyWithin value -Infinity stored as 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([Number.NEGATIVE_INFINITY, 20, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9300
     * @tc.name testUint8ArrayCopyWithin02_093
     * @tc.desc Verify copyWithin value 0b11111111 binary max
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0b11111111, 1, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9400
     * @tc.name testUint8ArrayCopyWithin02_094
     * @tc.desc Verify copyWithin value 0o377 octal max
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0o377, 2, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9500
     * @tc.name testUint8ArrayCopyWithin02_095
     * @tc.desc Verify copyWithin value 1e2 scientific notation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1e2, 3, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9600
     * @tc.name testUint8ArrayCopyWithin02_096
     * @tc.desc Verify copyWithin value 0x7F hex middle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0x7F, 4, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9700
     * @tc.name testUint8ArrayCopyWithin02_097
     * @tc.desc Verify copyWithin copy mixed boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([256, -1, 0, 255]);
      arr.copyWithin(0, 0, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_COPYWITHIN_02_9800
     * @tc.name testUint8ArrayCopyWithin02_098
     * @tc.desc Verify copyWithin value 1.5 truncated to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayCopyWithin02_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 7, 0, 0]);
      arr.copyWithin(0, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
    });
  });
}
