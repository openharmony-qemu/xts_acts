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
import Utils from './../Util.test';

function modifyArray(arr: Float64Array, idx: int, val: number): void {
  arr.$_set(idx, val);
}

export default function Float64ArrayBehaviorTest(): void {
  describe('Float64ArrayBehaviorTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0100
     * @tc.name testFloat64ArrayBehavior001
     * @tc.desc Verify variable alias sees $_set mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const b = a;
      a.$_set(0, 99.0);
      const actualElement0 = b.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0200
     * @tc.name testFloat64ArrayBehavior002
     * @tc.desc Verify variable alias sees fill mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, Number.MAX_SAFE_INTEGER);
      const b = a;
      a.fill(5.0);
      const actualElement0 = b.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = b.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0300
     * @tc.name testFloat64ArrayBehavior003
     * @tc.desc Verify reverse returns this identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0400
     * @tc.name testFloat64ArrayBehavior004
     * @tc.desc Verify fill returns this identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, NaN);
      const r = arr.fill(0.0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0500
     * @tc.name testFloat64ArrayBehavior005
     * @tc.desc Verify sort returns this identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0600
     * @tc.name testFloat64ArrayBehavior006
     * @tc.desc Verify copyWithin returns this identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r = arr.copyWithin(0, 2, 4);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0700
     * @tc.name testFloat64ArrayBehavior007
     * @tc.desc Verify subarray shares buffer and modifications propagate to parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(NaN, Number.MIN_VALUE, -0.0, Infinity);
      const sub = parent.subarray(1, 3);
      sub.$_set(0, 99.0);
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 99.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0800
     * @tc.name testFloat64ArrayBehavior008
     * @tc.desc Verify parent modification propagates to subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, NaN, Infinity);
      const sub = parent.subarray(1, 3);
      parent.$_set(1, 88.0);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 88.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_0900
     * @tc.name testFloat64ArrayBehavior009
     * @tc.desc Verify fill on parent visible in subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, NaN, Infinity);
      const sub = parent.subarray(1, 4);
      parent.fill(7.0, 0, 3);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = sub.$_get(1);
      const expectedElement1: number = 7.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1000
     * @tc.name testFloat64ArrayBehavior010
     * @tc.desc Verify valueOf returns same identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, -0.0);
      const v = arr.valueOf();
      expect(v).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1100
     * @tc.name testFloat64ArrayBehavior011
     * @tc.desc Verify valueOf chain multiple times returns same identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const firstResult = arr.valueOf();
      const secondResult = firstResult.valueOf();
      const thirdResult = secondResult.valueOf();
      expect(firstResult).assertEqual(arr);
      expect(secondResult).assertEqual(arr);
      expect(thirdResult).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1200
     * @tc.name testFloat64ArrayBehavior012
     * @tc.desc Verify valueOf then fill modifies original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const v = arr.valueOf();
      v.fill(9.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 9.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1300
     * @tc.name testFloat64ArrayBehavior013
     * @tc.desc Verify function parameter mutation visible outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      modifyArray(arr, 0, 77.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 77.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1400
     * @tc.name testFloat64ArrayBehavior014
     * @tc.desc Verify slice creates independent buffer (not alias)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, -0.0);
      const s = arr.slice(0, 2);
      expect(s.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1500
     * @tc.name testFloat64ArrayBehavior015
     * @tc.desc Verify subarray shares buffer (is alias)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const sub = arr.subarray(0, 2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1600
     * @tc.name testFloat64ArrayBehavior016
     * @tc.desc Verify reverse via alias reflects in original reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, Number.MAX_SAFE_INTEGER);
      const b = a;
      b.reverse();
      const actualElement0 = a.$_get(0);
      const expectedElement0: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = a.$_get(2);
      const expectedElement2: number = Number.MIN_VALUE;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1700
     * @tc.name testFloat64ArrayBehavior017
     * @tc.desc Verify sort via alias reflects in original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const b = a;
      b.sort();
      const actualElement0 = a.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = a.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1800
     * @tc.name testFloat64ArrayBehavior018
     * @tc.desc Verify fill via alias reflects in original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, NaN);
      const b = a;
      b.fill(0.0);
      const actualElement1 = a.$_get(1);
      const expectedElement1: number = 0.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_1900
     * @tc.name testFloat64ArrayBehavior019
     * @tc.desc Verify toSorted does not alias original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r = arr.toSorted();
      r.$_set(0, 99.0);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2000
     * @tc.name testFloat64ArrayBehavior020
     * @tc.desc Verify with does not alias original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, -0.0);
      const r = arr.with(0, 99.0);
      r.$_set(1, 88.0);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 88.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = Number.MIN_VALUE;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2100
     * @tc.name testFloat64ArrayBehavior021
     * @tc.desc Verify multiple subarray views from same parent all share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const s1 = parent.subarray(0, 2);
      const s2 = parent.subarray(2, 4);
      parent.$_set(0, 55.0);
      parent.$_set(2, 66.0);
      const actualElement0 = s1.$_get(0);
      const expectedElement0: number = 55.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = s2.$_get(0);
      const expectedElement0Second: number = 66.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2200
     * @tc.name testFloat64ArrayBehavior022
     * @tc.desc Verify nested subarray chain shares original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const s1 = parent.subarray(1, 4);
      const s2 = s1.subarray(1, 3);
      expect(s2.buffer).assertEqual(parent.buffer);
      parent.$_set(2, 77.0);
      const actualElement0 = s2.$_get(0);
      const expectedElement0: number = 77.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2300
     * @tc.name testFloat64ArrayBehavior023
     * @tc.desc Verify alias after sort and reverse combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const b = a;
      a.sort();
      b.reverse();
      const actualElement0 = a.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = b.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2400
     * @tc.name testFloat64ArrayBehavior024
     * @tc.desc Verify copyWithin via alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(NaN, Infinity, -Infinity, Number.MIN_VALUE);
      const b = a;
      b.copyWithin(0, 2, 4);
      const actualElement0 = a.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = a.$_get(1);
      const expectedElement1: number = Number.MIN_VALUE;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2500
     * @tc.name testFloat64ArrayBehavior025
     * @tc.desc Verify alias on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = new Float64Array(0);
      const b = a;
      expect(b).assertEqual(a);
      const actualLength = b.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2600
     * @tc.name testFloat64ArrayBehavior026
     * @tc.desc Verify forEach callback sees alias modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, NaN);
      const b = arr;
      arr.forEach((v: number, i: int): void => {
        if (i === 0) {
          b.$_set(1, 99.0);
        }
        if (i === 1) {
          const actualResult = v;
          const expectedResult: number = 99.0;
          expect(actualResult).assertEqual(expectedResult);
        }
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2700
     * @tc.name testFloat64ArrayBehavior027
     * @tc.desc Verify map callback sees alias modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, Infinity);
      const b = arr;
      const r = arr.map((v: number): number => {
        if (v === 1.0) {
          b.$_set(2, 99.0);
        }
        return v;
      });
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 99.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement2Second = arr.$_get(2);
      const expectedElement2Second: number = 99.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2800
     * @tc.name testFloat64ArrayBehavior028
     * @tc.desc Verify sort on empty array does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.sort();
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_2900
     * @tc.name testFloat64ArrayBehavior029
     * @tc.desc Verify sort on single element does not change order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(42.0);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 42.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3000
     * @tc.name testFloat64ArrayBehavior030
     * @tc.desc Verify copyWithin with target<start copies forward correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, Infinity);
      arr.copyWithin(0, 2, 4);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MIN_VALUE;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Infinity;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = Number.MIN_VALUE;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = Infinity;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3100
     * @tc.name testFloat64ArrayBehavior031
     * @tc.desc Verify copyWithin with target>start copies backward correctly (overlapping)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, Infinity, -0.0);
      arr.copyWithin(2, 0, 3);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = -Number.MAX_SAFE_INTEGER;
      expect(actualElement3).assertEqual(expectedElement3);
      const actualElementAt4 = arr.$_get(4);
      const expectedElementAt4: number = Number.MIN_VALUE;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3200
     * @tc.name testFloat64ArrayBehavior032
     * @tc.desc Verify fill with 0 length range does not change array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.fill(99.0, 1, 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3300
     * @tc.name testFloat64ArrayBehavior033
     * @tc.desc Verify a start index below negative length is clamped to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      arr.fill(99.0, -4);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 99.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3400
     * @tc.name testFloat64ArrayBehavior034
     * @tc.desc Verify reduce without initialValue starts from index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 10.0, 15.0);
      let callIndex: int = -1;
      const r = arr.reduce((acc: number, v: number, i: int): number => {
        if (callIndex === -1) {
          callIndex = i;
        }
        return acc + v;
      });
      const actualResult = callIndex;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = r;
      const expectedResultSecond: number = 30.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3500
     * @tc.name testFloat64ArrayBehavior035
     * @tc.desc Verify reduceRight without initialValue starts from length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 10.0, 15.0);
      let callIndex: int = -1;
      const r = arr.reduceRight((acc: number, v: number, i: int): number => {
        if (callIndex === -1) {
          callIndex = i;
        }
        return acc + v;
      });
      const actualResult = callIndex;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = r;
      const expectedResultSecond: number = 30.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3600
     * @tc.name testFloat64ArrayBehavior036
     * @tc.desc Verify subarray with begin>end returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, NaN);
      const sub = arr.subarray(3, 1);
      const actualLength = sub.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3700
     * @tc.name testFloat64ArrayBehavior037
     * @tc.desc Verify subarray begin<0 clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const sub = arr.subarray(-5, 2);
      const actualLength = sub.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3800
     * @tc.name testFloat64ArrayBehavior038
     * @tc.desc Verify slice with OOB returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, Number.MAX_SAFE_INTEGER, -0.0);
      const r = arr.slice(10, 20);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_3900
     * @tc.name testFloat64ArrayBehavior039
     * @tc.desc Verify includes with fromIndex > length returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const r = arr.includes(1.0, 5);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4000
     * @tc.name testFloat64ArrayBehavior040
     * @tc.desc Verify indexOf with fromIndex > length returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, Number.MAX_SAFE_INTEGER);
      const r = arr.indexOf(1.0, 5);
      const actualResult = r;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4100
     * @tc.name testFloat64ArrayBehavior041
     * @tc.desc Verify sort after sort maintains order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const sorted = arr.sort();
      sorted.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4200
     * @tc.name testFloat64ArrayBehavior042
     * @tc.desc Verify reverse after reverse restores original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, Number.MIN_VALUE);
      const reversed = arr.reverse();
      reversed.reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = -Number.MAX_SAFE_INTEGER;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = Number.MIN_VALUE;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4300
     * @tc.name testFloat64ArrayBehavior043
     * @tc.desc Verify set with exact length works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      const src: Float64Array = Float64Array.of(99.0, 100.0);
      arr.set(src);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 100.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4400
     * @tc.name testFloat64ArrayBehavior044
     * @tc.desc Verify fill then read each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.fill(0.0, 1, 3);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 0.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4500
     * @tc.name testFloat64ArrayBehavior045
     * @tc.desc Verify toSorted after toSorted returns sorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const sorted = arr.toSorted();
      const r = sorted.toSorted();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
      expect(arr).not().assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4600
     * @tc.name testFloat64ArrayBehavior046
     * @tc.desc Verify find on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.find((v: number): boolean => v > 0.0);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4700
     * @tc.name testFloat64ArrayBehavior047
     * @tc.desc Verify findIndex on empty returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.findIndex((v: number): boolean => true);
      const actualResult = r;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4800
     * @tc.name testFloat64ArrayBehavior048
     * @tc.desc Verify subarray end clamped when exceeding length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, -Infinity, Number.MAX_SAFE_INTEGER);
      const sub = arr.subarray(1, 10);
      const actualLength = sub.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_4900
     * @tc.name testFloat64ArrayBehavior049
     * @tc.desc Verify lastIndexOf with negative fromIndex searches from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 1.0);
      const r = arr.lastIndexOf(1.0, -1);
      const actualResult = r;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5000
     * @tc.name testFloat64ArrayBehavior050
     * @tc.desc Verify every returns true on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.every((v: number): boolean => v > 0.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5100
     * @tc.name testFloat64ArrayBehavior051
     * @tc.desc Verify with after with creates independent copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, Number.MIN_VALUE);
      const r1 = arr.with(0, 99.0);
      const r2 = arr.with(1, 88.0);
      const actualElement0 = r1.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r1.$_get(1);
      const expectedElement1: number = -Number.MAX_SAFE_INTEGER;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement0Second = r2.$_get(0);
      const expectedElement0Second: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = r2.$_get(1);
      const expectedElement1Second: number = 88.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5200
     * @tc.name testFloat64ArrayBehavior052
     * @tc.desc Verify reduce without initial on 2-element array calls callback once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0);
      let callCount: int = 0;
      const r = arr.reduce((acc: number, v: number): number => {
        callCount++;
        return acc + v;
      });
      const actualResult = callCount;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = r;
      const expectedResultSecond: number = 30.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5300
     * @tc.name testFloat64ArrayBehavior053
     * @tc.desc Verify copyWithin with count=0 does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, Number.MIN_VALUE);
      arr.copyWithin(0, 2, 2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = -Number.MAX_SAFE_INTEGER;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5400
     * @tc.name testFloat64ArrayBehavior054
     * @tc.desc Verify toReversed then toReversed returns original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const reversed = arr.toReversed();
      const r = reversed.toReversed();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5500
     * @tc.name testFloat64ArrayBehavior055
     * @tc.desc Verify set with zero-length source does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const source: Float64Array = Float64Array.of();
      arr.set(source);
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5600
     * @tc.name testFloat64ArrayBehavior056
     * @tc.desc Verify slice with negative begin treated as offset from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r = arr.slice(-2, 4);
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 4.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5700
     * @tc.name testFloat64ArrayBehavior057
     * @tc.desc Verify reduce on single element returns that element without calling callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(42.0);
      let called: boolean = false;
      const r = arr.reduce((acc: number, v: number): number => {
        called = true;
        return acc + v;
      });
      const actualResult = r;
      const expectedResult: number = 42.0;
      expect(actualResult).assertEqual(expectedResult);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5800
     * @tc.name testFloat64ArrayBehavior058
     * @tc.desc Verify reduceRight on single element returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(99.0);
      let called: boolean = false;
      const r = arr.reduceRight((acc: number, v: number): number => {
        called = true;
        return acc + v;
      });
      const actualResult = r;
      const expectedResult: number = 99.0;
      expect(actualResult).assertEqual(expectedResult);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_5900
     * @tc.name testFloat64ArrayBehavior059
     * @tc.desc Verify single element reverse returns this with same content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0);
      const r = arr.reverse();
      expect(r).assertEqual(arr);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6000
     * @tc.name testFloat64ArrayBehavior060
     * @tc.desc Verify single element sort returns this with same content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0);
      const r = arr.sort();
      expect(r).assertEqual(arr);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6100
     * @tc.name testFloat64ArrayBehavior061
     * @tc.desc Verify single element toReversed returns new array with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0);
      const r = arr.toReversed();
      expect(r).not().assertEqual(arr);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6200
     * @tc.name testFloat64ArrayBehavior062
     * @tc.desc Verify single element toSorted returns new array with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(8.0);
      const r = arr.toSorted();
      expect(r).not().assertEqual(arr);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 8.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6300
     * @tc.name testFloat64ArrayBehavior063
     * @tc.desc Verify single element slice returns independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(6.0);
      const r = arr.slice(0, 1);
      const actualLength = r.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 6.0;
      expect(actualElement0).assertEqual(expectedElement0);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6400
     * @tc.name testFloat64ArrayBehavior064
     * @tc.desc Verify single element subarray returns shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(4.0);
      const sub = arr.subarray(0, 1);
      const actualLength = sub.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 4.0;
      expect(actualElement0).assertEqual(expectedElement0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6500
     * @tc.name testFloat64ArrayBehavior065
     * @tc.desc Verify indexOf on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0);
      const actualIndex = arr.indexOf(5.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = arr.indexOf(99.0);
      const expectedIndexSecond: int = -1;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6600
     * @tc.name testFloat64ArrayBehavior066
     * @tc.desc Verify lastIndexOf on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0);
      const actualIndex = arr.lastIndexOf(3.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = arr.lastIndexOf(1.0);
      const expectedIndexSecond: int = -1;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6700
     * @tc.name testFloat64ArrayBehavior067
     * @tc.desc Verify includes on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(9.0);
      expect(arr.includes(9.0)).assertTrue();
      expect(arr.includes(0.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6800
     * @tc.name testFloat64ArrayBehavior068
     * @tc.desc Verify join on single element returns value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.5);
      const actualString = arr.join();
      const expectedString: string = '3.5';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join('-');
      const expectedStringSecond: string = '3.5';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_6900
     * @tc.name testFloat64ArrayBehavior069
     * @tc.desc Verify toString on single element returns value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0);
      const actualString = arr.toString();
      const expectedString: string = '7';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7000
     * @tc.name testFloat64ArrayBehavior070
     * @tc.desc Verify empty array toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const actualString = arr.toString();
      const expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7100
     * @tc.name testFloat64ArrayBehavior071
     * @tc.desc Verify empty array join returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const actualString = arr.join();
      const expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join(',');
      const expectedStringSecond: string = '';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7200
     * @tc.name testFloat64ArrayBehavior072
     * @tc.desc Verify empty array toReversed returns empty Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.toReversed();
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7300
     * @tc.name testFloat64ArrayBehavior073
     * @tc.desc Verify empty array toSorted returns empty Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.toSorted();
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7400
     * @tc.name testFloat64ArrayBehavior074
     * @tc.desc Verify empty array with throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      try {
        arr.with(0, 1.0);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7500
     * @tc.name testFloat64ArrayBehavior075
     * @tc.desc Verify two-element $_get index 0 and 1 both readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7600
     * @tc.name testFloat64ArrayBehavior076
     * @tc.desc Verify two-element at confirms positive and negative indexing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0);
      const actualResult = arr.at(0);
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr.at(1);
      const expectedResultSecond: number = 20.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr.at(-1);
      const expectedResultThird: number = 20.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = arr.at(-2);
      const expectedResultFourth: number = 10.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7700
     * @tc.name testFloat64ArrayBehavior077
     * @tc.desc Verify two-element reverse swaps elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      arr.reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7800
     * @tc.name testFloat64ArrayBehavior078
     * @tc.desc Verify fill on two-element partially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      arr.fill(99.0, 1, 2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 99.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_7900
     * @tc.name testFloat64ArrayBehavior079
     * @tc.desc Verify empty array toLocaleString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const actualString = arr.toLocaleString();
      const expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8000
     * @tc.name testFloat64ArrayBehavior080
     * @tc.desc Verify valueOf on empty array returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.valueOf();
      expect(r).assertEqual(arr);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8100
     * @tc.name testFloat64ArrayBehavior081
     * @tc.desc Verify set from forward overlapping subarray copies source snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, Infinity);
      arr.set(arr.subarray(0, 3), 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = -Number.MAX_SAFE_INTEGER;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = Number.MIN_VALUE;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8200
     * @tc.name testFloat64ArrayBehavior082
     * @tc.desc Verify set from backward overlapping subarray copies source snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, Infinity);
      arr.set(arr.subarray(1, 4), 0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Number.MAX_SAFE_INTEGER;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Number.MIN_VALUE;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = Infinity;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = Infinity;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8300
     * @tc.name testFloat64ArrayBehavior083
     * @tc.desc Verify critical static params store scientific value through hex and binary indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0x4);
      arr.$_set(0b10, 1e-308);
      const actualLength = arr.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1e-308;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8400
     * @tc.name testFloat64ArrayBehavior084
     * @tc.desc Verify sort preserves the signed-zero values in their original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, -0.0);
      arr.sort();
      const actualFirst: number = 1.0 / arr.$_get(0);
      const expectedFirst: number = Infinity;
      expect(actualFirst).assertEqual(expectedFirst);
      const actualSecond: number = 1.0 / arr.$_get(1);
      const expectedSecond: number = -Infinity;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8500
     * @tc.name testFloat64ArrayBehavior085
     * @tc.desc Verify toSorted returns sorted signed-zero values without changing the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, -0.0);
      const sorted: Float64Array = arr.toSorted();
      const actualSourceSecond: number = 1.0 / arr.$_get(1);
      const expectedSourceSecond: number = -Infinity;
      expect(actualSourceSecond).assertEqual(expectedSourceSecond);
      const actualSortedFirst: number = 1.0 / sorted.$_get(0);
      const expectedSortedFirst: number = Infinity;
      expect(actualSortedFirst).assertEqual(expectedSortedFirst);
      const actualSortedSecond: number = 1.0 / sorted.$_get(1);
      const expectedSortedSecond: number = -Infinity;
      expect(actualSortedSecond).assertEqual(expectedSortedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8600
     * @tc.name testFloat64ArrayBehavior086
     * @tc.desc Verify the constructor preserves negative zero for dollar-index access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-0.0]);
      const actualResult: number = 1.0 / arr.$_get(0);
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8700
     * @tc.name testFloat64ArrayBehavior087
     * @tc.desc Verify the constructor preserves negative zero for bracket access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-0.0]);
      const actualResult: number = 1.0 / arr[0];
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8800
     * @tc.name testFloat64ArrayBehavior088
     * @tc.desc Verify Float64Array.of preserves negative zero for dollar-index access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ofArr: Float64Array = Float64Array.of(-0.0);
      const actualResult: number = 1.0 / ofArr.$_get(0);
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_8900
     * @tc.name testFloat64ArrayBehavior089
     * @tc.desc Verify Float64Array.of preserves negative zero for bracket access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ofArr: Float64Array = Float64Array.of(-0.0);
      const actualResult: number = 1.0 / ofArr[0];
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_9000
     * @tc.name testFloat64ArrayBehavior090
     * @tc.desc Verify valueOf returns the same array and preserves its negative-zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0);
      const valueOfArr: Float64Array = arr.valueOf();
      expect(valueOfArr === arr).assertTrue();
      const actualResult: number = 1.0 / valueOfArr.$_get(0);
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BEHAVIOR_9100
     * @tc.name testFloat64ArrayBehavior091
     * @tc.desc Verify forEach does not change a negative-zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBehavior091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0);
      let callbackCount: int = 0;
      arr.forEach((v: number): void => {
        callbackCount++;
      });
      const expectedCallbackCount: int = 1;
      expect(callbackCount).assertEqual(expectedCallbackCount);
      const actualResult: number = 1.0 / arr.$_get(0);
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });
  })
}
