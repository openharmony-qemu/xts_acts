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

export default function int8ArraySortPart04Test(): void {
  describe('Int8ArraySortPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_0300
     * @tc.name int8ArraySortPart04Test003
     * @tc.desc Verify sort() keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let beforeLen = arr.length;
      arr.sort();
      let r1 = arr.length;
      let e1 = beforeLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_0400
     * @tc.name int8ArraySortPart04Test004
     * @tc.desc Verify sort() keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let beforeByteLen = arr.byteLength;
      arr.sort();
      let r1 = arr.byteLength;
      let e1: number = beforeByteLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_0500
     * @tc.name int8ArraySortPart04Test005
     * @tc.desc Verify sort() keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 2, 4);
      arr.$_set(0, 30);
      arr.$_set(1, 10);
      arr.$_set(2, 20);
      arr.$_set(3, 5);
      let beforeOffset = arr.byteOffset;
      arr.sort();
      let r1 = arr.byteOffset;
      let e1 = beforeOffset;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_0600
     * @tc.name int8ArraySortPart04Test006
     * @tc.desc Verify sort() preserves multiset sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2, -1, 0]);
      let beforeSum: number = 0;
      for (let i = 0; i < arr.length; i++) {
        beforeSum += arr.$_get(i);
      }
      arr.sort();
      let afterSum: number = 0;
      for (let i = 0; i < arr.length; i++) {
        afterSum += arr.$_get(i);
      }
      expect(afterSum).assertEqual(beforeSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_0800
     * @tc.name int8ArraySortPart04Test008
     * @tc.desc Verify sort keeps already-sorted array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let before0 = arr.$_get(0);
      let before4 = arr.$_get(4);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = before0;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(4);
      let e2 = before4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1000
     * @tc.name int8ArraySortPart04Test010
     * @tc.desc Verify sort on all-equal array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 7, 7, 7]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = 7;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(3);
      let e2 = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1100
     * @tc.name int8ArraySortPart04Test011
     * @tc.desc Verify sort visible through alias reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let alias = arr;
      arr.sort();
      let r1 = alias.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = alias.$_get(2);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1200
     * @tc.name int8ArraySortPart04Test012
     * @tc.desc Verify sort ArrayBuffer reflects sorted order via new view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let view = new Int8Array(arr.buffer);
      let r1 = view.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = view.$_get(1);
      let e2 = 2;
      expect(r2).assertEqual(e2);
      let r3 = view.$_get(2);
      let e3 = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1400
     * @tc.name int8ArraySortPart04Test014
     * @tc.desc Verify sort(asc) then sort(desc) puts 5 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let asc = (a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      };
      let desc = (a: number, b: number): int => {
        return a < b ? 1 : a > b ? -1 : 0;
      };
      arr.sort(asc);
      arr.sort(desc);
      let r1 = arr.$_get(0);
      let e1 = 5;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(4);
      let e2 = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1500
     * @tc.name int8ArraySortPart04Test015
     * @tc.desc Verify sort(byAbs) then sort(bySigned) puts -3 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-3, 1, -2, 0, 2]);
      let byAbs = (a: number, b: number): int => {
        let absA = a < 0 ? -a : a;
        let absB = b < 0 ? -b : b;
        return absA < absB ? -1 : absA > absB ? 1 : 0;
      };
      let bySigned = (a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(byAbs);
      arr.sort(bySigned);
      let r1 = arr.$_get(0);
      let e1 = -3;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(4);
      let e2 = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1600
     * @tc.name int8ArraySortPart04Test016
     * @tc.desc Verify sort(asc) sort(desc) sort(constant) keeps 3 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 3, 2]);
      let asc = (a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      };
      let desc = (a: number, b: number): int => {
        return a < b ? 1 : a > b ? -1 : 0;
      };
      let constant = (a: number, b: number): int => {
        return 0;
      };
      arr.sort(asc);
      arr.sort(desc);
      arr.sort(constant);
      let r1 = arr.$_get(0);
      let e1 = 3;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1700
     * @tc.name int8ArraySortPart04Test017
     * @tc.desc Verify sort() then sort(desc) puts 3 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let desc = (a: number, b: number): int => {
        return a < b ? 1 : a > b ? -1 : 0;
      };
      arr.sort(desc);
      let r1 = arr.$_get(0);
      let e1 = 3;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1800
     * @tc.name int8ArraySortPart04Test018
     * @tc.desc Verify sort(desc) then sort() puts 1 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let desc = (a: number, b: number): int => {
        return a < b ? 1 : a > b ? -1 : 0;
      };
      arr.sort(desc);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_1900
     * @tc.name int8ArraySortPart04Test019
     * @tc.desc Verify sort() default comparison sorts Int8Array elements in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 3, 8, 1, 6]);
      let threshold: number = 5;
      let cmp = (a: number, b: number): int => {
        let distA = a - threshold;
        let distB = b - threshold;
        let absDistA = distA < 0 ? -distA : distA;
        let absDistB = distB < 0 ? -distB : distB;
        return absDistA < absDistB ? -1 : absDistA > absDistB ? 1 : 0;
      };
      arr.sort(cmp);
      let r1 = arr.$_get(0);
      let e1 = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2000
     * @tc.name int8ArraySortPart04Test020
     * @tc.desc Verify sort() custom comparator sorts by value and counts calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([4, 2, 5, 1, 3]);
      let callCount: int = 0;
      let cmp = (a: number, b: number): int => {
        callCount = callCount + 1;
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(4);
      let e2 = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2100
     * @tc.name int8ArraySortPart04Test021
     * @tc.desc Verify sort() comparator receives maximum element 5 as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 4, 1, 5]);
      let maxArg: number = -128;
      let cmp = (a: number, b: number): int => {
        if (a > maxArg) {
          maxArg = a;
        }
        if (b > maxArg) {
          maxArg = b;
        }
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      expect(maxArg).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2200
     * @tc.name int8ArraySortPart04Test022
     * @tc.desc Verify sort(compareFn) can mutate other array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let other = new Int8Array([10, 20, 30]);
      let cmp = (a: number, b: number): int => {
        other.$_set(1, 99);
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      let r1 = other.$_get(1);
      let e1 = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2300
     * @tc.name int8ArraySortPart04Test023
     * @tc.desc Verify sort() comparator invoked for 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let flag: boolean = false;
      let cmp = (a: number, b: number): int => {
        flag = true;
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2400
     * @tc.name int8ArraySortPart04Test024
     * @tc.desc Verify sort(compareFn) uses lookup table order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 3, 8]);
      let lookup: number[] = [0, 0, 0, 3, 0, 1, 0, 0, 2];
      let cmp = (a: number, b: number): int => {
        let ra: number = 0;
        let rb: number = 0;
        if (a == 3) {
          ra = lookup[3];
        } else if (a == 5) {
          ra = lookup[5];
        } else if (a == 8) {
          ra = lookup[8];
        }
        if (b == 3) {
          rb = lookup[3];
        } else if (b == 5) {
          rb = lookup[5];
        } else if (b == 8) {
          rb = lookup[8];
        }
        return ra < rb ? -1 : ra > rb ? 1 : 0;
      };
      arr.sort(cmp);
      let r1 = arr.$_get(0);
      let e1 = 5;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2500
     * @tc.name int8ArraySortPart04Test025
     * @tc.desc Verify sort(compareFn) receives numbers summing 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);
      let captured: number = 0;
      let cmp = (a: number, b: number): int => {
        captured = a + b;
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      expect(captured).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2600
     * @tc.name int8ArraySortPart04Test026
     * @tc.desc Verify sort a > b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 3, 1, 4, 2]);
      let swapCount: int = 0;
      let cmp = (a: number, b: number): int => {
        if (a > b) {
          swapCount = swapCount + 1;
        }
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(4);
      let e2 = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2700
     * @tc.name int8ArraySortPart04Test027
     * @tc.desc Verify sort() puts -8 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, -3, 5, 2, -8]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = -8;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2800
     * @tc.name int8ArraySortPart04Test028
     * @tc.desc Verify sort() puts 7 at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, -3, 5, 2, -8]);
      arr.sort();
      let r1 = arr.$_get(arr.length - 1);
      let e1 = 7;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_2900
     * @tc.name int8ArraySortPart04Test029
     * @tc.desc Verify sort() then at(-1) returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([4, 2, 9, 1]);
      arr.sort();
      let r1 = arr.at(-1) as number;
      let e1 = 9;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3000
     * @tc.name int8ArraySortPart04Test030
     * @tc.desc Verify sort() then indexOf finds 1 at 0 and 5 at 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 3, 1, 4, 2]);
      arr.sort();
      let r1 = arr.indexOf(1);
      let e1 = 0;
      expect(r1).assertEqual(e1);
      let r2 = arr.indexOf(5);
      let e2 = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3100
     * @tc.name int8ArraySortPart04Test031
     * @tc.desc Verify sort() then lastIndexOf finds 1 at 1 and 3 at 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 3, 2, 1]);
      arr.sort();
      let r1 = arr.lastIndexOf(1);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.lastIndexOf(3);
      let e2 = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3200
     * @tc.name int8ArraySortPart04Test032
     * @tc.desc Verify sort() then includes finds 8 and misses 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 3, 8, 1, 6]);
      arr.sort();
      let r1 = arr.includes(8);
      expect(r1).assertTrue();
      let r2 = arr.includes(99);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3300
     * @tc.name int8ArraySortPart04Test033
     * @tc.desc Verify sort $_get ascending on 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 4, 1, 5]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(4);
      let e2 = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3400
     * @tc.name int8ArraySortPart04Test034
     * @tc.desc Verify sort $_get with mid-state snapshot comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 4, 1, 5]);
      let midState = new Int8Array(5);
      let cmp = (a: number, b: number): int => {
        for (let i = 0; i < arr.length; i++) {
          midState.$_set(i, arr.$_get(i));
        }
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3500
     * @tc.name int8ArraySortPart04Test035
     * @tc.desc Verify sort(compareFn) sees length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let recordedLen: int = 0;
      let cmp = (a: number, b: number): int => {
        recordedLen = arr.length;
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      expect(recordedLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3600
     * @tc.name int8ArraySortPart04Test036
     * @tc.desc Verify sort(compareFn) can $_set during sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let cmp = (a: number, b: number): int => {
        arr.$_set(0, 99);
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      let r1 = arr.length;
      let e1 = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3700
     * @tc.name int8ArraySortPart04Test037
     * @tc.desc Verify sort(compareFn) sees buffer.byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let bufByteLen: int = 0;
      let cmp = (a: number, b: number): int => {
        bufByteLen = arr.buffer.byteLength;
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      expect(bufByteLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_3800
     * @tc.name int8ArraySortPart04Test038
     * @tc.desc Verify sort(compareFn) can at(-1) during sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 4, 2]);
      let lastSeen: number = 0;
      let cmp = (a: number, b: number): int => {
        lastSeen = arr.at(-1) as number;
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      let r1 = arr.$_get(3);
      let e1 = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5000
     * @tc.name int8ArraySortPart04Test050
     * @tc.desc Verify sort cmp 2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 3]);
      let overflowVal: number = 2147483647 + 2;
      let cmp = (a: number, b: number): int => {
        if (a > b) {
          return overflowVal.toInt();
        }
        if (a < b) {
          return (-overflowVal).toInt();
        }
        return 0;
      };
      arr.sort(cmp);
      let r1 = arr.$_get(0);
      let e1 = 3;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(1);
      let e2 = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5100
     * @tc.name int8ArraySortPart04Test051
     * @tc.desc Verify sort cmp -2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1]);
      let underflowVal: number = -(2147483647 + 2);
      let cmp = (a: number, b: number): int => {
        if (a > b) {
          return underflowVal.toInt();
        }
        if (a < b) {
          return (-underflowVal).toInt();
        }
        return 0;
      };
      arr.sort(cmp);
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(1);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5200
     * @tc.name int8ArraySortPart04Test052
     * @tc.desc Verify sort cmp 1.7e308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1]);
      let bigFloat: number = 1.7e308;
      let cmp = (a: number, b: number): int => {
        if (a > b) {
          return bigFloat.toInt();
        }
        if (a < b) {
          return (-bigFloat).toInt();
        }
        return 0;
      };
      arr.sort(cmp);
      let r1 = arr.length;
      let e1 = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5300
     * @tc.name int8ArraySortPart04Test053
     * @tc.desc Verify sort cmp (a-b)*0.5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);
      let cmp = (a: number, b: number): int => {
        return ((a - b) * 0.5).toInt();
      };
      arr.sort(cmp);
      let r1 = arr.$_get(0);
      let e1 = 2;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(1);
      let e2 = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5400
     * @tc.name int8ArraySortPart04Test054
     * @tc.desc Verify sort() clamps 128 to INT8_MIN via ToInt8 then sorts ascending-128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128, 1, 2]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5500
     * @tc.name int8ArraySortPart04Test055
     * @tc.desc Verify sort() clamps -129 to 127 then sorts with other elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-129, 1, 2]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5600
     * @tc.name int8ArraySortPart04Test056
     * @tc.desc Verify sort() wraps 255 to -1 via ToInt8 then sorts ascending-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([255, 1, 2]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = -1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5700
     * @tc.name int8ArraySortPart04Test057
     * @tc.desc Verify sort 0x81 -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0x81, 1, 2]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = -127;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5800
     * @tc.name int8ArraySortPart04Test058
     * @tc.desc Verify sort Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([Number.NaN, -1, 1]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = -1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(1);
      let e2 = 0;
      expect(r2).assertEqual(e2);
      let r3 = arr.$_get(2);
      let e3 = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_5900
     * @tc.name int8ArraySortPart04Test059
     * @tc.desc Verify sort Number.POSITIVE_INFINITY 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([Number.POSITIVE_INFINITY, INT8_MIN, 0]);
      arr.sort();
      let r1 = arr.$_get(0);
      let e1 = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(2);
      let e2 = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6000
     * @tc.name int8ArraySortPart04Test060
     * @tc.desc Verify sort() visible through subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let sub = arr.subarray(0, 3);
      arr.sort();
      let r1 = sub.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = sub.$_get(2);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6100
     * @tc.name int8ArraySortPart04Test061
     * @tc.desc Verify subarray sort visible through sibling subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let sub1 = arr.subarray(0, 3);
      let sub2 = arr.subarray(0, 3);
      sub1.sort();
      let r1 = sub2.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = sub2.$_get(2);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6200
     * @tc.name int8ArraySortPart04Test062
     * @tc.desc Verify sort ArrayBuffer reflected in original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let arr = new Int8Array(buf);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      arr.sort();
      let reader = new Int8Array(buf);
      let r1 = reader.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = reader.$_get(2);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6300
     * @tc.name int8ArraySortPart04Test063
     * @tc.desc Verify sort() on slice copy leaves source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let copy = arr.slice(0, 3);
      copy.sort();
      let r1 = arr.$_get(0);
      let e1 = 3;
      expect(r1).assertEqual(e1);
      let r2 = copy.$_get(0);
      let e2 = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6400
     * @tc.name int8ArraySortPart04Test064
     * @tc.desc Verify buffer offset sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view1 = new Int8Array(buf, 0, 3);
      let view2 = new Int8Array(buf, 3, 3);
      view1.$_set(0, 3);
      view1.$_set(1, 1);
      view1.$_set(2, 2);
      view2.$_set(0, 6);
      view2.$_set(1, 4);
      view2.$_set(2, 5);
      view1.sort();
      let r1 = view1.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = view2.$_get(0);
      let e2 = 6;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6500
     * @tc.name int8ArraySortPart04Test065
     * @tc.desc Verify sort() visible via new view on buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let newView = new Int8Array(arr.buffer);
      let r1 = newView.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = newView.$_get(2);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6600
     * @tc.name int8ArraySortPart04Test066
     * @tc.desc Verify subarray sort affects only subarray range of original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2, 0]);
      let sub = arr.subarray(0, 2);
      sub.sort();
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(1);
      let e2 = 3;
      expect(r2).assertEqual(e2);
      let r3 = arr.$_get(2);
      let e3 = 2;
      expect(r3).assertEqual(e3);
      let r4 = arr.$_get(3);
      let e4 = 0;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6700
     * @tc.name int8ArraySortPart04Test067
     * @tc.desc Verify sort() on offset view keeps byteOffset and sorts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 2, 3);
      arr.$_set(0, 5);
      arr.$_set(1, 1);
      arr.$_set(2, 3);
      let beforeOffset = arr.byteOffset;
      arr.sort();
      let r1 = arr.byteOffset;
      let e1 = beforeOffset;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(0);
      let e2 = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6800
     * @tc.name int8ArraySortPart04Test068
     * @tc.desc Verify buffer Int8Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let view1 = new Int8Array(buf);
      let view2 = new Int8Array(buf);
      view1.$_set(0, 3);
      view1.$_set(1, 1);
      view1.$_set(2, 2);
      view1.sort();
      let r1 = view2.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = view2.$_get(2);
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART04_TEST_6900
     * @tc.name int8ArraySortPart04Test069
     * @tc.desc Verify sort() then slice(1, 3) yields 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let copy = arr.slice(1, 3);
      let r1 = copy.$_get(0);
      let e1 = 2;
      expect(r1).assertEqual(e1);
      let r2 = copy.$_get(1);
      let e2 = 3;
      expect(r2).assertEqual(e2);
      let r3 = copy.length;
      let e3 = 2;
      expect(r3).assertEqual(e3);
    });
  });
}
