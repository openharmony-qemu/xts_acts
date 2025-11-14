/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import * as ArrayReverse from './ArrayReverseTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayReverseTest() {
  describe('ArrayReverseTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
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
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0100
     * @tc.name ArrayReverseTest001
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn01_testReverseBasicFunctionality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0200
     * @tc.name ArrayReverseTest002
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn02_testOriginalArrayIsModified();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0300
     * @tc.name ArrayReverseTest003
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn03_testReturnValueIsOriginalArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0400
     * @tc.name ArrayReverseTest004
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn04_testEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0500
     * @tc.name ArrayReverseTest005
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn05_testSingleElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0600
     * @tc.name ArrayReverseTest006
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn06_testMixedDataTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0700
     * @tc.name ArrayReverseTest007
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn07_testNestedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0800
     * @tc.name ArrayReverseTest008
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn08_testSparseArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_0900
     * @tc.name ArrayReverseTest009
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn09_testWithUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1000
     * @tc.name ArrayReverseTest010
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn10_testWithNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1100
     * @tc.name ArrayReverseTest011
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn11_testWithNaN();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1200
     * @tc.name ArrayReverseTest012
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn12_testWithObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1300
     * @tc.name ArrayReverseTest013
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn13_testModifyAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1400
     * @tc.name ArrayReverseTest014
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn14_testStringArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1500
     * @tc.name ArrayReverseTest015
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn15_testNumberArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1600
     * @tc.name ArrayReverseTest016
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn16_testBooleanArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1700
     * @tc.name ArrayReverseTest017
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn17_testLargeArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1800
     * @tc.name ArrayReverseTest018
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn18_test2DArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_1900
     * @tc.name ArrayReverseTest019
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn19_testNegativeNumbers();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2000
     * @tc.name ArrayReverseTest020
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn20_testWithZeros();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2100
     * @tc.name ArrayReverseTest021
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn21_testWithInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2200
     * @tc.name ArrayReverseTest022
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn22_testFunctionArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2300
     * @tc.name ArrayReverseTest023
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn23_testDateObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2400
     * @tc.name ArrayReverseTest024
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn24_testLengthPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2500
     * @tc.name ArrayReverseTest025
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn25_testArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2600
     * @tc.name ArrayReverseTest026
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn26_testWithSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2700
     * @tc.name ArrayReverseTest027
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn27_testSortAlreadySorted();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2800
     * @tc.name ArrayReverseTest028
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn28_testReverseTwice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_2900
     * @tc.name ArrayReverseTest029
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn29_testEmptyArrayMultipleReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3000
     * @tc.name ArrayReverseTest030
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn30_testIteratorOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3100
     * @tc.name ArrayReverseTest031
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn31_testKeysOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3200
     * @tc.name ArrayReverseTest032
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn32_testEntriesOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3300
     * @tc.name ArrayReverseTest033
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn33_testIndexOfAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3400
     * @tc.name ArrayReverseTest034
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn34_testLastIndexOfAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3500
     * @tc.name ArrayReverseTest035
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn35_testJoinAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3600
     * @tc.name ArrayReverseTest036
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn36_testToStringAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3700
     * @tc.name ArrayReverseTest037
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn37_testValueOfAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3800
     * @tc.name ArrayReverseTest038
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn38_testSliceAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_3900
     * @tc.name ArrayReverseTest039
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn39_testConcatAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4000
     * @tc.name ArrayReverseTest040
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn40_testPushAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4100
     * @tc.name ArrayReverseTest041
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn41_testUnshiftAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4200
     * @tc.name ArrayReverseTest042
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn42_testPopAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4300
     * @tc.name ArrayReverseTest043
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn43_testShiftAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4400
     * @tc.name ArrayReverseTest044
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn44_testSpliceAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4500
     * @tc.name ArrayReverseTest045
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn45_testEveryAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4600
     * @tc.name ArrayReverseTest046
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn46_testSomeAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4700
     * @tc.name ArrayReverseTest047
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn47_testFilterAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4800
     * @tc.name ArrayReverseTest048
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn48_testMapAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_4900
     * @tc.name ArrayReverseTest049
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn49_testReduceAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5000
     * @tc.name ArrayReverseTest050
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn50_testReduceRightAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5100
     * @tc.name ArrayReverseTest051
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn51_testFindAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5200
     * @tc.name ArrayReverseTest052
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn52_testFindIndexAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5300
     * @tc.name ArrayReverseTest053
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn53_testIncludesAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5400
     * @tc.name ArrayReverseTest054
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn54_testFlatAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5500
     * @tc.name ArrayReverseTest055
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn55_testFlatMapAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5600
     * @tc.name ArrayReverseTest056
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn56_testSortAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5700
     * @tc.name ArrayReverseTest057
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn57_testFillAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5800
     * @tc.name ArrayReverseTest058
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn58_testCopyWithinAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_5900
     * @tc.name ArrayReverseTest059
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn59_testFrozenArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6000
     * @tc.name ArrayReverseTest060
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn60_testSealedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6100
     * @tc.name ArrayReverseTest061
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn61_testToLocaleStringAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6200
     * @tc.name ArrayReverseTest062
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn62_testFlatInfinityAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6300
     * @tc.name ArrayReverseTest063
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn63_testDestructuringAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6400
     * @tc.name ArrayReverseTest064
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn64_testSpreadAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6500
     * @tc.name ArrayReverseTest065
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn65_testIsArrayAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6600
     * @tc.name ArrayReverseTest066
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn66_testConstructorAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6700
     * @tc.name ArrayReverseTest067
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn67_testPrototypeAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6800
     * @tc.name ArrayReverseTest068
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn68_testIsPrototypeOfAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_6900
     * @tc.name ArrayReverseTest069
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn69_testHasOwnPropertyAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7000
     * @tc.name ArrayReverseTest070
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn70_testPropertyIsEnumerableAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7100
     * @tc.name ArrayReverseTest071
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn71_testToSourceAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7200
     * @tc.name ArrayReverseTest072
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn72_testToStringVsJoinAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7300
     * @tc.name ArrayReverseTest073
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn73_testFindLastAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7400
     * @tc.name ArrayReverseTest074
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn74_testFindLastIndexAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7500
     * @tc.name ArrayReverseTest075
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn75_testWithAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7600
     * @tc.name ArrayReverseTest076
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn76_testValuesIteratorAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7700
     * @tc.name ArrayReverseTest077
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn77_testKeysIteratorAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7800
     * @tc.name ArrayReverseTest078
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn78_testEntriesIteratorAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_7900
     * @tc.name ArrayReverseTest079
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn79_testFlatMapChainAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8000
     * @tc.name ArrayReverseTest080
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn80_testMapChainAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8100
     * @tc.name ArrayReverseTest081
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn81_testFilterChainAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8200
     * @tc.name ArrayReverseTest082
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn82_testReduceChainAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8300
     * @tc.name ArrayReverseTest083
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn83_testForEachAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8400
     * @tc.name ArrayReverseTest084
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn84_testWithRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8500
     * @tc.name ArrayReverseTest085
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn85_testEvenLengthArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8600
     * @tc.name ArrayReverseTest086
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn86_testOddLengthArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8700
     * @tc.name ArrayReverseTest087
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn87_testForOfAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8800
     * @tc.name ArrayReverseTest088
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn88_testForLoopAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_8900
     * @tc.name ArrayReverseTest089
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn89_testCircularReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9000
     * @tc.name ArrayReverseTest090
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn90_testAsFunctionParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9100
     * @tc.name ArrayReverseTest091
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn91_testMapChaining();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9200
     * @tc.name ArrayReverseTest092
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn92_testFilterMapCombination();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9300
     * @tc.name ArrayReverseTest093
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn93_testArrayOfReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9400
     * @tc.name ArrayReverseTest094
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn94_testArrayConstructorReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9500
     * @tc.name ArrayReverseTest095
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn95_testArrayFromReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9600
     * @tc.name ArrayReverseTest096
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn96_testLengthModifiedAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9700
     * @tc.name ArrayReverseTest097
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn97_testElementDeletedAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9800
     * @tc.name ArrayReverseTest098
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn98_testMathObjectArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_9900
     * @tc.name ArrayReverseTest099
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn99_testFindNonExistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10000
     * @tc.name ArrayReverseTest100
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn100_testEveryCondition();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10100
     * @tc.name ArrayReverseTest101
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn101_testSomeCondition();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10200
     * @tc.name ArrayReverseTest102
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn102_testReduceProduct();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10300
     * @tc.name ArrayReverseTest103
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn103_testFlatMapNested();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10400
     * @tc.name ArrayReverseTest104
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn104_testUint8ArrayReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10500
     * @tc.name ArrayReverseTest105
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn105_testFloat64ArrayReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10600
     * @tc.name ArrayReverseTest106
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn106_testConcatEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10700
     * @tc.name ArrayReverseTest107
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn107_testSliceLastElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10800
     * @tc.name ArrayReverseTest108
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn108_testSpliceFirstElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_10900
     * @tc.name ArrayReverseTest109
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn109_testUnshiftMultiple();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11000
     * @tc.name ArrayReverseTest110
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn110_testPushMultiple();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11100
     * @tc.name ArrayReverseTest111
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn111_testShiftMultiple();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11200
     * @tc.name ArrayReverseTest112
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn112_testPopMultiple();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11300
     * @tc.name ArrayReverseTest113
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn113_testFillAllElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11400
     * @tc.name ArrayReverseTest114
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn114_testCopyWithinAll();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11500
     * @tc.name ArrayReverseTest115
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn115_testDuplicateElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11600
     * @tc.name ArrayReverseTest116
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn116_testIncreasingSequence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11700
     * @tc.name ArrayReverseTest117
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn117_testDecreasingSequence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11800
     * @tc.name ArrayReverseTest118
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn118_testIndexOfFirstOccurrence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_11900
     * @tc.name ArrayReverseTest119
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn119_testLastIndexOfLastOccurrence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12000
     * @tc.name ArrayReverseTest120
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn120_testJoinWithSeparator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12100
     * @tc.name ArrayReverseTest121
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn121_testToStringComparison();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12200
     * @tc.name ArrayReverseTest122
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn122_testValueOfReturnsSelf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12300
     * @tc.name ArrayReverseTest123
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn123_testFlatWithDepth();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12400
     * @tc.name ArrayReverseTest124
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn124_testSortWithComparator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12500
     * @tc.name ArrayReverseTest125
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn125_testNonExtensibleArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12600
     * @tc.name ArrayReverseTest126
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn126_testToLocaleStringWithParams();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12700
     * @tc.name ArrayReverseTest127
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn127_testDestructuringAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12800
     * @tc.name ArrayReverseTest128
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn128_testSpreadOperator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_12900
     * @tc.name ArrayReverseTest129
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn129_testIsArrayResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13000
     * @tc.name ArrayReverseTest130
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn130_testConstructorProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13100
     * @tc.name ArrayReverseTest131
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn131_testPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13200
     * @tc.name ArrayReverseTest132
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn132_testIsPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13300
     * @tc.name ArrayReverseTest133
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn133_testHasOwnPropertyNonExistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13400
     * @tc.name ArrayReverseTest134
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn134_testPropertyIsEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13500
     * @tc.name ArrayReverseTest135
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn135_testFindLast();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13600
     * @tc.name ArrayReverseTest136
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn136_testFindLastIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13700
     * @tc.name ArrayReverseTest137
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn137_testWithReplaceFirst();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13800
     * @tc.name ArrayReverseTest138
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn138_testValuesIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_13900
     * @tc.name ArrayReverseTest139
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn139_testKeysIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14000
     * @tc.name ArrayReverseTest140
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn140_testEntriesIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14100
     * @tc.name ArrayReverseTest141
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn141_testFlatMapNestedChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14200
     * @tc.name ArrayReverseTest142
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn142_testMapFilterChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14300
     * @tc.name ArrayReverseTest143
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn143_testFilterReduceChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14400
     * @tc.name ArrayReverseTest144
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn144_testReduceMax();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14500
     * @tc.name ArrayReverseTest145
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn145_testForEachModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14600
     * @tc.name ArrayReverseTest146
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn146_testMixedBigIntNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14700
     * @tc.name ArrayReverseTest147
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn147_testMixedStringNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14800
     * @tc.name ArrayReverseTest148
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn148_testElementTypeCheck();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_14900
     * @tc.name ArrayReverseTest149
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn149_testStrictEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15000
     * @tc.name ArrayReverseTest150
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn150_testLooseEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15100
     * @tc.name ArrayReverseTest151
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn151_testCallOnArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15200
     * @tc.name ArrayReverseTest152
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn152_testApplyOnArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15300
     * @tc.name ArrayReverseTest153
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn153_testBindOnArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15400
     * @tc.name ArrayReverseTest154
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn154_testElementsAreArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15500
     * @tc.name ArrayReverseTest155
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn155_testElementsAreFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15600
     * @tc.name ArrayReverseTest156
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn156_testElementsAreDates();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15700
     * @tc.name ArrayReverseTest157
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn157_testVeryLargeArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15800
     * @tc.name ArrayReverseTest158
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn158_testLengthWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_15900
     * @tc.name ArrayReverseTest159
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn159_testModifyElementsAfterReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_16000
     * @tc.name ArrayReverseTest160
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn160_testToStringComparisonOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_16100
     * @tc.name ArrayReverseTest161
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn161_testJoinEmptyString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ArrayReverse_TEST_16200
     * @tc.name ArrayReverseTest162
     * @tc.desc test array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayReverseTest162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverse.Fn162_testFlatNonNested();
      expect(result).assertEqual(true);
    });
  })
}