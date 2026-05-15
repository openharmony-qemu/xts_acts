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


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import Utils from '../../Util.test';
import * as ToSortedJs from './ToSorted';

export default function ArrayToSortedMindMapTest() {
  describe('ArrayToSortedMindMapTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   testToSortedTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0100
     * @tc.desc   Basic sort with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0100()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0200
     * @tc.desc   Sort with compare function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0101()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0300
     * @tc.desc   Default sort of number array (string conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0102()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0400
     * @tc.desc   Sort boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0103()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0500
     * @tc.desc   Sort array of identical elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0104()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0600
     * @tc.desc   Sort already sorted array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0105()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0700
     * @tc.desc   Sort reverse-ordered array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0106()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0800
     * @tc.desc   Sort array with duplicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0107()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_0900
     * @tc.desc   Compare function parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0108()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1000
     * @tc.desc   Compare function returns negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0109()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1100
     * @tc.desc   Compare function returns positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0110()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1200
     * @tc.desc   Compare function returns zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0111()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1300
     * @tc.desc   Compare function returns non-integer (float)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0112()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1400
     * @tc.desc   Compare function returns NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0113()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1500
     * @tc.desc   Compare function returns Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0114()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1600
     * @tc.desc   Compare function throws internally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0115()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1700
     * @tc.desc   Compare function is not a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0116()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1800
     * @tc.desc   Compare function passed number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0117()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_1900
     * @tc.desc   Compare function passed null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0118()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2000
     * @tc.desc   Compare function passed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0119()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2100
     * @tc.desc   Compare function passed undefined (same as omitted)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0120()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2200
     * @tc.desc   Compare function uses only first parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0121()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2300
     * @tc.desc   Compare function mutates original elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0122()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2400
     * @tc.desc   Return value is new array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0123()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2500
     * @tc.desc   Original array unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0124()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2600
     * @tc.desc   Returned array length equals original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0125()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2700
     * @tc.desc   Returned array contains all original elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0126()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2800
     * @tc.desc   Returned array is not same reference as original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0127()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_2900
     * @tc.desc   Returned array prototype is Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0128()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3000
     * @tc.desc   Object elements keep same reference in new array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0129()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3100
     * @tc.desc   Sort works when original is frozen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0130()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3200
     * @tc.desc   Sort works when original is sealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0131()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3300
     * @tc.desc   Numeric ascending sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0132()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3400
     * @tc.desc   Numeric descending sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0133()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3500
     * @tc.desc   Float sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0134()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3600
     * @tc.desc   Negative number sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0135()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3700
     * @tc.desc   Infinity and -Infinity sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0136()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3800
     * @tc.desc   NaN sort behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0137()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_3900
     * @tc.desc   String sort by Unicode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0138()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4000
     * @tc.desc   String case sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0139()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4100
     * @tc.desc   Empty string sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0140()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4200
     * @tc.desc   Chinese string sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0141()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4300
     * @tc.desc   Object array sort by property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0142()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4400
     * @tc.desc   null value sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0143()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4500
     * @tc.desc   undefined value sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0144()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4600
     * @tc.desc   Mixed null and undefined sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0145()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4700
     * @tc.desc   Mixed number and string sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0146()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4800
     * @tc.desc   Mixed multiple types sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0147()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_4900
     * @tc.desc   Date object sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0148()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5000
     * @tc.desc   Empty array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0149()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5100
     * @tc.desc   Single-element array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0150()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5200
     * @tc.desc   Two-element array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0151()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5300
     * @tc.desc   Sparse array - holes in middle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0152()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5400
     * @tc.desc   Sparse array - holes at start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0153()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5500
     * @tc.desc   Sparse array - holes at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0154()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5600
     * @tc.desc   Sparse array - all holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0155()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5700
     * @tc.desc   Sparse array - holes mixed with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0156()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5800
     * @tc.desc   Sparse array - holes skip compare callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0157()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_5900
     * @tc.desc   Array with NaN sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0158()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6000
     * @tc.desc   Array with +0 and -0 sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0159()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6100
     * @tc.desc   Array with Symbol elements sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0160()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6200
     * @tc.desc   Array with function elements sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0161()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6300
     * @tc.desc   Large array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0162()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6400
     * @tc.desc   Array with nested array elements sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0163()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6500
     * @tc.desc   Array with extra prototype elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0164()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6600
     * @tc.desc   Plain array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0165()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6700
     * @tc.desc   Array-like length greater than properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0166()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6800
     * @tc.desc   Array-like length is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0167()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_6900
     * @tc.desc   Array-like negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0168()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7000
     * @tc.desc   Array-like non-integer length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0169()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7100
     * @tc.desc   Array-like length is NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0170()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7200
     * @tc.desc   Array-like length is Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0171()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7300
     * @tc.desc   Array-like without length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0172()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7400
     * @tc.desc   Array-like with non-numeric keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0173()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7500
     * @tc.desc   String as this value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0174()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7600
     * @tc.desc   arguments as this value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0175()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7700
     * @tc.desc   Call via apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0176()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7800
     * @tc.desc   Call via bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0177()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_7900
     * @tc.desc   TypedArray as this value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0178()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8000
     * @tc.desc   Extra arguments passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0179()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8100
     * @tc.desc   compareFn is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0180()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8200
     * @tc.desc   compareFn is number 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0181()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8300
     * @tc.desc   compareFn is empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0182()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8400
     * @tc.desc   compareFn is arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0183()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8500
     * @tc.desc   compareFn is bind-returned function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0184()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8600
     * @tc.desc   this is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0185()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8700
     * @tc.desc   this is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0186()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8800
     * @tc.desc   this is primitive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0187()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_8900
     * @tc.desc   this is primitive boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0188()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9000
     * @tc.desc   Very large length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0189()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9100
     * @tc.desc   Non-numeric string length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0190()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9200
     * @tc.desc   Array length exceeds 2^32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0191()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9300
     * @tc.desc   length via property accessor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0192()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9400
     * @tc.desc   length getter throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0193()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9500
     * @tc.desc   Element accessor throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0194()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9600
     * @tc.desc   Consistency with sort() result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0195()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9700
     * @tc.desc   Compare with sort() - original unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0196()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9800
     * @tc.desc   Chain with toReversed()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0197()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9900
     * @tc.desc   Chain with toSpliced()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0198()).assertEqual(true);
    });
    /**
     * @tc.name   testToSortedTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSORTED_SUPPLEMENT_TEST_9999
     * @tc.desc   Chain with with()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSortedTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSortedJs.ToSortedJs_0199()).assertEqual(true);
    });
  });
}
