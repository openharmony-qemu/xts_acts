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

export default function int8ArrayWithPart02Test(): void {
  describe('Int8ArrayWithPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_0200
     * @tc.name int8ArrayWithPart02Test002
     * @tc.desc Verify Int8Array.with(0, 7) replaces only element of single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: Int8Array = arr.with(0, 7);
      let firstValue: number = result.$_get(0);
      let expected1: int = 7;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_0300
     * @tc.name int8ArrayWithPart02Test003
     * @tc.desc Verify with(2, 50) writes 50 on a constructor-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(2, 50);
      let firstValue: number = result.$_get(2);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_0400
     * @tc.name int8ArrayWithPart02Test004
     * @tc.desc Verify with(1) writes 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(1, 50);
      let firstValue: number = result.$_get(1);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_0500
     * @tc.name int8ArrayWithPart02Test005
     * @tc.desc Verify with index=-1 replaces last element of 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(-1, 50);
      let firstValue: number = result.$_get(2);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_0600
     * @tc.name int8ArrayWithPart02Test006
     * @tc.desc Verify with(-length) writes 50 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(-3, 50);
      let firstValue: number = result.$_get(0);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_0700
     * @tc.name int8ArrayWithPart02Test007
     * @tc.desc Verify with(-2) writes 50 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(-2, 50);
      let firstValue: number = result.$_get(1);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_0800
     * @tc.name int8ArrayWithPart02Test008
     * @tc.desc Verify with index=-1 replaces only element of single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: Int8Array = arr.with(-1, 99);
      let firstValue: number = result.$_get(0);
      let expected1: int = 99;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_1300
     * @tc.name int8ArrayWithPart02Test013
     * @tc.desc Verify with value=127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: Int8Array = arr.with(0, 127);
      let firstValue: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_1400
     * @tc.name int8ArrayWithPart02Test014
     * @tc.desc Verify with value=-128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: Int8Array = arr.with(0, -128);
      let firstValue: number = result.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_1600
     * @tc.name int8ArrayWithPart02Test016
     * @tc.desc Verify with value=-256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: Int8Array = arr.with(0, -256);
      let firstValue: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_2300
     * @tc.name int8ArrayWithPart02Test023
     * @tc.desc Verify with value=Number.EPSILON 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: Int8Array = arr.with(0, 2.220446049250313e-16);
      let firstValue: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_2400
     * @tc.name int8ArrayWithPart02Test024
     * @tc.desc Verify with value=Number.MAX_SAFE_INTEGER -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: Int8Array = arr.with(0, 9007199254740991);
      let firstValue: number = result.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_2500
     * @tc.name int8ArrayWithPart02Test025
     * @tc.desc Verify with index=0 + value=127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(0, 127);
      let firstValue: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = result.$_get(1);
      let expected2: int = 2;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_2600
     * @tc.name int8ArrayWithPart02Test026
     * @tc.desc Verify Int8Array.with() index=length-1 + value=-128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(2, -128);
      let firstValue: number = result.$_get(2);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = result.$_get(1);
      let expected2: int = 2;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_2700
     * @tc.name int8ArrayWithPart02Test027
     * @tc.desc Verify with index=0 + value=-129 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(0, -129);
      let firstValue: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_2800
     * @tc.name int8ArrayWithPart02Test028
     * @tc.desc Verify Int8Array.with() index=length-1 + value=1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(2, 1.9);
      let firstValue: number = result.$_get(2);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_2900
     * @tc.name int8ArrayWithPart02Test029
     * @tc.desc Verify Int8Array.with() returns new Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(0, 10);
      let firstValue: int = result.length;
      let expected1: int = 3;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = result.$_get(0);
      let expected2: int = 10;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3000
     * @tc.name int8ArrayWithPart02Test030
     * @tc.desc Verify with result length equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: Int8Array = arr.with(1, 10);
      let firstValue: int = result.length;
      let expected1: int = 4;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3100
     * @tc.name int8ArrayWithPart02Test031
     * @tc.desc Verify with single element result length one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: Int8Array = arr.with(0, 10);
      let firstValue: int = result.length;
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3200
     * @tc.name int8ArrayWithPart02Test032
     * @tc.desc Verify with index value (4 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: Int8Array = arr.with(2, 77);
      let firstValue: number = result.$_get(2);
      let expected1: int = 77;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3300
     * @tc.name int8ArrayWithPart02Test033
     * @tc.desc Verify with(1, 99) keeps other elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: Int8Array = arr.with(1, 99);
      let firstValue: number = result.$_get(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = result.$_get(2);
      let expected2: int = 30;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = result.$_get(3);
      let expected3: int = 40;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3400
     * @tc.name int8ArrayWithPart02Test034
     * @tc.desc Verify with(1, 99) leaves original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.with(1, 99);
      let firstValue: number = arr.$_get(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = arr.$_get(1);
      let expected2: int = 20;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = arr.$_get(2);
      let expected3: int = 30;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3600
     * @tc.name int8ArrayWithPart02Test036
     * @tc.desc Verify with preserves original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let buf: ArrayBuffer = arr.buffer;
      arr.with(1, 99);
      let firstValue: ArrayBuffer = arr.buffer;
      let expected1: ArrayBuffer = buf;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3700
     * @tc.name int8ArrayWithPart02Test037
     * @tc.desc Verify with(1, 99) result byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.with(1, 99);
      let firstValue: int = result.byteOffset;
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3800
     * @tc.name int8ArrayWithPart02Test038
     * @tc.desc Verify with result byteLength equals original byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: Int8Array = arr.with(1, 99);
      let firstValue: int = result.byteLength;
      let expected1: int = 4;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_3900
     * @tc.name int8ArrayWithPart02Test039
     * @tc.desc Verify with ( ) result mutation does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.with(1, 99);
      result.$_set(0, -1);
      let firstValue: number = arr.$_get(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4000
     * @tc.name int8ArrayWithPart02Test040
     * @tc.desc Verify with(0).with(1) writes 10 and 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(0, 10).with(1, 20);
      let firstValue: number = result.$_get(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = result.$_get(1);
      let expected2: int = 20;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4100
     * @tc.name int8ArrayWithPart02Test041
     * @tc.desc Verify with(0).with(1).with(2) writes all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.with(0, 10).with(1, 20).with(2, 30);
      let firstValue: number = result.$_get(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = result.$_get(1);
      let expected2: int = 20;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = result.$_get(2);
      let expected3: int = 30;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4200
     * @tc.name int8ArrayWithPart02Test042
     * @tc.desc Verify with(1, 99) result visible via at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.with(1, 99);
      let firstValue = result.at(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
      let secondValue = result.at(1);
      let expected2: int = 99;
      expect(secondValue).assertEqual(expected2);
      let thirdValue = result.at(-1);
      let expected3: int = 30;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4300
     * @tc.name int8ArrayWithPart02Test043
     * @tc.desc Verify with(1, 99) toString returns '10,99,30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.with(1, 99);
      let firstValue: string = result.toString();
      let expected1: string = '10,99,30';
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4500
     * @tc.name int8ArrayWithPart02Test045
     * @tc.desc Verify with out-of-range index throws RangeError and preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let original: int = arr.length;
      try {
        arr.with(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let secondValue: int = arr.length;
      let expected2: number = original;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4600
     * @tc.name int8ArrayWithPart02Test046
     * @tc.desc Verify with RangeError on invalid index keeps buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let buf: ArrayBuffer = arr.buffer;
      try {
        arr.with(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let secondValue: ArrayBuffer = arr.buffer;
      let expected2: ArrayBuffer = buf;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4700
     * @tc.name int8ArrayWithPart02Test047
     * @tc.desc Verify with(5) RangeError then with(0, 50) works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      try {
        arr.with(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: Int8Array = arr.with(0, 50);
      let secondValue: number = result.$_get(0);
      let expected2: int = 50;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4800
     * @tc.name int8ArrayWithPart02Test048
     * @tc.desc Verify with(1, 99) slice(1, 3) yields 99, 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: Int8Array = arr.with(1, 99);
      let sliced: Int8Array = result.slice(1, 3);
      let firstValue: number = sliced.$_get(0);
      let expected1: int = 99;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = sliced.$_get(1);
      let expected2: int = 30;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_4900
     * @tc.name int8ArrayWithPart02Test049
     * @tc.desc Verify fill on with() result leaves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.with(1, 99);
      result.fill(0, 0, 3);
      let firstValue: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = result.$_get(1);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = result.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_5000
     * @tc.name int8ArrayWithPart02Test050
     * @tc.desc Verify with(1, 99) indexOf finds 99 not 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.with(1, 99);
      let firstValue: int = result.indexOf(99);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: int = result.indexOf(20);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_5100
     * @tc.name int8ArrayWithPart02Test051
     * @tc.desc Verify with(1, 99) leaves source subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let sub: Int8Array = arr.subarray(0, 2);
      sub.with(1, 99);
      let firstValue: number = sub.$_get(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = sub.$_get(1);
      let expected2: int = 20;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_5200
     * @tc.name int8ArrayWithPart02Test052
     * @tc.desc Verify set on source visible after with()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.with(1, 99);
      let src: Int8Array = new Int8Array([7, 8]);
      arr.set(src, 0);
      let firstValue: number = arr.$_get(0);
      let expected1: int = 7;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = arr.$_get(1);
      let expected2: int = 8;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_5300
     * @tc.name int8ArrayWithPart02Test053
     * @tc.desc Verify with(1, 99) leaves source toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.with(1, 99);
      let firstValue: string = arr.toString();
      let expected1: string = '10,20,30';
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_5400
     * @tc.name int8ArrayWithPart02Test054
     * @tc.desc Verify with(0, 50) on from-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.from([1, 2, 3]);
      let result: Int8Array = arr.with(0, 50);
      let firstValue: number = result.$_get(0);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_5500
     * @tc.name int8ArrayWithPart02Test055
     * @tc.desc Verify with(2, 50) on of-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.with(2, 50);
      let firstValue: number = result.$_get(2);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_5600
     * @tc.name int8ArrayWithPart02Test056
     * @tc.desc Verify with(0) on subarray view leaves view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = base.subarray(1, 4);
      let result: Int8Array = view.with(0, 50);
      let firstValue: number = result.$_get(0);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = view.$_get(0);
      let expected2: int = 2;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART02_TEST_5700
     * @tc.name int8ArrayWithPart02Test057
     * @tc.desc Verify with(1) on slice copy leaves copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let copy: Int8Array = base.slice(1, 4);
      let result: Int8Array = copy.with(1, 50);
      let firstValue: number = result.$_get(1);
      let expected1: int = 50;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = copy.$_get(1);
      let expected2: int = 3;
      expect(secondValue).assertEqual(expected2);
    });
  });
}
