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
import Utils from '../Util.test';

class RangeChecker001 {
  lo: number = 0;
  hi: number = 0;
  constructor(low: number, high: number) {
    this.lo = low;
    this.hi = high;
  }
  inRange(v: number): boolean {
    return v >= this.lo && v <= this.hi;
  }
}

export default function int8ArrayFindPart01Test(): void {
  describe('Int8ArrayFindPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0100
     * @tc.name int8ArrayFindPart01Test001
     * @tc.desc Verify find with predicate matching a specific value returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0200
     * @tc.name int8ArrayFindPart01Test002
     * @tc.desc Verify find with no matching element returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 99;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0300
     * @tc.name int8ArrayFindPart01Test003
     * @tc.desc Verify find on empty array returns undefined and predicate never executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let called: boolean = false;
      let result: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        called = true;
        return true;
      });
      expect(result).assertUndefined();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0400
     * @tc.name int8ArrayFindPart01Test004
     * @tc.desc Verify find on single-element array with matching predicate returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 42;
      });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0500
     * @tc.name int8ArrayFindPart01Test005
     * @tc.desc Verify find on single-element array with non-matching predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0600
     * @tc.name int8ArrayFindPart01Test006
     * @tc.desc Verify find expects 5, on Int8Array.of(5, 10, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let result: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0700
     * @tc.name int8ArrayFindPart01Test007
     * @tc.desc Verify find returns undefined, on Int8Array.of(5, 10, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let result: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0800
     * @tc.name int8ArrayFindPart01Test008
     * @tc.desc Verify find expects 7, on Int8Array.of(7, 10, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 10, 15);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v < 10;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_0900
     * @tc.name int8ArrayFindPart01Test009
     * @tc.desc Verify find expects 3, on Int8Array.of(10, 20, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v < 10;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1000
     * @tc.name int8ArrayFindPart01Test010
     * @tc.desc Verify find expects 5, on Int8Array.of(10, 5, 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 5, 20);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v < 10;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1100
     * @tc.name int8ArrayFindPart01Test011
     * @tc.desc Verify find with predicate element < 5 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 7, 2, 9);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v < 5;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1200
     * @tc.name int8ArrayFindPart01Test012
     * @tc.desc Verify find expects 1 when v > 0, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1300
     * @tc.name int8ArrayFindPart01Test013
     * @tc.desc Verify find expects -128, on Int8Array.of(0, -128, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -128, INT8_MAX);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -128;
      });
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1400
     * @tc.name int8ArrayFindPart01Test014
     * @tc.desc Verify find expects INT8_MAX, on Int8Array.of(0, INT8_MAX, -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, INT8_MAX, -1);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === INT8_MAX;
      });
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1500
     * @tc.name int8ArrayFindPart01Test015
     * @tc.desc Verify find expects 0, on Int8Array.of(-1, 0, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, 0, 1);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1600
     * @tc.name int8ArrayFindPart01Test016
     * @tc.desc Verify find expects -1, on Int8Array.of(1, -1, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -1, 0);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -1;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1700
     * @tc.name int8ArrayFindPart01Test017
     * @tc.desc Verify find expects 4, on Int8Array.of(-5, -3, 4, -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-5, -3, 4, -1);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 0;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1800
     * @tc.name int8ArrayFindPart01Test018
     * @tc.desc Verify find expects -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 3, -2, 1);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v < 0;
      });
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_1900
     * @tc.name int8ArrayFindPart01Test019
     * @tc.desc Verify find expects -128, with $_set(0, 128), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 128);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -128;
      });
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2000
     * @tc.name int8ArrayFindPart01Test020
     * @tc.desc Verify find expects -1, with $_set(0, 255), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 255);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -1;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2100
     * @tc.name int8ArrayFindPart01Test021
     * @tc.desc Verify find expects INT8_MAX, with $_set(0, -129), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -129);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === INT8_MAX;
      });
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2200
     * @tc.name int8ArrayFindPart01Test022
     * @tc.desc Verify find expects 0, with $_set(0, Number.NaN), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, Number.NaN);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2300
     * @tc.name int8ArrayFindPart01Test023
     * @tc.desc Verify find expects 0, with $_set(0, Number.POSITIVE_INFINITY), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2400
     * @tc.name int8ArrayFindPart01Test024
     * @tc.desc Verify find expects 0, with $_set(0, Number.NEGATIVE_INFINITY), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2500
     * @tc.name int8ArrayFindPart01Test025
     * @tc.desc Verify find expects 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === 0;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2600
     * @tc.name int8ArrayFindPart01Test026
     * @tc.desc Verify find expects 30, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === 2;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2700
     * @tc.name int8ArrayFindPart01Test027
     * @tc.desc Verify find expects 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === 1;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2800
     * @tc.name int8ArrayFindPart01Test028
     * @tc.desc Verify find expects 11, on Int8Array.of(11, 22, 33, 44)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33, 44);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i % 2 === 0;
      });
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_2900
     * @tc.name int8ArrayFindPart01Test029
     * @tc.desc Verify find expects 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33, 44);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i % 2 === 1;
      });
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3000
     * @tc.name int8ArrayFindPart01Test030
     * @tc.desc Verify find returns undefined, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === -1;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3100
     * @tc.name int8ArrayFindPart01Test031
     * @tc.desc Verify find expects 30, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i > 1;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3200
     * @tc.name int8ArrayFindPart01Test032
     * @tc.desc Verify find expects 1 when a === arr, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((_v: number, _i: int, a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return a === arr;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3300
     * @tc.name int8ArrayFindPart01Test033
     * @tc.desc Verify find expects 1 when a.length === 3, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((_v: number, _i: int, a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return a.length === 3;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3400
     * @tc.name int8ArrayFindPart01Test034
     * @tc.desc Verify find expects 5, with $_get(i), on Int8Array.of(5, 10, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let result: number | undefined = arr.find((v: number, i: int, a: Int8Array): boolean => {
        return a.$_get(i) === v;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3500
     * @tc.name int8ArrayFindPart01Test035
     * @tc.desc Verify find expects 1 instanceof check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((_v: number, _i: int, a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return a instanceof Int8Array;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3600
     * @tc.name int8ArrayFindPart01Test036
     * @tc.desc Verify find throws Error on first callback call, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          throw new Error('fail');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3700
     * @tc.name int8ArrayFindPart01Test037
     * @tc.desc Verify find expects RangeError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3800
     * @tc.name int8ArrayFindPart01Test038
     * @tc.desc Verify find expects TypeError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_3900
     * @tc.name int8ArrayFindPart01Test039
     * @tc.desc Verify find throws Error on first call, count 1, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          callCount = callCount + 1;
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4000
     * @tc.name int8ArrayFindPart01Test040
     * @tc.desc Verify find throws Error on second call, count 2, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          callCount = callCount + 1;
          if (callCount === 2) {
            throw new Error('mid');
          }
          return false;
        });
        expect(found).assertUndefined();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4100
     * @tc.name int8ArrayFindPart01Test041
     * @tc.desc Verify find throws Error on third call, count 3, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          callCount = callCount + 1;
          if (callCount === 3) {
            throw new Error('last');
          }
          return false;
        });
        expect(found).assertUndefined();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4200
     * @tc.name int8ArrayFindPart01Test042
     * @tc.desc Verify find expects SyntaxError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          throw new SyntaxError('syntax');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4300
     * @tc.name int8ArrayFindPart01Test043
     * @tc.desc Verify find with predicate element == target returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 5, 10, 15);
      let target: number = 10;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === target;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4400
     * @tc.name int8ArrayFindPart01Test044
     * @tc.desc Verify find with no matching element returns undefined and visits all elements, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let counter: int = 0;
      let result: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        counter = counter + 1;
        return false;
      });
      expect(result).assertUndefined();
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4500
     * @tc.name int8ArrayFindPart01Test045
     * @tc.desc Verify find with predicate element > threshold returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let threshold: number = 3;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > threshold;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4600
     * @tc.name int8ArrayFindPart01Test046
     * @tc.desc Verify find with predicate element == step returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let step: number = 0;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        step = step + 1;
        return v === step;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4700
     * @tc.name int8ArrayFindPart01Test047
     * @tc.desc Verify find expects 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: number | undefined = arr.find((v: number, i: int, a: Int8Array): boolean => {
        if (i === 0) {
          a.$_set(2, 99);
        }
        return v === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4800
     * @tc.name int8ArrayFindPart01Test048
     * @tc.desc Verify find expects 3, with $_get(i + 1), on Int8Array.of(1, 3, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 3, 2, 4);
      let result: number | undefined = arr.find((_v: number, i: int, a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        if (i + 1 < a.length) {
          return a.$_get(i + 1) === 2;
        }
        return false;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_4900
     * @tc.name int8ArrayFindPart01Test049
     * @tc.desc Verify find expects 3, on Int8Array.of(-2, 0, 3, -5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-2, 0, 3, -5);
      let result: number | undefined = arr.find((v: number, i: int, _a: Int8Array): boolean => {
        return v > 0 && i > 0;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5000
     * @tc.name int8ArrayFindPart01Test050
     * @tc.desc Verify find expects -1, with find(isNegative), on Int8Array.of(5, 3, -1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isNegative: (v: number, i: int, a: Int8Array) => boolean = (v: number, _i: int, _a: Int8Array): boolean => {
        return v < 0;
      };
      let arr: Int8Array = Int8Array.of(5, 3, -1, 2);
      let result: number | undefined = arr.find(isNegative);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5100
     * @tc.name int8ArrayFindPart01Test051
     * @tc.desc Verify find expects 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checker: RangeChecker001 = new RangeChecker001(10, 20);
      let arr: Int8Array = Int8Array.of(5, 15, 25);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return checker.inRange(v);
      });
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5200
     * @tc.name int8ArrayFindPart01Test052
     * @tc.desc Verify find with predicate callback returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let called: boolean = false;
      let result: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        called = true;
        return false;
      });
      expect(result).assertUndefined();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5300
     * @tc.name int8ArrayFindPart01Test053
     * @tc.desc Verify find returns undefined, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        throw new Error('should not call');
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5400
     * @tc.name int8ArrayFindPart01Test054
     * @tc.desc Verify find expects 7, on Int8Array.of(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === 0;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5500
     * @tc.name int8ArrayFindPart01Test055
     * @tc.desc Verify find returns undefined, on Int8Array.of(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === 1;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5600
     * @tc.name int8ArrayFindPart01Test056
     * @tc.desc Verify find expects Error throws exception, on Int8Array.of(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          throw new Error('single');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5700
     * @tc.name int8ArrayFindPart01Test057
     * @tc.desc Verify find with predicate element == 10 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        callCount = callCount + 1;
        return v === 10;
      });
      expect(result).assertEqual(10);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5800
     * @tc.name int8ArrayFindPart01Test058
     * @tc.desc Verify find with predicate element == 20 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        callCount = callCount + 1;
        return v === 20;
      });
      expect(result).assertEqual(20);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_5900
     * @tc.name int8ArrayFindPart01Test059
     * @tc.desc Verify find with predicate element == 30 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        callCount = callCount + 1;
        return v === 30;
      });
      expect(result).assertEqual(30);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6000
     * @tc.name int8ArrayFindPart01Test060
     * @tc.desc Verify find with no matching element returns undefined and visits all elements, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        callCount = callCount + 1;
        return v === 99;
      });
      expect(result).assertUndefined();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6100
     * @tc.name int8ArrayFindPart01Test061
     * @tc.desc Verify find expects 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33);
      let captured: number = 0;
      let found: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        captured = v;
        return false;
      });
      expect(found).assertUndefined();
      expect(captured).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6200
     * @tc.name int8ArrayFindPart01Test062
     * @tc.desc Verify find expects 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33);
      let lastIdx: int = 0;
      let found: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        lastIdx = i;
        return false;
      });
      expect(found).assertUndefined();
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6300
     * @tc.name int8ArrayFindPart01Test063
     * @tc.desc Verify find expects 0, on Int8Array.of(11, 22, 33)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33);
      let firstIdx: int = -1;
      let found: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        firstIdx = i;
        return true;
      });
      expect(found).assertEqual(11);
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6400
     * @tc.name int8ArrayFindPart01Test064
     * @tc.desc Verify find expects 11, on Int8Array.of(11, 22, 33)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33);
      let firstVal: number = 0;
      let found: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        firstVal = v;
        return true;
      });
      expect(found).assertEqual(11);
      expect(firstVal).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6500
     * @tc.name int8ArrayFindPart01Test065
     * @tc.desc Verify find expects 0, with $_get(i), on Int8Array.of(5, 10, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let mismatchCount: int = 0;
      let found: number | undefined = arr.find((v: number, i: int, a: Int8Array): boolean => {
        if (a.$_get(i) !== v) {
          mismatchCount = mismatchCount + 1;
        }
        return false;
      });
      expect(found).assertUndefined();
      expect(mismatchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6600
     * @tc.name int8ArrayFindPart01Test066
     * @tc.desc Verify find expects 0, on Int8Array.of(0, 0, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6700
     * @tc.name int8ArrayFindPart01Test067
     * @tc.desc Verify find with predicate element == 5 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5, 5);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 5;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6800
     * @tc.name int8ArrayFindPart01Test068
     * @tc.desc Verify find expects 7, on Int8Array.of(3, 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let validValues: Int8Array = Int8Array.of(3, 7);
      let arr: Int8Array = Int8Array.of(1, 5, 7, 2);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return validValues.indexOf(v) !== -1;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_6900
     * @tc.name int8ArrayFindPart01Test069
     * @tc.desc Verify find expects 4, on Int8Array.of(3, 7, 4, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 7, 4, 9);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return (v & 1) === 0;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7000
     * @tc.name int8ArrayFindPart01Test070
     * @tc.desc Verify find expects -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, -3, 10, -7);
      let result: number | undefined = arr.find((v: number, i: int, _a: Int8Array): boolean => {
        return v < 0 && i >= 1;
      });
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7100
     * @tc.name int8ArrayFindPart01Test071
     * @tc.desc Verify find returns first matching element 3 when v > 2, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let p: (v: number, i: int, a: Int8Array) => boolean = (v: number, _i: int, _a: Int8Array): boolean => {
        return v > 2;
      };
      let r1: number | undefined = arr.find(p);
      expect(r1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7200
     * @tc.name int8ArrayFindPart01Test072
     * @tc.desc Verify find with predicate element != 2 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2, 2, 1, 2);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v !== 2;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7300
     * @tc.name int8ArrayFindPart01Test073
     * @tc.desc Verify find expects -128, on Int8Array.of(-1, -128, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, -128, INT8_MAX);
      let result: number | undefined = arr.find((v: number, i: int, _a: Int8Array): boolean => {
        return v === -128 && i === 1;
      });
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7400
     * @tc.name int8ArrayFindPart01Test074
     * @tc.desc Verify predicate using array traversal to find maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 7, 2, 5);
      let result: number | undefined = arr.find((v: number, _i: int, a: Int8Array): boolean => {
        let isMax: boolean = true;
        for (let j: int = 0; j < a.length; j++) {
          if (a.$_get(j) > v) {
            isMax = false;
          }
        }
        return isMax;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7500
     * @tc.name int8ArrayFindPart01Test075
     * @tc.desc Verify find expects 5, on Int8Array.of(2, 4, 5, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2, 4, 5, 6);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v % 2 !== 0;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7600
     * @tc.name int8ArrayFindPart01Test076
     * @tc.desc Verify find returns undefined, on Int8Array.of(-1, -2, -3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, -2, -3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7700
     * @tc.name int8ArrayFindPart01Test077
     * @tc.desc Verify find with predicate element >= 0 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-5, 0, 10, -3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v >= 0 && v <= INT8_MAX;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7800
     * @tc.name int8ArrayFindPart01Test078
     * @tc.desc Verify find expects 0, on Int8Array.of(0, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 2);
      let result: number | undefined = arr.find((v: number, i: int, _a: Int8Array): boolean => {
        return i === 0 && v === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_7900
     * @tc.name int8ArrayFindPart01Test079
     * @tc.desc Verify find returns undefined, with $_set(0, Number.POSITIVE_INFINITY), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 127;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART01_TEST_8000
     * @tc.name int8ArrayFindPart01Test080
     * @tc.desc Verify find returns undefined, with $_set(0, Number.NEGATIVE_INFINITY), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -128;
      });
      expect(result).assertUndefined();
    });
  });
}
