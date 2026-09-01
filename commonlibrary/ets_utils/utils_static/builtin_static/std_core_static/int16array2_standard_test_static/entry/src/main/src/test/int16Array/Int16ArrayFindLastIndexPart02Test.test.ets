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

export default function int16ArrayFindLastIndexPart02Test(): void {
  describe("Int16ArrayFindLastIndexPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0100
     * @tc.name int16ArrayFindLastIndexPart02Test001
     * @tc.desc Verify findLastIndex returns index 1 when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 20;
      });
      let actual: int = result;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0200
     * @tc.name int16ArrayFindLastIndexPart02Test002
     * @tc.desc Verify findLastIndex result is finite when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9]);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 6;
      });
      let isFinite: boolean = (result < Number.POSITIVE_INFINITY && result > -Number.POSITIVE_INFINITY);
      expect(isFinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0300
     * @tc.name int16ArrayFindLastIndexPart02Test003
     * @tc.desc Verify findLastIndex result is finite when returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 0;
      });
      let isFinite: boolean = (result < Number.POSITIVE_INFINITY && result > -Number.POSITIVE_INFINITY);
      expect(isFinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0400
     * @tc.name int16ArrayFindLastIndexPart02Test004
     * @tc.desc Verify findLastIndex on large array returns length-1 for last match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      arr.$_set(99 as int, 999);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 999;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0500
     * @tc.name int16ArrayFindLastIndexPart02Test005
     * @tc.desc Verify findLastIndex on large array returns 0 when only first matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      arr.$_set(0 as int, 888);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 888;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0600
     * @tc.name int16ArrayFindLastIndexPart02Test006
     * @tc.desc Verify findLastIndex result is within [0, length-1] when found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([15, 30, 45, 60]);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 45;
      });
      let inRange: boolean = (result >= 0 && result < arr.length);
      expect(inRange).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0700
     * @tc.name int16ArrayFindLastIndexPart02Test007
     * @tc.desc Verify findLastIndex result is exactly -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9, 12]);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 0;
      });
      let isNegOne: boolean = (result === -1);
      expect(isNegOne).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0800
     * @tc.name int16ArrayFindLastIndexPart02Test008
     * @tc.desc Verify findLastIndex result is not -1 when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([22, 44, 66]);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 44;
      });
      let notNegOne: boolean = (result !== -1);
      expect(notNegOne).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__0900
     * @tc.name int16ArrayFindLastIndexPart02Test009
     * @tc.desc Verify findLastIndex does not change array length when found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let lenBefore: number = arr.length;
      arr.findLastIndex((value: number): boolean => {
        return value === 3;
      });
      let actual: int = arr.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1000
     * @tc.name int16ArrayFindLastIndexPart02Test010
     * @tc.desc Verify findLastIndex does not change array length when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let lenBefore: number = arr.length;
      arr.findLastIndex((value: number): boolean => {
        return value === 999;
      });
      let actual: int = arr.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1100
     * @tc.name int16ArrayFindLastIndexPart02Test011
     * @tc.desc Verify findLastIndex on empty array keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      arr.findLastIndex((value: number): boolean => {
        return value === 1;
      });
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1200
     * @tc.name int16ArrayFindLastIndexPart02Test012
     * @tc.desc Verify findLastIndex on single-element array keeps length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7]);
      arr.findLastIndex((value: number): boolean => {
        return value === 7;
      });
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1300
     * @tc.name int16ArrayFindLastIndexPart02Test013
     * @tc.desc Verify findLastIndex on large array does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(50);
      let lenBefore: number = arr.length;
      arr.findLastIndex((value: number): boolean => {
        return value === 1;
      });
      let actual: int = arr.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1400
     * @tc.name int16ArrayFindLastIndexPart02Test014
     * @tc.desc Verify findLastIndex does not mutate elements when found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44]);
      arr.findLastIndex((value: number): boolean => {
        return value === 22;
      });
      let actual: number = arr.$_get(0 as int);
      let expected: int = 11;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1 as int);
      let expected2: int = 22;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2 as int);
      let expected3: int = 33;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3 as int);
      let expected4: int = 44;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1500
     * @tc.name int16ArrayFindLastIndexPart02Test015
     * @tc.desc Verify findLastIndex does not mutate elements when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 15, 25, 35]);
      arr.findLastIndex((value: number): boolean => {
        return value === 0;
      });
      let actual: number = arr.$_get(0 as int);
      let expected: int = 5;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1 as int);
      let expected2: int = 15;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2 as int);
      let expected3: int = 25;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3 as int);
      let expected4: int = 35;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1600
     * @tc.name int16ArrayFindLastIndexPart02Test016
     * @tc.desc Verify findLastIndex result index still holds original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([40, 50, 60]);
      let result: int = arr.findLastIndex((value: number): boolean => {
        return value === 50;
      });
      let originalValue: number = 50;
      let actual: number = arr.$_get(result);
      let expected: number = originalValue;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1700
     * @tc.name int16ArrayFindLastIndexPart02Test017
     * @tc.desc Verify findLastIndex keeps first element value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([23, 46, 69]);
      arr.findLastIndex((value: number): boolean => {
        return value === 46;
      });
      let actual: number = arr.$_get(0 as int);
      let expected: int = 23;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1800
     * @tc.name int16ArrayFindLastIndexPart02Test018
     * @tc.desc Verify findLastIndex keeps last element value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 8]);
      arr.findLastIndex((value: number): boolean => {
        return value === 4;
      });
      let actual: number = arr.$_get(2 as int);
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__1900
     * @tc.name int16ArrayFindLastIndexPart02Test019
     * @tc.desc Verify findLastIndex keeps zero elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 100, 0, 200]);
      arr.findLastIndex((value: number): boolean => {
        return value === 100;
      });
      let actual: number = arr.$_get(0 as int);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2 as int);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2000
     * @tc.name int16ArrayFindLastIndexPart02Test020
     * @tc.desc Verify findLastIndex keeps MAX 32767 elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let arr: Int16Array = new Int16Array([val, 1, val]);
      arr.findLastIndex((value: number): boolean => {
        return value === 1;
      });
      let actual: number = arr.$_get(0 as int);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2 as int);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2100
     * @tc.name int16ArrayFindLastIndexPart02Test021
     * @tc.desc Verify findLastIndex keeps MIN -32768 elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      let arr: Int16Array = new Int16Array([val, 50, val]);
      arr.findLastIndex((value: number): boolean => {
        return value === 50;
      });
      let actual: number = arr.$_get(0 as int);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2 as int);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2200
     * @tc.name int16ArrayFindLastIndexPart02Test022
     * @tc.desc Verify findLastIndex keeps negative elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-5, -10, 20, -15]);
      arr.findLastIndex((value: number): boolean => {
        return value === 20;
      });
      let actual: number = arr.$_get(0 as int);
      let expected: int = -5;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1 as int);
      let expected2: int = -10;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3 as int);
      let expected3: int = -15;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2300
     * @tc.name int16ArrayFindLastIndexPart02Test023
     * @tc.desc Verify findLastIndex keeps non-match between matches unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 99, 7]);
      arr.findLastIndex((value: number): boolean => {
        return value === 7;
      });
      let actual: number = arr.$_get(1 as int);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2400
     * @tc.name int16ArrayFindLastIndexPart02Test024
     * @tc.desc Verify findLastIndex does not change byteLength when found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let blBefore: number = arr.byteLength;
      arr.findLastIndex((value: number): boolean => {
        return value === 3;
      });
      let actual: int = arr.byteLength;
      let expected: number = blBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2500
     * @tc.name int16ArrayFindLastIndexPart02Test025
     * @tc.desc Verify findLastIndex does not change byteLength when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([8, 16, 24]);
      let blBefore: number = arr.byteLength;
      arr.findLastIndex((value: number): boolean => {
        return value === 0;
      });
      let actual: int = arr.byteLength;
      let expected: number = blBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2600
     * @tc.name int16ArrayFindLastIndexPart02Test026
     * @tc.desc Verify findLastIndex keeps byteLength equal to length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9, 12, 15]);
      arr.findLastIndex((value: number): boolean => {
        return value === 6;
      });
      let actual: int = arr.byteLength;
      let expected: number = arr.length * 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2700
     * @tc.name int16ArrayFindLastIndexPart02Test027
     * @tc.desc Verify findLastIndex does not change byteOffset when found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let boBefore: number = arr.byteOffset;
      arr.findLastIndex((value: number): boolean => {
        return value === 20;
      });
      let actual: int = arr.byteOffset;
      let expected: number = boBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2800
     * @tc.name int16ArrayFindLastIndexPart02Test028
     * @tc.desc Verify findLastIndex does not change byteOffset when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 15, 25]);
      let boBefore: number = arr.byteOffset;
      arr.findLastIndex((value: number): boolean => {
        return value === 99;
      });
      let actual: int = arr.byteOffset;
      let expected: number = boBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__2900
     * @tc.name int16ArrayFindLastIndexPart02Test029
     * @tc.desc Verify findLastIndex keeps direct-constructed array byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([4, 8, 12]);
      arr.findLastIndex((value: number): boolean => {
        return value === 8;
      });
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3000
     * @tc.name int16ArrayFindLastIndexPart02Test030
     * @tc.desc Verify findLastIndex keeps buffer object reference when found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.findLastIndex((value: number): boolean => {
        return value === 2;
      });
      let actual: boolean = arr.buffer === bufBefore;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3100
     * @tc.name int16ArrayFindLastIndexPart02Test031
     * @tc.desc Verify findLastIndex keeps buffer.byteLength when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let bufBlBefore: number = arr.buffer.byteLength;
      arr.findLastIndex((value: number): boolean => {
        return value === 0;
      });
      let actual: int = arr.buffer.byteLength;
      let expected: number = bufBlBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3200
     * @tc.name int16ArrayFindLastIndexPart02Test032
     * @tc.desc Verify findLastIndex keeps buffer data readable via new view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      arr.findLastIndex((value: number): boolean => {
        return value === 200;
      });
      let view: Int16Array = new Int16Array(arr.buffer);
      let actual: number = view.$_get(0 as int);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = view.$_get(1 as int);
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
      let actual3: number = view.$_get(2 as int);
      let expected3: int = 300;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3300
     * @tc.name int16ArrayFindLastIndexPart02Test033
     * @tc.desc Verify findLastIndex on subarray returns index relative to subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let sub: Int16Array = src.subarray(1, 4);
      let result: int = sub.findLastIndex((value: number): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3400
     * @tc.name int16ArrayFindLastIndexPart02Test034
     * @tc.desc Verify findLastIndex on subarray returns -1 for out-of-view values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([5, 15, 25, 35, 45]);
      let sub: Int16Array = src.subarray(0, 2);
      let result: int = sub.findLastIndex((value: number): boolean => {
        return value === 25;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3500
     * @tc.name int16ArrayFindLastIndexPart02Test035
     * @tc.desc Verify findLastIndex on subarray does not change subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let sub: Int16Array = src.subarray(2, 5);
      let boBefore: number = sub.byteOffset;
      sub.findLastIndex((value: number): boolean => {
        return value === 3;
      });
      let actual: int = sub.byteOffset;
      let expected: number = boBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3600
     * @tc.name int16ArrayFindLastIndexPart02Test036
     * @tc.desc Verify findLastIndex on subarray does not mutate source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([8, 16, 24, 32, 40]);
      let sub: Int16Array = src.subarray(1, 3);
      sub.findLastIndex((value: number): boolean => {
        return value === 24;
      });
      let actual: number = src.$_get(0 as int);
      let expected: int = 8;
      expect(actual).assertEqual(expected);
      let actual2: number = src.$_get(1 as int);
      let expected2: int = 16;
      expect(actual2).assertEqual(expected2);
      let actual3: number = src.$_get(2 as int);
      let expected3: int = 24;
      expect(actual3).assertEqual(expected3);
      let actual4: number = src.$_get(3 as int);
      let expected4: int = 32;
      expect(actual4).assertEqual(expected4);
      let actual5: number = src.$_get(4 as int);
      let expected5: int = 40;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3700
     * @tc.name int16ArrayFindLastIndexPart02Test037
     * @tc.desc Verify findLastIndex on subarray returns last in-subarray match index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([7, 7, 7, 7, 7]);
      let sub: Int16Array = src.subarray(1, 4);
      let result: int = sub.findLastIndex((value: number): boolean => {
        return value === 7;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3800
     * @tc.name int16ArrayFindLastIndexPart02Test038
     * @tc.desc Verify findLastIndex on subarray does not change subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([3, 6, 9, 12, 15, 18]);
      let sub: Int16Array = src.subarray(2);
      let lenBefore: number = sub.length;
      sub.findLastIndex((value: number): boolean => {
        return value === 12;
      });
      let actual: int = sub.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__3900
     * @tc.name int16ArrayFindLastIndexPart02Test039
     * @tc.desc Verify findLastIndex called twice with same predicate returns same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([14, 28, 42, 28]);
      let r1: int = arr.findLastIndex((value: number): boolean => {
        return value === 28;
      });
      let r2: int = arr.findLastIndex((value: number): boolean => {
        return value === 28;
      });
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__4000
     * @tc.name int16ArrayFindLastIndexPart02Test040
     * @tc.desc Verify findLastIndex with different predicates returns independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([6, 12, 6, 18]);
      let r1: int = arr.findLastIndex((value: number): boolean => {
        return value === 6;
      });
      let r2: int = arr.findLastIndex((value: number): boolean => {
        return value === 12;
      });
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__4100
     * @tc.name int16ArrayFindLastIndexPart02Test041
     * @tc.desc Verify findLastIndex result remains valid after indexOf call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([9, 18, 27]);
      let r1: int = arr.findLastIndex((value: number): boolean => {
        return value === 18;
      });
      let r2: int = arr.indexOf(27);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__4200
     * @tc.name int16ArrayFindLastIndexPart02Test042
     * @tc.desc Verify findLastIndex repeated on all-equal array returns same last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([55, 55, 55]);
      let r1: int = arr.findLastIndex((value: number): boolean => {
        return value === 55;
      });
      let r2: int = arr.findLastIndex((value: number): boolean => {
        return value === 55;
      });
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__4300
     * @tc.name int16ArrayFindLastIndexPart02Test043
     * @tc.desc Verify sequential findLastIndex with different predicates do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 2, 6]);
      let r1: int = arr.findLastIndex((value: number): boolean => {
        return value === 2;
      });
      let r2: int = arr.findLastIndex((value: number): boolean => {
        return value === 6;
      });
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__4400
     * @tc.name int16ArrayFindLastIndexPart02Test044
     * @tc.desc Verify findLastIndex using array parameter still returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 15, 25]);
      let result: int = arr.findLastIndex((_value: number, _index: int, array: Int16Array): boolean => {
        return array.$_get(0 as int) === 5;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__4500
     * @tc.name int16ArrayFindLastIndexPart02Test045
     * @tc.desc Verify findLastIndex combining index and value parameters returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9, 12]);
      let result: int = arr.findLastIndex((value: number, index: int): boolean => {
        return value === arr.$_get(index);
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART02__4600
     * @tc.name int16ArrayFindLastIndexPart02Test046
     * @tc.desc Verify findLastIndex using array.length predicate returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let result: int = arr.findLastIndex((_value: number, _index: int, array: Int16Array): boolean => {
        return array.length > 0;
      });
      expect(result).assertEqual(2);
    });

  });
}
