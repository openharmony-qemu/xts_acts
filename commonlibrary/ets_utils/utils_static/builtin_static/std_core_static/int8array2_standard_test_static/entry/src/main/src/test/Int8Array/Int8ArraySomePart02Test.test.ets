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

export default function int8ArraySomePart02Test(): void {
  describe('Int8ArraySomePart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_0100
     * @tc.name int8ArraySomePart02Test001
     * @tc.desc Verify some typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let r = arr.some((e: number) => e > 0);
      let someResult = r;
      let r1: string = typeof someResult;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_0200
     * @tc.name int8ArraySomePart02Test002
     * @tc.desc Verify typeof 'boolean' when some returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let r = arr.some((e: number) => e > 0);
      let someResult = r;
      let r1: string = typeof someResult;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_0300
     * @tc.name int8ArraySomePart02Test003
     * @tc.desc Verify some returns boolean type with greater than predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let r = arr.some((e: number) => e > 1);
      let someResult = r;
      let r1: string = typeof someResult;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_0400
     * @tc.name int8ArraySomePart02Test004
     * @tc.desc Verify typeof 'boolean' when some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let r = arr.some((e: number) => e > 100);
      let someResult = r;
      let r1: string = typeof someResult;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_0500
     * @tc.name int8ArraySomePart02Test005
     * @tc.desc Verify some returns boolean type with max match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 0, -1]);
      let r = arr.some((e: number) => e === 127);
      let someResult = r;
      let r1: string = typeof someResult;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_0600
     * @tc.name int8ArraySomePart02Test006
     * @tc.desc Verify some returns boolean type with negative predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-5, -10, -3]);
      let r = arr.some((e: number) => e < -4);
      let someResult = r;
      let r1: string = typeof someResult;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_1100
     * @tc.name int8ArraySomePart02Test011
     * @tc.desc Verify some predicate stored two hundred wraps negative fifty six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([200, 0, 1]);
      let r = arr.some((e: number) => e === -56);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_1200
     * @tc.name int8ArraySomePart02Test012
     * @tc.desc Verify some predicate NaN source stores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN, 5, 1];
      let arr = new Int8Array(src);
      let r = arr.some((e: number) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_1300
     * @tc.name int8ArraySomePart02Test013
     * @tc.desc Verify some predicate 1.9 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1.9, 0, 2];
      let arr = new Int8Array(src);
      let r = arr.some((e: number) => e === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_1500
     * @tc.name int8ArraySomePart02Test015
     * @tc.desc Verify some(e===7) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 7, 7]);
      let r = arr.some((e: number) => e === 7);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_1800
     * @tc.name int8ArraySomePart02Test018
     * @tc.desc Verify some false on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let r = arr.some((e: number) => e > 100);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_1900
     * @tc.name int8ArraySomePart02Test019
     * @tc.desc Verify some greater than 127 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 100, INT8_MIN]);
      let r = arr.some((e: number) => e > 127);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_2000
     * @tc.name int8ArraySomePart02Test020
     * @tc.desc Verify some less than -128 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN, 0]);
      let r = arr.some((e: number) => e < -128);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_2100
     * @tc.name int8ArraySomePart02Test021
     * @tc.desc Verify some false when predicate matches no equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 7, 7]);
      let r = arr.some((e: number) => e === 8);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_2200
     * @tc.name int8ArraySomePart02Test022
     * @tc.desc Verify some(e===2) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let r = arr.some((e: number) => e === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_2300
     * @tc.name int8ArraySomePart02Test023
     * @tc.desc Verify some(e===99) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let r = arr.some((e: number) => e === 99);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_2400
     * @tc.name int8ArraySomePart02Test024
     * @tc.desc Verify some match five calls predicate once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 6, 7]);
      let counter: int[] = [0];
      let resultVal1: boolean = arr.some((e: number) => {
        counter[0] = counter[0] + 1;
        return e === 5;
      });
      expect(resultVal1).assertTrue();
      let r1: number = counter[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_2500
     * @tc.name int8ArraySomePart02Test025
     * @tc.desc Verify some(predicate) calls callback twice for match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 6, 7]);
      let counter: int[] = [0];
      let resultVal1: boolean = arr.some((e: number) => {
        counter[0] = counter[0] + 1;
        return e === 6;
      });
      expect(resultVal1).assertTrue();
      let r1: number = counter[0];
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_2900
     * @tc.name int8ArraySomePart02Test029
     * @tc.desc Verify some array argument length three returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let r = arr.some((e: number, i: int, a: Int8Array) => a.length === 3 && e === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3000
     * @tc.name int8ArraySomePart02Test030
     * @tc.desc Verify some preserves length of 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3100
     * @tc.name int8ArraySomePart02Test031
     * @tc.desc Verify some length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertFalse();
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3200
     * @tc.name int8ArraySomePart02Test032
     * @tc.desc Verify some preserves length of single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: int = arr.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3300
     * @tc.name int8ArraySomePart02Test033
     * @tc.desc Verify some byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: int = arr.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3400
     * @tc.name int8ArraySomePart02Test034
     * @tc.desc Verify some ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 2, 3);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertFalse();
      let r1: int = arr.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3500
     * @tc.name int8ArraySomePart02Test035
     * @tc.desc Verify some keeps buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let bufBefore = arr.buffer;
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: ArrayBuffer = arr.buffer;
      let e1: ArrayBuffer = bufBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3600
     * @tc.name int8ArraySomePart02Test036
     * @tc.desc Verify some keeps buffer.byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: int = arr.buffer.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3700
     * @tc.name int8ArraySomePart02Test037
     * @tc.desc Verify some ArrayBuffer.isView(arr) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: boolean = ArrayBuffer.isView(arr);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3800
     * @tc.name int8ArraySomePart02Test038
     * @tc.desc Verify some length === byteLength int8 1 1:1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: int = arr.length;
      let e1: int = arr.byteLength;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_3900
     * @tc.name int8ArraySomePart02Test039
     * @tc.desc Verify some leaves element at index 0 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: number = arr.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4000
     * @tc.name int8ArraySomePart02Test040
     * @tc.desc Verify some leaves element at index 2 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: number = arr.$_get(2);
      let e1: int = 33;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4100
     * @tc.name int8ArraySomePart02Test041
     * @tc.desc Verify some does not change sum of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, -5, 7]);
      let sumBefore: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sumBefore = sumBefore + arr.$_get(i);
      }
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let sumAfter: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sumAfter = sumAfter + arr.$_get(i);
      }
      expect(sumAfter).assertEqual(sumBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4200
     * @tc.name int8ArraySomePart02Test042
     * @tc.desc Verify some(e>0) leaves INT8_MAX element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 0, -1]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4300
     * @tc.name int8ArraySomePart02Test043
     * @tc.desc Verify some(e>0) leaves INT8_MIN element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, 0, 1]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4400
     * @tc.name int8ArraySomePart02Test044
     * @tc.desc Verify some(e>0) leaves first element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 5, -3]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4500
     * @tc.name int8ArraySomePart02Test045
     * @tc.desc Verify some leaves join(',') unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let joinBefore = arr.join(',');
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: string = arr.join(',');
      let e1: string = joinBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4600
     * @tc.name int8ArraySomePart02Test046
     * @tc.desc Verify some leaves toString unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let strBefore = arr.toString();
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: string = arr.toString();
      let e1: string = strBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4700
     * @tc.name int8ArraySomePart02Test047
     * @tc.desc Verify some(callback) returns boolean indicating if any array element satisfies predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 99, 77]);
      let resultVal1: boolean = arr.some((e: number) => e === 5);
      expect(resultVal1).assertTrue();
      let r1: number = arr.$_get(2);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4800
     * @tc.name int8ArraySomePart02Test048
     * @tc.desc Verify some on subarray view leaves base element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5]);
      let view = base.subarray(1, 4);
      view.some((e: number) => e > 0);
      let r1: number = base.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_4900
     * @tc.name int8ArraySomePart02Test049
     * @tc.desc Verify subarray some byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5]);
      let view = base.subarray(1, 4);
      view.some((e: number) => e > 0);
      let r1: int = view.byteOffset;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5000
     * @tc.name int8ArraySomePart02Test050
     * @tc.desc Verify subarray some length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5]);
      let view = base.subarray(1, 4);
      view.some((e: number) => e > 0);
      let r1: int = view.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5100
     * @tc.name int8ArraySomePart02Test051
     * @tc.desc Verify buffer A some B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a = new Int8Array(buf, 0, 2);
      let b = new Int8Array(buf, 2, 6);
      b.$_set(0, 60);
      let resultVal1: boolean = a.some((e: number) => e > 0);
      expect(resultVal1).assertFalse();
      let r1: number = b.$_get(0);
      let e1: int = 60;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5200
     * @tc.name int8ArraySomePart02Test052
     * @tc.desc Verify buffer A some B length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a = new Int8Array(buf, 0, 2);
      let b = new Int8Array(buf, 2, 6);
      let resultVal1: boolean = a.some((e: number) => e > 0);
      expect(resultVal1).assertFalse();
      let r1: int = b.length;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5300
     * @tc.name int8ArraySomePart02Test053
     * @tc.desc Verify buffer A some B byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a = new Int8Array(buf, 0, 2);
      let b = new Int8Array(buf, 2, 6);
      let resultVal1: boolean = a.some((e: number) => e > 0);
      expect(resultVal1).assertFalse();
      let r1: int = b.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5400
     * @tc.name int8ArraySomePart02Test054
     * @tc.desc Verify ArrayBuffer some buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 4, 2);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertFalse();
      let r1: ArrayBuffer = arr.buffer;
      let e1: ArrayBuffer = buf;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5500
     * @tc.name int8ArraySomePart02Test055
     * @tc.desc Verify ArrayBuffer some byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 2, 4);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertFalse();
      let r1: int = arr.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5600
     * @tc.name int8ArraySomePart02Test056
     * @tc.desc Verify chained some calls return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r = arr.some((e: number) => e > 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5700
     * @tc.name int8ArraySomePart02Test057
     * @tc.desc Verify some then $_set writes 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5800
     * @tc.name int8ArraySomePart02Test058
     * @tc.desc Verify some byteLength buffer.byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: boolean = arr.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: int = arr.buffer.byteLength;
      let e1: int = arr.byteLength;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_5900
     * @tc.name int8ArraySomePart02Test059
     * @tc.desc Verify subarray some buffer base buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5]);
      let view = base.subarray(1, 4);
      view.some((e: number) => e > 0);
      let r1: ArrayBuffer = view.buffer;
      let e1: ArrayBuffer = base.buffer;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_6000
     * @tc.name int8ArraySomePart02Test060
     * @tc.desc Verify Int8Array buffer A some B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Int8Array([1, 2, 3]);
      let b = new Int8Array([7, 8, 9]);
      let resultVal1: boolean = a.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: number = b.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_6100
     * @tc.name int8ArraySomePart02Test061
     * @tc.desc Verify buffer A some A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let a = new Int8Array(buf, 0, 2);
      a.$_set(1, 42);
      let resultVal1: boolean = a.some((e: number) => e > 0);
      expect(resultVal1).assertTrue();
      let r1: number = a.$_get(1);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_6200
     * @tc.name int8ArraySomePart02Test062
     * @tc.desc Verify some(even predicate) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 3, 4]);
      let r = arr.some((e: number) => e % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART02_TEST_6300
     * @tc.name int8ArraySomePart02Test063
     * @tc.desc Verify some(even predicate) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 3, 5]);
      let r = arr.some((e: number) => e % 2 === 0);
      expect(r).assertFalse();
    });
  });
}
