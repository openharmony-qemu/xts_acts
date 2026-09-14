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

export default function int8ArrayFindLastIndexPart02Test(): void {
  describe('Int8ArrayFindLastIndexPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0100
     * @tc.name int8ArrayFindLastIndexPart02Test001
     * @tc.desc Verify findLastIndex expects int, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0200
     * @tc.name int8ArrayFindLastIndexPart02Test002
     * @tc.desc Verify findLastIndex expects int, on Int8Array.of(5, 15, 25)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 15, 25);
      let result: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0300
     * @tc.name int8ArrayFindLastIndexPart02Test003
     * @tc.desc Verify findLastIndex expects int, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0400
     * @tc.name int8ArrayFindLastIndexPart02Test004
     * @tc.desc Verify findLastIndex expects index 2, checked via idx + 1 equals 3, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(idx + 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0500
     * @tc.name int8ArrayFindLastIndexPart02Test005
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(11, 22, 33), returns '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(11, 22, 33);
      let result: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 22);
      let asString: string = result.toString();
      expect(asString).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0600
     * @tc.name int8ArrayFindLastIndexPart02Test006
     * @tc.desc Verify findLastIndex with predicate element > 7 returns last matching index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(7, 8, 9);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 7);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0700
     * @tc.name int8ArrayFindLastIndexPart02Test007
     * @tc.desc Verify findLastIndex with predicate element == 42 returns last matching index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(42);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 42);
      expect(idx).assertEqual(0);
      let arr2 = Int8Array.of(50);
      let idx2: int = arr2.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 50);
      expect(idx2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0800
     * @tc.name int8ArrayFindLastIndexPart02Test008
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(10, 20), returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_0900
     * @tc.name int8ArrayFindLastIndexPart02Test009
     * @tc.desc Verify findLastIndex expects 2, on Int8Array.of(5, 10, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 10, 15);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 15);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1000
     * @tc.name int8ArrayFindLastIndexPart02Test010
     * @tc.desc Verify findLastIndex expects 4, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 0);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1100
     * @tc.name int8ArrayFindLastIndexPart02Test011
     * @tc.desc Verify findLastIndex returns 0 when value exceeds 50 on Int8Array.of(100, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(100, 2, 3, 4);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 50);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1200
     * @tc.name int8ArrayFindLastIndexPart02Test012
     * @tc.desc Verify findLastIndex expects 3, on Int8Array.of(1, 2, 3, 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 100);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 50);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1300
     * @tc.name int8ArrayFindLastIndexPart02Test013
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(1, 99, 2, 3), returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 99, 2, 3);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1400
     * @tc.name int8ArrayFindLastIndexPart02Test014
     * @tc.desc Verify findLastIndex with predicate element == 60 returns last matching index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(50, 60, 50, 60, 50);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 60);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1500
     * @tc.name int8ArrayFindLastIndexPart02Test015
     * @tc.desc Verify findLastIndex with predicate element != 7 returns last matching index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(7, 7, 7, 8, 7);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v !== 7);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1600
     * @tc.name int8ArrayFindLastIndexPart02Test016
     * @tc.desc Verify findLastIndex expects arr.length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, INT8_MAX);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === INT8_MAX);
      expect(idx).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1700
     * @tc.name int8ArrayFindLastIndexPart02Test017
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1800
     * @tc.name int8ArrayFindLastIndexPart02Test018
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_1900
     * @tc.name int8ArrayFindLastIndexPart02Test019
     * @tc.desc Verify findLastIndex with predicate element < -128 returns index -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128, 0, INT8_MAX);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v < -128);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2000
     * @tc.name int8ArrayFindLastIndexPart02Test020
     * @tc.desc Verify findLastIndex with predicate element > INT8_MAX returns index -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128, 0, INT8_MAX);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > INT8_MAX);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2100
     * @tc.name int8ArrayFindLastIndexPart02Test021
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(5, 5, 5, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 5, 5, 5);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 6);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2200
     * @tc.name int8ArrayFindLastIndexPart02Test022
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(-10, -20, -30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-10, -20, -30);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2300
     * @tc.name int8ArrayFindLastIndexPart02Test023
     * @tc.desc Verify findLastIndex with predicate element == 7 returns last matching index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(7, 7, 7, 7);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 7);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2400
     * @tc.name int8ArrayFindLastIndexPart02Test024
     * @tc.desc Verify findLastIndex expects 4, on Int8Array.of(1, 2, 1, 2, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 1, 2, 1);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 1);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2500
     * @tc.name int8ArrayFindLastIndexPart02Test025
     * @tc.desc Verify findLastIndex expects 3, on Int8Array.of(10, 20, 30, 20, 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 20, 10);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2600
     * @tc.name int8ArrayFindLastIndexPart02Test026
     * @tc.desc Verify findLastIndex expects 5, on Int8Array.of(5, 6, 5, 6, 5, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 6, 5, 6, 5, 6);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 6);
      expect(idx).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2700
     * @tc.name int8ArrayFindLastIndexPart02Test027
     * @tc.desc Verify findLastIndex with predicate element < 3 returns last matching index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v < 3);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2800
     * @tc.name int8ArrayFindLastIndexPart02Test028
     * @tc.desc Verify findLastIndex and findIndex return consistent indices with difference 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(8, 1, 8, 1, 8);
      let lastIdx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 8);
      let firstIdx: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 8);
      expect(lastIdx - firstIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_2900
     * @tc.name int8ArrayFindLastIndexPart02Test029
     * @tc.desc Verify findLastIndex expects 2 and length stays 5, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(r).assertEqual(2);
      let r1: int = arr.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3000
     * @tc.name int8ArrayFindLastIndexPart02Test030
     * @tc.desc Verify findLastIndex expects 1 and byteLength stays 3, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: int = arr.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3100
     * @tc.name int8ArrayFindLastIndexPart02Test031
     * @tc.desc Verify findLastIndex expects 2 and buffer.byteLength stays 4, on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(r).assertEqual(2);
      let r1: int = arr.buffer.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3200
     * @tc.name int8ArrayFindLastIndexPart02Test032
     * @tc.desc Verify findLastIndex expects 3 when v < 0 and length stays 4, on Int8Array.of(100, -100, 50, -50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(100, -100, 50, -50);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v < 0);
      expect(r).assertEqual(3);
      let r1: int = arr.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3300
     * @tc.name int8ArrayFindLastIndexPart02Test033
     * @tc.desc Verify findLastIndex on subarray(1, 4) expects 1 and view length stays 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(1, 2, 3, 4, 5);
      let view = base.subarray(1, 4);
      let r: int = view.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(r).assertEqual(1);
      let r1: int = view.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3400
     * @tc.name int8ArrayFindLastIndexPart02Test034
     * @tc.desc Verify findLastIndex returns index 1 for element 2 in Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3500
     * @tc.name int8ArrayFindLastIndexPart02Test035
     * @tc.desc Verify findLastIndex expects 1 and toString stays '1,2,3', on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 2);
      expect(r).assertEqual(1);
      let r1: string = arr.toString();
      let e1: string = '1,2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3600
     * @tc.name int8ArrayFindLastIndexPart02Test036
     * @tc.desc Verify findLastIndex expects 1 and join(',') stays '10,20,30', on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: string = arr.join(',');
      let e1: string = '10,20,30';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3700
     * @tc.name int8ArrayFindLastIndexPart02Test037
     * @tc.desc Verify findLastIndex expects 2 and $_get(0) stays 42, on Int8Array.of(42, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(42, 2, 3);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(r).assertEqual(2);
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3800
     * @tc.name int8ArrayFindLastIndexPart02Test038
     * @tc.desc Verify findLastIndex expects 0 and $_get(arr.length - 1) stays 99, on Int8Array.of(1, 2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 99);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 1);
      expect(r).assertEqual(0);
      let r1: number = arr.$_get(arr.length - 1);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_3900
     * @tc.name int8ArrayFindLastIndexPart02Test039
     * @tc.desc Verify findLastIndex expects 3 and $_get(3) stays 99, on Int8Array.of(1, 99, 2, 99, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 99, 2, 99, 3);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(r).assertEqual(3);
      let r1: number = arr.$_get(3);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4000
     * @tc.name int8ArrayFindLastIndexPart02Test040
     * @tc.desc Verify indexOf(33) returns 2 after findLastIndex call does not corrupt array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(11, 22, 33, 44);
      let rIdx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 22);
      expect(rIdx).assertEqual(1);
      let r1: int = arr.indexOf(33);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4100
     * @tc.name int8ArrayFindLastIndexPart02Test041
     * @tc.desc Verify findLastIndex expects 1 and element sum stays 100, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(r).assertEqual(1);
      let r1: number = arr.$_get(0) + arr.$_get(1) + arr.$_get(2) + arr.$_get(3);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4200
     * @tc.name int8ArrayFindLastIndexPart02Test042
     * @tc.desc Verify lastIndexOf(1) returns 4 after findLastIndex call does not corrupt array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 1, 2, 1);
      let rIdx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 2);
      expect(rIdx).assertEqual(3);
      let r1: int = arr.lastIndexOf(1);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4300
     * @tc.name int8ArrayFindLastIndexPart02Test043
     * @tc.desc Verify findLastIndex expects 1 and at(0)/at(-1) elements intact, on Int8Array.of(77, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(77, 2, 3);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 2);
      expect(r).assertEqual(1);
      expect(arr.at(0)).assertEqual(77);
      let arr2 = Int8Array.of(1, 2, 88);
      let r2: int = arr2.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 2);
      expect(r2).assertEqual(1);
      expect(arr2.at(-1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4400
     * @tc.name int8ArrayFindLastIndexPart02Test044
     * @tc.desc Verify findLastIndex expects 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      let rIdx: int = arr.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        a.$_set(0, 99);
        return v === 3;
      });
      expect(rIdx).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4500
     * @tc.name int8ArrayFindLastIndexPart02Test045
     * @tc.desc Verify findLastIndex expects 5, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let capturedLen: int = 0;
      let rIdx: int = arr.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        capturedLen = a.length;
        return v === 3;
      });
      expect(rIdx).assertEqual(2);
      expect(capturedLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4600
     * @tc.name int8ArrayFindLastIndexPart02Test046
     * @tc.desc Verify findLastIndex expects 4 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let capturedBL: int = 0;
      let rIdx: int = arr.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        capturedBL = a.byteLength;
        return v === 20;
      });
      expect(rIdx).assertEqual(1);
      expect(capturedBL).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4700
     * @tc.name int8ArrayFindLastIndexPart02Test047
     * @tc.desc Verify findLastIndex expects 2 from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let capturedBO: int = -1;
      let rIdx: int = arr.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        capturedBO = a.byteOffset;
        return v === 3;
      });
      expect(rIdx).assertEqual(2);
      expect(capturedBO).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4800
     * @tc.name int8ArrayFindLastIndexPart02Test048
     * @tc.desc Verify findLastIndex callback captures buffer.byteLength 3, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let capturedBufBL: int = 0;
      let rIdx: int = arr.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        capturedBufBL = a.buffer.byteLength;
        return v === 2;
      });
      expect(rIdx).assertEqual(1);
      expect(capturedBufBL).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_4900
     * @tc.name int8ArrayFindLastIndexPart02Test049
     * @tc.desc Verify findLastIndex expects 1 when v === 2, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5000
     * @tc.name int8ArrayFindLastIndexPart02Test050
     * @tc.desc Verify findLastIndex expects 4, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      let lastLen: int = 0;
      let rIdx: int = arr.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return false;
        }
        lastLen = a.length;
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(lastLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5100
     * @tc.name int8ArrayFindLastIndexPart02Test051
     * @tc.desc Verify findLastIndex expects 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(11, 22, 33);
      let capturedFirst: number = 0;
      let rIdx: int = arr.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        capturedFirst = a.$_get(0);
        return v === 22;
      });
      expect(rIdx).assertEqual(1);
      expect(capturedFirst).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5200
     * @tc.name int8ArrayFindLastIndexPart02Test052
     * @tc.desc Verify subarray view findLastIndex returns relative index from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(1, 2, 3, 4, 5);
      let view = base.subarray(1, 4);
      let idx: int = view.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5300
     * @tc.name int8ArrayFindLastIndexPart02Test053
     * @tc.desc Verify subarray view findLastIndex captures byteOffset 2 from Int8Array.of(10, 20, 30, 40, 50).subarray(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(10, 20, 30, 40, 50);
      let view = base.subarray(2);
      let capturedBO: int = -1;
      let rIdx: int = view.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        capturedBO = a.byteOffset;
        return v === 40;
      });
      expect(rIdx).assertEqual(1);
      expect(capturedBO).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5400
     * @tc.name int8ArrayFindLastIndexPart02Test054
     * @tc.desc Verify offset ArrayBuffer view findLastIndex returns relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let full: Int8Array = new Int8Array(buf);
      full.$_set(0, 1);
      full.$_set(1, 2);
      full.$_set(2, 3);
      full.$_set(3, 4);
      full.$_set(4, 5);
      full.$_set(5, 6);
      let view: Int8Array = new Int8Array(buf, 2, 3);
      let idx: int = view.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 5);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5500
     * @tc.name int8ArrayFindLastIndexPart02Test055
     * @tc.desc Verify subarray view findLastIndex returns index 0 for element 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(7, 8, 9, 10, 11);
      let view = base.subarray(1, 3);
      let idx: int = view.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 8);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5600
     * @tc.name int8ArrayFindLastIndexPart02Test056
     * @tc.desc Verify findLastIndex callback on subarray(2, 5) receives array length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(1, 2, 3, 4, 5, 6);
      let view = base.subarray(2, 5);
      let capturedLen: int = 0;
      let rIdx: int = view.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        capturedLen = a.length;
        return v === 4;
      });
      expect(rIdx).assertEqual(1);
      expect(capturedLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5700
     * @tc.name int8ArrayFindLastIndexPart02Test057
     * @tc.desc Verify findLastIndex callback on subarray(1, 4) receives buffer byteLength 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(1, 2, 3, 4, 5);
      let view = base.subarray(1, 4);
      let capturedBufBL: int = 0;
      let rIdx: int = view.findLastIndex((v: number, _i: int, a: Int8Array): boolean => {
        capturedBufBL = a.buffer.byteLength;
        return v === 3;
      });
      expect(rIdx).assertEqual(1);
      expect(capturedBufBL).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5800
     * @tc.name int8ArrayFindLastIndexPart02Test058
     * @tc.desc Verify findLastIndex on subarray(2, 5) returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(1, 2, 3, 4, 5, 6, 7);
      let view = base.subarray(2, 5);
      let idx: int = view.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_5900
     * @tc.name int8ArrayFindLastIndexPart02Test059
     * @tc.desc Verify findLastIndex on subarray(1, 4) returns -1 when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(1, 2, 3, 4, 5);
      let view = base.subarray(1, 4);
      let idx: int = view.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6000
     * @tc.name int8ArrayFindLastIndexPart02Test060
     * @tc.desc Verify findLastIndex expects 2 for element 30, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 30);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6100
     * @tc.name int8ArrayFindLastIndexPart02Test061
     * @tc.desc Verify findLastIndex returns -1 when no element matches predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6200
     * @tc.name int8ArrayFindLastIndexPart02Test062
     * @tc.desc Verify findLastIndex expects 3 for last element 99, on Int8Array.of(1, 2, 3, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 99);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6300
     * @tc.name int8ArrayFindLastIndexPart02Test063
     * @tc.desc Verify findLastIndex expects 2 for element 15, on Int8Array.of(5, 10, 15, 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 10, 15, 20);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 15);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6400
     * @tc.name int8ArrayFindLastIndexPart02Test064
     * @tc.desc Verify slice(idx) after findLastIndex(v === 3) has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      let tail: Int8Array = arr.slice(idx);
      expect(tail.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6500
     * @tc.name int8ArrayFindLastIndexPart02Test065
     * @tc.desc Verify findLastIndex returns 0 when value equals INT8_MAX on Int8Array.of(INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(INT8_MAX);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === INT8_MAX);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6600
     * @tc.name int8ArrayFindLastIndexPart02Test066
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(-128, INT8_MAX), returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128, INT8_MAX);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === INT8_MAX);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6700
     * @tc.name int8ArrayFindLastIndexPart02Test067
     * @tc.desc Verify findLastIndex expects 4, on Int8Array.of(-10, 5, -20, 5, -30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-10, 5, -20, 5, -30);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v < 0);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6800
     * @tc.name int8ArrayFindLastIndexPart02Test068
     * @tc.desc Verify findLastIndex expects 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(256);
      for (let i = 0; i < 256; i++) {
        arr.$_set(i, 1);
      }
      arr.$_set(255, 99);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(idx).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_6900
     * @tc.name int8ArrayFindLastIndexPart02Test069
     * @tc.desc Verify findLastIndex expects 0, with $_set(i, 1), on new Int8Array(256)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(256);
      for (let i = 0; i < 256; i++) {
        arr.$_set(i, 1);
      }
      arr.$_set(0, 99);
      let idx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 99);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7000
     * @tc.name int8ArrayFindLastIndexPart02Test070
     * @tc.desc Verify findLastIndex expects 4 on last of three 3s, on Int8Array.of(3, 1, 3, 1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(3, 1, 3, 1, 3);
      let r1: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(r1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7100
     * @tc.name int8ArrayFindLastIndexPart02Test071
     * @tc.desc Verify findLastIndex then findIndex returns expected not polluted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 6, 5, 6, 5);
      let last: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 6);
      let first: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 6);
      expect(last).assertEqual(3);
      expect(first).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7200
     * @tc.name int8ArrayFindLastIndexPart02Test072
     * @tc.desc Verify findLastIndex expects 5 on last of three 2s, on Int8Array.of(1, 2, 1, 2, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 1, 2, 1, 2);
      let r1: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 2);
      expect(r1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7300
     * @tc.name int8ArrayFindLastIndexPart02Test073
     * @tc.desc Verify unique match findLastIndex equals findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let last: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      let first: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(last).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7400
     * @tc.name int8ArrayFindLastIndexPart02Test074
     * @tc.desc Verify findLastIndex(v === 6) minus findIndex(v === 6) equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(6, 1, 6, 1, 6, 1, 6, 1);
      let last: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 6);
      let first: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 6);
      expect(last - first).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7500
     * @tc.name int8ArrayFindLastIndexPart02Test075
     * @tc.desc Verify none match both findLastIndex and findIndex equal -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let last: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 100);
      let first: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v > 100);
      expect(last).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7600
     * @tc.name int8ArrayFindLastIndexPart02Test076
     * @tc.desc Verify findLastIndex and findIndex on empty Int8Array both equal -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let last: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v > 0);
      let first: int = arr.findIndex((v: number, _i: int, _a: Int8Array): boolean => v > 0);
      expect(last).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7700
     * @tc.name int8ArrayFindLastIndexPart02Test077
     * @tc.desc Verify findLastIndex expects 2 and byteOffset stays 0, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      let r: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 3);
      expect(r).assertEqual(2);
      let r1: int = arr.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7800
     * @tc.name int8ArrayFindLastIndexPart02Test078
     * @tc.desc Verify findLastIndex on subarray(2, 5) expects 1 and view byteOffset stays 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(1, 2, 3, 4, 5, 6);
      let view = base.subarray(2, 5);
      let r: int = view.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 4);
      expect(r).assertEqual(1);
      let r1: int = view.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART02_7900
     * @tc.name int8ArrayFindLastIndexPart02Test079
     * @tc.desc Verify findLastIndex expects 20 from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let rIdx: int = arr.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
      expect(rIdx).assertEqual(1);
      let view: Int8Array = new Int8Array(buf);
      expect(view.$_get(1)).assertEqual(20);
    });
  });
}
