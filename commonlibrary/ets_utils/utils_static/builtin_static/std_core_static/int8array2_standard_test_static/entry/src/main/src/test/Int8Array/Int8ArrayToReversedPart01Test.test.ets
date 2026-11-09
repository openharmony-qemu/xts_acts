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
import Utils from '../Util.test';

export default function int8ArrayToReversedPart01Test(): void {
  describe('Int8ArrayToReversedPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0100
     * @tc.name int8ArrayToReversedPart01Test001
     * @tc.desc Verify toReversed() on constructor-created [1, 2, 3] returns reversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 3;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0200
     * @tc.name int8ArrayToReversedPart01Test002
     * @tc.desc Verify toReversed() with 0 arguments on single-element array returns same element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let result = arr.toReversed();
      let firstCheckedValue: int = result.length;
      let firstExpectedValue: int = 1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(0);
      let secondExpectedValue: int = 42;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0300
     * @tc.name int8ArrayToReversedPart01Test003
     * @tc.desc Verify single-element int8 minimum -128 preserves value after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MIN;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0400
     * @tc.name int8ArrayToReversedPart01Test004
     * @tc.desc Verify single-element int8 maximum 127 preserves value after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0500
     * @tc.name int8ArrayToReversedPart01Test005
     * @tc.desc Verify single-element zero preserves value after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0600
     * @tc.name int8ArrayToReversedPart01Test006
     * @tc.desc Verify single-element -1 preserves value after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = -1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0700
     * @tc.name int8ArrayToReversedPart01Test007
     * @tc.desc Verify single-element minimum positive 1 preserves value after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0800
     * @tc.name int8ArrayToReversedPart01Test008
     * @tc.desc Verify decimal overflow [128,-129,255] truncates to [-128,127,-1] and reversed result preserves truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128, -129, 255]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = -1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: number = INT8_MAX;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: number = INT8_MIN;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_0900
     * @tc.name int8ArrayToReversedPart01Test009
     * @tc.desc Verify hex overflow [0x80,0xFF,0x100] truncates to [-128,-1,0] and reversed result preserves truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0x80, 0xff, 0x100]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = -1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: number = INT8_MIN;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1000
     * @tc.name int8ArrayToReversedPart01Test010
     * @tc.desc Verify float [1.9,-1.9] truncates to [1,-1] and reversed result preserves truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1.9, -1.9]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = -1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1100
     * @tc.name int8ArrayToReversedPart01Test011
     * @tc.desc Verify special numbers [Number.NaN,Number.POSITIVE_INFINITY,Number.NEGATIVE_INFINITY] all truncate to 0 and reversed result preserves truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 0;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 0;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1200
     * @tc.name int8ArrayToReversedPart01Test012
     * @tc.desc Verify [0.0,-0.0] both truncate to 0 and reversed result normalizes negative zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0.0, -0.0]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 0;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1300
     * @tc.name int8ArrayToReversedPart01Test013
     * @tc.desc Verify toReversed on empty array (length 0) returns empty array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result = arr.toReversed();
      let firstCheckedValue: int = result.length;
      let firstExpectedValue: int = 0;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1400
     * @tc.name int8ArrayToReversedPart01Test014
     * @tc.desc Verify toReversed on length-2 even array swaps the two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20]);
      let result = arr.toReversed();
      let firstCheckedValue: int = result.length;
      let firstExpectedValue: int = 2;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(0);
      let secondExpectedValue: int = 20;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(1);
      let thirdExpectedValue: int = 10;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1500
     * @tc.name int8ArrayToReversedPart01Test015
     * @tc.desc Verify toReversed on length-3 odd array keeps middle element and swaps ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 30;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 20;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 10;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1600
     * @tc.name int8ArrayToReversedPart01Test016
     * @tc.desc Verify toReversed on length-100 large array with sequential values 0~99 preserves correct reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = 100;
      let src: int[] = [];
      for (let i: int = 0; i < len; i++) {
        src.push(i);
      }
      let arr = Int8Array.from(src);
      let result = arr.toReversed();
      let firstCheckedValue: int = result.length;
      let firstExpectedValue: int = 100;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(0);
      let secondExpectedValue: int = 99;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(99);
      let thirdExpectedValue: int = 0;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
      let fourthCheckedValue: number = result.$_get(50);
      let fourthExpectedValue: int = 49;
      expect(fourthCheckedValue).assertEqual(fourthExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1700
     * @tc.name int8ArrayToReversedPart01Test017
     * @tc.desc Verify toReversed on length-6 even array with full-position mapping validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let result = arr.toReversed();
      for (let i: int = 0; i < 6; i++) {
        let firstCheckedValue: number = result.$_get(i);
        let firstExpectedValue: number = arr.$_get(5 - i);
        expect(firstCheckedValue).assertEqual(firstExpectedValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1800
     * @tc.name int8ArrayToReversedPart01Test018
     * @tc.desc Verify toReversed on odd-length [1,2,3,4,5] produces [5,4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 5;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 3;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(4);
      let thirdExpectedValue: int = 1;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 1;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_1900
     * @tc.name int8ArrayToReversedPart01Test019
     * @tc.desc Verify toReversed on constructor-created [10, 20, 30] produces [30, 20, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 30;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 20;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 10;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 10;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2000
     * @tc.name int8ArrayToReversedPart01Test020
     * @tc.desc Verify toReversed on even-length [5,9] produces [9,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 9]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 9;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 5;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 5;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2100
     * @tc.name int8ArrayToReversedPart01Test021
     * @tc.desc Verify toReversed on strictly increasing [1,2,3,4,5] produces strictly decreasing result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 5;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(4);
      let secondExpectedValue: int = 1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2200
     * @tc.name int8ArrayToReversedPart01Test022
     * @tc.desc Verify toReversed on strictly decreasing [5,4,3,2,1] produces strictly increasing result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 4, 3, 2, 1]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(4);
      let secondExpectedValue: int = 5;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2300
     * @tc.name int8ArrayToReversedPart01Test023
     * @tc.desc Verify toReversed on [7,8,9,10] produces [10,9,8,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 8, 9, 10]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 10;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(3);
      let secondExpectedValue: int = 7;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 7;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2400
     * @tc.name int8ArrayToReversedPart01Test024
     * @tc.desc Verify toReversed on [1,2,2,3] with duplicate values correctly reverses while preserving duplicates at new positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 2, 3]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 3;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 2;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 2;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
      let fourthCheckedValue: number = result.$_get(3);
      let fourthExpectedValue: int = 1;
      expect(fourthCheckedValue).assertEqual(fourthExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2500
     * @tc.name int8ArrayToReversedPart01Test025
     * @tc.desc Verify toReversed on constructor-created [1,-1,1,-1] flips the alternating phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, -1, 1, -1]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = -1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(3);
      let secondExpectedValue: int = 1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2600
     * @tc.name int8ArrayToReversedPart01Test026
     * @tc.desc Verify toReversed on all-negative [-1,-2,-3] reverses negative values in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, -2, -3]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = -3;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = -1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2700
     * @tc.name int8ArrayToReversedPart01Test027
     * @tc.desc Verify toReversed on all-positive [3,6,9] reverses positive values in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 6, 9]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 9;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 6;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 3;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2800
     * @tc.name int8ArrayToReversedPart01Test028
     * @tc.desc Verify toReversed on mixed extremes and regular values [-128,0,50,127] correctly reverses all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, 0, 50, INT8_MAX]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 50;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 0;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
      let fourthCheckedValue: number = result.$_get(3);
      let fourthExpectedValue: number = INT8_MIN;
      expect(fourthCheckedValue).assertEqual(fourthExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_2900
     * @tc.name int8ArrayToReversedPart01Test029
     * @tc.desc Verify toReversed on alternating extremes [127,-128,127,-128] flips extreme alternating phase correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN, INT8_MAX, INT8_MIN]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MIN;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: number = INT8_MAX;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: number = INT8_MIN;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
      let fourthCheckedValue: number = result.$_get(3);
      let fourthExpectedValue: number = INT8_MAX;
      expect(fourthCheckedValue).assertEqual(fourthExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3000
     * @tc.name int8ArrayToReversedPart01Test030
     * @tc.desc Verify toReversed on Int8Array constructed by new Int8Array(length) and $_set writes reflects the written state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(3);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 33;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 11;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3100
     * @tc.name int8ArrayToReversedPart01Test031
     * @tc.desc Verify toReversed on Int8Array constructed from literal array reflects literal content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([100, 110, 120, INT8_MAX]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(3);
      let secondExpectedValue: int = 100;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3200
     * @tc.name int8ArrayToReversedPart01Test032
     * @tc.desc Verify toReversed on Int8Array constructed by Int8Array.of() static method reflects of parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 10, 15);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 15;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 5;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3300
     * @tc.name int8ArrayToReversedPart01Test033
     * @tc.desc Verify toReversed on Int8Array constructed by Int8Array.from(Array<number>) reflects source array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [9, 8, 7];
      let arr = Int8Array.from(src);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 7;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 9;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3400
     * @tc.name int8ArrayToReversedPart01Test034
     * @tc.desc Verify toReversed on Int8Array constructed as ArrayBuffer view reflects view content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let arr = new Int8Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 3;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3500
     * @tc.name int8ArrayToReversedPart01Test035
     * @tc.desc Verify toReversed on subarray view (shared buffer) only reverses elements within the view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40, 50]);
      let arr = base.subarray(1, 4);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 40;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 30;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 20;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3600
     * @tc.name int8ArrayToReversedPart01Test036
     * @tc.desc Verify toReversed on slice copy produces reversed copy and slice itself is not mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40, 50]);
      let arr = base.slice(1, 4);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 40;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 30;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 20;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
      let fourthCheckedValue: number = arr.$_get(0);
      let fourthExpectedValue: int = 20;
      expect(fourthCheckedValue).assertEqual(fourthExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3700
     * @tc.name int8ArrayToReversedPart01Test037
     * @tc.desc Verify chained toReversed().toReversed() restores original order via double reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let result = arr.toReversed().toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(3);
      let secondExpectedValue: int = 4;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3800
     * @tc.name int8ArrayToReversedPart01Test038
     * @tc.desc Verify toReversed result first element equals original last element using dynamic index assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 6, 9, 12]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = arr.$_get(arr.length - 1);
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_3900
     * @tc.name int8ArrayToReversedPart01Test039
     * @tc.desc Verify toReversed result last element equals original first element using dynamic index assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15, 20, 25]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(result.length - 1);
      let firstExpectedValue: number = arr.$_get(0);
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4000
     * @tc.name int8ArrayToReversedPart01Test040
     * @tc.desc Verify toReversed on odd-length [2,4,6,8,10] keeps middle element at index 2 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 4, 6, 8, 10]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 10;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 6;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(4);
      let thirdExpectedValue: int = 2;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4100
     * @tc.name int8ArrayToReversedPart01Test041
     * @tc.desc Verify toReversed on length-7 array with full position mapping result[i] equals original[6-i]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 3, 5, 7, 9, 11, 13]);
      let result = arr.toReversed();
      for (let i: int = 0; i < 7; i++) {
        let firstCheckedValue: number = result.$_get(i);
        let firstExpectedValue: number = arr.$_get(6 - i);
        expect(firstCheckedValue).assertEqual(firstExpectedValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4200
     * @tc.name int8ArrayToReversedPart01Test042
     * @tc.desc Verify toReversed on [100,50,50,50,1] swaps ends and correctly migrates repeated middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([100, 50, 50, 50, 1]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(4);
      let secondExpectedValue: int = 100;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(1);
      let thirdExpectedValue: int = 50;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4300
     * @tc.name int8ArrayToReversedPart01Test043
     * @tc.desc Verify toReversed on [0,-128] swaps zero and minimum value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, INT8_MIN]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MIN;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 0;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4400
     * @tc.name int8ArrayToReversedPart01Test044
     * @tc.desc Verify toReversed on [0,127] swaps zero and maximum value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, INT8_MAX]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 0;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4500
     * @tc.name int8ArrayToReversedPart01Test045
     * @tc.desc Verify toReversed on [-128,127,0] produces [0,127,-128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MAX, 0]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: number = INT8_MAX;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: number = INT8_MIN;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: number = INT8_MIN;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4600
     * @tc.name int8ArrayToReversedPart01Test046
     * @tc.desc Verify toReversed on [127,-128] swaps maximum and minimum values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MIN;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: number = INT8_MAX;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4700
     * @tc.name int8ArrayToReversedPart01Test047
     * @tc.desc Verify toReversed on [-128,-128,127,127] reverses extreme value blocks correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MIN, INT8_MAX, INT8_MAX]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(3);
      let secondExpectedValue: number = INT8_MIN;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4800
     * @tc.name int8ArrayToReversedPart01Test048
     * @tc.desc Verify toReversed after $_set modification of middle element reflects modified state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.$_set(1, 99);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 3;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 99;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 1;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_4900
     * @tc.name int8ArrayToReversedPart01Test049
     * @tc.desc Verify toReversed after reverse() in-place restores original order via double reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      arr.reverse();
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(3);
      let secondExpectedValue: int = 4;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5000
     * @tc.name int8ArrayToReversedPart01Test050
     * @tc.desc Verify toReversed after fill(5) on length-4 array results in all-5 reversed still all-5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(4);
      arr.fill(5);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 5;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(3);
      let secondExpectedValue: int = 5;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 5;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5100
     * @tc.name int8ArrayToReversedPart01Test051
     * @tc.desc Verify toReversed after copyWithin(0,3) reflects the copied state in reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 5;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(4);
      let secondExpectedValue: int = 4;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5200
     * @tc.name int8ArrayToReversedPart01Test052
     * @tc.desc Verify toReversed after sort() ascending produces descending order on reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 3;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 2;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 1;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5300
     * @tc.name int8ArrayToReversedPart01Test053
     * @tc.desc Verify toReversed on Int8Array.of() empty array returns empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([]);
      let result = arr.toReversed();
      let firstCheckedValue: int = result.length;
      let firstExpectedValue: int = 0;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5400
     * @tc.name int8ArrayToReversedPart01Test054
     * @tc.desc Verify toReversed on empty ArrayBuffer view returns empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new Int8Array(buf);
      let result = arr.toReversed();
      let firstCheckedValue: int = result.length;
      let firstExpectedValue: int = 0;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5500
     * @tc.name int8ArrayToReversedPart01Test055
     * @tc.desc Verify toReversed on subarray(0,3) view only reverses view range and base array is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5, 6]);
      let arr = base.subarray(0, 3);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 3;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = base.$_get(0);
      let thirdExpectedValue: int = 1;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5600
     * @tc.name int8ArrayToReversedPart01Test056
     * @tc.desc Verify toReversed on ArrayBuffer view with byteOffset produces independent copy not affected by buffer mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let full = new Int8Array(buf);
      full.$_set(2, 100);
      full.$_set(3, 101);
      full.$_set(4, 102);
      let arr = new Int8Array(buf, 2, 3);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 102;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 100;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      full.$_set(2, 0);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 100;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5700
     * @tc.name int8ArrayToReversedPart01Test057
     * @tc.desc Verify toReversed on shared buffer full view produces independent copy and shared buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int8Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      arr.$_set(4, 5);
      arr.$_set(5, 6);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 6;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = arr.$_get(0);
      let secondExpectedValue: int = 1;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = arr.$_get(5);
      let thirdExpectedValue: int = 6;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5800
     * @tc.name int8ArrayToReversedPart01Test058
     * @tc.desc Verify toReversed on subarray(2) tail view only reverses elements within the view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5]);
      let arr = base.subarray(2);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 5;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(2);
      let secondExpectedValue: int = 3;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_5900
     * @tc.name int8ArrayToReversedPart01Test059
     * @tc.desc Verify two independent toReversed calls on same receiver produce element-wise equal results deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([6, 5, 4, 3, 2, 1]);
      let firstReversedCopy = arr.toReversed();
      let secondReversedCopy = arr.toReversed();
      let firstCheckedValue: number = firstReversedCopy.$_get(0);
      let firstExpectedValue: number = secondReversedCopy.$_get(0);
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = firstReversedCopy.$_get(5);
      let secondExpectedValue: number = secondReversedCopy.$_get(5);
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_6000
     * @tc.name int8ArrayToReversedPart01Test060
     * @tc.desc Verify toReversed on 100-element sequential 0~99 produces 99~0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        src.push(i);
      }
      let arr = Int8Array.from(src);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 99;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(99);
      let secondExpectedValue: int = 0;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 0;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_6100
     * @tc.name int8ArrayToReversedPart01Test061
     * @tc.desc Verify toReversed on sparse structure [99,0,0,0,88] swaps non-zero ends with zeros centered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([99, 0, 0, 0, 88]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 88;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(4);
      let secondExpectedValue: int = 99;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(1);
      let thirdExpectedValue: int = 0;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOREVERSED_PART01_6200
     * @tc.name int8ArrayToReversedPart01Test062
     * @tc.desc Verify toReversed on three special nodes [-1,0,1] swaps positive and negative with zero centered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 0, 1]);
      let result = arr.toReversed();
      let firstCheckedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstCheckedValue).assertEqual(firstExpectedValue);
      let secondCheckedValue: number = result.$_get(1);
      let secondExpectedValue: int = 0;
      expect(secondCheckedValue).assertEqual(secondExpectedValue);
      let thirdCheckedValue: number = result.$_get(2);
      let thirdExpectedValue: int = -1;
      expect(thirdCheckedValue).assertEqual(thirdExpectedValue);
    });
  });
}
