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
} from "../../../../hypium/index";
import Utils from "../Util.test";

export default function int16ArrayConstructorPart05Test(): void {
  describe("Int16ArrayConstructorPart05Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0100
     * @tc.name int16ArrayConstructorPart05Test001
     * @tc.desc Verify new Int16Array(FixedArray<int> [1, 2, 3]).length equals 3 #001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [1, 2, 3];
      const arr = new Int16Array(fa);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0200
     * @tc.name int16ArrayConstructorPart05Test002
     * @tc.desc Verify new Int16Array(FixedArray<int> []).byteLength #005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [];
      const arr = new Int16Array(fa);
      let actual: int = arr.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0300
     * @tc.name int16ArrayConstructorPart05Test003
     * @tc.desc Verify new Int16Array(FixedArray<int> []).byteOffset is 0 #006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [];
      const arr = new Int16Array(fa);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0400
     * @tc.name int16ArrayConstructorPart05Test004
     * @tc.desc Verify new Int16Array(FixedArray<int> [0]) values via $_get #007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [0];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0500
     * @tc.name int16ArrayConstructorPart05Test005
     * @tc.desc Verify new Int16Array(FixedArray<int> [10, 20, 30, 40, 50]).length #019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [10, 20, 30, 40, 50];
      const arr = new Int16Array(fa);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 10;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: int = 50;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0600
     * @tc.name int16ArrayConstructorPart05Test006
     * @tc.desc Verify new Int16Array(FixedArray<int> [-32768, 0, 32767]) values via $_get #020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [-32768, 0, 32767];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 32767;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0700
     * @tc.name int16ArrayConstructorPart05Test007
     * @tc.desc Verify new Int16Array(FixedArray<int> [32768, 65535, -32769]) values via $_get #021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [32768, 65535, -32769];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 32767;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0800
     * @tc.name int16ArrayConstructorPart05Test008
     * @tc.desc Verify new Int16Array(FixedArray<int> [-32768, -32769, 0, 32767, 32768]) values via $_get #022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [-32768, -32769, 0, 32767, 32768];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 32767;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(4);
      let expected5: int = -32768;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__0900
     * @tc.name int16ArrayConstructorPart05Test009
     * @tc.desc Verify new Int16Array(FixedArray<int> [0, 0, 0, 0]) values via $_get #023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [0, 0, 0, 0];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1000
     * @tc.name int16ArrayConstructorPart05Test010
     * @tc.desc Verify new Int16Array(FixedArray<int> [-1, -1, -1]) values via $_get #024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [-1, -1, -1];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = -1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1100
     * @tc.name int16ArrayConstructorPart05Test011
     * @tc.desc Verify new Int16Array(FixedArray<int> [100, 200, 300]).length #031
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [100, 200, 300];
      const arr = new Int16Array(fa);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 100;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 300;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1200
     * @tc.name int16ArrayConstructorPart05Test012
     * @tc.desc Verify new Int16Array(FixedArray<int> [10, 20, 30, 40]).length #038
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [10, 20, 30, 40];
      const arr = new Int16Array(fa);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 10;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: int = 40;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1300
     * @tc.name int16ArrayConstructorPart05Test013
     * @tc.desc Verify new Int16Array(FixedArray<int> [255, 255, 255]) values via $_get #039
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [255, 255, 255];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 255;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 255;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 255;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1400
     * @tc.name int16ArrayConstructorPart05Test014
     * @tc.desc Verify new Int16Array(FixedArray<int> [0, 255, 0, 255]) values via $_get #040
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [0, 255, 0, 255];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 255;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: int = 255;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1500
     * @tc.name int16ArrayConstructorPart05Test015
     * @tc.desc Verify new Int16Array(FixedArray<number> [100, 200, 300, 400, 500]).length #048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<number> = [100, 200, 300, 400, 500];
      const arr = new Int16Array(fa);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 100;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: int = 500;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1600
     * @tc.name int16ArrayConstructorPart05Test016
     * @tc.desc Verify new Int16Array(FixedArray<double> [Number.NaN]) values via $_get #054
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<double> = [Number.NaN];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1700
     * @tc.name int16ArrayConstructorPart05Test017
     * @tc.desc Verify new Int16Array(FixedArray<double> [Number.POSITIVE_INFINITY]) values via $_get #055
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<double> = [Number.POSITIVE_INFINITY];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1800
     * @tc.name int16ArrayConstructorPart05Test018
     * @tc.desc Verify new Int16Array(FixedArray<double> [Number.NEGATIVE_INFINITY]) values via $_get #056
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<double> = [Number.NEGATIVE_INFINITY];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__1900
     * @tc.name int16ArrayConstructorPart05Test019
     * @tc.desc Verify new Int16Array(FixedArray<double> [1.1, 2.5, 3.9, -1.1, -2.5]) values via $_get #059
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<double> = [1.1, 2.5, 3.9, -1.1, -2.5];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 3;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = -1;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(4);
      let expected5: int = -2;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2000
     * @tc.name int16ArrayConstructorPart05Test020
     * @tc.desc Verify new Int16Array(FixedArray<double> [Number.NaN, Number.POSITIVE_INFINITY...]) values via $_get #060
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<double> = [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 42.0];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 42;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2100
     * @tc.name int16ArrayConstructorPart05Test021
     * @tc.desc Verify new Int16Array(FixedArray<number> [Number.NaN]) values via $_get #065
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<number> = [Number.NaN];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2200
     * @tc.name int16ArrayConstructorPart05Test022
     * @tc.desc Verify new Int16Array(FixedArray<number> [1.5, 2.5, Number.NaN, -1.5]) values via $_get #066
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<number> = [1.5, 2.5, Number.NaN, -1.5];
      const arr = new Int16Array(fa);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = -1;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2300
     * @tc.name int16ArrayConstructorPart05Test023
     * @tc.desc Verify new Int16Array(FixedArray<int> [65, 66, 67, 68]).length #071
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [65, 66, 67, 68];
      const arr = new Int16Array(fa);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 65;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: int = 68;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2400
     * @tc.name int16ArrayConstructorPart05Test024
     * @tc.desc Verify new Int16Array(FixedArray<int>).byteLength equals length * BYTES_PER_ELEMENT #077
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [1, 2, 3, 4];
      const arr = new Int16Array(fa);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * Int16Array.BYTES_PER_ELEMENT;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2500
     * @tc.name int16ArrayConstructorPart05Test025
     * @tc.desc Verify new Int16Array(FixedArray<number> []).byteLength #078
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<number> = [];
      const arr = new Int16Array(fa);
      let actual: int = arr.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2600
     * @tc.name int16ArrayConstructorPart05Test026
     * @tc.desc Verify new Int16Array(FixedArray<int> [100, 200]).byteOffset is 0 #079
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [100, 200];
      const arr = new Int16Array(fa);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2700
     * @tc.name int16ArrayConstructorPart05Test027
     * @tc.desc Verify new Int16Array(FixedArray<int>).name equals Int16Array #080
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [5];
      const arr = new Int16Array(fa);
      let actual: string = arr.name;
      let expected: string = "Int16Array";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2800
     * @tc.name int16ArrayConstructorPart05Test028
     * @tc.desc Verify new Int16Array(FixedArray<int>).BYTES_PER_ELEMENT equals 2 #081
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [1];
      const arr = new Int16Array(fa);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__2900
     * @tc.name int16ArrayConstructorPart05Test029
     * @tc.desc Verify new Int16Array(FixedArray<int> [50, 60]).buffer.byteLength equals 4 #082
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [50, 60];
      const arr = new Int16Array(fa);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3000
     * @tc.name int16ArrayConstructorPart05Test030
     * @tc.desc Verify new Int16Array(FixedArray<int>) buffer.byteLength equals 6 #083
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [7, 8, 9];
      const arr = new Int16Array(fa);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3100
     * @tc.name int16ArrayConstructorPart05Test031
     * @tc.desc Verify new Int16Array from FixedArray<int> [5, 15, 25] #088
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [5, 15, 25];
      const arr = new Int16Array(fa);
      arr.$_set(0, 888);
      let actual: number = fa[0];
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3200
     * @tc.name int16ArrayConstructorPart05Test032
     * @tc.desc Verify new Int16Array(FixedArray<int> [1, 2, 3]) isolation via $_set/$_get #089
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [1, 2, 3];
      const arr1 = new Int16Array(fa);
      const arr2 = new Int16Array(fa);
      arr1.$_set(0, 100);
      let actual: number = arr2.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3300
     * @tc.name int16ArrayConstructorPart05Test033
     * @tc.desc Verify new Int16Array from FixedArray<int> [7, 8] #090
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [7, 8];
      const arr1 = new Int16Array(fa);
      const arr2 = new Int16Array(fa);
      let actual: boolean = arr1.buffer === arr2.buffer;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3400
     * @tc.name int16ArrayConstructorPart05Test034
     * @tc.desc Verify new Int16Array from FixedArray<int> [12, 34, 56] #091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [12, 34, 56];
      const arr = new Int16Array(fa);
      let actual: number = fa[0];
      let expected: int = 12;
      expect(actual).assertEqual(expected);
      let actual2: number = fa[1];
      let expected2: int = 34;
      expect(actual2).assertEqual(expected2);
      let actual3: number = fa[2];
      let expected3: int = 56;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3500
     * @tc.name int16ArrayConstructorPart05Test035
     * @tc.desc Verify new Int16Array(FixedArray<int> [1, 2, 3, 4, 5]).byteLength #092
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [1, 2, 3, 4, 5];
      const arr = new Int16Array(fa);
      let actual: int = arr.buffer.byteLength;
      let expected: number = arr.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3600
     * @tc.name int16ArrayConstructorPart05Test036
     * @tc.desc Verify new Int16Array(FixedArray<int> [42, 84]) values via $_get #093
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [42, 84];
      const arr = new Int16Array(fa);
      const element0 = arr.$_get(0);
      const element1 = arr.$_get(1);
      expect(element0).assertEqual(42);
      expect(element1).assertEqual(84);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3700
     * @tc.name int16ArrayConstructorPart05Test037
     * @tc.desc Verify new Int16Array(FixedArray<int> [10, 20]) isolation via $_set/$_get #094
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [10, 20];
      const arr = new Int16Array(fa);
      arr.$_set(0, 99);
      let actual: number = arr.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3800
     * @tc.name int16ArrayConstructorPart05Test038
     * @tc.desc Verify new Int16Array from FixedArray<int> [1, 2, 3, 4, 5] #095
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [1, 2, 3, 4, 5];
      const arr = new Int16Array(fa);
      const sub = arr.subarray(1, 4);
      let actual: boolean = arr.buffer === sub.buffer;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__3900
     * @tc.name int16ArrayConstructorPart05Test039
     * @tc.desc Verify new Int16Array(FixedArray<int> [10, 20, 30, 40]) isolation via $_set/$_get #096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [10, 20, 30, 40];
      const arr = new Int16Array(fa);
      const sub = arr.subarray(1, 3);
      arr.$_set(1, 99);
      let actual: number = sub.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__4000
     * @tc.name int16ArrayConstructorPart05Test040
     * @tc.desc Verify new Int16Array(FixedArray<int> [5, 10, 15]) values via $_get #097
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [5, 10, 15];
      const arr = new Int16Array(fa);
      const view = new Int16Array(arr.buffer);
      let actual: int = view.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = view.$_get(0);
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__4100
     * @tc.name int16ArrayConstructorPart05Test041
     * @tc.desc Verify new Int16Array(FixedArray<int> [100, 200]).byteLength #098
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [100, 200];
      const arr = new Int16Array(fa);
      const dv = new DataView(arr.buffer);
      let actual: int = dv.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__4200
     * @tc.name int16ArrayConstructorPart05Test042
     * @tc.desc Verify new Int16Array from multiple FixedArray types (int, short) #099
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let faInt: FixedArray<int> = [10, 20, 30];
      let faShort: FixedArray<int> = [10, 20, 30];
      const arrInt = new Int16Array(faInt);
      const arrShort = new Int16Array(faShort);
      let actual: number = arrInt.$_get(0);
      let expected: number = arrShort.$_get(0);
      expect(actual).assertEqual(expected);
      let actual2: number = arrInt.$_get(2);
      let expected2: number = arrShort.$_get(2);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__4300
     * @tc.name int16ArrayConstructorPart05Test043
     * @tc.desc Verify new Int16Array from multiple FixedArray types (int, long) #100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let faInt: FixedArray<int> = [100, 200];
      let faLong: FixedArray<number> = [100, 200];
      const arrInt = new Int16Array(faInt);
      const arrLong = new Int16Array(faLong);
      let actual: number = arrInt.$_get(0);
      let expected: number = arrLong.$_get(0);
      expect(actual).assertEqual(expected);
      let actual2: number = arrInt.$_get(1);
      let expected2: number = arrLong.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__4400
     * @tc.name int16ArrayConstructorPart05Test044
     * @tc.desc Verify new Int16Array from multiple FixedArray types (int, byte) #101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let faInt: FixedArray<int> = [0, 128, 255];
      let faByte: FixedArray<int> = [0, 128, 255];
      const arrInt = new Int16Array(faInt);
      const arrByte = new Int16Array(faByte);
      let actual: number = arrInt.$_get(0);
      let expected: number = arrByte.$_get(0);
      expect(actual).assertEqual(expected);
      let actual2: number = arrInt.$_get(1);
      let expected2: number = arrByte.$_get(1);
      expect(actual2).assertEqual(expected2);
      let actual3: number = arrInt.$_get(2);
      let expected3: number = arrByte.$_get(2);
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART05__4500
     * @tc.name int16ArrayConstructorPart05Test045
     * @tc.desc Verify new Int16Array from multiple FixedArray types (double, float) #102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart05Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let faDouble: FixedArray<double> = [1.5, 2.5];
      let faFloat: FixedArray<number> = [1.5, 2.5];
      const arrDouble = new Int16Array(faDouble);
      const arrFloat = new Int16Array(faFloat);
      let actual: number = arrDouble.$_get(0);
      let expected: number = arrFloat.$_get(0);
      expect(actual).assertEqual(expected);
      let actual2: number = arrDouble.$_get(1);
      let expected2: number = arrFloat.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

  });
}
