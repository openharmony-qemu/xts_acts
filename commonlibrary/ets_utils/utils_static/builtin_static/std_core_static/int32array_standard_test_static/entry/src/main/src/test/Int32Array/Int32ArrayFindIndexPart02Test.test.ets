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
export default function int32ArrayFindIndexPart02Test(): void {
  describe('Int32ArrayFindIndexPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0100
     * @tc.name int32ArrayFindIndexPart02Test001
       * @tc.desc Verify findIndex returns index 1 when element matches at position 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: int = arr.findIndex((v: number): boolean => v === 20);
       expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0200
     * @tc.name int32ArrayFindIndexPart02Test002
     * @tc.desc Verify findIndex returns -1 when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: int = arr.findIndex((v: number): boolean => v === 999);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0300
     * @tc.name int32ArrayFindIndexPart02Test003
     * @tc.desc Verify findIndex returns -1 on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let result: int = arr.findIndex((v: number): boolean => true);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0400
     * @tc.name int32ArrayFindIndexPart02Test004
     * @tc.desc Verify findIndex return value is not Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let result: int = arr.findIndex((v: number): boolean => v === 6);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0500
     * @tc.name int32ArrayFindIndexPart02Test005
     * @tc.desc Verify findIndex return value is not Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: int = arr.findIndex((v: number): boolean => v === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0600
     * @tc.name int32ArrayFindIndexPart02Test006
     * @tc.desc Verify findIndex hit path returns valid index not null sentinel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200]);
      let result: int = arr.findIndex((v: number): boolean => v === 100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0700
     * @tc.name int32ArrayFindIndexPart02Test007
     * @tc.desc Verify findIndex miss returns -1 not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let result: int = arr.findIndex((v: number): boolean => v === 888);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0800
     * @tc.name int32ArrayFindIndexPart02Test008
     * @tc.desc Verify findIndex returns 0 when first element is INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0]);
      let result: int = arr.findIndex((v: number): boolean => v === 2147483647);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_0900
     * @tc.name int32ArrayFindIndexPart02Test009
     * @tc.desc Verify findIndex hit first element returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let result: int = arr.findIndex((v: number): boolean => v === 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1000
     * @tc.name int32ArrayFindIndexPart02Test010
     * @tc.desc Verify findIndex hit middle element returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let result: int = arr.findIndex((v: number): boolean => v === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1100
     * @tc.name int32ArrayFindIndexPart02Test011
     * @tc.desc Verify findIndex hit last element returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: int = arr.findIndex((v: number): boolean => v === 5);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1200
     * @tc.name int32ArrayFindIndexPart02Test012
     * @tc.desc Verify single-element array hit returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result: int = arr.findIndex((v: number): boolean => v === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1300
     * @tc.name int32ArrayFindIndexPart02Test013
     * @tc.desc Verify two-element array hit second returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let result: int = arr.findIndex((v: number): boolean => v === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1400
     * @tc.name int32ArrayFindIndexPart02Test014
     * @tc.desc Verify duplicated values findIndex returns first hit index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 2, 1]);
      let result: int = arr.findIndex((v: number): boolean => v === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1500
     * @tc.name int32ArrayFindIndexPart02Test015
     * @tc.desc Verify findIndex hit negative value (-5) returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, (-5), 10]);
      let result: int = arr.findIndex((v: number): boolean => v === (-5));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1600
     * @tc.name int32ArrayFindIndexPart02Test016
     * @tc.desc Verify findIndex hit zero element in middle returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 2]);
      let result: int = arr.findIndex((v: number): boolean => v === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1700
     * @tc.name int32ArrayFindIndexPart02Test017
     * @tc.desc Verify findIndex hit -1 element returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, (-1), 1]);
      let result: int = arr.findIndex((v: number): boolean => v === (-1));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1800
     * @tc.name int32ArrayFindIndexPart02Test018
     * @tc.desc Verify findIndex hit INT32_MAX at first position returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, 1]);
      let result: int = arr.findIndex((v: number): boolean => v === 2147483647);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_1900
     * @tc.name int32ArrayFindIndexPart02Test019
     * @tc.desc Verify findIndex hit INT32_MIN in middle returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, (-2147483648), 1]);
      let result: int = arr.findIndex((v: number): boolean => v === (-2147483648));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2000
     * @tc.name int32ArrayFindIndexPart02Test020
     * @tc.desc Verify positive array find nonexistent value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: int = arr.findIndex((v: number): boolean => v === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2100
     * @tc.name int32ArrayFindIndexPart02Test021
     * @tc.desc Verify negative array find nonexistent value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([(-1), (-2), (-3)]);
      let result: int = a.findIndex((v: number): boolean => v === (-99));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2200
     * @tc.name int32ArrayFindIndexPart02Test022
     * @tc.desc Verify predicate always false traverses all elements returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2300
     * @tc.name int32ArrayFindIndexPart02Test023
     * @tc.desc Verify findIndex returns -1 when no element matches predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: int = arr.findIndex((v: number): boolean => v > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2400
     * @tc.name int32ArrayFindIndexPart02Test024
     * @tc.desc Verify single-element array find different value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result: int = arr.findIndex((v: number): boolean => v === 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2500
     * @tc.name int32ArrayFindIndexPart02Test025
     * @tc.desc Verify all-positive array find negative returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let result: int = arr.findIndex((v: number): boolean => v === (-1));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2600
     * @tc.name int32ArrayFindIndexPart02Test026
     * @tc.desc Verify length-constructor all-zero array find nonzero returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let result: int = arr.findIndex((v: number): boolean => v === 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2700
     * @tc.name int32ArrayFindIndexPart02Test027
     * @tc.desc Verify miss returns -1 which is not a valid index (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: int = arr.findIndex((v: number): boolean => false);
      let isValidIdx: boolean = result >= 0 && result < arr.length;
      expect(isValidIdx).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2800
     * @tc.name int32ArrayFindIndexPart02Test028
     * @tc.desc Verify index returned by findIndex reads matched value via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let idx: int = arr.findIndex((v: number): boolean => v === 33);
      expect(arr.$_get(idx)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_2900
     * @tc.name int32ArrayFindIndexPart02Test029
     * @tc.desc Verify index 0 from findIndex reads first element via $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77, 88, 99]);
      let idx: int = arr.findIndex((v: number): boolean => v === 77);
      expect(arr.$_get(idx)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3000
     * @tc.name int32ArrayFindIndexPart02Test030
     * @tc.desc Verify index length-1 reads last element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let idx: int = arr.findIndex((v: number): boolean => v === 5);
      expect(arr.$_get(idx)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3100
     * @tc.name int32ArrayFindIndexPart02Test031
     * @tc.desc Verify returned index passed to at() reads matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let idx: int = arr.findIndex((v: number): boolean => v === 20);
      let val: number | undefined = arr.at(idx);
      expect(val).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3200
     * @tc.name int32ArrayFindIndexPart02Test032
     * @tc.desc Verify length unchanged after findIndex hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number): boolean => v === 3);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3300
     * @tc.name int32ArrayFindIndexPart02Test033
     * @tc.desc Verify length unchanged after findIndex miss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number): boolean => v === 999);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3400
     * @tc.name int32ArrayFindIndexPart02Test034
     * @tc.desc Verify empty array length stays 0 after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.findIndex((v: number): boolean => true);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3500
     * @tc.name int32ArrayFindIndexPart02Test035
     * @tc.desc Verify byteLength unchanged after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let blBefore: number = arr.byteLength;
      arr.findIndex((v: number): boolean => v === 2);
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3600
     * @tc.name int32ArrayFindIndexPart02Test036
     * @tc.desc Verify byteOffset unchanged after findIndex on offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let offBefore: number = arr.byteOffset;
      arr.findIndex((v: number, i: int): boolean => i === 0);
      expect(arr.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3700
     * @tc.name int32ArrayFindIndexPart02Test037
     * @tc.desc Verify BYTES_PER_ELEMENT stays 4 after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.findIndex((v: number): boolean => v === 2);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3800
     * @tc.name int32ArrayFindIndexPart02Test038
     * @tc.desc Verify byteOffset=8 view byteLength stays elements*4 after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.findIndex((v: number): boolean => v === 2);
      expect(arr.byteLength).assertEqual(12);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_3900
     * @tc.name int32ArrayFindIndexPart02Test039
     * @tc.desc Verify first element unchanged after findIndex hit middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.findIndex((v: number): boolean => v === 20);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4000
     * @tc.name int32ArrayFindIndexPart02Test040
     * @tc.desc Verify hit-position element value unchanged after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.findIndex((v: number): boolean => v === 20);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4100
     * @tc.name int32ArrayFindIndexPart02Test041
     * @tc.desc Verify last element unchanged after findIndex hit middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.findIndex((v: number): boolean => v === 20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4200
     * @tc.name int32ArrayFindIndexPart02Test042
     * @tc.desc Verify all elements unchanged after findIndex miss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.findIndex((v: number): boolean => v === 999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4300
     * @tc.name int32ArrayFindIndexPart02Test043
     * @tc.desc Verify INT32_MAX/MIN elements undisturbed after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([(-2147483648), 0, 2147483647]);
      arr.findIndex((v: number): boolean => v === 0);
      expect(arr.$_get(0)).assertEqual((-2147483648));
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4400
     * @tc.name int32ArrayFindIndexPart02Test044
     * @tc.desc Verify length-constructor all-zero array stays zero after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.findIndex((v: number): boolean => v === 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4500
     * @tc.name int32ArrayFindIndexPart02Test045
     * @tc.desc Verify short-circuit on first hit leaves subsequent elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.findIndex((v: number): boolean => v === 1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4600
     * @tc.name int32ArrayFindIndexPart02Test046
     * @tc.desc Verify findIndex does not detach buffer (set/get still work)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.findIndex((v: number): boolean => v === 2);
      arr.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4700
     * @tc.name int32ArrayFindIndexPart02Test047
     * @tc.desc Verify callback-observed values match $_get after traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let captured: number[] = [];
      arr.findIndex((v: number, i: int): boolean => {
        captured.push(v);
        return false;
      });
      expect(captured.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(captured[0]);
      expect(arr.$_get(1)).assertEqual(captured[1]);
      expect(arr.$_get(2)).assertEqual(captured[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4800
     * @tc.name int32ArrayFindIndexPart02Test048
     * @tc.desc Verify findIndex does not replace underlying ArrayBuffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.findIndex((v: number): boolean => v === 0);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_4900
     * @tc.name int32ArrayFindIndexPart02Test049
     * @tc.desc Verify ArrayBuffer.byteLength unchanged after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      arr.findIndex((v: number): boolean => v === 0);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5000
     * @tc.name int32ArrayFindIndexPart02Test050
     * @tc.desc Verify shared buffer: $_set in callback visible via sibling view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a1: Int32Array = new Int32Array(buf);
      let a2: Int32Array = new Int32Array(buf);
      let idx: int = a1.findIndex((v: number, i: int, a: Int32Array): boolean => {
        a.$_set(0, 77);
        return true;
      });
      expect(idx).assertEqual(0);
      expect(a2.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5100
     * @tc.name int32ArrayFindIndexPart02Test051
     * @tc.desc Verify ArrayBuffer.isView returns true after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.findIndex((v: number): boolean => v === 2);
      let isView: boolean = ArrayBuffer.isView(arr);
      expect(isView).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5200
     * @tc.name int32ArrayFindIndexPart02Test052
     * @tc.desc Verify subarray child view shares parent buffer after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(1, 4);
      child.findIndex((v: number): boolean => v === 3);
      expect(child.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5300
     * @tc.name int32ArrayFindIndexPart02Test053
     * @tc.desc Verify subarray findIndex returns relative index (child-local)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let child: Int32Array = parent.subarray(2, 5);
      let result: int = child.findIndex((v: number): boolean => v === 40);
      expect(result).assertEqual(1);
      expect(child.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5400
     * @tc.name int32ArrayFindIndexPart02Test054
     * @tc.desc Verify subarray child byteLength is elements*4 after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(1, 4);
      child.findIndex((v: number): boolean => v === 4);
      expect(child.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5500
     * @tc.name int32ArrayFindIndexPart02Test055
     * @tc.desc Verify slice() copy: $_set in callback does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Int32Array = new Int32Array([10, 20, 30]);
      let cp: Int32Array = original.slice();
      let idx: int = cp.findIndex((v: number, i: int, a: Int32Array): boolean => {
        a.$_set(0, 999);
        return true;
      });
      expect(idx).assertEqual(0);
      expect(cp.$_get(0)).assertEqual(999);
      expect(original.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5600
     * @tc.name int32ArrayFindIndexPart02Test056
     * @tc.desc Verify Int32Array.of constructed buffer reference unchanged after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      let bufBefore: ArrayBuffer = arr.buffer;
      let idx: int = arr.findIndex((v: number): boolean => v === 7);
      expect(idx).assertEqual(2);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5700
     * @tc.name int32ArrayFindIndexPart02Test057
     * @tc.desc Verify two Int32Array.of arrays have independent buffers after findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.of(1, 2, 3);
      let a2: Int32Array = Int32Array.of(1, 2, 3);
      a1.findIndex((v: number): boolean => v === 2);
      let buffersDiffer: boolean = a1.buffer !== a2.buffer;
      expect(buffersDiffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5800
     * @tc.name int32ArrayFindIndexPart02Test058
     * @tc.desc Verify copy-constructed (new Int32Array(src)) has independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([10, 20, 30]);
      let dst: Int32Array = new Int32Array(src);
      dst.findIndex((v: number): boolean => v === 20);
      let buffersDiffer: boolean = dst.buffer !== src.buffer;
      expect(buffersDiffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_5900
     * @tc.name int32ArrayFindIndexPart02Test059
     * @tc.desc Verify offset view findIndex does not disturb parent buffer prefix data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 100);
      let part: Int32Array = new Int32Array(buf, 4, 2);
      part.$_set(0, 200);
      part.$_set(1, 300);
      part.findIndex((v: number): boolean => v === 300);
      expect(full.$_get(0)).assertEqual(100);
      expect(full.$_get(1)).assertEqual(200);
      expect(full.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6000
     * @tc.name int32ArrayFindIndexPart02Test060
     * @tc.desc Verify miss returns -1; result + 1 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: int = arr.findIndex((v: number): boolean => v === 99);
      expect(result + 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6100
     * @tc.name int32ArrayFindIndexPart02Test061
     * @tc.desc Verify two identical-predicate calls return same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 10, 15, 20]);
      let r1: int = arr.findIndex((v: number): boolean => v === 15);
      let r2: int = arr.findIndex((v: number): boolean => v === 15);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6200
     * @tc.name int32ArrayFindIndexPart02Test062
     * @tc.desc Verify two different predicates return different indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r1: int = arr.findIndex((v: number): boolean => v === 2);
      let r2: int = arr.findIndex((v: number): boolean => v === 4);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6300
     * @tc.name int32ArrayFindIndexPart02Test063
     * @tc.desc Verify nested findIndex inside predicate works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let other: Int32Array = new Int32Array([20, 40, 60]);
      let result: int = arr.findIndex((v: number): boolean => {
        let oIdx: int = other.findIndex((ov: number): boolean => ov === (v as number));
        return oIdx !== (-1);
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6400
     * @tc.name int32ArrayFindIndexPart02Test064
     * @tc.desc Verify returned index is present in keys() iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 14, 21, 28]);
      let idx: int = arr.findIndex((v: number): boolean => v === 21);
      let found: boolean = false;
      for (const k of arr.keys()) {
        if (k === idx) {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6500
     * @tc.name int32ArrayFindIndexPart02Test065
     * @tc.desc Verify Int32Array.from constructed array findIndex returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([5, 10, 15]);
      let result: int = arr.findIndex((v: number): boolean => v === 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6600
     * @tc.name int32ArrayFindIndexPart02Test066
     * @tc.desc Verify Int32Array.of constructed array findIndex returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      let result: int = arr.findIndex((v: number): boolean => v === 300);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6700
     * @tc.name int32ArrayFindIndexPart02Test067
     * @tc.desc Verify default-offset ArrayBuffer view findIndex returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      let result: int = arr.findIndex((v: number): boolean => v === 22);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6800
     * @tc.name int32ArrayFindIndexPart02Test068
     * @tc.desc Verify single-element ArrayBuffer view findIndex hit returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 55);
      let result: int = arr.findIndex((v: number): boolean => v === 55);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_6900
     * @tc.name int32ArrayFindIndexPart02Test069
     * @tc.desc Verify single-element ArrayBuffer view findIndex miss returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 55);
      let result: int = arr.findIndex((v: number): boolean => v === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7000
     * @tc.name int32ArrayFindIndexPart02Test070
     * @tc.desc Verify TypedArray copy-constructed findIndex returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([10, 20, 30]);
      let dst: Int32Array = new Int32Array(src);
      let result: int = dst.findIndex((v: number): boolean => v === 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7100
     * @tc.name int32ArrayFindIndexPart02Test071
     * @tc.desc Verify all-same elements findIndex always returns 0 (first hit short-circuit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let result: int = arr.findIndex((v: number): boolean => v === 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7200
     * @tc.name int32ArrayFindIndexPart02Test072
     * @tc.desc Verify all-zero array findIndex returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let result: int = arr.findIndex((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7300
     * @tc.name int32ArrayFindIndexPart02Test073
     * @tc.desc Verify callback value parameter typeof is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let vType: string = '';
      arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
        vType = typeof v;
        return true;
      });
      expect(vType).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7400
     * @tc.name int32ArrayFindIndexPart02Test074
     * @tc.desc Verify callback index parameter typeof is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let iType: string = '';
      arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
        iType = typeof i;
        return true;
      });
      expect(iType).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7500
     * @tc.name int32ArrayFindIndexPart02Test075
     * @tc.desc Verify callback array parameter is Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let sameRef: boolean = false;
      arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
        sameRef = a === arr;
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7600
     * @tc.name int32ArrayFindIndexPart02Test076
     * @tc.desc Verify findIndex callback receives correct index for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let capturedIndices: int[] = [];
      arr.findIndex((_v: number, i: int, _a: Int32Array): boolean => {
        capturedIndices.push(i);
        return false;
      });
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
      expect(capturedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7700
     * @tc.name int32ArrayFindIndexPart02Test077
     * @tc.desc Verify callback value matches array.$_get(i) at every position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 6, 9, 12]);
      let allMatch: boolean = true;
      arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
        if (v !== a.$_get(i)) {
          allMatch = false;
        }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7800
     * @tc.name int32ArrayFindIndexPart02Test078
     * @tc.desc Verify first-element short-circuit calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      let result: int = arr.findIndex((v: number, i: int): boolean => {
        callCount = callCount + 1;
        return v === 1;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_7900
     * @tc.name int32ArrayFindIndexPart02Test079
     * @tc.desc Verify middle-element short-circuit calls callback index+1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let callCount: int = 0;
      let result: int = arr.findIndex((v: number, i: int): boolean => {
        callCount = callCount + 1;
        return i === 2;
      });
      expect(result).assertEqual(2);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_8000
     * @tc.name int32ArrayFindIndexPart02Test080
     * @tc.desc Verify miss path calls callback exactly length times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let callCount: int = 0;
      let result: int = arr.findIndex((v: number, i: int): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_8100
     * @tc.name int32ArrayFindIndexPart02Test081
     * @tc.desc Verify empty array invokes callback zero times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let callCount: int = 0;
      let result: int = arr.findIndex((v: number, i: int): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_8200
     * @tc.name int32ArrayFindIndexPart02Test082
     * @tc.desc Verify length-100 array hit at index 49 returns 49 and value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: int[] = [];
      for (let i: int = 0; i < 100; i = i + 1) {
        data.push(i * 2);
      }
      let arr: Int32Array = new Int32Array(data);
      let result: int = arr.findIndex((v: number, i: int): boolean => i === 49);
      expect(result).assertEqual(49);
      expect(arr.$_get(49)).assertEqual(98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_8300
     * @tc.name int32ArrayFindIndexPart02Test083
     * @tc.desc Verify length-100 array miss calls callback 100 times returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: int[] = [];
      for (let i: int = 0; i < 100; i = i + 1) {
        data.push(i);
      }
      let arr: Int32Array = new Int32Array(data);
      let count: int = 0;
      let result: int = arr.findIndex((v: number, i: int): boolean => {
        count = count + 1;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART02_8400
     * @tc.name int32ArrayFindIndexPart02Test084
     * @tc.desc Verify returned index is an integer (bitwise OR with 0 preserves identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindIndexPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: int = arr.findIndex((v: number): boolean => v === 4);
      expect(result).assertEqual(result | 0);
    });
  });
}
