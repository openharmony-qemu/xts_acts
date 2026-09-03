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

export default function int16ArrayConstructorPart07Test(): void {
  describe("Int16ArrayConstructorPart07Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0100
     * @tc.name int16ArrayConstructorPart07Test001
     * @tc.desc Verify new Int16Array(Array<int>) empty source length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0200
     * @tc.name int16ArrayConstructorPart07Test002
     * @tc.desc Verify new Int16Array(Array<int>) single element [42] length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [42];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0300
     * @tc.name int16ArrayConstructorPart07Test003
     * @tc.desc Verify new Int16Array(Array<int>) multi element length is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3, 4, 5];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0400
     * @tc.name int16ArrayConstructorPart07Test004
     * @tc.desc Verify new Int16Array(Array<int>) empty source byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0500
     * @tc.name int16ArrayConstructorPart07Test005
     * @tc.desc Verify new Int16Array(Array<int>) empty result fill keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [];
      let result: Int16Array = new Int16Array(source);
      result.fill(0);
      let actual: int = result.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0600
     * @tc.name int16ArrayConstructorPart07Test006
     * @tc.desc Verify new Int16Array(Array<int>) [0] element is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [0];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0700
     * @tc.name int16ArrayConstructorPart07Test007
     * @tc.desc Verify new Int16Array(Array<int>) [100000] overflow wraps negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [100000];
      let result: Int16Array = new Int16Array(source);
      let val: number = result.$_get(0);
      let actual: boolean = val < 0;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0800
     * @tc.name int16ArrayConstructorPart07Test008
     * @tc.desc Verify new Int16Array(Array<int>) [-100000] overflow wraps positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [-100000];
      let result: Int16Array = new Int16Array(source);
      let val: number = result.$_get(0);
      let actual: boolean = val > 0;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__0900
     * @tc.name int16ArrayConstructorPart07Test009
     * @tc.desc Verify new Int16Array(Array<int>) [0,0] both elements are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [0, 0];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1000
     * @tc.name int16ArrayConstructorPart07Test010
     * @tc.desc Verify new Int16Array(Array<int>) [1,2,3] preserves order and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 3;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1100
     * @tc.name int16ArrayConstructorPart07Test011
     * @tc.desc Verify new Int16Array(Array<int>) [32767,-32768] boundary pair preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [32767, -32768];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1200
     * @tc.name int16ArrayConstructorPart07Test012
     * @tc.desc Verify new Int16Array(Array<int>) [32768,-32769] independent wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [32768, -32769];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1300
     * @tc.name int16ArrayConstructorPart07Test013
     * @tc.desc Verify new Int16Array(Array<int>) [100000,-100000] large overflow differs from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [100000, -100000];
      let result: Int16Array = new Int16Array(source);
      let element0: number = result.$_get(0);
      let element1: number = result.$_get(1);
      let actual: boolean = element0 !== 100000;
      expect(actual).assertTrue();
      let actual2: boolean = element1 !== -100000;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1400
     * @tc.name int16ArrayConstructorPart07Test014
     * @tc.desc Verify new Int16Array(Array<int>) [2147483647] truncates into int16 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [2147483647];
      let result: Int16Array = new Int16Array(source);
      let val: number = result.$_get(0);
      let actual: boolean = val >= -32768 && val <= 32767;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1500
     * @tc.name int16ArrayConstructorPart07Test015
     * @tc.desc Verify new Int16Array(Array<int>) five zeros all elements are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [0, 0, 0, 0, 0];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
      let actual5: number = result.$_get(4);
      let expected5: int = 0;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1600
     * @tc.name int16ArrayConstructorPart07Test016
     * @tc.desc Verify new Int16Array(Array<int>) [1,-1,1,-1] alternating signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, -1, 1, -1];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = -1;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1700
     * @tc.name int16ArrayConstructorPart07Test017
     * @tc.desc Verify new Int16Array(Array<int>) boundary values alternating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [32767, -32768, 32767, -32768];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 32767;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = -32768;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1800
     * @tc.name int16ArrayConstructorPart07Test018
     * @tc.desc Verify new Int16Array(Array<int>) [65536,0] wrap then independent $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [65536, 0];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      result.$_set(0, 99);
      let actual3: number = result.$_get(1);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__1900
     * @tc.name int16ArrayConstructorPart07Test019
     * @tc.desc Verify new Int16Array(Array<int>) [65535,-1] wrap then independent $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [65535, -1];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      result.$_set(0, 42);
      let actual3: number = result.$_get(1);
      let expected3: int = -1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2000
     * @tc.name int16ArrayConstructorPart07Test020
     * @tc.desc Verify new Int16Array(Array<int>) 100 ones length and endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [];
      for (let i = 0; i < 100; i++) {
        source.push(1);
      }
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.length;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(0);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(99);
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2100
     * @tc.name int16ArrayConstructorPart07Test021
     * @tc.desc Verify new Int16Array(Array<int>) 50 alternating 1 and -1 order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [];
      for (let i = 0; i < 50; i++) {
        source.push(i % 2 === 0 ? 1 : -1);
      }
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(48);
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(49);
      let expected4: int = -1;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2200
     * @tc.name int16ArrayConstructorPart07Test022
     * @tc.desc Verify new Int16Array(Array<int> [1, 2, 3]).length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2300
     * @tc.name int16ArrayConstructorPart07Test023
     * @tc.desc Verify new Int16Array(Array<int>) result is not same reference as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Any = new Int16Array(source);
      let isSameRef: boolean = result === source;
      expect(isSameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2400
     * @tc.name int16ArrayConstructorPart07Test024
     * @tc.desc Verify new Int16Array(Array<int>) seven elements length is 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3, 4, 5, 6, 7];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.length;
      let expected: int = 7;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2500
     * @tc.name int16ArrayConstructorPart07Test025
     * @tc.desc Verify new Int16Array(Array<int>) single element byteLength is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [42];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2600
     * @tc.name int16ArrayConstructorPart07Test026
     * @tc.desc Verify new Int16Array(Array<int>) five elements byteLength is 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3, 4, 5];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.byteLength;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2700
     * @tc.name int16ArrayConstructorPart07Test027
     * @tc.desc Verify new Int16Array(Array<int>) BYTES_PER_ELEMENT is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2800
     * @tc.name int16ArrayConstructorPart07Test028
     * @tc.desc Verify new Int16Array(Array<int>) byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__2900
     * @tc.name int16ArrayConstructorPart07Test029
     * @tc.desc Verify new Int16Array(Array<int> [1, 2, 3]) buffer.byteLength equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.buffer.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3000
     * @tc.name int16ArrayConstructorPart07Test030
     * @tc.desc Verify new Int16Array(Array<int>) buffer.byteLength equals result.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3, 4, 5];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.buffer.byteLength;
      let expected: number = result.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3100
     * @tc.name int16ArrayConstructorPart07Test031
     * @tc.desc Verify new Int16Array(Array<int>) for-loop values match source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [10, 20, 30, 40, 50];
      let result: Int16Array = new Int16Array(source);
      let allMatch: boolean = true;
      for (let i = 0; i < result.length; i++) {
        if (result.$_get(i) !== source[i]) {
          allMatch = false;
          break;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3200
     * @tc.name int16ArrayConstructorPart07Test032
     * @tc.desc Verify new Int16Array(Array<int>) $_set then $_get consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      result.$_set(0, 99);
      let actual: number = result.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3300
     * @tc.name int16ArrayConstructorPart07Test033
     * @tc.desc Verify new Int16Array(Array<int>) source push does not change result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      source.push(4);
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3400
     * @tc.name int16ArrayConstructorPart07Test034
     * @tc.desc Verify new Int16Array(Array<int>) source pop does not change result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3, 4, 5];
      let result: Int16Array = new Int16Array(source);
      source.pop();
      let actual: int = result.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3500
     * @tc.name int16ArrayConstructorPart07Test035
     * @tc.desc Verify new Int16Array(Array<int>) clearing source keeps result values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [10, 20, 30];
      let result: Int16Array = new Int16Array(source);
      source.length = 0;
      let actual: number = result.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3600
     * @tc.name int16ArrayConstructorPart07Test036
     * @tc.desc Verify new Int16Array(Array<int>) $_set does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      result.$_set(0, 999);
      let actual: number = source[0];
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3700
     * @tc.name int16ArrayConstructorPart07Test037
     * @tc.desc Verify new Int16Array(Array<int>) reverse does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      result.reverse();
      let actual: number = source[0];
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = source[2];
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3800
     * @tc.name int16ArrayConstructorPart07Test038
     * @tc.desc Verify new Int16Array(Array<int>) fill does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      result.fill(0);
      let actual: number = source[0];
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__3900
     * @tc.name int16ArrayConstructorPart07Test039
     * @tc.desc Verify new Int16Array(Array<int>) two constructions are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let arr1: Int16Array = new Int16Array(source);
      let arr2: Int16Array = new Int16Array(source);
      arr1.$_set(0, 99);
      let actual: number = arr2.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4000
     * @tc.name int16ArrayConstructorPart07Test040
     * @tc.desc Verify new Int16Array(Array<int>) two constructions use distinct buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let arr1: Int16Array = new Int16Array(source);
      let arr2: Int16Array = new Int16Array(source);
      let actual: boolean = arr1.buffer === arr2.buffer;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4100
     * @tc.name int16ArrayConstructorPart07Test041
     * @tc.desc Verify new Int16Array(Array<int>) out-of-range $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      try {
        result.$_get(-1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4200
     * @tc.name int16ArrayConstructorPart07Test042
     * @tc.desc Verify new Int16Array(Array<int>) out-of-range $_get(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      try {
        result.$_get(3);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4300
     * @tc.name int16ArrayConstructorPart07Test043
     * @tc.desc Verify new Int16Array(Array<int>) out-of-range $_set(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      try {
        result.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4400
     * @tc.name int16ArrayConstructorPart07Test044
     * @tc.desc Verify new Int16Array(Array<int>) Int8Array view on buffer length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2];
      let result: Int16Array = new Int16Array(source);
      let int8View: Int8Array = new Int8Array(result.buffer);
      let actual: int = int8View.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4500
     * @tc.name int16ArrayConstructorPart07Test045
     * @tc.desc Verify new Int16Array(Array<int>) $_set visible through Int8Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1];
      let result: Int16Array = new Int16Array(source);
      let int8View: Int8Array = new Int8Array(result.buffer);
      result.$_set(0, 513);
      let actual: number = int8View.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = int8View.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4600
     * @tc.name int16ArrayConstructorPart07Test046
     * @tc.desc Verify new Int16Array(Array<int>) Uint16Array view shares buffer length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [100, 200];
      let result: Int16Array = new Int16Array(source);
      let uint16View: Uint16Array = new Uint16Array(result.buffer);
      let actual: int = uint16View.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4700
     * @tc.name int16ArrayConstructorPart07Test047
     * @tc.desc Verify new Int16Array(Array<int>) Uint16Array view mutate wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [100];
      let result: Int16Array = new Int16Array(source);
      let uint16View: Uint16Array = new Uint16Array(result.buffer);
      uint16View.$_set(0, 65535);
      let actual: number = result.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4800
     * @tc.name int16ArrayConstructorPart07Test048
     * @tc.desc Verify new Int16Array(Array<int>) shared Int16Array buffer mutate propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      let shared: Int16Array = new Int16Array(result.buffer);
      shared.$_set(0, 99);
      let actual: number = result.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__4900
     * @tc.name int16ArrayConstructorPart07Test049
     * @tc.desc Verify new Int16Array(Array<int>) offset view shares buffer and mutates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [10, 20, 30, 40];
      let result: Int16Array = new Int16Array(source);
      let viewWithOffset: Int16Array = new Int16Array(result.buffer, 4);
      let actual: number = viewWithOffset.$_get(0);
      let expected: int = 30;
      expect(actual).assertEqual(expected);
      viewWithOffset.$_set(0, 99);
      let actual2: number = result.$_get(2);
      let expected2: int = 99;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5000
     * @tc.name int16ArrayConstructorPart07Test050
     * @tc.desc Verify new Int16Array(Array<int>) Int32Array view length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3, 4];
      let result: Int16Array = new Int16Array(source);
      let int32View: Int32Array = new Int32Array(result.buffer);
      let actual: int = int32View.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5100
     * @tc.name int16ArrayConstructorPart07Test051
     * @tc.desc Verify new Int16Array(Array<int>) little-endian store of 0x0102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [258];
      let result: Int16Array = new Int16Array(source);
      let int8View: Int8Array = new Int8Array(result.buffer);
      let actual: number = int8View.$_get(0);
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: number = int8View.$_get(1);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5200
     * @tc.name int16ArrayConstructorPart07Test052
     * @tc.desc Verify new Int16Array(Array<int>) little-endian store of -1 as 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [-1];
      let result: Int16Array = new Int16Array(source);
      let int8View: Int8Array = new Int8Array(result.buffer);
      let actual: number = int8View.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = int8View.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5300
     * @tc.name int16ArrayConstructorPart07Test053
     * @tc.desc Verify new Int16Array(Array<int>) wrap is independent per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [32768, 32768];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5400
     * @tc.name int16ArrayConstructorPart07Test054
     * @tc.desc Verify new Int16Array(Array<int>) typical boundary values preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [-32768, -1, 0, 1, 32767];
      let result: Int16Array = new Int16Array(source);
      let actual: number = result.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = 1;
      expect(actual4).assertEqual(expected4);
      let actual5: number = result.$_get(4);
      let expected5: int = 32767;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5500
     * @tc.name int16ArrayConstructorPart07Test055
     * @tc.desc Verify new Int16Array(Array<int>) sort works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [3, 1, 2];
      let result: Int16Array = new Int16Array(source);
      result.sort();
      let actual: number = result.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 3;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5600
     * @tc.name int16ArrayConstructorPart07Test056
     * @tc.desc Verify new Int16Array(Array<int>) subarray works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [10, 20, 30, 40, 50];
      let result: Int16Array = new Int16Array(source);
      let sub: Int16Array = result.subarray(1, 4);
      let actual: int = sub.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = sub.$_get(0);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5700
     * @tc.name int16ArrayConstructorPart07Test057
     * @tc.desc Verify new Int16Array(Array<int>) single MAX length and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [32767];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(0);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5800
     * @tc.name int16ArrayConstructorPart07Test058
     * @tc.desc Verify new Int16Array(Array<int>) single MIN length and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [-32768];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(0);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__5900
     * @tc.name int16ArrayConstructorPart07Test059
     * @tc.desc Verify new Int16Array(Array<int>) result can construct another Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let arr1: Int16Array = new Int16Array(source);
      let arr2: Int16Array = new Int16Array(arr1);
      let actual: number = arr2.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr2.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr2.$_get(2);
      let expected3: int = 3;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__6000
     * @tc.name int16ArrayConstructorPart07Test060
     * @tc.desc Verify new Int16Array(Array<int>) values() iterator first element is 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [10, 20, 30];
      let result: Int16Array = new Int16Array(source);
      let iter: IterableIterator<number> = result.values();
      let first: IteratorResult<number> = iter.next();
      let actual = first.value!;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__6100
     * @tc.name int16ArrayConstructorPart07Test061
     * @tc.desc Verify new Int16Array(Array<int>) forEach sums all elements to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3];
      let result: Int16Array = new Int16Array(source);
      let sum: number = 0;
      result.forEach((value: number) => {
        sum = sum + value;
      });
      let actual: number = sum;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__6200
     * @tc.name int16ArrayConstructorPart07Test062
     * @tc.desc Verify new Int16Array(Array<int>) four large overflows stay in int16 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [50000, 60000, -50000, -60000];
      let result: Int16Array = new Int16Array(source);
      let element0: number = result.$_get(0);
      let element1: number = result.$_get(1);
      let element2: number = result.$_get(2);
      let element3: number = result.$_get(3);
      let actual: boolean = element0 >= -32768 && element0 <= 32767;
      expect(actual).assertTrue();
      let actual2: boolean = element1 >= -32768 && element1 <= 32767;
      expect(actual2).assertTrue();
      let actual3: boolean = element2 >= -32768 && element2 <= 32767;
      expect(actual3).assertTrue();
      let actual4: boolean = element3 >= -32768 && element3 <= 32767;
      expect(actual4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART07__6300
     * @tc.name int16ArrayConstructorPart07Test063
     * @tc.desc Verify new Int16Array(Array<int>) buffer.byteLength is length times 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart07Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<int> = [1, 2, 3, 4, 5, 6, 7];
      let result: Int16Array = new Int16Array(source);
      let actual: int = result.buffer.byteLength;
      let expected: int = 14;
      expect(actual).assertEqual(expected);
    });

  });
}
