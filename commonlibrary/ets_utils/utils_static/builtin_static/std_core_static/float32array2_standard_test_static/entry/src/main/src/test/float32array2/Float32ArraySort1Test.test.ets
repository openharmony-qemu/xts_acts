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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArraySort1Test(): void {
  describe('Float32ArraySort1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0010
     * @tc.name testFloat32ArraySortOne001
     * @tc.desc Verify sort() default ascending on [3.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort();
      const element001 = arr.$_get(0);
      expect(element001).assertEqual(1.0);
      const element001Part2 = arr.$_get(2);
      expect(element001Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0020
     * @tc.name testFloat32ArraySortOne002
     * @tc.desc Verify sort() default ascending on [1.0, 2.0, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.sort();
      const element002 = arr.$_get(0);
      expect(element002).assertEqual(1.0);
      const element002Part2 = arr.$_get(3);
      expect(element002Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0030
     * @tc.name testFloat32ArraySortOne003
     * @tc.desc Verify sort() default ascending on [5.0, 4.0, 3.0, 2.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 4.0, 3.0, 2.0, 1.0]);
      arr.sort();
      const element003 = arr.$_get(0);
      expect(element003).assertEqual(1.0);
      const element003Part2 = arr.$_get(4);
      expect(element003Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0040
     * @tc.name testFloat32ArraySortOne004
     * @tc.desc Verify sort() default ascending on [42.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      arr.sort();
      expect(arr.length).assertEqual(1);
      const element004 = arr.$_get(0);
      expect(element004).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0050
     * @tc.name testFloat32ArraySortOne005
     * @tc.desc Verify sort() on empty Float32Array results in length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      arr.sort();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0060
     * @tc.name testFloat32ArraySortOne006
     * @tc.desc Verify sort() default ascending on [7.0, 7.0, 7.0, 7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 7.0, 7.0, 7.0]);
      arr.sort();
      const element006 = arr.$_get(0);
      expect(element006).assertEqual(7.0);
      const element006Part2 = arr.$_get(3);
      expect(element006Part2).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0070
     * @tc.name testFloat32ArraySortOne007
     * @tc.desc Verify sort with ascending compareFn on [3.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element007 = arr.$_get(0);
      expect(element007).assertEqual(1.0);
      const element007Part2 = arr.$_get(2);
      expect(element007Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0080
     * @tc.name testFloat32ArraySortOne008
     * @tc.desc Verify sort with compareFn on [1.0, 2.0, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.sort((a: number, b: number): int => { return a < b ? 1 : (a > b ? -1 : 0); });
      const element008 = arr.$_get(0);
      expect(element008).assertEqual(3.0);
      const element008Part2 = arr.$_get(2);
      expect(element008Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0090
     * @tc.name testFloat32ArraySortOne009
     * @tc.desc Verify sort with compareFn returning 0 on [3.0, 1.0, 2.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort((a: number, b: number): int => { return 0; });
      const element009 = arr.$_get(0);
      expect(element009).assertEqual(3.0);
      const element009Part2 = arr.$_get(1);
      expect(element009Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0100
     * @tc.name testFloat32ArraySortOne010
     * @tc.desc Verify sort(undefined) sorts ascending on [3.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort(undefined);
      const element010 = arr.$_get(0);
      expect(element010).assertEqual(1.0);
      const element010Part2 = arr.$_get(2);
      expect(element010Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0110
     * @tc.name testFloat32ArraySortOne011
     * @tc.desc Verify sort with compareFn returning 0 on [9.0, 4.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0, 4.0]);
      arr.sort((a: number, b: number): int => { return 0; });
      const element011 = arr.$_get(0);
      expect(element011).assertEqual(9.0);
      const element011Part2 = arr.$_get(1);
      expect(element011Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0120
     * @tc.name testFloat32ArraySortOne012
     * @tc.desc Verify sort with ascending compareFn on [5.0, 3.0] checks both elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0]);
      arr.sort((a: number, b: number): int => { return a > b ? 1 : (a < b ? -1 : 0); });
      const element012 = arr.$_get(0);
      expect(element012).assertEqual(3.0);
      const element012Part2 = arr.$_get(1);
      expect(element012Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0130
     * @tc.name testFloat32ArraySortOne013
     * @tc.desc Verify sort with compareFn on [8.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([8.0, 2.0]);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element013 = arr.$_get(0);
      expect(element013).assertEqual(2.0);
      const element013Part2 = arr.$_get(1);
      expect(element013Part2).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0140
     * @tc.name testFloat32ArraySortOne014
     * @tc.desc Verify sort with compareFn using MAX_VALUE on [2.0, 1.0, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 1.0, 3.0]);
      arr.sort((a: number, b: number): int => { return a > b ? 2147483647 : (a < b ? -1 : 0); });
      const element014 = arr.$_get(0);
      expect(element014).assertEqual(1.0);
      const element014Part2 = arr.$_get(2);
      expect(element014Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0150
     * @tc.name testFloat32ArraySortOne015
     * @tc.desc Verify sort with compareFn using MIN_VALUE on [2.0, 1.0, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 1.0, 3.0]);
      arr.sort((a: number, b: number): int => { return a > b ? 1 : (a < b ? -2147483648 : 0); });
      const element015 = arr.$_get(0);
      expect(element015).assertEqual(1.0);
      const element015Part2 = arr.$_get(2);
      expect(element015Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0160
     * @tc.name testFloat32ArraySortOne016
     * @tc.desc Verify sort with compareFn using MAX_VALUE matches standard sort on [4.0, 2.0, 6.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float32Array([4.0, 2.0, 6.0, 1.0]);
      arr1.sort((a: number, b: number): int => { return a > b ? 1 : (a < b ? -1 : 0); });
      const arr2 = new Float32Array([4.0, 2.0, 6.0, 1.0]);
      arr2.sort((a: number, b: number): int => { return a > b ? 2147483647 : (a < b ? -1 : 0); });
      const element016 = arr1.$_get(0);
      expect(element016).assertEqual(arr2.$_get(0));
      const element016Part2 = arr1.$_get(3);
      expect(element016Part2).assertEqual(arr2.$_get(3));
      expect(arr1.$_get(0)).assertEqual(1.0);
      expect(arr1.$_get(1)).assertEqual(2.0);
      expect(arr1.$_get(2)).assertEqual(4.0);
      expect(arr1.$_get(3)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0170
     * @tc.name testFloat32ArraySortOne017
     * @tc.desc Verify sort with compareFn using MIN_VALUE matches standard sort on [4.0, 2.0, 6.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float32Array([4.0, 2.0, 6.0, 1.0]);
      arr1.sort((a: number, b: number): int => { return a > b ? 1 : (a < b ? -1 : 0); });
      const arr2 = new Float32Array([4.0, 2.0, 6.0, 1.0]);
      arr2.sort((a: number, b: number): int => { return a > b ? 1 : (a < b ? -2147483648 : 0); });
      const element017 = arr1.$_get(0);
      expect(element017).assertEqual(arr2.$_get(0));
      const element017Part2 = arr1.$_get(3);
      expect(element017Part2).assertEqual(arr2.$_get(3));
      expect(arr1.$_get(0)).assertEqual(1.0);
      expect(arr1.$_get(1)).assertEqual(2.0);
      expect(arr1.$_get(2)).assertEqual(4.0);
      expect(arr1.$_get(3)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0180
     * @tc.name testFloat32ArraySortOne018
     * @tc.desc Verify sort with compareFn on [3.0, 3.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 3.0, 1.0]);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element018 = arr.$_get(0);
      expect(element018).assertEqual(1.0);
      const element018Part2 = arr.$_get(1);
      expect(element018Part2).assertEqual(3.0);
      const element018Part3 = arr.$_get(2);
      expect(element018Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0190
     * @tc.name testFloat32ArraySortOne019
     * @tc.desc Verify sort with compareFn returning 0 on [4.0, 1.0, 3.0, 2.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4.0, 1.0, 3.0, 2.0]);
      arr.sort((a: number, b: number): int => {
        if (a < b) { return -1; }
        if (a > b) { return 1; }
        return 0;
      });
      const element019 = arr.$_get(0);
      expect(element019).assertEqual(1.0);
      const element019Part2 = arr.$_get(3);
      expect(element019Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0200
     * @tc.name testFloat32ArraySortOne020
     * @tc.desc Verify sort with compareFn on [10.0, 5.0, 20.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 5.0, 20.0]);
      arr.sort((a: number, b: number): int => { return a > b ? 100 : (a < b ? -100 : 0); });
      const element020 = arr.$_get(0);
      expect(element020).assertEqual(5.0);
      const element020Part2 = arr.$_get(2);
      expect(element020Part2).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0210
     * @tc.name testFloat32ArraySortOne021
     * @tc.desc Verify sort with compareFn returning 0 on [6.0, 3.0, 9.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([6.0, 3.0, 9.0]);
      arr.sort((a: number, b: number): int => {
        if (a < b) { return -1; } else if (a > b) { return 1; }
        return 0;
      });
      const element021 = arr.$_get(0);
      expect(element021).assertEqual(3.0);
      const element021Part2 = arr.$_get(2);
      expect(element021Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0220
     * @tc.name testFloat32ArraySortOne022
     * @tc.desc Verify sort with compareFn on [-5.0, 3.0, -1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5.0, 3.0, -1.0, 2.0]);
      arr.sort((a: number, b: number): int => {
        const absA = a < 0 ? -a : a;
        const absB = b < 0 ? -b : b;
        return absA < absB ? -1 : (absA > absB ? 1 : 0);
      });
      const element022 = arr.$_get(0);
      expect(element022).assertEqual(-1.0);
      const element022Part2 = arr.$_get(3);
      expect(element022Part2).assertEqual(-5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0230
     * @tc.name testFloat32ArraySortOne023
     * @tc.desc Verify sort with compareFn on [2.0, 4.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 4.0, 1.0]);
      arr.sort((a: number, b: number): int => {
        const invA = 1.0 / a;
        const invB = 1.0 / b;
        return invA < invB ? -1 : (invA > invB ? 1 : 0);
      });
      const element023 = arr.$_get(0);
      expect(element023).assertEqual(4.0);
      const element023Part2 = arr.$_get(2);
      expect(element023Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0240
     * @tc.name testFloat32ArraySortOne024
     * @tc.desc Verify sort with compareFn on [-3.0, 2.0, -1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.0, 2.0, -1.0]);
      arr.sort((a: number, b: number): int => {
        const sqA = a * a;
        const sqB = b * b;
        return sqA < sqB ? -1 : (sqA > sqB ? 1 : 0);
      });
      const element024 = arr.$_get(0);
      expect(element024).assertEqual(-1.0);
      const element024Part2 = arr.$_get(2);
      expect(element024Part2).assertEqual(-3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0250
     * @tc.name testFloat32ArraySortOne025
     * @tc.desc Verify sort with compareFn returning 0 on [5.0, 3.0, 8.0, 1.0, 9.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0, 8.0, 1.0, 9.0]);
      arr.sort((a: number, b: number): int => { return 0; });
      const element025 = arr.$_get(0);
      expect(element025).assertEqual(5.0);
      const element025Part2 = arr.$_get(4);
      expect(element025Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0260
     * @tc.name testFloat32ArraySortOne026
     * @tc.desc Verify sort with compareFn on [3.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0]);
      try {
        arr.sort((a: number, b: number): int => { throw new Error('cmp error'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0270
     * @tc.name testFloat32ArraySortOne027
     * @tc.desc Verify sort with compareFn that throws RangeError propagates the exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      try {
        arr.sort((a: number, b: number): int => { throw new RangeError('range'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0280
     * @tc.name testFloat32ArraySortOne028
     * @tc.desc Verify sort with compareFn on [5.0, 2.0, 8.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 2.0, 8.0, 1.0]);
      const threshold: number = 4.0;
      arr.sort((a: number, b: number): int => {
        const distA = a - threshold;
        const distB = b - threshold;
        const absA = distA < 0 ? -distA : distA;
        const absB = distB < 0 ? -distB : distB;
        return absA < absB ? -1 : (absA > absB ? 1 : 0);
      });
      const element036 = arr.$_get(0);
      expect(element036).assertEqual(5.0);
      const element036Part2 = arr.$_get(3);
      expect(element036Part2).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0290
     * @tc.name testFloat32ArraySortOne029
     * @tc.desc Verify sort with ascending compareFn on [3.0, 1.0, 4.0, 1.0, 5.0] checks all 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 4.0, 1.0, 5.0]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      expect(arr.$_get(2)).assertEqual(3.0);
      expect(arr.$_get(3)).assertEqual(4.0);
      expect(arr.$_get(4)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0300
     * @tc.name testFloat32ArraySortOne030
     * @tc.desc Verify sort with descending compareFn on [3.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort((a: number, b: number): int => {
        return a > b ? -1 : (a < b ? 1 : 0);
      });
      expect(arr.$_get(0)).assertEqual(3.0);
      expect(arr.$_get(1)).assertEqual(2.0);
      expect(arr.$_get(2)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0310
     * @tc.name testFloat32ArraySortOne031
     * @tc.desc Verify sort with compareFn scaling by factor 2.0 on [3.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      const factor: number = 2.0;
      arr.sort((a: number, b: number): int => {
        const sa = a * factor;
        const sb = b * factor;
        return sa < sb ? -1 : (sa > sb ? 1 : 0);
      });
      const element040 = arr.$_get(0);
      expect(element040).assertEqual(1.0);
      const element040Part2 = arr.$_get(2);
      expect(element040Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0320
     * @tc.name testFloat32ArraySortOne032
     * @tc.desc Verify sort with ascending compareFn on [3.0, 1.0, 4.0, 1.0, 5.0] checks first element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 4.0, 1.0, 5.0]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      const element041 = arr.$_get(0);
      expect(element041).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0330
     * @tc.name testFloat32ArraySortOne033
     * @tc.desc Verify sort with compareFn on [3.0, 1.0, 2.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0, 4.0]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      const element043 = arr.$_get(0);
      expect(element043).assertEqual(1.0);
      const element043Part2 = arr.$_get(3);
      expect(element043Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0340
     * @tc.name testFloat32ArraySortOne034
     * @tc.desc Verify sort with compareFn verifies invoked flag on [5.0, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0]);
      let invoked = false;
      arr.sort((a: number, b: number): int => {
        invoked = true;
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(invoked).assertTrue();
      const element044 = arr.$_get(0);
      expect(element044).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0350
     * @tc.name testFloat32ArraySortOne035
     * @tc.desc Verify sort with compareFn on [3.0, 7.0, 1.0, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 7.0, 1.0, 5.0]);
      let maxSeen: number = 0.0;
      arr.sort((a: number, b: number): int => {
        if (a > maxSeen) { maxSeen = a; }
        if (b > maxSeen) { maxSeen = b; }
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(maxSeen).assertEqual(7.0);
      const element045 = arr.$_get(3);
      expect(element045).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0360
     * @tc.name testFloat32ArraySortOne036
     * @tc.desc Verify sort with inline ascending compareFn on [4.0, 2.0, 6.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4.0, 2.0, 6.0]);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element046 = arr.$_get(0);
      expect(element046).assertEqual(2.0);
      const element046Part2 = arr.$_get(2);
      expect(element046Part2).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0370
     * @tc.name testFloat32ArraySortOne037
     * @tc.desc Verify sort with named compareFn variable on [4.0, 2.0, 6.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cmpFn = (a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); };
      const arr = new Float32Array([4.0, 2.0, 6.0]);
      arr.sort(cmpFn);
      const element047 = arr.$_get(0);
      expect(element047).assertEqual(2.0);
      const element047Part2 = arr.$_get(2);
      expect(element047Part2).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0380
     * @tc.name testFloat32ArraySortOne038
     * @tc.desc Verify sort with descending named compareFn on [4.0, 2.0, 6.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descFn = (a: number, b: number): int => { return a < b ? 1 : (a > b ? -1 : 0); };
      const arr = new Float32Array([4.0, 2.0, 6.0]);
      arr.sort(descFn);
      const element048 = arr.$_get(0);
      expect(element048).assertEqual(6.0);
      const element048Part2 = arr.$_get(2);
      expect(element048Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0390
     * @tc.name testFloat32ArraySortOne039
     * @tc.desc Verify sort with compareFn returning 0 on [5.0, 2.0, 8.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 2.0, 8.0]);
      arr.sort((a: number, b: number): int => { return 0; });
      const element049 = arr.$_get(0);
      expect(element049).assertEqual(5.0);
      const element049Part2 = arr.$_get(2);
      expect(element049Part2).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0400
     * @tc.name testFloat32ArraySortOne040
     * @tc.desc Verify sort with compareFn filtering a<4.0 on [5.0, 3.0, 7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0, 7.0]);
      arr.sort((a: number, b: number): int => {
        return a < 4.0 ? -1 : 1;
      });
      const element050 = arr.$_get(0);
      expect(element050).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0410
     * @tc.name testFloat32ArraySortOne041
     * @tc.desc Verify sort with compareFn filtering b<4.0 on [5.0, 3.0, 7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0, 7.0]);
      arr.sort((a: number, b: number): int => {
        return b < 4.0 ? 1 : -1;
      });
      const element051 = arr.$_get(0);
      expect(element051).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0420
     * @tc.name testFloat32ArraySortOne042
     * @tc.desc Verify sort with parenthesized compareFn on [3.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort((a: number, b: number): int => { return (a < b) ? -1 : ((a > b) ? 1 : 0); });
      const element052 = arr.$_get(0);
      expect(element052).assertEqual(1.0);
      const element052Part2 = arr.$_get(2);
      expect(element052Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0430
     * @tc.name testFloat32ArraySortOne043
     * @tc.desc Verify sort with compareFn delegating to helper function on [3.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const helper = (x: number, y: number): int => { return x < y ? -1 : (x > y ? 1 : 0); };
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort((a: number, b: number): int => { return helper(a, b); });
      const element053 = arr.$_get(0);
      expect(element053).assertEqual(1.0);
      const element053Part2 = arr.$_get(2);
      expect(element053Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0440
     * @tc.name testFloat32ArraySortOne044
     * @tc.desc Verify sort with compareFn on [5.0, 3.0, 1.0, 4.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float32Array([5.0, 3.0, 1.0, 4.0, 2.0]);
      arr1.sort();
      const arr2 = new Float32Array([5.0, 3.0, 1.0, 4.0, 2.0]);
      arr2.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element054 = arr1.$_get(0);
      expect(element054).assertEqual(arr2.$_get(0));
      const element054Part2 = arr1.$_get(4);
      expect(element054Part2).assertEqual(arr2.$_get(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0450
     * @tc.name testFloat32ArraySortOne045
     * @tc.desc Verify sort() and sort(undefined) produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float32Array([5.0, 3.0, 1.0, 4.0, 2.0]);
      arr1.sort();
      const arr2 = new Float32Array([5.0, 3.0, 1.0, 4.0, 2.0]);
      arr2.sort(undefined);
      const element055 = arr1.$_get(0);
      expect(element055).assertEqual(arr2.$_get(0));
      const element055Part2 = arr1.$_get(4);
      expect(element055Part2).assertEqual(arr2.$_get(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0460
     * @tc.name testFloat32ArraySortOne046
     * @tc.desc Verify sort() on [3,NaN,1] places NaN at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, Number.NaN, 1.0]);
      arr.sort();
      const element056 = arr.$_get(0);
      expect(element056).assertEqual(1.0);
      const element056Part2 = arr.$_get(2);
      expect(element056Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0470
     * @tc.name testFloat32ArraySortOne047
     * @tc.desc Verify sort with compareFn on [3.0, NaN, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, Number.NaN, 1.0]);
      arr.sort((a: number, b: number): int => {
        if (a !== a) { return 1; }
        if (b !== b) { return -1; }
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      const element057 = arr.$_get(0);
      expect(element057).assertEqual(1.0);
      const element057Part2 = arr.$_get(2);
      expect(element057Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0480
     * @tc.name testFloat32ArraySortOne048
     * @tc.desc Verify sort() on negatives sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, -1.0, 2.0, -5.0]);
      arr.sort();
      const element058 = arr.$_get(0);
      expect(element058).assertEqual(-5.0);
      const element058Part2 = arr.$_get(3);
      expect(element058Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0490
     * @tc.name testFloat32ArraySortOne049
     * @tc.desc Verify sort() and sort(compareFn) on empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float32Array(0);
      arr1.sort();
      const arr2 = new Float32Array(0);
      arr2.sort((a: number, b: number): int => { return 0; });
      expect(arr1.length).assertEqual(0);
      expect(arr2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0500
     * @tc.name testFloat32ArraySortOne050
     * @tc.desc Verify sort() handles Float32 max value 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 3.4028234663852886e+38, 2.0]);
      arr.sort();
      const element060 = arr.$_get(0);
      expect(element060).assertEqual(1.0);
      const element060Part2 = arr.$_get(2);
      expect(element060Part2).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0510
     * @tc.name testFloat32ArraySortOne051
     * @tc.desc Verify sort() handles Float32 min positive value 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 1.1754943508222875e-38, 1.0]);
      arr.sort();
      const element061 = arr.$_get(0);
      expect(element061).assertEqual(1.1754943508222875e-38);
      const element061Part2 = arr.$_get(2);
      expect(element061Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0520
     * @tc.name testFloat32ArraySortOne052
     * @tc.desc Verify sort() handles subnormal value 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.401298464324817e-45, 0.5]);
      arr.sort();
      const element062 = arr.$_get(0);
      expect(element062).assertEqual(1.401298464324817e-45);
      const element062Part2 = arr.$_get(2);
      expect(element062Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0530
     * @tc.name testFloat32ArraySortOne053
     * @tc.desc Verify sort() handles negative max value -3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -3.4028234663852886e+38, 0.0]);
      arr.sort();
      const element063 = arr.$_get(0);
      expect(element063).assertEqual(-3.4028234663852886e+38);
      const element063Part2 = arr.$_get(2);
      expect(element063Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0540
     * @tc.name testFloat32ArraySortOne054
     * @tc.desc Verify sort() places NaN at end with one NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, Number.NaN, 1.0, 2.0]);
      arr.sort();
      const element064 = arr.$_get(0);
      expect(element064).assertEqual(1.0);
      const element064Part2 = arr.$_get(3);
      expect(element064Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0550
     * @tc.name testFloat32ArraySortOne055
     * @tc.desc Verify sort() handles multiple NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, Number.NaN, 1.0, Number.NaN, 2.0]);
      arr.sort();
      const element065 = arr.$_get(0);
      expect(element065).assertEqual(1.0);
      const element065Part2 = arr.$_get(3);
      expect(element065Part2).assertNaN();
      const element065Part3 = arr.$_get(4);
      expect(element065Part3).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0560
     * @tc.name testFloat32ArraySortOne056
     * @tc.desc Verify sort() places Infinity before NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.POSITIVE_INFINITY, 3.0, Number.NaN]);
      arr.sort();
      const element066 = arr.$_get(0);
      expect(element066).assertEqual(1.0);
      const element066Part2 = arr.$_get(2);
      expect(element066Part2).assertEqual(Number.POSITIVE_INFINITY);
      const element066Part3 = arr.$_get(3);
      expect(element066Part3).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0570
     * @tc.name testFloat32ArraySortOne057
     * @tc.desc Verify sort() places -Infinity before finite numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, -Number.POSITIVE_INFINITY, 1.0, 2.0]);
      arr.sort();
      const element067 = arr.$_get(0);
      expect(element067).assertEqual(-Number.POSITIVE_INFINITY);
      const element067Part2 = arr.$_get(3);
      expect(element067Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0580
     * @tc.name testFloat32ArraySortOne058
     * @tc.desc Verify sort() ascending on [0.0, -0.0, 1.0, -1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -0.0, 1.0, -1.0]);
      arr.sort();
      const element068 = arr.$_get(0);
      expect(element068).assertEqual(-1.0);
      const element068Part2 = arr.$_get(3);
      expect(element068Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0590
     * @tc.name testFloat32ArraySortOne059
     * @tc.desc Verify sort() orders -Infinity, finite, Infinity, NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, -Number.POSITIVE_INFINITY, Number.NaN, 0.0, -2.0, Number.POSITIVE_INFINITY]);
      arr.sort();
      const element069 = arr.$_get(0);
      expect(element069).assertEqual(-Number.POSITIVE_INFINITY);
      const element069Part2 = arr.$_get(5);
      expect(element069Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0600
     * @tc.name testFloat32ArraySortOne060
     * @tc.desc Verify sort() treats 1.0e40 as Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.0e40, 2.0]);
      arr.sort();
      const element070 = arr.$_get(0);
      expect(element070).assertEqual(1.0);
      const element070Part2 = arr.$_get(2);
      expect(element070Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0610
     * @tc.name testFloat32ArraySortOne061
     * @tc.desc Verify sort() treats -1.0e40 as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -1.0e40, 2.0]);
      arr.sort();
      const element071 = arr.$_get(0);
      expect(element071).assertEqual(-Number.POSITIVE_INFINITY);
      const element071Part2 = arr.$_get(2);
      expect(element071Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0620
     * @tc.name testFloat32ArraySortOne062
     * @tc.desc Verify sort() underflows 1.0e-46 to 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.0e-46, 2.0]);
      arr.sort();
      const element072 = arr.$_get(0);
      expect(element072).assertEqual(0.0);
      const element072Part2 = arr.$_get(2);
      expect(element072Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0630
     * @tc.name testFloat32ArraySortOne063
     * @tc.desc Verify sort() handles max safe integer 16777216.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 16777216.0, 2.0]);
      arr.sort();
      const element073 = arr.$_get(0);
      expect(element073).assertEqual(1.0);
      const element073Part2 = arr.$_get(2);
      expect(element073Part2).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0640
     * @tc.name testFloat32ArraySortOne064
     * @tc.desc Verify sort() treats 16777217 equal to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217.0, 16777216.0, 1.0]);
      arr.sort();
      const element074 = arr.$_get(0);
      expect(element074).assertEqual(1.0);
      const element074Part2 = arr.$_get(1);
      expect(element074Part2).assertEqual(16777216.0);
      const element074Part3 = arr.$_get(2);
      expect(element074Part3).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0650
     * @tc.name testFloat32ArraySortOne065
     * @tc.desc Verify sort() ascending on [0.3, 0.1, 0.2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.3, 0.1, 0.2]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(0.10000000149011612);
      expect(arr.$_get(1)).assertEqual(0.20000000298023224);
      expect(arr.$_get(2)).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0660
     * @tc.name testFloat32ArraySortOne066
     * @tc.desc Verify sort() ascending on [1.0000001, 1.1, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0000001, 1.1, 1.0]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(1.0000001192092896);
      expect(arr.$_get(2)).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0670
     * @tc.name testFloat32ArraySortOne067
     * @tc.desc Verify sort() ascending on [500.0, 1000.0, 250.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([500.0, 1.0e3, 250.0]);
      arr.sort();
      const element077 = arr.$_get(0);
      expect(element077).assertEqual(250.0);
      const element077Part2 = arr.$_get(2);
      expect(element077Part2).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0680
     * @tc.name testFloat32ArraySortOne068
     * @tc.desc Verify sort() ascending on [10.0, 8.5, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 8.5, 5.0]);
      arr.sort();
      const element078 = arr.$_get(0);
      expect(element078).assertEqual(5.0);
      const element078Part2 = arr.$_get(2);
      expect(element078Part2).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0690
     * @tc.name testFloat32ArraySortOne069
     * @tc.desc Verify sort() treats -0.0 and 0.0 as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0, 0.0, -1.0, 1.0]);
      arr.sort();
      const element079 = arr.$_get(0);
      expect(element079).assertEqual(-1.0);
      const negativeZero = arr.$_get(1);
      const positiveZero = arr.$_get(2);
      expect(1.0 / negativeZero).assertEqual(-Number.POSITIVE_INFINITY);
      expect(1.0 / positiveZero).assertEqual(Number.POSITIVE_INFINITY);
      const element079Part2 = arr.$_get(3);
      expect(element079Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0700
     * @tc.name testFloat32ArraySortOne070
     * @tc.desc Verify sort() ascending on subnormal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45, 0.0, 2.802596928649634e-45]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(0.0);
      expect(arr.$_get(1)).assertEqual(1.401298464324817e-45);
      expect(arr.$_get(2)).assertEqual(2.802596928649634e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0710
     * @tc.name testFloat32ArraySortOne071
     * @tc.desc Verify sort() handles Infinity as largest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, Number.POSITIVE_INFINITY, 1.0]);
      arr.sort();
      const element081 = arr.$_get(0);
      expect(element081).assertEqual(1.0);
      const element081Part2 = arr.$_get(1);
      expect(element081Part2).assertEqual(3.4028234663852886e+38);
      const element081Part3 = arr.$_get(2);
      expect(element081Part3).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0720
     * @tc.name testFloat32ArraySortOne072
     * @tc.desc Verify sort with compareFn using MAX_VALUE on [9.0, 3.0, 7.0, 1.0, 5.0, 8.0, 2.0, 6.0, 4.0, 0.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0, 3.0, 7.0, 1.0, 5.0, 8.0, 2.0, 6.0, 4.0, 0.0]);
      arr.sort((a: number, b: number): int => { return a > b ? 2147483647 : (a < b ? -1 : 0); });
      const element082 = arr.$_get(0);
      expect(element082).assertEqual(0.0);
      const element082Part2 = arr.$_get(9);
      expect(element082Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0730
     * @tc.name testFloat32ArraySortOne073
     * @tc.desc Verify sort with compareFn using MIN_VALUE on [9.0, 3.0, 7.0, 1.0, 5.0, 8.0, 2.0, 6.0, 4.0, 0.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0, 3.0, 7.0, 1.0, 5.0, 8.0, 2.0, 6.0, 4.0, 0.0]);
      arr.sort((a: number, b: number): int => { return a > b ? 1 : (a < b ? -2147483648 : 0); });
      const element083 = arr.$_get(0);
      expect(element083).assertEqual(0.0);
      const element083Part2 = arr.$_get(9);
      expect(element083Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0740
     * @tc.name testFloat32ArraySortOne074
     * @tc.desc Verify sort() handles 2147483647.0 (max int32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2147483647.0, 2.0]);
      arr.sort();
      const element084 = arr.$_get(0);
      expect(element084).assertEqual(1.0);
      const element084Part2 = arr.$_get(2);
      expect(element084Part2).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0750
     * @tc.name testFloat32ArraySortOne075
     * @tc.desc Verify sort() handles -2147483648.0 (min int32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -2147483648.0, 2.0]);
      arr.sort();
      const element085 = arr.$_get(0);
      expect(element085).assertEqual(-2147483648.0);
      const element085Part2 = arr.$_get(2);
      expect(element085Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0760
     * @tc.name testFloat32ArraySortOne076
     * @tc.desc Verify sort() ascending on [-1.0, 0.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -1.0, 0.0]);
      arr.sort();
      const element086 = arr.$_get(0);
      expect(element086).assertEqual(-1.0);
      const element086Part2 = arr.$_get(1);
      expect(element086Part2).assertEqual(0.0);
      const element086Part3 = arr.$_get(2);
      expect(element086Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0770
     * @tc.name testFloat32ArraySortOne077
     * @tc.desc Verify sort() ascending on 100 descending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      let val: number = 100.0;
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, val);
        val = val - 1.0;
      }
      arr.sort();
      const element087 = arr.$_get(0);
      expect(element087).assertEqual(1.0);
      const element087Part2 = arr.$_get(99);
      expect(element087Part2).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0780
     * @tc.name testFloat32ArraySortOne078
     * @tc.desc Verify sort() ascending on 100 ascending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      let val: number = 1.0;
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, val);
        val = val + 1.0;
      }
      arr.sort();
      const element088 = arr.$_get(0);
      expect(element088).assertEqual(1.0);
      const element088Part2 = arr.$_get(99);
      expect(element088Part2).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0790
     * @tc.name testFloat32ArraySortOne079
     * @tc.desc Verify sort() on array of 100 identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, 7.0);
      }
      arr.sort();
      const element089 = arr.$_get(0);
      expect(element089).assertEqual(7.0);
      const element089Part2 = arr.$_get(99);
      expect(element089Part2).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0800
     * @tc.name testFloat32ArraySortOne080
     * @tc.desc Verify sort() ascending on [5.0, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0]);
      arr.sort();
      const element090 = arr.$_get(0);
      expect(element090).assertEqual(3.0);
      const element090Part2 = arr.$_get(1);
      expect(element090Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0810
     * @tc.name testFloat32ArraySortOne081
     * @tc.desc Verify sort() ascending on [3.0, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 5.0]);
      arr.sort();
      const element091 = arr.$_get(0);
      expect(element091).assertEqual(3.0);
      const element091Part2 = arr.$_get(1);
      expect(element091Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0820
     * @tc.name testFloat32ArraySortOne082
     * @tc.desc Verify sort() ascending on [7.0, 3.0, 9.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 3.0, 9.0]);
      arr.sort();
      const element092 = arr.$_get(0);
      expect(element092).assertEqual(3.0);
      const element092Part2 = arr.$_get(1);
      expect(element092Part2).assertEqual(7.0);
      const element092Part3 = arr.$_get(2);
      expect(element092Part3).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0830
     * @tc.name testFloat32ArraySortOne083
     * @tc.desc Verify sort() ascending on [5.0, 3.0, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0, 5.0]);
      arr.sort();
      const element093 = arr.$_get(0);
      expect(element093).assertEqual(3.0);
      const element093Part2 = arr.$_get(1);
      expect(element093Part2).assertEqual(5.0);
      const element093Part3 = arr.$_get(2);
      expect(element093Part3).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0840
     * @tc.name testFloat32ArraySortOne084
     * @tc.desc Verify sort() ascending on [-3.0, 5.0, 0.0, -1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.0, 5.0, 0.0, -1.0, 2.0]);
      arr.sort();
      const element094 = arr.$_get(0);
      expect(element094).assertEqual(-3.0);
      const element094Part2 = arr.$_get(2);
      expect(element094Part2).assertEqual(0.0);
      const element094Part3 = arr.$_get(4);
      expect(element094Part3).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0850
     * @tc.name testFloat32ArraySortOne085
     * @tc.desc Verify sort() ascending on all negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5.0, -1.0, -3.0, -2.0]);
      arr.sort();
      const element095 = arr.$_get(0);
      expect(element095).assertEqual(-5.0);
      const element095Part2 = arr.$_get(3);
      expect(element095Part2).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0860
     * @tc.name testFloat32ArraySortOne086
     * @tc.desc Verify sort() handles -0.0 and 0.0 equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -0.0, 0.0]);
      arr.sort();
      const element096 = arr.$_get(0);
      expect(element096).assertEqual(0.0);
      const element096Part2 = arr.$_get(2);
      expect(element096Part2).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0870
     * @tc.name testFloat32ArraySortOne087
     * @tc.desc Verify sort with compareFn ascending on [2.0, 1.0, 2.0, 1.0, 2.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 1.0, 2.0, 1.0, 2.0, 1.0]);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element097 = arr.$_get(0);
      expect(element097).assertEqual(1.0);
      const element097Part2 = arr.$_get(1);
      expect(element097Part2).assertEqual(1.0);
      const element097Part3 = arr.$_get(2);
      expect(element097Part3).assertEqual(1.0);
      const element097Part4 = arr.$_get(3);
      expect(element097Part4).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0880
     * @tc.name testFloat32ArraySortOne088
     * @tc.desc Verify sort with compareFn returning 0 on [4.0, 4.0, 4.0, 4.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4.0, 4.0, 4.0, 4.0]);
      arr.sort((a: number, b: number): int => { return 0; });
      const element098 = arr.$_get(0);
      expect(element098).assertEqual(4.0);
      const element098Part2 = arr.$_get(3);
      expect(element098Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0890
     * @tc.name testFloat32ArraySortOne089
     * @tc.desc Verify sort with compareFn returning 0 on [8.0, 3.0, 6.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([8.0, 3.0, 6.0]);
      arr.sort((a: number, b: number): int => { return 0; });
      const element099 = arr.$_get(0);
      expect(element099).assertEqual(8.0);
      const element099Part2 = arr.$_get(1);
      expect(element099Part2).assertEqual(3.0);
      const element099Part3 = arr.$_get(2);
      expect(element099Part3).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0900
     * @tc.name testFloat32ArraySortOne090
     * @tc.desc Verify sort with compareFn ascending on [1.0, 2.0, 1.0, 2.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 1.0, 2.0, 1.0]);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element100 = arr.$_get(0);
      expect(element100).assertEqual(1.0);
      const element100Part2 = arr.$_get(1);
      expect(element100Part2).assertEqual(1.0);
      const element100Part3 = arr.$_get(2);
      expect(element100Part3).assertEqual(1.0);
      const element100Part4 = arr.$_get(3);
      expect(element100Part4).assertEqual(2.0);
      const element100Part5 = arr.$_get(4);
      expect(element100Part5).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0910
     * @tc.name testFloat32ArraySortOne091
     * @tc.desc Verify sort with compareFn on large array with one smaller element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(50);
      for (let i = 0; i < 50; i++) {
        arr.$_set(i, 3.0);
      }
      arr.$_set(25, 1.0);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element101 = arr.$_get(0);
      expect(element101).assertEqual(1.0);
      const element101Part2 = arr.$_get(1);
      expect(element101Part2).assertEqual(3.0);
      const element101Part3 = arr.$_get(49);
      expect(element101Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0920
     * @tc.name testFloat32ArraySortOne092
     * @tc.desc Verify sort with compareFn treating -0.0 and 0.0 as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0, 0.0, -0.0]);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element102 = arr.$_get(0);
      expect(element102).assertEqual(0.0);
      const element102Part2 = arr.$_get(2);
      expect(element102Part2).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0930
     * @tc.name testFloat32ArraySortOne093
     * @tc.desc Verify sort with compareFn returning 0 on [6.0, 6.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([6.0, 6.0]);
      arr.sort((a: number, b: number): int => { return 0; });
      const element103 = arr.$_get(0);
      expect(element103).assertEqual(6.0);
      const element103Part2 = arr.$_get(1);
      expect(element103Part2).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0940
     * @tc.name testFloat32ArraySortOne094
     * @tc.desc Verify sort with compareFn ascending on [5.0, 3.0, 5.0, 1.0, 3.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0, 5.0, 1.0, 3.0, 1.0]);
      arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element104 = arr.$_get(0);
      expect(element104).assertEqual(1.0);
      const element104Part2 = arr.$_get(1);
      expect(element104Part2).assertEqual(1.0);
      const element104Part3 = arr.$_get(2);
      expect(element104Part3).assertEqual(3.0);
      const element104Part4 = arr.$_get(3);
      expect(element104Part4).assertEqual(3.0);
      const element104Part5 = arr.$_get(4);
      expect(element104Part5).assertEqual(5.0);
      const element104Part6 = arr.$_get(5);
      expect(element104Part6).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0950
     * @tc.name testFloat32ArraySortOne095
     * @tc.desc Verify sort with compareFn returning 0 on [5.0] preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      const arr = new Float32Array([5.0]);
      arr.sort((a: number, b: number): int => { called = true; return 0; });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0960
     * @tc.name testFloat32ArraySortOne096
     * @tc.desc Verify compareFn is not called on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      const arr = new Float32Array(0);
      arr.sort((a: number, b: number): int => { called = true; return 0; });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0970
     * @tc.name testFloat32ArraySortOne097
     * @tc.desc Verify sort() called twice is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort();
      const first = arr.$_get(0);
      arr.sort();
      const element107 = arr.$_get(0);
      expect(element107).assertEqual(first);
      const element107Part2 = arr.$_get(0);
      expect(element107Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0980
     * @tc.name testFloat32ArraySortOne098
     * @tc.desc Verify sort() ascending then sort(descending) changes order on [3.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort();
      const element108 = arr.$_get(0);
      expect(element108).assertEqual(1.0);
      arr.sort((a: number, b: number): int => { return a < b ? 1 : (a > b ? -1 : 0); });
      const element108Part2 = arr.$_get(0);
      expect(element108Part2).assertEqual(3.0);
      const element108Part3 = arr.$_get(2);
      expect(element108Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_0990
     * @tc.name testFloat32ArraySortOne099
     * @tc.desc Verify sort() handles overflow to Infinity and underflow to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40, 1.0e-46, 1.0, -1.0e40]);
      arr.sort();
      const element109 = arr.$_get(0);
      expect(element109).assertEqual(-Number.POSITIVE_INFINITY);
      const element109Part2 = arr.$_get(3);
      expect(element109Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_1000
     * @tc.name testFloat32ArraySortOne100
     * @tc.desc Verify sort() preserves array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0, 8.0, 1.0, 9.0, 2.0, 7.0]);
      const lenBefore = arr.length;
      arr.sort();
      expect(arr.length).assertEqual(lenBefore);
      const element110 = arr.$_get(0);
      expect(element110).assertEqual(1.0);
      const element110Part2 = arr.$_get(6);
      expect(element110Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_1010
     * @tc.name testFloat32ArraySortOne101
     * @tc.desc Verify sort() ascending on hex values 0x10, 0xFF, 0xA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0xFF, 0xA);
      arr.sort();
      const element111 = arr.$_get(0);
      expect(element111).assertEqual(10.0);
      const element111Part2 = arr.$_get(1);
      expect(element111Part2).assertEqual(16.0);
      const element111Part3 = arr.$_get(2);
      expect(element111Part3).assertEqual(255.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_1020
     * @tc.name testFloat32ArraySortOne102
     * @tc.desc Verify sort() ascending on octal values 0o17, 0o10, 0o7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0o17, 0o10, 0o7);
      arr.sort();
      const element112 = arr.$_get(0);
      expect(element112).assertEqual(7.0);
      const element112Part2 = arr.$_get(1);
      expect(element112Part2).assertEqual(8.0);
      const element112Part3 = arr.$_get(2);
      expect(element112Part3).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_1030
     * @tc.name testFloat32ArraySortOne103
     * @tc.desc Verify sort() ascending on binary values 0b1010, 0b0011, 0b1111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0b1010, 0b0011, 0b1111);
      arr.sort();
      const element113 = arr.$_get(0);
      expect(element113).assertEqual(3.0);
      const element113Part2 = arr.$_get(1);
      expect(element113Part2).assertEqual(10.0);
      const element113Part3 = arr.$_get(2);
      expect(element113Part3).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_1040
     * @tc.name testFloat32ArraySortOne104
     * @tc.desc Verify sort() ascending on scientific notation numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e3, 2e2, 3e1);
      arr.sort();
      const element114 = arr.$_get(0);
      expect(element114).assertEqual(30.0);
      const element114Part2 = arr.$_get(1);
      expect(element114Part2).assertEqual(200.0);
      const element114Part3 = arr.$_get(2);
      expect(element114Part3).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_1050
     * @tc.name testFloat32ArraySortOne105
     * @tc.desc Verify sort() ascending on [16.0, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16.0, 3.0, 4.0);
      arr.sort();
      const element115 = arr.$_get(0);
      expect(element115).assertEqual(3.0);
      const element115Part2 = arr.$_get(1);
      expect(element115Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_1060
     * @tc.name testFloat32ArraySortOne106
     * @tc.desc Verify sort() ascending on negative hex values -0x10, -0xFF, -0x1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0x10, -0xFF, -0x1);
      arr.sort();
      const element116 = arr.$_get(0);
      expect(element116).assertEqual(-255.0);
      const element116Part2 = arr.$_get(1);
      expect(element116Part2).assertEqual(-16.0);
      const element116Part3 = arr.$_get(2);
      expect(element116Part3).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_ONE_1070
     * @tc.name testFloat32ArraySortOne107
     * @tc.desc Verify sort() ascending on mixed radix values (hex, octal, binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0o17, 0b1010);
      arr.sort();
      const element117 = arr.$_get(0);
      expect(element117).assertEqual(10.0);
      const element117Part2 = arr.$_get(1);
      expect(element117Part2).assertEqual(15.0);
      const element117Part3 = arr.$_get(2);
      expect(element117Part3).assertEqual(16.0);
    });
