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

export default function int8ArrayFilterPart02Test(): void {
  describe('Int8ArrayFilterPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0100
     * @tc.name int8ArrayFilterPart02Test001
     * @tc.desc Verify filter return value is Int8Array when all elements pass predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((_v: number): boolean => true);
      expect(result.length).assertEqual(3);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0200
     * @tc.name int8ArrayFilterPart02Test002
     * @tc.desc Verify filter return value is Int8Array when no element passes (int8 upper bound 127 comparison)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((v: number): boolean => v > INT8_MAX);
      expect(result.length).assertEqual(0);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0300
     * @tc.name int8ArrayFilterPart02Test003
     * @tc.desc Verify filter return value is Int8Array with single-element source all pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(42);
      let result = src.filter((_v: number): boolean => true);
      expect(result.length).assertEqual(1);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0400
     * @tc.name int8ArrayFilterPart02Test004
     * @tc.desc Verify filter return value is Int8Array when only one element passes predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(1);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0500
     * @tc.name int8ArrayFilterPart02Test005
     * @tc.desc Verify filter return value from ArrayBuffer view source is Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let src = new Int8Array(buf);
      let result = src.filter((_v: number): boolean => true);
      expect(result.length).assertEqual(8);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0600
     * @tc.name int8ArrayFilterPart02Test006
     * @tc.desc Verify filter return value length is 2 when two elements pass predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((v: number): boolean => v > 1);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: int = result.byteOffset;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: boolean = ArrayBuffer.isView(result);
      expect(r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0700
     * @tc.name int8ArrayFilterPart02Test007
     * @tc.desc Verify filter return value is Int8Array with index-based predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(10, 20, 30, 40);
      let result = src.filter((v: number, i: int): boolean => i % 2 === 0);
      expect(result.length).assertEqual(2);
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: boolean = ArrayBuffer.isView(result);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0800
     * @tc.name int8ArrayFilterPart02Test008
     * @tc.desc Verify filter return value is Int8Array with array-parameter-based predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((_v: number, _i: int, a: Int8Array): boolean => a.length === 3);
      expect(result.length).assertEqual(3);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_0900
     * @tc.name int8ArrayFilterPart02Test009
     * @tc.desc Verify filter return value preserves passing element value (first element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(5, 15, 25);
      let result = src.filter((v: number): boolean => v > 10);
      expect(result.$_get(0)).assertEqual(15);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1000
     * @tc.name int8ArrayFilterPart02Test010
     * @tc.desc Verify filter return value preserves int8 minimum -128 when all pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(INT8_MIN, 0, INT8_MAX);
      let result = src.filter((_v: number): boolean => true);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1100
     * @tc.name int8ArrayFilterPart02Test011
     * @tc.desc Verify filter return value preserves int8 maximum 127 when all pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(-128, 0, INT8_MAX);
      let result = src.filter((_v: number): boolean => true);
      expect(result.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1200
     * @tc.name int8ArrayFilterPart02Test012
     * @tc.desc Verify filter return value preserves zero value element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(0, 1, 2);
      let result = src.filter((v: number): boolean => v === 0);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1300
     * @tc.name int8ArrayFilterPart02Test013
     * @tc.desc Verify filter return value maintains original order (first passing element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(30, 10, 20, 5);
      let result = src.filter((v: number): boolean => v < 25);
      expect(result.$_get(0)).assertEqual(10);
      let r1: int = result.indexOf(30);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1400
     * @tc.name int8ArrayFilterPart02Test014
     * @tc.desc Verify filter keeps element 8 at middle position when all pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(7, 8, 9);
      let result = src.filter((_v: number): boolean => true);
      let r1: number = result.$_get(1);
      let e1: int = 8;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1500
     * @tc.name int8ArrayFilterPart02Test015
     * @tc.desc Verify filter return value contains only the single passing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(5, 10, 15);
      let result = src.filter((v: number): boolean => v === 10);
      expect(result.$_get(0)).assertEqual(10);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: int = result.byteLength;
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1600
     * @tc.name int8ArrayFilterPart02Test016
     * @tc.desc Verify filter return value preserves all duplicates when all pass (last duplicate)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(7, 7, 7);
      let result = src.filter((v: number): boolean => v === 7);
      expect(result.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1700
     * @tc.name int8ArrayFilterPart02Test017
     * @tc.desc Verify filter return value contains only passing duplicates (second passing element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(7, 8, 7, 8);
      let result = src.filter((v: number): boolean => v === 7);
      expect(result.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1800
     * @tc.name int8ArrayFilterPart02Test018
     * @tc.desc Verify filter return value length equals passing element count on partial filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3, 4, 5);
      let result = src.filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_1900
     * @tc.name int8ArrayFilterPart02Test019
     * @tc.desc Verify filter return value length reflects passing index count with index-based predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(10, 20, 30, 40, 50);
      let result = src.filter((v: number, i: int): boolean => i % 2 === 0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2000
     * @tc.name int8ArrayFilterPart02Test020
     * @tc.desc Verify filter return value byteOffset is 0 when source byteOffset is non-zero (independent buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let src = new Int8Array(buf, 2, 4);
      let result = src.filter((_v: number): boolean => true);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2100
     * @tc.name int8ArrayFilterPart02Test021
     * @tc.desc Verify filter return value buffer is ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(11, 22);
      let result = src.filter((_v: number): boolean => true);
      expect(result.buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2200
     * @tc.name int8ArrayFilterPart02Test022
     * @tc.desc Verify filter return value buffer.byteLength is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3, 4);
      let result = src.filter((v: number): boolean => v > 1);
      let r1: int = result.buffer.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2300
     * @tc.name int8ArrayFilterPart02Test023
     * @tc.desc Verify source first element unchanged after filter call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(11, 22, 33);
      src.filter((v: number): boolean => v > 15);
      expect(src.$_get(0)).assertEqual(11);
      expect(src.$_get(2)).assertEqual(33);
      let r1: int = src.indexOf(22);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2400
     * @tc.name int8ArrayFilterPart02Test024
     * @tc.desc Verify two filter calls on same source produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(5, 10, 15);
      let result = src.filter((v: number): boolean => v === 10);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2500
     * @tc.name int8ArrayFilterPart02Test025
     * @tc.desc Verify chained filter call return value type is Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3, 4, 5);
      let result = src.filter((v: number): boolean => v > 1).filter((v: number): boolean => v < 5);
      expect(result.length).assertEqual(3);
      expect(result.$_get(1)).assertEqual(3);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2600
     * @tc.name int8ArrayFilterPart02Test026
     * @tc.desc Verify return value can be filtered again with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((v: number): boolean => v > 0);
      expect(result.filter((v: number): boolean => v > 1).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2700
     * @tc.name int8ArrayFilterPart02Test027
     * @tc.desc Verify chained filter return value byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3, 4);
      let result = src.filter((v: number): boolean => v > 1).filter((v: number): boolean => v < 4);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2800
     * @tc.name int8ArrayFilterPart02Test028
     * @tc.desc Verify filter return value is Int8Array when no elements pass predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((_v: number): boolean => false);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_2900
     * @tc.name int8ArrayFilterPart02Test029
     * @tc.desc Verify filter return value length equals 0 when no elements pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((v: number): boolean => v > 100);
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
      expect(result.buffer.byteLength).assertEqual(0);
      expect(result.byteOffset).assertEqual(0);
      expect(result.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3000
     * @tc.name int8ArrayFilterPart02Test030
     * @tc.desc Verify empty filter result can be filtered again returning empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      let result = src.filter((v: number): boolean => v > 100);
      let next = result.filter((v: number): boolean => v > 0);
      expect(next.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3100
     * @tc.name int8ArrayFilterPart02Test031
     * @tc.desc Verify filter on empty source returns Int8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(0);
      let result = src.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
      let r1: int = result.buffer.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = result.byteOffset;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      expect(result.at(0)).assertUndefined();
      let r3: boolean = ArrayBuffer.isView(result);
      expect(r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3200
     * @tc.name int8ArrayFilterPart02Test032
     * @tc.desc Verify filter on empty source does not execute callback (execution count is 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(0);
      let count: int = 0;
      const result: Int8Array = src.filter((v: number): boolean => {
        count = count + 1;
        return v > 0;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3300
     * @tc.name int8ArrayFilterPart02Test033
     * @tc.desc Verify filter propagates Error when predicate throws Error on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = src.filter((_v: number): boolean => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3400
     * @tc.name int8ArrayFilterPart02Test034
     * @tc.desc Verify filter propagates Error on second element and partially processes first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(10, 20, 30);
      let processed: int = 0;
      try {
        const result: Int8Array = src.filter((_v: number, i: int): boolean => {
          processed = processed + 1;
          if (i === 1) {
            throw new Error('second');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(processed).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3500
     * @tc.name int8ArrayFilterPart02Test035
     * @tc.desc Verify filter propagates RangeError when predicate throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = src.filter((_v: number): boolean => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3600
     * @tc.name int8ArrayFilterPart02Test036
     * @tc.desc Verify filter propagates TypeError when predicate throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = src.filter((_v: number): boolean => {
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3700
     * @tc.name int8ArrayFilterPart02Test037
     * @tc.desc Verify filter with predicate that throws exception and catch verifies error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(11, 22, 33);
      try {
        const result: Int8Array = src.filter((_v: number): boolean => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3800
     * @tc.name int8ArrayFilterPart02Test038
     * @tc.desc Verify filter preserves int8 minimum -128 when filtering only -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(INT8_MIN, 0, INT8_MAX);
      let result = src.filter((v: number): boolean => v === INT8_MIN);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_3900
     * @tc.name int8ArrayFilterPart02Test039
     * @tc.desc Verify filter preserves int8 maximum 127 when filtering only 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(-128, 0, INT8_MAX);
      let result = src.filter((v: number): boolean => v === INT8_MAX);
      expect(result.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_4000
     * @tc.name int8ArrayFilterPart02Test040
     * @tc.desc Verify filter excludes zero when filtering out zero (indexOf returns -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(0, 1, 0, 2);
      let result = src.filter((v: number): boolean => v !== 0);
      expect(result.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_4100
     * @tc.name int8ArrayFilterPart02Test041
     * @tc.desc Verify filter preserves positive numbers with first element positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(-5, 3, -1, 7);
      let result = src.filter((v: number): boolean => v > 0);
      expect(result.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_4200
     * @tc.name int8ArrayFilterPart02Test042
     * @tc.desc Verify filter preserves negative numbers with first element negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(-5, 3, -1, 7);
      let result = src.filter((v: number): boolean => v < 0);
      expect(result.$_get(0)).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_4300
     * @tc.name int8ArrayFilterPart02Test043
     * @tc.desc Verify filter with array.length condition reflects source length condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(10, 20, 30);
      let result = src.filter((_v: number, _i: int, a: Int8Array): boolean => a.length === 3);
      expect(result.length).assertEqual(3);
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_4400
     * @tc.name int8ArrayFilterPart02Test044
     * @tc.desc Verify filter preserves element order with mixed positive and negative elements (third element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(-3, 5, -1, 8);
      let result = src.filter((v: number): boolean => v > -2);
      expect(result.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART02_4500
     * @tc.name int8ArrayFilterPart02Test045
     * @tc.desc Verify filter excluding negative boundary -128 returns only positive values (length 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int8Array.of(INT8_MIN, 5, INT8_MAX);
      let result = src.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(2);
    });
  });
}
