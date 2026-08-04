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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayFind2Test(): void {
  describe('Float32ArrayFind2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0100
     * @tc.name testFloat32ArrayFindTWO001
     * @tc.desc Verify find returns the value of the first matching element, not the index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const result = arr.find((value, index, array) => index === 1);
      expect(result).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0200
     * @tc.name testFloat32ArrayFindTWO002
     * @tc.desc Verify when a non-empty array has no match, find visits all elements and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let calls: int = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return value > 100.0;
      });
      expect(calls).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0300
     * @tc.name testFloat32ArrayFindTWO003
     * @tc.desc Verify find hit returns the exact matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0]);
      const result = arr.find((value, index, array) => value === 6.0);
      expect(result).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0400
     * @tc.name testFloat32ArrayFindTWO004
     * @tc.desc Verify find hit return value is === equal to the element at the corresponding index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: int = 2;
      const result = arr.find((value, index, array) => index === idx);
      expect(result).assertEqual(arr.$_get(idx));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0500
     * @tc.name testFloat32ArrayFindTWO005
     * @tc.desc Verify find return value is a value copy, not affecting original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.find((value, index, array) => value === 0b1010);
      expect(arr.$_get(1)).assertEqual(10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0600
     * @tc.name testFloat32ArrayFindTWO006
     * @tc.desc Verify after find hit, the exact return value can participate in numeric operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result: number = arr.find((value, index, array) => value === 0b1010)!;
      expect(result).assertEqual(10.0);
      expect(result * 2.0).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0700
     * @tc.name testFloat32ArrayFindTWO007
     * @tc.desc Verify find return value type is number branch, can be assigned to a number variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 4.0]);
      const result: number | undefined = arr.find((value, index, array) => value > 3.0);
      expect(result).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0800
     * @tc.name testFloat32ArrayFindTWO008
     * @tc.desc Verify empty Float32Array find does not call the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      let calls: int = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return true;
      });
      expect(calls).assertEqual(0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_0900
     * @tc.name testFloat32ArrayFindTWO009
     * @tc.desc Verify single-element array returns that unique element on match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      const result = arr.find((value, index, array) => value === 42.0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1000
     * @tc.name testFloat32ArrayFindTWO010
     * @tc.desc Verify single-element array returns undefined when binary search value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10);
      const result = arr.find((value, index, array) => value === 0b1010);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1100
     * @tc.name testFloat32ArrayFindTWO011
     * @tc.desc Verify single-element array predicate called exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      let calls = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        return false;
      });
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1200
     * @tc.name testFloat32ArrayFindTWO012
     * @tc.desc Verify single-element array with always-true predicate returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([99.0]);
      const result = arr.find((value, index, array) => true);
      expect(result).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1300
     * @tc.name testFloat32ArrayFindTWO013
     * @tc.desc Verify single-element NaN array with always-false predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      let calls: int = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return false;
      });
      expect(calls).assertEqual(1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1400
     * @tc.name testFloat32ArrayFindTWO014
     * @tc.desc Verify repeated-value array first match takes priority, predicate only called up to the first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0]);
      let calls = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return value === 5.0;
      });
      expect(calls).assertEqual(1);
      expect(result).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1500
     * @tc.name testFloat32ArrayFindTWO015
     * @tc.desc Verify when multiple distinct elements satisfy the condition, returns the first satisfying one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let firstMatchIndex: number = -1;
      const result = arr.find((value, index, array) => {
        if (value > 1.5) {
          firstMatchIndex = index;
          return true;
        }
        return false;
      });
      expect(firstMatchIndex).assertEqual(1);
      expect(result).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1600
     * @tc.name testFloat32ArrayFindTWO016
     * @tc.desc Verify when all elements satisfy the condition, returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 4.0, 6.0]);
      const result = arr.find((value, index, array) => value > 0.0);
      expect(result).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1700
     * @tc.name testFloat32ArrayFindTWO017
     * @tc.desc Verify find hit return value matches the element located by indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const target: number = 20.0;
      const result = arr.find((value, index, array) => value === target);
      const idx = arr.indexOf(target);
      expect(result).assertEqual(arr.$_get(idx));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1800
     * @tc.name testFloat32ArrayFindTWO018
     * @tc.desc Verify when the first match is at index 0, returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const result = arr.find((value, index, array) => value === 10.0);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_1900
     * @tc.name testFloat32ArrayFindTWO019
     * @tc.desc Verify when the first match is at the last index, returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const result = arr.find((value, index, array) => value === 40.0);
      expect(result).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2000
     * @tc.name testFloat32ArrayFindTWO020
     * @tc.desc Verify repeated values interspersed with non-matches, first match still takes the first satisfying position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 9.0, 1.0, 9.0]);
      let matchIndex: number = -1;
      const result = arr.find((value, index, array) => {
        if (value === 9.0) {
          matchIndex = index;
          return true;
        }
        return false;
      });
      expect(matchIndex).assertEqual(1);
      expect(result).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2100
     * @tc.name testFloat32ArrayFindTWO021
     * @tc.desc Verify first-match priority ensures subsequent satisfying elements are not accessed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 6.0, 9.0]);
      let visitedAfterMatch = false;
      arr.find((value, index, array) => {
        if (value === 6.0) {
          return true;
        }
        if (index > 1) {
          visitedAfterMatch = true;
        }
        return false;
      });
      expect(visitedAfterMatch).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2200
     * @tc.name testFloat32ArrayFindTWO022
     * @tc.desc Verify when find returns NaN the result is asserted as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN, 3.0]);
      const result = arr.find((value, index, array) => Number.isNaN(value));
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2300
     * @tc.name testFloat32ArrayFindTWO023
     * @tc.desc Verify find returns +Infinity, bit-exact equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.POSITIVE_INFINITY]);
      const result = arr.find((value, index, array) => value === Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2400
     * @tc.name testFloat32ArrayFindTWO024
     * @tc.desc Verify find returns -Infinity, bit-exact equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NEGATIVE_INFINITY, 1.0]);
      const result = arr.find((value, index, array) => value === Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2500
     * @tc.name testFloat32ArrayFindTWO025
     * @tc.desc Verify when find returns -0 the sign can be distinguished via reciprocal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -0.0, 3.0]);
      const result = arr.find((value, index, array) => 1.0 / value === Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(0.0);
      if (result !== undefined) {
        expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2600
     * @tc.name testFloat32ArrayFindTWO026
     * @tc.desc Verify when find returns +0 the sign can be distinguished via reciprocal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 0.0, 3.0]);
      const result = arr.find((value, index, array) => index === 1);
      expect(result).assertEqual(0.0);
      if (result !== undefined) {
        expect(1.0 / result).assertEqual(Number.POSITIVE_INFINITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2700
     * @tc.name testFloat32ArrayFindTWO027
     * @tc.desc Verify find returns the smallest subnormal number (MIN_VALUE), bit-exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.401298464324817e-45]);
      const result = arr.find((value, index, array) => index === 1);
      expect(result).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2800
     * @tc.name testFloat32ArrayFindTWO028
     * @tc.desc Verify find returns the largest finite value (MAX_VALUE), bit-exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.0]);
      const result = arr.find((value, index, array) => index === 0);
      expect(result).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_2900
     * @tc.name testFloat32ArrayFindTWO029
     * @tc.desc Verify find returns the smallest normalized number (MIN_NORMAL), bit-exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.1754943508222875e-38]);
      const result = arr.find((value, index, array) => index === 1);
      expect(result).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3000
     * @tc.name testFloat32ArrayFindTWO030
     * @tc.desc Verify find returns machine epsilon (EPSILON), bit-exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const epsilon: number = 1.1920928955078125e-7;
      const arr = new Float32Array([1.0, epsilon]);
      const result = arr.find((value, index, array) => index === 1);
      expect(result).assertEqual(epsilon);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3100
     * @tc.name testFloat32ArrayFindTWO031
     * @tc.desc Verify find return value is bit-exact equal to the element at the same position in the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2]);
      const result = arr.find((value, index, array) => index === 0);
      expect(result).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3200
     * @tc.name testFloat32ArrayFindTWO032
     * @tc.desc Verify the smallest subnormal number and +0 are distinguishable via the find return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45, 0.0]);
      const result = arr.find((value, index, array) => index === 0);
      expect(result).assertEqual(1.401298464324817e-45);
      if (result !== undefined) {
        expect(result > 0.0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3300
     * @tc.name testFloat32ArrayFindTWO033
     * @tc.desc Verify when multiple Infinity values exist, find returns the first Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY]);
      let matchIndex: number = -1;
      const result = arr.find((value, index, array) => {
        if (value === Number.POSITIVE_INFINITY) {
          matchIndex = index;
          return true;
        }
        return false;
      });
      expect(matchIndex).assertEqual(1);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3400
     * @tc.name testFloat32ArrayFindTWO034
     * @tc.desc Verify NaN element never matches with ===, find returns undefined after visiting the NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0]);
      let sawNaN = false;
      const result = arr.find((value, index, array) => {
        if (index === 0) {
          sawNaN = Number.isNaN(value);
        }
        return value === NaN;
      });
      expect(sawNaN).assertTrue();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3500
     * @tc.name testFloat32ArrayFindTWO035
     * @tc.desc Verify use Number.isNaN in the predicate to locate the NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN, 2.0]);
      const result = arr.find((value, index, array) => Number.isNaN(value));
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3600
     * @tc.name testFloat32ArrayFindTWO036
     * @tc.desc Verify value === 0 matches both +0 and -0, returns the first zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0, 0.0]);
      let matchIndex: number = -1;
      const result = arr.find((value, index, array) => {
        if (value === 0.0) {
          matchIndex = index;
          return true;
        }
        return false;
      });
      expect(matchIndex).assertEqual(0);
      expect(result).assertEqual(0.0);
      if (result !== undefined) {
        expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3700
     * @tc.name testFloat32ArrayFindTWO037
     * @tc.desc Verify value > 0 does not match +0, -0, or NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -0.0, NaN, 1.0]);
      const result = arr.find((value, index, array) => value > 0.0);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3800
     * @tc.name testFloat32ArrayFindTWO038
     * @tc.desc Verify value < 0 does not match -0 or +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0, 0.0, -5.0]);
      const result = arr.find((value, index, array) => value < 0.0);
      expect(result).assertEqual(-5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_3900
     * @tc.name testFloat32ArrayFindTWO039
     * @tc.desc Verify predicate uses 1/value < 0 to distinguish -0 from +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -0.0]);
      const result = arr.find((value, index, array) => 1.0 / value < 0.0);
      expect(result).assertEqual(0.0);
      if (result !== undefined) {
        expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4000
     * @tc.name testFloat32ArrayFindTWO040
     * @tc.desc Verify NaN compared with any value is false, predicate value > 0 skips NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, NaN, 3.0]);
      let calls = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return value > 0.0;
      });
      expect(calls).assertEqual(3);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4100
     * @tc.name testFloat32ArrayFindTWO041
     * @tc.desc Verify index argument can be assigned to an int type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedIndex: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return index === 1;
      });
      expect(capturedIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4200
     * @tc.name testFloat32ArrayFindTWO042
     * @tc.desc Verify predicate index === 0 matches the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const result = arr.find((value, index, array) => index === 0);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4300
     * @tc.name testFloat32ArrayFindTWO043
     * @tc.desc Verify predicate index === length-1 matches the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const last: number = arr.length - 1;
      const result = arr.find((value, index, array) => index === last);
      expect(result).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4400
     * @tc.name testFloat32ArrayFindTWO044
     * @tc.desc Verify index is never negative, the traversal sequence is all non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let allNonNegative = true;
      arr.find((value, index, array) => {
        if (index < 0) {
          allNonNegative = false;
        }
        return false;
      });
      expect(allNonNegative).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4500
     * @tc.name testFloat32ArrayFindTWO045
     * @tc.desc Verify index sequence is strictly increasing with first term 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let prev: number = -1;
      let strictlyIncreasing = true;
      arr.find((value, index, array) => {
        if (index <= prev) {
          strictlyIncreasing = false;
        }
        prev = index;
        return false;
      });
      expect(strictlyIncreasing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4600
     * @tc.name testFloat32ArrayFindTWO046
     * @tc.desc Verify index upper bound is length-1, no out-of-bounds access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let maxIndex: number = 0;
      arr.find((value, index, array) => {
        if (index > maxIndex) {
          maxIndex = index;
        }
        return false;
      });
      expect(maxIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4700
     * @tc.name testFloat32ArrayFindTWO047
     * @tc.desc Verify predicate uses both index and value corresponding to the same element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 10.0, 15.0]);
      const result = arr.find((value, index, array) => index === 1 && value === 10.0);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4800
     * @tc.name testFloat32ArrayFindTWO048
     * @tc.desc Verify index as int can participate in integer operations without precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.find((value, index, array) => index * 2 === 4);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_4900
     * @tc.name testFloat32ArrayFindTWO049
     * @tc.desc Verify array argument is the same reference as the caller array (=== check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let same = false;
      arr.find((value, index, array) => {
        same = (array === arr);
        return true;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5000
     * @tc.name testFloat32ArrayFindTWO050
     * @tc.desc Verify array.length always equals the original array length throughout the traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let lenConsistent = true;
      arr.find((value, index, array) => {
        if (array.length !== 4) {
          lenConsistent = false;
        }
        return false;
      });
      expect(lenConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5100
     * @tc.name testFloat32ArrayFindTWO051
     * @tc.desc Verify array argument reflects element mutations during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let seenMutated = false;
      arr.find((value, index, array) => {
        if (index === 0) {
          array.$_set(1, 50.0);
        }
        if (index === 1) {
          seenMutated = (value === 50.0);
        }
        return false;
      });
      expect(seenMutated).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5200
     * @tc.name testFloat32ArrayFindTWO052
     * @tc.desc Verify array argument $_get reads the current element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      let consistent = true;
      arr.find((value, index, array) => {
        if (array.$_get(index) !== value) {
          consistent = false;
        }
        return false;
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5300
     * @tc.name testFloat32ArrayFindTWO053
     * @tc.desc Verify array argument buffer matches the original array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let sameBuffer = false;
      arr.find((value, index, array) => {
        sameBuffer = (array.buffer === arr.buffer);
        return true;
      });
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5400
     * @tc.name testFloat32ArrayFindTWO054
     * @tc.desc Verify array argument BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let bpe: number = 0;
      arr.find((value, index, array) => {
        bpe = array.BYTES_PER_ELEMENT;
        return true;
      });
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5500
     * @tc.name testFloat32ArrayFindTWO055
     * @tc.desc Verify predicate is called strictly in index order 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const order: Array<number> = [];
      arr.find((value, index, array) => {
        order.push(index);
        return index === 2;
      });
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual(0);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5600
     * @tc.name testFloat32ArrayFindTWO056
     * @tc.desc Verify on a hit the predicate call count equals the hit index plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      let calls = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        return index === 3;
      });
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5700
     * @tc.name testFloat32ArrayFindTWO057
     * @tc.desc Verify on no match the predicate call count equals the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let calls = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        return false;
      });
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5800
     * @tc.name testFloat32ArrayFindTWO058
     * @tc.desc Verify on first-element hit the predicate is called only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      let calls = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        return true;
      });
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_5900
     * @tc.name testFloat32ArrayFindTWO059
     * @tc.desc Verify on last-position hit only, the predicate call count equals the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let calls = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        return index === 2;
      });
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6000
     * @tc.name testFloat32ArrayFindTWO060
     * @tc.desc Verify each predicate call's value matches the corresponding index of the external original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 10.0, 15.0]);
      let allMatch = true;
      arr.find((value, index, array) => {
        if (value !== arr.$_get(index)) {
          allMatch = false;
        }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6100
     * @tc.name testFloat32ArrayFindTWO061
     * @tc.desc Verify stops immediately on a hit, subsequent elements do not trigger the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let maxIndexSeen: number = -1;
      arr.find((value, index, array) => {
        maxIndexSeen = index;
        return index === 1;
      });
      expect(maxIndexSeen).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6200
     * @tc.name testFloat32ArrayFindTWO062
     * @tc.desc Verify predicate accumulates a closure counter across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let sum = 0;
      const result = arr.find((value, index, array) => {
        sum = (sum + value).toInt();
        return sum > 5.0;
      });
      expect(sum).assertEqual(6.0);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6300
     * @tc.name testFloat32ArrayFindTWO063
     * @tc.desc Verify predicate closure counter hits after reaching a specified count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      let count = 0;
      const target: number = 3;
      const result = arr.find((value, index, array) => {
        count = count + 1;
        return count === target;
      });
      expect(count).assertEqual(3);
      expect(result).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6400
     * @tc.name testFloat32ArrayFindTWO064
     * @tc.desc Verify predicate closure writes each accessed value to an external array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const visited: Array<number> = [];
      arr.find((value, index, array) => {
        visited.push(value);
        return false;
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(16);
      expect(visited[2]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6500
     * @tc.name testFloat32ArrayFindTWO065
     * @tc.desc Verify predicate closure records the hit value for external assertion on a hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4.0, 5.0, 6.0]);
      let matched: number = 0;
      const result = arr.find((value, index, array) => {
        if (value > 4.5) {
          matched = value;
          return true;
        }
        return false;
      });
      expect(matched).assertEqual(5.0);
      expect(result).assertEqual(matched);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6600
     * @tc.name testFloat32ArrayFindTWO066
     * @tc.desc Verify predicate closure maintains the previous value for adjacent-difference judgment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 5.0]);
      let prev: number = 0.0;
      const result = arr.find((value, index, array) => {
        const diff = value - prev;
        prev = value;
        return diff > 2.0;
      });
      expect(result).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6700
     * @tc.name testFloat32ArrayFindTWO067
     * @tc.desc Verify predicate closure maintains a boolean flag, hits after first set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let flag = false;
      const result = arr.find((value, index, array) => {
        if (index === 1) {
          flag = true;
        }
        return flag;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6800
     * @tc.name testFloat32ArrayFindTWO068
     * @tc.desc Verify when the predicate throws an Error the exception propagates upward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let msg = '';
      try {
        arr.find((value, index, array) => {
          throw new Error('boom');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
        msg = (e as Error).message;
      }
      expect(msg).assertEqual('boom');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_6900
     * @tc.name testFloat32ArrayFindTWO069
     * @tc.desc Verify predicate throws on first call, find has no return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let result: number | undefined = -1.0;
      try {
        result = arr.find((value, index, array) => {
          throw new Error('first');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7000
     * @tc.name testFloat32ArrayFindTWO070
     * @tc.desc Verify predicate throws on a middle call, previous elements traversed but no result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let calls = 0;
      try {
        arr.find((value, index, array) => {
          calls = calls + 1;
          if (index === 1) {
            throw new Error('mid');
          }
          return false;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7100
     * @tc.name testFloat32ArrayFindTWO071
     * @tc.desc Verify after the predicate throws, subsequent elements are not traversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let maxIndex: number = -1;
      try {
        arr.find((value, index, array) => {
          maxIndex = index;
          if (index === 1) {
            throw new Error('stop');
          }
          return false;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(maxIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7200
     * @tc.name testFloat32ArrayFindTWO072
     * @tc.desc Verify predicate conditionally throws (triggered by a specific value), exception propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.find((value, index, array) => {
          if (value === 0b1010) {
            throw new Error('value-2');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7300
     * @tc.name testFloat32ArrayFindTWO073
     * @tc.desc Verify large array (1000 elements) hits the first position and returns quickly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1000);
      arr.$_set(0, 1.0);
      let calls = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return value === 1.0;
      });
      expect(calls).assertEqual(1);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7400
     * @tc.name testFloat32ArrayFindTWO074
     * @tc.desc Verify large array (1000 elements) hits the last position and returns the correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1000);
      arr.$_set(999, 777.0);
      let calls = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return value === 777.0;
      });
      expect(calls).assertEqual(1000);
      expect(result).assertEqual(777.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7500
     * @tc.name testFloat32ArrayFindTWO075
     * @tc.desc Verify large array (1000 elements) no match returns undefined and traverses all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1000);
      let calls = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return value !== 0.0;
      });
      expect(calls).assertEqual(1000);
      expect(arr.length).assertEqual(1000);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7600
     * @tc.name testFloat32ArrayFindTWO076
     * @tc.desc Verify large array middle hit, call count equals the hit index plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1000);
      arr.$_set(500, 42.0);
      let calls = 0;
      const result = arr.find((value, index, array) => {
        calls = calls + 1;
        return value === 42.0;
      });
      expect(calls).assertEqual(501);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7700
     * @tc.name testFloat32ArrayFindTWO077
     * @tc.desc Verify large array all identical values, always-true predicate returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(500);
      for (let i: int = 0; i < 500; i = i + 1) {
        arr.$_set(i, 9.0);
      }
      const result = arr.find((value, index, array) => value === 9.0);
      expect(result).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7800
     * @tc.name testFloat32ArrayFindTWO078
     * @tc.desc Verify large array verifies that on early match the call count is far less than the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2000);
      arr.$_set(3, 1.0);
      let calls = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        return value === 1.0;
      });
      expect(calls < 2000).assertTrue();
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_7900
     * @tc.name testFloat32ArrayFindTWO079
     * @tc.desc Verify large array (10000 elements) last-position hit, result correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(10000);
      arr.$_set(9999, 123.0);
      const result = arr.find((value, index, array) => value === 123.0);
      expect(result).assertEqual(123.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8000
     * @tc.name testFloat32ArrayFindTWO080
     * @tc.desc Verify find the first negative number in a mixed positive-negative array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, -1.0, 5.0, -2.0]);
      const result = arr.find((value, index, array) => value < 0.0);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8100
     * @tc.name testFloat32ArrayFindTWO081
     * @tc.desc Verify find the first element less than a specified negative threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-10.0, -50.0, -100.0]);
      const result = arr.find((value, index, array) => value < -50.0);
      expect(result).assertEqual(-100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8200
     * @tc.name testFloat32ArrayFindTWO082
     * @tc.desc Verify all-negative array find first negative number returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5.0, -1.0, -3.0]);
      const result = arr.find((value, index, array) => value < 0.0);
      expect(result).assertEqual(-5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8300
     * @tc.name testFloat32ArrayFindTWO083
     * @tc.desc Verify array containing -0 finds a strictly negative number (-0 is not counted as negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0, -1.0, -2.0]);
      const result = arr.find((value, index, array) => value < 0.0);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8400
     * @tc.name testFloat32ArrayFindTWO084
     * @tc.desc Verify find the first negative number less than -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -5.0, -3.0]);
      const result = arr.find((value, index, array) => value < -4.0);
      expect(result).assertEqual(-5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8500
     * @tc.name testFloat32ArrayFindTWO085
     * @tc.desc Verify predicate modifies an unvisited element, subsequent calls read the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let seen = 0.0;
      arr.find((value, index, array) => {
        if (index === 0) {
          array.$_set(1, 99.0);
        }
        if (index === 1) {
          seen = value;
        }
        return false;
      });
      expect(seen).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8600
     * @tc.name testFloat32ArrayFindTWO086
     * @tc.desc Verify predicate modifying an already-visited element does not affect already-traversed results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const visited: Array<number> = [];
      arr.find((value, index, array) => {
        visited.push(value);
        if (index === 1) {
          array.$_set(0, 999.0);
        }
        return false;
      });
      expect(visited[0]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8700
     * @tc.name testFloat32ArrayFindTWO087
     * @tc.desc Verify predicate modifying the current-index element does not affect this call's value argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let currentValue = 0.0;
      arr.find((value, index, array) => {
        currentValue = value;
        array.$_set(index, value + 1000.0);
        return index === 1;
      });
      expect(currentValue).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8800
     * @tc.name testFloat32ArrayFindTWO088
     * @tc.desc Verify predicate sets an element to NaN, subsequent Number.isNaN matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.find((value, index, array) => {
        if (index === 0) {
          array.$_set(1, NaN);
        }
        return Number.isNaN(value);
      });
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_8900
     * @tc.name testFloat32ArrayFindTWO089
     * @tc.desc Verify predicate modifies the last-position element, on last-position hit returns the modified value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.find((value, index, array) => {
        if (index === 0) {
          array.$_set(2, 88.0);
        }
        return index === 2;
      });
      expect(result).assertEqual(88.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_9000
     * @tc.name testFloat32ArrayFindTWO090
     * @tc.desc Verify find on a subarray view only traverses elements within the view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const view = arr.subarray(1, 4);
      const result = view.find((value, index, array) => value === -1.0);
      expect(result).assertEqual(-1);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_9100
     * @tc.name testFloat32ArrayFindTWO091
     * @tc.desc Verify find on a slice copy returns the correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const sliced = arr.slice(1, 3);
      const result = sliced.find((value, index, array) => value > 15.0);
      expect(result).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_9200
     * @tc.name testFloat32ArrayFindTWO092
     * @tc.desc Verify find on a reversed array hits the first element in reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.reverse();
      const result = arr.find((value, index, array) => value === -1.0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_9300
     * @tc.name testFloat32ArrayFindTWO093
     * @tc.desc Verify find on a filled array hits on the filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(7.0);
      const result = arr.find((value, index, array) => value === 7.0);
      expect(result).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_9400
     * @tc.name testFloat32ArrayFindTWO094
     * @tc.desc Verify find on an array generated by Float32Array.from with mapfn hits on the mapped value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = Float32Array.from<number>(src, (v, k) => v * 10.0);
      const result = arr.find((value, index, array) => value === 20.0);
      expect(result).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_9500
     * @tc.name testFloat32ArrayFindTWO095
     * @tc.desc Verify two views sharing the same buffer each find independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 1.0);
      a.$_set(1, 2.0);
      b.$_set(0, 3.0);
      b.$_set(1, 4.0);
      const ra = a.find((value, index, array) => value === 2.0);
      const rb = b.find((value, index, array) => value === 4.0);
      expect(ra).assertEqual(2.0);
      expect(rb).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_9600
     * @tc.name testFloat32ArrayFindTWO096
     * @tc.desc Verify find on a toReversed new array does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const reversed = arr.toReversed();
      const result = reversed.find((value, index, array) => value === -1.0);
      expect(result).assertEqual(-1);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDTWO_9700
     * @tc.name testFloat32ArrayFindTWO097
     * @tc.desc Verify find short-circuits immediately after the first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindTWO097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let calls: int = 0;
      const result = arr.find((value: number): boolean => {
        calls++;
        return value === 2.0;
      });
      expect(result).assertEqual(2.0);
      expect(calls).assertEqual(2);
    });

  });
}
