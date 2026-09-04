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

export default function int32ArrayMapPart02Test(): void {
  describe('Int32ArrayMapPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayMapPart02TestMindmapTest001
     * @tc.desc Verify map(identity callback) returns an Int32Array with unchanged values [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayMapPart02TestMindmapTest002
     * @tc.desc Verify map(multiply-2 callback) returns an Int32Array with values [20,40,60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(1)).assertEqual(40);
      expect(r.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayMapPart02TestMindmapTest003
     * @tc.desc Verify map preserves the single value and returns an Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayMapPart02TestMindmapTest004
     * @tc.desc Verify map returns a two-element result with unchanged values; Also verify verify map return value is not Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);

      {
      let a: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r instanceof Uint8Array).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayMapPart02TestMindmapTest005
     * @tc.desc Verify mapping an empty Int32Array returns zero length and zero byteLength; Also verify verify empty array map returns undefined for at(0) access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);

      {
      let a: Int32Array = new Int32Array(0);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.at(0)).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayMapPart02TestMindmapTest006
     * @tc.desc Verify mapping [42] returns an Int32Array containing [43]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayMapPart02TestMindmapTest007
     * @tc.desc Verify map return BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayMapPart02TestMindmapTest008
     * @tc.desc Verify map return value is not Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayMapPart02TestMindmapTest009
     * @tc.desc Verify multi-element(5) map returns length equal to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayMapPart02TestMindmapTest010
     * @tc.desc Verify single-element map returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([99]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayMapPart02TestMindmapTest011
     * @tc.desc Verify map return length equals source length property (dynamic)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => 0);
      expect(r.length).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayMapPart02TestMindmapTest012
     * @tc.desc Verify all-same-elements array map length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7, 7, 7, 7, 7]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayMapPart02TestMindmapTest013
     * @tc.desc Verify negative-value array map length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, -2, -3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayMapPart02TestMindmapTest014
     * @tc.desc Verify boundary-value(MAX/MIN/0/-1) array map length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647, -2147483648, 0, -1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayMapPart02TestMindmapTest015
     * @tc.desc Verify constant callback map returns same length as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = a.map((_v: number, _i: int, _arr: Int32Array): number => 0);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayMapPart02TestMindmapTest016
     * @tc.desc Verify long array(8) map length stays 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7, 8]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayMapPart02TestMindmapTest017
     * @tc.desc Verify 3-element map returns byteLength 3*4=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayMapPart02TestMindmapTest018
     * @tc.desc Verify 5-element map returns byteLength 5*4=20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(r.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayMapPart02TestMindmapTest019
     * @tc.desc Verify single-element map returns byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayMapPart02TestMindmapTest020
     * @tc.desc Verify map returns byteOffset 0 (newly allocated buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayMapPart02TestMindmapTest021
     * @tc.desc Verify map return buffer.byteLength equals return byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.buffer.byteLength).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayMapPart02TestMindmapTest022
     * @tc.desc Verify map from byteOffset source still returns byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 4);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      a.$_set(3, 44);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayMapPart02TestMindmapTest023
     * @tc.desc Verify map from byteOffset source returns byteLength = sourceLength * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 4, 3);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.byteLength).assertEqual(3 * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayMapPart02TestMindmapTest024
     * @tc.desc Verify modifying map result does not affect source elements; Also verify verify modifying source does not affect already-returned map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(10);

      {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      a.$_set(1, 777);
      expect(r.$_get(1)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayMapPart02TestMindmapTest025
     * @tc.desc Verify source fill does not affect map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      a.fill(0);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayMapPart02TestMindmapTest026
     * @tc.desc Verify map result buffer can be independently written and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.$_set(0, 111);
      r.$_set(1, 222);
      expect(r.$_get(0)).assertEqual(111);
      expect(r.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayMapPart02TestMindmapTest027
     * @tc.desc Verify map from offset view returns independent buffer from underlying buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 8, 3);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.length).assertEqual(3);
      expect(r.buffer).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayMapPart02TestMindmapTest028
     * @tc.desc Verify map result reverse does not affect source order; Also verify verify map result reverse works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.reverse();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);

      {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.reverse();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayMapPart02TestMindmapTest029
     * @tc.desc Verify re-map then modify does not flow back to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r1: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      let r2: Int32Array = r1.map((v: number, _i: int, _arr: Int32Array): number => v * 10);
      r2.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(1);
      expect(r1.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayMapPart02TestMindmapTest030
     * @tc.desc Verify map result sort does not affect source order; Also verify verify map result sort works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.sort();
      expect(a.$_get(0)).assertEqual(3);
      expect(a.$_get(1)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(2);

      {
      let a: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.sort();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayMapPart02TestMindmapTest031
     * @tc.desc Verify identity callback map first element equals source first element; Also verify verify identity callback map last element equals source last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(0)).assertEqual(10);

      {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(r.length - 1)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayMapPart02TestMindmapTest032
     * @tc.desc Verify multiply-2 callback map first element doubled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayMapPart02TestMindmapTest033
     * @tc.desc Verify add-1 callback map single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([41]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayMapPart02TestMindmapTest034
     * @tc.desc Verify constant callback(return 0) map all elements are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = a.map((_v: number, _i: int, _arr: Int32Array): number => 0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayMapPart02TestMindmapTest035
     * @tc.desc Verify identity map of negative array preserves negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-5, -1, -100]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(0)).assertEqual(-5);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayMapPart02TestMindmapTest036
     * @tc.desc Verify identity map of zero-containing array preserves 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 1, 0]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayMapPart02TestMindmapTest037
     * @tc.desc Verify identity map of int32 max value preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647, 0]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayMapPart02TestMindmapTest038
     * @tc.desc Verify identity map of int32 min value preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648, 1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayMapPart02TestMindmapTest039
     * @tc.desc Verify identity map of -1 array preserves -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, 0, -1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayMapPart02TestMindmapTest040
     * @tc.desc Verify negate callback map positive to negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => -v);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(-2);
      expect(r.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayMapPart02TestMindmapTest041
     * @tc.desc Verify negate callback map negative to positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-10, -20]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => -v);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayMapPart02TestMindmapTest042
     * @tc.desc Verify all-same-elements map result consistent with transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7, 7, 7]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(r.$_get(0)).assertEqual(8);
      expect(r.$_get(1)).assertEqual(8);
      expect(r.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayMapPart02TestMindmapTest043
     * @tc.desc Verify source length unchanged after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayMapPart02TestMindmapTest044
     * @tc.desc Verify source first element unchanged after map call; Also verify verify source last element unchanged after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      a.map((v: number, _i: int, _arr: Int32Array): number => v + 999);
      expect(a.$_get(0)).assertEqual(10);

      {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.map((v: number, _i: int, _arr: Int32Array): number => -v);
      expect(a.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayMapPart02TestMindmapTest045
     * @tc.desc Verify source middle elements unchanged after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      a.map((v: number, _i: int, _arr: Int32Array): number => 0);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayMapPart02TestMindmapTest046
     * @tc.desc Verify source MAX value retained after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647, 0]);
      a.map((v: number, _i: int, _arr: Int32Array): number => 0);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayMapPart02TestMindmapTest047
     * @tc.desc Verify source MIN value retained after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648, 1]);
      a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayMapPart02TestMindmapTest048
     * @tc.desc Verify empty array length stays 0 after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayMapPart02TestMindmapTest049
     * @tc.desc Verify source buffer.byteLength unchanged after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let origByteLen: number = a.buffer.byteLength;
      a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(a.buffer.byteLength).assertEqual(origByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayMapPart02TestMindmapTest050
     * @tc.desc Verify source byteOffset unchanged after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 3);
      a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(a.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayMapPart02TestMindmapTest051
     * @tc.desc Verify all source elements preserved element-by-element after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 10, 15, 20, 25]);
      a.map((v: number, _i: int, _arr: Int32Array): number => v * 100);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(1)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(15);
      expect(a.$_get(3)).assertEqual(20);
      expect(a.$_get(4)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayMapPart02TestMindmapTest052
     * @tc.desc Verify offset view elements unchanged after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 4, 3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      a.map((v: number, _i: int, _arr: Int32Array): number => v + 1000);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(1)).assertEqual(22);
      expect(a.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayMapPart02TestMindmapTest053
     * @tc.desc Verify single-element array unchanged after map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([77]);
      a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(a.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayMapPart02TestMindmapTest054
     * @tc.desc Verify chained map calls produce correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2)
                             .map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(5);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayMapPart02TestMindmapTest055
     * @tc.desc Verify map result fill does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.fill(0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayMapPart02TestMindmapTest056
     * @tc.desc Verify map result forEach iteration matches map result values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      let sum: number = 0;
      r.forEach((v: number, _i: int, _arr: Int32Array): void => { sum += v; });
      expect(sum).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayMapPart02TestMindmapTest057
     * @tc.desc Verify empty array map result forEach does not execute callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      let count: number = 0;
      r.forEach((_v: number, _i: int, _arr: Int32Array): void => { count++; });
      expect(count).assertEqual(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayMapPart02TestMindmapTest058
     * @tc.desc Verify map result supports $_set/$_get read/write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.$_set(0, 100);
      r.$_set(1, 200);
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(200);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayMapPart02TestMindmapTest059
     * @tc.desc Verify map result buffer can construct new Int32Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 10);
      let v: Int32Array = new Int32Array(r.buffer);
      expect(v.length).assertEqual(3);
      expect(v.$_get(0)).assertEqual(10);
      expect(v.$_get(1)).assertEqual(20);
      expect(v.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayMapPart02TestMindmapTest060
     * @tc.desc Verify map result subarray generates correct sub-view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      let sub: Int32Array = r.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(20);
      expect(sub.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayMapPart02TestMindmapTest061
     * @tc.desc Verify map result slice generates independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      let s: Int32Array = r.slice();
      s.$_set(0, 999);
      expect(r.$_get(0)).assertEqual(1);
      expect(s.$_get(0)).assertEqual(999);
    });
  });
}
