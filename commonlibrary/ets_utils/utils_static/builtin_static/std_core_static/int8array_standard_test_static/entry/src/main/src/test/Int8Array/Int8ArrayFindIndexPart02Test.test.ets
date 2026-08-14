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

export default function int8ArrayFindIndexPart02Test(): void {
  describe('Int8ArrayFindIndexPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0100
     * @tc.name int8ArrayFindIndexPart02Test001
     * @tc.desc Verify findIndex with predicate v === 99 returns -1, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0200
     * @tc.name int8ArrayFindIndexPart02Test002
     * @tc.desc Verify findIndex returns -1 on empty Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0300
     * @tc.name int8ArrayFindIndexPart02Test003
     * @tc.desc Verify findIndex expects 1 for first value 20, on new Int8Array([10, 20, 30, 20])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 20]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0400
     * @tc.name int8ArrayFindIndexPart02Test004
     * @tc.desc Verify findIndex result plus one expects 2, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r + 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0500
     * @tc.name int8ArrayFindIndexPart02Test005
     * @tc.desc Verify findIndex expects 0, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 10);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0600
     * @tc.name int8ArrayFindIndexPart02Test006
     * @tc.desc Verify findIndex returns last index 2 when value === 30, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 30);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0700
     * @tc.name int8ArrayFindIndexPart02Test007
     * @tc.desc Verify findIndex expects 2, on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 30);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0800
     * @tc.name int8ArrayFindIndexPart02Test008
     * @tc.desc Verify findIndex with predicate element < 0 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v < 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_0900
     * @tc.name int8ArrayFindIndexPart02Test009
     * @tc.desc Verify findIndex with predicate element == 9 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 9);
      expect(r).assertEqual(-1);
      let r2: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 7);
      expect(r2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1000
     * @tc.name int8ArrayFindIndexPart02Test010
     * @tc.desc Verify findIndex expects 0, on new Int8Array([5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 5);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1100
     * @tc.name int8ArrayFindIndexPart02Test011
     * @tc.desc Verify findIndex with predicate element == 1 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 1, 2, 1]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1200
     * @tc.name int8ArrayFindIndexPart02Test012
     * @tc.desc Verify findIndex expects 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 5);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1300
     * @tc.name int8ArrayFindIndexPart02Test013
     * @tc.desc Verify findIndex with always-true callback expects 0, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => true);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1400
     * @tc.name int8ArrayFindIndexPart02Test014
     * @tc.desc Verify findIndex expects -1, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => false);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1500
     * @tc.name int8ArrayFindIndexPart02Test015
     * @tc.desc Verify findIndex with predicate element == target returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let target: number = 20;
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === target);
      let retrievedValue: number = arr.$_get(r);
      expect(retrievedValue).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1600
     * @tc.name int8ArrayFindIndexPart02Test016
     * @tc.desc Verify findIndex with predicate element == -128 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MIN, INT8_MAX]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === -128);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1700
     * @tc.name int8ArrayFindIndexPart02Test017
     * @tc.desc Verify findIndex expects 2, on new Int8Array([0, -128, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -128, INT8_MAX]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === INT8_MAX);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1800
     * @tc.name int8ArrayFindIndexPart02Test018
     * @tc.desc Verify findIndex with predicate v === 0 returns 1, on new Int8Array([5, 0, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 0, 5]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_1900
     * @tc.name int8ArrayFindIndexPart02Test019
     * @tc.desc Verify findIndex with predicate element == -56 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 0, 30]);
      arr.$_set(1, 200);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === -56);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2000
     * @tc.name int8ArrayFindIndexPart02Test020
     * @tc.desc Verify findIndex expects 1, with $_set(1, -129), on new Int8Array([10, 0, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 0, 30]);
      arr.$_set(1, -129);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === INT8_MAX);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2100
     * @tc.name int8ArrayFindIndexPart02Test021
     * @tc.desc Verify findIndex with predicate element == 40 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 40);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2200
     * @tc.name int8ArrayFindIndexPart02Test022
     * @tc.desc Verify findIndex expects 1 when v === 20, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2300
     * @tc.name int8ArrayFindIndexPart02Test023
     * @tc.desc Verify findIndex expects 0, on new Int8Array([7, 7, 7, 7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7, 7]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 7);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2400
     * @tc.name int8ArrayFindIndexPart02Test024
     * @tc.desc Verify findIndex with predicate element > 2 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v > 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2500
     * @tc.name int8ArrayFindIndexPart02Test025
     * @tc.desc Verify findIndex expects 3, on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let r: int = arr.findIndex((v: number, i: int, _a: Int8Array): boolean => i === 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2600
     * @tc.name int8ArrayFindIndexPart02Test026
     * @tc.desc Verify findIndex expects 1 and leaves length 3 unchanged, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2700
     * @tc.name int8ArrayFindIndexPart02Test027
     * @tc.desc Verify findIndex expects -1 and leaves length 3 unchanged, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(r).assertEqual(-1);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2800
     * @tc.name int8ArrayFindIndexPart02Test028
     * @tc.desc Verify findIndex expects -1 on empty array, length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 0);
      expect(r).assertEqual(-1);
      let lengthAfterFind: int = arr.length;
      expect(lengthAfterFind).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_2900
     * @tc.name int8ArrayFindIndexPart02Test029
     * @tc.desc Verify findIndex expects 1 and leaves byteLength 3 unchanged, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: int = arr.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3000
     * @tc.name int8ArrayFindIndexPart02Test030
     * @tc.desc Verify findIndex expects -1 and leaves byteLength 3 unchanged, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(r).assertEqual(-1);
      let r1: int = arr.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3100
     * @tc.name int8ArrayFindIndexPart02Test031
     * @tc.desc Verify findIndex expects 1 on view and leaves byteOffset 2, on new Int8Array(buf, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      arr.$_set(1, 20);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: int = arr.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3200
     * @tc.name int8ArrayFindIndexPart02Test032
     * @tc.desc Verify findIndex expects -1 on view and leaves byteOffset 2, on new Int8Array(buf, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(r).assertEqual(-1);
      let r1: int = arr.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3300
     * @tc.name int8ArrayFindIndexPart02Test033
     * @tc.desc Verify findIndex expects -1 on empty array, byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 0);
      expect(r).assertEqual(-1);
      let byteLengthAfterFind: int = arr.byteLength;
      expect(byteLengthAfterFind).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3400
     * @tc.name int8ArrayFindIndexPart02Test034
     * @tc.desc Verify findIndex expects 1 and element 10 at index 0, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let elementAtIndex0: number = arr.$_get(0);
      expect(elementAtIndex0).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3500
     * @tc.name int8ArrayFindIndexPart02Test035
     * @tc.desc Verify findIndex expects 1 and element 30 at index 2, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let elementAtIndex2: number = arr.$_get(2);
      expect(elementAtIndex2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3600
     * @tc.name int8ArrayFindIndexPart02Test036
     * @tc.desc Verify findIndex expects 20, with $_get(r), on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      let elementAtFoundIndex: number = arr.$_get(r);
      expect(elementAtFoundIndex).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3700
     * @tc.name int8ArrayFindIndexPart02Test037
     * @tc.desc Verify findIndex expects 1 when v > 15 and element 10 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v > 15);
      expect(r).assertEqual(1);
      let elementAtIndex0: number = arr.$_get(0);
      expect(elementAtIndex0).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3800
     * @tc.name int8ArrayFindIndexPart02Test038
     * @tc.desc Verify findIndex expects 0 and elements 20, 30 intact, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 10);
      expect(r).assertEqual(0);
      let elementAtIndex1: number = arr.$_get(1);
      expect(elementAtIndex1).assertEqual(20);
      let elementAtIndex2: number = arr.$_get(2);
      expect(elementAtIndex2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_3900
     * @tc.name int8ArrayFindIndexPart02Test039
     * @tc.desc Verify findIndex expects 2 and elements 10, 20 intact, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 30);
      expect(r).assertEqual(2);
      let elementAtIndex0: number = arr.$_get(0);
      expect(elementAtIndex0).assertEqual(10);
      let elementAtIndex1: number = arr.$_get(1);
      expect(elementAtIndex1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4000
     * @tc.name int8ArrayFindIndexPart02Test040
     * @tc.desc Verify findIndex expects 1 and length 3, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let lengthAfterFind: int = arr.length;
      expect(lengthAfterFind).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4100
     * @tc.name int8ArrayFindIndexPart02Test041
     * @tc.desc Verify findIndex expects 1 and sum of elements equals 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let sumOfElements: number = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      expect(sumOfElements).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4200
     * @tc.name int8ArrayFindIndexPart02Test042
     * @tc.desc Verify findIndex expects 0 and element 7 at index 0, on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 7);
      expect(r).assertEqual(0);
      let elementAtIndex0: number = arr.$_get(0);
      expect(elementAtIndex0).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4300
     * @tc.name int8ArrayFindIndexPart02Test043
     * @tc.desc Verify findIndex expects 1 and toString unchanged 10,20,30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: string = arr.toString();
      let e1: string = '10,20,30';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4400
     * @tc.name int8ArrayFindIndexPart02Test044
     * @tc.desc Verify findIndex expects 1 and join unchanged 10,20,30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: string = arr.join(',');
      let e1: string = '10,20,30';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4500
     * @tc.name int8ArrayFindIndexPart02Test045
     * @tc.desc Verify findIndex expects 1 and elements -10, -30 at ends, on new Int8Array([-10, 20, -30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-10, 20, -30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let elementAtIndex0: number = arr.$_get(0);
      expect(elementAtIndex0).assertEqual(-10);
      let elementAtIndex2: number = arr.$_get(2);
      expect(elementAtIndex2).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4600
     * @tc.name int8ArrayFindIndexPart02Test046
     * @tc.desc Verify findIndex expects 1 and extremes -128, INT8_MAX intact, on new Int8Array([INT8_MIN, 0, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 0);
      expect(r).assertEqual(1);
      let elementAtIndex0: number = arr.$_get(0);
      expect(elementAtIndex0).assertEqual(-128);
      let elementAtIndex2: number = arr.$_get(2);
      expect(elementAtIndex2).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4700
     * @tc.name int8ArrayFindIndexPart02Test047
     * @tc.desc Verify findIndex returns 1 when value === 20, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let indexOf20: int = arr.indexOf(20);
      expect(indexOf20).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4800
     * @tc.name int8ArrayFindIndexPart02Test048
     * @tc.desc Verify findIndex expects 1 and includes(30) remains true, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let includes30: boolean = arr.includes(30);
      expect(includes30).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_4900
     * @tc.name int8ArrayFindIndexPart02Test049
     * @tc.desc Verify findIndex expects 1 and at(-1) 30, at(0) 10, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let lastElement: number = arr.at(-1) as number;
      expect(lastElement).assertEqual(30);
      let firstElement: number = arr.at(0) as number;
      expect(firstElement).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5000
     * @tc.name int8ArrayFindIndexPart02Test050
     * @tc.desc Verify second findIndex call expects 2, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let rIdx: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(rIdx).assertEqual(1);
      let r2: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 30);
      expect(r2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5100
     * @tc.name int8ArrayFindIndexPart02Test051
     * @tc.desc Verify findIndex expects 1 and buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: ArrayBuffer = arr.buffer;
      let e1: ArrayBuffer = buf;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5200
     * @tc.name int8ArrayFindIndexPart02Test052
     * @tc.desc Verify findIndex expects 1 on view, byteOffset 4, on new Int8Array(buf, 4, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int8Array = new Int8Array(buf, 4, 3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let byteOffsetAfterFind: int = arr.byteOffset;
      expect(byteOffsetAfterFind).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5300
     * @tc.name int8ArrayFindIndexPart02Test053
     * @tc.desc Verify findIndex expects 1 on view, length 3, from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int8Array = new Int8Array(buf, 4, 3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let lengthAfterFind: int = arr.length;
      expect(lengthAfterFind).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5400
     * @tc.name int8ArrayFindIndexPart02Test054
     * @tc.desc Verify findIndex expects 1 on a1, shared buffer element 20 visible via a2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let a1: Int8Array = new Int8Array(buf);
      let a2: Int8Array = new Int8Array(buf);
      a1.$_set(0, 10);
      a1.$_set(1, 20);
      a1.$_set(2, 30);
      let r: int = a1.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let sharedElement: number = a2.$_get(1);
      expect(sharedElement).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5500
     * @tc.name int8ArrayFindIndexPart02Test055
     * @tc.desc Verify findIndex on subarray expects 1 and original elements 10, 50 intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let sub: Int8Array = arr.subarray(1, 4);
      let r: int = sub.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 30);
      expect(r).assertEqual(1);
      let originalElement0: number = arr.$_get(0);
      expect(originalElement0).assertEqual(10);
      let originalElement4: number = arr.$_get(4);
      expect(originalElement4).assertEqual(50);
      let subElement0: number = sub.$_get(0);
      expect(subElement0).assertEqual(20);
      let subElement2: number = sub.$_get(2);
      expect(subElement2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5600
     * @tc.name int8ArrayFindIndexPart02Test056
     * @tc.desc Verify findIndex on subarray expects 1 and leaves subarray byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let sub: Int8Array = arr.subarray(1, 4);
      let r: int = sub.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 30);
      expect(r).assertEqual(1);
      let r1: int = sub.byteOffset;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5700
     * @tc.name int8ArrayFindIndexPart02Test057
     * @tc.desc Verify findIndex expects 1 and full view elements 100, -56 intact, on new Int8Array(buf, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let full: Int8Array = new Int8Array(buf);
      full.$_set(0, 100);
      full.$_set(7, 200);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let fullViewElement0: number = full.$_get(0);
      expect(fullViewElement0).assertEqual(100);
      let fullViewElement7: number = full.$_get(7);
      expect(fullViewElement7).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5800
     * @tc.name int8ArrayFindIndexPart02Test058
     * @tc.desc Verify findIndex on a1 expects 1 and partition a2 length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let a1: Int8Array = new Int8Array(buf, 0, 3);
      let a2: Int8Array = new Int8Array(buf, 3, 3);
      a1.$_set(0, 10);
      a1.$_set(1, 20);
      a1.$_set(2, 30);
      a2.$_set(0, 40);
      a2.$_set(1, 50);
      a2.$_set(2, 60);
      let r: int = a1.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let partitionLength: int = a2.length;
      expect(partitionLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_5900
     * @tc.name int8ArrayFindIndexPart02Test059
     * @tc.desc Verify findIndex expects 1 and full view elements 1, 2, 6 intact, on new Int8Array(buf, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let full: Int8Array = new Int8Array(buf);
      full.$_set(0, 1);
      full.$_set(1, 2);
      full.$_set(5, 6);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let fullViewElement0: number = full.$_get(0);
      expect(fullViewElement0).assertEqual(1);
      let fullViewElement1: number = full.$_get(1);
      expect(fullViewElement1).assertEqual(2);
      let fullViewElement5: number = full.$_get(5);
      expect(fullViewElement5).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_6000
     * @tc.name int8ArrayFindIndexPart02Test060
     * @tc.desc Verify findIndex expects 1 and leaves partition view byteOffset 4, on new Int8Array(buf, 0, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a1: Int8Array = new Int8Array(buf, 0, 4);
      let a2: Int8Array = new Int8Array(buf, 4, 4);
      a1.$_set(0, 10);
      a1.$_set(1, 20);
      let r: int = a1.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let partitionByteOffset: int = a2.byteOffset;
      expect(partitionByteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_6100
     * @tc.name int8ArrayFindIndexPart02Test061
     * @tc.desc Verify findIndex expects 1 and leaves partition view byteLength 4, on new Int8Array(buf, 0, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a1: Int8Array = new Int8Array(buf, 0, 4);
      let a2: Int8Array = new Int8Array(buf, 4, 4);
      a1.$_set(0, 10);
      a1.$_set(1, 20);
      let r: int = a1.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let partitionByteLength: int = a2.byteLength;
      expect(partitionByteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_6200
     * @tc.name int8ArrayFindIndexPart02Test062
     * @tc.desc Verify findIndex expects 1 then slice(1, 3) has length 2, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let s: Int8Array = arr.slice(1, 3);
      let sliceLength: int = s.length;
      expect(sliceLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART02_TEST_6300
     * @tc.name int8ArrayFindIndexPart02Test063
     * @tc.desc Verify findIndex expects 1 then subarray(2) has length 2, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let sub: Int8Array = arr.subarray(2);
      let subarrayLength: int = sub.length;
      expect(subarrayLength).assertEqual(2);
    });
  });
}
