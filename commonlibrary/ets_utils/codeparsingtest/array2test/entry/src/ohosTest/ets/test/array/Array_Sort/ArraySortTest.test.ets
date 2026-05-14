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
import * as ArraySortJs from './ArraySortTest';

export default function ArraySortMindMapTest() {
  describe('ArraySortMindMapTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    // Presets an action, which is performed before each unit test case starts.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: preset action function.
    beforeEach(async (): Promise<void> => await Utils.msSleep(20))
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name testArraySortTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0100
     * @tc.desc MindMap sort 功能点 001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn01_testDefaultStringSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0200
     * @tc.desc MindMap sort 功能点 002
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn02_testNumberAscendingSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0300
     * @tc.desc MindMap sort 功能点 003
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn03_testInPlaceSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0400
     * @tc.desc MindMap sort 功能点 004
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn04_testStringAlphabeticalSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0500
     * @tc.desc MindMap sort 功能点 005
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn05_testNumberDescendingSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0600
     * @tc.desc MindMap sort 功能点 006
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn06_testEmptyArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0700
     * @tc.desc MindMap sort 功能点 007
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn07_testSingleElementSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0800
     * @tc.desc MindMap sort 功能点 008
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn08_testAllSameElementsSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0900
     * @tc.desc MindMap sort 功能点 009
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn09_testNegativeNumbersSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1000
     * @tc.desc MindMap sort 功能点 010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn10_testZeroInArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1100
     * @tc.desc MindMap sort 功能点 011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn11_testStringLengthSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1200
     * @tc.desc MindMap sort 功能点 012
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn12_testObjectPropertySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1300
     * @tc.desc MindMap sort 功能点 013
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn13_testMixedStringNumberSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1400
     * @tc.desc MindMap sort 功能点 014
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn14_testCaseSensitiveSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1500
     * @tc.desc MindMap sort 功能点 015
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn15_testCaseInsensitiveSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1600
     * @tc.desc MindMap sort 功能点 016
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn16_testStringReverseSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1700
     * @tc.desc MindMap sort 功能点 017
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn17_testNullInArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1800
     * @tc.desc MindMap sort 功能点 018
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn18_testUndefinedInArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1900
     * @tc.desc MindMap sort 功能点 019
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn19_testMultipleObjectPropertiesSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2000
     * @tc.desc MindMap sort 功能点 020
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn20_testFloatNumbersSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2100
     * @tc.desc MindMap sort 功能点 021
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn21_testLargeIntegersSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2200
     * @tc.desc MindMap sort 功能点 022
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn22_testBooleansInArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2300
     * @tc.desc MindMap sort 功能点 023
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn23_testStringWithNumbersSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2400
     * @tc.desc MindMap sort 功能点 024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn24_testOriginalArrayReference()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2500
     * @tc.desc MindMap sort 功能点 025
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn25_testArrowFunctionSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2600
     * @tc.desc MindMap sort 功能点 026
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn26_testSparseArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2700
     * @tc.desc MindMap sort 功能点 027
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn27_testSpecialCharactersSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2800
     * @tc.desc MindMap sort 功能点 028
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn28_testObjectPropertyLengthSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2900
     * @tc.desc MindMap sort 功能点 029
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn29_testNestedArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3000
     * @tc.desc MindMap sort 功能点 030
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn30_testLocaleCompareSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3100
     * @tc.desc MindMap sort 功能点 031
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn31_testNaNInArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3200
     * @tc.desc MindMap sort 功能点 032
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn32_testDateStringSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3300
     * @tc.desc MindMap sort 功能点 033
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn33_testDateObjectSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3400
     * @tc.desc MindMap sort 功能点 034
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn34_testLastCharacterSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3500
     * @tc.desc MindMap sort 功能点 035
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn35_testArrayLengthAfterSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3600
     * @tc.desc MindMap sort 功能点 036
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn36_testFunctionExpressionSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3700
     * @tc.desc MindMap sort 功能点 037
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn37_testAbsoluteValueSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3800
     * @tc.desc MindMap sort 功能点 038
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn38_testUnicodeCharactersSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3900
     * @tc.desc MindMap sort 功能点 039
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn40_testObjectPropertyReverseSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4000
     * @tc.desc MindMap sort 功能点 040
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn41_testMixedTypesSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4100
     * @tc.desc MindMap sort 功能点 041
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn42_testVowelCountSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4200
     * @tc.desc MindMap sort 功能点 042
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn43_test2DArraySecondColumnSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4300
     * @tc.desc MindMap sort 功能点 043
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn44_testMaxValuePosition()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4400
     * @tc.desc MindMap sort 功能点 044
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn45_testMinValuePosition()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4500
     * @tc.desc MindMap sort 功能点 045
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn46_testCompareFunctionReturnZero()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4600
     * @tc.desc MindMap sort 功能点 046
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn47_testFirstLetterCapitalSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4700
     * @tc.desc MindMap sort 功能点 047
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn48_testRegExpSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4800
     * @tc.desc MindMap sort 功能点 048
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn49_testNestedObjectPropertySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4900
     * @tc.desc MindMap sort 功能点 049
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn50_testBufferSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5000
     * @tc.desc MindMap sort 功能点 050
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn51_testSubstringPresenceSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5100
     * @tc.desc MindMap sort 功能点 051
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn52_testLargeArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5200
     * @tc.desc MindMap sort 功能点 052
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn53_testOccurrenceCountSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5300
     * @tc.desc MindMap sort 功能点 053
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn54_testCompareFunctionReturnPositive()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5400
     * @tc.desc MindMap sort 功能点 054
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn55_testCompareFunctionReturnNegative()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5500
     * @tc.desc MindMap sort 功能点 055
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn56_testAsciiSumSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5600
     * @tc.desc MindMap sort 功能点 056
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn57_testSetToArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5700
     * @tc.desc MindMap sort 功能点 057
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn58_testObjectCreationTimeSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5800
     * @tc.desc MindMap sort 功能点 058
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn59_testMapValuesSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5900
     * @tc.desc MindMap sort 功能点 059
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn60_testPalindromeSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6000
     * @tc.desc MindMap sort 功能点 060
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn61_testArrayLikeSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6100
     * @tc.desc MindMap sort 功能点 061
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn62_testEvenOddSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6200
     * @tc.desc MindMap sort 功能点 062
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn63_testSymbolSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6300
     * @tc.desc MindMap sort 功能点 063
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn64_testPropertyExistenceSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6400
     * @tc.desc MindMap sort 功能点 064
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn65_testNumericStringSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6500
     * @tc.desc MindMap sort 功能点 065
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn66_testElementTypeSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6600
     * @tc.desc MindMap sort 功能点 066
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn67_testArrayTypePrioritySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6700
     * @tc.desc MindMap sort 功能点 067
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn68_testStringNumbersSumSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6800
     * @tc.desc MindMap sort 功能点 068
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn69_testMiddleElementAfterSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6900
     * @tc.desc MindMap sort 功能点 069
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn70_testObjectStringPropertyLengthSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7000
     * @tc.desc MindMap sort 功能点 070
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn71_testEmptyStringSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7100
     * @tc.desc MindMap sort 功能点 071
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn72_testSquareValueSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7200
     * @tc.desc MindMap sort 功能点 072
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn73_testGeneratorResultSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7300
     * @tc.desc MindMap sort 功能点 073
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn74_testObjectDateStringSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7400
     * @tc.desc MindMap sort 功能点 074
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn75_testStrictlyIncreasingAfterSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7500
     * @tc.desc MindMap sort 功能点 075
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn76_testUpperCaseCountSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7600
     * @tc.desc MindMap sort 功能点 076
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn77_testArrayOfArraysSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7700
     * @tc.desc MindMap sort 功能点 077
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn78_testObjectMethodReturnSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7800
     * @tc.desc MindMap sort 功能点 078
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn79_testInfinityInArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7900
     * @tc.desc MindMap sort 功能点 079
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn81_testEveryAfterSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8000
     * @tc.desc MindMap sort 功能点 080
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn82_testReverseAlphabeticalPropertySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8100
     * @tc.desc MindMap sort 功能点 081
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn83_testSortedCopyEquality()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8200
     * @tc.desc MindMap sort 功能点 082
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn84_testFunctionParameterCountSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8300
     * @tc.desc MindMap sort 功能点 083
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn85_testHexadecimalNumbersSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8400
     * @tc.desc MindMap sort 功能点 084
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn86_testSpecificCharCountSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8500
     * @tc.desc MindMap sort 功能点 085
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn87_testErrorObjectSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8600
     * @tc.desc MindMap sort 功能点 086
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn88_testPrimeNumberSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8700
     * @tc.desc MindMap sort 功能点 087
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn89_testFirstElementAfterSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8800
     * @tc.desc MindMap sort 功能点 088
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn90_testObjectArrayPropertyLengthSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8900
     * @tc.desc MindMap sort 功能点 089
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn91_testScientificNotationSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9000
     * @tc.desc MindMap sort 功能点 090
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn92_testStringPrefixSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9100
     * @tc.desc MindMap sort 功能点 091
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn93_testWeakMapKeysSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9200
     * @tc.desc MindMap sort 功能点 092
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn94_testNumberDigitCountSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9300
     * @tc.desc MindMap sort 功能点 093
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn95_testSomeAfterSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9400
     * @tc.desc MindMap sort 功能点 094
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn96_testObjectPropertyCountSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9500
     * @tc.desc MindMap sort 功能点 095
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn97_testNegativeZeroSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9600
     * @tc.desc MindMap sort 功能点 096
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn98_testLastCharPositionSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9700
     * @tc.desc MindMap sort 功能点 097
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn99_testPromiseArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9800
     * @tc.desc MindMap sort 功能点 098
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn100_testOddFirstSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9900
     * @tc.desc MindMap sort 功能点 099
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn101_testSpreadSortEquality()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_10000
     * @tc.desc MindMap sort 功能点 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn102_testKeysAfterSort()).assertEqual(true);
    });

  })
}
