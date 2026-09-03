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

export default function Int16ArraySliceTest04(): void {
  describe('Int16ArraySliceTest04', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0100
     * @tc.name testInt16ArraySliceTestFour001
     * @tc.desc Verify reverse().slice().reverse() three-stage chain results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.reverse().slice(1, 4).reverse();
      let r1: number = result.$_get(0 as int);
      let e1: int = 20;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(1 as int);
      let e2: int = 30;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = result.$_get(2 as int);
      let e3: int = 40;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0200
     * @tc.name testInt16ArraySliceTestFour002
     * @tc.desc Verify two independent slice copies from same source stay isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result1: Int16Array = source.slice(0, 2);
      let result2: Int16Array = source.slice(2, 5);
      result1.$_set(0 as int, 999);
      let r1: number = result2.$_get(0 as int);
      let e1: int = 30;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = source.$_get(0 as int);
      let e2: int = 10;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0300
     * @tc.name testInt16ArraySliceTestFour003
     * @tc.desc Verify slice().slice() nested extracts middle sub-fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 5).slice(1, 3);
      let r1: int = result.length;
      let e1: int = 2;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(0 as int);
      let e2: int = 30;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = result.$_get(1 as int);
      let e3: int = 40;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0400
     * @tc.name testInt16ArraySliceTestFour004
     * @tc.desc Verify slice().slice(0) copies the first slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 4).slice(0);
      let r1: int = result.length;
      let e1: int = 3;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(0 as int);
      let e2: int = 20;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = result.$_get(2 as int);
      let e3: int = 40;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0500
     * @tc.name testInt16ArraySliceTestFour005
     * @tc.desc Verify slice().slice(-1) takes last element of first slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 4).slice(-1);
      let r1: int = result.length;
      let e1: int = 1;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = result.$_get(0 as int);
      let e2: int = 40;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0600
     * @tc.name testInt16ArraySliceTestFour006
     * @tc.desc Verify triple nested slice().slice().slice() shrinks range stepwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60);
      let result: Int16Array = source.slice(1, 6).slice(1, 4).slice(0, 2);
      let r1: int = result.length;
      let e1: int = 2;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(0 as int);
      let e2: int = 30;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = result.$_get(1 as int);
      let e3: int = 40;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0700
     * @tc.name testInt16ArraySliceTestFour007
     * @tc.desc Verify slice(0, 4) then map doubles copy elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let result: Int16Array = source.slice(0, 4);
      let mapped: Int16Array = result.map((value: number) => {
        return value * 2;
      });
      let r1: number = mapped.$_get(0 as int);
      let e1: int = 2;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = mapped.$_get(3 as int);
      let e2: int = 8;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0800
     * @tc.name testInt16ArraySliceTestFour008
     * @tc.desc Verify slice(0, 5) then filter keeps elements greater than 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 5);
      let filtered: Int16Array = result.filter((value: number) => {
        return value > 25;
      });
      let r1: int = filtered.length;
      let e1: int = 3;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = filtered.$_get(0 as int);
      let e2: int = 30;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_0900
     * @tc.name testInt16ArraySliceTestFour009
     * @tc.desc Verify slice(1, 4) then reduce sums copy elements to 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let result: Int16Array = source.slice(1, 4);
      let sum: number = result.reduce((acc: number, value: number) => {
        return acc + value;
      }, 0);
      let r1: number = sum;
      let e1: number = 9;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1000
     * @tc.name testInt16ArraySliceTestFour010
     * @tc.desc Verify slice(0, 3) then every asserts all positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 3);
      let allPositive: boolean = result.every((value: number) => {
        return value > 0;
      });
      let r1: boolean = allPositive;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1100
     * @tc.name testInt16ArraySliceTestFour011
     * @tc.desc Verify slice(1, 4) then some finds element >= 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 4);
      let hasLarge: boolean = result.some((value: number) => {
        return value >= 40;
      });
      let r1: boolean = hasLarge;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1200
     * @tc.name testInt16ArraySliceTestFour012
     * @tc.desc Verify slice(2, 5) then find returns first matching 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(2, 5);
      let found: number | undefined = result.find((value: number) => {
        return value === 40;
      });
      let r1: number = found as number;
      let e1: number = 40;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1300
     * @tc.name testInt16ArraySliceTestFour013
     * @tc.desc Verify slice(0, 4) then findIndex returns index of 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 4);
      let idx: int = result.findIndex((value: number) => {
        return value === 30;
      });
      let r1: int = idx;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1400
     * @tc.name testInt16ArraySliceTestFour014
     * @tc.desc Verify slice(0, 3) then includes finds 20 and rejects 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 3);
      let r1: boolean = result.includes(20);
      let r3: boolean = r1;
      expect(r3).assertTrue();
      let r2: boolean = result.includes(99);
      let r4: boolean = r2;
      expect(r4).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1500
     * @tc.name testInt16ArraySliceTestFour015
     * @tc.desc Verify slice(0, 4) then indexOf returns first index of 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 20, 10);
      let result: Int16Array = source.slice(0, 4);
      let r1: int = result.indexOf(20);
      let e1: int = 1;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1600
     * @tc.name testInt16ArraySliceTestFour016
     * @tc.desc Verify slice(0, 5) then lastIndexOf returns last index of 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 20, 10);
      let result: Int16Array = source.slice(0, 5);
      let r1: int = result.lastIndexOf(20);
      let e1: int = 3;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1700
     * @tc.name testInt16ArraySliceTestFour017
     * @tc.desc Verify slice(1, 4) then join returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 4);
      let r1: string = result.join(',');
      let e1: string = '20,30,40';
      let r2: string = r1;
      let e2: string = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1800
     * @tc.name testInt16ArraySliceTestFour018
     * @tc.desc Verify slice(0, 3) then entries yields first index-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, 3);
      let iter: IterableIterator<[int, Number]> = result.entries();
      let first: IteratorResult<[int, Number]> = iter.next();
      let r1: number = first.value![0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = first.value![1];
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_1900
     * @tc.name testInt16ArraySliceTestFour019
     * @tc.desc Verify slice(0, 2) then values yields first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, 2);
      let iter: IterableIterator<Number> = result.values();
      let first: IteratorResult<Number> = iter.next();
      let r1: number = first.value!;
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2000
     * @tc.name testInt16ArraySliceTestFour020
     * @tc.desc Verify slice(1, 3) then keys yields first relative index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(1, 3);
      let iter: IterableIterator<int> = result.keys();
      let first: IteratorResult<int> = iter.next();
      let r1: number = first.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2100
     * @tc.name testInt16ArraySliceTestFour021
     * @tc.desc Verify slice(0, 4) then subarray creates sub-view of copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 4);
      let sub: Int16Array = result.subarray(1, 3);
      let r1: int = sub.length;
      let e1: int = 2;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = sub.$_get(0 as int);
      let e2: int = 20;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2200
     * @tc.name testInt16ArraySliceTestFour022
     * @tc.desc Verify subarray then slice extracts independent copy from view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = source.subarray(1, 5);
      let result: Int16Array = sub.slice(0, 2);
      let r1: number = result.$_get(0 as int);
      let e1: int = 20;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = result.$_get(1 as int);
      let e2: int = 30;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2300
     * @tc.name testInt16ArraySliceTestFour023
     * @tc.desc Verify subarray of slice copy shares buffer with that copy only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 4);
      let sub: Int16Array = result.subarray(0, 2);
      sub.$_set(0 as int, 999);
      let r1: number = result.$_get(0 as int);
      let e1: int = 999;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = source.$_get(0 as int);
      let e2: int = 10;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2400
     * @tc.name testInt16ArraySliceTestFour024
     * @tc.desc Verify set uses slice result as source to write target array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let partial: Int16Array = source.slice(0, 2);
      let target: Int16Array = Int16Array.of(0, 0, 0);
      target.set(partial, 1);
      let r1: number = target.$_get(0 as int);
      let e1: int = 0;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = target.$_get(1 as int);
      let e2: int = 10;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = target.$_get(2 as int);
      let e3: int = 20;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2500
     * @tc.name testInt16ArraySliceTestFour025
     * @tc.desc Verify copyWithin then slice captures in-place moved values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      source.copyWithin(0, 2, 4);
      let result: Int16Array = source.slice(0, 3);
      let r1: number = result.$_get(0 as int);
      let e1: int = 30;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(1 as int);
      let e2: int = 40;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = result.$_get(2 as int);
      let e3: int = 30;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2600
     * @tc.name testInt16ArraySliceTestFour026
     * @tc.desc Verify slice then $_set writes int16.MAX on copy only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice();
      result.$_set(1 as int, 32767);
      let r1: number = result.$_get(1 as int);
      let e1: int = 32767;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = source.$_get(1 as int);
      let e2: int = 20;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2700
     * @tc.name testInt16ArraySliceTestFour027
     * @tc.desc Verify slice then $_set writes int16.MIN on copy only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice();
      result.$_set(1 as int, -32768);
      let r1: number = result.$_get(1 as int);
      let e1: int = -32768;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = source.$_get(1 as int);
      let e2: int = 20;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2800
     * @tc.name testInt16ArraySliceTestFour028
     * @tc.desc Verify new Int16Array(slice result) constructs independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let partial: Int16Array = source.slice(1, 4);
      let copy: Int16Array = new Int16Array(partial);
      let r1: int = copy.length;
      let e1: int = 3;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = copy.$_get(0 as int);
      let e2: int = 20;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = copy.$_get(2 as int);
      let e3: int = 40;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_2900
     * @tc.name testInt16ArraySliceTestFour029
     * @tc.desc Verify Int16Array.from(slice result) creates independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let partial: Int16Array = source.slice(0, 3);
      let copy: Int16Array = Int16Array.from(partial);
      let r1: int = copy.length;
      let e1: int = 3;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = copy.$_get(0 as int);
      let e2: int = 10;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = copy.$_get(2 as int);
      let e3: int = 30;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3000
     * @tc.name testInt16ArraySliceTestFour030
     * @tc.desc Verify slice(1, 4) copy buffer.byteLength equals length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 4);
      let r1: int = result.buffer.byteLength;
      let e1: int = 6;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3100
     * @tc.name testInt16ArraySliceTestFour031
     * @tc.desc Verify full slice() copy buffer.byteLength equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice();
      let r1: int = result.buffer.byteLength;
      let e1: number = source.buffer.byteLength;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3200
     * @tc.name testInt16ArraySliceTestFour032
     * @tc.desc Verify ArrayBuffer-backed Int16Array slice is independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let source: Int16Array = new Int16Array(buf);
      source.$_set(0 as int, 100);
      source.$_set(1 as int, 200);
      source.$_set(2 as int, 300);
      let result: Int16Array = source.slice(0, 2);
      source.$_set(0 as int, 999);
      let r1: number = result.$_get(0 as int);
      let e1: int = 100;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3300
     * @tc.name testInt16ArraySliceTestFour033
     * @tc.desc Verify two same-range slice copies use independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let copy1: Int16Array = source.slice(0, 3);
      let copy2: Int16Array = source.slice(0, 3);
      copy1.$_set(0 as int, 111);
      copy2.$_set(0 as int, 222);
      let r1: number = copy1.$_get(0 as int);
      let e1: int = 111;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = copy2.$_get(0 as int);
      let e2: int = 222;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = source.$_get(0 as int);
      let e3: int = 10;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3400
     * @tc.name testInt16ArraySliceTestFour034
     * @tc.desc Verify full-range slice copy can be mutated independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice();
      result.$_set(4 as int, 999);
      let r1: number = source.$_get(4 as int);
      let e1: int = 50;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = result.$_get(4 as int);
      let e2: int = 999;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3500
     * @tc.name testInt16ArraySliceTestFour035
     * @tc.desc Verify fill().reverse().slice() three-stage combination values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let result: Int16Array = source.fill(8, 0, 2).reverse().slice(1, 4);
      let r1: number = result.$_get(0 as int);
      let e1: int = 4;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = result.$_get(1 as int);
      let e2: int = 3;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3600
     * @tc.name testInt16ArraySliceTestFour036
     * @tc.desc Verify sort().fill().slice() three-stage combination values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(50, 20, 30, 10, 40);
      let result: Int16Array = source.sort().fill(0, 3, 5).slice(1, 4);
      let r1: number = result.$_get(0 as int);
      let e1: int = 20;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(1 as int);
      let e2: int = 30;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = result.$_get(2 as int);
      let e3: int = 0;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3700
     * @tc.name testInt16ArraySliceTestFour037
     * @tc.desc Verify reverse().sort().slice() three-stage combination values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(30, 10, 50, 20, 40);
      let result: Int16Array = source.reverse().sort().slice(1, 3);
      let r1: number = result.$_get(0 as int);
      let e1: int = 20;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = result.$_get(1 as int);
      let e2: int = 30;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3800
     * @tc.name testInt16ArraySliceTestFour038
     * @tc.desc Verify slice().fill().reverse() on copy leaves source intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 4).fill(7, 0, 2).reverse();
      let r1: number = result.$_get(0 as int);
      let e1: int = 40;
      let r5: number = r1;
      let e5: number = e1;
      expect(r5).assertEqual(e5);
      let r2: number = result.$_get(1 as int);
      let e2: int = 30;
      let r6: number = r2;
      let e6: number = e2;
      expect(r6).assertEqual(e6);
      let r3: number = result.$_get(2 as int);
      let e3: int = 7;
      let r7: number = r3;
      let e7: number = e3;
      expect(r7).assertEqual(e7);
      let r4: number = source.$_get(0 as int);
      let e4: int = 10;
      let r8: number = r4;
      let e8: number = e4;
      expect(r8).assertEqual(e8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_3900
     * @tc.name testInt16ArraySliceTestFour039
     * @tc.desc Verify slice().sort().fill() on copy leaves source intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(40, 10, 30, 20, 50);
      let result: Int16Array = source.slice(0, 4).sort().fill(99, 2, 4);
      let r1: number = result.$_get(0 as int);
      let e1: int = 10;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(2 as int);
      let e2: int = 99;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = source.$_get(0 as int);
      let e3: int = 40;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4000
     * @tc.name testInt16ArraySliceTestFour040
     * @tc.desc Verify set then reverse then slice three-stage combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let src: Int16Array = Int16Array.of(100, 200);
      source.set(src, 2);
      let result: Int16Array = source.reverse().slice(0, 3);
      let r1: number = result.$_get(0 as int);
      let e1: int = 50;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = result.$_get(1 as int);
      let e2: int = 200;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4100
     * @tc.name testInt16ArraySliceTestFour041
     * @tc.desc Verify forEach on slice while mutating source stays independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(0, 3);
      let sum: number = 0;
      result.forEach((value: number) => {
        sum = sum + value;
      });
      source.$_set(0 as int, 999);
      let r3: number = sum;
      let e3: number = 60;
      expect(r3).assertEqual(e3);
      let r1: number = source.$_get(0 as int);
      let e1: int = 999;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(0 as int);
      let e2: int = 10;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4200
     * @tc.name testInt16ArraySliceTestFour042
     * @tc.desc Verify reduce without initial value multiplies slice elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let result: Int16Array = source.slice(0, 4);
      let product: number = result.reduce((acc: number, value: number) => {
        return acc * value;
      });
      let r1: number = product;
      let e1: number = 24;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4300
     * @tc.name testInt16ArraySliceTestFour043
     * @tc.desc Verify reduce sum of slice with MAX and MIN equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(32767, -32768, 1);
      let result: Int16Array = source.slice(0, 3);
      let total: number = result.reduce((acc: number, value: number) => {
        return acc + value;
      }, 0);
      let r1: number = total;
      let e1: number = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4400
     * @tc.name testInt16ArraySliceTestFour044
     * @tc.desc Verify map on slice multiplies using external factor variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = source.slice(0, 3);
      let factor: number = 10;
      let mapped: Int16Array = result.map((value: number) => {
        return value * factor;
      });
      let r1: number = mapped.$_get(0 as int);
      let e1: int = 10;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = mapped.$_get(1 as int);
      let e2: int = 20;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = mapped.$_get(2 as int);
      let e3: int = 30;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4500
     * @tc.name testInt16ArraySliceTestFour045
     * @tc.desc Verify slice keeps int16.MIN boundary value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(-32768, 100, 200);
      let result: Int16Array = source.slice(0, 1);
      let r1: number = result.$_get(0 as int);
      let e1: int = -32768;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4600
     * @tc.name testInt16ArraySliceTestFour046
     * @tc.desc Verify slice spanning MAX and MIN preserves both boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(32767, 0, -32768, 100);
      let result: Int16Array = source.slice(0, 3);
      let r1: number = result.$_get(0 as int);
      let e1: int = 32767;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = result.$_get(2 as int);
      let e2: int = -32768;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4700
     * @tc.name testInt16ArraySliceTestFour047
     * @tc.desc Verify slice of all-zero array returns zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let result: Int16Array = source.slice(1, 4);
      let r1: number = result.$_get(0 as int);
      let e1: int = 0;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = result.$_get(1 as int);
      let e2: int = 0;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = result.$_get(2 as int);
      let e3: int = 0;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4800
     * @tc.name testInt16ArraySliceTestFour048
     * @tc.desc Verify slice preserves -1 element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(-1, 0, 1);
      let result: Int16Array = source.slice(0, 2);
      let r1: number = result.$_get(0 as int);
      let e1: int = -1;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = result.$_get(1 as int);
      let e2: int = 0;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_4900
     * @tc.name testInt16ArraySliceTestFour049
     * @tc.desc Verify slice then toString returns comma-separated copy values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(1, 4);
      let r1: string = result.toString();
      let e1: string = '20,30,40';
      let r2: string = r1;
      let e2: string = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5000
     * @tc.name testInt16ArraySliceTestFour050
     * @tc.desc Verify slice length property matches copy element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = source.slice(2, 5);
      let r1: int = result.length;
      let e1: int = 3;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5100
     * @tc.name testInt16ArraySliceTestFour051
     * @tc.desc Verify two different-range slice copies have independent lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let part1: Int16Array = source.slice(0, 2);
      let part2: Int16Array = source.slice(2, 5);
      let r1: int = part1.length;
      let e1: int = 2;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: int = part2.length;
      let e2: int = 3;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5200
     * @tc.name testInt16ArraySliceTestFour052
     * @tc.desc Verify empty slice has length 0 and buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, 0);
      let r1: int = result.length;
      let e1: int = 0;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: int = result.buffer.byteLength;
      let e2: int = 0;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5300
     * @tc.name testInt16ArraySliceTestFour053
     * @tc.desc Verify set uses slice copy as source with offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let part: Int16Array = source.slice(0, 2);
      let target: Int16Array = new Int16Array(3);
      target.set(part, 0);
      let r1: number = target.$_get(0 as int);
      let e1: int = 10;
      let r3: number = r1;
      let e3: number = e1;
      expect(r3).assertEqual(e3);
      let r2: number = target.$_get(1 as int);
      let e2: int = 20;
      let r4: number = r2;
      let e4: number = e2;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5400
     * @tc.name testInt16ArraySliceTestFour054
     * @tc.desc Verify ArrayBuffer offset view slice keeps BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let view: Int16Array = new Int16Array(buf, 2, 4);
      view.$_set(0 as int, 100);
      let result: Int16Array = view.slice(0, 2);
      let r1: int = result.BYTES_PER_ELEMENT;
      let e1: int = 2;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5500
     * @tc.name testInt16ArraySliceTestFour055
     * @tc.desc Verify ArrayBuffer-constructed view slice length is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int16Array = new Int16Array(buf, 0, 3);
      view.$_set(0 as int, 1);
      view.$_set(1 as int, 2);
      view.$_set(2 as int, 3);
      let result: Int16Array = view.slice(1, 3);
      let r1: int = result.length;
      let e1: int = 2;
      let r2: number = r1;
      let e2: number = e1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5600
     * @tc.name testInt16ArraySliceTestFour056
     * @tc.desc Verify set writes modified slice copy back into source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let part: Int16Array = source.slice(1, 4);
      part.$_set(0 as int, 999);
      source.set(part, 0);
      let r1: number = source.$_get(0 as int);
      let e1: int = 999;
      let r4: number = r1;
      let e4: number = e1;
      expect(r4).assertEqual(e4);
      let r2: number = source.$_get(1 as int);
      let e2: int = 30;
      let r5: number = r2;
      let e5: number = e2;
      expect(r5).assertEqual(e5);
      let r3: number = source.$_get(2 as int);
      let e3: int = 40;
      let r6: number = r3;
      let e6: number = e3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5700
     * @tc.name testInt16ArraySliceTestFour057
     * @tc.desc Verify every on empty slice result returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, 0);
      let allOk: boolean = result.every((value: number) => {
        return value > 100;
      });
      let r1: boolean = allOk;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5800
     * @tc.name testInt16ArraySliceTestFour058
     * @tc.desc Verify some on empty slice result returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, 0);
      let any: boolean = result.some((value: number) => {
        return value > 0;
      });
      let r1: boolean = any;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SLICE_FOUR_5900
     * @tc.name testInt16ArraySliceTestFour059
     * @tc.desc Verify reduce with initial value on empty slice returns initial
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySliceTestFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = source.slice(0, 0);
      let val: number = result.reduce((acc: number, value: number) => {
        return acc + value;
      }, 100);
      let r1: number = val;
      let e1: number = 100;
      expect(r1).assertEqual(e1);
    });
  });
}
