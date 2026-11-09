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

export default function int8ArrayToSortedPart01Test(): void {
  describe('Int8ArrayToSortedPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0100
     * @tc.name int8ArrayToSortedPart01Test001
     * @tc.desc Verify toSorted() on [9, 4, 7] returns [4, 7, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(9, 4, 7);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '4,7,9';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0200
     * @tc.name int8ArrayToSortedPart01Test002
     * @tc.desc Verify new Int8Array(0) toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.toSorted();
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0300
     * @tc.name int8ArrayToSortedPart01Test003
     * @tc.desc Verify Int8Array.of() toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of();
      let result: Int8Array = arr.toSorted();
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0400
     * @tc.name int8ArrayToSortedPart01Test004
     * @tc.desc Verify toSorted() on empty array joins to ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0500
     * @tc.name int8ArrayToSortedPart01Test005
     * @tc.desc Verify [0] toSorted() [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0600
     * @tc.name int8ArrayToSortedPart01Test006
     * @tc.desc Verify [127] MAX toSorted() [127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0700
     * @tc.name int8ArrayToSortedPart01Test007
     * @tc.desc Verify [-128] MIN toSorted() [-128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0800
     * @tc.name int8ArrayToSortedPart01Test008
     * @tc.desc Verify [-1] toSorted() [-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_0900
     * @tc.name int8ArrayToSortedPart01Test009
     * @tc.desc Verify toSorted() leaves single INT8_MIN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      arr.toSorted();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1000
     * @tc.name int8ArrayToSortedPart01Test010
     * @tc.desc Verify [127] toSorted() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127);
      let result: Int8Array = arr.toSorted();
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1100
     * @tc.name int8ArrayToSortedPart01Test011
     * @tc.desc Verify [4,1] toSorted() [1,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(4, 1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,4';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1200
     * @tc.name int8ArrayToSortedPart01Test012
     * @tc.desc Verify [127,-128] MAX,MIN toSorted() [-128,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, -128);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1300
     * @tc.name int8ArrayToSortedPart01Test013
     * @tc.desc Verify [0,-1] toSorted() [-1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-1,0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1400
     * @tc.name int8ArrayToSortedPart01Test014
     * @tc.desc Verify [1,-1] toSorted() [-1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-1,1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1500
     * @tc.name int8ArrayToSortedPart01Test015
     * @tc.desc Verify [-5,-10] toSorted() [-10,-5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-5, -10);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-10,-5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1600
     * @tc.name int8ArrayToSortedPart01Test016
     * @tc.desc Verify [2,3,1] toSorted() [1,2,3] without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2, 3, 1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,2,3';
      expect(r1).assertEqual(e1);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let orig0: number = arr.$_get(0);
      let eOrig0: int = 2;
      expect(orig0).assertEqual(eOrig0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1700
     * @tc.name int8ArrayToSortedPart01Test017
     * @tc.desc Verify [0,-128,127] toSorted() [-128,0,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -128, 127);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,0,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1800
     * @tc.name int8ArrayToSortedPart01Test018
     * @tc.desc Verify [3,2,1] toSorted() [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 2, 1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_1900
     * @tc.name int8ArrayToSortedPart01Test019
     * @tc.desc Verify [7,1,3] toSorted() [1,3,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 1, 3);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,3,7';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2000
     * @tc.name int8ArrayToSortedPart01Test020
     * @tc.desc Verify [2,0,-2] toSorted() [-2,0,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2, 0, -2);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-2,0,2';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2100
     * @tc.name int8ArrayToSortedPart01Test021
     * @tc.desc Verify MIN [0,-128] toSorted() [-128,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -128);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2200
     * @tc.name int8ArrayToSortedPart01Test022
     * @tc.desc Verify MAX [127,1,64] toSorted() [1,64,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, 1, 64);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,64,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2300
     * @tc.name int8ArrayToSortedPart01Test023
     * @tc.desc Verify MIN [100,-128,50] toSorted() [-128,50,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, -128, 50);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,50,100';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2400
     * @tc.name int8ArrayToSortedPart01Test024
     * @tc.desc Verify MIN [-128,-128,1] toSorted() [-128,-128,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, -128, 1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,-128,1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2500
     * @tc.name int8ArrayToSortedPart01Test025
     * @tc.desc Verify MAX [127,-50,0] toSorted() [-50,0,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, -50, 0);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-50,0,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2600
     * @tc.name int8ArrayToSortedPart01Test026
     * @tc.desc Verify MAX [127,127,-1] toSorted() [-1,127,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, 127, -1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-1,127,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2700
     * @tc.name int8ArrayToSortedPart01Test027
     * @tc.desc Verify MIN+MAX+ [127,-128,0,1,-1] toSorted() [-128,-1,0,1,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, -128, 0, 1, -1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,-1,0,1,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2800
     * @tc.name int8ArrayToSortedPart01Test028
     * @tc.desc Verify MIN+MAX [127,-128,127,-128] toSorted() [-128,-128,127,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, -128, 127, -128);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,-128,127,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_2900
     * @tc.name int8ArrayToSortedPart01Test029
     * @tc.desc Verify [0,-1,1] toSorted() [-1,0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -1, 1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-1,0,1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3000
     * @tc.name int8ArrayToSortedPart01Test030
     * @tc.desc Verify [50,-50,0,100,-100] toSorted() [-100,-50,0,50,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(50, -50, 0, 100, -100);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-100,-50,0,50,100';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3100
     * @tc.name int8ArrayToSortedPart01Test031
     * @tc.desc Verify [-1,-50,-128,-2] toSorted() [-128,-50,-2,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, -50, -128, -2);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,-50,-2,-1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3200
     * @tc.name int8ArrayToSortedPart01Test032
     * @tc.desc Verify [-5,-5,-10] toSorted() [-10,-5,-5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-5, -5, -10);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-10,-5,-5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3300
     * @tc.name int8ArrayToSortedPart01Test033
     * @tc.desc Verify [100,1,50,2] toSorted() [1,2,50,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, 1, 50, 2);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,2,50,100';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3400
     * @tc.name int8ArrayToSortedPart01Test034
     * @tc.desc Verify [3,1,3,1,3] toSorted() [1,1,3,3,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 1, 3, 1, 3);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,1,3,3,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3500
     * @tc.name int8ArrayToSortedPart01Test035
     * @tc.desc Verify [0,0,-128,-128,127,127] toSorted() [-128,-128,0,0,127,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, -128, -128, 127, 127);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,-128,0,0,127,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3600
     * @tc.name int8ArrayToSortedPart01Test036
     * @tc.desc Verify [5,5,5,1] toSorted() [1,5,5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5, 5, 1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,5,5,5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3700
     * @tc.name int8ArrayToSortedPart01Test037
     * @tc.desc Verify [1,2,4,3,5] toSorted() [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 4, 3, 5);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,2,3,4,5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3800
     * @tc.name int8ArrayToSortedPart01Test038
     * @tc.desc Verify [1,-1,2,-2,3,-3] toSorted() [-3,-2,-1,1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -1, 2, -2, 3, -3);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-3,-2,-1,1,2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_3900
     * @tc.name int8ArrayToSortedPart01Test039
     * @tc.desc Verify [0,-1,0,1] toSorted() [-1,0,0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -1, 0, 1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-1,0,0,1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4000
     * @tc.name int8ArrayToSortedPart01Test040
     * @tc.desc Verify [10,2,1] toSorted() [1,2,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 2, 1);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,2,10';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4100
     * @tc.name int8ArrayToSortedPart01Test041
     * @tc.desc Verify toSorted() keeps source order 3, 1, 2 on an of()-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 1, 2);
      arr.toSorted();
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4200
     * @tc.name int8ArrayToSortedPart01Test042
     * @tc.desc Verify toSorted() keeps source boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, -128, 0);
      arr.toSorted();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4300
     * @tc.name int8ArrayToSortedPart01Test043
     * @tc.desc Verify toSorted() does not mutate unsorted source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 1, 3);
      let result: Int8Array = arr.toSorted();
      let sortedJoin: string = result.join(',');
      let expectedJoin: string = '1,3,5';
      expect(sortedJoin).assertEqual(expectedJoin);
      let r1: number = arr.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4400
     * @tc.name int8ArrayToSortedPart01Test044
     * @tc.desc Verify toSorted result set leaves original untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 1, 2);
      let result: Int8Array = arr.toSorted();
      result.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4500
     * @tc.name int8ArrayToSortedPart01Test045
     * @tc.desc Verify toSorted original set leaves result sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(4, 2, 6);
      let result: Int8Array = arr.toSorted();
      arr.$_set(0, 99);
      let r1: number = result.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4600
     * @tc.name int8ArrayToSortedPart01Test046
     * @tc.desc Verify toSorted result tail set leaves original intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 5, 9);
      let result: Int8Array = arr.toSorted();
      result.$_set(2, -50);
      let r1: number = arr.$_get(2);
      let e1: int = 9;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4700
     * @tc.name int8ArrayToSortedPart01Test047
     * @tc.desc Verify toSorted [3,1,2] r1.$_set(0,99) r2[0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 1, 2);
      let sortedArr1: Int8Array = arr.toSorted();
      let sortedArr2: Int8Array = arr.toSorted();
      sortedArr1.$_set(0, 99);
      let r1: number = sortedArr2.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4800
     * @tc.name int8ArrayToSortedPart01Test048
     * @tc.desc Verify ArrayBuffer Int8Array toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let view: Int8Array = new Int8Array(buf);
      view.$_set(0, 5);
      view.$_set(1, 1);
      view.$_set(2, 3);
      let result: Int8Array = view.toSorted();
      let r1: string = result.join(',');
      let e1: string = '1,3,5';
      expect(r1).assertEqual(e1);
      let r2: string = view.join(',');
      let e2: string = '5,1,3';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_4900
     * @tc.name int8ArrayToSortedPart01Test049
     * @tc.desc Verify toSorted() result joins to '2,5,8'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(8, 2, 5);
      let arr: Int8Array = new Int8Array(src);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '2,5,8';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_5000
     * @tc.name int8ArrayToSortedPart01Test050
     * @tc.desc Verify toSorted() 200 -56, 300 44, 128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 200);
      arr.$_set(1, 300);
      arr.$_set(2, 128);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '-128,-56,44';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_5100
     * @tc.name int8ArrayToSortedPart01Test051
     * @tc.desc Verify default toSorted [6,2,4] produces ascending [2,4,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(6, 2, 4);
      let result: Int8Array = arr.toSorted();
      let r1: string = result.join(',');
      let e1: string = '2,4,6';
      expect(r1).assertEqual(e1);
      let r2: string = arr.join(',');
      let e2: string = '6,2,4';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART01_5200
     * @tc.name int8ArrayToSortedPart01Test052
     * @tc.desc Verify toSorted() result length 5 on an of()-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 3, 1, 4, 2);
      let result: Int8Array = arr.toSorted();
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });
  });
}
