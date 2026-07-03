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

export default function Float64ArrayEntriesTest(): void {
  describe('Float64ArrayEntriesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0100
     * @tc.name testFloat64ArrayEntries001
     * @tc.desc Verify entries first result contains index and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array([onePointZero, 2.0]);
      const iter = values.entries();
      const result = iter.next();
      expect(result.done).assertFalse();
      expect(result.value).assertDeepEquals([0, onePointZero]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0200
     * @tc.name testFloat64ArrayEntries002
     * @tc.desc Verify entries iterator has next method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1);
      const iter = values.entries();
      iter.next();
      const actVal1 = iter.next().done;
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0300
     * @tc.name testFloat64ArrayEntries003
     * @tc.desc Verify empty Float64Array entries iterator has no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array(0);
      const iter = values.entries();
      let count = 0;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        count += 1;
      }
      const expectVal = zeroValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0400
     * @tc.name testFloat64ArrayEntries004
     * @tc.desc Verify empty Float64Array entries first next returns done:true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.entries();
      const result = iter.next();
      const expectVal = true;
      expect(result.done).assertEqual(expectVal);
      expect(result.value).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0500
     * @tc.name testFloat64ArrayEntries005
     * @tc.desc Verify single element Float64Array entries returns [0, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5]);
      const iter = values.entries();
      const result = iter.next();
      const expectVal = false;
      expect(result.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0600
     * @tc.name testFloat64ArrayEntries006
     * @tc.desc Verify single element Float64Array entries value is 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(-32768);
      const iter = values.entries();
      const result = iter.next();

      expect(result.done).assertFalse();
      expect(result.value).assertDeepEquals([0, -32768]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0700
     * @tc.name testFloat64ArrayEntries007
     * @tc.desc Verify single element Float64Array entries second next returns done:true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648]);
      const iter = values.entries();
      iter.next();
      const result = iter.next();
      const expectVal = true;
      expect(result.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0800
     * @tc.name testFloat64ArrayEntries008
     * @tc.desc Verify two element Float64Array entries first element index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1, 9007199254740991);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value).assertDeepEquals([0, 0.1]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_0900
     * @tc.name testFloat64ArrayEntries009
     * @tc.desc Verify two element Float64Array entries first element value is 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5]);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value).assertDeepEquals([0, 0.5]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1000
     * @tc.name testFloat64ArrayEntries010
     * @tc.desc Verify two element Float64Array entries second element index is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128]);
      const iter = values.entries();
      iter.next();
      const result2 = iter.next();

      expect(result2.done).assertFalse();
      expect(result2.value).assertDeepEquals([1, -128]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1100
     * @tc.name testFloat64ArrayEntries011
     * @tc.desc Verify two element Float64Array entries second element value is 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1]);
      const iter = values.entries();
      iter.next();
      const result2 = iter.next();

      expect(result2.done).assertFalse();
      expect(result2.value).assertDeepEquals([1, -1]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1200
     * @tc.name testFloat64ArrayEntries012
     * @tc.desc Verify three element Float64Array entries complete traversal count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const iter = values.entries();
      let count = 0;
      let entry = iter.next();
      while (!entry.done) {
        count += 1;
        entry = iter.next();
      }
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1300
     * @tc.name testFloat64ArrayEntries013
     * @tc.desc Verify three element Float64Array entries third element index is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const iter = values.entries();
      iter.next();
      iter.next();
      const result3 = iter.next();

      expect(result3.done).assertFalse();
      expect(result3.value).assertDeepEquals([2, 0.25]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1400
     * @tc.name testFloat64ArrayEntries014
     * @tc.desc Verify three element Float64Array entries third element value is 30.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128, 0]);
      const iter = values.entries();
      iter.next();
      iter.next();
      const result3 = iter.next();

      expect(result3.done).assertFalse();
      expect(result3.value).assertDeepEquals([2, 0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1500
     * @tc.name testFloat64ArrayEntries015
     * @tc.desc Verify Float64Array entries traverses NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const values = new Float64Array([nanValue, 1.0]);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value).assertDeepEquals([0, NaN]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1600
     * @tc.name testFloat64ArrayEntries016
     * @tc.desc Verify Float64Array entries second element index is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const values = new Float64Array([nanValue, 1.0]);
      const iter = values.entries();
      iter.next();
      const result2 = iter.next();

      expect(result2.done).assertFalse();
      expect(result2.value).assertDeepEquals([1, 1.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1700
     * @tc.name testFloat64ArrayEntries017
     * @tc.desc Verify Float64Array entries second element value is 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const onePointZero: number = 1.0;
      const values = Float64Array.of(nanValue, onePointZero);
      const iter = values.entries();
      iter.next();
      const result2 = iter.next();

      expect(result2.done).assertFalse();
      expect(result2.value![1]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1800
     * @tc.name testFloat64ArrayEntries018
     * @tc.desc Verify Float64Array entries traverses positive infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = new Float64Array([1.0, positiveInfinity]);
      const iter = values.entries();
      iter.next();
      const result2 = iter.next();

      expect(result2.done).assertFalse();
      expect(result2.value).assertDeepEquals([1, Infinity]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_1900
     * @tc.name testFloat64ArrayEntries019
     * @tc.desc Verify Float64Array entries traverses negative infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const values = Float64Array.of(negativeInfinity, 2.0);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value).assertDeepEquals([0, -Infinity]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2000
     * @tc.name testFloat64ArrayEntries020
     * @tc.desc Verify Float64Array entries traverses positive zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.0, 1.0]);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value).assertDeepEquals([0, 0.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2100
     * @tc.name testFloat64ArrayEntries021
     * @tc.desc Verify Float64Array entries traverses negative zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-0.0, 1.0]);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value).assertDeepEquals([0, -0.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2200
     * @tc.name testFloat64ArrayEntries022
     * @tc.desc Verify Float64Array entries traverses maximum value element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([1.7976931348623157e+308]);
      const iter = values.entries();
      const result = iter.next();

      expect(result.done).assertFalse();
      expect(result.value).assertDeepEquals([0, 1.7976931348623157e+308]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2300
     * @tc.name testFloat64ArrayEntries023
     * @tc.desc Verify Float64Array entries traverses minimum positive value element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([5e-324]);
      const iter = values.entries();
      const result = iter.next();

      expect(result.done).assertFalse();
      expect(result.value).assertDeepEquals([0, 5e-324]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2400
     * @tc.name testFloat64ArrayEntries024
     * @tc.desc Verify Float64Array entries traverses negative large number element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const values = Float64Array.of(negnum999999Pointninenine, 0.0);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value![1]).assertEqual(negnum999999Pointninenine);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2500
     * @tc.name testFloat64ArrayEntries025
     * @tc.desc Verify Float64Array entries traverses 1.0e-308 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([1.0e-308, 2.0]);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value).assertDeepEquals([0, 1.0e-308]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2600
     * @tc.name testFloat64ArrayEntries026
     * @tc.desc Verify Float64Array entries traverses 1.0e+308 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0e+308);
      const iter = values.entries();
      const result = iter.next();

      expect(result.done).assertFalse();
      expect(result.value).assertDeepEquals([0, 1.0e+308]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2700
     * @tc.name testFloat64ArrayEntries027
     * @tc.desc Verify Float64Array entries traverses integer 1.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array([onePointZero, 2.0, 3.0]);
      const iter = values.entries();
      const result1 = iter.next();

      expect(result1.done).assertFalse();
      expect(result1.value![1]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2800
     * @tc.name testFloat64ArrayEntries028
     * @tc.desc Verify Float64Array entries traverses integer 2.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const values = Float64Array.of(1.0, twoPointZero, 3.0);
      const iter = values.entries();
      iter.next();
      const result2 = iter.next();

      expect(result2.done).assertFalse();
      expect(result2.value![1]).assertEqual(twoPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_2900
     * @tc.name testFloat64ArrayEntries029
     * @tc.desc Verify Float64Array entries traverses integer 3.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const values = new Float64Array([1.0, 2.0, threePointZero]);
      const iter = values.entries();
      iter.next();
      iter.next();
      const result3 = iter.next();

      expect(result3.done).assertFalse();
      expect(result3.value![1]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3000
     * @tc.name testFloat64ArrayEntries030
     * @tc.desc Verify Float64Array entries continuous index from 0 to n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const values = new Float64Array([-32768, -128, 0, 127]);
      const iter = values.entries();
      let expectedIndex = 0;
      let entry = iter.next();
      let loopIdx = 0;
      while (!entry.done) {
        const expectVal = expectedIndex;
        expect(loopIdx).assertEqual(expectVal);
        expectedIndex += 1;
        loopIdx += 1;
        entry = iter.next();
      }
      const expectVal2 = fourValue;
      expect(expectedIndex).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3100
     * @tc.name testFloat64ArrayEntries031
     * @tc.desc Verify Float64Array entries index increments correctly after traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      const iter = values.entries();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();

      expect(r1.done).assertFalse();
      expect(r1.value).assertDeepEquals([0, -2147483648]);
      expect(r2.done).assertFalse();
      expect(r2.value).assertDeepEquals([1, -1]);
      expect(r3.done).assertFalse();
      expect(r3.value).assertDeepEquals([2, 0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3200
     * @tc.name testFloat64ArrayEntries032
     * @tc.desc Verify multiple calls to entries return different iterator instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1, 9007199254740991);
      const iter1 = values.entries();
      const iter2 = values.entries();
      const expectVal = false;
      expect(iter1 === iter2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3300
     * @tc.name testFloat64ArrayEntries033
     * @tc.desc Verify independent iterator traversal results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5]);
      const iter1 = values.entries();
      const iter2 = values.entries();
      const r1 = iter1.next();
      const r2 = iter2.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
      expect(r1.value![1]).assertEqual(r2.value![1]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3400
     * @tc.name testFloat64ArrayEntries034
     * @tc.desc Verify original array element values unchanged after entries traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = new Float64Array([int32MinValue, -1]);
      const iter = values.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      const actVal2 = values.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = values.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal3).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3500
     * @tc.name testFloat64ArrayEntries035
     * @tc.desc Verify Float64Array entries partial traversal then continue iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const iter = values.entries();
      iter.next();
      iter.next();
      const result = iter.next();

      expect(result.done).assertFalse();
      expect(result.value).assertDeepEquals([2, 0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3600
     * @tc.name testFloat64ArrayEntries036
     * @tc.desc Verify Float64Array entries only take first element then stop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const iter = values.entries();
      const first = iter.next();
      const second = iter.next();
      const expectVal = false;
      expect(second.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3700
     * @tc.name testFloat64ArrayEntries037
     * @tc.desc Verify traverse entries of multiple Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr1 = Float64Array.of(1.0, 2.0);
      const arr2 = new Float64Array([3.0, 4.0]);
      let total = 0.0;
      for (const entry of arr1.entries()) {
        total += entry[1];
      }
      for (const entry of arr2.entries()) {
        total += entry[1];
      }
      const expectVal = tenPointZero;
      expect(total).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3800
     * @tc.name testFloat64ArrayEntries038
     * @tc.desc Verify same array multiple entries traversal results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(5.0, 6.0);
      let sum1 = 0.0;
      for (const entry of values.entries()) {
        sum1 += entry[1];
      }
      let sum2 = 0.0;
      for (const entry of values.entries()) {
        sum2 += entry[1];
      }
      const expectVal = sum2;
      expect(sum1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_3900
     * @tc.name testFloat64ArrayEntries039
     * @tc.desc Verify Float64Array entries traverses 0.1+0.2!=0.3 scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointThree: number = 0.3;
      const precisionSumValue: number =
        0.30000000000000004;
      const values = new Float64Array([0.1, 0.2, pointThree]);
      const iter = values.entries();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();

      expect(r1.value![1] + r2.value![1])
        .assertEqual(precisionSumValue);
      expect(r3.value![1]).assertEqual(pointThree);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4000
     * @tc.name testFloat64ArrayEntries040
     * @tc.desc Verify entries return value type is Number object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array([onePointZero]);
      const iter = values.entries();
      const result = iter.next();

      expect(result.done).assertFalse();
      expect(result.value![1]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4100
     * @tc.name testFloat64ArrayEntries041
     * @tc.desc Verify entries return Number value can be obtained via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const values = new Float64Array([fillValue42]);
      const iter = values.entries();
      const result = iter.next();

      expect(result.done).assertFalse();
      expect(result.value![1]).assertEqual(fillValue42);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4200
     * @tc.name testFloat64ArrayEntries042
     * @tc.desc Verify 100 element Float64Array entries complete traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const hundredValue: number = 100;
      const values = new Float64Array(100);
      for (let i = 0; i < 100; i += 1) {
        values.$_set(i, i * onePointZero);
      }
      const iter = values.entries();
      let count = 0;
      let entry = iter.next();
      while (!entry.done) {
        count += 1;
        entry = iter.next();
      }
      const expectVal = hundredValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4300
     * @tc.name testFloat64ArrayEntries043
     * @tc.desc Verify 100 element Float64Array entries last element index is 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const ninetynineValue: number = 99;
      const values = new Float64Array(100);
      for (let i = 0; i < 100; i += 1) {
        values.$_set(i, i * onePointZero);
      }
      const iter = values.entries();
      let lastIndex: Int = 0;
      let entry = iter.next();
      let loopIdx = 0;
      while (!entry.done) {
        lastIndex = loopIdx;
        loopIdx += 1;
        entry = iter.next();
      }
      const expectVal = ninetynineValue;
      expect(lastIndex).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4400
     * @tc.name testFloat64ArrayEntries044
     * @tc.desc Verify Float64Array entries done is true after traversing all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1);
      const iter = values.entries();
      iter.next();
      const doneResult = iter.next();
      const expectVal = true;
      expect(doneResult.done).assertEqual(expectVal);
      expect(doneResult.value).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4500
     * @tc.name testFloat64ArrayEntries045
     * @tc.desc Verify Float64Array entries done is false before traversal completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5]);
      const iter = values.entries();
      const first = iter.next();
      const expectVal = false;
      expect(first.done).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4600
     * @tc.name testFloat64ArrayEntries046
     * @tc.desc Verify Float64Array entries destructuring in for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyPointZero: number = 30.0;
      const values = Float64Array.of(10.0, 20.0);
      let sum = 0.0;
      for (const entry of values.entries()) {
        sum += entry[1];
      }
      const expectVal = thirtyPointZero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4700
     * @tc.name testFloat64ArrayEntries047
     * @tc.desc Verify Float64Array entries only use value in for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num600Pointzero: number = 600.0;
      const values = Float64Array.of(100.0, 200.0, 300.0);
      let sum = 0.0;
      for (const entry of values.entries()) {
        sum += entry[1];
      }
      const expectVal = num600Pointzero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4800
     * @tc.name testFloat64ArrayEntries048
     * @tc.desc Verify Float64Array entries only use index in for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const values = Float64Array.of(1.0, 2.0, 3.0);
      let indexSum = 0;
      for (const entry of values.entries()) {
        indexSum += entry[0];
      }
      const expectVal = threeValue;
      expect(indexSum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_4900
     * @tc.name testFloat64ArrayEntries049
     * @tc.desc Verify Float64Array entries return expected indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const entriesIter = values.entries();
      let count: int = 0;
      let entry = entriesIter.next();
      while (!entry.done) {
        const item = entry.value;
        if (item != undefined) {
          expect(item[0]).assertEqual(count);
        }
        count += 1;
        entry = entriesIter.next();
      }
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5000
     * @tc.name testFloat64ArrayEntries050
     * @tc.desc Verify Float64Array entries return expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const values = Float64Array.of(int16MinValue, -128, zeroValue);
      const entriesIter = values.entries();
      let count: int = 0;
      let entry = entriesIter.next();
      while (!entry.done) {
        const item = entry.value;
        if (item != undefined) {
          if (count == 0) {
            expect(item[1]).assertEqual(int16MinValue);
          } else if (count == 1) {
            expect(item[1]).assertEqual(-128);
          } else {
            expect(item[1]).assertEqual(zeroValue);
          }
        }
        count += 1;
        entry = entriesIter.next();
      }
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5100
     * @tc.name testFloat64ArrayEntries051
     * @tc.desc Verify Float64Array entries empty array multiple next calls do not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const iter = values.entries();
      iter.next();
      iter.next();
      iter.next();
      const actVal4 = iter.next().done;
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5200
     * @tc.name testFloat64ArrayEntries052
     * @tc.desc Verify entries() iterates [index, value] pairs over array [0.1, 9007199254740991] with ascending indices 0,1 and total count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = Float64Array.of(0.1, 9007199254740991);
      let count = 0;
      for (const entry of values.entries()) {
        expect(entry[0]).assertEqual(count);
        count++;
      }
      const expectVal = twoValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5300
     * @tc.name testFloat64ArrayEntries053
     * @tc.desc Verify entries iterates single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const zeroValue: number = 0;
      const values = new Float64Array([pointFive]);
      for (const entry of values.entries()) {
        expect(entry[0]).assertEqual(zeroValue);
        expect(entry[1]).assertEqual(pointFive);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5400
     * @tc.name testFloat64ArrayEntries054
     * @tc.desc Verify entries iterates array containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128]);
      let hasNaN = false;
      for (const entry of values.entries()) {
        if (Number.isNaN(entry[1])) {
          hasNaN = true;
        }
      }
      const expectVal = false;
      expect(hasNaN).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5500
     * @tc.name testFloat64ArrayEntries055
     * @tc.desc Verify entries iterates array containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1]);
      let hasInf = false;
      let hasNegInf = false;
      for (const entry of values.entries()) {
        if (entry[1] === Infinity) {
          hasInf = true;
        }
        if (entry[1] === -Infinity) {
          hasNegInf = true;
        }
      }
      const expectVal = false;
      expect(hasInf).assertEqual(expectVal);
      const expectVal2 = false;
      expect(hasNegInf).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5600
     * @tc.name testFloat64ArrayEntries056
     * @tc.desc Verify entries with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num255Value: number = 255;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const iter = arr.entries();
      const [key, value] = iter.next().value!;
      const expectVal = num255Value;
      expect(value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5700
     * @tc.name testFloat64ArrayEntries057
     * @tc.desc Verify entries with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num255Value: number = 255;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const iter = arr.entries();
      const [key, value] = iter.next().value!;
      const expectVal = num255Value;
      expect(value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5800
     * @tc.name testFloat64ArrayEntries058
     * @tc.desc Verify entries with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const iter = arr.entries();
      let count: int = 0;
      while (true) {
        const entry = iter.next();
        if (entry.done) {
          break;
        }
        count++;
      }
      const expectVal = 2;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_5900
     * @tc.name testFloat64ArrayEntries059
     * @tc.desc Verify entries with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const iter = arr.entries();
      let count: int = 0;
      while (true) {
        const entry = iter.next();
        if (entry.done) {
          break;
        }
        count++;
      }
      const expectVal = 2;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6000
     * @tc.name testFloat64ArrayEntries060
     * @tc.desc Verify entries with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const iter = arr.entries();
      let count: int = 0;
      while (true) {
        const entry = iter.next();
        if (entry.done) {
          break;
        }
        count++;
      }
      const expectVal = 2;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6100
     * @tc.name testFloat64ArrayEntries061
     * @tc.desc Verify entries can locate the index of a matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = new Float64Array([5.0, 15.0, 25.0, 35.0]);
      let foundIndex = -1;
      for (const entry of values.entries()) {
        if (entry[1] > 20.0) {
          foundIndex = entry[0];
          break;
        }
      }
      const expectVal = twoValue;
      expect(foundIndex).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6200
     * @tc.name testFloat64ArrayEntries062
     * @tc.desc Verify entries can drive reduce-style weighted sum accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyonePointzero: number = 21.0;
      const values = Float64Array.of(2.0, 5.0, 8.0);
      let weightedSum = 0.0;
      for (const entry of values.entries()) {
        weightedSum += entry[0] * entry[1];
      }
      const expectVal = twentyonePointzero;
      expect(weightedSum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6300
     * @tc.name testFloat64ArrayEntries063
     * @tc.desc Verify entries supports index-based conditional filtering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eighteenPointzero: number = 18.0;
      const values = new Float64Array([3.0, 6.0, 9.0, 12.0, 15.0]);
      let oddIndexSum = 0.0;
      for (const entry of values.entries()) {
        if (entry[0] % 2 == 1) {
          oddIndexSum += entry[1];
        }
      }
      const expectVal = eighteenPointzero;
      expect(oddIndexSum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6400
     * @tc.name testFloat64ArrayEntries064
     * @tc.desc Verify entries on nonzero byteOffset view starts indexes at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(40);
      const a = new Float64Array(b);
      a.$_set(1, 20.0);
      a.$_set(2, 30.0);
      const iter = new Float64Array(b, 8, 2).entries();
      const actVal5 = iter.next().value!;
      expect(actVal5).assertDeepEquals([0, 20.0]);
      const actVal6 = iter.next().value!;
      expect(actVal6).assertDeepEquals([1, 30.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6500
     * @tc.name testFloat64ArrayEntries065
     * @tc.desc Verify entries exhausted iterator remains done on repeated next calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter = Float64Array.of(1.0).entries();
      iter.next();
      const actVal7 = iter.next().done;
      const expectVal = true;
      expect(actVal7).assertEqual(expectVal);
      const actVal8 = iter.next().done;
      const expectVal2 = true;
      expect(actVal8).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6600
     * @tc.name testFloat64ArrayEntries066
     * @tc.desc Verify entries creates independent iterator state for same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([4.0, 5.0]);
      const first = a.entries();
      const second = a.entries();
      const actVal9 = first.next().value!;
      expect(actVal9).assertDeepEquals([0, 4.0]);
      const actVal10 = second.next().value!;
      expect(actVal10).assertDeepEquals([0, 4.0]);
      const actVal11 = first.next().value!;
      expect(actVal11).assertDeepEquals([1, 5.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6700
     * @tc.name testFloat64ArrayEntries067
     * @tc.desc Verify entries observes mutation made before first next call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0]);
      const iter = a.entries();
      a.$_set(0, 10.0);
      const actVal12 = iter.next().value!;
      expect(actVal12).assertDeepEquals([0, 10.0]);
      const actVal13 = iter.next().value!;
      expect(actVal13).assertDeepEquals([1, 2.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6800
     * @tc.name testFloat64ArrayEntries068
     * @tc.desc Verify entries observes mutation made before later next call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0, 3.0]);
      const iter = a.entries();
      const actVal14 = iter.next().value!;
      expect(actVal14).assertDeepEquals([0, 1.0]);
      a.$_set(2, 30.0);
      const actVal15 = iter.next().value!;
      expect(actVal15).assertDeepEquals([1, 2.0]);
      const actVal16 = iter.next().value!;
      expect(actVal16).assertDeepEquals([2, 30.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_6900
     * @tc.name testFloat64ArrayEntries069
     * @tc.desc Verify entries tuple can carry NaN value with stable index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Float64Array([NaN, 2.0]).entries().next().value!;
      const value: number = first[1];
      expect(first[0]).assertEqual(0);
      const actVal17 = Number.isNaN(value);
      const expectVal = true;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_7000
     * @tc.name testFloat64ArrayEntries070
     * @tc.desc Verify entries tuple preserves negative zero sign in value slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Float64Array([-0.0]).entries().next().value!;
      const value: number = first[1];
      expect(first[0]).assertEqual(0);
      expect(1 / value).assertEqual(-Infinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_7100
     * @tc.name testFloat64ArrayEntries071
     * @tc.desc Verify entries after reverse reports reversed values with new indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0, 3.0]);
      a.reverse();
      const iter = a.entries();
      const actVal18 = iter.next().value!;
      expect(actVal18).assertDeepEquals([0, 3.0]);
      const actVal19 = iter.next().value!;
      expect(actVal19).assertDeepEquals([1, 2.0]);
      const actVal20 = iter.next().value!;
      expect(actVal20).assertDeepEquals([2, 1.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_7200
     * @tc.name testFloat64ArrayEntries072
     * @tc.desc Verify entries over toReversed copy leaves original first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0, 3.0]);
      const first = a.toReversed().entries().next().value!;
      expect(first).assertDeepEquals([0, 3.0]);
      const actVal21 = a.$_get(0);
      const expectVal = 1.0;
      expect(actVal21).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_7300
     * @tc.name testFloat64ArrayEntries073
     * @tc.desc Verify entries over toSorted copy reports ascending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter = Float64Array.of(3.0, 1.0, 2.0).toSorted().entries();
      const actVal22 = iter.next().value!;
      expect(actVal22).assertDeepEquals([0, 1.0]);
      const actVal23 = iter.next().value!;
      expect(actVal23).assertDeepEquals([1, 2.0]);
      const actVal24 = iter.next().value!;
      expect(actVal24).assertDeepEquals([2, 3.0]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_7400
     * @tc.name testFloat64ArrayEntries074
     * @tc.desc Verify entries loop count matches view length after subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([5.0, 6.0, 7.0, 8.0]).subarray(1, 4);
      let count = 0;
      let lastIndex = -1;
      for (const entry of v.entries()) {
        count += 1;
        lastIndex = entry[0];
      }
      const expectVal = 3;
      expect(count).assertEqual(expectVal);
      const expectVal2 = 2;
      expect(lastIndex).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ENTRIES_7500
     * @tc.name testFloat64ArrayEntries075
     * @tc.desc Verify entries tuple values can drive exact indexed rewrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEntries075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0, 3.0]);
      for (const entry of a.entries()) {
        a.$_set(entry[0], entry[1] * 2.0);
      }
      const actVal25 = a.$_get(0);
      const expectVal = 2.0;
      expect(actVal25).assertEqual(expectVal);
      const actVal26 = a.$_get(2);
      const expectVal2 = 6.0;
      expect(actVal26).assertEqual(expectVal2);
    })

  })
}
