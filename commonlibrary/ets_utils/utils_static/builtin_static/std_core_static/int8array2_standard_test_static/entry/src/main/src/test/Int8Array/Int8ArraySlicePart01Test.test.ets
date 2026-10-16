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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArraySlicePart01Test(): void {
  describe('Int8ArraySlicePart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0100
     * @tc.name int8ArraySlicePart01Test001
     * @tc.desc Verify slice() copies all five elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice();
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0200
     * @tc.name int8ArraySlicePart01Test002
     * @tc.desc Verify arity 1 slice(3) begin end 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(3);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0300
     * @tc.name int8ArraySlicePart01Test003
     * @tc.desc Verify arity 2 slice(2, 4) begin end [2,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(2, 4);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0400
     * @tc.name int8ArraySlicePart01Test004
     * @tc.desc Verify slice() and slice(0) return equal length copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice();
      let resultFromZero: Int8Array = arr.slice(0);
      let r1: int = result.length;
      let e1: int = resultFromZero.length;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: number = resultFromZero.$_get(0);
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4);
      let e3: number = resultFromZero.$_get(4);
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0500
     * @tc.name int8ArraySlicePart01Test005
     * @tc.desc Verify slice one arg equals bounded two arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(3);
      let resultBounded: Int8Array = arr.slice(3, 5);
      let r1: int = result.length;
      let e1: int = resultBounded.length;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: number = resultBounded.$_get(0);
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: number = resultBounded.$_get(1);
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0600
     * @tc.name int8ArraySlicePart01Test006
     * @tc.desc Verify slice(0) copies all 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0700
     * @tc.name int8ArraySlicePart01Test007
     * @tc.desc Verify slice begin=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(1);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(3);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0800
     * @tc.name int8ArraySlicePart01Test008
     * @tc.desc Verify slice begin=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(2);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_0900
     * @tc.name int8ArraySlicePart01Test009
     * @tc.desc Verify slice(4) copies last element 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(4);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1000
     * @tc.name int8ArraySlicePart01Test010
     * @tc.desc Verify slice begin at length yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(5);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1100
     * @tc.name int8ArraySlicePart01Test011
     * @tc.desc Verify slice begin past length yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(6);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1200
     * @tc.name int8ArraySlicePart01Test012
     * @tc.desc Verify slice begin int max yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(2147483647);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1300
     * @tc.name int8ArraySlicePart01Test013
     * @tc.desc Verify slice(-1) maps to last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1400
     * @tc.name int8ArraySlicePart01Test014
     * @tc.desc Verify slice(-2) copies last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1500
     * @tc.name int8ArraySlicePart01Test015
     * @tc.desc Verify slice negative begin minus four yields four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-4);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1600
     * @tc.name int8ArraySlicePart01Test016
     * @tc.desc Verify slice begin negative length yields all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-5);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1700
     * @tc.name int8ArraySlicePart01Test017
     * @tc.desc Verify slice begin beyond negative length yields all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-6);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1800
     * @tc.name int8ArraySlicePart01Test018
     * @tc.desc Verify slice begin=-2147483648 (int MIN) 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-2147483648);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_1900
     * @tc.name int8ArraySlicePart01Test019
     * @tc.desc Verify slice end=0 0 begin=0, end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, 0);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2000
     * @tc.name int8ArraySlicePart01Test020
     * @tc.desc Verify slice end=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, 1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2100
     * @tc.name int8ArraySlicePart01Test021
     * @tc.desc Verify slice(0, 2) copies first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, 2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2200
     * @tc.name int8ArraySlicePart01Test022
     * @tc.desc Verify slice(0, 4) copies elements before last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, 4);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2300
     * @tc.name int8ArraySlicePart01Test023
     * @tc.desc Verify slice(0, 5) copies all five elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, 5);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(4);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2400
     * @tc.name int8ArraySlicePart01Test024
     * @tc.desc Verify slice end past length yields all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, 6);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(4);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2500
     * @tc.name int8ArraySlicePart01Test025
     * @tc.desc Verify slice end int max yields all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, 2147483647);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(4);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2600
     * @tc.name int8ArraySlicePart01Test026
     * @tc.desc Verify slice(0, -1) excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, -1);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2700
     * @tc.name int8ArraySlicePart01Test027
     * @tc.desc Verify slice(0, -2) excludes last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, -2);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2800
     * @tc.name int8ArraySlicePart01Test028
     * @tc.desc Verify slice negative end yields first only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, -4);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_2900
     * @tc.name int8ArraySlicePart01Test029
     * @tc.desc Verify slice end negative length yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, -5);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3000
     * @tc.name int8ArraySlicePart01Test030
     * @tc.desc Verify slice end beyond negative length yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, -6);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3100
     * @tc.name int8ArraySlicePart01Test031
     * @tc.desc Verify slice end=-2147483648 (int MIN) 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(0, -2147483648);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3200
     * @tc.name int8ArraySlicePart01Test032
     * @tc.desc Verify slice begin=2, end=2 begin==end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(2, 2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3300
     * @tc.name int8ArraySlicePart01Test033
     * @tc.desc Verify slice begin=-1, end=-1 begin==end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-1, -1);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3400
     * @tc.name int8ArraySlicePart01Test034
     * @tc.desc Verify slice begin=3, end=2 begin > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(3, 2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3500
     * @tc.name int8ArraySlicePart01Test035
     * @tc.desc Verify slice begin=-1, end=-2 begin(4) > end(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-1, -2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3600
     * @tc.name int8ArraySlicePart01Test036
     * @tc.desc Verify slice begin length end past yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(5, 6);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3700
     * @tc.name int8ArraySlicePart01Test037
     * @tc.desc Verify slice begin=3, end=-2 end 3 begin==end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(3, -2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3800
     * @tc.name int8ArraySlicePart01Test038
     * @tc.desc Verify slice begin=1, end=-2 begin end [1,3) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(1, -2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_3900
     * @tc.name int8ArraySlicePart01Test039
     * @tc.desc Verify slice begin=1, end=-1 begin end [1,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(1, -1);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4000
     * @tc.name int8ArraySlicePart01Test040
     * @tc.desc Verify slice begin=-2, end=-1 [3,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-2, -1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4100
     * @tc.name int8ArraySlicePart01Test041
     * @tc.desc Verify slice negative one to length yields last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-1, 5);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4200
     * @tc.name int8ArraySlicePart01Test042
     * @tc.desc Verify slice negative begin to negative end yields four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-5, -1);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(3);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4300
     * @tc.name int8ArraySlicePart01Test043
     * @tc.desc Verify slice begin=1, end=4 [1,4) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(1, 4);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4400
     * @tc.name int8ArraySlicePart01Test044
     * @tc.desc Verify slice begin=-3, end=4 begin 2 end=4 [2,4) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-3, 4);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4500
     * @tc.name int8ArraySlicePart01Test045
     * @tc.desc Verify slice begin=2, end=3 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(2, 3);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4600
     * @tc.name int8ArraySlicePart01Test046
     * @tc.desc Verify slice begin=1, end=3 2 [1,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(1, 3);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4700
     * @tc.name int8ArraySlicePart01Test047
     * @tc.desc Verify slice begin=4, end=5 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(4, 5);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4800
     * @tc.name int8ArraySlicePart01Test048
     * @tc.desc Verify slice(undefined) begin undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(undefined);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_4900
     * @tc.name int8ArraySlicePart01Test049
     * @tc.desc Verify slice(undefined, 3) begin undefined 0 end=3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(undefined, 3);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5000
     * @tc.name int8ArraySlicePart01Test050
     * @tc.desc Verify slice(1, undefined) end undefined begin=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(1, undefined);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(3);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5100
     * @tc.name int8ArraySlicePart01Test051
     * @tc.desc Verify slice(undefined, undefined) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(undefined, undefined);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5200
     * @tc.name int8ArraySlicePart01Test052
     * @tc.desc Verify slice(2147483647, 2147483647) begin end int MAX begin==end==length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(2147483647, 2147483647);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5300
     * @tc.name int8ArraySlicePart01Test053
     * @tc.desc Verify slice(-2147483648, 2147483647) begin int MIN 0 end int MAX length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-2147483648, 2147483647);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5400
     * @tc.name int8ArraySlicePart01Test054
     * @tc.desc Verify slice(-2147483648, 2) begin int MIN 0 end=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-2147483648, 2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5500
     * @tc.name int8ArraySlicePart01Test055
     * @tc.desc Verify slice(-2147483648, -2147483648) begin end int MIN 0 begin==end==0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-2147483648, -2147483648);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5600
     * @tc.name int8ArraySlicePart01Test056
     * @tc.desc Verify slice(2147483647, -2147483647) begin MAX length=5 end 0 begin > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(2147483647, -2147483647);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5700
     * @tc.name int8ArraySlicePart01Test057
     * @tc.desc Verify slice() on empty array returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.slice();
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5800
     * @tc.name int8ArraySlicePart01Test058
     * @tc.desc Verify slice(0) 1 begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let result: Int8Array = arr.slice(0);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_5900
     * @tc.name int8ArraySlicePart01Test059
     * @tc.desc Verify slice(-1) 1 begin=-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let result: Int8Array = arr.slice(-1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6000
     * @tc.name int8ArraySlicePart01Test060
     * @tc.desc Verify slice(1) 1 begin=1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let result: Int8Array = arr.slice(1);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6100
     * @tc.name int8ArraySlicePart01Test061
     * @tc.desc Verify slice(0, 100) 3 end=100 length=3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.slice(0, 100);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6200
     * @tc.name int8ArraySlicePart01Test062
     * @tc.desc Verify slice(-100, 100) 3 begin=-100 0 end=100 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.slice(-100, 100);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6300
     * @tc.name int8ArraySlicePart01Test063
     * @tc.desc Verify slice begin=-1( 4), end=2 begin 4 end=2 4 > 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-1, 2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6400
     * @tc.name int8ArraySlicePart01Test064
     * @tc.desc Verify slice begin=2, end=-1( 4) begin=2 end 4 2 < 4 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(2, -1);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6500
     * @tc.name int8ArraySlicePart01Test065
     * @tc.desc Verify slice begin=-3( 2), end=-1( 4) [2,4) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-3, -1);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6600
     * @tc.name int8ArraySlicePart01Test066
     * @tc.desc Verify slice begin=-4( 1), end=4 begin 1 end=4 1 < 4 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-4, 4);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6700
     * @tc.name int8ArraySlicePart01Test067
     * @tc.desc Verify slice begin=-3( 2), end=-2( 3) [2,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(-3, -2);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART01_TEST_6800
     * @tc.name int8ArraySlicePart01Test068
     * @tc.desc Verify slice begin=1, end=-3( 2) begin=1 end 2 1 < 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: Int8Array = arr.slice(1, -3);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });
  });
}
