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
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayOverviewPart02Test(): void {
  describe('Int32ArrayOverviewPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest001
     * @tc.desc Verify Int32Array.from([0]) instanceof Int32Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [0];
      let a: Int32Array = Int32Array.from(src);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest002
     * @tc.desc Verify subarray(0,0) returns an empty Int32Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let b: Int32Array = a.subarray(0, 0);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest003
     * @tc.desc Verify slice() returns an Int32Array copy with length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let b: Int32Array = a.slice();
      expect(b.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest004
     * @tc.desc Verify manual doubling followed by Int32Array.from returns [2,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let _mapped: number[] = [];
      for (let _i: int = 0; _i < a.length; _i++) {
        _mapped.push(a.$_get(_i) * 2);
      }
      let b: Int32Array = Int32Array.from(_mapped);
      expect(b.$_get(0)).assertEqual(2);
      expect(b.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest005
     * @tc.desc Verify manual filtering followed by Int32Array.from returns [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let _filtered: number[] = [];
      for (let _i: int = 0; _i < a.length; _i++) {
        if (a.$_get(_i) > 1) {
          _filtered.push(a.$_get(_i));
        }
      }
      let b: Int32Array = Int32Array.from(_filtered);
      expect(b.length).assertEqual(2);
      expect(b.$_get(0)).assertEqual(2);
      expect(b.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest006
     * @tc.desc Verify reverse() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let b: Int32Array = a.reverse();
      expect(b).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest007
     * @tc.desc Verify sort() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 1, 2]);
      let b: Int32Array = a.sort();
      expect(b).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest008
     * @tc.desc Verify fill(0) this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let b: Int32Array = a.fill(0);
      expect(b).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest009
     * @tc.desc Verify copyWithin(0,1) this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.copyWithin(0, 1);
      expect(b).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest010
     * @tc.desc Verify valueOf() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let b: Object = a.valueOf();
      expect(b).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest011
     * @tc.desc Verify new Int32Array(0) length 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest012
     * @tc.desc Verify new Int32Array(3) length 3 byteLength 12 4*3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest013
     * @tc.desc Verify new Int32Array(new ArrayBuffer(12)) byteOffset=0 length buffer 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      expect(a.byteOffset).assertEqual(0);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest014
     * @tc.desc Verify (buffer, byteOffset=4, length=2) byteOffset/byteLength/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest015
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest016
     * @tc.desc Verify slice(0,0) length=0 byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.slice(0, 0);
      expect(b.length).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest017
     * @tc.desc Verify slice() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let b: Int32Array = a.slice();
      expect(b.length).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest018
     * @tc.desc Verify subarray(1,3) length 2 end - begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let b: Int32Array = a.subarray(1, 3);
      expect(b.length).assertEqual(2);
      expect(b.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest019
     * @tc.desc Verify subarray(3,1) begin >= end length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let b: Int32Array = a.subarray(3, 1);
      expect(b.length).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest020
     * @tc.desc Verify map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let b: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(b.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest021
     * @tc.desc Verify filter length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v > 100);
      expect(b.length).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest022
     * @tc.desc Verify filter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v >= 0);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest023
     * @tc.desc Verify toReversed() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.toReversed();
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest024
     * @tc.desc Verify with(0, v) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.with(0, 99);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest025
     * @tc.desc Verify from Int32Array length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let c: Int32Array = new Int32Array([3, 4, 5]);
      let merged: Int32Array = Int32Array.from([a.$_get(0), a.$_get(1), c.$_get(0), c.$_get(1), c.$_get(2)]);
      expect(merged.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest026
     * @tc.desc Verify new Int32Array([0]) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0]);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest027
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      a.reverse();
      expect(a.$_get(0)).assertEqual(20);
      expect(a.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest028
     * @tc.desc Verify fill(7) 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(7);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(7);
      expect(a.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest029
     * @tc.desc Verify 2147483647.9 ToInt32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, Double.toInt(2147483647.9));
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest030
     * @tc.desc Verify slice(1,3) 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let b: Int32Array = a.slice(1, 3);
      expect(b.$_get(0)).assertEqual(20);
      expect(b.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest031
     * @tc.desc Verify map(v => v*2) [1,2,3] [2,4,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(b.$_get(0)).assertEqual(2);
      expect(b.$_get(1)).assertEqual(4);
      expect(b.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest032
     * @tc.desc Verify toReversed() [1,2,3] [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.toReversed();
      expect(b.$_get(0)).assertEqual(3);
      expect(b.$_get(1)).assertEqual(2);
      expect(b.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest033
     * @tc.desc Verify with(1, 99) [10,20,30] [10,99,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let b: Int32Array = a.with(1, 99);
      expect(b.$_get(0)).assertEqual(10);
      expect(b.$_get(1)).assertEqual(99);
      expect(b.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest034
     * @tc.desc Verify at(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 6, 7]);
      let last: number | undefined = a.at(a.length - 1);
      expect(last as number).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest035
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 20]);
      expect(a.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest036
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 20]);
      expect(a.lastIndexOf(20)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest037
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      expect(a.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest038
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = a.some((v: number, _i: int, _arr: Int32Array): boolean => v === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest039
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = a.every((v: number, _i: int, _arr: Int32Array): boolean => v > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest040
     * @tc.desc Verify join toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      expect(a.join()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest041
     * @tc.desc Verify toString join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      expect(a.toString()).assertEqual(a.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest042
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let r: number | undefined = a.find((v: number, _i: int, _arr: Int32Array): boolean => v > 15);
      expect(r as number).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest043
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      expect(a.findIndex((v: number, _i: int, _arr: Int32Array): boolean => v > 15)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest044
     * @tc.desc Verify reduce initialValue [1,2,3,4] 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sum: number = a.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest045
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.slice();
      b.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest046
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 10);
      b.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest047
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v > 1);
      b.$_set(0, 77);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest048
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.toReversed();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest049
     * @tc.desc Verify with(index,value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.with(1, 99);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest050
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let c: Int32Array = new Int32Array([3]);
      let merged: Int32Array = Int32Array.from([a.$_get(0), a.$_get(1), c.$_get(0)]);
      merged.$_set(0, 99);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest051
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let snapshot: int[] = [0, 0, 0];
      a.forEach((v: number, i: int, _arr: Int32Array): void => {
        snapshot[i] = Double.toInt(v);
        return;
      });
      expect(a.$_get(0)).assertEqual(1);
      expect(snapshot[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest052
     * @tc.desc Verify some/every length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.some((v: number, _i: int, _arr: Int32Array): boolean => v > 10);
      a.every((v: number, _i: int, _arr: Int32Array): boolean => v > 0);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest053
     * @tc.desc Verify reverse().reverse() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.reverse().reverse();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest054
     * @tc.desc Verify fill(1).fill(2) fill 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(1).fill(2);
      expect(a.$_get(0)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest055
     * @tc.desc Verify sort().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 1, 4, 2]);
      a.sort().reverse();
      expect(a.$_get(0)).assertEqual(4);
      expect(a.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest056
     * @tc.desc Verify copyWithin this $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      a.copyWithin(2, 0).$_set(0, 99);
      expect(a.$_get(0)).assertEqual(99);
      expect(a.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest057
     * @tc.desc Verify fill-sort-reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let ref: Int32Array = a.fill(5);
      expect(ref).assertEqual(a);
      expect(ref.sort()).assertEqual(a);
      expect(ref.reverse()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest058
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let b: Int32Array = a.subarray(1, 3);
      expect(b.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest059
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0, 0]);
      let b: Int32Array = a.subarray(1, 3);
      a.$_set(1, 77);
      expect(b.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest060
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0, 0]);
      let b: Int32Array = a.subarray(1, 3);
      b.$_set(0, 88);
      expect(a.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest061
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.slice();
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest062
     * @tc.desc Verify map buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let b: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(b.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest063
     * @tc.desc Verify ArrayBuffer(12) 0 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let c: Int32Array = new Int32Array(buf, 8, 1);
      a.$_set(1, 55);
      expect(c.$_get(0)).assertEqual(0);
      c.$_set(0, 66);
      expect(a.$_get(1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest064
     * @tc.desc Verify ArrayBuffer 0 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 0, 3);
      a.$_set(0, 111);
      expect(b.$_get(0)).assertEqual(111);
      b.$_set(2, 222);
      expect(a.$_get(2)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest065
     * @tc.desc Verify subarray(0) buffer length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let b: Int32Array = a.subarray(0);
      expect(b.length).assertEqual(a.length);
      expect(b.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest066
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 4, 4);
      let b: Int32Array = a.subarray(1, 3);
      expect(b.byteOffset).assertEqual(8);
      expect(b.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest067
     * @tc.desc Verify reverse ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.reverse();
      expect(b.$_get(0)).assertEqual(4);
      expect(b.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest068
     * @tc.desc Verify fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 0, 3);
      a.fill(9);
      expect(b.$_get(0)).assertEqual(9);
      expect(b.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest069
     * @tc.desc Verify constructor 4 byteOffset=2 RangeError shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 2, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest070
     * @tc.desc Verify filter buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 1);
      b.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest071
     * @tc.desc Verify with() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = a.with(1, 99);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest072
     * @tc.desc Verify reverse() this length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let b: Int32Array = a.reverse();
      expect(b).assertEqual(a);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest073
     * @tc.desc Verify sort() this length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let b: Int32Array = a.sort();
      expect(b).assertEqual(a);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest074
     * @tc.desc Verify fill(0) this length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let b: Int32Array = a.fill(0);
      expect(b).assertEqual(a);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest075
     * @tc.desc Verify slice() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let b: Int32Array = a.slice();
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest076
     * @tc.desc Verify filter() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let b: Int32Array = a.filter((_v: number, _i: int, _arr: Int32Array): boolean => true);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest077
     * @tc.desc Verify some() false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: boolean = a.some((_v: number, _i: int, _arr: Int32Array): boolean => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest078
     * @tc.desc Verify every() true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: boolean = a.every((_v: number, _i: int, _arr: Int32Array): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_7900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest079
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest080
     * @tc.desc Verify indexOf(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8100
     * @tc.name int32ArrayOverviewPart02TestMindmapTest081
     * @tc.desc Verify includes(0) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.includes(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8200
     * @tc.name int32ArrayOverviewPart02TestMindmapTest082
     * @tc.desc Verify at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let v: number | undefined = a.at(0);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8300
     * @tc.name int32ArrayOverviewPart02TestMindmapTest083
     * @tc.desc Verify subarray(0,0) length=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let b: Int32Array = a.subarray(0, 0);
      expect(b.length).assertEqual(0);
      expect(b.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8400
     * @tc.name int32ArrayOverviewPart02TestMindmapTest084
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      a.reverse();
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8500
     * @tc.name int32ArrayOverviewPart02TestMindmapTest085
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let b: Int32Array = a.toReversed();
      expect(b.length).assertEqual(1);
      expect(b.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8600
     * @tc.name int32ArrayOverviewPart02TestMindmapTest086
     * @tc.desc Verify values() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let it = a.values();
      let r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8700
     * @tc.name int32ArrayOverviewPart02TestMindmapTest087
     * @tc.desc Verify keys() [10,20] next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      let it = a.keys();
      let r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8800
     * @tc.name int32ArrayOverviewPart02TestMindmapTest088
     * @tc.desc Verify entries() next().value [index, element] 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      let it = a.entries();
      let r = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_8900
     * @tc.name int32ArrayOverviewPart02TestMindmapTest089
     * @tc.desc Verify $_iterator values() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7, 8, 9]);
      let it = a.values();
      let r = it.next();
      expect(r.value).assertEqual(7);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART02_TEST_MINDMAP_9000
     * @tc.name int32ArrayOverviewPart02TestMindmapTest090
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart02TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let out: int[] = [];
      for (let i: int = 0; i < a.length; i++) {
        out.push(Double.toInt(a.at(i)!));
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual(1);
      expect(out[2]).assertEqual(3);
    });
  });
}
