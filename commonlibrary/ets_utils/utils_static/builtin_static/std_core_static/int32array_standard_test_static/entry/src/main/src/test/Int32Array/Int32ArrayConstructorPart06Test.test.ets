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
export default function int32ArrayConstructorPart06TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart06TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0100
     * @tc.name int32ArrayConstructorPart06TestMindmapTest001
     * @tc.desc Verify FixedArray\<number\> length=0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [];
      let a: Int32Array = new Int32Array(src);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0200
     * @tc.name int32ArrayConstructorPart06TestMindmapTest002
     * @tc.desc Verify FixedArray\<number\> length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [42.0];
      let a: Int32Array = new Int32Array(src);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0300
     * @tc.name int32ArrayConstructorPart06TestMindmapTest003
     * @tc.desc Verify 5 FixedArray\<number\> length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1, 2, 3, 4, 5];
      let a: Int32Array = new Int32Array(src);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0400
     * @tc.name int32ArrayConstructorPart06TestMindmapTest004
     * @tc.desc Verify 16 FixedArray\<number\> length 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [0,1,2,3,4,5,6.0,7.0,8.0,9.0,10,11.0,12.0,13.0,14.0,15.0];
      let a: Int32Array = new Int32Array(src);
      expect(a.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0500
     * @tc.name int32ArrayConstructorPart06TestMindmapTest005
     * @tc.desc Verify 0 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0600
     * @tc.name int32ArrayConstructorPart06TestMindmapTest006
     * @tc.desc Verify 1 $_get(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0700
     * @tc.name int32ArrayConstructorPart06TestMindmapTest007
     * @tc.desc Verify -1 $_get(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0800
     * @tc.name int32ArrayConstructorPart06TestMindmapTest008
     * @tc.desc Verify 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_0900
     * @tc.name int32ArrayConstructorPart06TestMindmapTest009
     * @tc.desc Verify -7.0 -7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-7.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1000
     * @tc.name int32ArrayConstructorPart06TestMindmapTest010
     * @tc.desc Verify 100.0 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1100
     * @tc.name int32ArrayConstructorPart06TestMindmapTest011
     * @tc.desc Verify -100.0 -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-100.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1200
     * @tc.name int32ArrayConstructorPart06TestMindmapTest012
     * @tc.desc Verify INT32_MAX 2147483647.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1300
     * @tc.name int32ArrayConstructorPart06TestMindmapTest013
     * @tc.desc Verify INT32_MIN -2147483648.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1400
     * @tc.name int32ArrayConstructorPart06TestMindmapTest014
     * @tc.desc Verify -0 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1500
     * @tc.name int32ArrayConstructorPart06TestMindmapTest015
     * @tc.desc Verify [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.$_get(3)).assertEqual(4);
      expect(a.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1600
     * @tc.name int32ArrayConstructorPart06TestMindmapTest016
     * @tc.desc Verify [-1,0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, 0, 1] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1700
     * @tc.name int32ArrayConstructorPart06TestMindmapTest017
     * @tc.desc Verify 0.999999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0.999999] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1800
     * @tc.name int32ArrayConstructorPart06TestMindmapTest018
     * @tc.desc Verify -0.999999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-0.999999] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_1900
     * @tc.name int32ArrayConstructorPart06TestMindmapTest019
     * @tc.desc Verify 3.7 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3.7] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2000
     * @tc.name int32ArrayConstructorPart06TestMindmapTest020
     * @tc.desc Verify -3.7 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-3.7] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2100
     * @tc.name int32ArrayConstructorPart06TestMindmapTest021
     * @tc.desc Verify 100.0001 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100.0001] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2200
     * @tc.name int32ArrayConstructorPart06TestMindmapTest022
     * @tc.desc Verify -100.999 -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-100.999] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2300
     * @tc.name int32ArrayConstructorPart06TestMindmapTest023
     * @tc.desc Verify 2147483647.9 MAX+1 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647.9] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2400
     * @tc.name int32ArrayConstructorPart06TestMindmapTest024
     * @tc.desc Verify [1,-2.7,3,-0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, -2.7, 3, -0, 0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(-2);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2500
     * @tc.name int32ArrayConstructorPart06TestMindmapTest025
     * @tc.desc Verify 2147483648.0 MAX+1 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483648.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2600
     * @tc.name int32ArrayConstructorPart06TestMindmapTest026
     * @tc.desc Verify 2147483649.0 MAX+2 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483649.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2700
     * @tc.name int32ArrayConstructorPart06TestMindmapTest027
     * @tc.desc Verify -2147483649.0 MIN-1 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483649.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2800
     * @tc.name int32ArrayConstructorPart06TestMindmapTest028
     * @tc.desc Verify 4294967295.0 0xFFFFFFFF, 2^32-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294967295.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_2900
     * @tc.name int32ArrayConstructorPart06TestMindmapTest029
     * @tc.desc Verify 4294967296.0 2^32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294967296.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3000
     * @tc.name int32ArrayConstructorPart06TestMindmapTest030
     * @tc.desc Verify 4294967297.0 2^32+1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294967297.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3100
     * @tc.name int32ArrayConstructorPart06TestMindmapTest031
     * @tc.desc Verify 3000000000.0 0xB2D05E00 ToInt32 -1294967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3000000000.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-1294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3200
     * @tc.name int32ArrayConstructorPart06TestMindmapTest032
     * @tc.desc Verify -3000000000.0 ToInt32 1294967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-3000000000.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(1294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3300
     * @tc.name int32ArrayConstructorPart06TestMindmapTest033
     * @tc.desc Verify 2147483648.5 2147483648 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483648.5] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3400
     * @tc.name int32ArrayConstructorPart06TestMindmapTest034
     * @tc.desc Verify -2147483649.5 -2147483649 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483649.5] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3500
     * @tc.name int32ArrayConstructorPart06TestMindmapTest035
     * @tc.desc Verify Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Double.NaN] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3600
     * @tc.name int32ArrayConstructorPart06TestMindmapTest036
     * @tc.desc Verify Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Double.POSITIVE_INFINITY] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3700
     * @tc.name int32ArrayConstructorPart06TestMindmapTest037
     * @tc.desc Verify Double.NEGATIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Double.NEGATIVE_INFINITY] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3800
     * @tc.name int32ArrayConstructorPart06TestMindmapTest038
     * @tc.desc Verify 9007199254740991 double 2^32 ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9007199254740991] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_3900
     * @tc.name int32ArrayConstructorPart06TestMindmapTest039
     * @tc.desc Verify -9007199254740991 ToInt32 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-9007199254740991] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4000
     * @tc.name int32ArrayConstructorPart06TestMindmapTest040
     * @tc.desc Verify [Number.NaN,Number.POSITIVE_INFINITY,Double.NEGATIVE_INFINITY,5.7] ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Double.NaN, Number.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, 5.7] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4100
     * @tc.name int32ArrayConstructorPart06TestMindmapTest041
     * @tc.desc Verify 1.5e2 =150.0 150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1.5e2] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4200
     * @tc.name int32ArrayConstructorPart06TestMindmapTest042
     * @tc.desc Verify -1.5e9 =-1500000000.0 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1.5e9] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-1500000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4300
     * @tc.name int32ArrayConstructorPart06TestMindmapTest043
     * @tc.desc Verify 2.5e9 =2500000000.0 int32 -1794967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2.5e9] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-1794967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4400
     * @tc.name int32ArrayConstructorPart06TestMindmapTest044
     * @tc.desc Verify 1e-6 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1e-6] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4500
     * @tc.name int32ArrayConstructorPart06TestMindmapTest045
     * @tc.desc Verify 4.294967296e9 =2^32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4.294967296e9] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4600
     * @tc.name int32ArrayConstructorPart06TestMindmapTest046
     * @tc.desc Verify [9.0,9.0,9.0] 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9.0, 9.0, 9.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(9);
      expect(a.$_get(1)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4700
     * @tc.name int32ArrayConstructorPart06TestMindmapTest047
     * @tc.desc Verify 0 [0,0,0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0, 0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4800
     * @tc.name int32ArrayConstructorPart06TestMindmapTest048
     * @tc.desc Verify [MAX,MIN,-1,0,1] int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647.0, -2147483648.0, -1, 0, 1] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(-2147483648);
      expect(a.$_get(2)).assertEqual(-1);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_4900
     * @tc.name int32ArrayConstructorPart06TestMindmapTest049
     * @tc.desc Verify 2147483648..2147483652 -2147483648..-2147483644
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483648.0, 2147483649.0, 2147483650.0, 2147483651.0, 2147483652.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-2147483648);
      expect(a.$_get(1)).assertEqual(-2147483647);
      expect(a.$_get(2)).assertEqual(-2147483646);
      expect(a.$_get(3)).assertEqual(-2147483645);
      expect(a.$_get(4)).assertEqual(-2147483644);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5000
     * @tc.name int32ArrayConstructorPart06TestMindmapTest050
     * @tc.desc Verify [-3,-2,-1,0,1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-3, -2, -1, 0, 1, 2, 3] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-3);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(6)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5100
     * @tc.name int32ArrayConstructorPart06TestMindmapTest051
     * @tc.desc Verify [-4,3,-2,1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-4, 3, -2, 1, 0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-4);
      expect(a.$_get(1)).assertEqual(3);
      expect(a.$_get(2)).assertEqual(-2);
      expect(a.$_get(3)).assertEqual(1);
      expect(a.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5200
     * @tc.name int32ArrayConstructorPart06TestMindmapTest052
     * @tc.desc Verify instanceof Int32Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2] as FixedArray<number>);
      let isTa: boolean = (a as Object) instanceof Int32Array;
      expect(isTa).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5300
     * @tc.name int32ArrayConstructorPart06TestMindmapTest053
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3] as FixedArray<number>);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5400
     * @tc.name int32ArrayConstructorPart06TestMindmapTest054
     * @tc.desc Verify 3 byteLength length*4=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3] as FixedArray<number>);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5500
     * @tc.name int32ArrayConstructorPart06TestMindmapTest055
     * @tc.desc Verify length and byteLength for empty FixedArray construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([] as FixedArray<number>);
      expect(a.byteLength).assertEqual(0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5600
     * @tc.name int32ArrayConstructorPart06TestMindmapTest056
     * @tc.desc Verify byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42.0] as FixedArray<number>);
      expect(a.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5700
     * @tc.name int32ArrayConstructorPart06TestMindmapTest057
     * @tc.desc Verify byteOffset 0 buffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2] as FixedArray<number>);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5800
     * @tc.name int32ArrayConstructorPart06TestMindmapTest058
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1] as FixedArray<number>);
      let isAb: boolean = (a.buffer as Object) instanceof ArrayBuffer;
      expect(isAb).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_5900
     * @tc.name int32ArrayConstructorPart06TestMindmapTest059
     * @tc.desc Verify buffer.byteLength a.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3] as FixedArray<number>);
      expect(a.buffer.byteLength).assertEqual(a.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6000
     * @tc.name int32ArrayConstructorPart06TestMindmapTest060
     * @tc.desc Verify buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([] as FixedArray<number>);
      expect(a.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6100
     * @tc.name int32ArrayConstructorPart06TestMindmapTest061
     * @tc.desc Verify name "Int32Array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1] as FixedArray<number>);
      expect(a.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6200
     * @tc.name int32ArrayConstructorPart06TestMindmapTest062
     * @tc.desc Verify FixedArray\<number\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2] as FixedArray<number>);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6300
     * @tc.name int32ArrayConstructorPart06TestMindmapTest063
     * @tc.desc Verify Number.NaN/Number.POSITIVE_INFINITY/ FixedArray ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Double.NaN, Double.POSITIVE_INFINITY, 2147483648.0] as FixedArray<number>);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6400
     * @tc.name int32ArrayConstructorPart06TestMindmapTest064
     * @tc.desc Verify 3/3/3 -3/-3/-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 3, 3, -3, -3, -3] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(3);
      expect(a.$_get(1)).assertEqual(3);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.$_get(3)).assertEqual(-3);
      expect(a.$_get(4)).assertEqual(-3);
      expect(a.$_get(5)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6500
     * @tc.name int32ArrayConstructorPart06TestMindmapTest065
     * @tc.desc Verify MAX MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647.0, -2147483648.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6600
     * @tc.name int32ArrayConstructorPart06TestMindmapTest066
     * @tc.desc Verify MIN-1 MAX MAX+1 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483648.0, -2147483649.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-2147483648);
      expect(a.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6700
     * @tc.name int32ArrayConstructorPart06TestMindmapTest067
     * @tc.desc Verify 2^32 4294967296.0 0 4294967295.0 -1 4294967297.0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294967295.0, 4294967296.0, 4294967297.0] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6800
     * @tc.name int32ArrayConstructorPart06TestMindmapTest068
     * @tc.desc Verify ToInt32 1.999999 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1.999999] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_6900
     * @tc.name int32ArrayConstructorPart06TestMindmapTest069
     * @tc.desc Verify -0.0001 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-0.0001] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7000
     * @tc.name int32ArrayConstructorPart06TestMindmapTest070
     * @tc.desc Verify Number.NaN/Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Double.NaN, Number.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, 100.9, 2147483648.5] as FixedArray<number>);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(100);
      expect(a.$_get(4)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7100
     * @tc.name int32ArrayConstructorPart06TestMindmapTest071
     * @tc.desc Verify FixedArray Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1, 2, 3];
      let a: Int32Array = new Int32Array(src);
      src[0] = 999.0;
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7200
     * @tc.name int32ArrayConstructorPart06TestMindmapTest072
     * @tc.desc Verify Int32Array $_set FixedArray number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1, 2, 3];
      let a: Int32Array = new Int32Array(src);
      a.$_set(0, 777);
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7300
     * @tc.name int32ArrayConstructorPart06TestMindmapTest073
     * @tc.desc Verify FixedArray Int32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1, 2];
      let a: Int32Array = new Int32Array(src);
      let b: Int32Array = new Int32Array(src);
      let sameBuf: boolean = a.buffer === b.buffer;
      expect(sameBuf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7400
     * @tc.name int32ArrayConstructorPart06TestMindmapTest074
     * @tc.desc Verify Int32Array Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [10, 20.0];
      let a: Int32Array = new Int32Array(src);
      let b: Int32Array = new Int32Array(src);
      a.$_set(0, 999);
      expect(b.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7500
     * @tc.name int32ArrayConstructorPart06TestMindmapTest075
     * @tc.desc Verify FixedArray Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [5, 6.0];
      let a: Int32Array = new Int32Array(src);
      src = [99.0];
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7600
     * @tc.name int32ArrayConstructorPart06TestMindmapTest076
     * @tc.desc Verify buffer DataView a.buffer a TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1, 2];
      let a: Int32Array = new Int32Array(src);
      let b: Int32Array = new Int32Array(src);
      let dv: DataView = new DataView(a.buffer);
      dv.setInt32(0, 123, true);
      expect(a.$_get(0)).assertEqual(123);
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7700
     * @tc.name int32ArrayConstructorPart06TestMindmapTest077
     * @tc.desc Verify FixedArray 1 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1, 2.7];
      let a: Int32Array = new Int32Array(src);
      expect(a.$_get(0)).assertEqual(1);
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART06_TEST_MINDMAP_7800
     * @tc.name int32ArrayConstructorPart06TestMindmapTest078
     * @tc.desc Verify FixedArray buffer null byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart06TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [];
      let a: Int32Array = new Int32Array(src);
      expect(a.buffer.byteLength).assertEqual(0);
    });
  });
}
