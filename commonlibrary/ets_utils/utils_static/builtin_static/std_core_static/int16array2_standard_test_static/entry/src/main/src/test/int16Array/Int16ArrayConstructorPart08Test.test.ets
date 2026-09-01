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

class ThrowingIterable066 implements Iterable<Number> {
  $_iterator(): Iterator<Number> {
    throw new Error("iterable error");
  }
}

export default function int16ArrayConstructorPart08Test(): void {
  describe("Int16ArrayConstructorPart08Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0100
     * @tc.name int16ArrayConstructorPart08Test001
     * @tc.desc Verify new Int16Array Iterable<Number> Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [1.0, 2.0];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0200
     * @tc.name int16ArrayConstructorPart08Test002
     * @tc.desc Verify new Int16Array Array<Number> Iterable Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [10.0, 20.0, 30.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0300
     * @tc.name int16ArrayConstructorPart08Test003
     * @tc.desc Verify new Int16Array Array<Number> Iterable Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i: number = 0; i < 500; i++) {
        src.push(i);
      }
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 500;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0400
     * @tc.name int16ArrayConstructorPart08Test004
     * @tc.desc Verify new Int16Array Set<Number> Iterable Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<Number> = new Set<Number>();
      src.add(5.0);
      src.add(15.0);
      src.add(25.0);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0500
     * @tc.name int16ArrayConstructorPart08Test005
     * @tc.desc Verify new Int16Array Set<Number> Iterable 1 Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<Number> = new Set<Number>();
      src.add(99.0);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0600
     * @tc.name int16ArrayConstructorPart08Test006
     * @tc.desc Verify new Int16Array Int16Array Iterable<Number> Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([100, 200, 300] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0700
     * @tc.name int16ArrayConstructorPart08Test007
     * @tc.desc Verify new Int16Array Int16Array Iterable Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0800
     * @tc.name int16ArrayConstructorPart08Test008
     * @tc.desc Verify new Int16Array Int16Array Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([50, -50, 0] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 50;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -50;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__0900
     * @tc.name int16ArrayConstructorPart08Test009
     * @tc.desc Verify new Int16Array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [Number.NaN];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1000
     * @tc.name int16ArrayConstructorPart08Test010
     * @tc.desc Verify new Int16Array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [Number.POSITIVE_INFINITY];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1100
     * @tc.name int16ArrayConstructorPart08Test011
     * @tc.desc Verify new Int16Array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [-Number.POSITIVE_INFINITY];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1200
     * @tc.name int16ArrayConstructorPart08Test012
     * @tc.desc Verify new Int16Array int16.MAX(32767) 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [32767.0, 32767.0, 32767.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 32767;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1300
     * @tc.name int16ArrayConstructorPart08Test013
     * @tc.desc Verify new Int16Array int16.MIN(-32768) -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [-32768.0, -32768.0, -32768.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = -32768;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1400
     * @tc.name int16ArrayConstructorPart08Test014
     * @tc.desc Verify new Int16Array $_get/$_get/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [32767.0, -32768.0, 0.0, -1.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = -1;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1500
     * @tc.name int16ArrayConstructorPart08Test015
     * @tc.desc Verify new Int16Array [32768, -32769, NaN, Infinity] /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [32768.0, -32769.0, Number.NaN, Number.POSITIVE_INFINITY];
      const arr = new Int16Array(src);
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
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1600
     * @tc.name int16ArrayConstructorPart08Test016
     * @tc.desc Verify new Int16Array $_get/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [0.0, 0.0, 0.0, 0.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(3);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1700
     * @tc.name int16ArrayConstructorPart08Test017
     * @tc.desc Verify new Int16Array $_get/$_get/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [65535.0, 65536.0, 131071.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = -1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1800
     * @tc.name int16ArrayConstructorPart08Test018
     * @tc.desc Verify new Int16Array $_get/$_get/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [3.7, -3.7, 0.5, -0.5];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -3;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__1900
     * @tc.name int16ArrayConstructorPart08Test019
     * @tc.desc Verify new Int16Array $_get/$_get/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [100.0, 32768.0, -50.0, -32769.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = -50;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 32767;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2000
     * @tc.name int16ArrayConstructorPart08Test020
     * @tc.desc Verify new Int16Array Iterable index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [11.0, 22.0, 33.0, 44.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(arr.length - 1);
      let expected: int = 44;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2100
     * @tc.name int16ArrayConstructorPart08Test021
     * @tc.desc Verify new Int16Array $_get/$_get/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<Number> = new Set<Number>();
      src.add(100.0);
      src.add(200.0);
      src.add(300.0);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 300;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2200
     * @tc.name int16ArrayConstructorPart08Test022
     * @tc.desc Verify new Int16Array Int16Array Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 4, 3, 2, 1] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 5;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(4);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2300
     * @tc.name int16ArrayConstructorPart08Test023
     * @tc.desc Verify new Int16Array number Iterable int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [1.1, 2.2, 3.3];
      const arr = new Int16Array(src as Number[]);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 3;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2400
     * @tc.name int16ArrayConstructorPart08Test024
     * @tc.desc Verify new Int16Array $_get/$_get/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [10.0, 20.0, 30.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2500
     * @tc.name int16ArrayConstructorPart08Test025
     * @tc.desc Verify new Int16Array double Iterable int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [1.999, -2.001, 0.001];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2600
     * @tc.name int16ArrayConstructorPart08Test026
     * @tc.desc Verify new Int16Array Set<Number> Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<number> = new Set<number>();
      for (let i: number = 0; i < 100; i++) {
        src.add(i);
      }
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2700
     * @tc.name int16ArrayConstructorPart08Test027
     * @tc.desc Verify new Int16Array Int16Array Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(200);
      for (let i = 0; i < 200; i++) {
        src.$_set(i, i);
      }
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 200;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2800
     * @tc.name int16ArrayConstructorPart08Test028
     * @tc.desc Verify new Int16Array Iterable buffer.byteLength equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [5.0, 10.0];
      const arr = new Int16Array(src);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__2900
     * @tc.name int16ArrayConstructorPart08Test029
     * @tc.desc Verify new Int16Array byteLength length BYTES_PER_ELEMENT(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [10.0, 20.0, 30.0];
      const arr = new Int16Array(src);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * Int16Array.BYTES_PER_ELEMENT;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3000
     * @tc.name int16ArrayConstructorPart08Test030
     * @tc.desc Verify new Int16Array byteLength length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [1.0, 2.0, 3.0, 4.0];
      const arr = new Int16Array(src);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3100
     * @tc.name int16ArrayConstructorPart08Test031
     * @tc.desc Verify new Int16Array byteOffset 0 Iterable buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [7.0, 8.0];
      const arr = new Int16Array(src);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3200
     * @tc.name int16ArrayConstructorPart08Test032
     * @tc.desc Verify new Int16Array BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [1.0];
      const arr = new Int16Array(src);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3300
     * @tc.name int16ArrayConstructorPart08Test033
     * @tc.desc Verify new Int16Array Iterable length 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3400
     * @tc.name int16ArrayConstructorPart08Test034
     * @tc.desc Verify new Int16Array $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [10.0, 20.0];
      const arr = new Int16Array(src);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3500
     * @tc.name int16ArrayConstructorPart08Test035
     * @tc.desc Verify new Int16Array $_get(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [1.0, 2.0];
      const arr = new Int16Array(src);
      try {
        arr.$_get(arr.length);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3600
     * @tc.name int16ArrayConstructorPart08Test036
     * @tc.desc Verify new Int16Array $_get(length+1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [5.0];
      const arr = new Int16Array(src);
      try {
        arr.$_get(arr.length + 1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3700
     * @tc.name int16ArrayConstructorPart08Test037
     * @tc.desc Verify new Int16Array $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [0.0, 0.0];
      const arr = new Int16Array(src);
      arr.$_set(0, 99);
      let actual: number = arr.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3800
     * @tc.name int16ArrayConstructorPart08Test038
     * @tc.desc Verify new Int16Array $_set out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [10.0, 20.0];
      const arr = new Int16Array(src);
      try {
        arr.$_set(arr.length, 999);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__3900
     * @tc.name int16ArrayConstructorPart08Test039
     * @tc.desc Verify new Int16Array Iterable $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [];
      const arr = new Int16Array(src);
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4000
     * @tc.name int16ArrayConstructorPart08Test040
     * @tc.desc Verify new Int16Array $_iterator with Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ThrowingIterable066 = new ThrowingIterable066();
      try {
        const arr = new Int16Array(src);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "Error";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4100
     * @tc.name int16ArrayConstructorPart08Test041
     * @tc.desc Verify new Int16Array Iterable Int16Array buffer Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [10.0, 20.0];
      const arr = new Int16Array(src);
      arr.$_set(0, 555);
      let actual: number = src[0];
      let expected: number = 10.0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4200
     * @tc.name int16ArrayConstructorPart08Test042
     * @tc.desc Verify new Int16Array Int16Array Iterable Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 10, 15] as number[]);
      const arr = new Int16Array(src);
      arr.$_set(1, 888);
      let actual: number = src.$_get(1);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4300
     * @tc.name int16ArrayConstructorPart08Test043
     * @tc.desc Verify new Int16Array Iterable buffer Int16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([7, 14, 21] as number[]);
      const arr = new Int16Array(src);
      let actual: boolean = arr.buffer === src.buffer;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4400
     * @tc.name int16ArrayConstructorPart08Test044
     * @tc.desc Verify new Int16Array Iterable ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3, 4] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4500
     * @tc.name int16ArrayConstructorPart08Test045
     * @tc.desc Verify new Int16Array Int16Array $_iterator buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const src = new Int16Array(buf, 0, 3);
      src.$_set(0, 100);
      src.$_set(1, 200);
      src.$_set(2, 300);
      const arr = new Int16Array(src);
      const otherView = new Int16Array(buf, 0, 3);
      otherView.$_set(0, -1);
      let actual: number = arr.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4600
     * @tc.name int16ArrayConstructorPart08Test046
     * @tc.desc Verify new Int16Array $_set/$_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([20, 40, 60] as number[]);
      const arr = new Int16Array(src);
      arr.$_set(0, 77);
      arr.$_set(1, 88);
      let actual: number = arr.$_get(0);
      let expected: int = 77;
      expect(actual).assertEqual(expected);
      let actual2: number = src.$_get(0);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4700
     * @tc.name int16ArrayConstructorPart08Test047
     * @tc.desc Verify new Int16Array Iterable<Number> ArrayLike<Number> Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Number[] = [1.5, 2.5, 3.5];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART08__4800
     * @tc.name int16ArrayConstructorPart08Test048
     * @tc.desc Verify new Int16Array Iterable<Number> Set Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart08Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<Number> = new Set<Number>();
      src.add(5.0);
      src.add(15.0);
      src.add(25.0);
      src.add(35.0);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

  });
}
