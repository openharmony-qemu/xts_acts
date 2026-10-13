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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArraySubarrayPart03Test(): void {
  describe('Int8ArraySubarrayPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;
    const INT8_ZERO = 0;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_0500
     * @tc.name int8ArraySubarrayPart03Test005
     * @tc.desc Verify subarray begin negative length covers all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(-4);
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_0600
     * @tc.name int8ArraySubarrayPart03Test006
     * @tc.desc Verify subarray begin beyond negative length covers all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(-5);
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(3);
      let expectedFirst: int = 40;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_0700
     * @tc.name int8ArraySubarrayPart03Test007
     * @tc.desc Verify subarray begin at length yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(4);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_0800
     * @tc.name int8ArraySubarrayPart03Test008
     * @tc.desc Verify subarray begin past length yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(5);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_0900
     * @tc.name int8ArraySubarrayPart03Test009
     * @tc.desc Verify subarray begin=-0x7FFFFFFF clamps to 0, view covers all, first element readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(-0x7fffffff);
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(3);
      let expectedSecond: int = 40;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_1000
     * @tc.name int8ArraySubarrayPart03Test010
     * @tc.desc Verify subarray begin far negative clamps head byteOffset zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(-6);
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_1100
     * @tc.name int8ArraySubarrayPart03Test011
     * @tc.desc Verify subarray negative end excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, -1);
      let actualLength: int = view.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(2);
      let expectedSecond: int = 30;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_1200
     * @tc.name int8ArraySubarrayPart03Test012
     * @tc.desc Verify subarray end negative length yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, -4);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_1300
     * @tc.name int8ArraySubarrayPart03Test013
     * @tc.desc Verify subarray end beyond negative length yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, -5);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_1400
     * @tc.name int8ArraySubarrayPart03Test014
     * @tc.desc Verify subarray end at length covers all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, 4);
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(3);
      let expectedFirst: int = 40;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_1500
     * @tc.name int8ArraySubarrayPart03Test015
     * @tc.desc Verify subarray end past length covers all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, 5);
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_1900
     * @tc.name int8ArraySubarrayPart03Test019
     * @tc.desc Verify subarray begin=-1, end=-2 normalized begin=3 > end=2, view empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(-1, -2);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2000
     * @tc.name int8ArraySubarrayPart03Test020
     * @tc.desc Verify subarray begin two negative end yields single middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(2, -1);
      let actualLength: int = view.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 30;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2100
     * @tc.name int8ArraySubarrayPart03Test021
     * @tc.desc Verify subarray negative two begin past end covers tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(-2, 5);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 30;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 40;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2200
     * @tc.name int8ArraySubarrayPart03Test022
     * @tc.desc Verify subarray begin end both past length yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(5, 6);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2300
     * @tc.name int8ArraySubarrayPart03Test023
     * @tc.desc Verify subarray far negative begin past end covers all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(-5, 5);
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(3);
      let expectedSecond: int = 40;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2400
     * @tc.name int8ArraySubarrayPart03Test024
     * @tc.desc Verify subarray begin past negative end yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, -4);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2500
     * @tc.name int8ArraySubarrayPart03Test025
     * @tc.desc Verify subarray begin=undefined defaults to 0, end=2, view [10,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(undefined, 2);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 20;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2600
     * @tc.name int8ArraySubarrayPart03Test026
     * @tc.desc Verify subarray undefined end defaults to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(2, undefined);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 30;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 40;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2700
     * @tc.name int8ArraySubarrayPart03Test027
     * @tc.desc Verify subarray undefined begin end covers all byteOffset zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(undefined, undefined);
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      let actualFirst: number = view.$_get(3);
      let expectedFirst: int = 40;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_2800
     * @tc.name int8ArraySubarrayPart03Test028
     * @tc.desc Verify subarray begin=undefined on empty array defaults to 0, view is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(0);
      const view: Int8Array = src.subarray(undefined);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_3900
     * @tc.name int8ArraySubarrayPart03Test039
     * @tc.desc Verify single element array subarray() returns full view [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7]);
      const view: Int8Array = src.subarray();
      let actualLength: int = view.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 7;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4000
     * @tc.name int8ArraySubarrayPart03Test040
     * @tc.desc Verify single element array subarray(0) returns [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7]);
      const view: Int8Array = src.subarray(0);
      let actualLength: int = view.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 7;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4100
     * @tc.name int8ArraySubarrayPart03Test041
     * @tc.desc Verify single element array subarray(0,1) returns [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7]);
      const view: Int8Array = src.subarray(0, 1);
      let actualLength: int = view.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 7;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4200
     * @tc.name int8ArraySubarrayPart03Test042
     * @tc.desc Verify single element array subarray(-1) normalizes to 0, returns [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7]);
      const view: Int8Array = src.subarray(-1);
      let actualLength: int = view.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 7;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4300
     * @tc.name int8ArraySubarrayPart03Test043
     * @tc.desc Verify single element array subarray(1) clamps to 1=length, view empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7]);
      const view: Int8Array = src.subarray(1);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4400
     * @tc.name int8ArraySubarrayPart03Test044
     * @tc.desc Verify single element array subarray(0,-1) end normalizes, view empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7]);
      const view: Int8Array = src.subarray(0, -1);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4500
     * @tc.name int8ArraySubarrayPart03Test045
     * @tc.desc Verify single element array subarray(-1,-1) both normalize to 0, view empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7]);
      const view: Int8Array = src.subarray(-1, -1);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4600
     * @tc.name int8ArraySubarrayPart03Test046
     * @tc.desc Verify all-same array [5,5,5,5] subarray() returns all 5s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([5, 5, 5, 5]);
      const view: Int8Array = src.subarray();
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 5;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(3);
      let expectedSecond: int = 5;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4700
     * @tc.name int8ArraySubarrayPart03Test047
     * @tc.desc Verify all-same array subarray(1,3) returns [5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([5, 5, 5, 5]);
      const view: Int8Array = src.subarray(1, 3);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 5;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 5;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4800
     * @tc.name int8ArraySubarrayPart03Test048
     * @tc.desc Verify all-same array subarray(-3,-1) normalized [1,3), returns [5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([5, 5, 5, 5]);
      const view: Int8Array = src.subarray(-3, -1);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 5;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 5;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_4900
     * @tc.name int8ArraySubarrayPart03Test049
     * @tc.desc Verify all-same array subarray(2) from index 2 to end, returns [5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([5, 5, 5, 5]);
      const view: Int8Array = src.subarray(2);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 5;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 5;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_5000
     * @tc.name int8ArraySubarrayPart03Test050
     * @tc.desc Verify all-same array subarray(-2) normalizes to 2, returns [5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([5, 5, 5, 5]);
      const view: Int8Array = src.subarray(-2);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 5;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 5;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_5200
     * @tc.name int8ArraySubarrayPart03Test052
     * @tc.desc Verify subarray view byteOffset equals begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(2);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 2;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_5300
     * @tc.name int8ArraySubarrayPart03Test053
     * @tc.desc Verify original array length unchanged after subarray call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      src.subarray(1, 3);
      let actualLength: int = src.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_5400
     * @tc.name int8ArraySubarrayPart03Test054
     * @tc.desc Verify original array content unchanged after subarray call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      src.subarray(1, 3);
      let actualFirst: number = src.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = src.$_get(1);
      let expectedSecond: int = 20;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = src.$_get(2);
      let expectedThird: int = 30;
      expect(actualThird).assertEqual(expectedThird);
      let actualFourth: number = src.$_get(3);
      let expectedFourth: int = 40;
      expect(actualFourth).assertEqual(expectedFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_5500
     * @tc.name int8ArraySubarrayPart03Test055
     * @tc.desc Verify out-of-bounds $_set on empty subarray view throws RangeError, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(4, 4);
      try {
        view.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = src.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6100
     * @tc.name int8ArraySubarrayPart03Test061
     * @tc.desc Verify subarray begin two byteOffset byteLength two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(2);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 2;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      let actualByteLength: int = view.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6200
     * @tc.name int8ArraySubarrayPart03Test062
     * @tc.desc Verify subarray begin zero byteOffset zero byteLength two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, 2);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      let actualByteLength: int = view.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6300
     * @tc.name int8ArraySubarrayPart03Test063
     * @tc.desc Verify partial subarray view byteLength equals element count (int8 1 byte each)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 3);
      let actualByteLength: int = view.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6400
     * @tc.name int8ArraySubarrayPart03Test064
     * @tc.desc Verify subarray empty view byteLength zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(2, 2);
      let actualByteLength: int = view.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6500
     * @tc.name int8ArraySubarrayPart03Test065
     * @tc.desc Verify ArrayBuffer offset view then subarray, byteOffset accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Int8Array = new Int8Array(buf, 2, 4);
      const view: Int8Array = arr.subarray(1, 3);
      let actualByteOffset: int = view.byteOffset;
      let expectedByteOffset: int = 3;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6600
     * @tc.name int8ArraySubarrayPart03Test066
     * @tc.desc Verify subarray view fill range affects original only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 3);
      view.fill(99);
      let actualFirst: number = src.$_get(1);
      let expectedFirst: int = 99;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = src.$_get(2);
      let expectedSecond: int = 99;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = src.$_get(0);
      let expectedThird: int = 10;
      expect(actualThird).assertEqual(expectedThird);
      let actualFourth: number = src.$_get(3);
      let expectedFourth: int = 40;
      expect(actualFourth).assertEqual(expectedFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6700
     * @tc.name int8ArraySubarrayPart03Test067
     * @tc.desc Verify subarray view reverse affects original range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, 4);
      view.reverse();
      let actualFirst: number = src.$_get(0);
      let expectedFirst: int = 40;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = src.$_get(1);
      let expectedSecond: int = 30;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = src.$_get(2);
      let expectedThird: int = 20;
      expect(actualThird).assertEqual(expectedThird);
      let actualFourth: number = src.$_get(3);
      let expectedFourth: int = 10;
      expect(actualFourth).assertEqual(expectedFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6800
     * @tc.name int8ArraySubarrayPart03Test068
     * @tc.desc Verify after view modification original byteLength unchanged (subarray does not resize buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 3);
      view.$_set(0, 99);
      view.$_set(1, 88);
      let actualByteLength: int = src.byteLength;
      let expectedByteLength: int = 4;
      expect(actualByteLength).assertEqual(expectedByteLength);
      let actualLength: int = src.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_6900
     * @tc.name int8ArraySubarrayPart03Test069
     * @tc.desc Verify subarray().subarray() two-level nesting returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray().subarray();
      let actualLength: int = view.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(3);
      let expectedSecond: int = 40;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7000
     * @tc.name int8ArraySubarrayPart03Test070
     * @tc.desc Verify subarray(1,3).subarray(0,2) returns subview's full content [20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 3).subarray(0, 2);
      let actualLength: int = view.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 20;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 30;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7100
     * @tc.name int8ArraySubarrayPart03Test071
     * @tc.desc Verify subarray(1,3).subarray(1,1) inner begin=end returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 3).subarray(1, 1);
      let actualLength: int = view.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7200
     * @tc.name int8ArraySubarrayPart03Test072
     * @tc.desc Verify subarray(1,3).subarray(-1) returns subview last element [30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 3).subarray(-1);
      let actualLength: int = view.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 30;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7300
     * @tc.name int8ArraySubarrayPart03Test073
     * @tc.desc Verify triple nested subarray(2,4).subarray(0,2).subarray(0,1) returns single element [30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(2, 4).subarray(0, 2).subarray(0, 1);
      let actualLength: int = view.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 30;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7400
     * @tc.name int8ArraySubarrayPart03Test074
     * @tc.desc Verify subarray + copyWithin affects original array range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, 4);
      view.copyWithin(0, 2, 4);
      let actualFirst: number = src.$_get(0);
      let expectedFirst: int = 30;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = src.$_get(1);
      let expectedSecond: int = 40;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = src.$_get(2);
      let expectedThird: int = 30;
      expect(actualThird).assertEqual(expectedThird);
      let actualFourth: number = src.$_get(3);
      let expectedFourth: int = 40;
      expect(actualFourth).assertEqual(expectedFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7500
     * @tc.name int8ArraySubarrayPart03Test075
     * @tc.desc Verify subarray + slice returns independent copy, modifying copy does not affect original and view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, 4);
      const copy: Int8Array = view.slice(0, 2);
      copy.$_set(0, 99);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = src.$_get(0);
      let expectedSecond: int = 10;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = copy.$_get(0);
      let expectedThird: int = 99;
      expect(actualThird).assertEqual(expectedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7600
     * @tc.name int8ArraySubarrayPart03Test076
     * @tc.desc Verify triple chained subarray + subarray + $_set reflects to original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 4).subarray(0, 2);
      view.$_set(0, 55);
      let actualFirst: number = src.$_get(1);
      let expectedFirst: int = 55;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7700
     * @tc.name int8ArraySubarrayPart03Test077
     * @tc.desc Verify subarray + $_set(128/255) truncation writes -128/-1 to shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 3);
      view.$_set(0, 128);
      view.$_set(1, 255);
      let actualFirst: number = src.$_get(1);
      let expectedFirst: number = INT8_MIN;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = src.$_get(2);
      let expectedSecond: int = -1;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7800
     * @tc.name int8ArraySubarrayPart03Test078
     * @tc.desc Verify subarray view at negative one reflects shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      const view: Int8Array = src.subarray(1, 4);
      let actualFirst = view.at(-1);
      let expectedFirst: int = 40;
      expect(actualFirst).assertEqual(expectedFirst);
      src.$_set(3, 99);
      let actualSecond = view.at(-1);
      let expectedSecond: int = 99;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_7900
     * @tc.name int8ArraySubarrayPart03Test079
     * @tc.desc Verify subarray view contains int8 min value -128 read correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([INT8_MIN, 20, 30, 40]);
      const view: Int8Array = src.subarray(0, 2);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: number = INT8_MIN;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 20;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_8000
     * @tc.name int8ArraySubarrayPart03Test080
     * @tc.desc Verify subarray view contains int8 max value 127 read correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, INT8_MAX, 30, 40]);
      const view: Int8Array = src.subarray(1, 3);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: number = INT8_MAX;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(1);
      let expectedSecond: int = 30;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_8100
     * @tc.name int8ArraySubarrayPart03Test081
     * @tc.desc Verify subarray view contains truncated value (original write 128 becomes -128) visible in view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40]);
      src.$_set(1, 128);
      const view: Int8Array = src.subarray(0, 3);
      let actualFirst: number = view.$_get(1);
      let expectedFirst: number = INT8_MIN;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART03_8200
     * @tc.name int8ArraySubarrayPart03Test082
     * @tc.desc Verify subarray view contains 0 boundary values read correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([INT8_ZERO, INT8_MIN, INT8_ZERO, INT8_MAX]);
      const view: Int8Array = src.subarray(0, 4);
      let actualFirst: number = view.$_get(0);
      let expectedFirst: int = INT8_ZERO;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = view.$_get(2);
      let expectedSecond: int = INT8_ZERO;
      expect(actualSecond).assertEqual(expectedSecond);
    });
  });
}
