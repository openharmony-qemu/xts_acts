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
import {
  testArraySpliceJs0082,
  testArraySpliceJs0087
} from './ArraySpliceTest';

export default function ArraySpliceMindMapTest() {
  describe('ArraySpliceMindMapTest', () => {
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
     * @tc.name   testArraySpliceTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0100
     * @tc.desc   Verify splice removes a single element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 1);
      expect(arr).assertDeepEquals([1, 3]);
      expect(removed).assertDeepEquals([2]);
    });

    /**
     * @tc.name   testArraySpliceTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify splice inserts a single element without removal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(1, 0, 99);
      expect(arr).assertDeepEquals([1, 99, 2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify splice inserts multiple elements without removal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(1, 0, 99, 100);
      expect(arr).assertDeepEquals([1, 99, 100, 2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0400
     * @tc.desc   Verify splice removes multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const removed: number[] = arr.splice(1, 3);
      expect(arr).assertDeepEquals([1, 5]);
      expect(removed).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0500
     * @tc.desc   Verify splice with negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const removed: number[] = arr.splice(-2, 1);
      expect(arr).assertDeepEquals([1, 2, 3, 5]);
      expect(removed).assertDeepEquals([4]);
    });

    /**
     * @tc.name   testArraySpliceTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0600
     * @tc.desc   Verify splice removes zero elements when deleteCount is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 0);
      expect(arr).assertDeepEquals([1, 2, 3]);
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0700
     * @tc.desc   Verify splice with start index greater than array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(5, 2, 99);
      expect(arr).assertDeepEquals([1, 2, 3, 99]);
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify splice removes all elements if deleteCount exceeds length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(0, 10);
      expect(arr).assertDeepEquals([]);
      expect(removed).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify splice on array of strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const removed: string[] = arr.splice(1, 2, 'x', 'y');
      expect(arr).assertDeepEquals(['a', 'x', 'y', 'd']);
      expect(removed).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArraySpliceTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1000
     * @tc.desc   Verify splice inserts objects into array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Obj { a: number }

      const arr: Obj[] = [{ a: 1 }, { a: 2 }, { a: 3 }];
      const removed: Obj[] = arr.splice(1, 1, { a: 99 });
      expect(arr).assertDeepEquals([{ a: 1 }, { a: 99 }, { a: 3 }]);
      expect(removed).assertDeepEquals([{ a: 2 }]);
    });

    /**
     * @tc.name   testArraySpliceTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1100
     * @tc.desc   Verify splice on array of nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const removed: number[][] = arr.splice(1, 1, [9, 9]);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual("1,2,9,9,5,6");
      expect(removed.length).assertEqual(1);
      expect(removed.toString()).assertDeepEquals("3,4");
    });

    /**
     * @tc.name   testArraySpliceTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1200
     * @tc.desc   Verify splice with start index 0 and deleteCount 0 inserts elements at beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 3, 4];
      arr.splice(0, 0, 1);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1300
     * @tc.desc   Verify splice removes and inserts multiple object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Obj { x: number; }

      const arr: Obj[] = [{ x: 1 }, { x: 2 }, { x: 3 }];
      const removed: Obj[] = arr.splice(1, 2, { x: 99 }, { x: 100 });
      expect(arr).assertDeepEquals([{ x: 1 }, { x: 99 }, { x: 100 }]);
      expect(removed).assertDeepEquals([{ x: 2 }, { x: 3 }]);
    });

    /**
     * @tc.name   testArraySpliceTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1400
     * @tc.desc   Verify splice removes element from array of strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const removed: string[] = arr.splice(1, 1);
      expect(arr).assertDeepEquals(['a', 'c']);
      expect(removed).assertDeepEquals(['b']);
    });

    /**
     * @tc.name   testArraySpliceTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1500
     * @tc.desc   Verify splice inserts class instances into array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      arr.splice(1, 0, new C(99));
      expect(arr.map(c => c.v)).assertDeepEquals([1, 99, 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1600
     * @tc.desc   Verify splice with negative start index inserts element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(-1, 0, 99);
      expect(arr).assertDeepEquals([1, 2, 3, 99, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1700
     * @tc.desc   Verify splice removes zero elements when deleteCount is 0 at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(3, 0, 4);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1800
     * @tc.desc   Verify splice removes all elements if deleteCount exceeds array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(0, 10);
      expect(arr).assertDeepEquals([]);
      expect(removed).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_1900
     * @tc.desc   Verify splice inserts multiple nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4]];
      arr.splice(1, 0, [[9, 9], [8, 8]]);
      expect(arr).assertDeepEquals([[1, 2], [[9, 9], [8, 8]], [3, 4]]);
    });

    /**
     * @tc.name   testArraySpliceTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2000
     * @tc.desc   Verify splice on array of optional objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Opt { x?: number }

      const arr: Opt[] = [{ x: 1 }, {}, { x: 3 }];
      const removed: Opt[] = arr.splice(1, 1, { x: 99 });
      expect(arr).assertDeepEquals([{ x: 1 }, { x: 99 }, { x: 3 }]);
      expect(removed).assertDeepEquals([{}]);
    });

    /**
     * @tc.name   testArraySpliceTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2100
     * @tc.desc   Verify splice removes elements from array after push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.push(4, 5);
      const removed: number[] = arr.splice(1, 3);
      expect(arr).assertDeepEquals([1, 5]);
      expect(removed).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2200
     * @tc.desc   Verify splice replaces elements with class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      const removed: C[] = arr.splice(0, 1, new C(99));
      expect(arr.map(c => c.v)).assertDeepEquals([99, 2]);
      expect(removed.map(c => c.v)).assertDeepEquals([1]);
    });

    /**
     * @tc.name   testArraySpliceTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2300
     * @tc.desc   Verify splice with negative start index removes and inserts elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-2, 1, 99, 100);
      expect(arr).assertDeepEquals([1, 2, 99, 100, 4]);
      expect(removed).assertDeepEquals([3]);
    });

    /**
     * @tc.name   testArraySpliceTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2400
     * @tc.desc   Verify splice inserts elements at the end of the array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(arr.length, 0, 99, 100);
      expect(arr).assertDeepEquals([1, 2, 3, 99, 100]);
    });

    /**
     * @tc.name   testArraySpliceTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2500
     * @tc.desc   Verify splice removes all elements when deleteCount equals array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(0, 4);
      expect(arr).assertDeepEquals([]);
      expect(removed).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2600
     * @tc.desc   Verify splice on array of strings removes and inserts elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const removed: string[] = arr.splice(1, 2, 'x', 'y');
      expect(arr).assertDeepEquals(['a', 'x', 'y', 'd']);
      expect(removed).assertDeepEquals(['b', 'c']);
    });

    /**
     * @tc.name   testArraySpliceTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2700
     * @tc.desc   Verify splice removes no elements if deleteCount is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 0);
      expect(arr).assertDeepEquals([1, 2, 3]);
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2800
     * @tc.desc   Verify splice inserts elements of different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [1, 'a', 2];
      arr.splice(1, 1, 'x', 99);
      expect(arr).assertDeepEquals([1, 'x', 99, 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_2900
     * @tc.desc   Verify splice removes elements from an array of optional objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Opt { a?: number }

      const arr: Opt[] = [{ a: 1 }, {}, { a: 3 }];
      const removed: Opt[] = arr.splice(1, 2);
      expect(arr).assertDeepEquals([{ a: 1 }]);
      expect(removed).assertDeepEquals([{}, { a: 3 }]);
    });

    /**
     * @tc.name   testArraySpliceTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3000
     * @tc.desc   Verify splice on array of class instances removes and inserts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(1, 1, new C(99));
      expect(arr.map(c => c.v)).assertDeepEquals([1, 99, 3]);
      expect(removed.map(c => c.v)).assertDeepEquals([2]);
    });

    /**
     * @tc.name   testArraySpliceTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3100
     * @tc.desc   Verify splice with negative start index and deleteCount exceeding array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-5, 10, 99);
      expect(arr).assertDeepEquals([99]);
      expect(removed).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3200
     * @tc.desc   Verify splice inserts multiple nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4]];
      arr.splice(1, 0, [[9, 9]], [[8, 8]]);
      expect(arr).assertDeepEquals([[1, 2], [[9, 9]], [[8, 8]], [3, 4]]);
    });

    /**
     * @tc.name   testArraySpliceTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3300
     * @tc.desc   Verify splice on array of optional objects with insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Opt { a?: number }

      const arr: Opt[] = [{ a: 1 }, {}, { a: 3 }];
      const removed: Opt[] = arr.splice(1, 1, { a: 99 });
      expect(arr).assertDeepEquals([{ a: 1 }, { a: 99 }, { a: 3 }]);
      expect(removed).assertDeepEquals([{}]);
    });

    /**
     * @tc.name   testArraySpliceTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3400
     * @tc.desc   Verify splice removes elements from class instance array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(0, 2);
      expect(arr.map(c => c.v)).assertDeepEquals([3]);
      expect(removed.map(c => c.v)).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3500
     * @tc.desc   Verify splice inserts elements at the end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(arr.length, 0, 99, 100);
      expect(arr).assertDeepEquals([1, 2, 3, 99, 100]);
    });

    /**
     * @tc.name   testArraySpliceTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3600
     * @tc.desc   Verify splice removes elements from mixed type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [1, 'a', 2, 'b'];
      const removed: (number | string)[] = arr.splice(1, 2, 'x');
      expect(arr).assertDeepEquals([1, 'x', 'b']);
      expect(removed).assertDeepEquals(['a', 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3700
     * @tc.desc   Verify splice with zero deleteCount inserts elements without removal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 0, 99, 100);
      expect(arr).assertDeepEquals([1, 99, 100, 2, 3]);
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3800
     * @tc.desc   Verify splice removes all elements when deleteCount equals array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(0, 4);
      expect(arr).assertDeepEquals([]);
      expect(removed).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_3900
     * @tc.desc   Verify splice removes elements after push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3, 4);
      const removed: number[] = arr.splice(1, 3);
      expect(arr).assertDeepEquals([1]);
      expect(removed).assertDeepEquals([2, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4000
     * @tc.desc   Verify splice inserts elements into array of class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      arr.splice(1, 0, new C(99), new C(100));
      expect(arr.map(c => c.v)).assertDeepEquals([1, 99, 100, 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4100
     * @tc.desc   Verify splice removes elements using negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const removed: number[] = arr.splice(-3, 2);
      expect(arr).assertDeepEquals([1, 2, 5]);
      expect(removed).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4200
     * @tc.desc   Verify splice inserts elements at start using negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 4, 5];
      arr.splice(-3, 0, 1, 2);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.name   testArraySpliceTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4300
     * @tc.desc   Verify splice removes no elements if start index exceeds array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(5, 2, 99);
      expect(arr).assertDeepEquals([1, 2, 3, 99]);
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4400
     * @tc.desc   Verify splice removes middle element from string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const removed: string[] = arr.splice(2, 1);
      expect(arr).assertDeepEquals(['a', 'b', 'd']);
      expect(removed).assertDeepEquals(['c']);
    });

    /**
     * @tc.name   testArraySpliceTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4500
     * @tc.desc   Verify splice inserts object elements into array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Obj { x: number }

      const arr: Obj[] = [{ x: 1 }, { x: 2 }];
      arr.splice(1, 0, { x: 99 });
      expect(arr).assertDeepEquals([{ x: 1 }, { x: 99 }, { x: 2 }]);
    });

    /**
     * @tc.name   testArraySpliceTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4600
     * @tc.desc   Verify splice removes all elements and inserts new ones
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(0, 3, 99, 100);
      expect(arr).assertDeepEquals([99, 100]);
      expect(removed).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4700
     * @tc.desc   Verify splice on array of optional objects with multiple insertions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Opt { a?: number }

      const arr: Opt[] = [{ a: 1 }, {}, { a: 3 }];
      const removed: Opt[] = arr.splice(1, 1, { a: 99 }, { a: 100 });
      expect(arr).assertDeepEquals([{ a: 1 }, { a: 99 }, { a: 100 }, { a: 3 }]);
      expect(removed).assertDeepEquals([{}]);
    });

    /**
     * @tc.name   testArraySpliceTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4800
     * @tc.desc   Verify splice removes from nested arrays and inserts new arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(1, 2, [[9, 9]]);
      expect(arr).assertDeepEquals([[1, 2], [[9, 9]]]);
      expect(removed).assertDeepEquals([[3, 4], [5, 6]]);
    });

    /**
     * @tc.name   testArraySpliceTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_4900
     * @tc.desc   Verify splice removes elements and returns correct removed array for mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [1, 'a', 2, 'b'];
      const removed: (number | string)[] = arr.splice(0, 2);
      expect(arr).assertDeepEquals([2, 'b']);
      expect(removed).assertDeepEquals([1, 'a']);
    });

    /**
     * @tc.name   testArraySpliceTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5000
     * @tc.desc   Verify splice inserts class instances and removes existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(1, 2, new C(99), new C(100));
      expect(arr.map(c => c.v)).assertDeepEquals([1, 99, 100]);
      expect(removed.map(c => c.v)).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5100
     * @tc.desc   Verify splice after push inserts elements at specific position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3, 4);
      const removed: number[] = arr.splice(2, 1, 99);
      expect(arr).assertDeepEquals([1, 2, 99, 4]);
      expect(removed).assertDeepEquals([3]);
    });

    /**
     * @tc.name   testArraySpliceTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5200
     * @tc.desc   Verify splice combined with slice preserves array immutability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const copy: number[] = arr.slice();
      const removed: number[] = arr.splice(1, 2, 99);
      expect(arr).assertDeepEquals([1, 99, 4]);
      expect(copy).assertDeepEquals([1, 2, 3, 4]);
      expect(removed).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5300
     * @tc.desc   Verify splice with nested array elements and negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(-2, 1, [[9, 9]]);
      expect(arr).assertDeepEquals([[1, 2], [[9, 9]], [5, 6]]);
      expect(removed).assertDeepEquals([[3, 4]]);
    });

    /**
     * @tc.name   testArraySpliceTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5400
     * @tc.desc   Verify splice removes elements and returns correct array for optional objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Opt { a?: number }

      const arr: Opt[] = [{ a: 1 }, {}, { a: 3 }];
      const removed: Opt[] = arr.splice(0, 2);
      expect(arr).assertDeepEquals([{ a: 3 }]);
      expect(removed).assertDeepEquals([{ a: 1 }, {}]);
    });

    /**
     * @tc.name   testArraySpliceTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5500
     * @tc.desc   Verify splice inserts elements into array of class instances and then pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      arr.splice(1, 0, new C(99));
      const popped: C | undefined = arr.pop();
      expect(arr.map(c => c.v)).assertDeepEquals([1, 99]);
      expect(popped?.v).assertEqual(2);
    });

    /**
     * @tc.name   testArraySpliceTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5600
     * @tc.desc   Verify splice combined with push and slice on mixed type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [1, 'a', 2, 'b'];
      arr.push('c');
      const removed: (number | string)[] = arr.splice(1, 2, 'x');
      const copy: (number | string)[] = arr.slice();
      expect(arr).assertDeepEquals([1, 'x', 'b', 'c']);
      expect(removed).assertDeepEquals(['a', 2]);
      expect(copy).assertDeepEquals([1, 'x', 'b', 'c']);
    });

    /**
     * @tc.name   testArraySpliceTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5700
     * @tc.desc   Verify splice removes from array of nested arrays and inserts multiple arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(0, 2, [[9, 9]], [[8, 8]]);
      expect(arr).assertDeepEquals([[[9, 9]], [[8, 8]], [5, 6]]);
      expect(removed).assertDeepEquals([[1, 2], [3, 4]]);
    });

    /**
     * @tc.name   testArraySpliceTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5800
     * @tc.desc   Verify splice removes no elements if deleteCount is 0 and inserts at negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-2, 0, 99, 100);
      expect(arr).assertDeepEquals([1, 2, 99, 100, 3, 4]);
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_5900
     * @tc.desc   Verify splice removes elements equal to deleteCount and inserts multiple types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [1, 'a', 2, 'b', 3];
      const removed: (number | string)[] = arr.splice(1, 3, 'x', 99);
      expect(arr).assertDeepEquals([1, 'x', 99, 3]);
      expect(removed).assertDeepEquals(['a', 2, 'b']);
    });

    /**
     * @tc.name   testArraySpliceTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6000
     * @tc.desc   Verify splice on array of class instances with multiple insertions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public v: number;

        constructor(v: number) {
          this.v = v;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(1, 2, new C(99), new C(100));
      expect(arr.map(c => c.v)).assertDeepEquals([1, 99, 100]);
      expect(removed.map(c => c.v)).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6100
     * @tc.desc   Verify splice combined with pop returns correct popped element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(1, 1, 99);
      const popped: number | undefined = arr.pop();
      expect(arr).assertDeepEquals([1, 99]);
      expect(popped).assertEqual(3);
    });

    /**
     * @tc.name   testArraySpliceTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6200
     * @tc.desc   Verify splice combined with slice on nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(1, 1, [[9, 9]]);
      const copy = arr.slice();
      expect(arr).assertDeepEquals([[1, 2], [[9, 9]], [5, 6]]);
      expect(removed).assertDeepEquals([[3, 4]]);
      expect(copy).assertDeepEquals([[1, 2], [[9, 9]], [5, 6]]);
    });

    /**
     * @tc.name   testArraySpliceTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6300
     * @tc.desc   Verify splice removes first element from string array and inserts new elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const removed: string[] = arr.splice(0, 1, 'x', 'y');
      expect(arr).assertDeepEquals(['x', 'y', 'b', 'c', 'd']);
      expect(removed).assertDeepEquals(['a']);
    });

    /**
     * @tc.name   testArraySpliceTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6400
     * @tc.desc   Verify splice inserts optional objects into array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Opt { a?: number }

      const arr: Opt[] = [{ a: 1 }, { a: 2 }];
      arr.splice(1, 0, {}, { a: 99 });
      expect(arr).assertDeepEquals([{ a: 1 }, {}, { a: 99 }, { a: 2 }]);
    });

    /**
     * @tc.name   testArraySpliceTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6500
     * @tc.desc   Verify splice removes all elements when start=0 and deleteCount exceeds length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(0, 10, 99);
      expect(arr).assertDeepEquals([99]);
      expect(removed).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6600
     * @tc.desc   Verify splice inserts elements at end using start greater than length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(5, 0, 99);
      expect(arr).assertDeepEquals([1, 2, 99]);
    });

    /**
     * @tc.name   testArraySpliceTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6700
     * @tc.desc   Verify splice removes elements from end using negative start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-2, 2);
      expect(arr).assertDeepEquals([1, 2]);
      expect(removed).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6800
     * @tc.desc   Verify splice inserts elements into empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const removed: number[] = arr.splice(0, 0, 1, 2, 3);
      expect(arr).assertDeepEquals([1, 2, 3]);
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_6900
     * @tc.desc   Verify splice combined with multiple pop operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2, 99);
      const pop1: number | undefined = arr.pop();
      const pop2: number | undefined = arr.pop();
      expect(arr).assertDeepEquals([1]);
      expect(pop1).assertEqual(4);
      expect(pop2).assertEqual(99);
    });

    /**
     * @tc.name   testArraySpliceTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7000
     * @tc.desc   Verify splice removes elements and returns correct array for mixed nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | string[])[] = [[1, 2], ['a', 'b'], [3, 4]];
      const removed = arr.splice(1, 2, [9, 9]);
      expect(arr).assertDeepEquals([[1, 2], [9, 9]]);
      expect(removed).assertDeepEquals([['a', 'b'], [3, 4]]);
    });

    /**
     * @tc.name   testArraySpliceTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7100
     * @tc.desc   Verify splice combined with multiple pop operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2, 99);
      const pop1: number | undefined = arr.pop();
      const pop2: number | undefined = arr.pop();
      expect(arr).assertDeepEquals([1]);
      expect(pop1).assertEqual(4);
      expect(pop2).assertEqual(99);
    });

    /**
     * @tc.name   testArraySpliceTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7200
     * @tc.desc   Verify splice with negative start index and deleteCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(-3, 2);
      expect(arr).assertDeepEquals([1, 4]);
      expect(removed).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7300
     * @tc.desc   Verify splice with negative start index and insert elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(-2, 0, 99, 100);
      expect(arr).assertDeepEquals([1, 2, 99, 100, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7400
     * @tc.desc   Verify splice with deleteCount of 0 and insert elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(2, 0, 99, 100);
      expect(arr).assertDeepEquals([1, 2, 99, 100, 3, 4]);
    });

    /**
     * @tc.name   testArraySpliceTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7500
     * @tc.desc   Verify splice with deleteCount greater than array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const removed: number[] = arr.splice(1, 5);
      expect(arr).assertDeepEquals([1]);
      expect(removed).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7600
     * @tc.desc   Verify splice with deleteCount of 0 and insert elements at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(5, 0, 99);
      expect(arr).assertDeepEquals([1, 2, 99]);
    });

    /**
     * @tc.name   testArraySpliceTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7700
     * @tc.desc   Verify splice with deleteCount of 0 and insert elements at start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(0, 0, 99);
      expect(arr).assertDeepEquals([99, 1, 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7800
     * @tc.desc   Verify splice with deleteCount of 0 and insert elements at negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(-1, 0, 99);
      expect(arr).assertDeepEquals([1, 99, 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_7900
     * @tc.desc   Verify splice with deleteCount of 0 and insert multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.splice(1, 0, 99, 100);
      expect(arr).assertDeepEquals([1, 99, 100, 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8000
     * @tc.desc   Verify splice works correctly on sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, , 3, , 5];
      const removed = arr.splice(1, 2, 99);
      expect(arr.length).assertEqual(4);
      expect(arr.toString()).assertEqual("1,99,,5")
      expect(removed).assertDeepEquals([undefined, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8100
     * @tc.desc   Verify splice can be applied to array-like objects. JS-only: Array.prototype.splice.call on arrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArraySpliceJs0082()).assertDeepEquals([1, 99, 3, 3]);
    });

    /**
     * @tc.name   testArraySpliceTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8200
     * @tc.desc   Verify splice combined with map on array of numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2, 99, 100);
      const mapped: number[] = arr.map(x => x * 2);
      expect(mapped).assertDeepEquals([2, 198, 200, 8]);
    });

    /**
     * @tc.name   testArraySpliceTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8300
     * @tc.desc   Verify splice combined with filter to remove specific elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.splice(1, 2, 99);
      const filtered: number[] = arr.filter(x => x > 2);
      expect(filtered).assertDeepEquals([99, 4, 5]);
    });

    /**
     * @tc.name   testArraySpliceTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8400
     * @tc.desc   Verify splice combined with reduce to sum array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2, 99);
      const sum: number = arr.reduce((acc, curr) => acc + curr, 0);
      expect(sum).assertEqual(1 + 99 + 4);
    });

    /**
     * @tc.name   testArraySpliceTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8500
     * @tc.desc   Verify splice on sparse array combined with map and filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, , 3, , 5];
      arr.splice(2, 1, 99);
      const processed: number[] = arr.map(x => x ? x * 2 : 0).filter(x => x > 0);
      expect(processed.length).assertEqual(3);
      expect(processed.toString()).assertEqual("2,198,10")
    });

    /**
     * @tc.name   testArraySpliceTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8600
     * @tc.desc   Verify splice on array-like object combined with map. JS-only: Array.prototype.splice.call and map.call on arrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArraySpliceJs0087()).assertDeepEquals([2, 198, 6]);
    });

    /**
     * @tc.name   testArraySpliceTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8700
     * @tc.desc   Verify splice inserts elements and concatenates with another array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.splice(1, 1, 99);
      const combined: number[] = arr.concat([100, 101]);
      expect(combined).assertDeepEquals([1, 99, 3, 100, 101]);
    });

    /**
     * @tc.name   testArraySpliceTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8800
     * @tc.desc   Verify splice removes elements and then reverses array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(1, 2);
      arr.reverse();
      expect(arr).assertDeepEquals([4, 1]);
    });

    /**
     * @tc.name   testArraySpliceTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_8900
     * @tc.desc   Verify splice removes and inserts elements in combination with sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 2, 4, 3];
      arr.splice(1, 2, 99);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([3, 5, 99]);
    });

    /**
     * @tc.name   testArraySpliceTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9000
     * @tc.desc   Verify splice removes objects from array of interfaces and inserts new ones
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Item {
        id: number,
        name: string
      }

      const arr: Item[] = [{ id: 1, name: 'a' }, { id: 2, name: 'b' }, { id: 3, name: 'c' }];
      const removed: Item[] = arr.splice(1, 1, { id: 99, name: 'x' });
      expect(arr).assertDeepEquals([{ id: 1, name: 'a' }, { id: 99, name: 'x' }, { id: 3, name: 'c' }]);
      expect(removed).assertDeepEquals([{ id: 2, name: 'b' }]);
    });

    /**
     * @tc.name   testArraySpliceTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9100
     * @tc.desc   Verify splice on nested arrays combined with map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | number[][])[] = [[1, 2], [3, 4], [5, 6]];
      const removed = arr.splice(1, 1, [[99, 99]]);
      const flattened = arr.map(a => a.flat()).flat();
      expect(arr).assertDeepEquals([[1, 2], [[99, 99]], [5, 6]]);
      expect(removed).assertDeepEquals([[3, 4]]);
      expect(flattened).assertDeepEquals([1, 2, 99, 99, 5, 6]);
    });

    /**
     * @tc.name   testArraySpliceTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9200
     * @tc.desc   Verify splice on class instances array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: C[] = [new C(1), new C(2), new C(3)];
      const removed: C[] = arr.splice(1, 1, new C(99));
      expect(arr.map(c => c.val)).assertDeepEquals([1, 99, 3]);
      expect(removed.map(c => c.val)).assertDeepEquals([2]);
    });

    /**
     * @tc.name   testArraySpliceTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9300
     * @tc.desc   Verify splice combined with reduce on numbers array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.splice(2, 2, 99, 100);
      const sum: number = arr.reduce((acc, curr) => acc + curr, 0);
      expect(sum).assertEqual(1 + 2 + 99 + 100 + 5);
    });

    /**
     * @tc.name   testArraySpliceTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9400
     * @tc.desc   Verify splice with negative start combined with filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.splice(-2, 1, 99);
      const filtered: number[] = arr.filter(x => x > 2);
      expect(filtered).assertDeepEquals([3, 99, 5]);
    });

    /**
     * @tc.name   testArraySpliceTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9500
     * @tc.desc   Verify splice removes from array and concatenates with another array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const removed: number[] = arr.splice(1, 2);
      const combined: number[] = arr.concat([99, 100]);
      expect(arr).assertDeepEquals([1, 4]);
      expect(removed).assertDeepEquals([2, 3]);
      expect(combined).assertDeepEquals([1, 4, 99, 100]);
    });

    /**
     * @tc.name   testArraySpliceTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9600
     * @tc.desc   Verify splice inserts multiple class instances and map their values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class C {
        public val: number;

        constructor(val: number) {
          this.val = val;
        }
      }

      const arr: C[] = [new C(1), new C(2)];
      arr.splice(1, 0, new C(99), new C(100));
      expect(arr.map(c => c.val)).assertDeepEquals([1, 99, 100, 2]);
    });

    /**
     * @tc.name   testArraySpliceTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9700
     * @tc.desc   Verify splice on sparse array with negative deleteCount is treated as zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [1, , 3, 4];
      const removed = arr.splice(1, -1, 99);
      expect(arr.length).assertEqual(5);
      expect(arr.toString()).assertDeepEquals('1,99,,3,4');
      expect(removed).assertDeepEquals([]);
    });

    /**
     * @tc.name   testArraySpliceTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9800
     * @tc.desc   Verify splice combined with flat on nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number[] | number)[] = [1, [2, 3], [4, 5]];
      arr.splice(1, 1, [99, 100]);
      const flat: number[] = arr.flat();
      expect(flat).assertDeepEquals([1, 99, 100, 4, 5]);
    });

    /**
     * @tc.name   testArraySpliceTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_9900
     * @tc.desc   Verify splice with zero deleteCount combined with sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 2, 4, 3];
      arr.splice(2, 0, 99);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals([2, 3, 4, 5, 99]);
    });

    /**
     * @tc.name   testArraySpliceTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SPLICE_SUPPLEMENT_TEST_0199
     * @tc.desc   Verify splice removes last element and map values in reverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArraySpliceTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      arr.splice(-1, 1);
      const reversed: number[] = arr.reverse().map(x => x * 10);
      expect(reversed).assertDeepEquals([30, 20, 10]);
    });
  });
}
