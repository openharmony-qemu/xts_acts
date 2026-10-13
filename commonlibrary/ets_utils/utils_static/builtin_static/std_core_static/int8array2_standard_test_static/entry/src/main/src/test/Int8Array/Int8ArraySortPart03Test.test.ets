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

class SortCompareError003 extends Error {
  constructor(msg: string) {
    super(msg);
    this.name = 'SortCompareError003';
  }
}

export default function int8ArraySortPart03Test(): void {
  describe('Int8ArraySortPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0100
     * @tc.name int8ArraySortPart03Test001
     * @tc.desc Verify sort compareFn 0x7fffffff (2147483647) -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: number = -0x7fffffff;
      let neg: number = 0x7fffffff;
      let arr = new Int8Array([3, 1, 2]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return neg.toInt();
        }
        if (a < b) {
          return pos.toInt();
        }
        return 0;
      });
      let lengthAfter: int = arr.length;
      let expected1: int = 3;
      expect(lengthAfter).assertEqual(expected1);
      let firstValue: number = arr.$_get(0);
      let expected2: int = 1;
      expect(firstValue).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 3;
      expect(elementAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0200
     * @tc.name int8ArraySortPart03Test002
     * @tc.desc Verify sort compareFn -0x7fffffff (-2147483647) constant negative reverses order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = -0x7fffffff;
      let arr = new Int8Array([4, 1, 3, 2]);
      arr.sort((a: number, b: number): int => {
        return val.toInt();
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 2;
      expect(firstValue).assertEqual(expected1);
      let elementAt3: number = arr.$_get(3);
      let expected2: int = 4;
      expect(elementAt3).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0300
     * @tc.name int8ArraySortPart03Test003
     * @tc.desc Verify sort compareFn 100 -100 ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: number = -100;
      let neg: number = 100;
      let arr = new Int8Array([5, 2, 8, 1]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return neg.toInt();
        }
        if (a < b) {
          return pos.toInt();
        }
        return 0;
      });
      let lengthAfter: int = arr.length;
      let expected1: int = 4;
      expect(lengthAfter).assertEqual(expected1);
      let firstValue: number = arr.$_get(0);
      let expected2: int = 1;
      expect(firstValue).assertEqual(expected2);
      let elementAt3: number = arr.$_get(3);
      let expected3: int = 8;
      expect(elementAt3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0400
     * @tc.name int8ArraySortPart03Test004
     * @tc.desc Verify sort compareFn -100 100 descending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: number = -100;
      let neg: number = 100;
      let arr = new Int8Array([6, 1, 3]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return pos.toInt();
        }
        if (a < b) {
          return neg.toInt();
        }
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 6;
      expect(firstValue).assertEqual(expected1);
      let elementAt2: number = arr.$_get(2);
      let expected2: int = 1;
      expect(elementAt2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0500
     * @tc.name int8ArraySortPart03Test005
     * @tc.desc Verify sort compareFn 0x7FFFFFFF (2147483647) int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: number = 0x7fffffff;
      let neg: number = -0x7fffffff;
      let arr = new Int8Array([9, 4, 7, 2]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return pos.toInt();
        }
        if (a < b) {
          return neg.toInt();
        }
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 2;
      expect(firstValue).assertEqual(expected1);
      let elementAt3: number = arr.$_get(3);
      let expected2: int = 9;
      expect(elementAt3).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0600
     * @tc.name int8ArraySortPart03Test006
     * @tc.desc Verify compareFn large overflow wraps and still positive, ascending sort works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: number = 0x100000001;
      let neg: number = -0x100000001;
      let arr = new Int8Array([7, 2, 5, 1, 9]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return pos.toInt();
        }
        if (a < b) {
          return neg.toInt();
        }
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let elementAt4: number = arr.$_get(4);
      let expected2: int = 9;
      expect(elementAt4).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0700
     * @tc.name int8ArraySortPart03Test007
     * @tc.desc Verify sort compareFn 0x7fffffff (2147483647) constant positive keeps original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0x7fffffff;
      let arr = new Int8Array([3, 8, 1, 6, 2]);
      arr.sort((a: number, b: number): int => {
        return val.toInt();
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 3;
      expect(firstValue).assertEqual(expected1);
      let elementAt2: number = arr.$_get(2);
      let expected2: int = 1;
      expect(elementAt2).assertEqual(expected2);
      let elementAt4: number = arr.$_get(4);
      let expected3: int = 2;
      expect(elementAt4).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0800
     * @tc.name int8ArraySortPart03Test008
     * @tc.desc Verify compareFn tiny float truncated to 0, machine precision does not trigger sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 1e-10;
      let arr = new Int8Array([10, 30, 20]);
      arr.sort((a: number, b: number): int => {
        return val.toInt();
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: int = 30;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 20;
      expect(elementAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_0900
     * @tc.name int8ArraySortPart03Test009
     * @tc.desc Verify sort compareFn orders mixed values including equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8, 3, 8, 1, 8]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : 1;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: int = 3;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 8;
      expect(elementAt2).assertEqual(expected3);
      let elementAt4: number = arr.$_get(4);
      let expected4: int = 8;
      expect(elementAt4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1000
     * @tc.name int8ArraySortPart03Test010
     * @tc.desc Verify sort INT8_MIN with mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, INT8_MIN, 1]);
      arr.sort();
      let firstValue: number = arr.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: int = 0;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 1;
      expect(elementAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1100
     * @tc.name int8ArraySortPart03Test011
     * @tc.desc Verify sort INT8_MAX with mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 0, INT8_MIN, 1]);
      arr.sort();
      let firstValue: number = arr.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: int = 0;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 1;
      expect(elementAt2).assertEqual(expected3);
      let elementAt3: number = arr.$_get(3);
      let expected4: number = INT8_MAX;
      expect(elementAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1200
     * @tc.name int8ArraySortPart03Test012
     * @tc.desc Verify sort compareFn returning 0 keeps original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([6, 2, 8, 4]);
      arr.sort((a: number, b: number): int => {
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 6;
      expect(firstValue).assertEqual(expected1);
      let elementAt3: number = arr.$_get(3);
      let expected2: int = 4;
      expect(elementAt3).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1300
     * @tc.name int8ArraySortPart03Test013
     * @tc.desc Verify sort compareFn constant one keeps length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 7, 1, 9, 2]);
      arr.sort((a: number, b: number): int => {
        return 1;
      });
      let lengthAfter: int = arr.length;
      let expected1: int = 5;
      expect(lengthAfter).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1400
     * @tc.name int8ArraySortPart03Test014
     * @tc.desc Verify sort compareFn -1 () sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([4, 2, 8, 6]);
      arr.sort((a: number, b: number): int => {
        return -1;
      });
      let sumAfter: number = arr.$_get(0) + arr.$_get(1) + arr.$_get(2) + arr.$_get(3);
      let expectedSum: number = 20;
      expect(sumAfter).assertEqual(expectedSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1500
     * @tc.name int8ArraySortPart03Test015
     * @tc.desc Verify sort compareFn alternating one minus one keeps length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toggle: boolean = true;
      let arr = new Int8Array([5, 3, 8, 1, 7, 2]);
      arr.sort((a: number, b: number): int => {
        toggle = !toggle;
        return toggle ? 1 : -1;
      });
      let lengthAfter: int = arr.length;
      let expected1: int = 6;
      expect(lengthAfter).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1600
     * @tc.name int8ArraySortPart03Test016
     * @tc.desc Verify sort compareFn returning 0 still invoked for 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      let arr = new Int8Array([9, 3, 7, 1, 5]);
      arr.sort((a: number, b: number): int => {
        callCount++;
        return 0;
      });
      let fnCalled: boolean = callCount > 0;
      expect(fnCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1700
     * @tc.name int8ArraySortPart03Test017
     * @tc.desc Verify sort() keeps length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 2, 9, 4, 1]);
      arr.sort();
      let lengthAfter: int = arr.length;
      let expected1: int = 5;
      expect(lengthAfter).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1800
     * @tc.name int8ArraySortPart03Test018
     * @tc.desc Verify sort() keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8, 3, 6, 1]);
      let blBefore: int = arr.byteLength;
      arr.sort();
      let byteLengthAfter: int = arr.byteLength;
      let expected1: number = blBefore;
      expect(byteLengthAfter).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_1900
     * @tc.name int8ArraySortPart03Test019
     * @tc.desc Verify sort() keeps buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 1, 4, 2, 3]);
      let bufBefore = arr.buffer;
      arr.sort();
      let bufferAfter: ArrayBuffer = arr.buffer;
      let expected1: ArrayBuffer = bufBefore;
      expect(bufferAfter).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2000
     * @tc.name int8ArraySortPart03Test020
     * @tc.desc Verify sort() keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int8Array(buf, 3, 5);
      arr.$_set(0, 9);
      arr.$_set(1, 2);
      arr.$_set(2, 7);
      arr.$_set(3, 1);
      arr.$_set(4, 5);
      let offBefore: int = arr.byteOffset;
      arr.sort();
      let byteOffsetAfter: int = arr.byteOffset;
      let expected1: number = offBefore;
      expect(byteOffsetAfter).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2100
     * @tc.name int8ArraySortPart03Test021
     * @tc.desc Verify sort() preserves element sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 7, 1, 9, 4, 2]);
      let sumBefore: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sumBefore = sumBefore + arr.$_get(i);
      }
      arr.sort();
      let sumAfter: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sumAfter = sumAfter + arr.$_get(i);
      }
      expect(sumAfter).assertEqual(sumBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2200
     * @tc.name int8ArraySortPart03Test022
     * @tc.desc Verify sort [127, -128, -1, 1] [-128, -1, 1, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN, -1, 1]);
      arr.sort();
      let firstValue: number = arr.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: int = -1;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 1;
      expect(elementAt2).assertEqual(expected3);
      let elementAt3: number = arr.$_get(3);
      let expected4: number = INT8_MAX;
      expect(elementAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2300
     * @tc.name int8ArraySortPart03Test023
     * @tc.desc Verify sort [2, 1, 2, 1] [1, 1, 2, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1, 2, 1]);
      arr.sort();
      let firstValue: number = arr.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: int = 1;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 2;
      expect(elementAt2).assertEqual(expected3);
      let elementAt3: number = arr.$_get(3);
      let expected4: int = 2;
      expect(elementAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2400
     * @tc.name int8ArraySortPart03Test024
     * @tc.desc Verify sort [-1, -2, -3] [-3, -2, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, -2, -3]);
      arr.sort();
      let firstValue: number = arr.$_get(0);
      let expected1: int = -3;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: int = -2;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = -1;
      expect(elementAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2500
     * @tc.name int8ArraySortPart03Test025
     * @tc.desc Verify sort [127, 0, -128, 1, -1] [-128, -1, 0, 1, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 0, INT8_MIN, 1, -1]);
      arr.sort();
      let firstValue: number = arr.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: int = -1;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 0;
      expect(elementAt2).assertEqual(expected3);
      let elementAt3: number = arr.$_get(3);
      let expected4: int = 1;
      expect(elementAt3).assertEqual(expected4);
      let elementAt4: number = arr.$_get(4);
      let expected5: number = INT8_MAX;
      expect(elementAt4).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2600
     * @tc.name int8ArraySortPart03Test026
     * @tc.desc Verify sort [127, 127, -128, -128, 0] [-128, -128, 0, 127, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MAX, INT8_MIN, INT8_MIN, 0]);
      arr.sort();
      let firstValue: number = arr.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let elementAt1: number = arr.$_get(1);
      let expected2: number = INT8_MIN;
      expect(elementAt1).assertEqual(expected2);
      let elementAt2: number = arr.$_get(2);
      let expected3: int = 0;
      expect(elementAt2).assertEqual(expected3);
      let elementAt3: number = arr.$_get(3);
      let expected4: number = INT8_MAX;
      expect(elementAt3).assertEqual(expected4);
      let elementAt4: number = arr.$_get(4);
      let expected5: number = INT8_MAX;
      expect(elementAt4).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2700
     * @tc.name int8ArraySortPart03Test027
     * @tc.desc Verify sort compareFn a element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedA: number = 0;
      let arr = new Int8Array([42, 17]);
      arr.sort((a: number, b: number): int => {
        capturedA = a;
        return a < b ? -1 : 1;
      });
      let lengthAfter: int = arr.length;
      let expected1: int = 2;
      expect(lengthAfter).assertEqual(expected1);
      let aIsElement: boolean = capturedA === 42 || capturedA === 17;
      expect(aIsElement).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2800
     * @tc.name int8ArraySortPart03Test028
     * @tc.desc Verify sort compareFn b element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedB: number = 0;
      let arr = new Int8Array([33, 77]);
      arr.sort((a: number, b: number): int => {
        capturedB = b;
        return a < b ? -1 : 1;
      });
      let lengthAfter: int = arr.length;
      let expected1: int = 2;
      expect(lengthAfter).assertEqual(expected1);

      let bIsElement: boolean = capturedB === 33 || capturedB === 77;
      expect(bIsElement).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_2900
     * @tc.name int8ArraySortPart03Test029
     * @tc.desc Verify sort compareFn a b ()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let equalSeen: boolean = false;
      let arr = new Int8Array([5, 5, 5]);
      arr.sort((a: number, b: number): int => {
        if (a === b) {
          equalSeen = true;
        }
        return 0;
      });
      expect(equalSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3000
     * @tc.name int8ArraySortPart03Test030
     * @tc.desc Verify sort compareFn 0 () when -1, when 1, when 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      let arr = new Int8Array([9, 4, 7, 2, 5, 1, 8, 3]);
      arr.sort((a: number, b: number): int => {
        callCount++;
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      let fnCalled: boolean = callCount > 0;
      expect(fnCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3100
     * @tc.name int8ArraySortPart03Test031
     * @tc.desc Verify sort compareFn using factor-scaled difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factor: number = 1;
      let arr = new Int8Array([3, 1, 2]);
      arr.sort((a: number, b: number): int => {
        if ((a - b) * factor < 0) {
          return -1;
        }
        if ((a - b) * factor > 0) {
          return 1;
        }
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3200
     * @tc.name int8ArraySortPart03Test032
     * @tc.desc Verify sort compareFn invoked with side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sideEffect: int = 0;
      let arr = new Int8Array([4, 2, 8, 6]);
      arr.sort((a: number, b: number): int => {
        sideEffect++;
        return a < b ? -1 : 1;
      });
      let hasSideEffect: boolean = sideEffect > 0;
      expect(hasSideEffect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3300
     * @tc.name int8ArraySortPart03Test033
     * @tc.desc Verify sort compareFn ascending first 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 3, 5, 1]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : 1;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3400
     * @tc.name int8ArraySortPart03Test034
     * @tc.desc Verify sort compareFn 0 () when 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 4, 1, 5]);
      arr.$_set(0, 9);
      arr.$_set(1, 9);
      arr.$_set(2, 9);
      arr.sort((a: number, b: number): int => {
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 9;
      expect(firstValue).assertEqual(expected1);
      let elementAt2: number = arr.$_get(2);
      let expected2: int = 9;
      expect(elementAt2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3500
     * @tc.name int8ArraySortPart03Test035
     * @tc.desc Verify sort compareFn with fractional scaling sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 50, 20, 40, 30]);
      arr.sort((a: number, b: number): int => {
        if ((a - b) * 0.5 > 0) {
          return (1.7).toInt();
        }
        if ((a - b) * 0.5 < 0) {
          return (-1.7).toInt();
        }
        return (0.3).toInt();
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 10;
      expect(firstValue).assertEqual(expected1);
      let elementAt4: number = arr.$_get(4);
      let expected2: int = 50;
      expect(elementAt4).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3600
     * @tc.name int8ArraySortPart03Test036
     * @tc.desc Verify sort compareFn 0.5 0 0.6 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8, 3, 6, 1, 9, 2]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return (0.5).toInt();
        }
        if (a < b) {
          return (0.6).toInt();
        }
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 8;
      expect(firstValue).assertEqual(expected1);
      let elementAt5: number = arr.$_get(5);
      let expected2: int = 2;
      expect(elementAt5).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3700
     * @tc.name int8ArraySortPart03Test037
     * @tc.desc Verify sort compareFn 5 -5 ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([4, 1, 3, 2]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return (5).toInt();
        }
        if (a < b) {
          return (-5).toInt();
        }
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let elementAt3: number = arr.$_get(3);
      let expected2: int = 4;
      expect(elementAt3).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3800
     * @tc.name int8ArraySortPart03Test038
     * @tc.desc Verify sort default ascending order on 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([15, 3, 27, 8, 19]);
      arr.sort();
      let firstValue: number = arr.$_get(0);
      let expected1: int = 3;
      expect(firstValue).assertEqual(expected1);
      let elementAt4: number = arr.$_get(4);
      let expected2: int = 27;
      expect(elementAt4).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_3900
     * @tc.name int8ArraySortPart03Test039
     * @tc.desc Verify sort with descending comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([12, 45, 7, 33, 21]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return -1;
        }
        if (a < b) {
          return 1;
        }
        return 0;
      });
      let firstValue: number = arr.$_get(0);
      let expected1: int = 45;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART03_TEST_4000
     * @tc.name int8ArraySortPart03Test040
     * @tc.desc Verify sort default sets the median at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([30, 10, 50, 20, 40]);
      arr.sort();
      let elementAt2: number = arr.$_get(2);
      let expected1: int = 30;
      expect(elementAt2).assertEqual(expected1);
    });
  });
}
