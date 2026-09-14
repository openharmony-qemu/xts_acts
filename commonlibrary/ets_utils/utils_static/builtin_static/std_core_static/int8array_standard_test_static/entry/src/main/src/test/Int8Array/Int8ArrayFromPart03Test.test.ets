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

export default function int8ArrayFromPart03Test(): void {
  describe('Int8ArrayFromPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0100
     * @tc.name int8ArrayFromPart03Test001
     * @tc.desc Verify arity 1 Int8Array.from(Int8Array) Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let result = Int8Array.from(src);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(1);
      let r1: number = result.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: int = result.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: int = result.byteOffset;
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: string = result.join('-');
      let e4: string = '1-2-3';
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0200
     * @tc.name int8ArrayFromPart03Test002
     * @tc.desc Verify Int8Array.from(empty Int8Array) returns empty result with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(0);
      let result = Int8Array.from(src);
      expect(result.length).assertEqual(0);
      let r1: string = result.toString();
      let e1: string = '';
      expect(r1).assertEqual(e1);
      expect(result.at(0)).assertUndefined();
      let r2: int = result.indexOf(0);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: boolean = result.includes(0);
      expect(r3).assertFalse();
      let r4: boolean = result.every((v: number) => v > 0);
      expect(r4).assertTrue();
      let r5: boolean = result.some((v: number) => v > 0);
      expect(r5).assertFalse();
      expect(result.find((v: number) => v > 0)).assertUndefined();
      let r6: int = result.findIndex((v: number) => v > 0);
      let e6: int = -1;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0300
     * @tc.name int8ArrayFromPart03Test003
     * @tc.desc Verify Int8Array.from(new Int8Array([42])) preserves element 42 with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([42]);
      let result = Int8Array.from(src);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
      let r1: string = result.toString();
      let e1: string = '42';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0400
     * @tc.name int8ArrayFromPart03Test004
     * @tc.desc Verify Int8Array.from(new Int8Array(100) filled with indices) preserves length 100 and element 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, i);
      }
      let result = Int8Array.from(src);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(50);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0500
     * @tc.name int8ArrayFromPart03Test005
     * @tc.desc Verify Int8Array.from([-128]) preserves int8 minimum -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([-128]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0600
     * @tc.name int8ArrayFromPart03Test006
     * @tc.desc Verify Int8Array.from([INT8_MAX]) preserves int8 maximum 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([INT8_MAX]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0700
     * @tc.name int8ArrayFromPart03Test007
     * @tc.desc Verify Int8Array.from(new Int8Array([0])) preserves element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([0]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0800
     * @tc.name int8ArrayFromPart03Test008
     * @tc.desc Verify Int8Array.from([-1]) preserves sentinel value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([-1]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_0900
     * @tc.name int8ArrayFromPart03Test009
     * @tc.desc Verify Int8Array.from([-128, -128, -128]) preserves all elements -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([-128, -128, -128]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -128;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -128;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1000
     * @tc.name int8ArrayFromPart03Test010
     * @tc.desc Verify Int8Array.from([INT8_MAX, INT8_MAX, INT8_MAX]) preserves all elements 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1100
     * @tc.name int8ArrayFromPart03Test011
     * @tc.desc Verify Int8Array.from([0, 0, 0]) preserves all elements 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([0, 0, 0]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1200
     * @tc.name int8ArrayFromPart03Test012
     * @tc.desc Verify Int8Array.from([-128, 127, 0]) preserves all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([-128, INT8_MAX, 0]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1300
     * @tc.name int8ArrayFromPart03Test013
     * @tc.desc Verify Int8Array.from([1, -1, 127, -128]) preserves elements with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, -1, INT8_MAX, -128]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = -128;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1400
     * @tc.name int8ArrayFromPart03Test014
     * @tc.desc Verify Int8Array.from(subarray(1, 4) of [10, 20, 30, 40, 50]) copies 3 elements 20, 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let full = new Int8Array([10, 20, 30, 40, 50]);
      let src = full.subarray(1, 4);
      let result = Int8Array.from(src);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1500
     * @tc.name int8ArrayFromPart03Test015
     * @tc.desc Verify Int8Array.from(offset view new Int8Array(buf, 1, 3)) copies 3 elements 20, 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(5);
      let full = new Int8Array(buf);
      full.$_set(0, 10);
      full.$_set(1, 20);
      full.$_set(2, 30);
      full.$_set(3, 40);
      full.$_set(4, 50);
      let src = new Int8Array(buf, 1, 3);
      let result = Int8Array.from(src);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(20);
      expect(result.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1600
     * @tc.name int8ArrayFromPart03Test016
     * @tc.desc Verify Int8Array.from(Int8Array.of(7, 14, 21)) copies elements with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(7, 14, 21);
      let result = Int8Array.from(src);
      expect(result.length).assertEqual(3);
      let r1: number = result.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1700
     * @tc.name int8ArrayFromPart03Test017
     * @tc.desc Verify Int8Array.from(Int8Array.from([3, 6, 9])) copies 3 elements preserving value 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.from([3, 6, 9]);
      let result = Int8Array.from(src);
      expect(result.length).assertEqual(3);
      let r1: number = result.$_get(1);
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1800
     * @tc.name int8ArrayFromPart03Test018
     * @tc.desc Verify Int8Array.from(slice(0, 3) of [100, 110, 120]) copies 3 elements 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let full = new Int8Array([100, 110, 120]);
      let src = full.slice(0, 3);
      let result = Int8Array.from(src);
      expect(result.length).assertEqual(3);
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_1900
     * @tc.name int8ArrayFromPart03Test019
     * @tc.desc Verify Int8Array.from(base.with(1, 99)) preserves replaced element 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3]);
      let src = base.with(1, 99);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(1);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2000
     * @tc.name int8ArrayFromPart03Test020
     * @tc.desc Verify Int8Array.from(subarray(1, 3)) creates new buffer not shared with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let full = new Int8Array([1, 2, 3, 4]);
      let src = full.subarray(1, 3);
      let result = Int8Array.from(src);
      let isShared = result.buffer === src.buffer;
      expect(isShared).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2100
     * @tc.name int8ArrayFromPart03Test021
     * @tc.desc Verify Int8Array.from(view on ArrayBuffer) creates independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(new ArrayBuffer(4));
      let result = Int8Array.from(src);
      let isShared = result.buffer === src.buffer;
      expect(isShared).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2200
     * @tc.name int8ArrayFromPart03Test022
     * @tc.desc Verify Int8Array.from(src) copies buffer-backed view values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(new ArrayBuffer(3));
      src.$_set(0, 1);
      src.$_set(1, 2);
      src.$_set(2, 3);
      let result = Int8Array.from(src);
      let view = new Int8Array(src.buffer);
      view.$_set(0, 99);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2300
     * @tc.name int8ArrayFromPart03Test023
     * @tc.desc Verify Int8Array.from([5, 10]) creates independent buffer not shared with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([5, 10]);
      let result = Int8Array.from(src);
      let isShared = result.buffer === src.buffer;
      expect(isShared).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2400
     * @tc.name int8ArrayFromPart03Test024
     * @tc.desc Verify Int8Array.from(src) returns a new Int8Array instance distinct from src reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let result = Int8Array.from(src);
      let isSame = result === src;
      expect(isSame).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2500
     * @tc.name int8ArrayFromPart03Test025
     * @tc.desc Verify Int8Array.from(src) result.$_get(0) equals 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([55, 20, 30]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2600
     * @tc.name int8ArrayFromPart03Test026
     * @tc.desc Verify Int8Array.from(src) result.$_get(2) equals 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([10, 20, 77]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(2);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2700
     * @tc.name int8ArrayFromPart03Test027
     * @tc.desc Verify Int8Array.from(src) result.at(-1) equals 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([10, 20, 88]);
      let result = Int8Array.from(src);
      expect(result.at(-1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2800
     * @tc.name int8ArrayFromPart03Test028
     * @tc.desc Verify Int8Array.from(src) creates independent copy with all elements equal to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, -1, INT8_MAX, -128, 0]);
      let result = Int8Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: number = INT8_MAX;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -128;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(4);
      let e5: int = 0;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_2900
     * @tc.name int8ArrayFromPart03Test029
     * @tc.desc Verify Int8Array.from(src) creates independent copy -- mutating result does not affect src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let result = Int8Array.from(src);
      result.$_set(0, 99);
      let r1: number = src.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3000
     * @tc.name int8ArrayFromPart03Test030
     * @tc.desc Verify Int8Array.from(src) creates independent copy -- mutating src does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let result = Int8Array.from(src);
      src.$_set(0, 99);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3100
     * @tc.name int8ArrayFromPart03Test031
     * @tc.desc Verify Int8Array.from(src) deep copy, src.reverse() not reflected in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let result = Int8Array.from(src);
      src.reverse();
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3200
     * @tc.name int8ArrayFromPart03Test032
     * @tc.desc Verify Int8Array.from(src) deep copy, src.sort() not reflected in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([3, 1, 2]);
      let result = Int8Array.from(src);
      src.sort();
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3300
     * @tc.name int8ArrayFromPart03Test033
     * @tc.desc Verify Int8Array.from(src) copy is independent -- src.fill(0) does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let result = Int8Array.from(src);
      src.fill(0);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3400
     * @tc.name int8ArrayFromPart03Test034
     * @tc.desc Verify Int8Array.from(src) copy is independent -- src.copyWithin(0,2,4) does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3, 4]);
      let result = Int8Array.from(src);
      src.copyWithin(0, 2, 4);
      expect(result.$_get(0)).assertEqual(1);
      let r1: number = result.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3500
     * @tc.name int8ArrayFromPart03Test035
     * @tc.desc Verify Int8Array.from(Int8Array.from(arr)) copies values independently of source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3]);
      let mid = Int8Array.from(base);
      let result = Int8Array.from(mid);
      mid.$_set(0, 99);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3600
     * @tc.name int8ArrayFromPart03Test036
     * @tc.desc Verify Int8Array.from(src) join(',') behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, -1, INT8_MAX]);
      let result = Int8Array.from(src);
      let r1: string = result.join(',');
      let e1: string = '1,-1,127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3700
     * @tc.name int8ArrayFromPart03Test037
     * @tc.desc Verify Int8Array.from(src) $_get(0) on empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(0);
      let result = Int8Array.from(src);
      try {
        result.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3800
     * @tc.name int8ArrayFromPart03Test038
     * @tc.desc Verify Int8Array.from reduce initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(0);
      let result = Int8Array.from(src);
      try {
        result.reduce((acc: number, cur: number) => acc + cur);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_3900
     * @tc.name int8ArrayFromPart03Test039
     * @tc.desc Verify Int8Array.from(src) result reduce without initialValue works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([42]);
      let result = Int8Array.from(src);
      let reduced = result.reduce((acc: number, cur: number) => acc + cur);
      expect(reduced).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4000
     * @tc.name int8ArrayFromPart03Test040
     * @tc.desc Verify Int8Array.from([128]) truncates and wraps to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([128]);
      let r1: number = result.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4100
     * @tc.name int8ArrayFromPart03Test041
     * @tc.desc Verify Int8Array.from([-129]) truncates and wraps to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([-129]);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4200
     * @tc.name int8ArrayFromPart03Test042
     * @tc.desc Verify Int8Array.from([255]) truncates and wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([255]);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4300
     * @tc.name int8ArrayFromPart03Test043
     * @tc.desc Verify Int8Array.from([256]) truncates and wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([256]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4400
     * @tc.name int8ArrayFromPart03Test044
     * @tc.desc Verify Int8Array.from([Number.NaN]) converts NaN to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([Number.NaN]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4500
     * @tc.name int8ArrayFromPart03Test045
     * @tc.desc Verify Int8Array.from([1.9]) truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([1.9]);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4600
     * @tc.name int8ArrayFromPart03Test046
     * @tc.desc Verify Int8Array.from([-1.9]) truncates to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([-1.9]);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4700
     * @tc.name int8ArrayFromPart03Test047
     * @tc.desc Verify Int8Array.from([128, -129, 255]) wraps to [-128, 127, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([128, -129, 255]);
      expect(result.$_get(0)).assertEqual(-128);
      expect(result.$_get(1)).assertEqual(INT8_MAX);
      expect(result.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4800
     * @tc.name int8ArrayFromPart03Test048
     * @tc.desc Verify for...of iteration sums src elements and Int8Array.from(src) length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([10, 20, 30]);
      let sum: number = 0;
      for (let v of src) {
        sum = sum + v;
      }
      let result = Int8Array.from(src);
      expect(result.length).assertEqual(3);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_4900
     * @tc.name int8ArrayFromPart03Test049
     * @tc.desc Verify Int8Array.from(src) for...of behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([10, 20, 30]);
      let result = Int8Array.from(src);
      let sum: number = 0;
      for (let v of result) {
        sum = sum + v;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5000
     * @tc.name int8ArrayFromPart03Test050
     * @tc.desc Verify Int8Array.from(src) keys() behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([5, 10, 15]);
      let result = Int8Array.from(src);
      let indices: number[] = [];
      for (let k of result.keys()) {
        indices.push(k);
      }
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5100
     * @tc.name int8ArrayFromPart03Test051
     * @tc.desc Verify Int8Array.from(src) values() behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([5, 10, 15]);
      let result = Int8Array.from(src);
      let vals: number[] = [];
      for (let v of result.values()) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(5);
      expect(vals[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5200
     * @tc.name int8ArrayFromPart03Test052
     * @tc.desc Verify chained Int8Array.from copies are independent, mutation of intermediate copies does not affect final result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3]);
      let l1 = Int8Array.from(base);
      let l2 = Int8Array.from(l1);
      let l3 = Int8Array.from(l2);
      l1.$_set(0, 99);
      l2.$_set(1, 88);
      expect(l3.$_get(0)).assertEqual(1);
      expect(l3.$_get(1)).assertEqual(2);
      expect(base.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5300
     * @tc.name int8ArrayFromPart03Test053
     * @tc.desc Verify Int8Array.from(src).toReversed() reverses copy without mutating src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let result = Int8Array.from(src).toReversed();
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(1);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5400
     * @tc.name int8ArrayFromPart03Test054
     * @tc.desc Verify Int8Array.from(src).toSorted() sorts copy without mutating src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([3, 1, 2]);
      let result = Int8Array.from(src).toSorted();
      expect(result.$_get(0)).assertEqual(1);
      expect(src.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5500
     * @tc.name int8ArrayFromPart03Test055
     * @tc.desc Verify Int8Array.from(src).with(1, 99) replaces element without mutating src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let result = Int8Array.from(src).with(1, 99);
      expect(result.$_get(1)).assertEqual(99);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5600
     * @tc.name int8ArrayFromPart03Test056
     * @tc.desc Verify subarray of Int8Array.from(src) result shares buffer with result but not with src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3, 4]);
      let result = Int8Array.from(src);
      let view = result.subarray(1, 3);
      view.$_set(0, 99);
      expect(result.$_get(1)).assertEqual(99);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5700
     * @tc.name int8ArrayFromPart03Test057
     * @tc.desc Verify Int8Array.from(new Int8Array(100) filled with (i*2)%INT8_MAX) preserves all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, (i * 2) % INT8_MAX);
      }
      let result = Int8Array.from(src);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(63);
      let e3: int = 126;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(99);
      let e4: int = 71;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5800
     * @tc.name int8ArrayFromPart03Test058
     * @tc.desc Verify slice(1, 3) of Int8Array.from(src) is independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3, 4]);
      let result = Int8Array.from(src);
      let sliced = result.slice(1, 3);
      sliced.$_set(0, 99);
      expect(result.$_get(1)).assertEqual(2);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_5900
     * @tc.name int8ArrayFromPart03Test059
     * @tc.desc Verify fill(0, 1, 3) on Int8Array.from(src) result does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3, 4, 5]);
      let result = Int8Array.from(src);
      result.fill(0, 1, 3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(0);
      expect(result.$_get(3)).assertEqual(4);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_6000
     * @tc.name int8ArrayFromPart03Test060
     * @tc.desc Verify copyWithin(0, 3, 5) on Int8Array.from(src) result copies elements 4, 5 without affecting source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3, 4, 5]);
      let result = Int8Array.from(src);
      result.copyWithin(0, 3, 5);
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(5);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_6100
     * @tc.name int8ArrayFromPart03Test061
     * @tc.desc Verify Number.POSITIVE_INFINITY converted to 0 via Int8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([Number.POSITIVE_INFINITY]);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_6200
     * @tc.name int8ArrayFromPart03Test062
     * @tc.desc Verify -Number.POSITIVE_INFINITY converted to 0 via Int8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([-Number.POSITIVE_INFINITY]);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART03_TEST_6300
     * @tc.name int8ArrayFromPart03Test063
     * @tc.desc Verify Int8Array.from(src) large double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Int8Array.from([1e38]);
      expect(result.$_get(0)).assertEqual(0);
    });
  });
}
