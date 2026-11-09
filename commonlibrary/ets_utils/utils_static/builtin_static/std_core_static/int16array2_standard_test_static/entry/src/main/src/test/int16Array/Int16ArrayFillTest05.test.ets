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

export default function int16ArrayFillTestFiveTest(): void {
  describe('Int16ArrayFillTestFiveTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0720
     * @tc.name testInt16ArrayFillTestFive072
     * @tc.desc Verify fill NaN yields 0 after slice copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1, 1);
      arr.fill(Number.NaN);
      let copied: Int16Array = arr.slice();
      let actual1: number = copied.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = copied.$_get(2);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0780
     * @tc.name testInt16ArrayFillTestFive078
     * @tc.desc Verify fill on one Int16Array view is visible on another shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let view1: Int16Array = new Int16Array(buf, 0, 5);
      let view2: Int16Array = new Int16Array(buf, 0, 5);
      view1.fill(99, 1, 3);
      let actual1: number = view2.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = view2.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = view2.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = view2.$_get(3);
      expect(actual4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0790
     * @tc.name testInt16ArrayFillTestFive079
     * @tc.desc Verify fill -1 readable as 65535 through Uint16Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr16: Int16Array = new Int16Array(buf);
      arr16.fill(-1);
      let arrU16: Uint16Array = new Uint16Array(buf);
      let actual1: number = arrU16.$_get(0);
      expect(actual1).assertEqual(65535);
      let actual2: number = arrU16.$_get(1);
      expect(actual2).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0820
     * @tc.name testInt16ArrayFillTestFive082
     * @tc.desc Verify fill 32768 readable as 32768 through Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(32768);
      let arrU16: Uint16Array = new Uint16Array(buf);
      let actual1: number = arrU16.$_get(0);
      expect(actual1).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0870
     * @tc.name testInt16ArrayFillTestFive087
     * @tc.desc Verify fill then indexOf returns first filled index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      arr.fill(99, 2, 4);
      let pos: int = arr.indexOf(99);
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0880
     * @tc.name testInt16ArrayFillTestFive088
     * @tc.desc Verify fill then lastIndexOf returns last filled index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(88, 0, 3);
      let lastPos: int = arr.lastIndexOf(88);
      expect(lastPos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0890
     * @tc.name testInt16ArrayFillTestFive089
     * @tc.desc Verify fill then includes returns true for filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(77, 0, 1);
      let found: boolean = arr.includes(77);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0910
     * @tc.name testInt16ArrayFillTestFive091
     * @tc.desc Verify fill then map creates new array without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.fill(5, 1, 3);
      let mapped: Int16Array = arr.map((v: number): number => v * 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = mapped.$_get(0);
      expect(actual2).assertEqual(20);
      let actual3: number = mapped.$_get(1);
      expect(actual3).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0920
     * @tc.name testInt16ArrayFillTestFive092
     * @tc.desc Verify fill then filter selects filled values with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(99, 0, 3);
      let filtered: Int16Array = arr.filter((v: number): boolean => v === 99);
      let actual1: int = filtered.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0930
     * @tc.name testInt16ArrayFillTestFive093
     * @tc.desc Verify fill then reduce sums filled range correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(2, 1, 4);
      let sum: number = arr.reduce((acc: number, v: number): number => acc + v);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0940
     * @tc.name testInt16ArrayFillTestFive094
     * @tc.desc Verify fill then find returns first filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(42, 1, 3);
      let found: number | undefined = arr.find((v: number): boolean => v === 42);
      let actual2: boolean = found !== undefined;
      expect(actual2).assertTrue();
      let actual1: number = found as number;
      expect(actual1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0950
     * @tc.name testInt16ArrayFillTestFive095
     * @tc.desc Verify fill then findIndex returns first filled index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      arr.fill(33, 1, 3);
      let idx: int = arr.findIndex((v: number): boolean => v === 33);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0960
     * @tc.name testInt16ArrayFillTestFive096
     * @tc.desc Verify fill 0 then every reports all zeros true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(0);
      let allZeros: boolean = arr.every((v: number): boolean => v === 0);
      expect(allZeros).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0970
     * @tc.name testInt16ArrayFillTestFive097
     * @tc.desc Verify fill non-zero then some reports non-zero true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(5, 1, 2);
      let hasNonZero: boolean = arr.some((v: number): boolean => v !== 0);
      expect(hasNonZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0980
     * @tc.name testInt16ArrayFillTestFive098
     * @tc.desc Verify multiple fill ranges on long array stay independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      arr.fill(1, 0, 3);
      arr.fill(2, 3, 6);
      arr.fill(3, 6, 9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(5);
      expect(actual3).assertEqual(2);
      let actual4: number = arr.$_get(6);
      expect(actual4).assertEqual(3);
      let actual5: number = arr.$_get(8);
      expect(actual5).assertEqual(3);
      let actual6: number = arr.$_get(9);
      expect(actual6).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0990
     * @tc.name testInt16ArrayFillTestFive099
     * @tc.desc Verify full fill then slice copy matches filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(128);
      let copy: Int16Array = arr.slice();
      let actual1: number = copy.$_get(0);
      expect(actual1).assertEqual(128);
      let actual2: number = copy.$_get(2);
      expect(actual2).assertEqual(128);
      let actual3: number = copy.$_get(4);
      expect(actual3).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_1010
     * @tc.name testInt16ArrayFillTestFive101
     * @tc.desc Verify fill then toSorted returns new array while original keeps fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 3, 1, 4, 2);
      arr.fill(0, 0, 2);
      let sorted: Int16Array = arr.toSorted();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_1020
     * @tc.name testInt16ArrayFillTestFive102
     * @tc.desc Verify fill then toReversed returns new array while original keeps fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      arr.fill(9, 0, 2);
      let reversed: Int16Array = arr.toReversed();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(9);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(9);
    });
  });
}
