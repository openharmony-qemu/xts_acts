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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../../Util.test';

export default function ArrayWithTestSupplement() {
  describe('ArrayWithTestSupplement', () => {
    beforeAll(() => {
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /**
     * @tc.name testArrayWithTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0100
     * @tc.desc Replace a middle element using a positive index; verify the new array value at that index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99);
      expect(result).assertDeepEquals([1, 2, 99, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0200
     * @tc.desc Replace using a negative index counting from the end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(-1, 99);
      expect(result).assertDeepEquals([1, 2, 3, 4, 99]);
    })

    /**
     * @tc.name testArrayWithTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0300
     * @tc.desc Replace the first element using index 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(0, 99);
      expect(result).assertDeepEquals([99, 2, 3]);
    })

    /**
     * @tc.name testArrayWithTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0400
     * @tc.desc Replace the last element using index length minus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(arr.length - 1, 99);
      expect(result).assertDeepEquals([1, 2, 99]);
    })

    /**
     * @tc.name testArrayWithTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0500
     * @tc.desc Positive integer index selects the correct replacement position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30, 40, 50];
      return expect(arr.with(1, 99)).assertDeepEquals([10, 99, 30, 40, 50]) &&
      expect(arr.with(3, 99)).assertDeepEquals([10, 20, 30, 99, 50]);
    })

    /**
     * @tc.name testArrayWithTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0600
     * @tc.desc Negative integer index counts from the end for replacement
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30, 40, 50];
      return expect(arr.with(-2, 99)).assertDeepEquals([10, 20, 30, 99, 50]) &&
      expect(arr.with(-5, 99)).assertDeepEquals([99, 20, 30, 40, 50]);
    })

    /**
     * @tc.name testArrayWithTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0700
     * @tc.desc Index 0 replaces the first element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30];
      expect(arr.with(0, 99)).assertDeepEquals([99, 20, 30]);
    })

    /**
     * @tc.name testArrayWithTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0800
     * @tc.desc Positive fractional index is truncated to an integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30, 40];
      return expect(arr.with(1.5, 99)).assertDeepEquals([10, 99, 30, 40]) &&
      expect(arr.with(2.9, 99)).assertDeepEquals([10, 20, 99, 40]);
    })

    /**
     * @tc.name testArrayWithTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_0900
     * @tc.desc Negative fractional index maps to indexing from the end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30, 40];
      expect(arr.with(-1.5, 99)).assertDeepEquals([10, 20, 30, 99]);
    })

    /**
     * @tc.name testArrayWithTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1000
     * @tc.desc NaN as index is converted to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30];
      expect(arr.with(NaN, 99)).assertDeepEquals([99, 20, 30]);
    })

    /**
     * @tc.name testArrayWithTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1100
     * @tc.desc Positive Infinity as index throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(Infinity, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1200
     * @tc.desc Negative Infinity as index throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(-Infinity, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1300
     * @tc.desc String "0" as index is converted to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30];
      expect(arr.with('0', 99)).assertDeepEquals([99, 20, 30]);
    })

    /**
     * @tc.name testArrayWithTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1400
     * @tc.desc String "2" as index is converted to integer 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30, 40];
      expect(arr.with('2', 99)).assertDeepEquals([10, 20, 99, 40]);
    })

    /**
     * @tc.name testArrayWithTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1500
     * @tc.desc Non-numeric string index becomes NaN then 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30];
      expect(arr.with('abc', 99)).assertDeepEquals([99, 20, 30]);
    })

    /**
     * @tc.name testArrayWithTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1600
     * @tc.desc null as index is converted to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30];
      expect(arr.with(null, 99)).assertDeepEquals([99, 20, 30]);
    })

    /**
     * @tc.name testArrayWithTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1700
     * @tc.desc undefined as index is converted to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30];
      expect(arr.with(undefined, 99)).assertDeepEquals([99, 20, 30]);
    })

    /**
     * @tc.name testArrayWithTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1800
     * @tc.desc true as index is converted to 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30];
      expect(arr.with(true, 99)).assertDeepEquals([10, 99, 30]);
    })

    /**
     * @tc.name testArrayWithTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_1900
     * @tc.desc false as index is converted to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30];
      expect(arr.with(false, 99)).assertDeepEquals([99, 20, 30]);
    })

    /**
     * @tc.name testArrayWithTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2000
     * @tc.desc Positive index equal to array length throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(3, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2100
     * @tc.desc Positive index greater than or equal to length throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(100, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2200
     * @tc.desc Negative index equal to negative length normalizes to 0 and can replace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      expect(arr.with(-3, 99)).assertDeepEquals([99, 2, 3]);
    })

    /**
     * @tc.name testArrayWithTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2300
     * @tc.desc Negative index with magnitude greater than length throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(-4, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2400
     * @tc.desc Negative index minus length plus one throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(-100, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2500
     * @tc.desc Replace with a number value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return expect(arr.with(1, 42)).assertDeepEquals([1, 42, 3]) &&
      expect(arr.with(1, 0)).assertDeepEquals([1, 0, 3]) &&
      expect(arr.with(1, -5)).assertDeepEquals([1, -5, 3]);
    })

    /**
     * @tc.name testArrayWithTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2600
     * @tc.desc Replace with a string value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return expect(arr.with(1, 'hello')).assertDeepEquals([1, 'hello', 3]) &&
      expect(arr.with(1, '')).assertDeepEquals([1, '', 3]);
    })

    /**
     * @tc.name testArrayWithTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2700
     * @tc.desc Replace with boolean true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      expect(arr.with(1, true)).assertDeepEquals([1, true, 3]);
    })

    /**
     * @tc.name testArrayWithTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2800
     * @tc.desc Replace with boolean false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      expect(arr.with(1, false)).assertDeepEquals([1, false, 3]);
    })

    /**
     * @tc.name testArrayWithTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_2900
     * @tc.desc Replace with null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      expect(arr.with(1, null)).assertDeepEquals([1, null, 3]);
    })

    /**
     * @tc.name testArrayWithTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3000
     * @tc.desc Replace with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      expect(arr.with(1, undefined)).assertDeepEquals([1, undefined, 3]);
    })

    /**
     * @tc.name testArrayWithTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3100
     * @tc.desc Replace with a Symbol value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const sym = Symbol('foo');
      const result = arr.with(1, sym);
      expect(result[0] === 1).assertEqual(true);
      expect(result[1] === sym).assertEqual(true);
      expect(result[2] === 3).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3200
     * @tc.desc Replace with a BigInt value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, BigInt(9007199254740991));
      expect(result[0] === 1).assertEqual(true);
      expect(result[1] === BigInt(9007199254740991)).assertEqual(true);
      expect(result[2] === 3).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3300
     * @tc.desc Replace with a plain object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const obj = { key: 'value' };
      const result = arr.with(1, obj);
      expect(result[1] === obj).assertEqual(true);
      expect(result[1].key === 'value').assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3400
     * @tc.desc Replace with a nested array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      expect(arr.with(1, [4, 5])).assertDeepEquals([1, [4, 5], 3]);
    })

    /**
     * @tc.name testArrayWithTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3500
     * @tc.desc Replace with a function value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const fn = () => 42;
      const result = arr.with(1, fn);
      expect(typeof result[1] === 'function').assertEqual(true);
      expect(result[1]() === 42).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3600
     * @tc.desc Replace with a Date object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const date = new Date('2024-01-01');
      const result = arr.with(1, date);
      expect(result[1] instanceof Date).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3700
     * @tc.desc Replace with a RegExp object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const regex = new RegExp('test', 'gi');
      const result = arr.with(1, regex);
      expect(result[1] instanceof RegExp).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3800
     * @tc.desc Replace with a Map object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const map = new Map([['a', 1]]);
      const result = arr.with(1, map);
      expect(result[1] instanceof Map).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_3900
     * @tc.desc Replace with a Set object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const set = new Set([1, 2, 3]);
      const result = arr.with(1, set);
      expect(result[1] instanceof Set).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4000
     * @tc.desc Replace with NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, NaN);
      expect(Number.isNaN(result[1])).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4100
     * @tc.desc Replace with Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, Infinity);
      expect(result[1] === Infinity).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4200
     * @tc.desc Replace with negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, -Infinity);
      expect(result[1] === -Infinity).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4300
     * @tc.desc Replace with positive and negative zero; verify signed zeros
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const r1 = arr.with(1, +0);
      const r2 = arr.with(1, -0);
      expect(Object.is(r1[1], +0)).assertEqual(true);
      expect(Object.is(r2[1], -0)).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4400
     * @tc.desc Replace with the same value; result is a new array that looks unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 2);
      expect(result).assertDeepEquals([1, 2, 3]);
      expect(result !== arr).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4500
     * @tc.desc with() return value is an Array instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 99);
      expect(Array.isArray(result)).assertEqual(true);
      expect(result instanceof Array).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4600
     * @tc.desc Result array length matches the original array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99);
      expect(result.length === arr.length).assertEqual(true);
      expect(result.length === 5).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4700
     * @tc.desc Result array has the correct element at the replacement index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30, 40];
      const result = arr.with(2, 99);
      expect(result[2] === 99).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4800
     * @tc.desc Non-replaced indices in the result match the original array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [10, 20, 30, 40];
      const result = arr.with(2, 99);
      expect(result[0] === 10).assertEqual(true);
      expect(result[1] === 20).assertEqual(true);
      expect(result[3] === 40).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_4900
     * @tc.desc Result is a new array reference distinct from the original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 99);
      expect(result !== arr).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5000
     * @tc.desc Original array contents are unchanged after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      arr.with(2, 99);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5100
     * @tc.desc Original array variable still refers to the same object after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const ref = arr;
      arr.with(1, 99);
      expect(arr === ref).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5200
     * @tc.desc Repeated with() calls leave the original array unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      arr.with(0, 10);
      arr.with(1, 20);
      arr.with(2, 30);
      expect(arr).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArrayWithTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5300
     * @tc.desc with() on Object.freeze array does not throw and leaves the original unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Object.freeze([1, 2, 3]);
      const result = arr.with(1, 99);
      expect(arr).assertDeepEquals([1, 2, 3]);
      expect(result).assertDeepEquals([1, 99, 3]);
    })

    /**
     * @tc.name testArrayWithTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5400
     * @tc.desc with() on Object.seal array does not throw and leaves the original unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Object.seal([1, 2, 3]);
      const result = arr.with(1, 99);
      expect(arr).assertDeepEquals([1, 2, 3]);
      expect(result).assertDeepEquals([1, 99, 3]);
    })

    /**
     * @tc.name testArrayWithTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5500
     * @tc.desc Sparse array with holes; replace a non-hole index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, , 3];
      const result = arr.with(0, 99);
      expect(result).assertDeepEquals([99, undefined, 3]);
      expect(result.hasOwnProperty(1) === true).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5600
     * @tc.desc Sparse array becomes dense with undefined in holes after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, , 3, 4, , 6];
      const result = arr.with(0, 2);
      return expect(result).assertDeepEquals([2, undefined, 3, 4, undefined, 6]) &&
      result.hasOwnProperty(1) === true && result.hasOwnProperty(4) === true;
    })

    /**
     * @tc.name testArrayWithTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5700
     * @tc.desc Sparse array with multiple holes and with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, , , , 5];
      const result = arr.with(2, 99);
      return expect(result).assertDeepEquals([1, undefined, 99, undefined, 5]) &&
      (0 in result) === true && (1 in result) === true && (3 in result) === true;
    })

    /**
     * @tc.name testArrayWithTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5800
     * @tc.desc with() on an array that is entirely holes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array(5);
      const result = arr.with(2, 99);
      return result.length === 5 && result[2] === 99 && result[0] === undefined &&
      result.hasOwnProperty(0) === true;
    })

    /**
     * @tc.name testArrayWithTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_5900
     * @tc.desc Replace a hole index; the hole is filled
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, , 3];
      const result = arr.with(1, 99);
      expect(result).assertDeepEquals([1, 99, 3]);
      expect(result.hasOwnProperty(1) === true).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6000
     * @tc.desc RangeError when positive index is out of range (greater than or equal to length)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(3, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })()) &&
      (((): boolean => {
      try {
      arr.with(10, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6100
     * @tc.desc RangeError when negative index magnitude exceeds length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(-4, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })()) &&
      (((): boolean => {
      try {
      arr.with(-10, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6200
     * @tc.desc RangeError for positive Infinity index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(Infinity, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6300
     * @tc.desc RangeError for negative Infinity index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(-Infinity, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6400
     * @tc.desc TypeError when this is null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((((): boolean => {
      try {
        Array.prototype.with.call(null, 0, 99);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    })())).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6500
     * @tc.desc TypeError when this is undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((((): boolean => {
      try {
        Array.prototype.with.call(undefined, 0, 99);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    })())).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6600
     * @tc.desc Number primitive this throws RangeError or TypeError depending on engine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
let ok165 = false;
      try {
        Array.prototype.with.call(42, 0, 99);
      } catch (e) {
        ok165 = e instanceof RangeError || e instanceof TypeError;
      }
      expect(ok165).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6700
     * @tc.desc String primitive this behaves like an array-like object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.prototype.with.call('abc', 0, 99);
      expect(Array.isArray(result)).assertEqual(true);
      expect(result).assertDeepEquals([99, 'b', 'c']);
    })

    /**
     * @tc.name testArrayWithTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6800
     * @tc.desc Boolean primitive this throws RangeError or TypeError depending on engine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
let ok167 = false;
      try {
        Array.prototype.with.call(true, 0, 99);
      } catch (e) {
        ok167 = e instanceof RangeError || e instanceof TypeError;
      }
      expect(ok167).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_6900
     * @tc.desc Chain map() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 6).map((x) => Math.pow(x, 2));
      expect(result).assertDeepEquals([1, 4, 36, 16, 25]);
    })

    /**
     * @tc.name testArrayWithTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7000
     * @tc.desc Chain filter() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 10).filter((x) => x > 3);
      expect(result).assertDeepEquals([10, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7100
     * @tc.desc Chain reduce() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 10).reduce((a, b) => a + b, 0);
      expect(result === 22).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7200
     * @tc.desc Chain find() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99).find((x) => x > 50);
      expect(result === 99).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7300
     * @tc.desc Chain includes() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const r1 = arr.with(1, 99).includes(99);
      const r2 = arr.with(1, 99).includes(2);
      expect(r1 === true).assertEqual(true);
      expect(r2 === false).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7400
     * @tc.desc Chain indexOf() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 99).indexOf(99);
      expect(result === 1).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7500
     * @tc.desc Chain slice() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99).slice(1, 4);
      expect(result).assertDeepEquals([2, 99, 4]);
    })

    /**
     * @tc.name testArrayWithTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7600
     * @tc.desc Chain concat() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 99).concat([4, 5]);
      expect(result).assertDeepEquals([1, 99, 3, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7700
     * @tc.desc Chain forEach() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const collected = [];
      arr.with(1, 99).forEach((x) => collected.push(x));
      expect(collected).assertDeepEquals([1, 99, 3]);
    })

    /**
     * @tc.name testArrayWithTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7800
     * @tc.desc Chain some() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 99).some((x) => x > 50);
      expect(result === true).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_7900
     * @tc.desc Chain every() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const r1 = arr.with(1, 99).every((x) => x < 100);
      const r2 = arr.with(1, 99).every((x) => x < 50);
      expect(r1 === true).assertEqual(true);
      expect(r2 === false).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8000
     * @tc.desc Chain join() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 99).join('-');
      expect(result === '1-99-3').assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8100
     * @tc.desc Chain sort() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [3, 1, 2];
      const result = arr.with(1, 5).sort();
      expect(result).assertDeepEquals([2, 3, 5]);
    })

    /**
     * @tc.name testArrayWithTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8200
     * @tc.desc Chain toReversed() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99).toReversed();
      expect(result).assertDeepEquals([5, 4, 99, 2, 1]);
    })

    /**
     * @tc.name testArrayWithTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8300
     * @tc.desc Chain toSorted() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [3, 1, 4, 1, 5];
      const result = arr.with(0, 9).toSorted();
      expect(result).assertDeepEquals([1, 1, 4, 5, 9]);
    })

    /**
     * @tc.name testArrayWithTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8400
     * @tc.desc Chain toSpliced() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99).toSpliced(1, 2);
      expect(result).assertDeepEquals([1, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8500
     * @tc.desc Chain multiple with() calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(0, 10).with(2, 30).with(4, 50);
      expect(result).assertDeepEquals([10, 2, 30, 4, 50]);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8600
     * @tc.desc Read the result with at() at a given index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const newArr = arr.with(2, 99);
      expect(newArr.at(2) === 99).assertEqual(true);
      expect(newArr.at(-1) === 5).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8700
     * @tc.desc Chain flat() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr.with(1, [7, 8, 9]).flat();
      expect(result).assertDeepEquals([1, 2, 7, 8, 9, 5, 6]);
    })

    /**
     * @tc.name testArrayWithTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8800
     * @tc.desc Chain flatMap() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 5).flatMap((x) => [x, x * 10]);
      expect(result).assertDeepEquals([1, 10, 5, 50, 3, 30]);
    })

    /**
     * @tc.name testArrayWithTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_8900
     * @tc.desc Array.prototype.with.call on array-like object with length and indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = { length: 3, 0: 10, 1: 20, 2: 30 };
      const result = Array.prototype.with.call(obj, 1, 99);
      expect(Array.isArray(result)).assertEqual(true);
      expect(result).assertDeepEquals([10, 99, 30]);
    })

    /**
     * @tc.name testArrayWithTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9000
     * @tc.desc length larger than existing numeric keys yields undefined for missing slots
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = { length: 5, 0: 10, 2: 30 };
      const result = Array.prototype.with.call(obj, 1, 99);
      expect(result).assertDeepEquals([10, 99, 30, undefined, undefined]);
    })

    /**
     * @tc.name testArrayWithTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9100
     * @tc.desc length smaller than keys ignores keys beyond length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = { length: 2, 0: 10, 1: 20, 2: 30 };
      const result = Array.prototype.with.call(obj, 0, 99);
      expect(result).assertDeepEquals([99, 20]);
      expect(result.length === 2).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9200
     * @tc.desc length zero array-like throws RangeError for any index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = { length: 0 };
      return (((): boolean => {
      try {
      Array.prototype.with.call(obj, 0, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9300
     * @tc.desc Object with non-numeric string keys ignores those keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = { length: 3, 0: 10, 1: 20, 2: 30, foo: 'bar' };
      const result = Array.prototype.with.call(obj, 1, 99);
      expect(result).assertDeepEquals([10, 99, 30]);
    })

    /**
     * @tc.name testArrayWithTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9400
     * @tc.desc Object with Symbol keys ignores Symbol keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sym = Symbol('key');
      const obj = { length: 3, 0: 10, 1: 20, 2: 30, [sym]: 'symbol' };
      const result = Array.prototype.with.call(obj, 0, 99);
      expect(result).assertDeepEquals([99, 20, 30]);
    })

    /**
     * @tc.name testArrayWithTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9500
     * @tc.desc arguments-like array object via call (emulated without arguments)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
const result: number[] = Array.prototype.with.call(
        { length: 3, 0: 10, 1: 20, 2: 30 } as Object,
        0,
        99
      ) as number[];
      expect(result).assertDeepEquals([99, 20, 30]);
      expect(Array.isArray(result)).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9600
     * @tc.desc NodeList-like array object via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nodeListLike = { length: 3, 0: 'div', 1: 'span', 2: 'p' };
      const result = Array.prototype.with.call(nodeListLike, 1, 'section');
      expect(result).assertDeepEquals(['div', 'section', 'p']);
    })

    /**
     * @tc.name testArrayWithTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9700
     * @tc.desc String object with length and index properties via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strObj = new String('abc');
      const result = Array.prototype.with.call(strObj, 1, 'Z');
      expect(Array.isArray(result)).assertEqual(true);
      expect(result).assertDeepEquals(['a', 'Z', 'c']);
    })

    /**
     * @tc.name testArrayWithTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9800
     * @tc.desc Buffer-like array object via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bufferLike = { length: 4, 0: 0x00, 1: 0x01, 2: 0x02, 3: 0x03 };
      const result = Array.prototype.with.call(bufferLike, 2, 0xff);
      expect(result).assertDeepEquals([0x00, 0x01, 0xff, 0x03]);
    })

    /**
     * @tc.name testArrayWithTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_9900
     * @tc.desc Empty array throws RangeError for any index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [];
      return (((): boolean => {
      try {
      arr.with(0, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })()) &&
      (((): boolean => {
      try {
      arr.with(-1, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })()) && arr.length === 0;
    })

    /**
     * @tc.name testArrayWithTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10000
     * @tc.desc Single-element array with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [42];
      const r1 = arr.with(0, 99);
      const r2 = arr.with(-1, 99);
      return expect(r1).assertDeepEquals([99]) && expect(r2).assertDeepEquals([99]) &&
      (((): boolean => {
      try {
      arr.with(1, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0200
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10100
     * @tc.desc Large array: replace head, middle, and tail
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array(10000).fill(0).map((_, i) => i);
      const r1 = arr.with(0, 999);
      const r2 = arr.with(5000, -1);
      return r1[0] === 999 && r1[9999] === 9999 &&
      r2[5000] === -1 && r2[4999] === 4999 && r2[5001] === 5001;
    })

    /**
     * @tc.name testArrayWithTest0201
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10200
     * @tc.desc Two-dimensional array: replace an inner array with with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr.with(1, [7, 8]);
      expect(result).assertDeepEquals([[1, 2], [7, 8], [5, 6]]);
      expect(result[1]).assertDeepEquals([7, 8]);
    })

    /**
     * @tc.name testArrayWithTest0202
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10300
     * @tc.desc Array containing undefined elements and with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [undefined, undefined, undefined];
      const result = arr.with(1, 99);
      expect(result).assertDeepEquals([undefined, 99, undefined]);
    })

    /**
     * @tc.name testArrayWithTest0203
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10400
     * @tc.desc Array containing null elements and with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [null, null, null];
      const result = arr.with(1, 99);
      expect(result).assertDeepEquals([null, 99, null]);
    })

    /**
     * @tc.name testArrayWithTest0204
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10500
     * @tc.desc Array where all elements are the same and with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [5, 5, 5, 5, 5];
      const result = arr.with(2, 99);
      expect(result).assertDeepEquals([5, 5, 99, 5, 5]);
      expect(result.length === 5).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0205
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10600
     * @tc.desc Object.freeze array unchanged; with() returns a new array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Object.freeze([1, 2, 3]);
      const result = arr.with(1, 99);
      return expect(arr).assertDeepEquals([1, 2, 3]) && expect(result).assertDeepEquals([1, 99, 3]) &&
      Object.isFrozen(arr) === true && Object.isFrozen(result) === false;
    })

    /**
     * @tc.name testArrayWithTest0206
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10700
     * @tc.desc with() on a Proxy-wrapped array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
const arr: number[] = [1, 2, 3];
      const proxy: number[] = new Proxy(arr, {
        get(target: number[], prop: string | number | symbol): Object | number | number[] | undefined {
          return target[prop as number];
        }
      }) as number[];
      const result: number[] = Array.prototype.with.call(proxy, 1, 99) as number[];
      expect(result).assertDeepEquals([1, 99, 3]);
    })

    /**
     * @tc.name testArrayWithTest0207
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10800
     * @tc.desc Read with at() positive index after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99);
      expect(result.at(2) === 99).assertEqual(true);
      expect(result.at(0) === 1).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0208
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_10900
     * @tc.desc Read with at() negative index after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(-2, 99);
      expect(result.at(-2) === 99).assertEqual(true);
      expect(result.at(-1) === 5).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0209
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11000
     * @tc.desc toReversed() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99).toReversed();
      const result2 = arr.toReversed().with(0, 99);
      expect(result).assertDeepEquals([5, 4, 99, 2, 1]);
      expect(result2).assertDeepEquals([99, 4, 3, 2, 1]);
    })

    /**
     * @tc.name testArrayWithTest0210
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11100
     * @tc.desc toSorted() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [3, 1, 4, 1, 5];
      const result = arr.with(0, 9).toSorted();
      const result2 = arr.toSorted().with(0, 99);
      expect(result).assertDeepEquals([1, 1, 4, 5, 9]);
      expect(result2).assertDeepEquals([99, 1, 3, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0211
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11200
     * @tc.desc toSpliced() after with()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(2, 99).toSpliced(1, 2);
      const result2 = arr.toSpliced(1, 2).with(0, 99);
      expect(result).assertDeepEquals([1, 4, 5]);
      expect(result2).assertDeepEquals([99, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0212
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11300
     * @tc.desc Compare with() versus copyWithin(); with() does not mutate the original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = [1, 2, 3, 4, 5];
      const arr2 = [1, 2, 3, 4, 5];
      const r1 = arr1.with(2, 99);
      const r2 = arr2.copyWithin(2, 0, 2);
      return expect(arr1).assertDeepEquals([1, 2, 3, 4, 5]) && expect(arr2).assertDeepEquals([1, 2, 1, 2, 5]) &&
      arr1 !== r1 && arr2 === r2;
    })

    /**
     * @tc.name testArrayWithTest0213
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11400
     * @tc.desc Compare with() versus splice(); with() does not mutate the original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = [1, 2, 3, 4, 5];
      const arr2 = [1, 2, 3, 4, 5];
      const r1 = arr1.with(2, 99);
      arr2.splice(2, 1, 99);
      return expect(arr1).assertDeepEquals([1, 2, 3, 4, 5]) && expect(r1).assertDeepEquals([1, 2, 99, 4, 5]) &&
      expect(arr2).assertDeepEquals([1, 2, 99, 4, 5]);
    })

    /**
     * @tc.name testArrayWithTest0214
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11500
     * @tc.desc Compare with() versus fill(); with() replaces only one index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = [1, 2, 3, 4, 5];
      const arr2 = [1, 2, 3, 4, 5];
      const r1 = arr1.with(2, 0);
      const r2 = arr2.fill(0, 2, 4);
      return expect(arr1).assertDeepEquals([1, 2, 3, 4, 5]) && expect(r1).assertDeepEquals([1, 2, 0, 4, 5]) &&
      expect(arr2).assertDeepEquals([1, 2, 0, 0, 5]) && r2 === arr2;
    })

    /**
     * @tc.name testArrayWithTest0215
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11600
     * @tc.desc Call with() after toReversed, toSorted, and similar methods that return new arrays
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [5, 3, 1, 4, 2];
      const result = arr.toSorted().with(0, 99);
      expect(result).assertDeepEquals([99, 2, 3, 4, 5]);
      expect(arr).assertDeepEquals([5, 3, 1, 4, 2]);
    })

    /**
     * @tc.name testArrayWithTest0216
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11700
     * @tc.desc Empty array with() throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [];
      return (((): boolean => {
      try {
      arr.with(0, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })()) &&
      (((): boolean => {
      try {
      arr.with(-1, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0217
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11800
     * @tc.desc Single-element array: indices 0 and negative one are valid
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [42];
      return expect(arr.with(0, 99)).assertDeepEquals([99]) && expect(arr.with(-1, 99)).assertDeepEquals([99]) &&
      (((): boolean => {
      try {
      arr.with(1, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })()) && (((): boolean => {
      try {
      arr.with(-2, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0218
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_11900
     * @tc.desc Index negative one replaces the last element correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.with(-1, 99);
      expect(result).assertDeepEquals([1, 2, 3, 4, 99]);
      expect(result.length === arr.length).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0219
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_12000
     * @tc.desc Negative length index normalizes to replacing the first element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(-3, 99);
      expect(result).assertDeepEquals([99, 2, 3]);
    })

    /**
     * @tc.name testArrayWithTest0220
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_12100
     * @tc.desc Very large positive index throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(Number.MAX_SAFE_INTEGER, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })()) &&
      (((): boolean => {
      try {
      arr.with(Math.pow(2, 53), 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0221
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_12200
     * @tc.desc Very small negative index throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      return (((): boolean => {
      try {
      arr.with(-Number.MAX_SAFE_INTEGER, 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })()) &&
      (((): boolean => {
      try {
      arr.with(-(Math.pow(2, 53)), 99);
      expect(false).assertEqual(true);
      } catch (e) {
      expect(e instanceof RangeError).assertEqual(true);
      }
      })());
    })

    /**
     * @tc.name testArrayWithTest0222
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_12300
     * @tc.desc with() via the prototype chain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = [1, 2, 3];
      const result = arr.with(1, 99);
      expect(arr.with === Array.prototype.with).assertEqual(true);
      expect(result).assertDeepEquals([1, 99, 3]);
    })

    /**
     * @tc.name testArrayWithTest0223
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_12400
     * @tc.desc Array.prototype.with writable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'with');
      expect(desc.writable === true).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0224
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_12500
     * @tc.desc Array.prototype.with enumerable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'with');
      expect(desc.enumerable === false).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0225
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_12600
     * @tc.desc Array.prototype.with configurable is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'with');
      expect(desc.configurable === true).assertEqual(true);
    })

    /**
     * @tc.name testArrayWithTest0226
     * @tc.number SUB_COMMONLIBRARY_ARRAY_WITH_SUPPLEMENT_TEST_12700
     * @tc.desc Custom Symbol.species does not change with() return type; result is a normal Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayWithTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
class MyArray extends Array<number> {
        static get [Symbol.species](): ArrayConstructor {
          return Array;
        }
      }
      const myArr: MyArray = new MyArray(1, 2, 3);
      const result: number[] = myArr.with(1, 99);
      expect(result instanceof Array).assertEqual(true);
      expect(result[1]).assertEqual(99);
      expect(Array.from(result)).assertDeepEquals([1, 99, 3]);
    })

  })
}
