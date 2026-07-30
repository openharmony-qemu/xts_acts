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
import * as ToReversedJs from './ToReversed';
import { arrayToReversed } from './ToReversedNative';

export default function ArrayToReversedMindMapTest() {
  describe('ArrayToReversedMindMapTest', () => {
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
     * @tc.name   testToReversedTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0100
     * @tc.desc   Verify array toReversed scenario 0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(a);
      expect(b.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify array toReversed scenario 0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      arrayToReversed(a);
      expect(a.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToReversedTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify array toReversed scenario 0102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(a);
      expect(b !== a).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0400
     * @tc.desc   Verify array toReversed scenario 0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [];
      const b: number[] = arrayToReversed(a);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.name   testToReversedTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0500
     * @tc.desc   Verify array toReversed scenario 0104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [42];
      const b: number[] = arrayToReversed(a);
      expect(b[0]).assertEqual(42);
    });

    /**
     * @tc.name   testToReversedTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0600
     * @tc.desc   Verify array toReversed scenario 0105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: (number | undefined)[] = [1, , 3];
      const b: (number | undefined)[] = arrayToReversed(a);
      expect(b.length).assertEqual(3);
      expect(b[0]).assertEqual(3);
      expect(b[2]).assertEqual(1);
    });

    /**
     * @tc.name   testToReversedTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0700
     * @tc.desc   Verify array toReversed scenario 0106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = new Array<number>(3);
      a[2] = 5;
      const b: number[] = arrayToReversed(a);
      expect(b.length).assertEqual(3);
      expect(b[0]).assertEqual(5);
    });

    /**
     * @tc.name   testToReversedTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify array toReversed scenario 0107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: (number | null | undefined)[] = [undefined, null, 0];
      const b: (number | null | undefined)[] = arrayToReversed(a);
      expect(b[0]).assertEqual(0);
      expect(b[1]).assertEqual(null);
    });

    /**
     * @tc.name   testToReversedTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify array toReversed scenario 0108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: string[] = ['a', 'b', 'c'];
      const b: string[] = arrayToReversed(a);
      expect(b.join('')).assertEqual('cba');
    });

    /**
     * @tc.name   testToReversedTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1000
     * @tc.desc   Verify array toReversed scenario 0109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: boolean[] = [true, false, true];
      const b: boolean[] = arrayToReversed(a);
      expect(b[0]).assertEqual(true);
      expect(b[1]).assertEqual(false);
      expect(b[2]).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1100
     * @tc.desc   Verify array toReversed scenario 0110. JS-only: object literal elements compared by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0110()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1200
     * @tc.desc   Verify array toReversed scenario 0111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[][] = [[1], [2], [3]];
      const b: number[][] = arrayToReversed(a);
      expect(b[0][0]).assertEqual(3);
      expect(b[2][0]).assertEqual(1);
    });

    /**
     * @tc.name   testToReversedTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1300
     * @tc.desc   Verify array toReversed scenario 0112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3, 4, 5];
      const b: number[] = arrayToReversed(a);
      expect(b[4]).assertEqual(1);
    });

    /**
     * @tc.name   testToReversedTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1400
     * @tc.desc   Verify array toReversed scenario 0113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [Number.NaN, 1];
      const b: number[] = arrayToReversed(a);
      expect(b[0]).assertEqual(1);
      expect(Number.isNaN(b[1])).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1500
     * @tc.desc   Verify array toReversed scenario 0114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [Infinity, -Infinity];
      const b: number[] = arrayToReversed(a);
      expect(b[0]).assertEqual(-Infinity);
      expect(b[1]).assertEqual(Infinity);
    });

    /**
     * @tc.name   testToReversedTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1600
     * @tc.desc   Verify array toReversed scenario 0115. JS-only: Object.is negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0115()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1700
     * @tc.desc   Verify array toReversed scenario 0116. JS-only: BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0116()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1800
     * @tc.desc   Verify array toReversed scenario 0117. JS-only: Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0117()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_1900
     * @tc.desc   Verify array toReversed scenario 0118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Date[] = [new Date(0), new Date(1)];
      const b: Date[] = arrayToReversed(a);
      expect(b[0].getTime()).assertEqual(1);
      expect(b[1].getTime()).assertEqual(0);
    });

    /**
     * @tc.name   testToReversedTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2000
     * @tc.desc   Verify array toReversed scenario 0119. JS-only: RegExp elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0119()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2100
     * @tc.desc   Verify array toReversed scenario 0120. JS-only: function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0120()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2200
     * @tc.desc   Verify array toReversed scenario 0121. JS-only: Object.freeze before toReversed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0121()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2300
     * @tc.desc   Verify array toReversed scenario 0122. JS-only: Object.seal before toReversed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0122()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2400
     * @tc.desc   Verify array toReversed scenario 0123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(a);
      b[0] = 9;
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.name   testToReversedTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2500
     * @tc.desc   Verify array toReversed scenario 0124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(a);
      b.push(0);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(4);
    });

    /**
     * @tc.name   testToReversedTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2600
     * @tc.desc   Verify array toReversed scenario 0125. JS-only: Object.getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0125()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2700
     * @tc.desc   Verify array toReversed scenario 0126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(a);
      expect(Array.isArray(b)).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2800
     * @tc.desc   Verify array toReversed scenario 0127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(a);
      expect(b.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_2900
     * @tc.desc   Verify array toReversed scenario 0128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const c: number[] = arrayToReversed(arrayToReversed(a));
      expect(c.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToReversedTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3000
     * @tc.desc   Verify array toReversed scenario 0129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(a);
      expect(b.length).assertEqual(a.length);
    });

    /**
     * @tc.name   testToReversedTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3100
     * @tc.desc   Verify array toReversed scenario 0130. JS-only: arrayLike object receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0130()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3200
     * @tc.desc   Verify array toReversed scenario 0131. JS-only: holey arrayLike object receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0131()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3300
     * @tc.desc   Verify array toReversed scenario 0132. JS-only: empty arrayLike receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0132()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3400
     * @tc.desc   Verify array toReversed scenario 0133. JS-only: string primitive as toReversed receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0133()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3500
     * @tc.desc   Verify array toReversed scenario 0134. JS-only: arguments object receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0134()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3600
     * @tc.desc   Verify array toReversed scenario 0135. JS-only: Uint8Array typed array receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0135()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3700
     * @tc.desc   Verify array toReversed scenario 0136. JS-only: Int16Array typed array receiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0136()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3800
     * @tc.desc   Verify array toReversed scenario 0137. JS-only: Proxy default handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0137()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_3900
     * @tc.desc   Verify array toReversed scenario 0138. JS-only: Proxy with get trap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0138()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4000
     * @tc.desc   Verify array toReversed scenario 0139. JS-only: arrayLike with property getters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0139()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4100
     * @tc.desc   Verify array toReversed scenario 0140. JS-only: arrayLike getter throws Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0140()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4200
     * @tc.desc   Verify array toReversed scenario 0141. JS-only: toReversedCompat(null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0141()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4300
     * @tc.desc   Verify array toReversed scenario 0142. JS-only: toReversedCompat(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0142()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4400
     * @tc.desc   Verify array toReversed scenario 0143. JS-only: arrayLike negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0143()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4500
     * @tc.desc   Verify array toReversed scenario 0144. JS-only: arrayLike fractional length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0144()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4600
     * @tc.desc   Verify array toReversed scenario 0145. JS-only: arrayLike MAX_SAFE_INTEGER length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0145()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4700
     * @tc.desc   Verify array toReversed scenario 0146. JS-only: arrayLike numeric string length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0146()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4800
     * @tc.desc   Verify array toReversed scenario 0147. JS-only: arrayLike invalid length string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0147()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_4900
     * @tc.desc   Verify array toReversed scenario 0148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(JSON.stringify(b)).assertEqual('[3,2,1]');
    });

    /**
     * @tc.name   testToReversedTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5000
     * @tc.desc   Verify array toReversed scenario 0149
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(arr.join(',')).assertEqual('1,2,3');
      expect(b.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5100
     * @tc.desc   Verify array toReversed scenario 0150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, , 3, 4];
      const b: (number | undefined)[] = arrayToReversed(arr);
      expect(b.length).assertEqual(4);
      expect(b[0]).assertEqual(4);
      expect(b[3]).assertEqual(1);
    });

    /**
     * @tc.name   testToReversedTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5200
     * @tc.desc   Verify array toReversed scenario 0151. JS-only: delete creates hole before toReversed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0151()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5300
     * @tc.desc   Verify array toReversed scenario 0152. JS-only: huge sparse array length 101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0152()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5400
     * @tc.desc   Verify array toReversed scenario 0153. JS-only: toReversedCompat.call(null, arr)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0153()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5500
     * @tc.desc   Verify array toReversed scenario 0154
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5600
     * @tc.desc   Verify array toReversed scenario 0155
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.constructor === Array).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5700
     * @tc.desc   Verify array toReversed scenario 0156. JS-only: Object.prototype.toString.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0156()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5800
     * @tc.desc   Verify array toReversed scenario 0157
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   testToReversedTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_5900
     * @tc.desc   Verify array toReversed scenario 0158
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.includes(1)).assertEqual(true);
      expect(b.includes(3)).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6000
     * @tc.desc   Verify array toReversed scenario 0159
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b[0]).assertEqual(3);
      expect(b[b.length - 1]).assertEqual(1);
    });

    /**
     * @tc.name   testToReversedTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6100
     * @tc.desc   Verify array toReversed scenario 0160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.pop()).assertEqual(1);
    });

    /**
     * @tc.name   testToReversedTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6200
     * @tc.desc   Verify array toReversed scenario 0161
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.shift()).assertEqual(3);
    });

    /**
     * @tc.name   testToReversedTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6300
     * @tc.desc   Verify array toReversed scenario 0162
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.join('-')).assertEqual('3-2-1');
    });

    /**
     * @tc.name   testToReversedTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6400
     * @tc.desc   Verify array toReversed scenario 0163
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.reduce((s: number, v: number): number => s + v, 0)).assertEqual(6);
    });

    /**
     * @tc.name   testToReversedTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6500
     * @tc.desc   Verify array toReversed scenario 0164
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.every((v: number): boolean => typeof v === 'number')).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6600
     * @tc.desc   Verify array toReversed scenario 0165
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.some((v: number): boolean => v === 2)).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6700
     * @tc.desc   Verify array toReversed scenario 0166
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.find((v: number): boolean => v > 2)).assertEqual(3);
    });

    /**
     * @tc.name   testToReversedTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6800
     * @tc.desc   Verify array toReversed scenario 0167
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.findIndex((v: number): boolean => v === 1)).assertEqual(2);
    });

    /**
     * @tc.name   testToReversedTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_6900
     * @tc.desc   Verify array toReversed scenario 0168
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.map((v: number): number => v * 2).join(',')).assertEqual('6,4,2');
    });

    /**
     * @tc.name   testToReversedTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7000
     * @tc.desc   Verify array toReversed scenario 0169
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.filter((v: number): boolean => v > 1).join(',')).assertEqual('3,2');
    });

    /**
     * @tc.name   testToReversedTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7100
     * @tc.desc   Verify array toReversed scenario 0170
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.slice(0, 2).join(',')).assertEqual('3,2');
    });

    /**
     * @tc.name   testToReversedTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7200
     * @tc.desc   Verify array toReversed scenario 0171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      const c: number[] = b.concat([0]);
      expect(c.join(',')).assertEqual('3,2,1,0');
    });

    /**
     * @tc.name   testToReversedTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7300
     * @tc.desc   Verify array toReversed scenario 0172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.reverse().join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToReversedTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7400
     * @tc.desc   Verify array toReversed scenario 0173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      b.sort();
      expect(b.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testToReversedTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7500
     * @tc.desc   Verify array toReversed scenario 0174
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['10', '2', '1'];
      const b: string[] = arrayToReversed(arr);
      b.sort();
      expect(b.join(',')).assertEqual('1,10,2');
    });

    /**
     * @tc.name   testToReversedTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7600
     * @tc.desc   Verify array toReversed scenario 0175
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      b.splice(1, 1);
      expect(b.join(',')).assertEqual('3,1');
    });

    /**
     * @tc.name   testToReversedTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7700
     * @tc.desc   Verify array toReversed scenario 0176
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      b.fill(9, 1, 2);
      expect(b.join(',')).assertEqual('3,9,1');
    });

    /**
     * @tc.name   testToReversedTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7800
     * @tc.desc   Verify array toReversed scenario 0177
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      b.copyWithin(1, 0, 1);
      expect(b.join(',')).assertEqual('3,3,1');
    });

    /**
     * @tc.name   testToReversedTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_7900
     * @tc.desc   Verify array toReversed scenario 0178
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const b: number[] = arrayToReversed(arr);
      expect(b.flatMap((x: number): number[] => [x]).join(',')).assertEqual('4,3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8000
     * @tc.desc   Verify array toReversed scenario 0179
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1], [2], [3]];
      const b: number[][] = arrayToReversed(arr);
      expect(b.flat().join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8100
     * @tc.desc   Verify array toReversed scenario 0180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.keys().next().value).assertEqual(0);
    });

    /**
     * @tc.name   testToReversedTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8200
     * @tc.desc   Verify array toReversed scenario 0181
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.values().next().value).assertEqual(3);
    });

    /**
     * @tc.name   testToReversedTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8300
     * @tc.desc   Verify array toReversed scenario 0182
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.entries().next().value[1]).assertEqual(3);
    });

    /**
     * @tc.name   testToReversedTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8400
     * @tc.desc   Verify array toReversed scenario 0183
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      const spread: number[] = [...b];
      expect(spread.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8500
     * @tc.desc   Verify array toReversed scenario 0184. JS-only: Reflect.ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0184()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8600
     * @tc.desc   Verify array toReversed scenario 0185
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(Object.keys(b).join(',')).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testToReversedTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8700
     * @tc.desc   Verify array toReversed scenario 0186. JS-only: Object.getOwnPropertyDescriptor on reversed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0186()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8800
     * @tc.desc   Verify array toReversed scenario 0187
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(Object.getOwnPropertyNames(b).includes('length')).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_8900
     * @tc.desc   Verify array toReversed scenario 0188
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b[0]).assertEqual(3);
      expect(b[1]).assertEqual(2);
      expect(b[2]).assertEqual(1);
    });

    /**
     * @tc.name   testToReversedTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9000
     * @tc.desc   Verify array toReversed scenario 0189
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.lastIndexOf(3)).assertEqual(0);
      expect(b.lastIndexOf(1)).assertEqual(2);
    });

    /**
     * @tc.name   testToReversedTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9100
     * @tc.desc   Verify array toReversed scenario 0190
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b.toLocaleString().length > 0).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9200
     * @tc.desc   Verify array toReversed scenario 0191
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(JSON.stringify(b)).assertEqual('[3,2,1]');
    });

    /**
     * @tc.name   testToReversedTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9300
     * @tc.desc   Verify array toReversed scenario 0192. JS-only: in operator and Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0192()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9400
     * @tc.desc   Verify array toReversed scenario 0193
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(typeof b[Symbol.iterator]).assertEqual('function');
    });

    /**
     * @tc.name   testToReversedTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9500
     * @tc.desc   Verify array toReversed scenario 0194
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      const x: number[] = [];
      b.forEach((v: number): void => { x.push(v); });
      expect(x.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9600
     * @tc.desc   Verify array toReversed scenario 0195
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(String(b)).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9700
     * @tc.desc   Verify array toReversed scenario 0196
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(`${b}`).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9800
     * @tc.desc   Verify array toReversed scenario 0197
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const b: number[] = arrayToReversed(arr);
      expect(b[0]).assertEqual(3);
      expect(b[2]).assertEqual(1);
      expect(b.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testToReversedTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_9900
     * @tc.desc   Verify array toReversed scenario 0198. JS-only: Symbol.unscopables reference compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0198()).assertEqual(true);
    });

    /**
     * @tc.name   testToReversedTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOREVERSED_SUPPLEMENT_TEST_0199
     * @tc.desc   Verify array toReversed scenario 0199. JS-only: optional Array.prototype.with on reversed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToReversedTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToReversedJs.ToReversedJs_0199()).assertEqual(true);
    });

  });
}
