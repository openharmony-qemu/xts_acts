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
import Utils from '../Util.test';

export default function int8ArrayValueOfPart01Test(): void {
  describe('Int8ArrayValueOfPart01Test', (): void => {
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0100
     * @tc.name int8ArrayValueOfPart01Test001
     * @tc.desc Verify arity=0 valueOf() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0200
     * @tc.name int8ArrayValueOfPart01Test002
     * @tc.desc Verify new Int8Array(0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0300
     * @tc.name int8ArrayValueOfPart01Test003
     * @tc.desc Verify new Int8Array(1) 0 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 0;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0400
     * @tc.name int8ArrayValueOfPart01Test004
     * @tc.desc Verify new Int8Array(4) 0 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 0;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = v.$_get(3);
      let expectedVal2 = 0;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0500
     * @tc.name int8ArrayValueOfPart01Test005
     * @tc.desc Verify new Int8Array([1,2,3]) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0600
     * @tc.name int8ArrayValueOfPart01Test006
     * @tc.desc Verify new Int8Array([]) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0700
     * @tc.name int8ArrayValueOfPart01Test007
     * @tc.desc Verify new Int8Array([INT8_MIN,INT8_MAX]) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = INT8_MIN;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = v.$_get(1);
      let expectedVal2 = INT8_MAX;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0800
     * @tc.name int8ArrayValueOfPart01Test008
     * @tc.desc Verify new Int8Array(new ArrayBuffer(4)) buffer 0 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 0;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_0900
     * @tc.name int8ArrayValueOfPart01Test009
     * @tc.desc Verify offset=2 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let arr: Int8Array = new Int8Array(base.buffer, 2);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 30;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1000
     * @tc.name int8ArrayValueOfPart01Test010
     * @tc.desc Verify offset=2 length=4 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let arr: Int8Array = new Int8Array(base.buffer, 2, 4);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 30;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = v.$_get(3);
      let expectedVal2 = 60;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1100
     * @tc.name int8ArrayValueOfPart01Test011
     * @tc.desc Verify offset=0 length=8 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let arr: Int8Array = new Int8Array(base.buffer, 0, 8);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 10;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = v.$_get(7);
      let expectedVal2 = 80;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1200
     * @tc.name int8ArrayValueOfPart01Test012
     * @tc.desc Verify offset=0 length=0 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let arr: Int8Array = new Int8Array(base.buffer, 0, 0);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1300
     * @tc.name int8ArrayValueOfPart01Test013
     * @tc.desc Verify offset=byteLength valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let arr: Int8Array = new Int8Array(base.buffer, 8);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1400
     * @tc.name int8ArrayValueOfPart01Test014
     * @tc.desc Verify offset=1 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let arr: Int8Array = new Int8Array(base.buffer, 1);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 20;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1500
     * @tc.name int8ArrayValueOfPart01Test015
     * @tc.desc Verify offset=byteLength-1 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let arr: Int8Array = new Int8Array(base.buffer, 7);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 80;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1600
     * @tc.name int8ArrayValueOfPart01Test016
     * @tc.desc Verify offset=0 length=1 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let arr: Int8Array = new Int8Array(base.buffer, 0, 1);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 10;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1700
     * @tc.name int8ArrayValueOfPart01Test017
     * @tc.desc Verify new Int8Array(new ArrayBuffer(0)) buffer valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int8Array = new Int8Array(buf);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1800
     * @tc.name int8ArrayValueOfPart01Test018
     * @tc.desc Verify new Int8Array([INT8_MAX]) of valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = INT8_MAX;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_1900
     * @tc.name int8ArrayValueOfPart01Test019
     * @tc.desc Verify new Int8Array([INT8_MIN,0,INT8_MAX]) of valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = INT8_MIN;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = v.$_get(2);
      let expectedVal2 = INT8_MAX;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2000
     * @tc.name int8ArrayValueOfPart01Test020
     * @tc.desc Verify new Int8Array([INT8_MIN]) of valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = INT8_MIN;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2100
     * @tc.name int8ArrayValueOfPart01Test021
     * @tc.desc Verify Int8Array.from([]) from valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.from([]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2200
     * @tc.name int8ArrayValueOfPart01Test022
     * @tc.desc Verify Int8Array.from([1,2,3]) from valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.from([1, 2, 3]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2300
     * @tc.name int8ArrayValueOfPart01Test023
     * @tc.desc Verify Int8Array.from(new Int8Array([5,6])) TypedArray from valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([5, 6]);
      let arr: Int8Array = Int8Array.from(src);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 5;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2400
     * @tc.name int8ArrayValueOfPart01Test024
     * @tc.desc Verify new Int8Array([2,4,6]) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([2, 4, 6]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 2;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2500
     * @tc.name int8ArrayValueOfPart01Test025
     * @tc.desc Verify subarray(0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0);
      let v: Int8Array = view.valueOf();
      expect(v).assertEqual(view);
      let actualVal = v.$_get(0);
      let expectedVal = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2600
     * @tc.name int8ArrayValueOfPart01Test026
     * @tc.desc Verify subarray(1,3) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 3);
      let v: Int8Array = view.valueOf();
      expect(v).assertEqual(view);
      let actualVal = v.$_get(0);
      let expectedVal = 2;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2700
     * @tc.name int8ArrayValueOfPart01Test027
     * @tc.desc Verify subarray(0,0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 0);
      let v: Int8Array = view.valueOf();
      expect(v).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2800
     * @tc.name int8ArrayValueOfPart01Test028
     * @tc.desc Verify subarray(-2) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(-2);
      let v: Int8Array = view.valueOf();
      expect(v).assertEqual(view);
      let actualVal = v.$_get(0);
      let expectedVal = 4;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_2900
     * @tc.name int8ArrayValueOfPart01Test029
     * @tc.desc Verify subarray(-1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(-1);
      let v: Int8Array = view.valueOf();
      expect(v).assertEqual(view);
      let actualVal = v.$_get(0);
      let expectedVal = 5;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3000
     * @tc.name int8ArrayValueOfPart01Test030
     * @tc.desc Verify subarray(2) 2 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(2);
      let v: Int8Array = view.valueOf();
      expect(v).assertEqual(view);
      let actualVal = v.$_get(0);
      let expectedVal = 3;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3100
     * @tc.name int8ArrayValueOfPart01Test031
     * @tc.desc Verify subarray(-2,-1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(-2, -1);
      let v: Int8Array = view.valueOf();
      expect(v).assertEqual(view);
      let actualVal = v.$_get(0);
      let expectedVal = 4;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3200
     * @tc.name int8ArrayValueOfPart01Test032
     * @tc.desc Verify slice(0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let copy: Int8Array = arr.slice(0);
      let v: Int8Array = copy.valueOf();
      expect(v).assertEqual(copy);
      let actualVal = v.$_get(0);
      let expectedVal = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3300
     * @tc.name int8ArrayValueOfPart01Test033
     * @tc.desc Verify slice(1,2) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let copy: Int8Array = arr.slice(1, 2);
      let v: Int8Array = copy.valueOf();
      expect(v).assertEqual(copy);
      let actualVal = v.$_get(0);
      let expectedVal = 2;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3400
     * @tc.name int8ArrayValueOfPart01Test034
     * @tc.desc Verify slice(-2) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let copy: Int8Array = arr.slice(-2);
      let v: Int8Array = copy.valueOf();
      expect(v).assertEqual(copy);
      let actualVal = v.$_get(0);
      let expectedVal = 4;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3500
     * @tc.name int8ArrayValueOfPart01Test035
     * @tc.desc Verify slice() ( = ) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let copy: Int8Array = arr.slice();
      let v: Int8Array = copy.valueOf();
      expect(v).assertEqual(copy);
      let actualVal = v.$_get(0);
      let expectedVal = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3600
     * @tc.name int8ArrayValueOfPart01Test036
     * @tc.desc Verify slice(0,0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let copy: Int8Array = arr.slice(0, 0);
      let v: Int8Array = copy.valueOf();
      expect(v).assertEqual(copy);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3700
     * @tc.name int8ArrayValueOfPart01Test037
     * @tc.desc Verify new Int8Array([-129]) -129 127 valueOf this 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-129]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = INT8_MAX;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3800
     * @tc.name int8ArrayValueOfPart01Test038
     * @tc.desc Verify new Int8Array([256]) 256 0 valueOf this 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([256]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 0;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_3900
     * @tc.name int8ArrayValueOfPart01Test039
     * @tc.desc Verify new Int8Array([129]) 129 -127 valueOf this -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([129]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = -127;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4000
     * @tc.name int8ArrayValueOfPart01Test040
     * @tc.desc Verify new Int8Array([1.9]) 1.9 1 valueOf this 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4100
     * @tc.name int8ArrayValueOfPart01Test041
     * @tc.desc Verify new Int8Array([42]) valueOf this 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 42;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4200
     * @tc.name int8ArrayValueOfPart01Test042
     * @tc.desc Verify -128 valueOf this -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(1);
      let expectedVal = INT8_MIN;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4300
     * @tc.name int8ArrayValueOfPart01Test043
     * @tc.desc Verify 127 valueOf this 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(2);
      let expectedVal = INT8_MAX;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4400
     * @tc.name int8ArrayValueOfPart01Test044
     * @tc.desc Verify [0,-128,127,-1] valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MIN, INT8_MAX, -1]);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(2);
      let expectedVal = INT8_MAX;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = v.$_get(3);
      let expectedVal2 = -1;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4500
     * @tc.name int8ArrayValueOfPart01Test045
     * @tc.desc Verify 1000 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1000);
      arr.$_set(0, 5);
      arr.$_set(999, 7);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 5;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = v.$_get(999);
      let expectedVal2 = 7;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4600
     * @tc.name int8ArrayValueOfPart01Test046
     * @tc.desc Verify buffer valueOf this for two views on one buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let firstView: Int8Array = new Int8Array(buf, 0, 4);
      let secondView: Int8Array = new Int8Array(buf, 4, 4);
      let actualVal = firstView.valueOf();
      let expectedVal = firstView;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = secondView.valueOf();
      let expectedVal2 = secondView;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4700
     * @tc.name int8ArrayValueOfPart01Test047
     * @tc.desc Verify subarray buffer valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 3);
      let actualVal = arr.valueOf();
      let expectedVal: Int8Array = arr;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = view.valueOf();
      let expectedVal2 = view;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4800
     * @tc.name int8ArrayValueOfPart01Test048
     * @tc.desc Verify buffer valueOf this for three views on one buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let firstView: Int8Array = new Int8Array(buf, 0, 4);
      let secondView: Int8Array = new Int8Array(buf, 4, 4);
      let thirdView: Int8Array = new Int8Array(buf, 8, 4);
      let actualVal = firstView.valueOf();
      let expectedVal = firstView;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = secondView.valueOf();
      let expectedVal2 = secondView;
      expect(actualVal2).assertEqual(expectedVal2);
      let actualVal3 = thirdView.valueOf();
      let expectedVal3 = thirdView;
      expect(actualVal3).assertEqual(expectedVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_4900
     * @tc.name int8ArrayValueOfPart01Test049
     * @tc.desc Verify slice buffer valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let copy: Int8Array = arr.slice(0);
      let actualVal = arr.valueOf();
      let expectedVal: Int8Array = arr;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2 = copy.valueOf();
      let expectedVal2 = copy;
      expect(actualVal2).assertEqual(expectedVal2);
      copy.$_set(0, 99);
      let actualVal3 = arr.$_get(0);
      let expectedVal3 = 1;
      expect(actualVal3).assertEqual(expectedVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5000
     * @tc.name int8ArrayValueOfPart01Test050
     * @tc.desc Verify $_set valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 99;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5100
     * @tc.name int8ArrayValueOfPart01Test051
     * @tc.desc Verify fill(7) valueOf this 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.fill(7);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 7;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5200
     * @tc.name int8ArrayValueOfPart01Test052
     * @tc.desc Verify reverse() valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reverse();
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 3;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5300
     * @tc.name int8ArrayValueOfPart01Test053
     * @tc.desc Verify sort() valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      arr.sort();
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5400
     * @tc.name int8ArrayValueOfPart01Test054
     * @tc.desc Verify copyWithin(0,1,3) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1, 3);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 2;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5500
     * @tc.name int8ArrayValueOfPart01Test055
     * @tc.desc Verify set(src,0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let src: Int8Array = new Int8Array([7, 8, 9]);
      arr.set(src, 0);
      let v: Int8Array = arr.valueOf();
      expect(v).assertEqual(arr);
      let actualVal = v.$_get(0);
      let expectedVal = 7;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5600
     * @tc.name int8ArrayValueOfPart01Test056
     * @tc.desc Verify valueOf().valueOf() returns same this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: Int8Array = arr.valueOf().valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5700
     * @tc.name int8ArrayValueOfPart01Test057
     * @tc.desc Verify arr.reverse().valueOf() (reverse this valueOf this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let actualVal = arr.reverse().valueOf();
      let expectedVal: Int8Array = arr;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5800
     * @tc.name int8ArrayValueOfPart01Test058
     * @tc.desc Verify arr.fill(5).valueOf() (fill this valueOf this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let actualVal = arr.fill(5).valueOf();
      let expectedVal: Int8Array = arr;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_5900
     * @tc.name int8ArrayValueOfPart01Test059
     * @tc.desc Verify valueOf() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let actualVal = arr.valueOf();
      let expectedLength: number = 3;
      expect(actualVal.length).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_6000
     * @tc.name int8ArrayValueOfPart01Test060
     * @tc.desc Verify valueOf ( this )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array([1, 2, 3]);
      let b: Int8Array = new Int8Array([1, 2, 3]);
      let va: Int8Array = a.valueOf();
      va.$_set(0, 99);
      let actualVal = b.$_get(0);
      let expectedVal = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_6100
     * @tc.name int8ArrayValueOfPart01Test061
     * @tc.desc Verify valueOf ( this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: Int8Array = arr.valueOf();
      arr.$_set(0, 99);
      let actualVal = v.$_get(0);
      let expectedVal = 99;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_6200
     * @tc.name int8ArrayValueOfPart01Test062
     * @tc.desc Verify $_set valueOf ( across )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let firstView: Int8Array = arr.valueOf();
      arr.$_set(0, 99);
      let secondView: Int8Array = arr.valueOf();
      let expected0: number = 99;
      expect(firstView.$_get(0)).assertEqual(expected0);
      expect(secondView.$_get(0)).assertEqual(expected0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART01_TEST_6300
     * @tc.name int8ArrayValueOfPart01Test063
     * @tc.desc Verify reverse valueOf ( across reverse )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let firstView: Int8Array = arr.valueOf();
      arr.reverse();
      let secondView: Int8Array = arr.valueOf();
      let expected0: number = 3;
      expect(firstView.$_get(0)).assertEqual(expected0);
      expect(secondView.$_get(0)).assertEqual(expected0);
    });
  });
}
