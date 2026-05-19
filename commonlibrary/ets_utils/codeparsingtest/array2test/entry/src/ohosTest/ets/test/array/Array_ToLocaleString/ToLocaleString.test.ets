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
import * as ToLocaleStringJs from './ToLocaleString';

export default function ArrayToLocaleStringMindMapTest() {
  describe('ArrayToLocaleStringMindMapTest', () => {
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
     * @tc.name   testToLocaleStringTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0100
     * @tc.desc   Empty array toLocaleString returns empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      expect(arr.toLocaleString()).assertEqual('');
    });

    /**
     * @tc.name   testToLocaleStringTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify array toLocaleString scenario 0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      expect(arr.toLocaleString()).assertEqual('42');
    });

    /**
     * @tc.name   testToLocaleStringTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify array toLocaleString scenario 0102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['hello'];
      expect(arr.toLocaleString()).assertEqual('hello');
    });

    /**
     * @tc.name   testToLocaleStringTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0400
     * @tc.desc   Verify array toLocaleString scenario 0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      expect(arr.toLocaleString()).assertEqual('true,false');
    });

    /**
     * @tc.name   testToLocaleStringTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0500
     * @tc.desc   Verify array toLocaleString scenario 0104. JS-only: untyped object literal element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0104()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0600
     * @tc.desc   Numeric array joins with commas
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.toLocaleString()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToLocaleStringTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0700
     * @tc.desc   Mixed types including null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string | boolean | null | undefined)[] = [1, 'a', true, null, undefined];
      expect(arr.toLocaleString()).assertEqual('1,a,true,,');
    });

    /**
     * @tc.name   testToLocaleStringTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify array toLocaleString scenario 0107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.toLocaleString().indexOf(',')).assertEqual(1);
    });

    /**
     * @tc.name   testToLocaleStringTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify array toLocaleString scenario 0108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1000
     * @tc.desc   Verify array toLocaleString scenario 0109. JS-only: Array.toLocaleString locale argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0109()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1100
     * @tc.desc   Verify array toLocaleString scenario 0110. JS-only: Array.toLocaleString locale array argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0110()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1200
     * @tc.desc   Verify array toLocaleString scenario 0111. JS-only: Array.toLocaleString en-US locale argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0111()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1300
     * @tc.desc   Verify array toLocaleString scenario 0112. JS-only: Array.toLocaleString empty locale argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0112()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1400
     * @tc.desc   Verify array toLocaleString scenario 0113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1500
     * @tc.desc   Verify array toLocaleString scenario 0114. JS-only: Array.toLocaleString en-US locale argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0114()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1600
     * @tc.desc   Verify array toLocaleString scenario 0115. JS-only: Array.toLocaleString with Intl options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0115()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1700
     * @tc.desc   Verify array toLocaleString scenario 0116. JS-only: custom element toLocaleString with locale and options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0116()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1800
     * @tc.desc   NaN element appears in result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Number.NaN, 1];
      expect(arr.toLocaleString()).assertEqual('NaN,1');
    });

    /**
     * @tc.name   testToLocaleStringTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_1900
     * @tc.desc   Verify array toLocaleString scenario 0118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Infinity, -Infinity];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2000
     * @tc.desc   Verify array toLocaleString scenario 0119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, -0];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2100
     * @tc.desc   Verify array toLocaleString scenario 0120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2200
     * @tc.desc   Verify array toLocaleString scenario 0121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', '', 'b'];
      expect(arr.toLocaleString()).assertEqual('a,,b');
    });

    /**
     * @tc.name   testToLocaleStringTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2300
     * @tc.desc   Verify array toLocaleString scenario 0122
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['你好', 'こんにちは', 'hello'];
      expect(arr.toLocaleString().length > 0).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2400
     * @tc.desc   Verify array toLocaleString scenario 0123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a\nb', 'c\td'];
      expect(arr.toLocaleString().length > 0).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2500
     * @tc.desc   Verify array toLocaleString scenario 0124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Date[] = [new Date(0)];
      expect(arr.toLocaleString().length > 0).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2600
     * @tc.desc   Verify array toLocaleString scenario 0125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Date[] = [new Date('invalid')];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2700
     * @tc.desc   Verify array toLocaleString scenario 0126. JS-only: Date array toLocaleString with timeZone option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0126()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2800
     * @tc.desc   Verify array toLocaleString scenario 0127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_2900
     * @tc.desc   Verify array toLocaleString scenario 0128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [false];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3000
     * @tc.desc   Verify array toLocaleString scenario 0129. JS-only: untyped object literal elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0129()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3100
     * @tc.desc   Verify array toLocaleString scenario 0130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class CustomLocale {
        toLocaleString(): string { return 'custom'; }
      }
      const arr: CustomLocale[] = [new CustomLocale()];
      expect(arr.toLocaleString()).assertEqual('custom');
    });

    /**
     * @tc.name   testToLocaleStringTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3200
     * @tc.desc   undefined element becomes empty slot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      expect(arr.toLocaleString()).assertEqual('1,,3');
    });

    /**
     * @tc.name   testToLocaleStringTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3300
     * @tc.desc   null element becomes empty slot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | null)[] = [1, null, 3];
      expect(arr.toLocaleString()).assertEqual('1,,3');
    });

    /**
     * @tc.name   testToLocaleStringTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3400
     * @tc.desc   Verify array toLocaleString scenario 0133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (null | undefined)[] = [undefined, null, undefined];
      expect(arr.toLocaleString()).assertEqual(',,');
    });

    /**
     * @tc.name   testToLocaleStringTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3500
     * @tc.desc   Nested arrays flatten one level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      expect(arr.toLocaleString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.name   testToLocaleStringTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3600
     * @tc.desc   Verify array toLocaleString scenario 0135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][][] = [[[1]], [[2]]];
      expect(arr.toLocaleString()).assertEqual('1,2');
    });

    /**
     * @tc.name   testToLocaleStringTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3700
     * @tc.desc   Verify array toLocaleString scenario 0136. JS-only: function element in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0136()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3800
     * @tc.desc   Verify array toLocaleString scenario 0137
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array<number>(3);
      arr[2] = 3;
      expect(arr.toLocaleString()).assertEqual(',,3');
    });

    /**
     * @tc.name   testToLocaleStringTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_3900
     * @tc.desc   Verify array toLocaleString scenario 0138
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.length = 5;
      expect(arr.toLocaleString()).assertEqual('1,2,,,');
    });

    /**
     * @tc.name   testToLocaleStringTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4000
     * @tc.desc   Verify array toLocaleString scenario 0139. JS-only: sparse array hole literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0139()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4100
     * @tc.desc   Verify array toLocaleString scenario 0140. JS-only: delete operator creates array hole
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0140()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4200
     * @tc.desc   Verify array toLocaleString scenario 0141
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array<number>(5);
      expect(arr.toLocaleString()).assertEqual(',,,,');
    });

    /**
     * @tc.name   testToLocaleStringTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4300
     * @tc.desc   Verify array toLocaleString scenario 0142. JS-only: sparse array multiple holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0142()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4400
     * @tc.desc   Verify array toLocaleString scenario 0143. JS-only: locale en-US on numeric array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0143()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4500
     * @tc.desc   Verify array toLocaleString scenario 0144. JS-only: locale de-DE on numeric array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0144()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4600
     * @tc.desc   Verify array toLocaleString scenario 0145. JS-only: locale fr-FR on numeric array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0145()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4700
     * @tc.desc   Verify array toLocaleString scenario 0146. JS-only: locale ja-JP on numeric array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0146()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4800
     * @tc.desc   Verify array toLocaleString scenario 0147. JS-only: locale fallback array xx-XX en-US
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0147()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_4900
     * @tc.desc   Verify array toLocaleString scenario 0148. JS-only: currency Intl option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0148()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5000
     * @tc.desc   Verify array toLocaleString scenario 0149. JS-only: percent Intl option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0149()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5100
     * @tc.desc   Verify array toLocaleString scenario 0150. JS-only: unit Intl option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0150()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5200
     * @tc.desc   Verify array toLocaleString scenario 0151. JS-only: maximumFractionDigits option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0151()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5300
     * @tc.desc   Verify array toLocaleString scenario 0152. JS-only: minimumIntegerDigits option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0152()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5400
     * @tc.desc   Verify array toLocaleString scenario 0153. JS-only: significant digits options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0153()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5500
     * @tc.desc   Verify array toLocaleString scenario 0154. JS-only: scientific notation option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0154()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5600
     * @tc.desc   Verify array toLocaleString scenario 0155. JS-only: engineering notation option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0155()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5700
     * @tc.desc   Verify array toLocaleString scenario 0156. JS-only: compact notation option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0156()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5800
     * @tc.desc   Verify array toLocaleString scenario 0157. JS-only: useGrouping false option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0157()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_5900
     * @tc.desc   Verify array toLocaleString scenario 0158. JS-only: dateStyle full option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0158()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6000
     * @tc.desc   Verify array toLocaleString scenario 0159. JS-only: timeStyle long option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0159()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6100
     * @tc.desc   Verify array toLocaleString scenario 0160. JS-only: Date timeZone UTC option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0160()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6200
     * @tc.desc   Verify array toLocaleString scenario 0161. JS-only: Date year month day options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0161()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6300
     * @tc.desc   toLocaleString equals toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.toLocaleString()).assertEqual(arr.toString());
    });

    /**
     * @tc.name   testToLocaleStringTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6400
     * @tc.desc   toLocaleString equals join with comma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.toLocaleString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.name   testToLocaleStringTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6500
     * @tc.desc   Verify array toLocaleString scenario 0164
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const backup: string = arr.slice().join(',');
      arr.toLocaleString();
      expect(arr.join(',')).assertEqual(backup);
    });

    /**
     * @tc.name   testToLocaleStringTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6600
     * @tc.desc   toLocaleString does not mutate array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.toLocaleString();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   testToLocaleStringTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6700
     * @tc.desc   Verify array toLocaleString scenario 0166
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      expect(arr.toLocaleString().includes(',')).assertEqual(false);
    });

    /**
     * @tc.name   testToLocaleStringTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6800
     * @tc.desc   Verify array toLocaleString scenario 0167. JS-only: Array.prototype.toLocaleString.call on arrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0167()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_6900
     * @tc.desc   Verify array toLocaleString scenario 0168. JS-only: Object.create(null) element TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0168()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7000
     * @tc.desc   Verify array toLocaleString scenario 0169
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class ObjA { a: number = 1; }
      class ObjB { b: number = 2; }
      class ObjC { c: number = 3; }
      const arr: (ObjA | ObjB | ObjC)[] = [new ObjA(), new ObjB(), new ObjC()];
      expect(arr.toLocaleString().split(',').length).assertEqual(3);
    });

    /**
     * @tc.name   testToLocaleStringTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7100
     * @tc.desc   Verify array toLocaleString scenario 0170. JS-only: circular array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0170()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7200
     * @tc.desc   Verify array toLocaleString scenario 0171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: number = 0; i < 50; i++) {
        arr.push(i);
      }
      expect(arr.toLocaleString().split(',').length).assertEqual(50);
    });

    /**
     * @tc.name   testToLocaleStringTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7300
     * @tc.desc   Verify array toLocaleString scenario 0172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (Date | number | string)[] = [new Date(0), 123, 'abc'];
      expect(arr.toLocaleString().length > 0).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7400
     * @tc.desc   toLocaleString yields 1,2,3 for numeric array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const s: string = arr.toLocaleString();
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToLocaleStringTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7500
     * @tc.desc   toLocaleString returns non-empty string for numeric array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const s: string = arr.toLocaleString();
      expect(typeof s).assertEqual('string');
      expect(s.length > 0).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7600
     * @tc.desc   Custom element toLocaleString returning number coerces to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class NumLocale {
        toLocaleString(): number { return 123; }
      }
      const arr: NumLocale[] = [new NumLocale()];
      expect(arr.toLocaleString()).assertEqual('123');
    });

    /**
     * @tc.name   testToLocaleStringTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7700
     * @tc.desc   MAX_SAFE_INTEGER and MIN_SAFE_INTEGER format as string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER];
      const s: string = arr.toLocaleString();
      expect(typeof s).assertEqual('string');
      expect(s.length > 0).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7800
     * @tc.desc   Zero formats as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0];
      expect(arr.toLocaleString()).assertEqual('0');
    });

    /**
     * @tc.name   testToLocaleStringTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_7900
     * @tc.desc   Empty string element alone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [''];
      expect(arr.toLocaleString()).assertEqual('');
    });

    /**
     * @tc.name   testToLocaleStringTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8000
     * @tc.desc   Three strings x,y,z join with commas
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x', 'y', 'z'];
      expect(arr.toLocaleString()).assertEqual('x,y,z');
    });

    /**
     * @tc.name   testToLocaleStringTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8100
     * @tc.desc   Verify array toLocaleString scenario 0180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, 2, 3];
      arr[1] = undefined;
      expect(arr.toLocaleString()).assertEqual('1,,3');
    });

    /**
     * @tc.name   testToLocaleStringTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8200
     * @tc.desc   Verify array toLocaleString scenario 0181
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | null)[] = [1, 2, 3];
      arr[1] = null;
      expect(arr.toLocaleString()).assertEqual('1,,3');
    });

    /**
     * @tc.name   testToLocaleStringTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8300
     * @tc.desc   Verify array toLocaleString scenario 0182
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1.1, 2.2, 3.3];
      expect(arr.toLocaleString().length > 0).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8400
     * @tc.desc   Verify array toLocaleString scenario 0183
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [-1, -2, -3];
      expect(arr.toLocaleString().indexOf('-') >= 0).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8500
     * @tc.desc   Verify array toLocaleString scenario 0184
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 1, 2, 3, 4, 5];
      expect(arr.toLocaleString().split(',').length).assertEqual(6);
    });

    /**
     * @tc.name   testToLocaleStringTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8600
     * @tc.desc   Verify array toLocaleString scenario 0185
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const s1: string = arr.toLocaleString();
      const s2: string = arr.toLocaleString();
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.name   testToLocaleStringTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8700
     * @tc.desc   Verify array toLocaleString scenario 0186
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Date[] = [new Date(), new Date()];
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.name   testToLocaleStringTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8800
     * @tc.desc   Verify array toLocaleString scenario 0187
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class LocA { toLocaleString(): string { return 'A'; } }
      class LocB { toLocaleString(): string { return 'B'; } }
      const arr: (LocA | LocB)[] = [new LocA(), new LocB()];
      expect(arr.toLocaleString()).assertEqual('A,B');
    });

    /**
     * @tc.name   testToLocaleStringTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_8900
     * @tc.desc   Verify array toLocaleString scenario 0188. JS-only: Object.freeze
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0188()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9000
     * @tc.desc   Verify array toLocaleString scenario 0189. JS-only: Object.seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0189()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9100
     * @tc.desc   Verify array toLocaleString scenario 0190. JS-only: Proxy default handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0190()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9200
     * @tc.desc   Verify array toLocaleString scenario 0191. JS-only: Object.getOwnPropertyDescriptor on Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0191()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9300
     * @tc.desc   Verify array toLocaleString scenario 0192. JS-only: Array.prototype.toLocaleString.call(null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0192()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9400
     * @tc.desc   Verify array toLocaleString scenario 0193. JS-only: Array.prototype.toLocaleString.call(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0193()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9500
     * @tc.desc   Verify array toLocaleString scenario 0194. JS-only: Array.prototype.toLocaleString.call arrayLike with getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0194()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9600
     * @tc.desc   Verify array toLocaleString scenario 0195. JS-only: Array.prototype.toLocaleString.call object with throwing getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0195()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9700
     * @tc.desc   Verify array toLocaleString scenario 0196. JS-only: nested array deep flatten stringification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0196()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9800
     * @tc.desc   Very long string element preserves length 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'a'.repeat(2000);
      const arr: string[] = [longStr];
      expect(arr.toLocaleString().length).assertEqual(2000);
    });

    /**
     * @tc.name   testToLocaleStringTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_9900
     * @tc.desc   Verify array toLocaleString scenario 0198. JS-only: Array.toLocaleString with en-US on Math constants
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0198()).assertEqual(true);
    });

    /**
     * @tc.name   testToLocaleStringTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOLOCALESTRING_SUPPLEMENT_TEST_0199
     * @tc.desc   Verify array toLocaleString scenario 0199. JS-only: Array.prototype toLocaleString descriptor probe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToLocaleStringTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToLocaleStringJs.ToLocaleStringJs_0199()).assertEqual(true);
    });

  });
}
