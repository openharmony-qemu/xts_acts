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

export default function int32ArrayOverviewPart01Test(): void {
  describe('Int32ArrayOverviewPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayOverviewPart01TestMindmapTest001
     * @tc.desc Verify no-arg constructor instance buffer is not null and byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      expect(a.buffer).not().assertNull();
      expect(a.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayOverviewPart01TestMindmapTest002
     * @tc.desc Verify single-arg length=1 constructor returns length=1 with element initialized to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayOverviewPart01TestMindmapTest003
     * @tc.desc Verify constructor with number literal array [2147483647] yields length=1 and max int32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647]);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayOverviewPart01TestMindmapTest004
     * @tc.desc Verify constructor with Int32Array instance as source, new instance length matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([2147483647, 0]);
      let a: Int32Array = new Int32Array(src);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayOverviewPart01TestMindmapTest005
     * @tc.desc Verify constructor with zero-length ArrayBuffer(0) returns length=0 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let a: Int32Array = new Int32Array(buf);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayOverviewPart01TestMindmapTest006
     * @tc.desc Verify two-arg constructor (buffer, byteOffset=0) infers length from buffer capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0);
      expect(a.length).assertEqual(2);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayOverviewPart01TestMindmapTest007
     * @tc.desc Verify three-arg constructor (buffer, byteOffset=4, length=1) creates offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 4, 1);
      expect(a.length).assertEqual(1);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayOverviewPart01TestMindmapTest008
     * @tc.desc Verify the maximum supported length is rejected without allocating a huge buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        new Int32Array(buf, 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayOverviewPart01TestMindmapTest009
     * @tc.desc Verify length=1000000 constructor yields length exactly 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1000000);
      expect(a.length).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayOverviewPart01TestMindmapTest010
     * @tc.desc Verify length=3.5 truncates to 3 via ToIndex, length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3.5);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayOverviewPart01TestMindmapTest011
     * @tc.desc Verify length=NaN is treated as 0 by ToIndex, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(Number.NaN);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayOverviewPart01TestMindmapTest012
     * @tc.desc Verify constructor with array literal containing 0x7FFFFFFF preserves max int32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0x7FFFFFFF]);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayOverviewPart01TestMindmapTest013
     * @tc.desc Verify constructor with 4294967296 (0x100000000) wraps to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294967296]);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayOverviewPart01TestMindmapTest014
     * @tc.desc Verify Int32Array.of with single 4294967296 wraps to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(4294967296);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayOverviewPart01TestMindmapTest015
     * @tc.desc Verify Int32Array.of with single int32 max 2147483647 preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayOverviewPart01TestMindmapTest016
     * @tc.desc Verify Int32Array.of with 0x7FFFFFFF, 0x100000000, 0 correctly truncates each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647, 4294967296, 0);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayOverviewPart01TestMindmapTest017
     * @tc.desc Verify Int32Array.of with 0 as sole element yields length=1 element=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayOverviewPart01TestMindmapTest018
     * @tc.desc Verify Int32Array.from with empty array literal returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      let a: Int32Array = Int32Array.from(src);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayOverviewPart01TestMindmapTest019
     * @tc.desc Verify Int32Array.from with [4294967296] wraps to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [4294967296 as number];
      let a: Int32Array = Int32Array.from(src);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayOverviewPart01TestMindmapTest020
     * @tc.desc Verify Int32Array.from with mapFn maps each element to int32 max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [0, 0, 0];
      let _mapped: number[] = [];
      for (let _i: int = 0; _i < src.length; _i++) {
        _mapped.push(2147483647);
      }
      let a: Int32Array = Int32Array.from(_mapped);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayOverviewPart01TestMindmapTest021
     * @tc.desc Verify Int32Array.from mapFn returns 4294967296 which wraps to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1];
      let _mapped: number[] = [];
      for (let _i: int = 0; _i < src.length; _i++) {
        _mapped.push(4294967296);
      }
      let a: Int32Array = Int32Array.from(_mapped);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayOverviewPart01TestMindmapTest022
     * @tc.desc Verify constructor with array literal containing NaN converts to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Number.NaN]);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayOverviewPart01TestMindmapTest023
     * @tc.desc Verify constructor with array literal containing +Infinity converts to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Number.POSITIVE_INFINITY]);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayOverviewPart01TestMindmapTest024
     * @tc.desc Verify constructor with array literal containing -Infinity converts to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Number.NEGATIVE_INFINITY]);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayOverviewPart01TestMindmapTest025
     * @tc.desc Verify constructor with array literal containing -0 converts to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-0]);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayOverviewPart01TestMindmapTest026
     * @tc.desc Verify constructor with 3.999 truncates toward zero to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3.999]);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayOverviewPart01TestMindmapTest027
     * @tc.desc Verify constructor with -3.999 truncates toward zero to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-3.999]);
      expect(a.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayOverviewPart01TestMindmapTest028
     * @tc.desc Verify constructor with -1 (0xFFFFFFFF bit pattern) preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1]);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayOverviewPart01TestMindmapTest029
     * @tc.desc Verify byteOffset=4 aligned offset view has correct byteOffset and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 4);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayOverviewPart01TestMindmapTest030
     * @tc.desc Verify byteOffset=2 not 4-byte aligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayOverviewPart01TestMindmapTest031
     * @tc.desc Verify byteOffset=3 not 4-byte aligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayOverviewPart01TestMindmapTest032
     * @tc.desc Verify byteOffset=4 length=1 on buffer capacity 8 does not exceed bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 4, 1);
      expect(a.length).assertEqual(1);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayOverviewPart01TestMindmapTest033
     * @tc.desc Verify length=0 with byteOffset at buffer end is legal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 8, 0);
      expect(a.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayOverviewPart01TestMindmapTest034
     * @tc.desc Verify constructor from single-element Int32Array [2147483647] copies value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([2147483647]);
      let a: Int32Array = new Int32Array(src);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayOverviewPart01TestMindmapTest035
     * @tc.desc Verify modifying source after construction does not affect new independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([2147483647]);
      let a: Int32Array = new Int32Array(src);
      src.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayOverviewPart01TestMindmapTest036
     * @tc.desc Verify constructor with 4294972296 wraps to 5000 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294972296]);
      expect(a.$_get(0)).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayOverviewPart01TestMindmapTest037
     * @tc.desc Verify constructor from empty Int32Array(0) yields length=0 instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(0);
      let a: Int32Array = new Int32Array(src);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayOverviewPart01TestMindmapTest038
     * @tc.desc Verify constructor from number array [1] yields length=1 element=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1];
      let a: Int32Array = new Int32Array(src);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayOverviewPart01TestMindmapTest039
     * @tc.desc Verify constructor from 10000-element all-zero array yields length=10000 last=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      for (let i: number = 0; i < 10000; i++) {
        src.push(0);
      }
      let a: Int32Array = new Int32Array(src);
      expect(a.length).assertEqual(10000);
      expect(a.$_get(9999)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayOverviewPart01TestMindmapTest040
     * @tc.desc Verify constructor with all -1 array preserves -1 (0xFFFFFFFF bit pattern)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, -1]);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayOverviewPart01TestMindmapTest041
     * @tc.desc Verify Int32Array.of with two args (2147483647, -1) yields length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647, -1);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayOverviewPart01TestMindmapTest042
     * @tc.desc Verify Int32Array.from with only arrayLike (number[]) without mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2]);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayOverviewPart01TestMindmapTest043
     * @tc.desc Verify Int32Array.from mapFn error is propagated as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let _src: number[] = [1];
        for (let _i: int = 0; _i < _src.length; _i++) {
          throw new Error('mapfn err');
        }
        Int32Array.from(_src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayOverviewPart01TestMindmapTest044
     * @tc.desc Verify Int32Array.from with another Int32Array instance as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([2147483647, 0]);
      let a: Int32Array = Int32Array.from(src);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayOverviewPart01TestMindmapTest045
     * @tc.desc Verify Int32Array.of with mixed values including 0x100000000 wrap-around coexists with normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 4294967296, -1, 0, 2147483647);
      expect(a.length).assertEqual(5);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(-1);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(4)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayOverviewPart01TestMindmapTest046
     * @tc.desc Verify new Int32Array(length) creates independent ArrayBuffer not shared with other instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let b: Int32Array = new Int32Array(1);
      expect(a.length).assertEqual(1);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayOverviewPart01TestMindmapTest047
     * @tc.desc Verify view constructed from ArrayBuffer shares underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let a: Int32Array = new Int32Array(buf);
      expect(a.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayOverviewPart01TestMindmapTest048
     * @tc.desc Verify no-arg constructor instance toString returns non-null string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let s: string = a.toString();
      expect(s).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayOverviewPart01TestMindmapTest049
     * @tc.desc Verify length=1 [0] constructor instance toString returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let s: string = a.toString();
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayOverviewPart01TestMindmapTest050
     * @tc.desc Verify instance buffer byteLength is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      expect(a.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayOverviewPart01TestMindmapTest051
     * @tc.desc Verify Int32Array.from([1]) returns length 1 and value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1];
      let a: Int32Array = Int32Array.from(src);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayOverviewPart01TestMindmapTest052
     * @tc.desc Verify constructor length=2147483648.5 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(2147483648.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayOverviewPart01TestMindmapTest053
     * @tc.desc Verify ArrayBuffer(byteLength=-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(-1);
        new Int32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayOverviewPart01TestMindmapTest054
     * @tc.desc Verify three-arg constructor byteOffset exceeds buffer capacity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 12, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayOverviewPart01TestMindmapTest055
     * @tc.desc Verify Int32Array.from with null source throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(null as Object as number[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayOverviewPart01TestMindmapTest056
     * @tc.desc Verify Int32Array.from with undefined source throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(undefined as Object as number[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayOverviewPart01TestMindmapTest057
     * @tc.desc Verify constructor with 2147483648 (MAX+1) wraps to -2147483648; Also verify verify constructor with 0x80000000 (2147483648) wraps to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483648]);
      expect(a.$_get(0)).assertEqual(-2147483648);

      {
      let a: Int32Array = new Int32Array([0x80000000]);
      expect(a.$_get(0)).assertEqual(-2147483648);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayOverviewPart01TestMindmapTest058
     * @tc.desc Verify constructor with -2147483649 (MIN-1) wraps to 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483649]);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayOverviewPart01TestMindmapTest059
     * @tc.desc Verify constructor with 4294967295 (0xFFFFFFFF all-1 bits) wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294967295]);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayOverviewPart01TestMindmapTest060
     * @tc.desc Verify constructor with 4294967297 (0x100000001) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294967297]);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayOverviewPart01TestMindmapTest061
     * @tc.desc Verify Int32Array.of with MAX+1 and MIN-1 each correctly wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483648, -2147483649);
      expect(a.$_get(0)).assertEqual(-2147483648);
      expect(a.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayOverviewPart01TestMindmapTest062
     * @tc.desc Verify constructor with 0.5 fraction truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0.5]);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayOverviewPart01TestMindmapTest063
     * @tc.desc Verify constructor with -0.5 fraction truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-0.5]);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayOverviewPart01TestMindmapTest064
     * @tc.desc Verify same ArrayBuffer different offset views have independent element regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0, 1);
      let b: Int32Array = new Int32Array(buf, 4, 1);
      a.$_set(0, 2147483647);
      expect(b.$_get(0)).assertEqual(0);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayOverviewPart01TestMindmapTest065
     * @tc.desc Verify overlapping views on same ArrayBuffer share first element writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 0, 1);
      a.$_set(0, 4294967296);
      expect(b.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayOverviewPart01TestMindmapTest066
     * @tc.desc Verify modifying source buffer after constructing new instance does not affect copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(1);
      src.$_set(0, 2147483647);
      let a: Int32Array = new Int32Array(src);
      src.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(2147483647);
    });
  });
}
