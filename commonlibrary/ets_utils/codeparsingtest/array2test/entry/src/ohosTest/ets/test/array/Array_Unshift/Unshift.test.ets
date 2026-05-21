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
import * as UnshiftJs from './Unshift';

export default function ArrayUnshiftMindMapTest() {
  describe('ArrayUnshiftMindMapTest', () => {
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
     * @tc.name   testUnshiftTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0100
     * @tc.desc   Verify array unshift scenario 0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 3];
      const r: number = arr.unshift(1);
      expect(r).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify array unshift scenario 0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [2];
      const r: number = arr.unshift('a');
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name   testUnshiftTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify array unshift scenario 0102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | boolean)[] = [0];
      const r: number = arr.unshift(true);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.name   testUnshiftTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0400
     * @tc.desc   Verify array unshift scenario 0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Box103 { x: number = 1; }
      const o: Box103 = new Box103();
      const arr: (Box103 | number)[] = [2];
      const r: number = arr.unshift(o);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(o);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name   testUnshiftTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0500
     * @tc.desc   Verify array unshift scenario 0104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3];
      const r: number = arr.unshift(1, 2);
      expect(r).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0600
     * @tc.desc   Verify array unshift scenario 0105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string | null)[] = [3];
      const r: number = arr.unshift(1, 'x', null);
      expect(r).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('x');
      expect(arr[2]).assertEqual(null);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0700
     * @tc.desc   Verify array unshift scenario 0106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class O106a { a: number = 1; }
      class O106b { b: number = 2; }
      const o1: O106a = new O106a();
      const o2: O106b = new O106b();
      const arr: (O106a | O106b | number)[] = [3];
      const r: number = arr.unshift(o1, o2);
      expect(r).assertEqual(3);
      expect(arr[0]).assertEqual(o1);
      expect(arr[1]).assertEqual(o2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify array unshift scenario 0107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [4];
      arr.unshift(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   testUnshiftTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify array unshift scenario 0108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 4];
      arr.unshift(1, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   testUnshiftTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1000
     * @tc.desc   Verify array unshift scenario 0109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3];
      const r: number = arr.unshift(1, 2);
      expect(r).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1100
     * @tc.desc   Verify array unshift scenario 0110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1.5];
      const r: number = arr.unshift(2.25);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(2.25);
      expect(arr[1]).assertEqual(1.5);
    });

    /**
     * @tc.name   testUnshiftTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1200
     * @tc.desc   Verify array unshift scenario 0111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [-1];
      const r: number = arr.unshift(-2);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(-2);
      expect(arr[1]).assertEqual(-1);
    });

    /**
     * @tc.name   testUnshiftTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1300
     * @tc.desc   Verify array unshift scenario 0112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      arr.unshift(0, -0);
      expect(arr.length).assertEqual(2);
      expect(1 / arr[0]).assertEqual(Infinity);
      expect(1 / arr[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.name   testUnshiftTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1400
     * @tc.desc   Verify array unshift scenario 0113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['b'];
      const r: number = arr.unshift('');
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.name   testUnshiftTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1500
     * @tc.desc   Verify array unshift scenario 0114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [false];
      const r: number = arr.unshift(true);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
    });

    /**
     * @tc.name   testUnshiftTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1600
     * @tc.desc   Verify array unshift scenario 0115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (boolean | number)[] = [1];
      const r: number = arr.unshift(false);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(false);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.name   testUnshiftTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1700
     * @tc.desc   Verify array unshift scenario 0116
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1];
      const r: number = arr.unshift(undefined);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.name   testUnshiftTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1800
     * @tc.desc   Verify array unshift scenario 0117
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | null)[] = [1];
      const r: number = arr.unshift(null);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(null);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.name   testUnshiftTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_1900
     * @tc.desc   Verify array unshift scenario 0118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const r: number = arr.unshift(Number.NaN);
      expect(r).assertEqual(2);
      expect(arr[1]).assertEqual(1);
      expect(Number.isNaN(arr[0])).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2000
     * @tc.desc   Verify array unshift scenario 0119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const r: number = arr.unshift(-Infinity);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(-Infinity);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.name   testUnshiftTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2100
     * @tc.desc   Verify array unshift scenario 0120. JS-only: Symbol element unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0120()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2200
     * @tc.desc   Verify array unshift scenario 0121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Box121 { k: number = 1; }
      const o: Box121 = new Box121();
      const arr: (Box121 | number)[] = [2];
      const r: number = arr.unshift(o);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(o);
    });

    /**
     * @tc.name   testUnshiftTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2300
     * @tc.desc   Verify array unshift scenario 0122. JS-only: function reference element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0122()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2400
     * @tc.desc   Verify array unshift scenario 0123. JS-only: Date reference element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0123()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2500
     * @tc.desc   Verify array unshift scenario 0124. JS-only: RegExp reference element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0124()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2600
     * @tc.desc   Verify array unshift scenario 0125. JS-only: Set reference element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0125()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2700
     * @tc.desc   Verify array unshift scenario 0126. JS-only: Map and function mixed reference elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0126()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2800
     * @tc.desc   Verify array unshift scenario 0127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const r: number = arr.unshift(1);
      expect(r).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name   testUnshiftTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_2900
     * @tc.desc   Verify array unshift scenario 0128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      const r: number = arr.unshift(0);
      expect(r).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3000
     * @tc.desc   Verify array unshift scenario 0129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const r: number = arr.unshift(2, 3);
      expect(r).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(r).assertEqual(arr.length);
    });

    /**
     * @tc.name   testUnshiftTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3100
     * @tc.desc   Verify array unshift scenario 0130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const r: number = arr.unshift();
      expect(r).assertEqual(0);
    });

    /**
     * @tc.name   testUnshiftTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3200
     * @tc.desc   Verify array unshift scenario 0131
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const r1: number = arr.unshift();
      const r2: number = arr.unshift(2);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(2);
    });

    /**
     * @tc.name   testUnshiftTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3300
     * @tc.desc   Verify array unshift scenario 0132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      arr.unshift(1);
      arr.unshift(2, 3);
      const r: number = arr.unshift(4);
      expect(r).assertEqual(4);
      expect(arr[0]).assertEqual(4);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.name   testUnshiftTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3400
     * @tc.desc   Verify array unshift scenario 0133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      const r: number = arr.unshift();
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name   testUnshiftTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3500
     * @tc.desc   Verify array unshift scenario 0134
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const r: number = arr.unshift();
      expect(r).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   testUnshiftTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3600
     * @tc.desc   Verify array unshift scenario 0135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      arr.unshift(1);
      arr.unshift(2);
      arr.unshift(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.name   testUnshiftTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3700
     * @tc.desc   Verify array unshift scenario 0136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [3];
      a.unshift(1, 2);
      const b: number[] = [3];
      b.unshift(1);
      b.unshift(2);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
      expect(b[0]).assertEqual(2);
      expect(b[1]).assertEqual(1);
    });

    /**
     * @tc.name   testUnshiftTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3800
     * @tc.desc   Verify array unshift scenario 0137
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number[] = [5];
      a.unshift(1, 2);
      a.unshift(3, 4);
      const b: number[] = [5];
      b.unshift(1, 2, 3, 4);
      expect(a.length).assertEqual(b.length);
      expect(a[0]).assertEqual(3);
      expect(a[1]).assertEqual(4);
      expect(b[0]).assertEqual(1);
      expect(b[1]).assertEqual(2);
    });

    /**
     * @tc.name   testUnshiftTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_3900
     * @tc.desc   Verify array unshift scenario 0138. JS-only: Array.prototype.unshift.apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0138()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4000
     * @tc.desc   Verify array unshift scenario 0139. JS-only: Array.prototype.unshift.bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0139()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4100
     * @tc.desc   Verify array unshift scenario 0140. JS-only: Reflect.apply on unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0140()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4200
     * @tc.desc   Verify array unshift scenario 0141
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const r: number = arr.unshift(1, 2, 3);
      expect(r).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4300
     * @tc.desc   Verify array unshift scenario 0142
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2];
      const r: number = arr.unshift(1);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name   testUnshiftTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4400
     * @tc.desc   Verify array unshift scenario 0143
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: number = 0; i < 100; i++) {
        arr.push(i);
      }
      const r: number = arr.unshift(-1);
      expect(r).assertEqual(101);
      expect(arr[0]).assertEqual(-1);
      expect(arr[100]).assertEqual(99);
    });

    /**
     * @tc.name   testUnshiftTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4500
     * @tc.desc   Verify array unshift scenario 0144. JS-only: sparse hole array unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0144()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4600
     * @tc.desc   Verify array unshift scenario 0145. JS-only: delete index then unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0145()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4700
     * @tc.desc   Verify array unshift scenario 0146. JS-only: new Array holes then unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0146()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4800
     * @tc.desc   Verify array unshift scenario 0147. JS-only: return value check had arr===arr tautology
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0147()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_4900
     * @tc.desc   Verify array unshift scenario 0148
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20];
      arr.unshift(1, 2);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.name   testUnshiftTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5000
     * @tc.desc   Verify array unshift scenario 0149
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      arr.unshift('x', 'y');
      expect(arr[0]).assertEqual('x');
      expect(arr[1]).assertEqual('y');
      expect(arr[2]).assertEqual('a');
      expect(arr[3]).assertEqual('b');
      expect(arr[4]).assertEqual('c');
    });

    /**
     * @tc.name   testUnshiftTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5100
     * @tc.desc   Verify array unshift scenario 0150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      arr.unshift(2);
      arr.unshift(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5200
     * @tc.desc   Verify array unshift scenario 0151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 3, 4];
      arr.unshift(0, 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.name   testUnshiftTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5300
     * @tc.desc   Verify array unshift scenario 0152. JS-only: sparse hole unshift length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0152()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5400
     * @tc.desc   Verify array unshift scenario 0153. JS-only: arrayLike object unshift call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0153()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5500
     * @tc.desc   Verify array unshift scenario 0154. JS-only: arrayLike empty indices unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0154()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5600
     * @tc.desc   Verify array unshift scenario 0155. JS-only: arrayLike plain object unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0155()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5700
     * @tc.desc   Verify array unshift scenario 0156. JS-only: arrayLike chained unshift call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0156()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5800
     * @tc.desc   Verify array unshift scenario 0157. JS-only: arguments object unshift call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0157()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_5900
     * @tc.desc   Verify array unshift scenario 0158. JS-only: string primitive receiver TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0158()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6000
     * @tc.desc   Verify array unshift scenario 0159. JS-only: String object receiver TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0159()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6100
     * @tc.desc   Verify array unshift scenario 0160. JS-only: MAX_SAFE_INTEGER length boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0160()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6200
     * @tc.desc   Verify array unshift scenario 0161. JS-only: negative length arrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0161()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6300
     * @tc.desc   Verify array unshift scenario 0162. JS-only: negative zero length arrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0162()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6400
     * @tc.desc   Verify array unshift scenario 0163. JS-only: fractional length arrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0163()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6500
     * @tc.desc   Verify array unshift scenario 0164. JS-only: NaN length arrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0164()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6600
     * @tc.desc   Verify array unshift scenario 0165. JS-only: Infinity length arrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0165()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6700
     * @tc.desc   Verify array unshift scenario 0166. JS-only: non-writable length arrayLike strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0166()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6800
     * @tc.desc   Verify array unshift scenario 0167. JS-only: Object.freeze array unshift strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0167()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_6900
     * @tc.desc   Verify array unshift scenario 0168. JS-only: Object.freeze arrayLike unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0168()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7000
     * @tc.desc   Verify array unshift scenario 0169. JS-only: Object.seal array unshift strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0169()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7100
     * @tc.desc   Verify array unshift scenario 0170. JS-only: defineProperty non-configurable index on array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0170()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7200
     * @tc.desc   Verify array unshift scenario 0171. JS-only: defineProperty non-writable index strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0171()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7300
     * @tc.desc   Verify array unshift scenario 0172. JS-only: defineProperty non-writable length strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0172()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7400
     * @tc.desc   Verify array unshift scenario 0173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.unshift(0);
      const s: number = arr.shift() as number;
      expect(s).assertEqual(0);
      expect(JSON.stringify(arr)).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name   testUnshiftTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7500
     * @tc.desc   Verify array unshift scenario 0174
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.unshift(0);
      arr.shift();
      expect(JSON.stringify(arr)).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name   testUnshiftTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7600
     * @tc.desc   Verify array unshift scenario 0175
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 3];
      arr.unshift(1);
      arr.push(4);
      expect(JSON.stringify(arr)).assertEqual('[1,2,3,4]');
    });

    /**
     * @tc.name   testUnshiftTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7700
     * @tc.desc   Verify array unshift scenario 0176
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.unshift(0);
      const p: number = arr.pop() as number;
      expect(p).assertEqual(3);
      expect(JSON.stringify(arr)).assertEqual('[0,1,2]');
    });

    /**
     * @tc.name   testUnshiftTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7800
     * @tc.desc   Verify array unshift scenario 0177
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue: string[] = [];
      queue.push('a');
      queue.push('b');
      queue.shift();
      queue.unshift('c');
      expect(JSON.stringify(queue)).assertEqual('["c","b"]');
    });

    /**
     * @tc.name   testUnshiftTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_7900
     * @tc.desc   Verify array unshift scenario 0178
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [3, 4, 5];
      arr.unshift(1, 2);
      arr.splice(2, 1, 'x');
      expect(JSON.stringify(arr)).assertEqual('[1,2,"x",4,5]');
    });

    /**
     * @tc.name   testUnshiftTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8000
     * @tc.desc   Verify array unshift scenario 0179
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 1];
      arr.unshift(5, 2, 4);
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,5]');
    });

    /**
     * @tc.name   testUnshiftTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8100
     * @tc.desc   Verify array unshift scenario 0180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 4];
      arr.unshift(1, 2);
      arr.reverse();
      expect(JSON.stringify(arr)).assertEqual('[4,3,2,1]');
    });

    /**
     * @tc.name   testUnshiftTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8200
     * @tc.desc   Verify array unshift scenario 0181
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 3];
      arr.unshift(1);
      const mapped: number[] = arr.map((x: number): number => x * 10);
      expect(JSON.stringify(mapped)).assertEqual('[10,20,30]');
    });

    /**
     * @tc.name   testUnshiftTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8300
     * @tc.desc   Verify array unshift scenario 0182
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      arr.unshift(5);
      const sum: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(sum).assertEqual(65);
    });

    /**
     * @tc.name   testUnshiftTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8400
     * @tc.desc   Verify array unshift scenario 0183
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [3, 4];
      const arr2: number[] = arr1.concat([1, 2]);
      const lenBefore: number = arr1.length;
      arr1.unshift(1, 2);
      expect(lenBefore).assertEqual(2);
      expect(arr1.length).assertEqual(4);
      expect(JSON.stringify(arr1)).assertEqual('[1,2,3,4]');
      expect(JSON.stringify(arr1) !== JSON.stringify(arr2)).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8500
     * @tc.desc   Verify array unshift scenario 0184
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [3, 4];
      const arr2: number[] = [1, 2];
      arr1.unshift(...arr2);
      expect(JSON.stringify(arr1)).assertEqual('[1,2,3,4]');
    });

    /**
     * @tc.name   testUnshiftTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8600
     * @tc.desc   Verify array unshift scenario 0185
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 4];
      arr.unshift(1, 2);
      const newArr: number[] = [...arr, 5];
      expect(JSON.stringify(newArr)).assertEqual('[1,2,3,4,5]');
    });

    /**
     * @tc.name   testUnshiftTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8700
     * @tc.desc   Verify array unshift scenario 0186
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 3, 4];
      arr.unshift(1);
      expect(arr.indexOf(1)).assertEqual(0);
      expect(arr.indexOf(4)).assertEqual(3);
    });

    /**
     * @tc.name   testUnshiftTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8800
     * @tc.desc   Verify array unshift scenario 0187
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['b', 'c'];
      arr.unshift('a');
      expect(arr.includes('a')).assertEqual(true);
      expect(arr.includes('d')).assertEqual(false);
    });

    /**
     * @tc.name   testUnshiftTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_8900
     * @tc.desc   Verify array unshift scenario 0188. JS-only: Object.freeze weak dual branch unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0188()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9000
     * @tc.desc   Verify array unshift scenario 0189. JS-only: Object.seal unshift strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0189()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9100
     * @tc.desc   Verify array unshift scenario 0190. JS-only: unshift.call null TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0190()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9200
     * @tc.desc   Verify array unshift scenario 0191. JS-only: unshift.call number env skip return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0191()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9300
     * @tc.desc   Verify array unshift scenario 0192. JS-only: unshift.call boolean env skip return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0192()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9400
     * @tc.desc   Verify array unshift scenario 0193. JS-only: unshift.call Symbol env skip return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0193()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9500
     * @tc.desc   Verify array unshift scenario 0194. JS-only: Proxy set trap strict unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0194()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9600
     * @tc.desc   Verify array unshift scenario 0195. JS-only: Proxy get trap length observation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0195()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9700
     * @tc.desc   Verify array unshift scenario 0196. JS-only: spread 256 arguments unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0196()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9800
     * @tc.desc   Verify array unshift scenario 0197. JS-only: circular reference object unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0197()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_9900
     * @tc.desc   Verify array unshift scenario 0198. JS-only: array self unshift circular
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0198()).assertEqual(true);
    });

    /**
     * @tc.name   testUnshiftTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_SUPPLEMENT_TEST_0199
     * @tc.desc   Verify array unshift scenario 0199. JS-only: defineProperty getter arrayLike unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnshiftTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(UnshiftJs.UnshiftJs_0199()).assertEqual(true);
    });

  });
}
