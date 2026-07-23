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
import * as ToStringJs from './ToString';
import { arrayToString } from './ToStringNative';

export default function ArrayToStringMindMapTest() {
  describe('ArrayToStringMindMapTest', () => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      ToStringJs.restoreArrayPrototypeJoinSnapshot();
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   testToStringTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0100
     * @tc.desc   Verify array toString scenario 0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([1, 2, 3])).assertEqual('1,2,3');
      expect(arrayToString(['a', 'b', 'c'])).assertEqual('a,b,c');
      expect(arrayToString([10, 20, 30])).assertEqual('10,20,30');
    });

    /**
     * @tc.name   testToStringTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify array toString scenario 0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([1, 2, 'a', '1a'])).assertEqual('1,2,a,1a');
      expect(arrayToString([1, 'hello', true, null, undefined])).assertEqual('1,hello,true,,');
    });

    /**
     * @tc.name   testToStringTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify array toString scenario 0102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([1, 2, 3])).assertEqual('1,2,3');
      expect(arrayToString([1, 2])).assertEqual('1,2');
    });

    /**
     * @tc.name   testToStringTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0400
     * @tc.desc   Verify array toString scenario 0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([])).assertEqual('');
      expect(arrayToString(new Array<number>())).assertEqual('');
    });

    /**
     * @tc.name   testToStringTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0500
     * @tc.desc   Verify array toString scenario 0104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([42])).assertEqual('42');
      expect(arrayToString(['hello'])).assertEqual('hello');
      expect(arrayToString([''])).assertEqual('');
    });

    /**
     * @tc.name   testToStringTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0600
     * @tc.desc   Verify array toString scenario 0105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: number = 0; i < 1000; i++) {
        arr.push(i);
      }
      expect(arrayToString(arr).split(',').length).assertEqual(1000);
      const arr2: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        arr2.push('x');
      }
      let commaCount: number = 0;
      const bigStr: string = arrayToString(arr2);
      for (let i: number = 0; i < bigStr.length; i++) {
        if (bigStr.charAt(i) === ',') {
          commaCount++;
        }
      }
      expect(commaCount).assertEqual(99);
    });

    /**
     * @tc.name   testToStringTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0700
     * @tc.desc   Verify array toString scenario 0106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([1, 2, 3])).assertEqual('1,2,3');
      expect(arrayToString([1.1, 2.5, 3.14])).assertEqual('1.1,2.5,3.14');
      expect(arrayToString([-1, -2, -3])).assertEqual('-1,-2,-3');
      expect(arrayToString([0, -0])).assertEqual('0,0');
      expect(arrayToString([Infinity, -Infinity, Number.NaN])).assertEqual('Infinity,-Infinity,NaN');
      expect(arrayToString([100, 1500])).assertEqual('100,1500');
    });

    /**
     * @tc.name   testToStringTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify array toString scenario 0107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString(['hello', 'world'])).assertEqual('hello,world');
      expect(arrayToString(['a', '', 'b'])).assertEqual('a,,b');
      expect(arrayToString(['a,b', 'c,d'])).assertEqual('a,b,c,d');
      expect(arrayToString(['\n', '\t', '\\'])).assertEqual('\n,\t,\\');
    });

    /**
     * @tc.name   testToStringTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify array toString scenario 0108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([true, false])).assertEqual('true,false');
    });

    /**
     * @tc.name   testToStringTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1000
     * @tc.desc   Verify array toString scenario 0109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([null])).assertEqual('');
      expect(arrayToString([undefined])).assertEqual('');
      expect(arrayToString([1, null, 2, undefined, 3])).assertEqual('1,,2,,3');
      expect(arrayToString([null, undefined, null])).assertEqual(',,');
    });

    /**
     * @tc.name   testToStringTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1100
     * @tc.desc   Verify array toString scenario 0110. JS-only: object Date RegExp custom toString elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0110()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1200
     * @tc.desc   Verify array toString scenario 0111. JS-only: Symbol element TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0111()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1300
     * @tc.desc   Verify array toString scenario 0112. JS-only: bigint elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0112()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1400
     * @tc.desc   Verify array toString scenario 0113. JS-only: function elements toString vs join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0113()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1500
     * @tc.desc   Verify array toString scenario 0114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([[1, 2, 3], [4, 5, 6], [7, 8, 9]])).assertEqual('1,2,3,4,5,6,7,8,9');
      expect(arrayToString([[1], [2, 3], [4, 5, 6]])).assertEqual('1,2,3,4,5,6');
      expect(arrayToString([[1, 2], [], [3, 4]])).assertEqual('1,2,,3,4');
    });

    /**
     * @tc.name   testToStringTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1600
     * @tc.desc   Verify array toString scenario 0115. JS-only: deep nested array self-reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0115()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1700
     * @tc.desc   Verify array toString scenario 0116. JS-only: mixed nested arrays with object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0116()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1800
     * @tc.desc   Verify array toString scenario 0117. JS-only: sparse hole comma semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0117()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1900
     * @tc.desc   Verify array toString scenario 0118. JS-only: leading trailing holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0118()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2000
     * @tc.desc   Verify array toString scenario 0119. JS-only: delete index sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0119()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2100
     * @tc.desc   Verify array toString scenario 0120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = new Array<number>(3);
      expect(arrayToString(arr)).assertEqual(',,');
    });

    /**
     * @tc.name   testToStringTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2200
     * @tc.desc   Verify array toString scenario 0121. JS-only: cyclic reference self-push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0121()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2300
     * @tc.desc   Verify array toString scenario 0122. JS-only: cyclic reference mutual-push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0122()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2400
     * @tc.desc   Verify array toString scenario 0123. JS-only: cyclic reference nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0123()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2500
     * @tc.desc   Verify array toString scenario 0124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arrayToString(arr)).assertEqual(arr.join(','));
      expect(arrayToString(['a', 'b', 'c'])).assertEqual('a,b,c');
    });

    /**
     * @tc.name   testToStringTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2600
     * @tc.desc   Verify array toString scenario 0125. JS-only: instance join non-callable yields object Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0125()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2700
     * @tc.desc   Verify array toString scenario 0126. JS-only: delete Array.prototype.join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0126()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2800
     * @tc.desc   Verify array toString scenario 0127. JS-only: Array.prototype.toString.call custom join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0127()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2900
     * @tc.desc   Verify array toString scenario 0128. JS-only: instance join throws on toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0128()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3000
     * @tc.desc   Verify array toString scenario 0129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('prefix' + arrayToString([1, 2, 3])).assertEqual('prefix1,2,3');
      expect(arrayToString([1, 2]) + 'suffix').assertEqual('1,2suffix');
      expect(arrayToString([1, 2]) + arrayToString([3, 4])).assertEqual('1,23,4');
    });

    /**
     * @tc.name   testToStringTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3100
     * @tc.desc   Verify array toString scenario 0130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const arr2: string[] = ['a', 'b'];
      expect(`${arr}`).assertEqual('1,2,3');
      expect(`result: ${arr2}!`).assertEqual('result: a,b!');
    });

    /**
     * @tc.name   testToStringTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3200
     * @tc.desc   Verify array toString scenario 0131
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x', 'y'];
      expect(String([1, 2, 3])).assertEqual('1,2,3');
      expect(String([])).assertEqual('');
      expect(String(arr)).assertEqual(arrayToString(arr));
    });

    /**
     * @tc.name   testToStringTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3300
     * @tc.desc   Verify array toString scenario 0132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([]) + arrayToString([])).assertEqual('');
      expect(arrayToString([1]) + '2').assertEqual('12');
      expect('1' + arrayToString([2, 3])).assertEqual('12,3');
    });

    /**
     * @tc.name   testToStringTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3400
     * @tc.desc   Verify array toString scenario 0133. JS-only: call binding plain object join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0133()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3500
     * @tc.desc   Verify array toString scenario 0134. JS-only: call binding invalid join property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0134()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3600
     * @tc.desc   Verify array toString scenario 0135. JS-only: call binding null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0135()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3700
     * @tc.desc   Verify array toString scenario 0136. JS-only: call binding primitive receivers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0136()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3800
     * @tc.desc   Verify array toString scenario 0137. JS-only: apply bind Reflect on join object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0137()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3900
     * @tc.desc   Verify array toString scenario 0138
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string | boolean)[] = [1, 'a', true];
      expect(arrayToString(arr)).assertEqual(arr.join(','));
      expect(arrayToString([1, 2, 3])).assertEqual([1, 2, 3].join(','));
      expect([1, 2, 3].join('-')).assertEqual('1-2-3');
      expect(arrayToString([1, 2, 3])).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToStringTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4000
     * @tc.desc   Verify array toString scenario 0139. JS-only: toLocaleString comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0139()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4100
     * @tc.desc   Verify array toString scenario 0140. JS-only: valueOf override on array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0140()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4200
     * @tc.desc   Verify array toString scenario 0141. JS-only: JSON.stringify comparison with functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0141()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4300
     * @tc.desc   Verify array toString scenario 0142. JS-only: defineProperty hijack prototype join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0142()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4400
     * @tc.desc   Verify array toString scenario 0143. JS-only: Function constructor Array subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0143()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4500
     * @tc.desc   Verify array toString scenario 0144. JS-only: arguments and arrayLike join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0144()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4600
     * @tc.desc   Verify array toString scenario 0145. JS-only: Proxy join interception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0145()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4700
     * @tc.desc   Verify array toString scenario 0146. JS-only: Object.freeze array toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0146()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4800
     * @tc.desc   Verify array toString scenario 0147. JS-only: Object.create Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0147()).assertEqual(true);
    });

    /**
     * @tc.name   testToStringTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4900
     * @tc.desc   Verify array toString scenario 0148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arrayToString([1, 2, 3])).assertEqual('1,2,3');
      expect(arrayToString(['a', 'b', 'c']).split(',').length).assertEqual(3);
    });

    /**
     * @tc.name   testToStringTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5000
     * @tc.desc   Verify array toString scenario 0149
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const snap: string = arrayToString(arr);
      let str: string = snap;
      str = 'modified';
      expect(arrayToString(arr)).assertEqual('1,2,3');
      expect(arrayToString([1, 2])).assertEqual('1,2');
    });

    /**
     * @tc.name   testToStringTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5100
     * @tc.desc   Verify array toString scenario 0150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arrayToString(arr);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      const arr2: number[] = [1, 2];
      arrayToString(arr2);
      arr2.push(3);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.name   testToStringTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5200
     * @tc.desc   Verify array toString scenario 0151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = arrayToString([1, 2, 3]);
      expect(result).assertEqual('1,2,3');
      expect(arrayToString([])).assertEqual('');
      const parts: string[] = arrayToString([1, 2, 3]).split(',');
      expect(parts.join(',')).assertEqual('1,2,3');
    });

  });
}
