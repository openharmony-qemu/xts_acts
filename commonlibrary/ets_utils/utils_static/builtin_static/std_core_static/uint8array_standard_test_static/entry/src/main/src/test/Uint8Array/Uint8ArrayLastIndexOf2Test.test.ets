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

export default function Uint8ArrayLastIndexOf2Test(): void {
  describe('Uint8ArrayLastIndexOf2Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0100
     * @tc.name testUint8ArrayLastIndexOf001
     * @tc.desc Verify return type is number when element found in non-empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const r: number = arr.lastIndexOf(10);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0200
     * @tc.name testUint8ArrayLastIndexOf002
     * @tc.desc Verify return type is number when element not found in non-empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const r: number = arr.lastIndexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0300
     * @tc.name testUint8ArrayLastIndexOf003
     * @tc.desc Verify return type is number when searching in empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const r: number = arr.lastIndexOf(0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0400
     * @tc.name testUint8ArrayLastIndexOf004
     * @tc.desc Verify return type is number when fromIndex=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: number = arr.lastIndexOf(1, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0500
     * @tc.name testUint8ArrayLastIndexOf005
     * @tc.desc Verify return type is number when fromIndex=-1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: number = arr.lastIndexOf(3, -1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0600
     * @tc.name testUint8ArrayLastIndexOf006
     * @tc.desc Verify return type is number when fromIndex is omitted
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: number = arr.lastIndexOf(2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0700
     * @tc.name testUint8ArrayLastIndexOf007
     * @tc.desc Verify return type is number when searchElement=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: number = arr.lastIndexOf(0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0800
     * @tc.name testUint8ArrayLastIndexOf008
     * @tc.desc Verify return type is number when searchElement=255 boundary value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 0]);
      const r: number = arr.lastIndexOf(255);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_0900
     * @tc.name testUint8ArrayLastIndexOf009
     * @tc.desc Verify return type is number when searchElement=256, no overflow truncation, returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: number = arr.lastIndexOf(256);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1000
     * @tc.name testUint8ArrayLastIndexOf010
     * @tc.desc Verify return type is number when searchElement=-1, no wraparound, returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255]);
      const r: number = arr.lastIndexOf(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1100
     * @tc.name testUint8ArrayLastIndexOf011
     * @tc.desc Verify return type is number when duplicate elements exist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([3, 1, 3]);
      const r: number = arr.lastIndexOf(3);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1200
     * @tc.name testUint8ArrayLastIndexOf012
     * @tc.desc Verify return type is number for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([42]);
      const r: number = arr.lastIndexOf(42);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1300
     * @tc.name testUint8ArrayLastIndexOf013
     * @tc.desc Verify return type is number when fromIndex>=length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2]);
      const r: number = arr.lastIndexOf(1, 10);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1400
     * @tc.name testUint8ArrayLastIndexOf014
     * @tc.desc Verify return type is number when fromIndex<-length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: number = arr.lastIndexOf(1, -10);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1500
     * @tc.name testUint8ArrayLastIndexOf015
     * @tc.desc Verify return type is number when searchElement=NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: number = arr.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1600
     * @tc.name testUint8ArrayLastIndexOf016
     * @tc.desc Verify element at index 0 returns 0 when found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10]);
      const r: int = arr.lastIndexOf(5);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1700
     * @tc.name testUint8ArrayLastIndexOf017
     * @tc.desc Verify element at last index returns length-1 when found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 9]);
      const r: int = arr.lastIndexOf(9);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1800
     * @tc.name testUint8ArrayLastIndexOf018
     * @tc.desc Verify element at middle index returns corresponding index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const r: int = arr.lastIndexOf(20);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_1900
     * @tc.name testUint8ArrayLastIndexOf019
     * @tc.desc Verify single element array match returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([99]);
      const r: int = arr.lastIndexOf(99);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2000
     * @tc.name testUint8ArrayLastIndexOf020
     * @tc.desc Verify non-existent element returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: int = arr.lastIndexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2100
     * @tc.name testUint8ArrayLastIndexOf021
     * @tc.desc Verify single element array no match returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5]);
      const r: int = arr.lastIndexOf(10);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2200
     * @tc.name testUint8ArrayLastIndexOf022
     * @tc.desc Verify two occurrences returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 1, 5]);
      const r: int = arr.lastIndexOf(5);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2300
     * @tc.name testUint8ArrayLastIndexOf023
     * @tc.desc Verify three occurrences returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([3, 3, 3]);
      const r: int = arr.lastIndexOf(3);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2400
     * @tc.name testUint8ArrayLastIndexOf024
     * @tc.desc Verify all elements same returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([7, 7, 7, 7]);
      const r: int = arr.lastIndexOf(7);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2500
     * @tc.name testUint8ArrayLastIndexOf025
     * @tc.desc Verify first and last same returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 1]);
      const r: int = arr.lastIndexOf(1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2600
     * @tc.name testUint8ArrayLastIndexOf026
     * @tc.desc Verify fromIndex=0 and element at index 0 returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 1]);
      const r: int = arr.lastIndexOf(5, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2700
     * @tc.name testUint8ArrayLastIndexOf027
     * @tc.desc Verify fromIndex=0 and element not at index 0 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 1]);
      const r: int = arr.lastIndexOf(1, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2800
     * @tc.name testUint8ArrayLastIndexOf028
     * @tc.desc Verify fromIndex=0 in empty array returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const r: int = arr.lastIndexOf(0, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_2900
     * @tc.name testUint8ArrayLastIndexOf029
     * @tc.desc Verify fromIndex=-1 and last element match returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 8]);
      const r: int = arr.lastIndexOf(8, -1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3000
     * @tc.name testUint8ArrayLastIndexOf030
     * @tc.desc Verify fromIndex=-1 and last element no match returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 8]);
      const r: int = arr.lastIndexOf(1, -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3100
     * @tc.name testUint8ArrayLastIndexOf031
     * @tc.desc Verify fromIndex=-2 and second last element match returns len-2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 8, 3]);
      const r: int = arr.lastIndexOf(1, -2);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3200
     * @tc.name testUint8ArrayLastIndexOf032
     * @tc.desc Verify fromIndex=-2 and only last element match returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 8]);
      const r: int = arr.lastIndexOf(8, -2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3300
     * @tc.name testUint8ArrayLastIndexOf033
     * @tc.desc Verify fromIndex=-length full search returns match index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: int = arr.lastIndexOf(3, -3);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3400
     * @tc.name testUint8ArrayLastIndexOf034
     * @tc.desc Verify fromIndex=-(length+1) treated as index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: int = arr.lastIndexOf(1, -4);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3500
     * @tc.name testUint8ArrayLastIndexOf035
     * @tc.desc Verify fromIndex=-1 with length=1 returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5]);
      const r: int = arr.lastIndexOf(5, -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3600
     * @tc.name testUint8ArrayLastIndexOf036
     * @tc.desc Verify fromIndex=length-1 match returns corresponding index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: int = arr.lastIndexOf(3, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3700
     * @tc.name testUint8ArrayLastIndexOf037
     * @tc.desc Verify fromIndex=length full search returns first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: int = arr.lastIndexOf(1, 3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3800
     * @tc.name testUint8ArrayLastIndexOf038
     * @tc.desc Verify fromIndex=1 limits search range to first half
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 1]);
      const r: int = arr.lastIndexOf(1, 1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_3900
     * @tc.name testUint8ArrayLastIndexOf039
     * @tc.desc Verify searchElement=0 finds 0 value returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 0]);
      const r: int = arr.lastIndexOf(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4000
     * @tc.name testUint8ArrayLastIndexOf040
     * @tc.desc Verify searchElement=255 finds 255 value returns index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 0]);
      const r: int = arr.lastIndexOf(255);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4100
     * @tc.name testUint8ArrayLastIndexOf041
     * @tc.desc Verify searchElement=256 does not truncate to uint8, 256 !== 0, returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: int = arr.lastIndexOf(256);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4200
     * @tc.name testUint8ArrayLastIndexOf042
     * @tc.desc Verify searchElement=-1 does not wrap to 255, -1 !== 255, returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 0]);
      const r: int = arr.lastIndexOf(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4300
     * @tc.name testUint8ArrayLastIndexOf043
     * @tc.desc Verify searchElement=0xFF finds 255 value returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 255]);
      const r: int = arr.lastIndexOf(0xFF);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4400
     * @tc.name testUint8ArrayLastIndexOf044
     * @tc.desc Verify searchElement=0x100 does not truncate to 0, 0x100 !== 0, returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: int = arr.lastIndexOf(0x100);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4500
     * @tc.name testUint8ArrayLastIndexOf045
     * @tc.desc Verify searchElement=127 finds mid value returns index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([127, 0]);
      const r: int = arr.lastIndexOf(127);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4600
     * @tc.name testUint8ArrayLastIndexOf046
     * @tc.desc Verify searchElement=128 finds mid+1 value returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 128]);
      const r: int = arr.lastIndexOf(128);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4700
     * @tc.name testUint8ArrayLastIndexOf047
     * @tc.desc Verify searchElement=0x80 finds 128 value returns index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([128, 0]);
      const r: int = arr.lastIndexOf(0x80);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4800
     * @tc.name testUint8ArrayLastIndexOf048
     * @tc.desc Verify searchElement=NaN not found returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2]);
      const r: int = arr.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_4900
     * @tc.name testUint8ArrayLastIndexOf049
     * @tc.desc Verify searchElement=-0 equivalent to 0 returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: int = arr.lastIndexOf(-0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5000
     * @tc.name testUint8ArrayLastIndexOf050
     * @tc.desc Verify searchElement=Infinity not equal to any element, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: int = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5100
     * @tc.name testUint8ArrayLastIndexOf051
     * @tc.desc Verify searchElement=-Infinity not equal to any element, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: int = arr.lastIndexOf(Number.NEGATIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5200
     * @tc.name testUint8ArrayLastIndexOf052
     * @tc.desc Verify searchElement=3.0 float integer value matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([3, 6]);
      const r: int = arr.lastIndexOf(3.0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5300
     * @tc.name testUint8ArrayLastIndexOf053
     * @tc.desc Verify searchElement=255.7 float not equal to 255, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 0]);
      const r: int = arr.lastIndexOf(255.7);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5400
     * @tc.name testUint8ArrayLastIndexOf054
     * @tc.desc Verify searchElement=1e10 large number truncated, should return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: int = arr.lastIndexOf(1e10);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5500
     * @tc.name testUint8ArrayLastIndexOf055
     * @tc.desc Verify fromIndex=-2 with duplicate elements limits to front segment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 1, 5]);
      const r: int = arr.lastIndexOf(5, -2);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5600
     * @tc.name testUint8ArrayLastIndexOf056
     * @tc.desc Verify all-zero array find 0 returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 0, 0]);
      const r: int = arr.lastIndexOf(0);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5700
     * @tc.name testUint8ArrayLastIndexOf057
     * @tc.desc Verify all-255 array find 255 returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 255, 255]);
      const r: int = arr.lastIndexOf(255);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5800
     * @tc.name testUint8ArrayLastIndexOf058
     * @tc.desc Verify ascending array find mid value returns corresponding index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const r: int = arr.lastIndexOf(30);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_5900
     * @tc.name testUint8ArrayLastIndexOf059
     * @tc.desc Verify fromIndex=0 duplicate elements only checks index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 5]);
      const r: int = arr.lastIndexOf(5, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6000
     * @tc.name testUint8ArrayLastIndexOf060
     * @tc.desc Verify fromIndex=-2 with two-element array search last element returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1]);
      const r: int = arr.lastIndexOf(1, -2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6100
     * @tc.name testUint8ArrayLastIndexOf061
     * @tc.desc Verify fromIndex=0 single element array match returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([42]);
      const r: int = arr.lastIndexOf(42, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6200
     * @tc.name testUint8ArrayLastIndexOf062
     * @tc.desc Verify array length unchanged after finding element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const lenBefore: int = arr.length;
      arr.lastIndexOf(2);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6300
     * @tc.name testUint8ArrayLastIndexOf063
     * @tc.desc Verify array length unchanged after not finding element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const lenBefore: int = arr.length;
      arr.lastIndexOf(99);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6400
     * @tc.name testUint8ArrayLastIndexOf064
     * @tc.desc Verify array length unchanged after call with fromIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const lenBefore: int = arr.length;
      arr.lastIndexOf(1, 0);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6500
     * @tc.name testUint8ArrayLastIndexOf065
     * @tc.desc Verify empty array length remains 0 after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      arr.lastIndexOf(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6600
     * @tc.name testUint8ArrayLastIndexOf066
     * @tc.desc Verify byteLength unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5);
      const blBefore: int = arr.byteLength;
      arr.lastIndexOf(0);
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6700
     * @tc.name testUint8ArrayLastIndexOf067
     * @tc.desc Verify underlying buffer byteLength unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5);
      const bufBlBefore: int = arr.buffer.byteLength;
      arr.lastIndexOf(0);
      expect(arr.buffer.byteLength).assertEqual(bufBlBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6800
     * @tc.name testUint8ArrayLastIndexOf068
     * @tc.desc Verify element[0] unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.lastIndexOf(20);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_6900
     * @tc.name testUint8ArrayLastIndexOf069
     * @tc.desc Verify element[1] unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.lastIndexOf(20);
      expect(arr.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7000
     * @tc.name testUint8ArrayLastIndexOf070
     * @tc.desc Verify element[last] unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.lastIndexOf(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7100
     * @tc.name testUint8ArrayLastIndexOf071
     * @tc.desc Verify elements unchanged after not finding element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.lastIndexOf(99);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7200
     * @tc.name testUint8ArrayLastIndexOf072
     * @tc.desc Verify elements unchanged for ArrayBuffer view array after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const arr: Uint8Array = new Uint8Array(buf);
      arr.set([10], 0);
      arr.set([20], 1);
      arr.lastIndexOf(20);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7300
     * @tc.name testUint8ArrayLastIndexOf073
     * @tc.desc Verify byteOffset unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const arr: Uint8Array = new Uint8Array(buf, 1, 3);
      const offBefore: int = arr.byteOffset;
      arr.lastIndexOf(0);
      expect(arr.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7400
     * @tc.name testUint8ArrayLastIndexOf074
     * @tc.desc Verify BYTES_PER_ELEMENT unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3);
      arr.lastIndexOf(0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7500
     * @tc.name testUint8ArrayLastIndexOf075
     * @tc.desc Verify two identical calls return same value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r1: int = arr.lastIndexOf(2);
      const r2: int = arr.lastIndexOf(2);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7600
     * @tc.name testUint8ArrayLastIndexOf076
     * @tc.desc Verify two identical not-found calls return same value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r1: int = arr.lastIndexOf(99);
      const r2: int = arr.lastIndexOf(99);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7700
     * @tc.name testUint8ArrayLastIndexOf077
     * @tc.desc Verify right-to-left search order returns correct index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([3, 2, 1, 2, 3]);
      const r: int = arr.lastIndexOf(2);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7800
     * @tc.name testUint8ArrayLastIndexOf078
     * @tc.desc Verify array with boundary value 255 returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 128, 255]);
      const r: int = arr.lastIndexOf(255);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_7900
     * @tc.name testUint8ArrayLastIndexOf079
     * @tc.desc Verify array with boundary value 0 returns last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 128, 0]);
      const r: int = arr.lastIndexOf(0);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_8000
     * @tc.name testUint8ArrayLastIndexOf080
     * @tc.desc Verify fromIndex=0 duplicate elements only checks index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([7, 7]);
      const r: int = arr.lastIndexOf(7, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_8100
     * @tc.name testUint8ArrayLastIndexOf081
     * @tc.desc Verify fromIndex=-length+1 skips first element search
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const r: int = arr.lastIndexOf(1, -2);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_8200
     * @tc.name testUint8ArrayLastIndexOf082
     * @tc.desc Verify length=2 fromIndex=-3 treated as index 0 search
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2]);
      const r: int = arr.lastIndexOf(1, -3);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_8300
     * @tc.name testUint8ArrayLastIndexOf083
     * @tc.desc Verify byteOffset unchanged after call with buffer offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8Array = new Uint8Array(buf, 3, 5);
      const offBefore: int = arr.byteOffset;
      arr.lastIndexOf(0);
      expect(arr.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_LAST_INDEX_OF2_8400
     * @tc.name testUint8ArrayLastIndexOf084
     * @tc.desc Verify buffer reference unchanged after finding element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayLastIndexOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(4);
      const bufBefore: ArrayBuffer = arr.buffer;
      arr.lastIndexOf(0);
      expect(arr.buffer.byteLength).assertEqual(bufBefore.byteLength);
    });
  });
}