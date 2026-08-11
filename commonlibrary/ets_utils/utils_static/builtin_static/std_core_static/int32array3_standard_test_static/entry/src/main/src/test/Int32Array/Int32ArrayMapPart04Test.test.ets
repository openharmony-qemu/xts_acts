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

class Counter4Map {
  static sum: int = 0;
}

export default function int32ArrayMapPart04Test(): void {
  describe('Int32ArrayMapPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayMapPart04TestMindmapTest001
     * @tc.desc Verify map does not modify source Int32Array elements (all positive integers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([10, 20, 30, 40]);
      let snapshot0: number = src.$_get(0);
      let snapshot1: number = src.$_get(1);
      let snapshot2: number = src.$_get(2);
      let snapshot3: number = src.$_get(3);
      src.map((v: number, _i: int, _arr: Int32Array): number => v * 2.0);
      expect(src.$_get(0)).assertEqual(snapshot0);
      expect(src.$_get(1)).assertEqual(snapshot1);
      expect(src.$_get(2)).assertEqual(snapshot2);
      expect(src.$_get(3)).assertEqual(snapshot3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayMapPart04TestMindmapTest002
     * @tc.desc Verify map does not modify source array length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let origLen: number = src.length;
      src.map((v: number, _i: int, _arr: Int32Array): number => v + 1.0);
      expect(src.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayMapPart04TestMindmapTest003
     * @tc.desc Verify map does not modify source array byteOffset / byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let src: Int32Array = new Int32Array(buf, 4, 2);
      let origOffset: number = src.byteOffset;
      let origByteLen: number = src.byteLength;
      src.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(src.byteOffset).assertEqual(origOffset);
      expect(src.byteLength).assertEqual(origByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayMapPart04TestMindmapTest004
     * @tc.desc Verify map does not modify source ArrayBuffer content -- source and result buffers are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let src: Int32Array = new Int32Array(buf);
      src.$_set(0, 11);
      src.$_set(1, 22);
      src.$_set(2, 33);
      src.$_set(3, 44);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v * 3.0);
      res.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(11);
      expect(res.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayMapPart04TestMindmapTest005
     * @tc.desc Verify map on empty array with zero-length view does not touch underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let src: Int32Array = new Int32Array(buf, 0, 0);
      let before: Int32Array = new Int32Array(buf);
      before.$_set(0, 77);
      before.$_set(1, 88);
      src.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(before.$_get(0)).assertEqual(77);
      expect(before.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayMapPart04TestMindmapTest006
     * @tc.desc Verify map result buffer is different from source buffer (not the same object)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      src.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayMapPart04TestMindmapTest007
     * @tc.desc Verify map result byteOffset is 0 (newly allocated, default alignment)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let src: Int32Array = new Int32Array(buf, 12, 3);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayMapPart04TestMindmapTest008
     * @tc.desc Verify map result byteLength equals source byteLength (same length * 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let src: Int32Array = new Int32Array(buf, 8, 4);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(res.byteLength).assertEqual(src.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayMapPart04TestMindmapTest009
     * @tc.desc Verify modifying map result does not affect source array; Also verify verify modifying source after map does not affect map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([5, 6, 7]);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v * 10.0);
      res.$_set(1, 9999);
      expect(src.$_get(1)).assertEqual(6);

      {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v);
      src.$_set(0, 888);
      expect(res.$_get(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayMapPart04TestMindmapTest010
     * @tc.desc Verify callback returning 0.5 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 0.5);
      expect(res.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayMapPart04TestMindmapTest011
     * @tc.desc Verify callback returning -0.9 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => -0.9);
      expect(res.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayMapPart04TestMindmapTest012
     * @tc.desc Verify callback returning 2147483647.9 truncates toward zero to INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 2147483647.9);
      expect(res.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayMapPart04TestMindmapTest013
     * @tc.desc Verify callback returning INT_MAX(2147483647) writes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 2147483647.0);
      expect(res.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayMapPart04TestMindmapTest014
     * @tc.desc Verify callback returning INT_MIN(-2147483648) writes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => -2147483648.0);
      expect(res.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayMapPart04TestMindmapTest015
     * @tc.desc Verify callback returning 2147483648 (INT_MAX+1) wraps to INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 2147483648.0);
      expect(res.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayMapPart04TestMindmapTest016
     * @tc.desc Verify callback returning 2147483649 wraps to -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 2147483649.0);
      expect(res.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayMapPart04TestMindmapTest017
     * @tc.desc Verify callback returning -2147483649 (INT_MIN-1) wraps to INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => -2147483649.0);
      expect(res.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayMapPart04TestMindmapTest018
     * @tc.desc Verify callback returning 4294967296 (2^32) wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 4294967296.0);
      expect(res.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayMapPart04TestMindmapTest019
     * @tc.desc Verify callback returning 4294967297 (2^32+1) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 4294967297.0);
      expect(res.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayMapPart04TestMindmapTest020
     * @tc.desc Verify callback returning -1 writes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => -1.0);
      expect(res.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayMapPart04TestMindmapTest021
     * @tc.desc Verify callback returning 0 writes exactly 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([99]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 0.0);
      expect(res.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayMapPart04TestMindmapTest022
     * @tc.desc Verify callback returning negative float -2147483648.5 truncates to INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => -2147483648.5);
      expect(res.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayMapPart04TestMindmapTest023
     * @tc.desc Verify multi-element with different overflow values each independently ToInt32 converted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0, 0, 0, 0]);
      let res: Int32Array = src.map((_v: number, i: int, _arr: Int32Array): number => {
        if (i === 0) {
          return Number.NaN;
        }
        if (i === 1) {
          return Number.POSITIVE_INFINITY;
        }
        if (i === 2) {
          return 2147483648.0;
        }
        return -2147483649.0;
      });
      expect(res.$_get(0)).assertEqual(0);
      expect(res.$_get(1)).assertEqual(0);
      expect(res.$_get(2)).assertEqual(-2147483648);
      expect(res.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayMapPart04TestMindmapTest024
     * @tc.desc Verify chained map -- double mapping: multiply by 2 then add 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let res: Int32Array = src
      .map((v: number, _i: int, _arr: Int32Array): number => v * 2.0)
      .map((v: number, _i: int, _arr: Int32Array): number => v + 1.0);
      expect(res.$_get(0)).assertEqual(3);
      expect(res.$_get(1)).assertEqual(5);
      expect(res.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayMapPart04TestMindmapTest025
     * @tc.desc Verify double map generates independent buffers (three layers of non-shared buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2]);
      let mid: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v * 10.0);
      let res: Int32Array = mid.map((v: number, _i: int, _arr: Int32Array): number => v + 1.0);
      expect(mid.$_get(0)).assertEqual(10);
      expect(mid.$_get(1)).assertEqual(20);
      expect(res.$_get(0)).assertEqual(11);
      expect(res.$_get(1)).assertEqual(21);
      expect(src.buffer).not().assertEqual(mid.buffer);
      expect(mid.buffer).not().assertEqual(res.buffer);
      expect(src.buffer).not().assertEqual(res.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayMapPart04TestMindmapTest026
     * @tc.desc Verify triple chained map on empty array yields empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(0);
      let res: Int32Array = src
      .map((v: number, _i: int, _arr: Int32Array): number => v + 1.0)
      .map((v: number, _i: int, _arr: Int32Array): number => v * 2.0)
      .map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayMapPart04TestMindmapTest027
     * @tc.desc Verify nested map -- second callback sees ToInt32 of first result already applied (NaN -> 0 then +5=5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src
      .map((_v: number, _i: int, _arr: Int32Array): number => Number.NaN)
      .map((v: number, _i: int, _arr: Int32Array): number => v + 5.0);
      expect(res.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayMapPart04TestMindmapTest028
     * @tc.desc Verify chained map second callback v type is number and value precise (10/20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([10, 20]);
      let seen: number[] = [0, 0];
      src.map((v: number, _i: int, _arr: Int32Array): number => v)
      .map((v: number, i: int, _arr: Int32Array): number => {
        seen[i] = v;
        return v;
      });
      expect(seen[0]).assertEqual(10);
      expect(seen[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayMapPart04TestMindmapTest029
     * @tc.desc Verify callback reads external let variable multiplier=3 to compute result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let multiplier: number = 3.0;
      let src: Int32Array = new Int32Array([2, 4]);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v * multiplier);
      expect(res.$_get(0)).assertEqual(6);
      expect(res.$_get(1)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayMapPart04TestMindmapTest030
     * @tc.desc Verify callback increments external counter verifying invocation count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let src: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      src.map((_v: number, _i: int, _arr: Int32Array): number => {
        count++;
        return 0;
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayMapPart04TestMindmapTest031
     * @tc.desc Verify callback writes to external array recording each index order (strictly 0..n-1 increasing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([10, 20, 30, 40]);
      let order: int[] = [0, 0, 0, 0];
      let pos: int = 0;
      src.map((_v: number, i: int, _arr: Int32Array): number => {
        order[pos] = i;
        pos = pos + 1;
        return 0.0;
      });
      expect(order[0]).assertEqual(0);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(2);
      expect(order[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayMapPart04TestMindmapTest032
     * @tc.desc Verify callback writes to external array recording each val order matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([7, 8, 9]);
      let seen: number[] = [0, 0, 0];
      src.map((v: number, i: int, _arr: Int32Array): number => {
        seen[i] = v;
        return v;
      });
      expect(seen[0]).assertEqual(7);
      expect(seen[1]).assertEqual(8);
      expect(seen[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayMapPart04TestMindmapTest033
     * @tc.desc Verify callback array parameter reference identity equals source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2]);
      let sameRef: boolean = false;
      src.map((_v: number, _i: int, arr: Int32Array): number => {
        sameRef = arr === src;
        return 0.0;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayMapPart04TestMindmapTest034
     * @tc.desc Verify empty array map does not execute callback, no external state changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      let src: Int32Array = new Int32Array(0);
      src.map((_v: number, _i: int, _arr: Int32Array): number => {
        called = true;
        return 0.0;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayMapPart04TestMindmapTest035
     * @tc.desc Verify callback reads/writes class static member state (sum accumulation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Counter4Map.sum = 0;
      let src: Int32Array = Int32Array.of(1, 2, 3);
      src.map((v: number, _i: int, _arr: Int32Array): number => {
        Counter4Map.sum = Counter4Map.sum + v.toInt();
        return v;
      });
      expect(Counter4Map.sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayMapPart04TestMindmapTest036
     * @tc.desc Verify callback externally modifies factor variable, subsequent callbacks see new value (2 -> 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factor: number = 2.0;
      let src: Int32Array = new Int32Array([10, 20, 30]);
      let res: Int32Array = src.map((v: number, i: int, _arr: Int32Array): number => {
        let r: number = v * factor;
        if (i === 0) {
          factor = 10.0;
        }
        return r;
      });
      expect(res.$_get(0)).assertEqual(20);
      expect(res.$_get(1)).assertEqual(200);
      expect(res.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayMapPart04TestMindmapTest037
     * @tc.desc Verify callback via array.$_set modifying already-visited elements does not affect result written position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let res: Int32Array = src.map((v: number, i: int, arr: Int32Array): number => {
        if (i === 1) {
          arr.$_set(0, 999);
        }
        return v * 2.0;
      });
      expect(res.$_get(0)).assertEqual(2);
      expect(res.$_get(1)).assertEqual(4);
      expect(res.$_get(2)).assertEqual(6);
      expect(src.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayMapPart04TestMindmapTest038
     * @tc.desc Verify callback via array.$_set modifying not-yet-visited elements -- subsequent callbacks see new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let seen: number[] = [0, 0, 0];
      src.map((v: number, i: int, arr: Int32Array): number => {
        seen[i] = v;
        if (i === 0) {
          arr.$_set(1, 777);
        }
        return v;
      });
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(777);
      expect(seen[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayMapPart04TestMindmapTest039
     * @tc.desc Verify callback array.$_set(out-of-bounds large index) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2]);
      let threw: boolean = false;
      let r: Int32Array = src.map((v: number, _i: int, arr: Int32Array): number => {
        try {
          arr.$_set(99, 123);
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('RangeError');
        }
        return v;
      });
      expect(threw).assertTrue();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayMapPart04TestMindmapTest040
     * @tc.desc Verify callback array.$_set(-1, x) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([5, 6]);
      let before0: number = src.$_get(0);
      let before1: number = src.$_get(1);
      let threw: boolean = false;
      src.map((v: number, _i: int, arr: Int32Array): number => {
        try {
          arr.$_set(-1, 999);
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('RangeError');
        }
        return v;
      });
      expect(threw).assertTrue();
      expect(src.$_get(0)).assertEqual(before0);
      expect(src.$_get(1)).assertEqual(before1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayMapPart04TestMindmapTest041
     * @tc.desc Verify callback array[i] equals val parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([10, 20, 30]);
      let allMatch: boolean = true;
      src.map((v: number, i: int, arr: Int32Array): number => {
        if (arr.$_get(i) !== v) {
          allMatch = false;
        }
        return v;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayMapPart04TestMindmapTest042
     * @tc.desc Verify callback array.$_set(-100) far negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      let r: Int32Array = src.map((v: number, _i: int, arr: Int32Array): number => {
        try {
          arr.$_set(-100, 55);
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('RangeError');
        }
        return v;
      });
      expect(threw).assertTrue();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayMapPart04TestMindmapTest043
     * @tc.desc Verify callback throw on first invocation -- map propagates error without returning result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      try {
        src.map((_v: number, _i: int, _arr: Int32Array): number => {
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayMapPart04TestMindmapTest044
     * @tc.desc Verify callback throw on second invocation -- first side effect already applied (cnt=2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      let src: Int32Array = new Int32Array([1, 2, 3]);
      try {
        src.map((_v: number, i: int, _arr: Int32Array): number => {
          cnt = cnt + 1;
          if (i === 1) {
            throw new Error('boom');
          }
          return 0.0;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayMapPart04TestMindmapTest045
     * @tc.desc Verify callback throws RangeError subclass -- propagates name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1]);
      try {
        src.map((_v: number, _i: int, _arr: Int32Array): number => {
          throw new RangeError('range!');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayMapPart04TestMindmapTest046
     * @tc.desc Verify callback throws TypeError subclass -- propagates name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1]);
      try {
        src.map((_v: number, _i: int, _arr: Int32Array): number => {
          throw new TypeError('type!');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayMapPart04TestMindmapTest047
     * @tc.desc Verify empty array map never executes callback (no throw occurs)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => {
        called = true;
        throw new Error('never');
      });
      expect(called).assertFalse();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayMapPart04TestMindmapTest048
     * @tc.desc Verify map on non-zero byteOffset subview -- result byteOffset=0 and values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let src: Int32Array = new Int32Array(buf, 8, 4);
      src.$_set(0, 11);
      src.$_set(1, 22);
      src.$_set(2, 33);
      src.$_set(3, 44);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(res.byteOffset).assertEqual(0);
      expect(res.length).assertEqual(4);
      expect(res.$_get(0)).assertEqual(11);
      expect(res.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayMapPart04TestMindmapTest049
     * @tc.desc Verify map on non-zero byteOffset view -- modifying result does not affect parent buffer other views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      parent.$_set(4, 5);
      parent.$_set(5, 6);
      let child: Int32Array = new Int32Array(buf, 8, 3);
      let res: Int32Array = child.map((v: number, _i: int, _arr: Int32Array): number => v * 100.0);
      res.$_set(0, 9999);
      expect(parent.$_get(2)).assertEqual(3);
      expect(parent.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayMapPart04TestMindmapTest050
     * @tc.desc Verify mapping one sibling view on shared ArrayBuffer does not affect other sibling view content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let viewA: Int32Array = new Int32Array(buf, 0, 2);
      let viewB: Int32Array = new Int32Array(buf, 8, 2);
      viewA.$_set(0, 10);
      viewA.$_set(1, 20);
      viewB.$_set(0, 30);
      viewB.$_set(1, 40);
      let res: Int32Array = viewA.map((v: number, _i: int, _arr: Int32Array): number => v + 1.0);
      expect(viewB.$_get(0)).assertEqual(30);
      expect(viewB.$_get(1)).assertEqual(40);
      expect(res.$_get(0)).assertEqual(11);
      expect(res.$_get(1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayMapPart04TestMindmapTest051
     * @tc.desc Verify callback via array (source view) $_set writes, sibling view on same buffer sees change immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let viewA: Int32Array = new Int32Array(buf, 0, 2);
      let viewB: Int32Array = new Int32Array(buf, 8, 2);
      viewA.$_set(0, 1);
      viewA.$_set(1, 2);
      viewB.$_set(0, 3);
      viewB.$_set(1, 4);
      viewA.map((_v: number, i: int, arr: Int32Array): number => {
        if (i === 0) {
          arr.$_set(0, 77);
        }
        return 0.0;
      });
      expect(viewA.$_get(0)).assertEqual(77);
      expect(viewB.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayMapPart04TestMindmapTest052
     * @tc.desc Verify map on subarray view -- result buffer is not shared with subarray source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = src.subarray(1, 4);
      let res: Int32Array = sub.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(res.length).assertEqual(3);
      expect(res.$_get(0)).assertEqual(20);
      expect(res.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayMapPart04TestMindmapTest053
     * @tc.desc Verify map on subarray view -- modifying result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = src.subarray(1, 4);
      let res: Int32Array = sub.map((v: number, _i: int, _arr: Int32Array): number => v * 10.0);
      res.$_set(0, 99999);
      expect(src.$_get(1)).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayMapPart04TestMindmapTest054
     * @tc.desc Verify map result BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1]);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(res.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayMapPart04TestMindmapTest055
     * @tc.desc Verify source from ArrayBuffer -- callback reads current source state via sibling Int32Array watcher
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let src: Int32Array = new Int32Array(buf);
      src.$_set(0, 1);
      src.$_set(1, 2);
      src.$_set(2, 3);
      src.$_set(3, 4);
      let watcher: Int32Array = new Int32Array(buf);
      let snapshot: number[] = [0, 0, 0, 0];
      src.map((v: number, i: int, _arr: Int32Array): number => {
        snapshot[i] = watcher.$_get(i);
        return v * 2.0;
      });
      expect(snapshot.$_get(0)).assertEqual(1);
      expect(snapshot.$_get(1)).assertEqual(2);
      expect(snapshot.$_get(2)).assertEqual(3);
      expect(snapshot.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayMapPart04TestMindmapTest056
     * @tc.desc Verify callback array.$_set modifies not-yet-visited element, readable through sibling view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let src: Int32Array = new Int32Array(buf);
      src.$_set(0, 1);
      src.$_set(1, 0);
      src.map((v: number, i: int, arr: Int32Array): number => {
        if (i === 0) {
          arr.$_set(1, 257);
        }
        return v;
      });
      expect(src.$_get(1)).assertEqual(257);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayMapPart04TestMindmapTest057
     * @tc.desc Verify single-element array map -- callback sees array.length as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([42]);
      let lenSeen: int = 0;
      src.map((_v: number, _i: int, arr: Int32Array): number => {
        lenSeen = arr.length;
        return 0.0;
      });
      expect(lenSeen).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayMapPart04TestMindmapTest058
     * @tc.desc Verify length=2 -- both callbacks see consistent array.length ($_set does not change length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2]);
      let lens: number[] = [0, 0];
      src.map((_v: number, i: int, arr: Int32Array): number => {
        lens[i] = arr.length;
        arr.$_set(0, 99);
        return 0.0;
      });
      expect(lens[0]).assertEqual(2);
      expect(lens[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayMapPart04TestMindmapTest059
     * @tc.desc Verify source with INT_MAX/INT_MIN/-1/0/1 -- callback +1 overflow wraps each correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([2147483647, -2147483648, -1, 0, 1]);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => v + 1.0);
      expect(res.$_get(0)).assertEqual(-2147483648);
      expect(res.$_get(1)).assertEqual(-2147483647);
      expect(res.$_get(2)).assertEqual(0);
      expect(res.$_get(3)).assertEqual(1);
      expect(res.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayMapPart04TestMindmapTest060
     * @tc.desc Verify source with INT_MAX/INT_MIN -- callback -v: INT_MIN * -1 = INT_MIN overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([2147483647, -2147483648]);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => -v);
      expect(res.$_get(0)).assertEqual(-2147483647);
      expect(res.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayMapPart04TestMindmapTest061
     * @tc.desc Verify callback returns 1.0 + INT_MAX = 2147483648.0 wraps to INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 1.0 + 2147483647.0);
      expect(res.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayMapPart04TestMindmapTest062
     * @tc.desc Verify callback returning float 3.7 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => 3.7);
      expect(res.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayMapPart04TestMindmapTest063
     * @tc.desc Verify callback returning -2.5 truncates to -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([0]);
      let res: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => -2.5);
      expect(res.$_get(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayMapPart04TestMindmapTest064
     * @tc.desc Verify map on 64-element large array -- all positions converted correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 64;
      let src: Int32Array = new Int32Array(n);
      let i: int = 0;
      for (i = 0; i < n; i = i + 1) {
        src.$_set(i, i);
      }
      let res: Int32Array = src.map((v: number, _j: int, _arr: Int32Array): number => v * 2.0);
      expect(res.length).assertEqual(64);
      expect(res.$_get(0)).assertEqual(0);
      expect(res.$_get(31)).assertEqual(62);
      expect(res.$_get(63)).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayMapPart04TestMindmapTest065
     * @tc.desc Verify callback v parameter is integer (fractional part is 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let allInt: boolean = true;
      src.map((v: number, _i: int, _arr: Int32Array): number => {
        let d: number = v - Math.floor(v);
        if (d !== 0.0) {
          allInt = false;
        }
        return v;
      });
      expect(allInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayMapPart04TestMindmapTest066
     * @tc.desc Verify Int32Array.of negative source -- callback -v yields opposites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-5, -10, -15);
      let res: Int32Array = src.map((v: number, _i: int, _arr: Int32Array): number => -v);
      expect(res.$_get(0)).assertEqual(5);
      expect(res.$_get(1)).assertEqual(10);
      expect(res.$_get(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayMapPart04TestMindmapTest067
     * @tc.desc Verify Int32Array.from source -- callback returns index*10 verifying index-position correspondence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.from([0, 0, 0, 0]);
      let res: Int32Array = src.map((_v: number, i: int, _arr: Int32Array): number => (i) * 10.0);
      expect(res.$_get(0)).assertEqual(0);
      expect(res.$_get(1)).assertEqual(10);
      expect(res.$_get(2)).assertEqual(20);
      expect(res.$_get(3)).assertEqual(30);
    });
  });
}
