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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArraySliceTest01(): void {
  describe('Int16ArraySliceTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0100
     * @tc.name testInt16ArraySliceTestOne001
     * @tc.desc Verify slice() without args returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice();
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(2 as int);
      let e4: int = 30;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0200
     * @tc.name testInt16ArraySliceTestOne002
     * @tc.desc Verify slice(2) with single begin slices to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(2);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(2 as int);
      let e4: int = 50;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0300
     * @tc.name testInt16ArraySliceTestOne003
     * @tc.desc Verify slice(1, 4) slices between begin and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 4);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(2 as int);
      let e4: int = 40;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0400
     * @tc.name testInt16ArraySliceTestOne004
     * @tc.desc Verify slice(0) begin=0 explicit 0 from first elementslices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4 as int);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0500
     * @tc.name testInt16ArraySliceTestOne005
     * @tc.desc Verify slice(1) skips first element and slices from index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(3 as int);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0600
     * @tc.name testInt16ArraySliceTestOne006
     * @tc.desc Verify slice(-1) begin=-1 negativefrom last indexsliceslast element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(-1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0700
     * @tc.name testInt16ArraySliceTestOne007
     * @tc.desc Verify slice(-2) begin=-2 negativefrom second last indexsliceslast two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(-2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0800
     * @tc.name testInt16ArraySliceTestOne008
     * @tc.desc Verify slice(-3) begin=-3 negativefrom third last indexsliceslast three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(-3);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2 as int);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_0900
     * @tc.name testInt16ArraySliceTestOne009
     * @tc.desc Verify slice(length-1) with non-negative boundary begin slices last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let lastIdx: int = source.length - 1;
      let result: Int16Array = source.slice(lastIdx);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1000
     * @tc.name testInt16ArraySliceTestOne010
     * @tc.desc Verify slice(source.length) begin=length equals lengthslicesreturns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(source.length);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1100
     * @tc.name testInt16ArraySliceTestOne011
     * @tc.desc Verify slice(-length) with negative begin equal to length clamps to 0 and returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let negLen: int = -source.length;
      let result: Int16Array = source.slice(negLen);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1200
     * @tc.name testInt16ArraySliceTestOne012
     * @tc.desc Verify slice(-length-1) with negative begin exceeding length clamps to 0 and returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(-source.length - 1);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1300
     * @tc.name testInt16ArraySliceTestOne013
     * @tc.desc Verify slice(32767) with int16.MAX begin far exceeding small array length clamps to length and returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(32767);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1400
     * @tc.name testInt16ArraySliceTestOne014
     * @tc.desc Verify slice(-32768) with int16.MIN begin far below negative length clamps to 0 and returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(-32768);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1500
     * @tc.name testInt16ArraySliceTestOne015
     * @tc.desc Verify slice(0, 0) with begin=0 end=0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 0);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1600
     * @tc.name testInt16ArraySliceTestOne016
     * @tc.desc Verify slice(0, 1) begin=0 end=1 slicesfirst element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1700
     * @tc.name testInt16ArraySliceTestOne017
     * @tc.desc Verify slice(0, 2) begin=0 end=2 slicesfirst two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1800
     * @tc.name testInt16ArraySliceTestOne018
     * @tc.desc Verify slice(0, 3) begin=0 end=3 slicesfirst three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 3);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2 as int);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_1900
     * @tc.name testInt16ArraySliceTestOne019
     * @tc.desc Verify slice(0, -1) with negative end slices up to before last element thus dropping last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, -1);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3 as int);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2000
     * @tc.name testInt16ArraySliceTestOne020
     * @tc.desc Verify slice(0, -2) with negative end slices up to before second last thus dropping last two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, -2);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2 as int);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2100
     * @tc.name testInt16ArraySliceTestOne021
     * @tc.desc Verify slice(0, -3) with negative end slices up to before third last thus dropping last three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, -3);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2200
     * @tc.name testInt16ArraySliceTestOne022
     * @tc.desc Verify slice(0, length) slices to array end equals full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, source.length);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(4 as int);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2300
     * @tc.name testInt16ArraySliceTestOne023
     * @tc.desc Verify slice(0, -length) with negative end absolute value equal to length clamps to 0 and returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, -source.length);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2400
     * @tc.name testInt16ArraySliceTestOne024
     * @tc.desc Verify slice(0, 32767) with int16.MAX end clamps to length and returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, 32767);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2500
     * @tc.name testInt16ArraySliceTestOne025
     * @tc.desc Verify slice(0, -32768) begin=0 end=int16.MIN -32768 end minnegative clamps to 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, -32768);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2600
     * @tc.name testInt16ArraySliceTestOne026
     * @tc.desc Verify slice(1, 3) begin=1 end=3 slicesmiddle segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 3);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2700
     * @tc.name testInt16ArraySliceTestOne027
     * @tc.desc Verify slice(-2, -1) with both negative bounds slices second last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(-2, -1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2800
     * @tc.name testInt16ArraySliceTestOne028
     * @tc.desc Verify slice(-3, -1) with both negative bounds slices from third last to before last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(-3, -1);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_2900
     * @tc.name testInt16ArraySliceTestOne029
     * @tc.desc Verify slice(1, 1) begin=1 end=1 begin equals end returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 1);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3000
     * @tc.name testInt16ArraySliceTestOne030
     * @tc.desc Verify slice(0, 10) with end exceeding length clamps to length and returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 10);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4 as int);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3100
     * @tc.name testInt16ArraySliceTestOne031
     * @tc.desc Verify slice(-10, -9) with both negative bounds clamped to 0 range returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(-10, -9);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3200
     * @tc.name testInt16ArraySliceTestOne032
     * @tc.desc Verify slice(0, len) with length variable as end slices full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let len: int = source.length;
      let result: Int16Array = source.slice(0, len);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2 as int);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3300
     * @tc.name testInt16ArraySliceTestOne033
     * @tc.desc Verify slice(1, len) begin=1 end=length from index 1 slicesto end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let len: int = source.length;
      let result: Int16Array = source.slice(1, len);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(3 as int);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3400
     * @tc.name testInt16ArraySliceTestOne034
     * @tc.desc Verify slice(-1, len) begin=-1 end=length negative begin sliceslast element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let len: int = source.length;
      let result: Int16Array = source.slice(-1, len);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3500
     * @tc.name testInt16ArraySliceTestOne035
     * @tc.desc Verify slice(length, 0) with begin equal to length greater than end returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(source.length, 0);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3600
     * @tc.name testInt16ArraySliceTestOne036
     * @tc.desc Verify slice(32767, 32767) with both int16.MAX bounds and begin not less than end returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(32767, 32767);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3700
     * @tc.name testInt16ArraySliceTestOne037
     * @tc.desc Verify slice(-32768, 0) with int16.MIN begin clamped to 0 then end=0 returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(-32768, 0);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3800
     * @tc.name testInt16ArraySliceTestOne038
     * @tc.desc Verify slice(0, 1) with source containing int16 boundary values slices boundary element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(32767, -32768, 0);
      let result: Int16Array = source.slice(0, 1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_3900
     * @tc.name testInt16ArraySliceTestOne039
     * @tc.desc Verify slice(1, 3) with source containing int16 boundary values slices middle boundary element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(32767, -32768, 0);
      let result: Int16Array = source.slice(1, 3);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4000
     * @tc.name testInt16ArraySliceTestOne040
     * @tc.desc Verify slice(-2, length) with negative begin and boundary source array slices from second last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(32767, -32768, 0);
      let result: Int16Array = source.slice(-2, source.length);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4100
     * @tc.name testInt16ArraySliceTestOne041
     * @tc.desc Verify slice(0) empty source slice(0) begin=0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = new Int16Array();
      let result: Int16Array = source.slice(0);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4200
     * @tc.name testInt16ArraySliceTestOne042
     * @tc.desc Verify slice(0, 0) empty source slice(0, 0) begin=0 end=0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = new Int16Array();
      let result: Int16Array = source.slice(0, 0);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4300
     * @tc.name testInt16ArraySliceTestOne043
     * @tc.desc Verify slice() single-element source slice() no argsreturns single-element copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice();
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4400
     * @tc.name testInt16ArraySliceTestOne044
     * @tc.desc Verify slice(0) single-element source slice(0) begin=0 returns single-element copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(0);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4500
     * @tc.name testInt16ArraySliceTestOne045
     * @tc.desc Verify slice(1) on single-element source with begin equal to length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(1);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4600
     * @tc.name testInt16ArraySliceTestOne046
     * @tc.desc Verify slice(2) on single-element source with begin exceeding length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4700
     * @tc.name testInt16ArraySliceTestOne047
     * @tc.desc Verify slice(-1) single-element source slice(-1) negative begin sliceslast element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(-1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4800
     * @tc.name testInt16ArraySliceTestOne048
     * @tc.desc Verify slice(-2) single-element source slice(-2) negative begin clamps to 0 returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(-2);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_4900
     * @tc.name testInt16ArraySliceTestOne049
     * @tc.desc Verify slice(0, 0) single-element source slice(0, 0) begin=0 end=0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(0, 0);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5000
     * @tc.name testInt16ArraySliceTestOne050
     * @tc.desc Verify slice(0, 1) on single-element source slices the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(0, 1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5100
     * @tc.name testInt16ArraySliceTestOne051
     * @tc.desc Verify slice(0, 2) on single-element source with end exceeding length clamps to 1 and slices the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(0, 2);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5200
     * @tc.name testInt16ArraySliceTestOne052
     * @tc.desc Verify slice(0, -1) single-element source slice(0, -1) negative end computes to 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(0, -1);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5300
     * @tc.name testInt16ArraySliceTestOne053
     * @tc.desc Verify slice(1, 2) on single-element source with begin and end after clamp returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(42);
      let result: Int16Array = source.slice(1, 2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5400
     * @tc.name testInt16ArraySliceTestOne054
     * @tc.desc Verify slice(-32768) single-element source slice(int16.MIN) min begin after clampreturns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(-32768);
      let result: Int16Array = source.slice(-32768);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5500
     * @tc.name testInt16ArraySliceTestOne055
     * @tc.desc Verify slice(-1) on length 2 source slices the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(-1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 200;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5600
     * @tc.name testInt16ArraySliceTestOne056
     * @tc.desc Verify slice(-2) on length 2 source with begin equal to 0 slices full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(-2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 100;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 200;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5700
     * @tc.name testInt16ArraySliceTestOne057
     * @tc.desc Verify slice(-3) on length 2 source with begin clamped to 0 slices full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(-3);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 100;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5800
     * @tc.name testInt16ArraySliceTestOne058
     * @tc.desc Verify slice(2) on length 2 source with begin equal to length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_5900
     * @tc.name testInt16ArraySliceTestOne059
     * @tc.desc Verify slice(3) on length 2 source with begin exceeding length clamps and returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(3);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6000
     * @tc.name testInt16ArraySliceTestOne060
     * @tc.desc Verify slice(-4) on length 3 source with begin clamped to 0 slices full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(-4);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6100
     * @tc.name testInt16ArraySliceTestOne061
     * @tc.desc Verify slice(-3) on length 3 source with begin clamped to 0 slices full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(-3);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6200
     * @tc.name testInt16ArraySliceTestOne062
     * @tc.desc Verify slice(-2) on length 3 source slices the last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(-2);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1 as int);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6300
     * @tc.name testInt16ArraySliceTestOne063
     * @tc.desc Verify slice(3) on length 3 source with begin equal to length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(3);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6400
     * @tc.name testInt16ArraySliceTestOne064
     * @tc.desc Verify slice(0, -1) length 2 source begin=0 end=-1 slicesfirst element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(0, -1);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 100;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6500
     * @tc.name testInt16ArraySliceTestOne065
     * @tc.desc Verify slice(0, -2) length 2 source begin=0 end=-2 clamps to 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(0, -2);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6600
     * @tc.name testInt16ArraySliceTestOne066
     * @tc.desc Verify slice(0, -3) length 2 source begin=0 end=-3 clamps to 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(0, -3);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6700
     * @tc.name testInt16ArraySliceTestOne067
     * @tc.desc Verify slice(0, 3) on length 2 source with end exceeding length clamps and returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(100, 200);
      let result: Int16Array = source.slice(0, 3);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6800
     * @tc.name testInt16ArraySliceTestOne068
     * @tc.desc Verify slice(0, -1) on length 3 source slices first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, -1);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_6900
     * @tc.name testInt16ArraySliceTestOne069
     * @tc.desc Verify slice(0, -2) on length 3 source slices first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, -2);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7000
     * @tc.name testInt16ArraySliceTestOne070
     * @tc.desc Verify slice(0, -3) length 3 source begin=0 end=-3 clamps to 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, -3);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7100
     * @tc.name testInt16ArraySliceTestOne071
     * @tc.desc Verify slice(0, 4) on length 3 source with end exceeding length clamps and returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, 4);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7200
     * @tc.name testInt16ArraySliceTestOne072
     * @tc.desc Verify typeof slice() return value equals object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: string = typeof result;
      let e1: string = 'object';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7300
     * @tc.name testInt16ArraySliceTestOne073
     * @tc.desc Verify slice() return value is instanceof Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7400
     * @tc.name testInt16ArraySliceTestOne074
     * @tc.desc Verify slice() returns value accepted by ArrayBuffer.isView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: boolean = ArrayBuffer.isView(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7500
     * @tc.name testInt16ArraySliceTestOne075
     * @tc.desc Verify no-arg slice() first element equals original first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: number = result.$_get(0 as int);
      let e1: number = arr.$_get(0 as int);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7600
     * @tc.name testInt16ArraySliceTestOne076
     * @tc.desc Verify slice() full copy join equals original join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.slice();
      let r1: string = result.join();
      let e1: string = arr.join();
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7700
     * @tc.name testInt16ArraySliceTestOne077
     * @tc.desc Verify slice(0, 2) copy first two values match original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(0, 2);
      let r1: number = result.$_get(0 as int);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1 as int);
      let e2: int = 22;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_ONE_7800
     * @tc.name testInt16ArraySliceTestOne078
     * @tc.desc Verify slice(1, 3) copy starts from original index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: Int16Array = arr.slice(1, 3);
      let r1: number = result.$_get(0 as int);
      let e1: int = 22;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1 as int);
      let e2: int = 33;
      expect(r2).assertEqual(e2);
    });

  });
}
