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

export default function int8ArrayToReversedPart02Test(): void {
  describe('Int8ArrayToReversedPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0100
     * @tc.name int8ArrayToReversedPart02Test001
     * @tc.desc Verify toReversed constructor name equals Int8Array on 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let r1: string = result.name;
      let e1: string = 'Int8Array';
      expect(r1).assertEqual(e1);
      let r2: string = result.join(',');
      let e2: string = '3,2,1';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0200
     * @tc.name int8ArrayToReversedPart02Test002
     * @tc.desc Verify toReversed constructor name equals Int8Array on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: Int8Array = arr.toReversed();
      let r1: string = result.name;
      let e1: string = 'Int8Array';
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0300
     * @tc.name int8ArrayToReversedPart02Test003
     * @tc.desc Verify toReversed constructor name equals Int8Array on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.toReversed();
      let r1: string = result.name;
      let e1: string = 'Int8Array';
      expect(r1).assertEqual(e1);
      let r2: int = result.length;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0400
     * @tc.name int8ArrayToReversedPart02Test004
     * @tc.desc Verify toReversed() returns new Int8Array with elements in reverse order without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(0);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0500
     * @tc.name int8ArrayToReversedPart02Test005
     * @tc.desc Verify toReversed() result swaps first and last element of [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(1);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0600
     * @tc.name int8ArrayToReversedPart02Test006
     * @tc.desc Verify toReversed() on of()-created [10, 20, 30] produces [30, 20, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.toReversed();
      let r0: number = result.$_get(0);
      let e0: int = 30;
      expect(r0).assertEqual(e0);
      let r1: number = result.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 10;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0700
     * @tc.name int8ArrayToReversedPart02Test007
     * @tc.desc Verify toReversed int8 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, 0, -128);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0800
     * @tc.name int8ArrayToReversedPart02Test008
     * @tc.desc Verify toReversed int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, 0, -128);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(2);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_0900
     * @tc.name int8ArrayToReversedPart02Test009
     * @tc.desc Verify toReversed() sets the last element at index 0 in the reversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, 0, 1);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1000
     * @tc.name int8ArrayToReversedPart02Test010
     * @tc.desc Verify toReversed() single element stays at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(99);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1100
     * @tc.name int8ArrayToReversedPart02Test011
     * @tc.desc Verify toReversed $_get(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.toReversed();
      expect(result.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1200
     * @tc.name int8ArrayToReversedPart02Test012
     * @tc.desc Verify toReversed() on [5,6,7] produces [7,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 6, 7);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 5;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1300
     * @tc.name int8ArrayToReversedPart02Test013
     * @tc.desc Verify toReversed() on [1, 2, 3] produces [3, 2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 1;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1400
     * @tc.name int8ArrayToReversedPart02Test014
     * @tc.desc Verify toReversed 200 -56 -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 200);
      arr.$_set(1, 100);
      let result: Int8Array = arr.toReversed();
      let r1: number = result.$_get(1);
      let e1: int = -56;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1500
     * @tc.name int8ArrayToReversedPart02Test015
     * @tc.desc Verify toReversed toString() returns reversed string '3,2,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let r1: string = result.toString();
      let e1: string = '3,2,1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1600
     * @tc.name int8ArrayToReversedPart02Test016
     * @tc.desc Verify toReversed() join('-') returns '3-2-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let r1: string = result.join('-');
      let e1: string = '3-2-1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1700
     * @tc.name int8ArrayToReversedPart02Test017
     * @tc.desc Verify toReversed indexOf( ) length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      let result: Int8Array = arr.toReversed();
      let r1: int = result.indexOf(7);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1800
     * @tc.name int8ArrayToReversedPart02Test018
     * @tc.desc Verify toReversed length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let r1: int = result.length;
      let e1: int = arr.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_1900
     * @tc.name int8ArrayToReversedPart02Test019
     * @tc.desc Verify toReversed length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: Int8Array = arr.toReversed();
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2000
     * @tc.name int8ArrayToReversedPart02Test020
     * @tc.desc Verify toReversed byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let r1: int = result.byteLength;
      let e1: int = arr.byteLength;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2100
     * @tc.name int8ArrayToReversedPart02Test021
     * @tc.desc Verify toReversed byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2200
     * @tc.name int8ArrayToReversedPart02Test022
     * @tc.desc Verify toReversed byteLength length int8 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: Int8Array = arr.toReversed();
      let r1: int = result.byteLength;
      let e1: int = result.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2300
     * @tc.name int8ArrayToReversedPart02Test023
     * @tc.desc Verify toReversed byteLength 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: Int8Array = arr.toReversed();
      let r1: int = result.byteLength;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2400
     * @tc.name int8ArrayToReversedPart02Test024
     * @tc.desc Verify toReversed() keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let before: int = arr.length;
      arr.toReversed();
      let r1: int = arr.length;
      let e1 = before;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2500
     * @tc.name int8ArrayToReversedPart02Test025
     * @tc.desc Verify toReversed leaves first element of original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      arr.toReversed();
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2600
     * @tc.name int8ArrayToReversedPart02Test026
     * @tc.desc Verify toReversed leaves last element of original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      arr.toReversed();
      let r1: number = arr.$_get(2);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2700
     * @tc.name int8ArrayToReversedPart02Test027
     * @tc.desc Verify toReversed leaves middle element of original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      arr.toReversed();
      let r1: number = arr.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2800
     * @tc.name int8ArrayToReversedPart02Test028
     * @tc.desc Verify toReversed() keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      let before: int = arr.byteOffset;
      arr.toReversed();
      let r1: int = arr.byteOffset;
      let e1 = before;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_2900
     * @tc.name int8ArrayToReversedPart02Test029
     * @tc.desc Verify toReversed() leaves at(-1) value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      arr.toReversed();
      let r1 = arr.at(-1);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3000
     * @tc.name int8ArrayToReversedPart02Test030
     * @tc.desc Verify toReversed on empty array keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      arr.toReversed();
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3100
     * @tc.name int8ArrayToReversedPart02Test031
     * @tc.desc Verify toReversed on single-element array keeps value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(99);
      arr.toReversed();
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3200
     * @tc.name int8ArrayToReversedPart02Test032
     * @tc.desc Verify double toReversed leaves original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      arr.toReversed();
      arr.toReversed();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3300
     * @tc.name int8ArrayToReversedPart02Test033
     * @tc.desc Verify toReversed leaves original toString() unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let before: string = arr.toString();
      arr.toReversed();
      let r1: string = arr.toString();
      let e1 = before;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3400
     * @tc.name int8ArrayToReversedPart02Test034
     * @tc.desc Verify toReversed leaves original buffer data unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      arr.toReversed();
      let bufView: Int8Array = new Int8Array(arr.buffer);
      let r1: number = bufView.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3500
     * @tc.name int8ArrayToReversedPart02Test035
     * @tc.desc Verify toReversed() returns new array not same this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3600
     * @tc.name int8ArrayToReversedPart02Test036
     * @tc.desc Verify toReversed() twice restores original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed().toReversed();
      let r1: number = result.$_get(0);
      let e1: number = arr.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3700
     * @tc.name int8ArrayToReversedPart02Test037
     * @tc.desc Verify toReversed() thrice mirrors single reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let single: Int8Array = arr.toReversed();
      let triple: Int8Array = arr.toReversed().toReversed().toReversed();
      let r1: number = triple.$_get(0);
      let e1: number = single.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3800
     * @tc.name int8ArrayToReversedPart02Test038
     * @tc.desc Verify toReversed() result length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let r1: int = arr.toReversed().length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_3900
     * @tc.name int8ArrayToReversedPart02Test039
     * @tc.desc Verify toReversed() at(0) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let r1 = arr.toReversed().at(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4000
     * @tc.name int8ArrayToReversedPart02Test040
     * @tc.desc Verify reverse() on toReversed copy leaves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let reversed: Int8Array = arr.toReversed();
      reversed.reverse();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4100
     * @tc.name int8ArrayToReversedPart02Test041
     * @tc.desc Verify toReversed() twice keeps byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed().toReversed();
      let r1: int = result.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4200
     * @tc.name int8ArrayToReversedPart02Test042
     * @tc.desc Verify toReversed buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed().toReversed();
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4300
     * @tc.name int8ArrayToReversedPart02Test043
     * @tc.desc Verify toReversed() subarray(0, 2) first value 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: Int8Array = arr.toReversed();
      let sub: Int8Array = result.subarray(0, 2);
      let r1: number = sub.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4400
     * @tc.name int8ArrayToReversedPart02Test044
     * @tc.desc Verify ArrayBuffer.isView(toReversed ) true TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4500
     * @tc.name int8ArrayToReversedPart02Test045
     * @tc.desc Verify toReversed buffer buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4600
     * @tc.name int8ArrayToReversedPart02Test046
     * @tc.desc Verify modifying toReversed result does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      result.$_set(0, 99);
      let r1: number = arr.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4700
     * @tc.name int8ArrayToReversedPart02Test047
     * @tc.desc Verify modifying original does not affect toReversed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      arr.$_set(0, 99);
      let r1: number = result.$_get(2);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4800
     * @tc.name int8ArrayToReversedPart02Test048
     * @tc.desc Verify byteOffset subarray toReversed byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      let result: Int8Array = view.toReversed();
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_4900
     * @tc.name int8ArrayToReversedPart02Test049
     * @tc.desc Verify subarray toReversed buffer base buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      let result: Int8Array = view.toReversed();
      expect(result.buffer).not().assertEqual(base.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_5000
     * @tc.name int8ArrayToReversedPart02Test050
     * @tc.desc Verify buffer subarray toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let viewA: Int8Array = base.subarray(0, 3);
      let viewB: Int8Array = base.subarray(0, 3);
      viewA.toReversed();
      let r1: number = viewB.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_5100
     * @tc.name int8ArrayToReversedPart02Test051
     * @tc.desc Verify toReversed $_set toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      result.$_set(0, 99);
      let doubleReversed: Int8Array = result.toReversed();
      let r1: number = doubleReversed.$_get(2);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_5200
     * @tc.name int8ArrayToReversedPart02Test052
     * @tc.desc Verify subarray toReversed length length base length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      let result: Int8Array = view.toReversed();
      let r1: int = result.length;
      let e1: int = view.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_5300
     * @tc.name int8ArrayToReversedPart02Test053
     * @tc.desc Verify toReversed() on view leaves base element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      view.toReversed();
      let r1: number = base.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART02_TEST_5400
     * @tc.name int8ArrayToReversedPart02Test054
     * @tc.desc Verify toReversed result buffer holds reversed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.toReversed();
      let view: Int8Array = new Int8Array(result.buffer, 0, 2);
      let r1: number = view.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });
  });
}
