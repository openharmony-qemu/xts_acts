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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

export default function int8ArraySubarrayPart01Test(): void {
  describe('Int8ArraySubarrayPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0100
     * @tc.name int8ArraySubarrayPart01Test001
     * @tc.desc Verify arity=0 subarray() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray();
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue4: number = view.$_get(4);
      let expectedViewValue4: int = 50;
      expect(viewValue4).assertEqual(expectedViewValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0200
     * @tc.name int8ArraySubarrayPart01Test002
     * @tc.desc Verify subarray(2) view has length 3 values 30 to 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2);
      let viewLength: int = view.length;
      let expectedViewLength: int = 3;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 30;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue2: number = view.$_get(2);
      let expectedViewValue2: int = 50;
      expect(viewValue2).assertEqual(expectedViewValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0300
     * @tc.name int8ArraySubarrayPart01Test003
     * @tc.desc Verify arity=2 subarray(begin, end) [begin, end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      let viewLength: int = view.length;
      let expectedViewLength: int = 3;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 20;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue2: number = view.$_get(2);
      let expectedViewValue2: int = 40;
      expect(viewValue2).assertEqual(expectedViewValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0400
     * @tc.name int8ArraySubarrayPart01Test004
     * @tc.desc Verify subarray(0) view covers all 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0500
     * @tc.name int8ArraySubarrayPart01Test005
     * @tc.desc Verify subarray(1) view starts at 20 length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 20;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewLength: int = view.length;
      let expectedViewLength: int = 4;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0600
     * @tc.name int8ArraySubarrayPart01Test006
     * @tc.desc Verify subarray(4) view keeps last element 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(4);
      let viewLength: int = view.length;
      let expectedViewLength: int = 1;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 50;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0700
     * @tc.name int8ArraySubarrayPart01Test007
     * @tc.desc Verify subarray(5) view length 0 on a constructor-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0800
     * @tc.name int8ArraySubarrayPart01Test008
     * @tc.desc Verify subarray(6) view length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(6);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_0900
     * @tc.name int8ArraySubarrayPart01Test009
     * @tc.desc Verify subarray begin int max yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2147483647);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1000
     * @tc.name int8ArraySubarrayPart01Test010
     * @tc.desc Verify subarray(-1) view keeps last element 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-1);
      let viewLength: int = view.length;
      let expectedViewLength: int = 1;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 50;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1100
     * @tc.name int8ArraySubarrayPart01Test011
     * @tc.desc Verify subarray(-2) view starts at 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-2);
      let viewLength: int = view.length;
      let expectedViewLength: int = 2;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 40;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1200
     * @tc.name int8ArraySubarrayPart01Test012
     * @tc.desc Verify subarray(-5) view covers all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1300
     * @tc.name int8ArraySubarrayPart01Test013
     * @tc.desc Verify subarray(-6) clamps to cover all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-6);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1400
     * @tc.name int8ArraySubarrayPart01Test014
     * @tc.desc Verify subarray begin=-2147483648 int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-2147483648);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1500
     * @tc.name int8ArraySubarrayPart01Test015
     * @tc.desc Verify subarray(0, 0) view length 0 on a constructor-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 0);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1600
     * @tc.name int8ArraySubarrayPart01Test016
     * @tc.desc Verify subarray(0, 1) view length 1 value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 1);
      let viewLength: int = view.length;
      let expectedViewLength: int = 1;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1700
     * @tc.name int8ArraySubarrayPart01Test017
     * @tc.desc Verify subarray(0, 4) view length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 4);
      let viewLength: int = view.length;
      let expectedViewLength: int = 4;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue3: number = view.$_get(3);
      let expectedViewValue3: int = 40;
      expect(viewValue3).assertEqual(expectedViewValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1800
     * @tc.name int8ArraySubarrayPart01Test018
     * @tc.desc Verify subarray(0, 5) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewByteOffset: int = view.byteOffset;
      let expectedViewByteOffset: int = 0;
      expect(viewByteOffset).assertEqual(expectedViewByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_1900
     * @tc.name int8ArraySubarrayPart01Test019
     * @tc.desc Verify subarray(0, 6) clamps to length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 6);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue4: number = view.$_get(4);
      let expectedViewValue4: int = 50;
      expect(viewValue4).assertEqual(expectedViewValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2000
     * @tc.name int8ArraySubarrayPart01Test020
     * @tc.desc Verify subarray end int max yields full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 2147483647);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue4: number = view.$_get(4);
      let expectedViewValue4: int = 50;
      expect(viewValue4).assertEqual(expectedViewValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2100
     * @tc.name int8ArraySubarrayPart01Test021
     * @tc.desc Verify subarray(0, -1) view length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, -1);
      let viewLength: int = view.length;
      let expectedViewLength: int = 4;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue3: number = view.$_get(3);
      let expectedViewValue3: int = 40;
      expect(viewValue3).assertEqual(expectedViewValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2200
     * @tc.name int8ArraySubarrayPart01Test022
     * @tc.desc Verify subarray(0, -2) view length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, -2);
      let viewLength: int = view.length;
      let expectedViewLength: int = 3;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue2: number = view.$_get(2);
      let expectedViewValue2: int = 30;
      expect(viewValue2).assertEqual(expectedViewValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2300
     * @tc.name int8ArraySubarrayPart01Test023
     * @tc.desc Verify subarray(0, -5) view length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, -5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2400
     * @tc.name int8ArraySubarrayPart01Test024
     * @tc.desc Verify subarray(0, -6) view length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, -6);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2500
     * @tc.name int8ArraySubarrayPart01Test025
     * @tc.desc Verify subarray end=-2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, -2147483648);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2600
     * @tc.name int8ArraySubarrayPart01Test026
     * @tc.desc Verify subarray begin=3, end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(3, 3);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2700
     * @tc.name int8ArraySubarrayPart01Test027
     * @tc.desc Verify subarray begin zero end length yields full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue4: number = view.$_get(4);
      let expectedViewValue4: int = 50;
      expect(viewValue4).assertEqual(expectedViewValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2800
     * @tc.name int8ArraySubarrayPart01Test028
     * @tc.desc Verify subarray(5, 5) view length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(5, 5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_2900
     * @tc.name int8ArraySubarrayPart01Test029
     * @tc.desc Verify subarray begin=6, end=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(6, 6);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3000
     * @tc.name int8ArraySubarrayPart01Test030
     * @tc.desc Verify subarray begin=2, end=1 (begin > end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2, 1);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3100
     * @tc.name int8ArraySubarrayPart01Test031
     * @tc.desc Verify subarray begin=1, end=1 begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 1);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3200
     * @tc.name int8ArraySubarrayPart01Test032
     * @tc.desc Verify subarray begin=-2, end=-1 [3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-2, -1);
      let viewLength: int = view.length;
      let expectedViewLength: int = 1;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 40;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3300
     * @tc.name int8ArraySubarrayPart01Test033
     * @tc.desc Verify subarray begin=1, end=-1 [1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, -1);
      let viewLength: int = view.length;
      let expectedViewLength: int = 3;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 20;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue2: number = view.$_get(2);
      let expectedViewValue2: int = 40;
      expect(viewValue2).assertEqual(expectedViewValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3400
     * @tc.name int8ArraySubarrayPart01Test034
     * @tc.desc Verify subarray negative begin yields last element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-1, 5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 1;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 50;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3500
     * @tc.name int8ArraySubarrayPart01Test035
     * @tc.desc Verify subarray begin=2, end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2, 3);
      let viewLength: int = view.length;
      let expectedViewLength: int = 1;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 30;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3600
     * @tc.name int8ArraySubarrayPart01Test036
     * @tc.desc Verify subarray(-5, 5) view covers all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-5, 5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 5;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue4: number = view.$_get(4);
      let expectedViewValue4: int = 50;
      expect(viewValue4).assertEqual(expectedViewValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3700
     * @tc.name int8ArraySubarrayPart01Test037
     * @tc.desc Verify subarray begin=0, end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, -1);
      let viewLength: int = view.length;
      let expectedViewLength: int = 4;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 10;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue3: number = view.$_get(3);
      let expectedViewValue3: int = 40;
      expect(viewValue3).assertEqual(expectedViewValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3800
     * @tc.name int8ArraySubarrayPart01Test038
     * @tc.desc Verify subarray(2, 5) view values 30 to 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2, 5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 3;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 30;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue2: number = view.$_get(2);
      let expectedViewValue2: int = 50;
      expect(viewValue2).assertEqual(expectedViewValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_3900
     * @tc.name int8ArraySubarrayPart01Test039
     * @tc.desc Verify subarray(1, 3) view shares source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 3);
      let viewBuffer: ArrayBuffer = view.buffer;
      let expectedBuffer: ArrayBuffer = src.buffer;
      expect(viewBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4000
     * @tc.name int8ArraySubarrayPart01Test040
     * @tc.desc Verify subarray(1, 4) length equals end-begin 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      let viewLength: int = view.length;
      let expectedViewLength: int = 3;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4100
     * @tc.name int8ArraySubarrayPart01Test041
     * @tc.desc Verify subarray one arg begin two byteOffset two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2);
      let viewByteOffset: int = view.byteOffset;
      let expectedViewByteOffset: int = 2;
      expect(viewByteOffset).assertEqual(expectedViewByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4200
     * @tc.name int8ArraySubarrayPart01Test042
     * @tc.desc Verify subarray one arg begin zero byteOffset zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0);
      let viewByteOffset: int = view.byteOffset;
      let expectedViewByteOffset: int = 0;
      expect(viewByteOffset).assertEqual(expectedViewByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4300
     * @tc.name int8ArraySubarrayPart01Test043
     * @tc.desc Verify subarray(2, 5) first view value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2, 5);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 30;
      expect(viewValue0).assertEqual(expectedViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4400
     * @tc.name int8ArraySubarrayPart01Test044
     * @tc.desc Verify subarray(2, 5) last view value 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2, 5);
      let viewValue2: number = view.$_get(2);
      let expectedViewValue2: int = 50;
      expect(viewValue2).assertEqual(expectedViewValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4500
     * @tc.name int8ArraySubarrayPart01Test045
     * @tc.desc Verify subarray 0 begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(3, 5);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: number = src.$_get(3);
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue1: number = view.$_get(1);
      let expectedViewValue1: number = src.$_get(4);
      expect(viewValue1).assertEqual(expectedViewValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4600
     * @tc.name int8ArraySubarrayPart01Test046
     * @tc.desc Verify $_set on subarray view mutates parent via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.$_set(0, 99);
      let srcValue1: number = src.$_get(1);
      let expectedSrcValue1: int = 99;
      expect(srcValue1).assertEqual(expectedSrcValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4700
     * @tc.name int8ArraySubarrayPart01Test047
     * @tc.desc Verify $_set on parent visible through subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      src.$_set(2, 88);
      let viewValue1: number = view.$_get(1);
      let expectedViewValue1: int = 88;
      expect(viewValue1).assertEqual(expectedViewValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4800
     * @tc.name int8ArraySubarrayPart01Test048
     * @tc.desc Verify fill on subarray view fills parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.fill(77);
      let srcValue1: number = src.$_get(1);
      let expectedSrcValue1: int = 77;
      expect(srcValue1).assertEqual(expectedSrcValue1);
      let srcValue3: number = src.$_get(3);
      let expectedSrcValue3: int = 77;
      expect(srcValue3).assertEqual(expectedSrcValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_4900
     * @tc.name int8ArraySubarrayPart01Test049
     * @tc.desc Verify subarray view copyWithin writes parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.copyWithin(0, 1);
      let srcValue1: number = src.$_get(1);
      let expectedSrcValue1: int = 30;
      expect(srcValue1).assertEqual(expectedSrcValue1);
      let srcValue2: number = src.$_get(2);
      let expectedSrcValue2: int = 40;
      expect(srcValue2).assertEqual(expectedSrcValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5000
     * @tc.name int8ArraySubarrayPart01Test050
     * @tc.desc Verify reverse on subarray view reverses parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.reverse();
      let srcValue1: number = src.$_get(1);
      let expectedSrcValue1: int = 40;
      expect(srcValue1).assertEqual(expectedSrcValue1);
      let srcValue3: number = src.$_get(3);
      let expectedSrcValue3: int = 20;
      expect(srcValue3).assertEqual(expectedSrcValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5100
     * @tc.name int8ArraySubarrayPart01Test051
     * @tc.desc Verify sort on subarray view sorts parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([50, 40, 30, 20, 10]);
      const view: Int8Array = src.subarray(0, 3);
      view.sort((a: number, b: number) => {
        return a > b ? 1 : a < b ? -1 : 0;
      });
      let srcValue0: number = src.$_get(0);
      let expectedSrcValue0: int = 30;
      expect(srcValue0).assertEqual(expectedSrcValue0);
      let srcValue2: number = src.$_get(2);
      let expectedSrcValue2: int = 50;
      expect(srcValue2).assertEqual(expectedSrcValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5200
     * @tc.name int8ArraySubarrayPart01Test052
     * @tc.desc Verify set on subarray view writes into source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.set(new Int8Array([99, 98, 97]));
      let srcValue1: number = src.$_get(1);
      let expectedSrcValue1: int = 99;
      expect(srcValue1).assertEqual(expectedSrcValue1);
      let srcValue3: number = src.$_get(3);
      let expectedSrcValue3: int = 97;
      expect(srcValue3).assertEqual(expectedSrcValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5300
     * @tc.name int8ArraySubarrayPart01Test053
     * @tc.desc Verify subarray() creates view sharing the same underlying ArrayBuffer on disjoint ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view1: Int8Array = src.subarray(0, 2);
      const view2: Int8Array = src.subarray(3, 5);
      view1.$_set(0, 99);
      let view2Value0: number = view2.$_get(0);
      let expectedView2Value0: int = 40;
      expect(view2Value0).assertEqual(expectedView2Value0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5400
     * @tc.name int8ArraySubarrayPart01Test054
     * @tc.desc Verify subarray() creates view sharing the same underlying ArrayBuffer on overlapping ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view1: Int8Array = src.subarray(0, 3);
      const view2: Int8Array = src.subarray(2, 5);
      view1.$_set(2, 99);
      let view2Value0: number = view2.$_get(0);
      let expectedView2Value0: int = 99;
      expect(view2Value0).assertEqual(expectedView2Value0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5500
     * @tc.name int8ArraySubarrayPart01Test055
     * @tc.desc Verify chained subarray view value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const firstView: Int8Array = src.subarray(1, 4);
      const secondView: Int8Array = firstView.subarray(1, 2);
      let secondViewValue0: number = secondView.$_get(0);
      let expectedSecondViewValue0: int = 30;
      expect(secondViewValue0).assertEqual(expectedSecondViewValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5600
     * @tc.name int8ArraySubarrayPart01Test056
     * @tc.desc Verify subarray length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const before: int = src.length;
      let resultVal1: Int8Array = src.subarray(1, 3);
      let expectedVal1: Int8Array = new Int8Array([20, 30]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let srcLength: int = src.length;
      let expectedSrcLength: int = before;
      expect(srcLength).assertEqual(expectedSrcLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5700
     * @tc.name int8ArraySubarrayPart01Test057
     * @tc.desc Verify subarray leaves original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let resultVal1: Int8Array = src.subarray(1, 3);
      let expectedVal1: Int8Array = new Int8Array([20, 30]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let srcValue0: number = src.$_get(0);
      let expectedSrcValue0: int = 10;
      expect(srcValue0).assertEqual(expectedSrcValue0);
      let srcValue4: number = src.$_get(4);
      let expectedSrcValue4: int = 50;
      expect(srcValue4).assertEqual(expectedSrcValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5800
     * @tc.name int8ArraySubarrayPart01Test058
     * @tc.desc Verify subarray view set writes visible in source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(2, 4);
      view.$_set(0, 99);
      let srcValue2: number = src.$_get(2);
      let expectedSrcValue2: int = 99;
      expect(srcValue2).assertEqual(expectedSrcValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_5900
     * @tc.name int8ArraySubarrayPart01Test059
     * @tc.desc Verify subarray length and source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 3);
      let viewLength: int = view.length;
      let expectedViewLength: int = 2;
      expect(viewLength).assertEqual(expectedViewLength);
      let srcLength: int = src.length;
      let expectedSrcLength: int = 5;
      expect(srcLength).assertEqual(expectedSrcLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6000
     * @tc.name int8ArraySubarrayPart01Test060
     * @tc.desc Verify subarray view after fill() mutates original array via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.fill(99);
      let srcValue0: number = src.$_get(0);
      let expectedSrcValue0: int = 10;
      expect(srcValue0).assertEqual(expectedSrcValue0);
      let srcValue4: number = src.$_get(4);
      let expectedSrcValue4: int = 50;
      expect(srcValue4).assertEqual(expectedSrcValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6100
     * @tc.name int8ArraySubarrayPart01Test061
     * @tc.desc Verify chained subarray shares buffer with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const firstView: Int8Array = src.subarray(0, 5);
      const secondView: Int8Array = firstView.subarray(1, 4);
      const thirdView: Int8Array = secondView.subarray(1, 2);
      thirdView.$_set(0, 99);
      let srcValue2: number = src.$_get(2);
      let expectedSrcValue2: int = 99;
      expect(srcValue2).assertEqual(expectedSrcValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6200
     * @tc.name int8ArraySubarrayPart01Test062
     * @tc.desc Verify buffer shared across nested subarrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const firstView: Int8Array = src.subarray(1, 4);
      const secondView: Int8Array = firstView.subarray(1, 2);
      let secondViewBuffer: ArrayBuffer = secondView.buffer;
      let expectedSecondViewBuffer: ArrayBuffer = src.buffer;
      expect(secondViewBuffer).assertEqual(expectedSecondViewBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6300
     * @tc.name int8ArraySubarrayPart01Test063
     * @tc.desc Verify subarray view set 128 truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.$_set(0, 128);
      let srcValue1: number = src.$_get(1);
      let expectedSrcValue1: number = INT8_MIN;
      expect(srcValue1).assertEqual(expectedSrcValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6400
     * @tc.name int8ArraySubarrayPart01Test064
     * @tc.desc Verify subarray source set two hundred visible truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      src.$_set(2, 200);
      let viewValue1: number = view.$_get(1);
      let expectedViewValue1: number = -56;
      expect(viewValue1).assertEqual(expectedViewValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6500
     * @tc.name int8ArraySubarrayPart01Test065
     * @tc.desc Verify subarray view fill 255 truncates negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.fill(255);
      let srcValue1: number = src.$_get(1);
      let expectedSrcValue1: int = -1;
      expect(srcValue1).assertEqual(expectedSrcValue1);
      let srcValue3: number = src.$_get(3);
      let expectedSrcValue3: int = -1;
      expect(srcValue3).assertEqual(expectedSrcValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6600
     * @tc.name int8ArraySubarrayPart01Test066
     * @tc.desc Verify buffer subarray(5,5) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(5, 5);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(viewBuffer).assertEqual(expectedViewBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6700
     * @tc.name int8ArraySubarrayPart01Test067
     * @tc.desc Verify subarray() view shares full source range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray();
      view.$_set(0, 99);
      let srcValue0: number = src.$_get(0);
      let expectedSrcValue0: int = 99;
      expect(srcValue0).assertEqual(expectedSrcValue0);
      src.$_set(4, 88);
      let viewValue4: number = view.$_get(4);
      let expectedViewValue4: int = 88;
      expect(viewValue4).assertEqual(expectedViewValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6800
     * @tc.name int8ArraySubarrayPart01Test068
     * @tc.desc Verify subarray view at sees source write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      src.$_set(1, 99);
      let viewAt0 = view.at(0);
      let expectedViewAt0: int = 99;
      expect(viewAt0).assertEqual(expectedViewAt0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_6900
     * @tc.name int8ArraySubarrayPart01Test069
     * @tc.desc Verify subarray view set then at reads own write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.$_set(0, 77);
      let viewAt0 = view.at(0);
      let expectedViewAt0: int = 77;
      expect(viewAt0).assertEqual(expectedViewAt0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7000
     * @tc.name int8ArraySubarrayPart01Test070
     * @tc.desc Verify byteOffset subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const firstView: Int8Array = src.subarray(1, 5);
      const secondView: Int8Array = firstView.subarray(2, 4);
      let secondViewByteOffset: int = secondView.byteOffset;
      let expectedSecondViewByteOffset: int = 3;
      expect(secondViewByteOffset).assertEqual(expectedSecondViewByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7100
     * @tc.name int8ArraySubarrayPart01Test071
     * @tc.desc Verify reverse on subarray view leaves outside range intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 3);
      view.reverse();
      let srcValue3: number = src.$_get(3);
      let expectedSrcValue3: int = 40;
      expect(srcValue3).assertEqual(expectedSrcValue3);
      let srcValue4: number = src.$_get(4);
      let expectedSrcValue4: int = 50;
      expect(srcValue4).assertEqual(expectedSrcValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7200
     * @tc.name int8ArraySubarrayPart01Test072
     * @tc.desc Verify subarray view fill partial range keeps rest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.fill(99, 0, 1);
      let viewValue0: number = view.$_get(0);
      let expectedViewValue0: int = 99;
      expect(viewValue0).assertEqual(expectedViewValue0);
      let viewValue1: number = view.$_get(1);
      let expectedViewValue1: int = 30;
      expect(viewValue1).assertEqual(expectedViewValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7300
     * @tc.name int8ArraySubarrayPart01Test073
     * @tc.desc Verify subarray view copyWithin leaves boundary elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.copyWithin(0, 2);
      let srcValue0: number = src.$_get(0);
      let expectedSrcValue0: int = 10;
      expect(srcValue0).assertEqual(expectedSrcValue0);
      let srcValue4: number = src.$_get(4);
      let expectedSrcValue4: int = 50;
      expect(srcValue4).assertEqual(expectedSrcValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7400
     * @tc.name int8ArraySubarrayPart01Test074
     * @tc.desc Verify sort on 2-element subarray view leaves rest intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([30, 10, 20, 50, 40]);
      const view: Int8Array = src.subarray(0, 2);
      view.sort((a: number, b: number) => {
        return a > b ? 1 : a < b ? -1 : 0;
      });
      let srcValue2: number = src.$_get(2);
      let expectedSrcValue2: int = 20;
      expect(srcValue2).assertEqual(expectedSrcValue2);
      let srcValue4: number = src.$_get(4);
      let expectedSrcValue4: int = 40;
      expect(srcValue4).assertEqual(expectedSrcValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7500
     * @tc.name int8ArraySubarrayPart01Test075
     * @tc.desc Verify subarray view length unchanged by source write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      src.$_set(1, 99);
      let viewLength: int = view.length;
      let expectedViewLength: int = 3;
      expect(viewLength).assertEqual(expectedViewLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7600
     * @tc.name int8ArraySubarrayPart01Test076
     * @tc.desc Verify subarray view set with offset writes source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(1, 4);
      view.set(new Int8Array([99, 98]), 1);
      let srcValue1: number = src.$_get(1);
      let expectedSrcValue1: int = 20;
      expect(srcValue1).assertEqual(expectedSrcValue1);
      let srcValue2: number = src.$_get(2);
      let expectedSrcValue2: int = 99;
      expect(srcValue2).assertEqual(expectedSrcValue2);
      let srcValue3: number = src.$_get(3);
      let expectedSrcValue3: int = 98;
      expect(srcValue3).assertEqual(expectedSrcValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7700
     * @tc.name int8ArraySubarrayPart01Test077
     * @tc.desc Verify buffer subarray(0,0) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 0);
      let viewLength: int = view.length;
      let expectedViewLength: int = 0;
      expect(viewLength).assertEqual(expectedViewLength);
      let viewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(viewBuffer).assertEqual(expectedViewBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7800
     * @tc.name int8ArraySubarrayPart01Test078
     * @tc.desc Verify subarray view distinct object shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(0, 5);
      expect(view).not().assertEqual(src);
      let viewBuffer: ArrayBuffer = view.buffer;
      let expectedViewBuffer: ArrayBuffer = src.buffer;
      expect(viewBuffer).assertEqual(expectedViewBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART01_7900
     * @tc.name int8ArraySubarrayPart01Test079
     * @tc.desc Verify subarray negative begin byteOffset four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const view: Int8Array = src.subarray(-1);
      let viewByteOffset: int = view.byteOffset;
      let expectedViewByteOffset: int = 4;
      expect(viewByteOffset).assertEqual(expectedViewByteOffset);
    });
  });
}
