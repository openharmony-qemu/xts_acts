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

export default function int32ArraySubarrayPart05TestMindmapTestTest(): void {
  describe('Int32ArraySubarrayPart05TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0100
     * @tc.name int32ArraySubarrayPart05TestMindmapTest001
     * @tc.desc Verify subarray without bounds returns a full-length view with the same edge values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray();
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(11);
      expect(view.$_get(5)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0200
     * @tc.name int32ArraySubarrayPart05TestMindmapTest002
     * @tc.desc Verify begin end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(2);
      expect(view.length).assertEqual(4);
      expect(view.$_get(0)).assertEqual(33);
      expect(view.$_get(3)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0300
     * @tc.name int32ArraySubarrayPart05TestMindmapTest003
     * @tc.desc Verify begin=0 end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(7, 8, 9);
      let view: Int32Array = base.subarray(0);
      expect(view.length).assertEqual(3);
      expect(view.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0400
     * @tc.name int32ArraySubarrayPart05TestMindmapTest004
     * @tc.desc Verify begin end [begin, end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(1, 4);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(22);
      expect(view.$_get(2)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0500
     * @tc.name int32ArraySubarrayPart05TestMindmapTest005
     * @tc.desc Verify begin length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3, 4);
      let view: Int32Array = base.subarray(5);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0600
     * @tc.name int32ArraySubarrayPart05TestMindmapTest006
     * @tc.desc Verify begin=0 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(0, 4);
      expect(view.length).assertEqual(4);
      expect(view.$_get(0)).assertEqual(11);
      expect(view.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0700
     * @tc.name int32ArraySubarrayPart05TestMindmapTest007
     * @tc.desc Verify begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(-1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0800
     * @tc.name int32ArraySubarrayPart05TestMindmapTest008
     * @tc.desc Verify begin=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(-6);
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_0900
     * @tc.name int32ArraySubarrayPart05TestMindmapTest009
     * @tc.desc Verify begin=-(length+1) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(-7);
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1000
     * @tc.name int32ArraySubarrayPart05TestMindmapTest010
     * @tc.desc Verify begin=length start>=end end=length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(6);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1100
     * @tc.name int32ArraySubarrayPart05TestMindmapTest011
     * @tc.desc Verify begin=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(5);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1200
     * @tc.name int32ArraySubarrayPart05TestMindmapTest012
     * @tc.desc Verify begin=1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(1);
      expect(view.length).assertEqual(5);
      expect(view.$_get(0)).assertEqual(22);
      expect(view.$_get(4)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1300
     * @tc.name int32ArraySubarrayPart05TestMindmapTest013
     * @tc.desc Verify begin length clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let view: Int32Array = base.subarray(999999);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1400
     * @tc.name int32ArraySubarrayPart05TestMindmapTest014
     * @tc.desc Verify begin -length clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let view: Int32Array = base.subarray(-999999);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1500
     * @tc.name int32ArraySubarrayPart05TestMindmapTest015
     * @tc.desc Verify begin=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44);
      let view: Int32Array = base.subarray(-2);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(33);
      expect(view.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1600
     * @tc.name int32ArraySubarrayPart05TestMindmapTest016
     * @tc.desc Verify begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(73);
      let view: Int32Array = base.subarray(0);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(73);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1700
     * @tc.name int32ArraySubarrayPart05TestMindmapTest017
     * @tc.desc Verify begin=-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(59);
      let view: Int32Array = base.subarray(-1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(59);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1800
     * @tc.name int32ArraySubarrayPart05TestMindmapTest018
     * @tc.desc Verify begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(47);
      let view: Int32Array = base.subarray(1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_1900
     * @tc.name int32ArraySubarrayPart05TestMindmapTest019
     * @tc.desc Verify end=0 begin=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(0, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2000
     * @tc.name int32ArraySubarrayPart05TestMindmapTest020
     * @tc.desc Verify end=1 begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(0, 1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2100
     * @tc.name int32ArraySubarrayPart05TestMindmapTest021
     * @tc.desc Verify end=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(0, -1);
      expect(view.length).assertEqual(5);
      expect(view.$_get(4)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2200
     * @tc.name int32ArraySubarrayPart05TestMindmapTest022
     * @tc.desc Verify end=-length 0 begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(0, -6);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2300
     * @tc.name int32ArraySubarrayPart05TestMindmapTest023
     * @tc.desc Verify end=-(length+1) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(0, -7);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2400
     * @tc.name int32ArraySubarrayPart05TestMindmapTest024
     * @tc.desc Verify end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(2, 6);
      expect(view.length).assertEqual(4);
      expect(view.$_get(3)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2500
     * @tc.name int32ArraySubarrayPart05TestMindmapTest025
     * @tc.desc Verify end=length-1 begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(0, 5);
      expect(view.length).assertEqual(5);
      expect(view.$_get(4)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2600
     * @tc.name int32ArraySubarrayPart05TestMindmapTest026
     * @tc.desc Verify end=length+1 clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44);
      let view: Int32Array = base.subarray(1, 5);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(22);
      expect(view.$_get(2)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2700
     * @tc.name int32ArraySubarrayPart05TestMindmapTest027
     * @tc.desc Verify end length clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3, 4);
      let view: Int32Array = base.subarray(1, 999999);
      expect(view.length).assertEqual(3);
      expect(view.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2800
     * @tc.name int32ArraySubarrayPart05TestMindmapTest028
     * @tc.desc Verify end=-2 length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(0, -2);
      expect(view.length).assertEqual(3);
      expect(view.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_2900
     * @tc.name int32ArraySubarrayPart05TestMindmapTest029
     * @tc.desc Verify begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(4, 2);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3000
     * @tc.name int32ArraySubarrayPart05TestMindmapTest030
     * @tc.desc Verify begin/end begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(-2, -4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3100
     * @tc.name int32ArraySubarrayPart05TestMindmapTest031
     * @tc.desc Verify begin=0 end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(83);
      let view: Int32Array = base.subarray(0, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3200
     * @tc.name int32ArraySubarrayPart05TestMindmapTest032
     * @tc.desc Verify end=-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(83);
      let view: Int32Array = base.subarray(0, -1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3300
     * @tc.name int32ArraySubarrayPart05TestMindmapTest033
     * @tc.desc Verify subarray(0, 2) returns length 2 and values 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let view: Int32Array = base.subarray(0, 2);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(1);
      expect(view.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3400
     * @tc.name int32ArraySubarrayPart05TestMindmapTest034
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let view: Int32Array = base.subarray(1, 3);
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3500
     * @tc.name int32ArraySubarrayPart05TestMindmapTest035
     * @tc.desc Verify byteLength = length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(1, 4);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3600
     * @tc.name int32ArraySubarrayPart05TestMindmapTest036
     * @tc.desc Verify begin=2 byteOffset = byteOffset + 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(2, 5);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3700
     * @tc.name int32ArraySubarrayPart05TestMindmapTest037
     * @tc.desc Verify begin=0 byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44);
      let view: Int32Array = base.subarray(0, 3);
      expect(view.byteOffset).assertEqual(base.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3800
     * @tc.name int32ArraySubarrayPart05TestMindmapTest038
     * @tc.desc Verify byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33);
      let view: Int32Array = base.subarray();
      expect(view.byteLength).assertEqual(base.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_3900
     * @tc.name int32ArraySubarrayPart05TestMindmapTest039
     * @tc.desc Verify byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let view: Int32Array = base.subarray(9);
      expect(view.byteLength).assertEqual(0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4000
     * @tc.name int32ArraySubarrayPart05TestMindmapTest040
     * @tc.desc Verify begin=2 end=2 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(2, 2);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4100
     * @tc.name int32ArraySubarrayPart05TestMindmapTest041
     * @tc.desc Verify subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44);
      base.subarray(1, 3);
      expect(base.length).assertEqual(4);
      expect(base.$_get(0)).assertEqual(11);
      expect(base.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4200
     * @tc.name int32ArraySubarrayPart05TestMindmapTest042
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      base.subarray(0, 5);
      expect(base.$_get(0)).assertEqual(11);
      expect(base.$_get(1)).assertEqual(22);
      expect(base.$_get(2)).assertEqual(33);
      expect(base.$_get(3)).assertEqual(44);
      expect(base.$_get(4)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4300
     * @tc.name int32ArraySubarrayPart05TestMindmapTest043
     * @tc.desc Verify byteOffset=4 begin=1 byteOffset=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let base: Int32Array = new Int32Array(buf, 4, 4);
      base.$_set(0, 101);
      base.$_set(1, 202);
      base.$_set(2, 303);
      base.$_set(3, 404);
      let view: Int32Array = base.subarray(1, 3);
      expect(view.byteOffset).assertEqual(8);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(202);
      expect(view.$_get(1)).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4400
     * @tc.name int32ArraySubarrayPart05TestMindmapTest044
     * @tc.desc Verify byteOffset=4 begin=0 byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let base: Int32Array = new Int32Array(buf, 4, 4);
      let view: Int32Array = base.subarray(0, 2);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4500
     * @tc.name int32ArraySubarrayPart05TestMindmapTest045
     * @tc.desc Verify byteOffset=4 length=3 begin=-1 byteOffset=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let base: Int32Array = new Int32Array(buf, 4, 3);
      let view: Int32Array = base.subarray(-1);
      expect(view.length).assertEqual(1);
      expect(view.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4600
     * @tc.name int32ArraySubarrayPart05TestMindmapTest046
     * @tc.desc Verify ArrayBuffer buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let base: Int32Array = new Int32Array(buf);
      base.$_set(0, 11);
      base.$_set(1, 22);
      base.$_set(2, 33);
      base.$_set(3, 44);
      let view: Int32Array = base.subarray(1, 3);
      let same: boolean = (view.buffer === buf);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4700
     * @tc.name int32ArraySubarrayPart05TestMindmapTest047
     * @tc.desc Verify a subarray write updates the corresponding middle element of the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(1, 4);
      view.$_set(1, 1001);
      expect(base.$_get(2)).assertEqual(1001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4800
     * @tc.name int32ArraySubarrayPart05TestMindmapTest048
     * @tc.desc Verify a source write updates the corresponding element of its subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(1, 4);
      base.$_set(2, 2002);
      expect(view.$_get(1)).assertEqual(2002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_4900
     * @tc.name int32ArraySubarrayPart05TestMindmapTest049
     * @tc.desc Verify buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3, 4);
      let view: Int32Array = base.subarray(0, 4);
      let same: boolean = (view.buffer === base.buffer);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5000
     * @tc.name int32ArraySubarrayPart05TestMindmapTest050
     * @tc.desc Verify begin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let view: Int32Array = base.subarray(5, 10);
      let same: boolean = (view.buffer === base.buffer);
      expect(same).assertTrue();
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5100
     * @tc.name int32ArraySubarrayPart05TestMindmapTest051
     * @tc.desc Verify begin>end buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33);
      let view: Int32Array = base.subarray(3, 1);
      let same: boolean = (view.buffer === base.buffer);
      expect(same).assertTrue();
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5200
     * @tc.name int32ArraySubarrayPart05TestMindmapTest052
     * @tc.desc Verify begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(2);
      view.$_set(0, 3030);
      expect(base.$_get(2)).assertEqual(3030);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5300
     * @tc.name int32ArraySubarrayPart05TestMindmapTest053
     * @tc.desc Verify end-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let view: Int32Array = base.subarray(1, 5);
      view.$_set(3, 5050);
      expect(base.$_get(4)).assertEqual(5050);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5400
     * @tc.name int32ArraySubarrayPart05TestMindmapTest054
     * @tc.desc Verify $_set on an empty tail subarray throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let base: Int32Array = Int32Array.of(1, 2, 3);
        let view: Int32Array = base.subarray(3);
        view.$_set(0, 9090);
        expect(base.length).assertEqual(3);
        expect(base.$_get(2)).assertEqual(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5500
     * @tc.name int32ArraySubarrayPart05TestMindmapTest055
     * @tc.desc Verify $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let base: Int32Array = Int32Array.of(1, 2, 3);
        let view: Int32Array = base.subarray(3);
        view.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5600
     * @tc.name int32ArraySubarrayPart05TestMindmapTest056
     * @tc.desc Verify overlapping subarrays share changes made to their common source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let vA: Int32Array = base.subarray(0, 3);
      let vB: Int32Array = base.subarray(2, 5);
      vA.$_set(2, 7777);
      expect(vB.$_get(0)).assertEqual(7777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5700
     * @tc.name int32ArraySubarrayPart05TestMindmapTest057
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let firstVal: Int32Array = base.subarray(1, 5);
      let secondVal: Int32Array = firstVal.subarray(1, 3);
      let same: boolean = (secondVal.buffer === base.buffer);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5800
     * @tc.name int32ArraySubarrayPart05TestMindmapTest058
     * @tc.desc Verify subarray secondVal 33,44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let firstVal: Int32Array = base.subarray(1, 5);
      let secondVal: Int32Array = firstVal.subarray(1, 3);
      expect(secondVal.length).assertEqual(2);
      expect(secondVal.$_get(0)).assertEqual(33);
      expect(secondVal.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_5900
     * @tc.name int32ArraySubarrayPart05TestMindmapTest059
     * @tc.desc Verify subarray byteOffset 0 + 1*4 + 1*4 = 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let firstVal: Int32Array = base.subarray(1, 5);
      let secondVal: Int32Array = firstVal.subarray(1, 3);
      expect(secondVal.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6000
     * @tc.name int32ArraySubarrayPart05TestMindmapTest060
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(0, 0, 0, 0, 0, 0, 0, 0);
      let firstVal: Int32Array = base.subarray(1);
      let secondVal: Int32Array = firstVal.subarray(1);
      let thirdView: Int32Array = secondVal.subarray(1);
      thirdView.$_set(0, 4004);
      expect(base.$_get(3)).assertEqual(4004);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6100
     * @tc.name int32ArraySubarrayPart05TestMindmapTest061
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let firstVal: Int32Array = base.subarray(3);
      let secondVal: Int32Array = firstVal.subarray(0, 0);
      expect(secondVal.length).assertEqual(0);
      let same: boolean = (secondVal.buffer === base.buffer);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6200
     * @tc.name int32ArraySubarrayPart05TestMindmapTest062
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(5, 6, 7, 8);
      let firstVal: Int32Array = base.subarray(1, 4);
      let secondVal: Int32Array = firstVal.subarray();
      expect(secondVal.length).assertEqual(3);
      expect(secondVal.$_get(0)).assertEqual(6);
      expect(secondVal.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6300
     * @tc.name int32ArraySubarrayPart05TestMindmapTest063
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66, 77, 88);
      let firstVal: Int32Array = base.subarray(2, 7);
      let secondVal: Int32Array = firstVal.subarray(-2);
      expect(secondVal.length).assertEqual(2);
      expect(secondVal.$_get(0)).assertEqual(66);
      expect(secondVal.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6400
     * @tc.name int32ArraySubarrayPart05TestMindmapTest064
     * @tc.desc Verify of() INT_MIN/0/INT_MAX subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
      let view: Int32Array = base.subarray(0, 3);
      expect(view.$_get(0)).assertEqual(-2147483648);
      expect(view.$_get(1)).assertEqual(0);
      expect(view.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6500
     * @tc.name int32ArraySubarrayPart05TestMindmapTest065
     * @tc.desc Verify from(number[]) subarray(1,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.from([7, 8, 9, 10]);
      let view: Int32Array = base.subarray(1, 3);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(8);
      expect(view.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6600
     * @tc.name int32ArraySubarrayPart05TestMindmapTest066
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let base: Int32Array = new Int32Array(buf, 8, 4);
      base.$_set(0, 1);
      base.$_set(1, 2);
      base.$_set(2, 3);
      base.$_set(3, 4);
      let firstVal: Int32Array = base.subarray(1);
      let secondVal: Int32Array = firstVal.subarray(1);
      expect(secondVal.byteOffset).assertEqual(16);
      expect(secondVal.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6700
     * @tc.name int32ArraySubarrayPart05TestMindmapTest067
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(1, 4);
      let acc: Array<number> = new Array<number>();
      let viewLen: number = view.length;
      for (let i: number = 0; i < viewLen; i++) {
        acc.push(view.$_get(Double.toInt(i)));
      }
      expect(acc.length).assertEqual(3);
      expect(acc[0]).assertEqual(22);
      expect(acc[2]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6800
     * @tc.name int32ArraySubarrayPart05TestMindmapTest068
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3);
      let view: Int32Array = base.subarray(3);
      let n: number = 0;
      for (let _i = 0; _i < view.length; _i++) {
        view.$_get(_i);
        n = n + 1;
      }
      expect(n).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_6900
     * @tc.name int32ArraySubarrayPart05TestMindmapTest069
     * @tc.desc Verify subarray(1) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33);
      let firstVal: Int32Array = base.subarray(1, 2);
      let secondVal: Int32Array = firstVal.subarray(1);
      expect(secondVal.length).assertEqual(0);
      let same: boolean = (secondVal.buffer === base.buffer);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_7000
     * @tc.name int32ArraySubarrayPart05TestMindmapTest070
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let view: Int32Array = base.subarray(1, 4);
      let patch: Int32Array = Int32Array.of(51, 52, 53);
      view.set(patch);
      expect(base.$_get(1)).assertEqual(51);
      expect(base.$_get(2)).assertEqual(52);
      expect(base.$_get(3)).assertEqual(53);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_7100
     * @tc.name int32ArraySubarrayPart05TestMindmapTest071
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let view: Int32Array = base.subarray(1, 4);
      view.fill(6);
      expect(base.$_get(0)).assertEqual(0);
      expect(base.$_get(1)).assertEqual(6);
      expect(base.$_get(2)).assertEqual(6);
      expect(base.$_get(3)).assertEqual(6);
      expect(base.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_7200
     * @tc.name int32ArraySubarrayPart05TestMindmapTest072
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(1, 4);
      view.reverse();
      expect(base.$_get(0)).assertEqual(11);
      expect(base.$_get(1)).assertEqual(44);
      expect(base.$_get(2)).assertEqual(33);
      expect(base.$_get(3)).assertEqual(22);
      expect(base.$_get(4)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_7300
     * @tc.name int32ArraySubarrayPart05TestMindmapTest073
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let view: Int32Array = base.subarray(0, 5);
      view.copyWithin(2, 0, 2);
      expect(base.$_get(2)).assertEqual(11);
      expect(base.$_get(3)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_7400
     * @tc.name int32ArraySubarrayPart05TestMindmapTest074
     * @tc.desc Verify INT_MIN/INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(2147483647, -2147483648, 0);
      let view: Int32Array = base.subarray(0, 3);
      expect(view.$_get(0)).assertEqual(2147483647);
      expect(view.$_get(1)).assertEqual(-2147483648);
      expect(view.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART05_TEST_MINDMAP_7500
     * @tc.name int32ArraySubarrayPart05TestMindmapTest075
     * @tc.desc Verify buffer Int32Array length/offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart05TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let base: Int32Array = new Int32Array(buf, 0, 6);
      let view: Int32Array = base.subarray(2, 5);
      let other: Int32Array = new Int32Array(buf, 20, 2);
      base.$_set(5, 91);
      expect(view.length).assertEqual(3);
      expect(other.length).assertEqual(2);
      expect(base.$_get(5)).assertEqual(91);
    });
  });
}
