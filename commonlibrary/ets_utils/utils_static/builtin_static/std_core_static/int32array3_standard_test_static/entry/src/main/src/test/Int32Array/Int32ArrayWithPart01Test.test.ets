'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

export default function int32ArrayWithPart01Test(): void {
  describe('Int32ArrayWithPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayWithPart01Test001
     * @tc.desc Verify with replaces the selected element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 99);
      expect(r.length).assertEqual(3);
      expect(r.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayWithPart01Test002
     * @tc.desc Verify with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.with(2, 77);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayWithPart01Test003
     * @tc.desc Verify with byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(0, 5);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayWithPart01Test004
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(0, 99);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayWithPart01Test005
     * @tc.desc Verify index=length-1 index=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(2, 88);
      expect(r.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayWithPart01Test006
     * @tc.desc Verify index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 55);
      expect(r.$_get(1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayWithPart01Test007
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.with(0, 7);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayWithPart01Test008
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22]);
      let r: Int32Array = arr.with(0, 99);
      expect(r.$_get(0)).assertEqual(99);
      expect(r.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayWithPart01Test009
     * @tc.desc Verify index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22]);
      let r: Int32Array = arr.with(1, 88);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayWithPart01Test010
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let r: Int32Array = arr.with(0, 999);
      expect(r.$_get(0)).assertEqual(999);
      expect(r.$_get(5)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayWithPart01Test011
     * @tc.desc Verify index=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let r: Int32Array = arr.with(5, 1);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayWithPart01Test012
     * @tc.desc Verify index 1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70]);
      let r: Int32Array = arr.with(3, 0);
      expect(r.$_get(3)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(30);
      expect(r.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayWithPart01Test013
     * @tc.desc Verify value=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayWithPart01Test014
     * @tc.desc Verify value=-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, -1);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayWithPart01Test015
     * @tc.desc Verify value=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 1);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayWithPart01Test016
     * @tc.desc Verify value=INT_MAX (2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 2147483647);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayWithPart01Test017
     * @tc.desc Verify value=INT_MIN (-2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, -2147483648);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayWithPart01Test018
     * @tc.desc Verify value=0x7FFFFFFF INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(0, 0x7FFFFFFF);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayWithPart01Test019
     * @tc.desc Verify value=-0x80000000 INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(0, -0x80000000);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayWithPart01Test020
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 12345);
      expect(r.$_get(1)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayWithPart01Test021
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(2, -9876);
      expect(r.$_get(2)).assertEqual(-9876);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayWithPart01Test022
     * @tc.desc Verify value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let r: Int32Array = arr.with(2, 2);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayWithPart01Test023
     * @tc.desc Verify value -100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(0, -100000);
      expect(r.$_get(0)).assertEqual(-100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayWithPart01Test024
     * @tc.desc Verify value 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: Int32Array = arr.with(2, 1000000);
      expect(r.$_get(2)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayWithPart01Test025
     * @tc.desc Verify 0 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let r: Int32Array = arr.with(0, 2147483647);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayWithPart01Test026
     * @tc.desc Verify length-1 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let r: Int32Array = arr.with(2, -2147483648);
      expect(r.$_get(2)).assertEqual(-2147483648);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayWithPart01Test027
     * @tc.desc Verify index=-length-1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300, 400]);
      try {
        arr.with(-5, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayWithPart01Test028
     * @tc.desc Verify with can replace an element with the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 20);
      expect(r.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayWithPart01Test029
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5]);
      let r: Int32Array = arr.with(1, 0);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayWithPart01Test030
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.with(0, 0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayWithPart01Test031
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: Int32Array = arr.with(0, -1);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayWithPart01Test032
     * @tc.desc Verify with preserves length and replaces the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: Object = arr.with(0, 5);
      expect((r as Int32Array).length).assertEqual(2);
      expect((r as Int32Array).$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayWithPart01Test033
     * @tc.desc Verify with length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: Int32Array = arr.with(3, 99);
      expect(r.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayWithPart01Test034
     * @tc.desc Verify with byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let r: Int32Array = arr.with(0, 1);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayWithPart01Test035
     * @tc.desc Verify with byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(1, 9);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayWithPart01Test036
     * @tc.desc Verify with !==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 99);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayWithPart01Test037
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.with(1, 99);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayWithPart01Test038
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.with(0, 99);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayWithPart01Test039
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.with(2, 99);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayWithPart01Test040
     * @tc.desc Verify with buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(0, 99);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayWithPart01Test041
     * @tc.desc Verify modifying the array returned by with does not mutate the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 99);
      r.$_set(0, 111);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayWithPart01Test042
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 99);
      arr.$_set(1, 888);
      expect(r.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayWithPart01Test043
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r1: Int32Array = arr.with(0, 10);
      let r2: Int32Array = arr.with(0, 20);
      expect(r1.$_get(0)).assertEqual(10);
      expect(r2.$_get(0)).assertEqual(20);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayWithPart01Test044
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r1: Int32Array = arr.with(0, 10);
      let r2: Int32Array = r1.with(1, 20);
      expect(r1.$_get(1)).assertEqual(2);
      expect(r2.$_get(0)).assertEqual(10);
      expect(r2.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayWithPart01Test045
     * @tc.desc Verify Int32Array.of with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let r: Int32Array = arr.with(1, 66);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(66);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayWithPart01Test046
     * @tc.desc Verify Int32Array.from with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.from([1, 2, 3] as number[]);
      let r: Int32Array = src.with(2, 33);
      expect(r.$_get(2)).assertEqual(33);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayWithPart01Test047
     * @tc.desc Verify ArrayBuffer Int32Array with buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let r: Int32Array = arr.with(1, 99);
      expect(r.$_get(1)).assertEqual(99);
      expect(arr.$_get(1)).assertEqual(2);
      expect(r.buffer).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayWithPart01Test048
     * @tc.desc Verify byteOffset ArrayBuffer Int32Array with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let r: Int32Array = arr.with(1, 99);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(99);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayWithPart01Test049
     * @tc.desc Verify subarray with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5]);
      let sub: Int32Array = arr.subarray(1, 4);
      let r: Int32Array = sub.with(1, 99);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(99);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayWithPart01Test050
     * @tc.desc Verify subarray with buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(1, 3);
      let r: Int32Array = sub.with(0, 99);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayWithPart01Test051
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.with(0, 99);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
      expect(r.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayWithPart01Test052
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.with(3, 99);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayWithPart01Test053
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let r: Int32Array = arr.with(2, 0);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayWithPart01Test054
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-10, -20, -30]);
      let r: Int32Array = arr.with(1, 50);
      expect(r.$_get(0)).assertEqual(-10);
      expect(r.$_get(1)).assertEqual(50);
      expect(r.$_get(2)).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayWithPart01Test055
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: Int32Array = arr.with(2, 1);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayWithPart01Test056
     * @tc.desc Verify index=length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayWithPart01Test057
     * @tc.desc Verify index=length+1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.with(4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayWithPart01Test058
     * @tc.desc Verify index length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.with(1000000, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayWithPart01Test059
     * @tc.desc Verify INT_MAX index RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.with(2147483647, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayWithPart01Test060
     * @tc.desc Verify index=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      try {
        arr.with(1, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayWithPart01Test061
     * @tc.desc Verify index=2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22]);
      try {
        arr.with(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayWithPart01Test062
     * @tc.desc Verify index=-length-1 -length 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayWithPart01Test063
     * @tc.desc Verify index=-length-2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.with(-5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayWithPart01Test064
     * @tc.desc Verify index -length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.with(-1000000, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayWithPart01Test065
     * @tc.desc Verify INT_MIN index RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.with(-2147483648, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayWithPart01Test066
     * @tc.desc Verify index=-2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      try {
        arr.with(-2, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayWithPart01Test067
     * @tc.desc Verify index=-3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22]);
      try {
        arr.with(-3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayWithPart01Test068
     * @tc.desc Verify length=0 with(0, x) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.with(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayWithPart01Test069
     * @tc.desc Verify with(-1, x) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.with(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayWithPart01Test070
     * @tc.desc Verify with(1, x) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.with(1, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayWithPart01Test071
     * @tc.desc Verify of() with RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of();
      try {
        arr.with(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayWithPart01Test072
     * @tc.desc Verify with throws RangeError for an oversized positive index and preserves the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.with(99, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayWithPart01Test073
     * @tc.desc Verify with throws RangeError for an oversized negative index and preserves the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.with(-99, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayWithPart01Test074
     * @tc.desc Verify with result buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = arr.with(0, 9);
      expect(r.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayWithPart01Test075
     * @tc.desc Verify with buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.with(1, 9);
      expect(r.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayWithPart01Test076
     * @tc.desc Verify buffer Int32Array with byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      let r: Int32Array = arr.with(0, 99);
      expect(r.byteOffset).assertEqual(0);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(99);
      expect(r.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayWithPart01Test077
     * @tc.desc Verify ArrayBuffer with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a1: Int32Array = new Int32Array(buf);
      let a2: Int32Array = new Int32Array(buf);
      a1.$_set(0, 1);
      a1.$_set(1, 2);
      a1.$_set(2, 3);
      let r: Int32Array = a1.with(1, 99);
      a2.$_set(0, 111);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayWithPart01Test078
     * @tc.desc Verify with INT_MAX INT_MIN MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      let r: Int32Array = arr.with(1, -2147483648);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayWithPart01Test079
     * @tc.desc Verify with INT_MIN INT_MAX MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let r: Int32Array = arr.with(0, 2147483647);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_8000
     * @tc.name int32ArrayWithPart01Test080
     * @tc.desc Verify with for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.with(2, 99);
      let expected: number[] = [10, 20, 99, 40];
      let i: int = 0;
      for (let j = 0; j < r.length; j++) {
        let v = r.$_get(j);
        expect(v).assertEqual(expected.$_get(i));
        i = i + 1;
      }
      expect(i).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART01_TEST_MINDMAP_8100
     * @tc.name int32ArrayWithPart01Test081
     * @tc.desc Verify with subarray 0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(5, 10);
      expect(sub.length).assertEqual(0);
      try {
        sub.with(0, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
