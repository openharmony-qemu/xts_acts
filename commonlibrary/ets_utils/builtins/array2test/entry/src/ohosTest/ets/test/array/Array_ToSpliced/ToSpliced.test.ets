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
import { arrayToSpliced, arraysSame } from './ToSplicedNative';

export default function ArrayToSplicedMindMapTest() {
  describe('ArrayToSplicedMindMapTest', () => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   testToSplicedTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0100
     * @tc.desc   Verify array toSpliced scenario 0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 2, 1);
      expect(arraysSame(r, [1, 2, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify array toSpliced scenario 0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 0, 2);
      expect(arraysSame(r, [3, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify array toSpliced scenario 0102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 3, 2);
      expect(arraysSame(r, [1, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0400
     * @tc.desc   Verify array toSpliced scenario 0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 0, 3);
      expect(arraysSame(r, [])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0500
     * @tc.desc   Verify array toSpliced scenario 0104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 5, 6], 2, 0, 3, 4);
      expect(arraysSame(r, [1, 2, 3, 4, 5, 6])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0600
     * @tc.desc   Verify array toSpliced scenario 0105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([3, 4, 5], 0, 0, 1, 2);
      expect(arraysSame(r, [1, 2, 3, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0700
     * @tc.desc   Verify array toSpliced scenario 0106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 3, 0, 4, 5);
      expect(arraysSame(r, [1, 2, 3, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify array toSpliced scenario 0107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 3], 1, 0, 2);
      expect(arraysSame(r, [1, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify array toSpliced scenario 0108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 5], 1, 0, 2, 3, 4);
      expect(arraysSame(r, [1, 2, 3, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1000
     * @tc.desc   Verify array toSpliced scenario 0109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 1, 1, 20);
      expect(arraysSame(r, [1, 20, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1100
     * @tc.desc   Verify array toSpliced scenario 0110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 5], 1, 1, 3, 4);
      expect(arraysSame(r, [1, 3, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1200
     * @tc.desc   Verify array toSpliced scenario 0111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 1, 3, 10);
      expect(arraysSame(r, [1, 10, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1300
     * @tc.desc   Verify array toSpliced scenario 0112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 1, 2, 10, 20, 30, 40);
      expect(arraysSame(r, [1, 10, 20, 30, 40, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1400
     * @tc.desc   Verify array toSpliced scenario 0113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const r: number[] = arrayToSpliced(a, 0, 0);
      expect(arraysSame(r, [1, 2, 3])).assertEqual(true);
      expect(r !== a).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1500
     * @tc.desc   Verify array toSpliced scenario 0114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const r: number[] = arrayToSpliced(a, 3);
      expect(arraysSame(r, [1, 2, 3])).assertEqual(true);
      expect(r !== a).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1600
     * @tc.desc   Verify array toSpliced scenario 0115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4], 0, 2, 10);
      expect(arraysSame(r, [10, 3, 4])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1700
     * @tc.desc   Verify array toSpliced scenario 0116
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 2, 1, 30);
      expect(arraysSame(r, [1, 2, 30, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1800
     * @tc.desc   Verify array toSpliced scenario 0117
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 3, 0, 4, 5);
      expect(arraysSame(r, [1, 2, 3, 4, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_1900
     * @tc.desc   Verify array toSpliced scenario 0118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 10, 0, 9);
      expect(arraysSame(r, [1, 2, 3, 4, 5, 9])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2000
     * @tc.desc   Verify array toSpliced scenario 0119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], -1, 1);
      expect(arraysSame(r, [1, 2, 3, 4])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2100
     * @tc.desc   Verify array toSpliced scenario 0120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], -2, 2);
      expect(arraysSame(r, [1, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2200
     * @tc.desc   Verify array toSpliced scenario 0121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], -3, 1);
      expect(arraysSame(r, [2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2300
     * @tc.desc   Verify array toSpliced scenario 0122
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], -10, 1);
      expect(arraysSame(r, [2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2400
     * @tc.desc   Verify array toSpliced scenario 0123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const r: number[] = a.slice();
      expect(arraysSame(r, [1, 2, 3])).assertEqual(true);
      expect(r !== a).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2500
     * @tc.desc   Verify array toSpliced scenario 0124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], Number.NaN, 1);
      expect(arraysSame(r, [2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2600
     * @tc.desc   Verify array toSpliced scenario 0125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], Infinity, 0, 9);
      expect(arraysSame(r, [1, 2, 3, 9])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2700
     * @tc.desc   Verify array toSpliced scenario 0126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], -Infinity, 1, 9);
      expect(arraysSame(r, [9, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2800
     * @tc.desc   Verify array toSpliced scenario 0127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 1.7, 1, 9);
      expect(arraysSame(r, [1, 9, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_2900
     * @tc.desc   Verify array toSpliced scenario 0128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], '1' as Object as number, 1, 9);
      expect(arraysSame(r, [1, 9, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3000
     * @tc.desc   Verify array toSpliced scenario 0129. JS-only: null start ToInteger
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
     * @tc.desc   Verify array toSpliced scenario 0130. JS-only: undefined start ToInteger
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
     * @tc.desc   Verify array toSpliced scenario 0131
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: number[] = arrayToSpliced([1, 2, 3], true as Object as number, 1, 9);
      const r2: number[] = arrayToSpliced([1, 2, 3], false as Object as number, 1, 9);
      expect(arraysSame(r1, [1, 9, 3])).assertEqual(true);
      expect(arraysSame(r2, [9, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3300
     * @tc.desc   Verify array toSpliced scenario 0132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4], 1, 0, 9);
      expect(arraysSame(r, [1, 9, 2, 3, 4])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3400
     * @tc.desc   Verify array toSpliced scenario 0133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 2, 2);
      expect(arraysSame(r, [1, 2, 5])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3500
     * @tc.desc   Verify array toSpliced scenario 0134
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 2, 3);
      expect(arraysSame(r, [1, 2])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3600
     * @tc.desc   Verify array toSpliced scenario 0135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 2, 99);
      expect(arraysSame(r, [1, 2])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3700
     * @tc.desc   Verify array toSpliced scenario 0136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4, 5], 2);
      expect(arraysSame(r, [1, 2])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_3800
     * @tc.desc   Verify array toSpliced scenario 0137. JS-only: undefined deleteCount ToInteger
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
     * @tc.desc   Verify array toSpliced scenario 0138. JS-only: undefined deleteCount with insert
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
     * @tc.desc   Verify array toSpliced scenario 0139
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 0, Infinity, 9);
      expect(arraysSame(r, [9])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4100
     * @tc.desc   Verify array toSpliced scenario 0140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 1, -1, 9);
      expect(arraysSame(r, [1, 9, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4200
     * @tc.desc   Verify array toSpliced scenario 0141
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 0, Number.NaN, 9);
      expect(arraysSame(r, [9, 1, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4300
     * @tc.desc   Verify array toSpliced scenario 0142
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 0, 1.9, 9);
      expect(arraysSame(r, [9, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4400
     * @tc.desc   Verify array toSpliced scenario 0143
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 0, '1' as Object as number, 9);
      expect(arraysSame(r, [9, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4500
     * @tc.desc   Verify array toSpliced scenario 0144. JS-only: null deleteCount ToInteger
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
     * @tc.desc   Verify array toSpliced scenario 0145. JS-only: boolean deleteCount ToInteger
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
     * @tc.desc   Verify array toSpliced scenario 0146. JS-only: boolean false deleteCount ToInteger
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
     * @tc.desc   Verify array toSpliced scenario 0147
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([0], 0, 1, 42);
      expect(arraysSame(r, [42])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_4900
     * @tc.desc   Verify array toSpliced scenario 0148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: string[] = arrayToSpliced(['0'], 0, 1, 'x');
      expect(arraysSame(r, ['x'])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5000
     * @tc.desc   Verify array toSpliced scenario 0149
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Box { k: number = 1; }
      const o: Box = new Box();
      const r: Box[] = arrayToSpliced([new Box()], 0, 1, o);
      expect(r[0] === o).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5100
     * @tc.desc   Verify array toSpliced scenario 0150. JS-only: nested array insert item
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
     * @tc.desc   Verify array toSpliced scenario 0151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: (number | undefined)[] = arrayToSpliced([1, 2], 1, 0, undefined);
      expect(arraysSame(r, [1, undefined, 2])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5300
     * @tc.desc   Verify array toSpliced scenario 0152
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: (number | null)[] = arrayToSpliced([1, 2], 1, 0, null);
      expect(arraysSame(r, [1, null, 2])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5400
     * @tc.desc   Verify array toSpliced scenario 0153
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: (number | boolean)[] = arrayToSpliced<number | boolean>([1, 2], 1, 0, true);
      expect(arraysSame(r, [1, true, 2])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5500
     * @tc.desc   Verify array toSpliced scenario 0154. JS-only: Symbol insert item
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
     * @tc.desc   Verify array toSpliced scenario 0155. JS-only: bigint insert item
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
     * @tc.desc   Verify array toSpliced scenario 0156. JS-only: function reference insert item
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
     * @tc.desc   Verify array toSpliced scenario 0157
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 1, 1);
      expect(arraysSame(r, [1, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_5900
     * @tc.desc   Verify array toSpliced scenario 0158
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 3], 1, 0, 2);
      expect(arraysSame(r, [1, 2, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6000
     * @tc.desc   Verify array toSpliced scenario 0159. JS-only: spread 200 insert items
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
     * @tc.desc   Verify array toSpliced scenario 0160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Box2 { k: number = 1; }
      const d: Date = new Date(1);
      const r: Date[] = arrayToSpliced([new Date(0)], 0, 1, d);
      expect(r[0].getTime()).assertEqual(d.getTime());
    });

    /**
     * @tc.name   testToSplicedTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6200
     * @tc.desc   Verify array toSpliced scenario 0161. JS-only: RegExp insert item
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
     * @tc.desc   Verify array toSpliced scenario 0162. JS-only: Map and Set insert items
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
     * @tc.desc   Verify array toSpliced scenario 0163
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: number[] = [0, 2];
      const r: (number | number[])[] = arrayToSpliced<number | number[]>([1], 1, 0, inner);
      expect(Array.isArray(r[1])).assertEqual(true);
      expect((r[1] as number[])[1]).assertEqual(2);
    });

    /**
     * @tc.name   testToSplicedTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6500
     * @tc.desc   Verify array toSpliced scenario 0164
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const r: number[] = arrayToSpliced(a, 1, 1, 9);
      expect(r !== a).assertEqual(true);
      expect(arraysSame(r, [1, 9, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6600
     * @tc.desc   Verify array toSpliced scenario 0165
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 1, 1, 9);
      expect(arraysSame(r, [1, 9, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6700
     * @tc.desc   Verify array toSpliced scenario 0166
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3], 1, 1, 9);
      expect(Array.isArray(r)).assertEqual(true);
      expect(arraysSame(r, [1, 9, 3])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6800
     * @tc.desc   Verify array toSpliced scenario 0167
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([1, 2, 3, 4], 1, 2, 9);
      expect(arraysSame(r, [1, 9, 4])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_6900
     * @tc.desc   Verify array toSpliced scenario 0168
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3, 1, 2];
      const s: string = a.join(',');
      arrayToSpliced(a, 1, 1, 9);
      expect(a.join(',')).assertEqual(s);
    });

    /**
     * @tc.name   testToSplicedTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7000
     * @tc.desc   Verify array toSpliced scenario 0169
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const r: number[] = arrayToSpliced(a, 0, 0);
      expect(arraysSame(r, [1, 2, 3])).assertEqual(true);
      expect(r !== a).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7100
     * @tc.desc   Verify array toSpliced scenario 0170
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class O170 { x: number = 1; }
      class O170b { y: number = 2; }
      const o: O170 = new O170();
      const b: O170b = new O170b();
      const a: (O170 | O170b)[] = [o, b];
      const r: (O170 | O170b)[] = arrayToSpliced(a, 0, 0);
      expect(r[0] === o).assertEqual(true);
      expect(r[1] === b).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7200
     * @tc.desc   Verify array toSpliced scenario 0171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const r1: number[] = arrayToSpliced(a, 1, 0, 9);
      const r2: number[] = arrayToSpliced(a, 2, 0, 8);
      expect(arraysSame(r1, [1, 9, 2, 3])).assertEqual(true);
      expect(arraysSame(r2, [1, 2, 8, 3])).assertEqual(true);
      expect(a.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToSplicedTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7300
     * @tc.desc   Verify array toSpliced scenario 0172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class O172 { a: number = 1; }
      const o: O172 = new O172();
      const a: O172[] = [o];
      const r: O172[] = arrayToSpliced(a, 0, 0);
      expect(r !== a).assertEqual(true);
      expect(r[0] === o).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_7400
     * @tc.desc   Verify array toSpliced scenario 0173. JS-only: object splice insert type coercion
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
     * @tc.desc   Verify array toSpliced scenario 0174. JS-only: sparse array hole copy hasOwnProperty
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
     * @tc.desc   Verify array toSpliced scenario 0175. JS-only: sparse all indices hasOwnProperty
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
     * @tc.desc   Verify array toSpliced scenario 0176. JS-only: sparse splice delete with hole
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
     * @tc.desc   Verify array toSpliced scenario 0177. JS-only: hole insert at empty slot
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
     * @tc.desc   Verify array toSpliced scenario 0178. JS-only: new Array holes every index
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
     * @tc.desc   Verify array toSpliced scenario 0179
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: number[] = [1];
      b[10] = 2;
      const r: number[] = arrayToSpliced(b, 0, 0);
      expect(r.length).assertEqual(11);
      expect(r[5]).assertEqual(undefined);
    });

    /**
     * @tc.name   testToSplicedTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8100
     * @tc.desc   Verify array toSpliced scenario 0180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([], 0, 0, 1);
      expect(Array.isArray(r)).assertEqual(true);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.name   testToSplicedTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8200
     * @tc.desc   Verify array toSpliced scenario 0181
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([]);
      const other: number[] = [];
      expect(r.length).assertEqual(0);
      expect(r !== other).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8300
     * @tc.desc   Verify array toSpliced scenario 0182
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([], 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.name   testToSplicedTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8400
     * @tc.desc   Verify array toSpliced scenario 0183
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([42], 0, 1);
      expect(arraysSame(r, [])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8500
     * @tc.desc   Verify array toSpliced scenario 0184
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([42], 0, 1, 99);
      expect(arraysSame(r, [99])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8600
     * @tc.desc   Verify array toSpliced scenario 0185
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number[] = arrayToSpliced([42], 0, 0, 1, 2);
      expect(arraysSame(r, [1, 2, 42])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8700
     * @tc.desc   Verify array toSpliced scenario 0186
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: (number | string | boolean)[] = arrayToSpliced([1, 'a', true], 1, 1, 'b');
      expect(arraysSame(r, [1, 'b', true])).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_8800
     * @tc.desc   Verify array toSpliced scenario 0187. JS-only: mixed insert includes bigint
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
     * @tc.desc   Verify array toSpliced scenario 0188
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [];
      for (let i: number = 0; i < 500; i++) {
        a.push(i);
      }
      const r: number[] = arrayToSpliced(a, 100, 50);
      expect(r.length).assertEqual(450);
      expect(r[0]).assertEqual(0);
      expect(r[449]).assertEqual(499);
    });

    /**
     * @tc.name   testToSplicedTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_9000
     * @tc.desc   Verify array toSpliced scenario 0189. JS-only: spread 50 items into 300-length array
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
     * @tc.desc   Verify array toSpliced scenario 0190. JS-only: Object.freeze before toSpliced
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
     * @tc.desc   Verify array toSpliced scenario 0191. JS-only: Object.seal before toSpliced
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
     * @tc.desc   Verify array toSpliced scenario 0192. JS-only: arrayLike object receiver
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
     * @tc.desc   Verify array toSpliced scenario 0193. JS-only: arguments object receiver
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
     * @tc.desc   Verify array toSpliced scenario 0194. JS-only: string primitive receiver
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
     * @tc.desc   Verify array toSpliced scenario 0195. JS-only: document guard tautological branch
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
     * @tc.desc   Verify array toSpliced scenario 0196. JS-only: arrayLike length zero insert
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
     * @tc.desc   Verify array toSpliced scenario 0197. JS-only: arrayLike sparse length 5 splice
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
     * @tc.desc   Verify array toSpliced scenario 0198. JS-only: arrayLike length 2 extra indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0198()).assertEqual(true);
    });

    /**
     * @tc.name   testToSplicedTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSPLICED_SUPPLEMENT_TEST_0199
     * @tc.desc   Verify array toSpliced scenario 0199. JS-only: arrayLike negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToSplicedTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToSplicedJs.ToSplicedJs_0199()).assertEqual(true);
    });

  });
}
