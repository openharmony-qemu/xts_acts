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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayConstructorPart07TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart07TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0010
     * @tc.name int32ArrayConstructorPart07TestMindmapTest001
     * @tc.desc Verify Array<int> arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0020
     * @tc.name int32ArrayConstructorPart07TestMindmapTest002
     * @tc.desc Verify length and byteLength for empty Array<int> construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0030
     * @tc.name int32ArrayConstructorPart07TestMindmapTest003
     * @tc.desc Verify Array<int> length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0040
     * @tc.name int32ArrayConstructorPart07TestMindmapTest004
     * @tc.desc Verify Array<int> length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, -20];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(-20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0050
     * @tc.name int32ArrayConstructorPart07TestMindmapTest005
     * @tc.desc Verify Array<int> 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 1, -1, 2, -2, 3, -3, 4];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(8);
      for (let i: int = 0; i < 8; i++) {
        expect(arr.$_get(i)).assertEqual(src[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0060
     * @tc.name int32ArrayConstructorPart07TestMindmapTest006
     * @tc.desc Verify Array<int> 32 length=32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      for (let i: int = 0; i < 32; i++) {
        src.push(i - 16);
      }
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(32);
      for (let i: int = 0; i < 32; i++) {
        expect(arr.$_get(i)).assertEqual(src[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0070
     * @tc.name int32ArrayConstructorPart07TestMindmapTest007
     * @tc.desc Verify 0 Array<int> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0080
     * @tc.name int32ArrayConstructorPart07TestMindmapTest008
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 100, 9999];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(100);
      expect(arr.$_get(2)).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0090
     * @tc.name int32ArrayConstructorPart07TestMindmapTest009
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1, -100, -9999];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-100);
      expect(arr.$_get(2)).assertEqual(-9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0100
     * @tc.name int32ArrayConstructorPart07TestMindmapTest010
     * @tc.desc Verify 0 Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, -1, 2, -2, 0];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(-2);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0110
     * @tc.name int32ArrayConstructorPart07TestMindmapTest011
     * @tc.desc Verify [1] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0120
     * @tc.name int32ArrayConstructorPart07TestMindmapTest012
     * @tc.desc Verify [-1] -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0130
     * @tc.name int32ArrayConstructorPart07TestMindmapTest013
     * @tc.desc Verify INT_MAX=2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0140
     * @tc.name int32ArrayConstructorPart07TestMindmapTest014
     * @tc.desc Verify INT_MIN=-2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-2147483648];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0150
     * @tc.name int32ArrayConstructorPart07TestMindmapTest015
     * @tc.desc Verify INT_MAX INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647, -2147483648];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0160
     * @tc.name int32ArrayConstructorPart07TestMindmapTest016
     * @tc.desc Verify INT_MAX Array<int> 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647, 2147483647, 2147483647];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0170
     * @tc.name int32ArrayConstructorPart07TestMindmapTest017
     * @tc.desc Verify INT_MIN Array<int> -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-2147483648, -2147483648, -2147483648];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0180
     * @tc.name int32ArrayConstructorPart07TestMindmapTest018
     * @tc.desc Verify 0x7FFFFFFF =INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0x7FFFFFFF];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0190
     * @tc.name int32ArrayConstructorPart07TestMindmapTest019
     * @tc.desc Verify -0x80000000 =INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-0x80000000];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0200
     * @tc.name int32ArrayConstructorPart07TestMindmapTest020
     * @tc.desc Verify 0 INT_MAX INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 2147483647, -2147483648];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0210
     * @tc.name int32ArrayConstructorPart07TestMindmapTest021
     * @tc.desc Verify Array<int> ToInt32 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [100];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0220
     * @tc.name int32ArrayConstructorPart07TestMindmapTest022
     * @tc.desc Verify Array<int> 0 0 -0 +0 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0230
     * @tc.name int32ArrayConstructorPart07TestMindmapTest023
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30, 40, 50];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0240
     * @tc.name int32ArrayConstructorPart07TestMindmapTest024
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [50, 40, 30, 20, 10];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(1)).assertEqual(40);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(20);
      expect(arr.$_get(4)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0250
     * @tc.name int32ArrayConstructorPart07TestMindmapTest025
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [7, 7, 7, 7, 7];
      let arr: Int32Array = new Int32Array(src);
      for (let i: int = 0; i < 5; i++) {
        expect(arr.$_get(i)).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0260
     * @tc.name int32ArrayConstructorPart07TestMindmapTest026
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, -1, 2, -2, 3, -3];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(-2);
      expect(arr.$_get(4)).assertEqual(3);
      expect(arr.$_get(5)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0270
     * @tc.name int32ArrayConstructorPart07TestMindmapTest027
     * @tc.desc Verify push Array<int> push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      src.push(10);
      src.push(20);
      src.push(30);
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0280
     * @tc.name int32ArrayConstructorPart07TestMindmapTest028
     * @tc.desc Verify push Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      src.push(2147483647);
      src.push(-2147483648);
      src.push(0);
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0290
     * @tc.name int32ArrayConstructorPart07TestMindmapTest029
     * @tc.desc Verify push Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      src.push(3);
      src.push(4);
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0300
     * @tc.name int32ArrayConstructorPart07TestMindmapTest030
     * @tc.desc Verify instanceof Int32Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      let isInst: boolean = (arr as Object) instanceof Int32Array;
      expect(isInst).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0310
     * @tc.name int32ArrayConstructorPart07TestMindmapTest031
     * @tc.desc Verify instanceof Array false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      let isArr: boolean = (arr as Object) instanceof Array;
      expect(isArr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0320
     * @tc.name int32ArrayConstructorPart07TestMindmapTest032
     * @tc.desc Verify Array<int> Int32Array length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0330
     * @tc.name int32ArrayConstructorPart07TestMindmapTest033
     * @tc.desc Verify Array<int> Int32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5, 6];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0340
     * @tc.name int32ArrayConstructorPart07TestMindmapTest034
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0350
     * @tc.name int32ArrayConstructorPart07TestMindmapTest035
     * @tc.desc Verify Array<int> Int32Array byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0360
     * @tc.name int32ArrayConstructorPart07TestMindmapTest036
     * @tc.desc Verify Array<int> Int32Array byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0370
     * @tc.name int32ArrayConstructorPart07TestMindmapTest037
     * @tc.desc Verify byteOffset 0 buffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0380
     * @tc.name int32ArrayConstructorPart07TestMindmapTest038
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      let isBuf: boolean = (arr.buffer as Object) instanceof ArrayBuffer;
      expect(isBuf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0390
     * @tc.name int32ArrayConstructorPart07TestMindmapTest039
     * @tc.desc Verify buffer.byteLength arr.byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0400
     * @tc.name int32ArrayConstructorPart07TestMindmapTest040
     * @tc.desc Verify buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0410
     * @tc.name int32ArrayConstructorPart07TestMindmapTest041
     * @tc.desc Verify Array<int> Int32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src1: Array<int> = [1, 2, 3];
      let src2: Array<int> = [4, 5, 6];
      let a1: Int32Array = new Int32Array(src1);
      let a2: Int32Array = new Int32Array(src2);
      let sameBuf: boolean = a1.buffer === a2.buffer;
      expect(sameBuf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0420
     * @tc.name int32ArrayConstructorPart07TestMindmapTest042
     * @tc.desc Verify $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0430
     * @tc.name int32ArrayConstructorPart07TestMindmapTest043
     * @tc.desc Verify $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0440
     * @tc.name int32ArrayConstructorPart07TestMindmapTest044
     * @tc.desc Verify []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [11, 22];
      let arr: Int32Array = new Int32Array(src);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0450
     * @tc.name int32ArrayConstructorPart07TestMindmapTest045
     * @tc.desc Verify []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [11, 22];
      let arr: Int32Array = new Int32Array(src);
      expect(arr[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0460
     * @tc.name int32ArrayConstructorPart07TestMindmapTest046
     * @tc.desc Verify at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [100, 200];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0470
     * @tc.name int32ArrayConstructorPart07TestMindmapTest047
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [100, 200];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.at(-1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0480
     * @tc.name int32ArrayConstructorPart07TestMindmapTest048
     * @tc.desc Verify at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      let v: number | undefined = arr.at(3);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0490
     * @tc.name int32ArrayConstructorPart07TestMindmapTest049
     * @tc.desc Verify $_get(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      try {
        arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0500
     * @tc.name int32ArrayConstructorPart07TestMindmapTest050
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [5, 6, 7, 8];
      let arr: Int32Array = new Int32Array(src);
      for (let idx: int = 0; idx < arr.length; idx++) {
        expect(arr.$_get(idx)).assertEqual(src[idx]);
      }
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0510
     * @tc.name int32ArrayConstructorPart07TestMindmapTest051
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Int32Array = new Int32Array(src);
      let count: int = 0;
      for (let idx: int = 0; idx < arr.length; idx++) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0520
     * @tc.name int32ArrayConstructorPart07TestMindmapTest052
     * @tc.desc Verify forEach index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let arr: Int32Array = new Int32Array(src);
      let seen: Array<number> = [];
      let indices: Array<int> = [];
      for (let idx: int = 0; idx < arr.length; idx++) {
        seen.push(arr.$_get(idx));
        indices.push(idx);
      }
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(10);
      expect(seen[2]).assertEqual(30);
      expect(indices[0]).assertEqual(0);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0530
     * @tc.name int32ArrayConstructorPart07TestMindmapTest053
     * @tc.desc Verify forEach array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1];
      let arr: Int32Array = new Int32Array(src);
      for (let idx: int = 0; idx < arr.length; idx++) {
        if (arr.$_get(idx) !== src[idx]) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0540
     * @tc.name int32ArrayConstructorPart07TestMindmapTest054
     * @tc.desc Verify for
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-5, 0, 5, 10];
      let arr: Int32Array = new Int32Array(src);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(src[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0550
     * @tc.name int32ArrayConstructorPart07TestMindmapTest055
     * @tc.desc Verify entries() [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [100, -100];
      let arr: Int32Array = new Int32Array(src);
      let iter = arr.entries();
      let first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(100);
      let second = iter.next();
      expect(second.value![0]).assertEqual(1);
      expect(second.value![1]).assertEqual(-100);
      let end = iter.next();
      expect(end.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0560
     * @tc.name int32ArrayConstructorPart07TestMindmapTest056
     * @tc.desc Verify keys() 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30, 40];
      let arr: Int32Array = new Int32Array(src);
      let iter = arr.keys();
      for (let i: int = 0; i < 4; i++) {
        let cur = iter.next();
        expect(cur.done).assertFalse();
        expect(cur.value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0570
     * @tc.name int32ArrayConstructorPart07TestMindmapTest057
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [7, 14, 21];
      let arr: Int32Array = new Int32Array(src);
      let iter = arr.values();
      for (let i: int = 0; i < 3; i++) {
        let cur = iter.next();
        expect(cur.done).assertFalse();
        expect(cur.value).assertEqual(src[i]);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0580
     * @tc.name int32ArrayConstructorPart07TestMindmapTest058
     * @tc.desc Verify join() Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0590
     * @tc.name int32ArrayConstructorPart07TestMindmapTest059
     * @tc.desc Verify join(separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.join('-')).assertEqual('10-20-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0600
     * @tc.name int32ArrayConstructorPart07TestMindmapTest060
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0610
     * @tc.name int32ArrayConstructorPart07TestMindmapTest061
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.join()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0620
     * @tc.name int32ArrayConstructorPart07TestMindmapTest062
     * @tc.desc Verify toString() join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0630
     * @tc.name int32ArrayConstructorPart07TestMindmapTest063
     * @tc.desc Verify Array<int> Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      src[0] = 999;
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0640
     * @tc.name int32ArrayConstructorPart07TestMindmapTest064
     * @tc.desc Verify Array<int> push Int32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      let arr: Int32Array = new Int32Array(src);
      src.push(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0650
     * @tc.name int32ArrayConstructorPart07TestMindmapTest065
     * @tc.desc Verify $_set Int32Array Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      arr.$_set(0, 888);
      expect(src[0]).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0660
     * @tc.name int32ArrayConstructorPart07TestMindmapTest066
     * @tc.desc Verify [] Int32Array Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20];
      let arr: Int32Array = new Int32Array(src);
      arr[1] = 777;
      expect(src[1]).assertEqual(20);
      expect(arr[1]).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0670
     * @tc.name int32ArrayConstructorPart07TestMindmapTest067
     * @tc.desc Verify Array<int> pop Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      src.pop();
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0680
     * @tc.name int32ArrayConstructorPart07TestMindmapTest068
     * @tc.desc Verify Array<int> Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      let arr: Int32Array = new Int32Array(src);
      src = [9, 9];
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0690
     * @tc.name int32ArrayConstructorPart07TestMindmapTest069
     * @tc.desc Verify buffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer);
      view.$_set(1, 123);
      expect(arr.$_get(1)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0700
     * @tc.name int32ArrayConstructorPart07TestMindmapTest070
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer);
      arr.$_set(2, 456);
      expect(view.$_get(2)).assertEqual(456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0710
     * @tc.name int32ArrayConstructorPart07TestMindmapTest071
     * @tc.desc Verify buffer+byteOffset=8 offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer, 8);
      view.$_set(0, 77);
      expect(arr.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0720
     * @tc.name int32ArrayConstructorPart07TestMindmapTest072
     * @tc.desc Verify buffer+byteOffset+length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer, 4, 2);
      view.$_set(0, 11);
      view.$_set(1, 22);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(11);
      expect(arr.$_get(2)).assertEqual(22);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0730
     * @tc.name int32ArrayConstructorPart07TestMindmapTest073
     * @tc.desc Verify buffer Int32Array length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0740
     * @tc.name int32ArrayConstructorPart07TestMindmapTest074
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      let v1: Int32Array = new Int32Array(arr.buffer);
      let v2: Int32Array = new Int32Array(arr.buffer);
      v1.$_set(0, 111);
      v2.$_set(4, 222);
      expect(arr.$_get(0)).assertEqual(111);
      expect(v1.$_get(4)).assertEqual(222);
      expect(v2.$_get(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0750
     * @tc.name int32ArrayConstructorPart07TestMindmapTest075
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer);
      view.fill(9);
      for (let i: int = 0; i < 4; i++) {
        expect(arr.$_get(i)).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0760
     * @tc.name int32ArrayConstructorPart07TestMindmapTest076
     * @tc.desc Verify set(array, offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer);
      let patch: Int32Array = Int32Array.of(5, 6);
      view.set(patch, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0770
     * @tc.name int32ArrayConstructorPart07TestMindmapTest077
     * @tc.desc Verify byteOffset=4 4 byteOffset=4 length /4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer, 4);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0780
     * @tc.name int32ArrayConstructorPart07TestMindmapTest078
     * @tc.desc Verify buffer byteOffset=1 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      try {
        new Int32Array(arr.buffer, 1);
        expect('should not reach').assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0790
     * @tc.name int32ArrayConstructorPart07TestMindmapTest079
     * @tc.desc Verify buffer byteOffset=2 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      try {
        new Int32Array(arr.buffer, 2);
        expect('should not reach').assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0800
     * @tc.name int32ArrayConstructorPart07TestMindmapTest080
     * @tc.desc Verify buffer byteOffset=3 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      try {
        new Int32Array(arr.buffer, 3);
        expect('should not reach').assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0810
     * @tc.name int32ArrayConstructorPart07TestMindmapTest081
     * @tc.desc Verify buffer byteOffset=-4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      try {
        new Int32Array(arr.buffer, -4);
        expect('should not reach').assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0820
     * @tc.name int32ArrayConstructorPart07TestMindmapTest082
     * @tc.desc Verify buffer length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0];
      let arr: Int32Array = new Int32Array(src);
      try {
        new Int32Array(arr.buffer, 0, 5);
        expect('should not reach').assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0830
     * @tc.name int32ArrayConstructorPart07TestMindmapTest083
     * @tc.desc Verify $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0];
      let arr: Int32Array = new Int32Array(src);
      arr.$_set(0, 33);
      arr.$_set(1, 44);
      let view: Int32Array = new Int32Array(arr.buffer);
      expect(view.$_get(0)).assertEqual(33);
      expect(view.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0840
     * @tc.name int32ArrayConstructorPart07TestMindmapTest084
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let arr: Int32Array = new Int32Array(src);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(99);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0850
     * @tc.name int32ArrayConstructorPart07TestMindmapTest085
     * @tc.desc Verify slice ArrayBuffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      let s: Int32Array = arr.slice();
      s.$_set(0, 111);
      expect(arr.$_get(0)).assertEqual(1);
      expect(s.$_get(0)).assertEqual(111);
      let sameBuffer: boolean = arr.buffer === s.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0860
     * @tc.name int32ArrayConstructorPart07TestMindmapTest086
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let arr: Int32Array = new Int32Array(src);
      arr.copyWithin(2, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0870
     * @tc.name int32ArrayConstructorPart07TestMindmapTest087
     * @tc.desc Verify [-1] buffer -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1];
      let arr: Int32Array = new Int32Array(src);
      let view: Int32Array = new Int32Array(arr.buffer);
      expect(view.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0880
     * @tc.name int32ArrayConstructorPart07TestMindmapTest088
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0890
     * @tc.name int32ArrayConstructorPart07TestMindmapTest089
     * @tc.desc Verify reverse length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Int32Array = new Int32Array(src);
      arr.reverse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0900
     * @tc.name int32ArrayConstructorPart07TestMindmapTest090
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let arr: Int32Array = new Int32Array(src);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0910
     * @tc.name int32ArrayConstructorPart07TestMindmapTest091
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0920
     * @tc.name int32ArrayConstructorPart07TestMindmapTest092
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0930
     * @tc.name int32ArrayConstructorPart07TestMindmapTest093
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [5, 10, 15];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.includes(10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0940
     * @tc.name int32ArrayConstructorPart07TestMindmapTest094
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [5, 10, 15];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0950
     * @tc.name int32ArrayConstructorPart07TestMindmapTest095
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let arr: Int32Array = new Int32Array(src);
      let r: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => v > 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0960
     * @tc.name int32ArrayConstructorPart07TestMindmapTest096
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2, 4, 6];
      let arr: Int32Array = new Int32Array(src);
      let r: boolean = arr.every((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0970
     * @tc.name int32ArrayConstructorPart07TestMindmapTest097
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Int32Array = new Int32Array(src);
      let r: boolean = arr.every((v: number, i: int, a: Int32Array): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0980
     * @tc.name int32ArrayConstructorPart07TestMindmapTest098
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let arr: Int32Array = new Int32Array(src);
      let r: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_0990
     * @tc.name int32ArrayConstructorPart07TestMindmapTest099
     * @tc.desc Verify reduce Array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let arr: Int32Array = new Int32Array(src);
      let sum: number = arr.reduce((acc: number, v: number, i: int, a: Int32Array): number => acc + v, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_1000
     * @tc.name int32ArrayConstructorPart07TestMindmapTest100
     * @tc.desc Verify map Int32Array *2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr: Int32Array = new Int32Array(src);
      let doubled: Int32Array = arr.map((v: number, i: int, a: Int32Array): number => v * 2);
      expect(doubled.length).assertEqual(3);
      expect(doubled.$_get(0)).assertEqual(2);
      expect(doubled.$_get(1)).assertEqual(4);
      expect(doubled.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_1010
     * @tc.name int32ArrayConstructorPart07TestMindmapTest101
     * @tc.desc Verify filter Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5, 6];
      let arr: Int32Array = new Int32Array(src);
      let evens: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
      expect(evens.length).assertEqual(3);
      expect(evens.$_get(0)).assertEqual(2);
      expect(evens.$_get(1)).assertEqual(4);
      expect(evens.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_1020
     * @tc.name int32ArrayConstructorPart07TestMindmapTest102
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 3, 5, 6, 7];
      let arr: Int32Array = new Int32Array(src);
      let found: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
      expect(found).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_1030
     * @tc.name int32ArrayConstructorPart07TestMindmapTest103
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 3, 5, 6, 7];
      let arr: Int32Array = new Int32Array(src);
      expect(arr.findIndex((v: number, i: int, a: Int32Array): boolean => v % 2 === 0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_1040
     * @tc.name int32ArrayConstructorPart07TestMindmapTest104
     * @tc.desc Verify find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 3, 5];
      let arr: Int32Array = new Int32Array(src);
      let found: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
      expect(found).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_1050
     * @tc.name int32ArrayConstructorPart07TestMindmapTest105
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [3, 1, 4, 1, 5, 9, 2, 6];
      let arr: Int32Array = new Int32Array(src);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(7)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART07_TEST_MINDMAP_1060
     * @tc.name int32ArrayConstructorPart07TestMindmapTest106
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart07TestMindmapTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-3, 1, -2, 4];
      let arr: Int32Array = new Int32Array(src);
      arr.sort((x: number, y: number): int => Double.toInt((x < 0 ? -x : x) - (y < 0 ? -y : y)));
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });
  });
}
