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

export default function int32ArrayOverviewPart07Test(): void {
  describe('Int32ArrayOverviewPart07Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest001
     * @tc.desc Verify $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest002
     * @tc.desc Verify $_get(-length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_get(-3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest003
     * @tc.desc Verify $_get(-length-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_get(-4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest004
     * @tc.desc Verify $_get(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest005
     * @tc.desc Verify $_get(length+1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_get(4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0600
     * @tc.name int32ArrayOverviewPart07TestMindmapTest006
     * @tc.desc Verify $_get 2147483647 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_get(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0700
     * @tc.name int32ArrayOverviewPart07TestMindmapTest007
     * @tc.desc Verify $_get(1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      try {
        arr.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0800
     * @tc.name int32ArrayOverviewPart07TestMindmapTest008
     * @tc.desc Verify $_set(-1, v) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_set(-1, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_0900
     * @tc.name int32ArrayOverviewPart07TestMindmapTest009
     * @tc.desc Verify $_set(-length, v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_set(-3, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1000
     * @tc.name int32ArrayOverviewPart07TestMindmapTest010
     * @tc.desc Verify $_set(-length-1, v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_set(-4, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest011
     * @tc.desc Verify $_set(length, v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_set(3, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest012
     * @tc.desc Verify $_set(length+1, v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_set(4, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest013
     * @tc.desc Verify $_set( , v) /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_set(1000000, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest014
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      expect(arr.at(-1)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest015
     * @tc.desc Verify at(-length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      expect(arr.at(-3)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1600
     * @tc.name int32ArrayOverviewPart07TestMindmapTest016
     * @tc.desc Verify at(-length-1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let v: number | undefined = arr.at(-4);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1700
     * @tc.name int32ArrayOverviewPart07TestMindmapTest017
     * @tc.desc Verify at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let v: number | undefined = arr.at(3);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1800
     * @tc.name int32ArrayOverviewPart07TestMindmapTest018
     * @tc.desc Verify at(length+1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let v: number | undefined = arr.at(4);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_1900
     * @tc.name int32ArrayOverviewPart07TestMindmapTest019
     * @tc.desc Verify at(-1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let v: number | undefined = arr.at(-1);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2000
     * @tc.name int32ArrayOverviewPart07TestMindmapTest020
     * @tc.desc Verify at(-2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let v: number | undefined = arr.at(-2);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest021
     * @tc.desc Verify with(length+1, v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(4, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest022
     * @tc.desc Verify with(-length-1, v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(-4, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest023
     * @tc.desc Verify with(0, v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.with(0, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest024
     * @tc.desc Verify with(1, v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      try {
        arr.with(1, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest025
     * @tc.desc Verify with 1000000 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(1000000, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2600
     * @tc.name int32ArrayOverviewPart07TestMindmapTest026
     * @tc.desc Verify with(length, v) RangeError; Also verify verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let threw: boolean = false;
      try {
        arr.with(3, 88);
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(threw).assertTrue();
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(2)).assertEqual(33);
      expect(arr.length).assertEqual(3);

      {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(3, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2700
     * @tc.name int32ArrayOverviewPart07TestMindmapTest027
     * @tc.desc Verify set(array, -1) offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      let src: Int32Array = new Int32Array([1, 2]);
      try {
        dst.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2800
     * @tc.name int32ArrayOverviewPart07TestMindmapTest028
     * @tc.desc Verify set(source.length + offset > dst.length) RangeError; Also verify verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      try {
        dst.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }

      {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        dst.set(src, 2);
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(threw).assertTrue();
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_2900
     * @tc.name int32ArrayOverviewPart07TestMindmapTest029
     * @tc.desc Verify set offset=dst.length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0]);
      let src: Int32Array = new Int32Array([1]);
      try {
        dst.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3000
     * @tc.name int32ArrayOverviewPart07TestMindmapTest030
     * @tc.desc Verify set offset=dst.length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([7, 8, 9]);
      let src: Int32Array = new Int32Array(0);
      dst.set(src, 3);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest031
     * @tc.desc Verify byteOffset + length*4 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 4, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest032
     * @tc.desc Verify byteOffset buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 20);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest033
     * @tc.desc Verify fill start > end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(9, 3, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest034
     * @tc.desc Verify fill start clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7, -10, 2);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest035
     * @tc.desc Verify fill end length clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(8, 2, 100);
      expect(arr.$_get(2)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3600
     * @tc.name int32ArrayOverviewPart07TestMindmapTest036
     * @tc.desc Verify copyWithin target length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.copyWithin(10, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3700
     * @tc.name int32ArrayOverviewPart07TestMindmapTest037
     * @tc.desc Verify copyWithin start >= end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.copyWithin(0, 5, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3800
     * @tc.name int32ArrayOverviewPart07TestMindmapTest038
     * @tc.desc Verify slice start > end buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.slice(3, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_3900
     * @tc.name int32ArrayOverviewPart07TestMindmapTest039
     * @tc.desc Verify subarray begin/end begin>=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.subarray(3, 1);
      expect(r.length).assertEqual(0);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4000
     * @tc.name int32ArrayOverviewPart07TestMindmapTest040
     * @tc.desc Verify indexOf fromIndex length+fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 2]);
      expect(arr.indexOf(2, -3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest041
     * @tc.desc Verify indexOf fromIndex >= length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.indexOf(2, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest042
     * @tc.desc Verify lastIndexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 2]);
      expect(arr.lastIndexOf(2, -2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest043
     * @tc.desc Verify lastIndexOf fromIndex <0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.lastIndexOf(2, -10)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest044
     * @tc.desc Verify includes fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.includes(3, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest045
     * @tc.desc Verify reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: number = arr.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4600
     * @tc.name int32ArrayOverviewPart07TestMindmapTest046
     * @tc.desc Verify reduce initialValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: number = arr.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v, 7);
      expect(r).assertEqual(7);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4700
     * @tc.name int32ArrayOverviewPart07TestMindmapTest047
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.map((v: number, _i: int, _arr: Int32Array): number => {
          throw new Error('map boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4800
     * @tc.name int32ArrayOverviewPart07TestMindmapTest048
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.filter((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('filter boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_4900
     * @tc.name int32ArrayOverviewPart07TestMindmapTest049
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.forEach((v: number, _i: int, _arr: Int32Array): void => {
          throw new Error('forEach boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5000
     * @tc.name int32ArrayOverviewPart07TestMindmapTest050
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.find((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('find boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest051
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.findIndex((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('findIndex boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest052
     * @tc.desc Verify findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.findLast((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('findLast boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest053
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.findLastIndex((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('findLastIndex boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest054
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.some((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('some boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest055
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.every((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('every boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5600
     * @tc.name int32ArrayOverviewPart07TestMindmapTest056
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => {
          throw new Error('reduce boom');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5700
     * @tc.name int32ArrayOverviewPart07TestMindmapTest057
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.reduceRight((acc: number, v: number, _i: int, _arr: Int32Array): number => {
          throw new Error('reduceRight boom');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5800
     * @tc.name int32ArrayOverviewPart07TestMindmapTest058
     * @tc.desc Verify sort compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      try {
        arr.sort((_a: number, _b: number): int => {
          throw new Error('sort boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_5900
     * @tc.name int32ArrayOverviewPart07TestMindmapTest059
     * @tc.desc Verify from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      try {
        Int32Array.from(src, (_v: number, _i: number): number => {
          throw new Error('from boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6000
     * @tc.name int32ArrayOverviewPart07TestMindmapTest060
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: boolean = arr.some((v: number, _i: int, _arr: Int32Array): boolean => {
        called = true;
        return v > 0;
      });
      expect(r).assertFalse();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest061
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: boolean = arr.every((v: number, _i: int, _arr: Int32Array): boolean => {
        called = true;
        return v > 0;
      });
      expect(r).assertTrue();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest062
     * @tc.desc Verify find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let v: number | undefined = arr.find((x: number, _i: int, _arr: Int32Array): boolean => x === 0);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest063
     * @tc.desc Verify findIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.findIndex((x: number, _i: int, _arr: Int32Array): boolean => x === 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest064
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.findLastIndex((x: number, _i: int, _arr: Int32Array): boolean => x === 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest065
     * @tc.desc Verify reverse this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6600
     * @tc.name int32ArrayOverviewPart07TestMindmapTest066
     * @tc.desc Verify sort this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.sort((a: number, b: number): int => {
        if (a > b) {
          return 1;
        }
        if (a < b) {
          return -1;
        }
        return 0;
      });
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6700
     * @tc.name int32ArrayOverviewPart07TestMindmapTest067
     * @tc.desc Verify fill length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.fill(7);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6800
     * @tc.name int32ArrayOverviewPart07TestMindmapTest068
     * @tc.desc Verify copyWithin no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9]);
      arr.copyWithin(0, 0, 1);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_6900
     * @tc.name int32ArrayOverviewPart07TestMindmapTest069
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return 1;
        }
        if (a < b) {
          return -1;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7000
     * @tc.name int32ArrayOverviewPart07TestMindmapTest070
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7]);
      expect(arr.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest071
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7]);
      expect(arr.lastIndexOf(7)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest072
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 3, 3]);
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest073
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 4, 4]);
      expect(arr.some((v: number, _i: int, _arr: Int32Array): boolean => v !== 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest074
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 4, 4]);
      expect(arr.every((v: number, _i: int, _arr: Int32Array): boolean => v !== 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest075
     * @tc.desc Verify $_set +Infinity ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7600
     * @tc.name int32ArrayOverviewPart07TestMindmapTest076
     * @tc.desc Verify fill +Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7700
     * @tc.name int32ArrayOverviewPart07TestMindmapTest077
     * @tc.desc Verify with 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(1, 2147483649);
      expect(r.$_get(1)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7800
     * @tc.name int32ArrayOverviewPart07TestMindmapTest078
     * @tc.desc Verify fill -2147483649 MIN-1 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(-2147483649);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_7900
     * @tc.name int32ArrayOverviewPart07TestMindmapTest079
     * @tc.desc Verify includes NaN SameValueZero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.includes(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_8000
     * @tc.name int32ArrayOverviewPart07TestMindmapTest080
     * @tc.desc Verify indexOf NaN Strict Equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr.indexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_8100
     * @tc.name int32ArrayOverviewPart07TestMindmapTest081
     * @tc.desc Verify lastIndexOf NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr.lastIndexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_8200
     * @tc.name int32ArrayOverviewPart07TestMindmapTest082
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let visits: number = 0;
      let r: boolean = arr.some((v: number, _i: int, _arr: Int32Array): boolean => {
        visits++;
        return v === 2;
      });
      expect(r).assertTrue();
      expect(visits).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_8300
     * @tc.name int32ArrayOverviewPart07TestMindmapTest083
     * @tc.desc Verify every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let visits: number = 0;
      let r: boolean = arr.every((v: number, _i: int, _arr: Int32Array): boolean => {
        visits++;
        return v < 2;
      });
      expect(r).assertFalse();
      expect(visits).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_8400
     * @tc.name int32ArrayOverviewPart07TestMindmapTest084
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let visits: number = 0;
      let r: number | undefined = arr.find((v: number, _i: int, _arr: Int32Array): boolean => {
        visits++;
        return v === 3;
      });
      expect(r).assertEqual(3);
      expect(visits).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART07_TEST_MINDMAP_8500
     * @tc.name int32ArrayOverviewPart07TestMindmapTest085
     * @tc.desc Verify filter false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart07TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.filter((v: number, _i: int, _arr: Int32Array): boolean => false);
      expect(r.length).assertEqual(0);
    });
  });
}
