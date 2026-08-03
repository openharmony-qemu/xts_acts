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
export default function int32ArrayConstructorPart05TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart05TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0010
     * @tc.name int32ArrayConstructorPart05TestMindmapTest001
     * @tc.desc Verify arity=1 FixedArray<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0020
     * @tc.name int32ArrayConstructorPart05TestMindmapTest002
     * @tc.desc Verify result properties for empty FixedArray construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([]);
      expect(dst.length).assertEqual(0);
      expect(dst.byteLength).assertEqual(0);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0030
     * @tc.name int32ArrayConstructorPart05TestMindmapTest003
     * @tc.desc Verify arity=1 FixedArray<int> length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([42]);
      expect(dst.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0040
     * @tc.name int32ArrayConstructorPart05TestMindmapTest004
     * @tc.desc Verify FixedArray buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([]);
      expect(dst.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0050
     * @tc.name int32ArrayConstructorPart05TestMindmapTest005
     * @tc.desc Verify FixedArray byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0]);
      expect(dst.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0060
     * @tc.name int32ArrayConstructorPart05TestMindmapTest006
     * @tc.desc Verify FixedArray byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2]);
      expect(dst.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0070
     * @tc.name int32ArrayConstructorPart05TestMindmapTest007
     * @tc.desc Verify FixedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40]);
      expect(dst.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0080
     * @tc.name int32ArrayConstructorPart05TestMindmapTest008
     * @tc.desc Verify FixedArray byteLength = 6*4 = 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      expect(dst.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0090
     * @tc.name int32ArrayConstructorPart05TestMindmapTest009
     * @tc.desc Verify FixedArray length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70, 80]);
      expect(dst.length).assertEqual(8);
      expect(dst.$_get(7)).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0100
     * @tc.name int32ArrayConstructorPart05TestMindmapTest010
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0]);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0110
     * @tc.name int32ArrayConstructorPart05TestMindmapTest011
     * @tc.desc Verify 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1]);
      expect(dst.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0120
     * @tc.name int32ArrayConstructorPart05TestMindmapTest012
     * @tc.desc Verify -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-1]);
      expect(dst.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0130
     * @tc.name int32ArrayConstructorPart05TestMindmapTest013
     * @tc.desc Verify 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2]);
      expect(dst.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0140
     * @tc.name int32ArrayConstructorPart05TestMindmapTest014
     * @tc.desc Verify -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-2]);
      expect(dst.$_get(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0150
     * @tc.name int32ArrayConstructorPart05TestMindmapTest015
     * @tc.desc Verify INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2147483647]);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0160
     * @tc.name int32ArrayConstructorPart05TestMindmapTest016
     * @tc.desc Verify INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-2147483648]);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0170
     * @tc.name int32ArrayConstructorPart05TestMindmapTest017
     * @tc.desc Verify INT_MAX-1 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2147483646]);
      expect(dst.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0180
     * @tc.name int32ArrayConstructorPart05TestMindmapTest018
     * @tc.desc Verify INT_MIN+1 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-2147483647]);
      expect(dst.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0190
     * @tc.name int32ArrayConstructorPart05TestMindmapTest019
     * @tc.desc Verify [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([100]);
      expect(dst.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0200
     * @tc.name int32ArrayConstructorPart05TestMindmapTest020
     * @tc.desc Verify [-100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-100]);
      expect(dst.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0210
     * @tc.name int32ArrayConstructorPart05TestMindmapTest021
     * @tc.desc Verify [100000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([100000]);
      expect(dst.$_get(0)).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0220
     * @tc.name int32ArrayConstructorPart05TestMindmapTest022
     * @tc.desc Verify [-100000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-100000]);
      expect(dst.$_get(0)).assertEqual(-100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0230
     * @tc.name int32ArrayConstructorPart05TestMindmapTest023
     * @tc.desc Verify 0xFF 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0xFF]);
      expect(dst.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0240
     * @tc.name int32ArrayConstructorPart05TestMindmapTest024
     * @tc.desc Verify 0o77 63 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0o77]);
      expect(dst.$_get(0)).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0250
     * @tc.name int32ArrayConstructorPart05TestMindmapTest025
     * @tc.desc Verify 0b1010 10 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0b1010]);
      expect(dst.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0260
     * @tc.name int32ArrayConstructorPart05TestMindmapTest026
     * @tc.desc Verify [0,0,0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0270
     * @tc.name int32ArrayConstructorPart05TestMindmapTest027
     * @tc.desc Verify [7,7,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([7, 7, 7]);
      expect(dst.$_get(1)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0280
     * @tc.name int32ArrayConstructorPart05TestMindmapTest028
     * @tc.desc Verify [1,-1,2,-2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, -1, 2, -2]);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(-1);
      expect(dst.$_get(3)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0290
     * @tc.name int32ArrayConstructorPart05TestMindmapTest029
     * @tc.desc Verify [5,5,5] 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([5, 5, 5]);
      expect(dst.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0300
     * @tc.name int32ArrayConstructorPart05TestMindmapTest030
     * @tc.desc Verify INT_MAX INT_MIN [INT_MAX, INT_MIN] INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2147483647, -2147483648]);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0310
     * @tc.name int32ArrayConstructorPart05TestMindmapTest031
     * @tc.desc Verify INT_MAX INT_MIN INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2147483647, -2147483648]);
      expect(dst.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0320
     * @tc.name int32ArrayConstructorPart05TestMindmapTest032
     * @tc.desc Verify [0, INT_MAX, INT_MIN] INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 2147483647, -2147483648]);
      expect(dst.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0330
     * @tc.name int32ArrayConstructorPart05TestMindmapTest033
     * @tc.desc Verify [0, INT_MAX, INT_MIN] INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 2147483647, -2147483648]);
      expect(dst.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0340
     * @tc.name int32ArrayConstructorPart05TestMindmapTest034
     * @tc.desc Verify [-1,-2,-3,-4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-1, -2, -3, -4]);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(3)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0350
     * @tc.name int32ArrayConstructorPart05TestMindmapTest035
     * @tc.desc Verify [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0360
     * @tc.name int32ArrayConstructorPart05TestMindmapTest036
     * @tc.desc Verify [-1000,-2000,-3000] -3000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-1000, -2000, -3000]);
      expect(dst.$_get(2)).assertEqual(-3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0370
     * @tc.name int32ArrayConstructorPart05TestMindmapTest037
     * @tc.desc Verify [1000,2000,3000] 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1000, 2000, 3000]);
      expect(dst.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0380
     * @tc.name int32ArrayConstructorPart05TestMindmapTest038
     * @tc.desc Verify [0,-1,1,2147483647,-2147483648]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, -1, 1, 2147483647, -2147483648]);
      expect(dst.length).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(2147483647);
      expect(dst.$_get(4)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0390
     * @tc.name int32ArrayConstructorPart05TestMindmapTest039
     * @tc.desc Verify INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2147483647, 0, 0, 0]);
      expect(dst.$_get(0)).assertEqual(2147483647);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0400
     * @tc.name int32ArrayConstructorPart05TestMindmapTest040
     * @tc.desc Verify INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, -2147483648]);
      expect(dst.$_get(3)).assertEqual(-2147483648);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0410
     * @tc.name int32ArrayConstructorPart05TestMindmapTest041
     * @tc.desc Verify [-2147483648, 0, 2147483647]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      expect(dst.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0420
     * @tc.name int32ArrayConstructorPart05TestMindmapTest042
     * @tc.desc Verify [0x0, 0xFF, 0x100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0x0, 0xFF, 0x100]);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(255);
      expect(dst.$_get(2)).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0430
     * @tc.name int32ArrayConstructorPart05TestMindmapTest043
     * @tc.desc Verify Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2]);
      let isInstance: boolean = dst instanceof Int32Array;
      expect(isInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0440
     * @tc.name int32ArrayConstructorPart05TestMindmapTest044
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0450
     * @tc.name int32ArrayConstructorPart05TestMindmapTest045
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1]);
      expect(dst.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0460
     * @tc.name int32ArrayConstructorPart05TestMindmapTest046
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2]);
      let isBuf: boolean = dst.buffer instanceof ArrayBuffer;
      expect(isBuf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0470
     * @tc.name int32ArrayConstructorPart05TestMindmapTest047
     * @tc.desc Verify buffer.byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([42]);
      expect(dst.buffer.byteLength).assertEqual(dst.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0480
     * @tc.name int32ArrayConstructorPart05TestMindmapTest048
     * @tc.desc Verify buffer.byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([]);
      expect(dst.buffer.byteLength).assertEqual(dst.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0490
     * @tc.name int32ArrayConstructorPart05TestMindmapTest049
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let len: number = dst.length;
      expect(len).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0500
     * @tc.name int32ArrayConstructorPart05TestMindmapTest050
     * @tc.desc Verify $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      expect(dst.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0510
     * @tc.name int32ArrayConstructorPart05TestMindmapTest051
     * @tc.desc Verify $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0520
     * @tc.name int32ArrayConstructorPart05TestMindmapTest052
     * @tc.desc Verify $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      expect(dst.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0530
     * @tc.name int32ArrayConstructorPart05TestMindmapTest053
     * @tc.desc Verify $_get(0) throws RangeError on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([]);
      try {
        dst.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0540
     * @tc.name int32ArrayConstructorPart05TestMindmapTest054
     * @tc.desc Verify [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([11, 22, 33]);
      expect(dst[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0550
     * @tc.name int32ArrayConstructorPart05TestMindmapTest055
     * @tc.desc Verify [length-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([11, 22, 33]);
      expect(dst[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0560
     * @tc.name int32ArrayConstructorPart05TestMindmapTest056
     * @tc.desc Verify two separate Int32Array instances constructed from identical arrays are distinct objects (not same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = new Int32Array([1, 2, 3]);
      let sameRef: boolean = a === b;
      expect(sameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0570
     * @tc.name int32ArrayConstructorPart05TestMindmapTest057
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = new Int32Array([1, 2, 3]);
      let sameBuf: boolean = a.buffer === b.buffer;
      expect(sameBuf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0580
     * @tc.name int32ArrayConstructorPart05TestMindmapTest058
     * @tc.desc Verify a b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = new Int32Array([1, 2, 3]);
      a.$_set(0, 999);
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0590
     * @tc.name int32ArrayConstructorPart05TestMindmapTest059
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      dst.$_set(0, 999);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0600
     * @tc.name int32ArrayConstructorPart05TestMindmapTest060
     * @tc.desc Verify modifying one Int32Array does not affect another independently constructed Int32Array with same initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      let b: Int32Array = new Int32Array([10, 20]);
      a.$_set(1, 777);
      expect(b.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0610
     * @tc.name int32ArrayConstructorPart05TestMindmapTest061
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let b: Int32Array = new Int32Array([1, 2]);
      a.fill(99);
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0620
     * @tc.name int32ArrayConstructorPart05TestMindmapTest062
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = new Int32Array([1, 2, 3]);
      a.reverse();
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0630
     * @tc.name int32ArrayConstructorPart05TestMindmapTest063
     * @tc.desc Verify buffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let view: Int32Array = new Int32Array(dst.buffer);
      expect(view.$_get(0)).assertEqual(1);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0640
     * @tc.name int32ArrayConstructorPart05TestMindmapTest064
     * @tc.desc Verify buffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let view: Int32Array = new Int32Array(dst.buffer);
      view.$_set(0, 111);
      expect(dst.$_get(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0650
     * @tc.name int32ArrayConstructorPart05TestMindmapTest065
     * @tc.desc Verify Int32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let view: Int32Array = new Int32Array(dst.buffer);
      dst.$_set(2, 222);
      expect(view.$_get(2)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0660
     * @tc.name int32ArrayConstructorPart05TestMindmapTest066
     * @tc.desc Verify subarray(0) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = dst.subarray(0);
      let sameBuf: boolean = sub.buffer === dst.buffer;
      expect(sameBuf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0670
     * @tc.name int32ArrayConstructorPart05TestMindmapTest067
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = dst.subarray(1, 3);
      sub.$_set(0, 888);
      expect(dst.$_get(1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0680
     * @tc.name int32ArrayConstructorPart05TestMindmapTest068
     * @tc.desc Verify byteOffset=4 Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40]);
      let view: Int32Array = new Int32Array(dst.buffer, 4);
      expect(view.$_get(0)).assertEqual(20);
      view.$_set(0, 222);
      expect(dst.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0690
     * @tc.name int32ArrayConstructorPart05TestMindmapTest069
     * @tc.desc Verify DataView INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2147483647]);
      let dv: DataView = new DataView(dst.buffer);
      expect(dv.getInt32(0, true)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0700
     * @tc.name int32ArrayConstructorPart05TestMindmapTest070
     * @tc.desc Verify DataView INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-2147483648]);
      let dv: DataView = new DataView(dst.buffer);
      expect(dv.getInt32(0, true)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0710
     * @tc.name int32ArrayConstructorPart05TestMindmapTest071
     * @tc.desc Verify DataView int32 Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0]);
      let dv: DataView = new DataView(dst.buffer);
      dv.setInt32(4, 12345, true);
      expect(dst.$_get(1)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0720
     * @tc.name int32ArrayConstructorPart05TestMindmapTest072
     * @tc.desc Verify Uint8Array Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0]);
      let u8: Uint8Array = new Uint8Array(dst.buffer);
      u8.$_set(0, 4);
      u8.$_set(1, 3);
      u8.$_set(2, 2);
      u8.$_set(3, 1);
      let dv: DataView = new DataView(dst.buffer);
      expect(dv.getInt32(0, true)).assertEqual(0x01020304);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0730
     * @tc.name int32ArrayConstructorPart05TestMindmapTest073
     * @tc.desc Verify FixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([]);
      let view: Int32Array = new Int32Array(dst.buffer);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0740
     * @tc.name int32ArrayConstructorPart05TestMindmapTest074
     * @tc.desc Verify 1 0 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1]);
      let u8: Uint8Array = new Uint8Array(dst.buffer);
      expect(u8.$_get(0)).assertEqual(1);
      expect(u8.$_get(1)).assertEqual(0);
      expect(u8.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0750
     * @tc.name int32ArrayConstructorPart05TestMindmapTest075
     * @tc.desc Verify byteOffset byteOffset=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let view: Int32Array = new Int32Array(dst.buffer, 8);
      expect(view.byteOffset).assertEqual(8);
      expect(view.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0760
     * @tc.name int32ArrayConstructorPart05TestMindmapTest076
     * @tc.desc Verify buffer byteOffset=8 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let view: Int32Array = new Int32Array(dst.buffer, 8, 2);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(3);
      expect(view.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0770
     * @tc.name int32ArrayConstructorPart05TestMindmapTest077
     * @tc.desc Verify INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      let view: Int32Array = new Int32Array(dst.buffer, 4, 2);
      view.$_set(1, 2147483647);
      expect(dst.$_get(2)).assertEqual(2147483647);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0780
     * @tc.name int32ArrayConstructorPart05TestMindmapTest078
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      dst.$_set(0, 99);
      expect(dst.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0790
     * @tc.name int32ArrayConstructorPart05TestMindmapTest079
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      dst.fill(7);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0800
     * @tc.name int32ArrayConstructorPart05TestMindmapTest080
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      dst.copyWithin(2, 0, 2);
      expect(dst.$_get(2)).assertEqual(1);
      expect(dst.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0810
     * @tc.name int32ArrayConstructorPart05TestMindmapTest081
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      dst.reverse();
      expect(dst.$_get(0)).assertEqual(3);
      expect(dst.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0820
     * @tc.name int32ArrayConstructorPart05TestMindmapTest082
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let sum: int = 0;
      for (let v of dst) {
        sum += v;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0830
     * @tc.name int32ArrayConstructorPart05TestMindmapTest083
     * @tc.desc Verify for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let count: int = 0;
      for (let v of dst) {
        count += 1;
        if (count === 2) {
          break;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0840
     * @tc.name int32ArrayConstructorPart05TestMindmapTest084
     * @tc.desc Verify for-of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([]);
      let count: int = 0;
      for (let v of dst) {
        count += 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0850
     * @tc.name int32ArrayConstructorPart05TestMindmapTest085
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let allPos: boolean = dst.every((v, _i, _a) => v > 0);
      expect(allPos).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0860
     * @tc.name int32ArrayConstructorPart05TestMindmapTest086
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, -2, 3]);
      let hasNeg: boolean = dst.some((v, _i, _a) => v < 0);
      expect(hasNeg).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0870
     * @tc.name int32ArrayConstructorPart05TestMindmapTest087
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let s: string = dst.join();
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0880
     * @tc.name int32ArrayConstructorPart05TestMindmapTest088
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let s: string = dst.toString();
      expect(s).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0890
     * @tc.name int32ArrayConstructorPart05TestMindmapTest089
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Int32Array = dst.slice(1, 3);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(2);
      expect(s.$_get(1)).assertEqual(3);
      let sameBuf: boolean = s.buffer === dst.buffer;
      expect(sameBuf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0900
     * @tc.name int32ArrayConstructorPart05TestMindmapTest090
     * @tc.desc Verify map Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let m: Int32Array = dst.map((v: number, _i: int, _a: Int32Array): number => v * 2);
      expect(m.$_get(0)).assertEqual(2);
      expect(m.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0910
     * @tc.name int32ArrayConstructorPart05TestMindmapTest091
     * @tc.desc Verify reduce without initialValue sums all elements (single-argument overload)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sum: number = dst.reduce((acc, v, _i, _a) => acc + v);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0920
     * @tc.name int32ArrayConstructorPart05TestMindmapTest092
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, -2, 3, -4]);
      let pos: Int32Array = dst.filter((v: number, _i: int, _a: Int32Array): boolean => v > 0);
      expect(pos.length).assertEqual(2);
      expect(pos.$_get(0)).assertEqual(1);
      expect(pos.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0930
     * @tc.name int32ArrayConstructorPart05TestMindmapTest093
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40]);
      expect(dst.indexOf(30)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0940
     * @tc.name int32ArrayConstructorPart05TestMindmapTest094
     * @tc.desc Verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let found: boolean = dst.includes(2);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0950
     * @tc.name int32ArrayConstructorPart05TestMindmapTest095
     * @tc.desc Verify entries done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20]);
      let iter = dst.entries();
      let first = iter.next();
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0960
     * @tc.name int32ArrayConstructorPart05TestMindmapTest096
     * @tc.desc Verify values done false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20]);
      let it = dst.values();
      let first = it.next();
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0970
     * @tc.name int32ArrayConstructorPart05TestMindmapTest097
     * @tc.desc Verify keys value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20]);
      let it = dst.keys();
      let first = it.next();
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0980
     * @tc.name int32ArrayConstructorPart05TestMindmapTest098
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      dst.set(Int32Array.of(7, 8), 1);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(8);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_0990
     * @tc.name int32ArrayConstructorPart05TestMindmapTest099
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let v: Object = dst.valueOf();
      let same: boolean = v === dst;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1000
     * @tc.name int32ArrayConstructorPart05TestMindmapTest100
     * @tc.desc Verify forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let count: int = 0;
      dst.forEach((_v: number, _i: int, _a: Int32Array): void => { count += 1; });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1010
     * @tc.name int32ArrayConstructorPart05TestMindmapTest101
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 20]);
      let idx: number = dst.findIndex((v, _i, _a) => v === 20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1020
     * @tc.name int32ArrayConstructorPart05TestMindmapTest102
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let found: number | undefined = dst.find((v, _i, _a) => v > 15);
      expect(found).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1030
     * @tc.name int32ArrayConstructorPart05TestMindmapTest103
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 20]);
      expect(dst.lastIndexOf(20)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1040
     * @tc.name int32ArrayConstructorPart05TestMindmapTest104
     * @tc.desc Verify at(0) $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      expect(dst.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1050
     * @tc.name int32ArrayConstructorPart05TestMindmapTest105
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      expect(dst.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1060
     * @tc.name int32ArrayConstructorPart05TestMindmapTest106
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let rev: Int32Array = dst.toReversed();
      expect(rev.$_get(0)).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1070
     * @tc.name int32ArrayConstructorPart05TestMindmapTest107
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([3, 1, 2]);
      let srt: Int32Array = dst.toSorted();
      expect(srt.$_get(0)).assertEqual(1);
      expect(srt.$_get(2)).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1080
     * @tc.name int32ArrayConstructorPart05TestMindmapTest108
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let w: Int32Array = dst.with(1, 99);
      expect(w.$_get(1)).assertEqual(99);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1090
     * @tc.name int32ArrayConstructorPart05TestMindmapTest109
     * @tc.desc Verify buffer.slice(0) creates independent buffer with same content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let newBuf: ArrayBuffer = dst.buffer.slice(0);
      let view: Int32Array = new Int32Array(newBuf);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(1);
      expect(view.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART05_TEST_MINDMAP_1100
     * @tc.name int32ArrayConstructorPart05TestMindmapTest110
     * @tc.desc Verify Uint8Array [-1] 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart05TestMindmapTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-1]);
      let u8: Uint8Array = new Uint8Array(dst.buffer);
      expect(u8.$_get(0)).assertEqual(0xFF);
      expect(u8.$_get(1)).assertEqual(0xFF);
      expect(u8.$_get(2)).assertEqual(0xFF);
      expect(u8.$_get(3)).assertEqual(0xFF);
    });
  });
}
