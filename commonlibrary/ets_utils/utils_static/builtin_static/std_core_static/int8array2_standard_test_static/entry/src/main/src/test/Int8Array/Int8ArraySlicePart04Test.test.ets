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
import Utils from './../Util.test';

export default function int8ArraySlicePart04Test(): void {
  describe('Int8ArraySlicePart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0100
     * @tc.name int8ArraySlicePart04Test001
     * @tc.desc Verify slice buffer buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice();
      expect(sliced.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0200
     * @tc.name int8ArraySlicePart04Test002
     * @tc.desc Verify slice byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(1, 3);
      let actualByteOffset: int = sliced.byteOffset;
      let expected1: int = 0;
      expect(actualByteOffset).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0300
     * @tc.name int8ArraySlicePart04Test003
     * @tc.desc Verify slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(1, 1);
      expect(sliced.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0400
     * @tc.name int8ArraySlicePart04Test004
     * @tc.desc Verify slice(-2).slice(-1) yields element 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let nested: Int8Array = arr.slice(-2).slice(-1);
      let actualValue: number = nested.$_get(0);
      let expected1: int = 40;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0500
     * @tc.name int8ArraySlicePart04Test005
     * @tc.desc Verify slice(1).subarray(0) $_set slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let sliced: Int8Array = arr.slice(1);
      let view: Int8Array = sliced.subarray(0);
      view.$_set(0, 99);
      let actualValue: number = sliced.$_get(0);
      let expected1: int = 99;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0600
     * @tc.name int8ArraySlicePart04Test006
     * @tc.desc Verify slice reslicing reflects prior set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(0, 3);
      sliced.$_set(0, 99);
      let reSliced: Int8Array = sliced.slice(0, 1);
      let actualValue: number = reSliced.$_get(0);
      let expected1: int = 99;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0700
     * @tc.name int8ArraySlicePart04Test007
     * @tc.desc Verify fill on discarded slice leaves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: Int8Array = arr.slice(1).fill(0);
      let expectedVal1: Int8Array = new Int8Array([0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let actualValue: number = arr.$_get(1);
      let expected1: int = 20;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0800
     * @tc.name int8ArraySlicePart04Test008
     * @tc.desc Verify reverse on discarded slice leaves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: Int8Array = arr.slice(1).reverse();
      let expectedVal1: Int8Array = new Int8Array([30, 20]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let actualValue: number = arr.$_get(1);
      let expected1: int = 20;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_0900
     * @tc.name int8ArraySlicePart04Test009
     * @tc.desc Verify copyWithin on discarded slice leaves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let resultVal1: Int8Array = arr.slice(1).copyWithin(0, 1);
      let expectedVal1: Int8Array = new Int8Array([30, 40, 40]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let actualValue: number = arr.$_get(1);
      let expected1: int = 20;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1000
     * @tc.name int8ArraySlicePart04Test010
     * @tc.desc Verify slice(1).with(0, 100) 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.slice(1).with(0, 100);
      let actualValue: number = result.$_get(0);
      let expected1: int = 100;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1100
     * @tc.name int8ArraySlicePart04Test011
     * @tc.desc Verify slice(1).toReversed() yields 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.slice(1).toReversed();
      let actualValue: number = result.$_get(0);
      let expected1: int = 30;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1200
     * @tc.name int8ArraySlicePart04Test012
     * @tc.desc Verify slice(1).toSorted() yields 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 30, 20]);
      let result: Int8Array = arr.slice(1).toSorted();
      let actualValue: number = result.$_get(0);
      let expected1: int = 20;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1300
     * @tc.name int8ArraySlicePart04Test013
     * @tc.desc Verify slice of subarray view stays independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let view: Int8Array = arr.subarray(1);
      let sliced: Int8Array = view.slice(0);
      sliced.$_set(0, 99);
      let actualValue: number = view.$_get(0);
      let expected1: int = 20;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1400
     * @tc.name int8ArraySlicePart04Test014
     * @tc.desc Verify $_set(0, 200) -56 slice(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.$_set(0, 200);
      let sliced: Int8Array = arr.slice(0, 1);
      let actualValue: number = sliced.$_get(0);
      let expected1: int = -56;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1500
     * @tc.name int8ArraySlicePart04Test015
     * @tc.desc Verify fill(127) slice(0,2) 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.fill(127);
      let sliced: Int8Array = arr.slice(0, 2);
      let actualValue: number = sliced.$_get(1);
      let expected1: number = INT8_MAX;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1600
     * @tc.name int8ArraySlicePart04Test016
     * @tc.desc Verify slice after reverse yields 30 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.reverse();
      let sliced: Int8Array = arr.slice(0, 1);
      let actualValue: number = sliced.$_get(0);
      let expected1: int = 30;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1700
     * @tc.name int8ArraySlicePart04Test017
     * @tc.desc Verify slice after copyWithin yields 30 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      arr.copyWithin(0, 2, 4);
      let sliced: Int8Array = arr.slice(0, 2);
      let actualValue: number = sliced.$_get(0);
      let expected1: int = 30;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1800
     * @tc.name int8ArraySlicePart04Test018
     * @tc.desc Verify set(other, 1) slice(1,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let other: Int8Array = new Int8Array([99]);
      arr.set(other, 1);
      let sliced: Int8Array = arr.slice(1, 2);
      let actualValue: number = sliced.$_get(0);
      let expected1: int = 99;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_1900
     * @tc.name int8ArraySlicePart04Test019
     * @tc.desc Verify slice forEach $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(0, 3);
      let sum: number = 0;
      sliced.forEach((v: number) => {
        sum += v;
        arr.$_set(0, 99);
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2000
     * @tc.name int8ArraySlicePart04Test020
     * @tc.desc Verify slice map fill(0) map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(0, 3);
      let mapped: Int8Array = sliced.map((v: number) => {
        arr.fill(0);
        return v * 2;
      });
      let actualValue: number = mapped.$_get(1);
      let expected1: int = 4;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2100
     * @tc.name int8ArraySlicePart04Test021
     * @tc.desc Verify slice filter reverse() filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(0, 3);
      let filtered: Int8Array = sliced.filter((v: number): boolean => {
        arr.reverse();
        return v > 1;
      });
      let actualLength: int = filtered.length;
      let expected1: int = 2;
      expect(actualLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2200
     * @tc.name int8ArraySlicePart04Test022
     * @tc.desc Verify forEach $_set slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(0, 3);
      arr.forEach((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        arr.$_set(0, 99);
      });
      let actualValue: number = sliced.$_get(0);
      let expected1: int = 1;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2300
     * @tc.name int8ArraySlicePart04Test023
     * @tc.desc Verify $_set(0, INT8_MIN) -128 slice -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, INT8_MIN);
      let sliced: Int8Array = arr.slice(0, 1);
      let actualValue: number = sliced.$_get(0);
      let expected1: number = INT8_MIN;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2400
     * @tc.name int8ArraySlicePart04Test024
     * @tc.desc Verify $_set(0, Number.NaN) 0 slice 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, Number.NaN);
      let sliced: Int8Array = arr.slice(0, 1);
      let actualValue: number = sliced.$_get(0);
      let expected1: int = 0;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2500
     * @tc.name int8ArraySlicePart04Test025
     * @tc.desc Verify subarray $_set buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(0, 3);
      view.$_set(0, 99);
      let actualValue: number = arr.$_get(0);
      let expected1: int = 99;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2600
     * @tc.name int8ArraySlicePart04Test026
     * @tc.desc Verify slice set Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let target: Int8Array = new Int8Array(3);
      target.set(arr.slice(0, 3), 0);
      let actualValue: number = target.$_get(2);
      let expected1: int = 3;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2700
     * @tc.name int8ArraySlicePart04Test027
     * @tc.desc Verify slice new Int8Array(typedArray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(1, 3);
      let copy: Int8Array = new Int8Array(sliced);
      let actualLength: int = copy.length;
      let expected1: int = 2;
      expect(actualLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2800
     * @tc.name int8ArraySlicePart04Test028
     * @tc.desc Verify Int8Array.from(slice) copies element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(1, 3);
      let copy: Int8Array = Int8Array.from(sliced);
      let actualValue: number = copy.$_get(1);
      let expected1: int = 3;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_2900
     * @tc.name int8ArraySlicePart04Test029
     * @tc.desc Verify slice set offset=0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.set(arr.slice(1, 1), 0);
      let actualValue: number = arr.$_get(0);
      let expected1: int = 1;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_3000
     * @tc.name int8ArraySlicePart04Test030
     * @tc.desc Verify slice fill set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      let sliced: Int8Array = arr.slice(0, 3);
      arr.fill(0);
      arr.set(sliced, 0);
      let actualValue: number = arr.$_get(0);
      let expected1: int = 99;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_3100
     * @tc.name int8ArraySlicePart04Test031
     * @tc.desc Verify slice length === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let sliced: Int8Array = arr.slice(0, 0);
      let actualLength: int = sliced.length;
      let expected1: int = 0;
      expect(actualLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_3200
     * @tc.name int8ArraySlicePart04Test032
     * @tc.desc Verify slice forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let sliced: Int8Array = arr.slice();
      let count: int = 0;
      sliced.forEach((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_3300
     * @tc.name int8ArraySlicePart04Test033
     * @tc.desc Verify slice(0,1) copy $_set leaves source 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let sliced: Int8Array = arr.slice(0, 1);
      sliced.$_set(0, 99);
      let actualValue: number = arr.$_get(0);
      let expected1: int = 42;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_3400
     * @tc.name int8ArraySlicePart04Test034
     * @tc.desc Verify slice(0,0) returns empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let sliced: Int8Array = arr.slice(0, 0);
      let actualLength: int = sliced.length;
      let expected1: int = 0;
      expect(actualLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_3500
     * @tc.name int8ArraySlicePart04Test035
     * @tc.desc Verify slice sort() slice(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let sliced: Int8Array = arr.slice(0, 3);
      sliced.sort();
      let reSliced: Int8Array = sliced.slice(0, 1);
      let actualValue: number = reSliced.$_get(0);
      let expected1: int = 1;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_3600
     * @tc.name int8ArraySlicePart04Test036
     * @tc.desc Verify fill(0,1,3) then slice(0,5) yields 0 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.fill(0, 1, 3);
      let sliced: Int8Array = arr.slice(0, 5);
      let actualValue: number = sliced.$_get(2);
      let expected1: int = 0;
      expect(actualValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART04_TEST_3700
     * @tc.name int8ArraySlicePart04Test037
     * @tc.desc Verify slice reverse() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sliced: Int8Array = arr.slice(0, 3);
      sliced.reverse();
      sliced.reverse();
      let actualValue: number = sliced.$_get(0);
      let expected1: int = 1;
      expect(actualValue).assertEqual(expected1);
    });
  });
}
