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
import * as ToSplicedJs from './ToSpliced';

export default function ArrayToSplicedMindMapTest() {
  describe('ArrayToSplicedMindMapTest', () => {
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
     * @tc.name   testToSplicedTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0100
     * @tc.desc   1.1.1 Delete elements from middle of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0100()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0200
     * @tc.desc   1.1.2 Delete elements from head of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0101()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0300
     * @tc.desc   1.1.3 Delete elements from tail of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0102()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0400
     * @tc.desc   1.1.4 Delete all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0103()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0500
     * @tc.desc   1.2.1 Insert elements in middle of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0104()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0600
     * @tc.desc   1.2.2 Insert elements at head of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0105()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0700
     * @tc.desc   1.2.3 Append elements at tail of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0106()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0800
     * @tc.desc   1.2.4 Insert single element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0107()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0900
     * @tc.desc   1.2.5 Insert multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0108()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1000
     * @tc.desc   1.3.1 Replace one element with one element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0109()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1100
     * @tc.desc   1.3.2 Replace one element with multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0110()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1200
     * @tc.desc   1.3.3 Replace multiple elements with one element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0111()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1300
     * @tc.desc   1.3.4 Replace multiple elements with different count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0112()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1400
     * @tc.desc   1.4.1 start and deleteCount are 0 with no item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0113()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1500
     * @tc.desc   1.4.2 start equals array length with no item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0114()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1600
     * @tc.desc   2.1.1 start=0 (from head)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0115()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1700
     * @tc.desc   2.1.2 start in middle of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0116()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1800
     * @tc.desc   2.1.3 start equals array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0117()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1900
     * @tc.desc   2.1.4 start greater than array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0118()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2000
     * @tc.desc   2.2.1 start=-1 (last element)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0119()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2100
     * @tc.desc   2.2.2 negative start within range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0120()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2200
     * @tc.desc   2.2.3 negative start with abs equal to array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0121()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2300
     * @tc.desc   2.2.4 negative start with abs greater than array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0122()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2400
     * @tc.desc   2.3.1 start omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0123()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2500
     * @tc.desc   2.3.2 start is NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0124()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2600
     * @tc.desc   2.3.3 start is Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0125()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2700
     * @tc.desc   2.3.4 start is -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0126()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2800
     * @tc.desc   2.3.5 start is float (floored)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0127()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2900
     * @tc.desc   2.3.6 start is numeric string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0128()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3000
     * @tc.desc   2.3.7 start is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0129()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3100
     * @tc.desc   2.3.8 start is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0130()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3200
     * @tc.desc   2.3.9 start is true/false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0131()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3300
     * @tc.desc   3.1.1 deleteCount=0 (no deletion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0132()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3400
     * @tc.desc   3.1.2 deleteCount less than elements from start to end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0133()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3500
     * @tc.desc   3.1.3 deleteCount equals elements from start to end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0134()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3600
     * @tc.desc   3.1.4 deleteCount greater than elements from start to end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0135()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3700
     * @tc.desc   3.2.1 deleteCount omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0136()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3800
     * @tc.desc   3.2.2 deleteCount is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0137()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3900
     * @tc.desc   3.2.3 deleteCount is undefined with item parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0138()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4000
     * @tc.desc   3.2.4 deleteCount Infinity with item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0139()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4100
     * @tc.desc   3.2.5 deleteCount is negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0140()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4200
     * @tc.desc   3.2.6 deleteCount is NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0141()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4300
     * @tc.desc   3.2.7 deleteCount is float (truncated)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0142()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4400
     * @tc.desc   3.2.8 deleteCount is numeric string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0143()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4500
     * @tc.desc   3.2.9 deleteCount is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0144()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4600
     * @tc.desc   3.2.10 deleteCount is true/false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0145()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4700
     * @tc.desc   4.1.1 item is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0146()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4800
     * @tc.desc   4.1.2 item is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0147()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4900
     * @tc.desc   4.1.3 item is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0148()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5000
     * @tc.desc   4.1.4 item is array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0149()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5100
     * @tc.desc   4.1.5 item is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0150()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5200
     * @tc.desc   4.1.6 item is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0151()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5300
     * @tc.desc   4.1.7 item is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0152()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5400
     * @tc.desc   4.1.8 item is function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0153()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5500
     * @tc.desc   4.1.9 item is Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0154()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5600
     * @tc.desc   4.1.10 item is BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0155()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5700
     * @tc.desc   4.2.1 no item parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0156()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5800
     * @tc.desc   4.2.2 pass one item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0157()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5900
     * @tc.desc   4.2.3 pass multiple items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0158()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6000
     * @tc.desc   4.2.4 pass many items (performance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0159()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6100
     * @tc.desc   4.3.1 item is Date object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0160()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6200
     * @tc.desc   4.3.2 item is RegExp object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0161()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6300
     * @tc.desc   4.3.3 item is Map/Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0162()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6400
     * @tc.desc   4.3.4 item is sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0163()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6500
     * @tc.desc   5.1.1 return value is new array (different reference)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0164()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6600
     * @tc.desc   5.1.2 return value length is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0165()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6700
     * @tc.desc   5.1.3 return value is Array instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0166()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6800
     * @tc.desc   5.1.4 return value has correct element order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0167()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6900
     * @tc.desc   5.2.1 original array content unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0168()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7000
     * @tc.desc   5.2.2 original array length unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0169()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7100
     * @tc.desc   5.2.3 original element references unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0170()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7200
     * @tc.desc   5.2.4 multiple toSpliced calls do not interfere
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0171()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7300
     * @tc.desc   5.3.1 object elements are shallow copied (same reference)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0172()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7400
     * @tc.desc   5.3.2 non-deleted object elements keep original reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0173()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7500
     * @tc.desc   6.1.1 sparse array holes become undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0174()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7600
     * @tc.desc   6.1.2 returned array is dense (no holes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0175()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7700
     * @tc.desc   6.1.3 sparse holes within deletion range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0176()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7800
     * @tc.desc   6.1.4 sparse holes within retained range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0177()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7900
     * @tc.desc   6.2.1 array with all holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0178()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8000
     * @tc.desc   6.2.2 sparse array with large gaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0179()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8100
     * @tc.desc   7.1.1 toSpliced on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0180()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8200
     * @tc.desc   7.1.2 empty array with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0181()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8300
     * @tc.desc   7.1.3 empty array with start only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0182()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8400
     * @tc.desc   7.2.1 delete sole element from single-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0183()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8500
     * @tc.desc   7.2.2 replace sole element in single-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0184()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8600
     * @tc.desc   7.2.3 insert before sole element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0185()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8700
     * @tc.desc   7.3.1 array with mixed element types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0186()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8800
     * @tc.desc   7.3.2 insert different types into mixed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0187()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8900
     * @tc.desc   7.4.1 large array deletion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0188()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9000
     * @tc.desc   7.4.2 large array insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0189()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9100
     * @tc.desc   7.5.1 toSpliced on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0190()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9200
     * @tc.desc   7.5.2 toSpliced on sealed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0191()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9300
     * @tc.desc   8.1.1 plain object with length and integer keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0192()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9400
     * @tc.desc   8.1.2 arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0193()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9500
     * @tc.desc   8.1.3 string object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0194()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9600
     * @tc.desc   8.1.4 NodeList/HTMLCollection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0195()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9700
     * @tc.desc   8.2.1 object with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0196()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9800
     * @tc.desc   8.2.2 object with length greater than actual properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0197()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9900
     * @tc.desc   8.2.3 object with length less than actual properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0198()).assertEqual(true);
    });
    /**
     * @tc.name   testToSplicedTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9999
     * @tc.desc   8.2.4 object with negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0199()).assertEqual(true);
    });
  });
}
