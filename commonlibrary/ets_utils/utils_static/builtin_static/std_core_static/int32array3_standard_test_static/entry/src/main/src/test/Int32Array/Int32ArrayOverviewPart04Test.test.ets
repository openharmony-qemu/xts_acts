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

export default function int32ArrayOverviewPart04Test(): void {
  describe('Int32ArrayOverviewPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0010
     * @tc.name int32ArrayOverviewPart04TestMindmapTest001
     * @tc.desc Verify $_set index=0 INT_MAX $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 2147483647);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0020
     * @tc.name int32ArrayOverviewPart04TestMindmapTest002
     * @tc.desc Verify $_set index=1 INT_MIN $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(1, -2147483648);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0030
     * @tc.name int32ArrayOverviewPart04TestMindmapTest003
     * @tc.desc Verify $_set NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0040
     * @tc.name int32ArrayOverviewPart04TestMindmapTest004
     * @tc.desc Verify $_set +Infinity ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0050
     * @tc.name int32ArrayOverviewPart04TestMindmapTest005
     * @tc.desc Verify $_set -Infinity ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, -Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0060
     * @tc.name int32ArrayOverviewPart04TestMindmapTest006
     * @tc.desc Verify $_set 2147483648 (INT_MAX+1) INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 2147483648.0);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0070
     * @tc.name int32ArrayOverviewPart04TestMindmapTest007
     * @tc.desc Verify $_set -2147483649 (INT_MIN-1) INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, -2147483649.0);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0080
     * @tc.name int32ArrayOverviewPart04TestMindmapTest008
     * @tc.desc Verify $_set 4294967296 (2^32) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 4294967296.0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0090
     * @tc.name int32ArrayOverviewPart04TestMindmapTest009
     * @tc.desc Verify $_set 4294967297 (2^32+1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 4294967297.0);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayOverviewPart04TestMindmapTest010
     * @tc.desc Verify $_set 0.7 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 0.7);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0110
     * @tc.name int32ArrayOverviewPart04TestMindmapTest011
     * @tc.desc Verify $_set -0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, -0.9);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0120
     * @tc.name int32ArrayOverviewPart04TestMindmapTest012
     * @tc.desc Verify $_set 2147483647.9 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 2147483647.9);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0130
     * @tc.name int32ArrayOverviewPart04TestMindmapTest013
     * @tc.desc Verify $_set index=length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0140
     * @tc.name int32ArrayOverviewPart04TestMindmapTest014
     * @tc.desc Verify $_set index=-1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0150
     * @tc.name int32ArrayOverviewPart04TestMindmapTest015
     * @tc.desc Verify $_set length=0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.$_set(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0160
     * @tc.name int32ArrayOverviewPart04TestMindmapTest016
     * @tc.desc Verify fill(value) value=-Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0170
     * @tc.name int32ArrayOverviewPart04TestMindmapTest017
     * @tc.desc Verify fill(value) value=2147483648 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483648.0);
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0180
     * @tc.name int32ArrayOverviewPart04TestMindmapTest018
     * @tc.desc Verify fill(value) value=-2147483649 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-2147483649.0);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0190
     * @tc.name int32ArrayOverviewPart04TestMindmapTest019
     * @tc.desc Verify fill(value) value=0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(0.5);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayOverviewPart04TestMindmapTest020
     * @tc.desc Verify with(index, value) value=NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(1, Number.NaN);
      expect(r.$_get(1)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0210
     * @tc.name int32ArrayOverviewPart04TestMindmapTest021
     * @tc.desc Verify with(index, value) value=2147483648 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(0, 2147483648.0);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0220
     * @tc.name int32ArrayOverviewPart04TestMindmapTest022
     * @tc.desc Verify with(index, value) value=-2147483649 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(2, -2147483649.0);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0230
     * @tc.name int32ArrayOverviewPart04TestMindmapTest023
     * @tc.desc Verify with(index, value) value=-0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(1, -0.9);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0240
     * @tc.name int32ArrayOverviewPart04TestMindmapTest024
     * @tc.desc Verify of(NaN, Infinity, -Infinity) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.of(Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0250
     * @tc.name int32ArrayOverviewPart04TestMindmapTest025
     * @tc.desc Verify of(2147483648, -2147483649, 4294967296)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.of(2147483648.0, -2147483649.0, 4294967296.0);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(2147483647);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0260
     * @tc.name int32ArrayOverviewPart04TestMindmapTest026
     * @tc.desc Verify of(0.3, -0.7, 2147483647.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.of(0.3, -0.7, 2147483647.5);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0270
     * @tc.name int32ArrayOverviewPart04TestMindmapTest027
     * @tc.desc Verify from NaN/Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array =
      Int32Array.from([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY] as number[]);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0280
     * @tc.name int32ArrayOverviewPart04TestMindmapTest028
     * @tc.desc Verify from 2147483648/-2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([2147483648.0, -2147483649.0] as number[]);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0290
     * @tc.name int32ArrayOverviewPart04TestMindmapTest029
     * @tc.desc Verify from mapfn 0.5 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src4: number[] = [1, 2];
      let _mapped: number[] = [];
      for (let _j: int = 0; _j < src4.length; _j++) {
        _mapped.push(0.5);
      }
      let r: Int32Array = Int32Array.from(_mapped);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayOverviewPart04TestMindmapTest030
     * @tc.desc Verify set(index, value) value=NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.set(1, Number.NaN);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0310
     * @tc.name int32ArrayOverviewPart04TestMindmapTest031
     * @tc.desc Verify set(index, value) value=2147483648 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.set(0, 2147483648.0);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0320
     * @tc.name int32ArrayOverviewPart04TestMindmapTest032
     * @tc.desc Verify set(index, value) value=-2147483649 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.set(2, -2147483649.0);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0330
     * @tc.name int32ArrayOverviewPart04TestMindmapTest033
     * @tc.desc Verify byteOffset=1 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0340
     * @tc.name int32ArrayOverviewPart04TestMindmapTest034
     * @tc.desc Verify byteOffset=4 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0350
     * @tc.name int32ArrayOverviewPart04TestMindmapTest035
     * @tc.desc Verify RangeError (buf=8B offset=4 length=2 12B)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0360
     * @tc.name int32ArrayOverviewPart04TestMindmapTest036
     * @tc.desc Verify ArrayBuffer offset $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      let child: Int32Array = new Int32Array(buf, 0, 4);
      parent.$_set(0, 100);
      expect(child.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0370
     * @tc.name int32ArrayOverviewPart04TestMindmapTest037
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      let child: Int32Array = new Int32Array(buf, 0, 4);
      parent.fill(7);
      expect(child.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0380
     * @tc.name int32ArrayOverviewPart04TestMindmapTest038
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      let child: Int32Array = new Int32Array(buf);
      parent.reverse();
      expect(child.$_get(0)).assertEqual(4);
      expect(child.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0390
     * @tc.name int32ArrayOverviewPart04TestMindmapTest039
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 10);
      parent.$_set(1, 20);
      parent.$_set(2, 30);
      parent.$_set(3, 40);
      let child: Int32Array = new Int32Array(buf, 0, 4);
      child.copyWithin(2, 0, 2);
      expect(parent.$_get(2)).assertEqual(10);
      expect(parent.$_get(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayOverviewPart04TestMindmapTest040
     * @tc.desc Verify set(array, offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 4, 3);
      let src: Int32Array = new Int32Array([111, 222, 333]);
      child.set(src, 0);
      expect(parent.$_get(1)).assertEqual(111);
      expect(parent.$_get(2)).assertEqual(222);
      expect(parent.$_get(3)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0410
     * @tc.name int32ArrayOverviewPart04TestMindmapTest041
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0420
     * @tc.name int32ArrayOverviewPart04TestMindmapTest042
     * @tc.desc Verify subarray sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(1, 3);
      arr.$_set(2, 88);
      expect(sub.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0430
     * @tc.name int32ArrayOverviewPart04TestMindmapTest043
     * @tc.desc Verify subarray(0, 0) length=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0440
     * @tc.name int32ArrayOverviewPart04TestMindmapTest044
     * @tc.desc Verify subarray begin>=end buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(3, 1);
      expect(sub.length).assertEqual(0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0450
     * @tc.name int32ArrayOverviewPart04TestMindmapTest045
     * @tc.desc Verify byteOffset full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      let c: Int32Array = new Int32Array(buf, 16, 2);
      a.$_set(0, 11);
      b.$_set(0, 22);
      c.$_set(0, 33);
      let full: Int32Array = new Int32Array(buf);
      expect(full.$_get(0)).assertEqual(11);
      expect(full.$_get(2)).assertEqual(22);
      expect(full.$_get(4)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0460
     * @tc.name int32ArrayOverviewPart04TestMindmapTest046
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0470
     * @tc.name int32ArrayOverviewPart04TestMindmapTest047
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0480
     * @tc.name int32ArrayOverviewPart04TestMindmapTest048
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.sort();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0490
     * @tc.name int32ArrayOverviewPart04TestMindmapTest049
     * @tc.desc Verify sort(compareFn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 3, 2]);
      let r: Int32Array = arr.sort((a: number, b: number): int => {
        if (b > a) {
          return 1;
        }
        if (b < a) {
          return -1;
        }
        return 0;
      });
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayOverviewPart04TestMindmapTest050
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.copyWithin(2, 0, 2);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0510
     * @tc.name int32ArrayOverviewPart04TestMindmapTest051
     * @tc.desc Verify toReversed Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0520
     * @tc.name int32ArrayOverviewPart04TestMindmapTest052
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      r.$_set(0, 99);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0530
     * @tc.name int32ArrayOverviewPart04TestMindmapTest053
     * @tc.desc Verify toSorted Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0540
     * @tc.name int32ArrayOverviewPart04TestMindmapTest054
     * @tc.desc Verify slice Int32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Int32Array = arr.slice(1, 3);
      s.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0550
     * @tc.name int32ArrayOverviewPart04TestMindmapTest055
     * @tc.desc Verify map Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let m: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(m.length).assertEqual(3);
      expect(m.$_get(0)).assertEqual(2);
      expect(m.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0560
     * @tc.name int32ArrayOverviewPart04TestMindmapTest056
     * @tc.desc Verify filter Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let f: Int32Array = arr.filter((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 0);
      expect(f.length).assertEqual(2);
      expect(f.$_get(0)).assertEqual(2);
      expect(f.$_get(1)).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0570
     * @tc.name int32ArrayOverviewPart04TestMindmapTest057
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let v: Object = arr.valueOf();
      expect(v as Int32Array).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0580
     * @tc.name int32ArrayOverviewPart04TestMindmapTest058
     * @tc.desc Verify reverse().sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.reverse().sort();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0590
     * @tc.name int32ArrayOverviewPart04TestMindmapTest059
     * @tc.desc Verify fill().reverse().copyWithin()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let r: Int32Array = arr.fill(5).reverse().copyWithin(2, 0, 2);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayOverviewPart04TestMindmapTest060
     * @tc.desc Verify entries next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let it = arr.entries();
      let r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0610
     * @tc.name int32ArrayOverviewPart04TestMindmapTest061
     * @tc.desc Verify entries [0, value] next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let it = arr.entries();
      let first = it.next();
      expect(first.done).assertFalse();
      let seenIdx: int = -1;
      let seenVal: number = 0;
      let firstValue = first.value!;
      seenIdx = firstValue[0];
      seenVal = firstValue[1];
      expect(seenIdx).assertEqual(0);
      expect(seenVal).assertEqual(42);
      let second = it.next();
      expect(second.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0620
     * @tc.name int32ArrayOverviewPart04TestMindmapTest062
     * @tc.desc Verify entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let indices: number[] = [];
      let vals: number[] = [];
      for (let pair of arr.entries()) {
        indices.push(pair[0]);
        vals.push(pair[1]);
      }
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(vals[0]).assertEqual(10);
      expect(vals[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0630
     * @tc.name int32ArrayOverviewPart04TestMindmapTest063
     * @tc.desc Verify entries break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let c1: int = 0;
      let it1 = arr.entries();
      let r1 = it1.next();
      while (!r1.done) {
        c1++;
        if (c1 >= 2) {
          break;
        }
        r1 = it1.next();
      }
      expect(c1).assertEqual(2);
      let c2: int = 0;
      let it2 = arr.entries();
      let r2 = it2.next();
      while (!r2.done) {
        c2++;
        r2 = it2.next();
      }
      expect(c2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0640
     * @tc.name int32ArrayOverviewPart04TestMindmapTest064
     * @tc.desc Verify keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let ks: number[] = [];
      for (let k of arr.keys()) {
        ks.push(k);
      }
      expect(ks.length).assertEqual(3);
      expect(ks[0]).assertEqual(0);
      expect(ks[1]).assertEqual(1);
      expect(ks[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0650
     * @tc.name int32ArrayOverviewPart04TestMindmapTest065
     * @tc.desc Verify keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let c: int = 0;
      let it = arr.keys();
      let r = it.next();
      while (!r.done) {
        c++;
        r = it.next();
      }
      expect(c).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0660
     * @tc.name int32ArrayOverviewPart04TestMindmapTest066
     * @tc.desc Verify values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let out: number[] = [];
      for (let v of arr.values()) {
        out.push(v);
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual(7);
      expect(out[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0670
     * @tc.name int32ArrayOverviewPart04TestMindmapTest067
     * @tc.desc Verify values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let c: int = 0;
      let it = arr.values();
      let r = it.next();
      while (!r.done) {
        c++;
        r = it.next();
      }
      expect(c).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0680
     * @tc.name int32ArrayOverviewPart04TestMindmapTest068
     * @tc.desc Verify for-of Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let out: number[] = [];
      for (let i: int = 0; i < arr.length; i++) {
        out.push(arr.$_get(i));
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual(11);
      expect(out[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0690
     * @tc.name int32ArrayOverviewPart04TestMindmapTest069
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let s1: number = 0;
      for (let i: int = 0; i < arr.length; i++) {
        s1 += arr.$_get(i);
      }
      let s2: number = 0;
      for (let i: int = 0; i < arr.length; i++) {
        s2 += arr.$_get(i);
      }
      expect(s1).assertEqual(3);
      expect(s2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayOverviewPart04TestMindmapTest070
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.forEach((_v: number, _i: int, _arr: Int32Array): void => {
          expect(_v).assertEqual(1);
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0710
     * @tc.name int32ArrayOverviewPart04TestMindmapTest071
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.map((_v: number, _i: int, _arr: Int32Array): number => {
          expect(_v).assertEqual(1);
          throw new Error('map err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0720
     * @tc.name int32ArrayOverviewPart04TestMindmapTest072
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.filter((_v: number, _i: int, _arr: Int32Array): boolean => {
          expect(_v).assertEqual(1);
          throw new Error('filter err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0730
     * @tc.name int32ArrayOverviewPart04TestMindmapTest073
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        let _v = arr.find((_v: number, _i: int, _arr: Int32Array): boolean => {
          expect(_v).assertEqual(1);
          throw new Error('find err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0740
     * @tc.name int32ArrayOverviewPart04TestMindmapTest074
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.findIndex((_v: number, _i2: int, _arr: Int32Array): boolean => {
          expect(_v).assertEqual(1);
          throw new Error('fi err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0750
     * @tc.name int32ArrayOverviewPart04TestMindmapTest075
     * @tc.desc Verify findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        let _v = arr.findLast((_v: number, _i: int, _arr: Int32Array): boolean => {
          expect(_v).assertEqual(3);
          throw new Error('fl err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0760
     * @tc.name int32ArrayOverviewPart04TestMindmapTest076
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.findLastIndex((_v: number, _i2: int, _arr: Int32Array): boolean => {
          expect(_v).assertEqual(3);
          throw new Error('fli err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0770
     * @tc.name int32ArrayOverviewPart04TestMindmapTest077
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.some((_v: number, _i: int, _arr: Int32Array): boolean => {
          expect(_v).assertEqual(1);
          throw new Error('some err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0780
     * @tc.name int32ArrayOverviewPart04TestMindmapTest078
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.every((_v: number, _i: int, _arr: Int32Array): boolean => {
          expect(_v).assertEqual(1);
          throw new Error('every err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0790
     * @tc.name int32ArrayOverviewPart04TestMindmapTest079
     * @tc.desc Verify reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.reduce((_acc: number, _v: number, _i: int, _arr: Int32Array): number => {
          expect(_v).assertEqual(1);
          throw new Error('red err');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayOverviewPart04TestMindmapTest080
     * @tc.desc Verify reduceRight initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.reduceRight((_acc: number, _v: number, _i: int, _arr: Int32Array): number => {
          expect(_v).assertEqual(3);
          throw new Error('rr err');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0810
     * @tc.name int32ArrayOverviewPart04TestMindmapTest081
     * @tc.desc Verify sort compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      try {
        arr.sort((_a: number, _b: number): int => {
          throw new Error('sort err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0820
     * @tc.name int32ArrayOverviewPart04TestMindmapTest082
     * @tc.desc Verify from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let _src87: number[] = [1, 2, 3];
        let _mapped: number[] = [];
        for (let _i: int = 0; _i < _src87.length; _i++) {
          throw new Error('from err');
        }
        Int32Array.from(_mapped);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0830
     * @tc.name int32ArrayOverviewPart04TestMindmapTest083
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sum: number = 0;
      arr.forEach((v: number, _i: int, _arr: Int32Array): void => {
        sum += v;
      });
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0840
     * @tc.name int32ArrayOverviewPart04TestMindmapTest084
     * @tc.desc Verify forEach FixedArray index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let visited: number[] = [];
      arr.forEach((_v: number, i: int, _arr: Int32Array): void => {
        visited.push(i);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(0);
      expect(visited[1]).assertEqual(1);
      expect(visited[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0850
     * @tc.name int32ArrayOverviewPart04TestMindmapTest085
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let offset: int = 100;
      let r: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v + offset);
      expect(r.$_get(0)).assertEqual(110);
      expect(r.$_get(2)).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0860
     * @tc.name int32ArrayOverviewPart04TestMindmapTest086
     * @tc.desc Verify reduce initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.reduce((_acc: number, _v: number, _i: int, _arr: Int32Array): number => 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0870
     * @tc.name int32ArrayOverviewPart04TestMindmapTest087
     * @tc.desc Verify reduceRight initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.reduceRight((_acc: number, _v: number, _i: int, _arr: Int32Array): number => 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0880
     * @tc.name int32ArrayOverviewPart04TestMindmapTest088
     * @tc.desc Verify set(array, offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let src: Int32Array = new Int32Array([10, 20, 30]);
      arr.set(src, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(30);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0890
     * @tc.name int32ArrayOverviewPart04TestMindmapTest089
     * @tc.desc Verify set(array, offset) source.length+offset > this.length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 5);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayOverviewPart04TestMindmapTest090
     * @tc.desc Verify sort length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let before: int = arr.length;
      arr.sort();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0910
     * @tc.name int32ArrayOverviewPart04TestMindmapTest091
     * @tc.desc Verify forEach $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seen: number[] = [];
      for (let i: int = 0; i < arr.length; i++) {
        let v: number = arr.$_get(i);
        seen.push(v);
        if (i === 0) {
          arr.$_set(1, 99);
        }
      }
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(99);
      expect(seen[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0920
     * @tc.name int32ArrayOverviewPart04TestMindmapTest092
     * @tc.desc Verify for-of $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let out: number[] = [];
      for (let i: int = 0; i < arr.length; i++) {
        out.push(arr.$_get(i));
        if (i === 0) {
          arr.$_set(1, 77);
        }
      }
      expect(out[0]).assertEqual(1);
      expect(out[1]).assertEqual(77);
      expect(out[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0930
     * @tc.name int32ArrayOverviewPart04TestMindmapTest093
     * @tc.desc Verify reverse().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.reverse().reverse();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0940
     * @tc.name int32ArrayOverviewPart04TestMindmapTest094
     * @tc.desc Verify toReversed().toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed().toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0950
     * @tc.name int32ArrayOverviewPart04TestMindmapTest095
     * @tc.desc Verify subarray subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let s1: Int32Array = arr.subarray(1, 4);
      let s2: Int32Array = s1.subarray(1, 2);
      expect(s2.buffer).assertEqual(arr.buffer);
      expect(s2.length).assertEqual(1);
      expect(s2.$_get(0)).assertEqual(3);
      s2.$_set(0, 99);
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0960
     * @tc.name int32ArrayOverviewPart04TestMindmapTest096
     * @tc.desc Verify slice().slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Int32Array = arr.slice().slice();
      s.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(1);
      expect(s.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0970
     * @tc.name int32ArrayOverviewPart04TestMindmapTest097
     * @tc.desc Verify filter map ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let evens: Int32Array = arr.filter((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 0);
      let doubled: Int32Array = evens.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(doubled.length).assertEqual(2);
      expect(doubled.$_get(0)).assertEqual(4);
      expect(doubled.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0980
     * @tc.name int32ArrayOverviewPart04TestMindmapTest098
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_0990
     * @tc.name int32ArrayOverviewPart04TestMindmapTest099
     * @tc.desc Verify at(-length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.at(-3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayOverviewPart04TestMindmapTest100
     * @tc.desc Verify at(-length-1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.at(-4)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1010
     * @tc.name int32ArrayOverviewPart04TestMindmapTest101
     * @tc.desc Verify slice(-2) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Int32Array = arr.slice(-2);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(3);
      expect(s.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1020
     * @tc.name int32ArrayOverviewPart04TestMindmapTest102
     * @tc.desc Verify subarray(-2) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Int32Array = arr.subarray(-2);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(3);
      expect(s.$_get(1)).assertEqual(4);
      expect(s.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1030
     * @tc.name int32ArrayOverviewPart04TestMindmapTest103
     * @tc.desc Verify copyWithin(-2, 0) target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.copyWithin(-2, 0);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1040
     * @tc.name int32ArrayOverviewPart04TestMindmapTest104
     * @tc.desc Verify fill(value, -2) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(0, -2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1050
     * @tc.name int32ArrayOverviewPart04TestMindmapTest105
     * @tc.desc Verify indexOf(searchElement, -2) fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 2, 1]);
      expect(arr.indexOf(2, -2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1060
     * @tc.name int32ArrayOverviewPart04TestMindmapTest106
     * @tc.desc Verify includes NaN (SameValueZero )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, Number.NaN);
      arr.$_set(1, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.includes(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1070
     * @tc.name int32ArrayOverviewPart04TestMindmapTest107
     * @tc.desc Verify indexOf NaN -1 ( NaN!==NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, Number.NaN);
      arr.$_set(1, 1);
      expect(arr.indexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1080
     * @tc.name int32ArrayOverviewPart04TestMindmapTest108
     * @tc.desc Verify forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let c: number = 0;
      arr.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        c++;
      });
      expect(c).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART04_TEST_MINDMAP_1090
     * @tc.name int32ArrayOverviewPart04TestMindmapTest109
     * @tc.desc Verify sort this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart04TestMindmapTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.sort();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(42);
    });
  });
}
