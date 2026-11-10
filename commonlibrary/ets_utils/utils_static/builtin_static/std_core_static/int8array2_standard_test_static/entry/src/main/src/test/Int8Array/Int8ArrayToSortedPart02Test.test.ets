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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

export default function int8ArrayToSortedPart02Test(): void {
  describe('Int8ArrayToSortedPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0100
     * @tc.name int8ArrayToSortedPart02Test001
     * @tc.desc Verify empty array toSorted result name is 'Int8Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.toSorted();
      let resultElement1: string = result.name;
      let expectedElement1: string = 'Int8Array';
      expect(resultElement1).assertEqual(expectedElement1);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0200
     * @tc.name int8ArrayToSortedPart02Test002
     * @tc.desc Verify toSorted [3, 1, 2] result name is 'Int8Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: string = result.name;
      let expectedElement1: string = 'Int8Array';
      expect(resultElement1).assertEqual(expectedElement1);
      let r1: string = result.join(',');
      let e1: string = '1,2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0300
     * @tc.name int8ArrayToSortedPart02Test003
     * @tc.desc Verify toSorted [3, 1, 2] result $_get(2) is 3 (ascending)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(2);
      let expectedElement1: int = 3;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0400
     * @tc.name int8ArrayToSortedPart02Test004
     * @tc.desc Verify single element [-128] toSorted returns $_get(0) === -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: number = INT8_MIN;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0500
     * @tc.name int8ArrayToSortedPart02Test005
     * @tc.desc Verify single element [127] toSorted returns $_get(0) === 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: number = INT8_MAX;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0600
     * @tc.name int8ArrayToSortedPart02Test006
     * @tc.desc Verify single element [0] toSorted returns $_get(0) === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = 0;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0700
     * @tc.name int8ArrayToSortedPart02Test007
     * @tc.desc Verify two elements reverse [3, 1] toSorted returns [1, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 3;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0800
     * @tc.name int8ArrayToSortedPart02Test008
     * @tc.desc Verify two negative elements [-1, -3] toSorted returns [-3, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -3]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = -3;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = -1;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_0900
     * @tc.name int8ArrayToSortedPart02Test009
     * @tc.desc Verify three elements mixed [3, -1, 2] toSorted returns [-1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, -1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = -1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 2;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = result.$_get(2);
      let expectedElement3: int = 3;
      expect(resultElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1000
     * @tc.name int8ArrayToSortedPart02Test010
     * @tc.desc Verify boundary [-128, 127, 0] toSorted returns [-128, 0, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX, 0]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: number = INT8_MIN;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 0;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = result.$_get(2);
      let expectedElement3: number = INT8_MAX;
      expect(resultElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1100
     * @tc.name int8ArrayToSortedPart02Test011
     * @tc.desc Verify all same [7, 7, 7] toSorted returns [7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = 7;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 7;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = result.$_get(2);
      let expectedElement3: int = 7;
      expect(resultElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1200
     * @tc.name int8ArrayToSortedPart02Test012
     * @tc.desc Verify already ascending [1, 2, 3] toSorted returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 2;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = result.$_get(2);
      let expectedElement3: int = 3;
      expect(resultElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1300
     * @tc.name int8ArrayToSortedPart02Test013
     * @tc.desc Verify descending [3, 2, 1] toSorted returns [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 2, 1]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 2;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = result.$_get(2);
      let expectedElement3: int = 3;
      expect(resultElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1400
     * @tc.name int8ArrayToSortedPart02Test014
     * @tc.desc Verify duplicates [2, 1, 2, 1] toSorted returns [1, 1, 2, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([2, 1, 2, 1]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 1;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = result.$_get(2);
      let expectedElement3: int = 2;
      expect(resultElement3).assertEqual(expectedElement3);
      let resultElement4: number = result.$_get(3);
      let expectedElement4: int = 2;
      expect(resultElement4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1500
     * @tc.name int8ArrayToSortedPart02Test015
     * @tc.desc Verify truncated value 200 becomes -56, sorted before 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 200);
      arr.$_set(1, 10);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = -56;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 10;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1600
     * @tc.name int8ArrayToSortedPart02Test016
     * @tc.desc Verify hex 0x80 (= -128) and 0xFF (= -1) toSorted returns [-128, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0x80, 0xff]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: number = INT8_MIN;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = -1;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1700
     * @tc.name int8ArrayToSortedPart02Test017
     * @tc.desc Verify large 100 elements descending toSorted first=0 last=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, 99 - i);
      }
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = 0;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(99);
      let expectedElement2: int = 99;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1800
     * @tc.name int8ArrayToSortedPart02Test018
     * @tc.desc Verify single element toSorted returns length === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.length;
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_1900
     * @tc.name int8ArrayToSortedPart02Test019
     * @tc.desc Verify multi element toSorted returns length === original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 8, 1]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.length;
      let expectedElement1: int = 4;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2000
     * @tc.name int8ArrayToSortedPart02Test020
     * @tc.desc Verify empty array toSorted returns byteLength === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.byteLength;
      let expectedElement1: int = 0;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2100
     * @tc.name int8ArrayToSortedPart02Test021
     * @tc.desc Verify toSorted result length equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9, 4, 7, 2, 6]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.length;
      let expectedElement1: int = arr.length;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2200
     * @tc.name int8ArrayToSortedPart02Test022
     * @tc.desc Verify toSorted result byteLength equals original byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9, 4, 7, 2, 6]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.byteLength;
      let expectedElement1: int = arr.byteLength;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2300
     * @tc.name int8ArrayToSortedPart02Test023
     * @tc.desc Verify original array descending unchanged after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 2, 1]);
      arr.toSorted();
      let resultElement1: number = arr.$_get(0);
      let expectedElement1: int = 3;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = arr.$_get(1);
      let expectedElement2: int = 2;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = arr.$_get(2);
      let expectedElement3: int = 1;
      expect(resultElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2400
     * @tc.name int8ArrayToSortedPart02Test024
     * @tc.desc Verify original array unchanged after toSorted on a constructor-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      arr.toSorted();
      let resultElement1: number = arr.$_get(0);
      let expectedElement1: int = 3;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = arr.$_get(1);
      let expectedElement2: int = 1;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = arr.$_get(2);
      let expectedElement3: int = 2;
      expect(resultElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2500
     * @tc.name int8ArrayToSortedPart02Test025
     * @tc.desc Verify original single element unchanged after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      arr.toSorted();
      let resultElement1: number = arr.$_get(0);
      let expectedElement1: int = 5;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2600
     * @tc.name int8ArrayToSortedPart02Test026
     * @tc.desc Verify original boundary unchanged after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      arr.toSorted();
      let resultElement1: number = arr.$_get(0);
      let expectedElement1: number = INT8_MIN;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = arr.$_get(1);
      let expectedElement2: number = INT8_MAX;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2700
     * @tc.name int8ArrayToSortedPart02Test027
     * @tc.desc Verify original array length unchanged after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9, 4, 7, 2, 6]);
      let before: number = arr.length;
      arr.toSorted();
      let resultElement1: int = arr.length;
      let expectedElement1 = before;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2800
     * @tc.name int8ArrayToSortedPart02Test028
     * @tc.desc Verify original view byteOffset unchanged after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      arr.$_set(0, 5);
      arr.$_set(1, 3);
      arr.$_set(2, 9);
      arr.$_set(3, 1);
      let before: number = arr.byteOffset;
      arr.toSorted();
      let resultElement1: int = arr.byteOffset;
      let expectedElement1 = before;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_2900
     * @tc.name int8ArrayToSortedPart02Test029
     * @tc.desc Verify toSorted returns new object reference not equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3000
     * @tc.name int8ArrayToSortedPart02Test030
     * @tc.desc Verify toSorted returns independent buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3100
     * @tc.name int8ArrayToSortedPart02Test031
     * @tc.desc Verify toSorted().toSorted() chain returns valid Int8Array with sorted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 2, 8]);
      let result: Int8Array = arr.toSorted().toSorted();
      let resultElement1: int = result.BYTES_PER_ELEMENT;
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(0);
      let expectedElement2: int = 2;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3200
     * @tc.name int8ArrayToSortedPart02Test032
     * @tc.desc Verify toSorted().subarray() chain returns valid Int8Array with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 2, 8, 1]);
      let result: Int8Array = arr.toSorted().subarray(1, 3);
      let resultElement1: int = result.BYTES_PER_ELEMENT;
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: int = result.length;
      let expectedElement2: int = 2;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3300
     * @tc.name int8ArrayToSortedPart02Test033
     * @tc.desc Verify toSorted result byteOffset === 0 for new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.byteOffset;
      let expectedElement1: int = 0;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3400
     * @tc.name int8ArrayToSortedPart02Test034
     * @tc.desc Verify subarray view toSorted result byteOffset === 0 not inheriting original offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.byteOffset;
      let expectedElement1: int = 0;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3500
     * @tc.name int8ArrayToSortedPart02Test035
     * @tc.desc Verify toSorted modifying result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      result.$_set(0, INT8_MAX);
      let resultElement1: number = arr.$_get(0);
      let expectedElement1: int = 3;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3600
     * @tc.name int8ArrayToSortedPart02Test036
     * @tc.desc Verify modifying original does not affect toSorted result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      arr.$_set(0, INT8_MAX);
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3700
     * @tc.name int8ArrayToSortedPart02Test037
     * @tc.desc Verify toSorted result buffer byteLength equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 8, 1]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.buffer.byteLength;
      let expectedElement1: int = result.byteLength;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3800
     * @tc.name int8ArrayToSortedPart02Test038
     * @tc.desc Verify toSorted result buffer is fresh byteLength three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.buffer.byteLength;
      let expectedElement1: int = 3;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_3900
     * @tc.name int8ArrayToSortedPart02Test039
     * @tc.desc Verify subarray view toSorted result buffer independent of base array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([9, 5, 3, 1, 7]);
      let view: Int8Array = base.subarray(1, 3);
      let result: Int8Array = view.toSorted();
      expect(result.buffer).not().assertEqual(base.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4000
     * @tc.name int8ArrayToSortedPart02Test040
     * @tc.desc Verify view source toSorted result buffer.byteLength equals element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int8Array = new Int8Array(buf, 4, 3);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.buffer.byteLength;
      let expectedElement1: int = 3;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4100
     * @tc.name int8ArrayToSortedPart02Test041
     * @tc.desc Verify single [-128] toSorted returns byteLength=1 and valid typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.byteLength;
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: int = result.BYTES_PER_ELEMENT;
      let expectedElement2: int = 1;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4200
     * @tc.name int8ArrayToSortedPart02Test042
     * @tc.desc Verify all [-128] toSorted returns length === original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.length;
      let expectedElement1: int = 3;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4300
     * @tc.name int8ArrayToSortedPart02Test043
     * @tc.desc Verify [0, -1, 1] toSorted returns [-1, 0, 1] where 0 after negative before positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -1, 1]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: int = -1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 0;
      expect(resultElement2).assertEqual(expectedElement2);
      let resultElement3: number = result.$_get(2);
      let expectedElement3: int = 1;
      expect(resultElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4400
     * @tc.name int8ArrayToSortedPart02Test044
     * @tc.desc Verify large array toSorted result length equals large array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, 99 - i);
      }
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.length;
      let expectedElement1: int = 100;
      expect(resultElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4500
     * @tc.name int8ArrayToSortedPart02Test045
     * @tc.desc Verify 0x80 (= -128) and 0x7F (= 127) toSorted returns [-128, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0x80, 0x7f]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: number = result.$_get(0);
      let expectedElement1: number = INT8_MIN;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: number = INT8_MAX;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4600
     * @tc.name int8ArrayToSortedPart02Test046
     * @tc.desc Verify empty array toSorted returns length=0 and valid typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.BYTES_PER_ELEMENT;
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: int = result.length;
      let expectedElement2: int = 0;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4700
     * @tc.name int8ArrayToSortedPart02Test047
     * @tc.desc Verify toSorted().reverse() chain returns valid Int8Array with first as max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 3, 2]);
      let result: Int8Array = arr.toSorted().reverse();
      let resultElement1: int = result.BYTES_PER_ELEMENT;
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(0);
      let expectedElement2: int = 3;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4800
     * @tc.name int8ArrayToSortedPart02Test048
     * @tc.desc Verify toSorted().fill(0) chain returns valid Int8Array with elements all zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted().fill(0);
      let resultElement1: int = result.BYTES_PER_ELEMENT;
      let expectedElement1: int = 1;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: number = result.$_get(1);
      let expectedElement2: int = 0;
      expect(resultElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_4900
     * @tc.name int8ArrayToSortedPart02Test049
     * @tc.desc Verify out-of-bounds $_get(length) returns undefined for toSorted result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      expect(result.at(3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART02_5000
     * @tc.name int8ArrayToSortedPart02Test050
     * @tc.desc Verify Int8Array.from constructed array toSorted returns length=3 and valid typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.from([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultElement1: int = result.length;
      let expectedElement1: int = 3;
      expect(resultElement1).assertEqual(expectedElement1);
      let resultElement2: int = result.BYTES_PER_ELEMENT;
      let expectedElement2: int = 1;
      expect(resultElement2).assertEqual(expectedElement2);
    });
  });
}
