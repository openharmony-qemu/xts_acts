'use static'
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayIteratorTest(): void {
  describe('Uint32ArrayIteratorTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0100
     * @tc.name testUint32ArrayIterator001
     * @tc.desc Verify $_iterator() , .next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5);
      const iter = values.$_iterator();
      const r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0200
     * @tc.name testUint32ArrayIterator002
     * @tc.desc Verify IterableIterator<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 8);
      const iter: IterableIterator<Number> = values.$_iterator();
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0300
     * @tc.name testUint32ArrayIterator003
     * @tc.desc Verify for...of $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let defaultSum: number = 0;
      for (const v of values) {
        defaultSum = defaultSum + v;
      }
      let explicitSum: number = 0;
      for (const v of values.$_iterator()) {
        explicitSum = explicitSum + v;
      }
      expect(defaultSum).assertEqual(explicitSum);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0400
     * @tc.name testUint32ArrayIterator004
     * @tc.desc Verify .next() done/value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(11, 22);
      const iter = values.$_iterator();
      const r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(11);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0500
     * @tc.name testUint32ArrayIterator005
     * @tc.desc Verify .next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100);
      const iter = values.$_iterator();
      const r = iter.next();
      expect(r.done).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0600
     * @tc.name testUint32ArrayIterator006
     * @tc.desc Verify .next() value ([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42, 43, 44);
      const iter = values.$_iterator();
      const r = iter.next();
      expect(r.value).assertEqual(values[0]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0700
     * @tc.name testUint32ArrayIterator007
     * @tc.desc Verify .next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(11, 22, 33);
      const iter = values.$_iterator();
      const r0 = iter.next();
      const r1 = iter.next();
      const r2 = iter.next();
      expect(r0.value).assertEqual(11);
      expect(r1.value).assertEqual(22);
      expect(r2.value).assertEqual(33);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0800
     * @tc.name testUint32ArrayIterator008
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let count = 0;
      for (const v of values) {
        count++;
      }
      expect(count).assertEqual(values.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_0900
     * @tc.name testUint32ArrayIterator009
     * @tc.desc Verify $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const iter1 = values.$_iterator();
      const iter2 = values.$_iterator();
      iter1.next();
      iter1.next();
      const r2 = iter2.next();
      expect(r2.value).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1000
     * @tc.name testUint32ArrayIterator010
     * @tc.desc Verify two iterators independent first advances second starts fresh
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      const iter1 = values.$_iterator();
      const iter2 = values.$_iterator();
      iter1.next();
      iter1.next();
      const r1 = iter1.next();
      const r2 = iter2.next();
      expect(r1.done).assertTrue();
      expect(r2.value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1100
     * @tc.name testUint32ArrayIterator011
     * @tc.desc Verify .next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1200
     * @tc.name testUint32ArrayIterator012
     * @tc.desc Verify value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.value).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1300
     * @tc.name testUint32ArrayIterator013
     * @tc.desc Verify .next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1);
      const iter = values.$_iterator();
      iter.next();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1400
     * @tc.name testUint32ArrayIterator014
     * @tc.desc Verify (for...of )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 8, 9);
      const iter = values.$_iterator();
      let count = 0;
      for (const v of iter) {
        count++;
      }
      expect(count).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1500
     * @tc.name testUint32ArrayIterator015
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const iter = values.$_iterator();
      const a = iter.next().value!;
      const b = iter.next().value!;
      const c = iter.next().value!;
      expect((a.toString() + "," + b.toString() + "," + c.toString())).assertEqual(values.join(','));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1600
     * @tc.name testUint32ArrayIterator016
     * @tc.desc Verify :
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      const iter = values.$_iterator();
      const r0 = iter.next();
      const r1 = iter.next();
      expect(r0.value).assertEqual(42);
      expect(r0.done).assertFalse();
      expect(r1.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1700
     * @tc.name testUint32ArrayIterator017
     * @tc.desc Verify value at(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(values.at(0));
      expect(iter.next().value).assertEqual(values.at(1));
      expect(iter.next().value).assertEqual(values.at(2));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1800
     * @tc.name testUint32ArrayIterator018
     * @tc.desc Verify value $_get(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 10, 15, 20);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(values[0]);
      expect(iter.next().value).assertEqual(values[1]);
      expect(iter.next().value).assertEqual(values[2]);
      expect(iter.next().value).assertEqual(values[3]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_1900
     * @tc.name testUint32ArrayIterator019
     * @tc.desc Verify iterator for of count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let first = 0;
      for (const v of values) {
        first++;
      }
      let second = 0;
      for (const v of values) {
        second++;
      }
      expect(first).assertEqual(3);
      expect(second).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2000
     * @tc.name testUint32ArrayIterator020
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(11, 22, 33);
      let idx = 0;
      const expected: Array<number> = [11, 22, 33];
      for (const v of values) {
        expect(v).assertEqual(expected[idx]);
        idx++;
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2100
     * @tc.name testUint32ArrayIterator021
     * @tc.desc Verify for...of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array();
      let count = 0;
      for (const v of values) {
        count++;
      }
      expect(count).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2200
     * @tc.name testUint32ArrayIterator022
     * @tc.desc Verify for...of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(99);
      let count = 0;
      for (const v of values) {
        count++;
      }
      expect(count).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2300
     * @tc.name testUint32ArrayIterator023
     * @tc.desc Verify for...of length (4 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let count = 0;
      for (const v of values) {
        count++;
      }
      expect(count).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2400
     * @tc.name testUint32ArrayIterator024
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let sum: number = 0;
      for (const v of values) {
        sum = sum + v;
      }
      expect(sum).assertEqual(60);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2500
     * @tc.name testUint32ArrayIterator025
     * @tc.desc Verify for...of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let sum: number = 0;
      for (const v of values) {
        if (v === 3) {
          break;
        }
        sum = sum + v;
      }
      expect(sum).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2600
     * @tc.name testUint32ArrayIterator026
     * @tc.desc Verify for...of continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let sum: number = 0;
      for (const v of values) {
        if (v === 2) {
          continue;
        }
        sum = sum + v;
      }
      expect(sum).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2700
     * @tc.name testUint32ArrayIterator027
     * @tc.desc Verify for...of Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(11, 22, 33);
      const collected: Array<number> = [];
      for (const v of values) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(11);
      expect(collected[2]).assertEqual(33);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2800
     * @tc.name testUint32ArrayIterator028
     * @tc.desc Verify for...of MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 4294967295);
      let count = 0;
      for (const v of values) {
        expect(v).assertEqual(4294967295);
        count++;
      }
      expect(count).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_2900
     * @tc.name testUint32ArrayIterator029
     * @tc.desc Verify for...of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 5, 0);
      let zeroCount = 0;
      for (const v of values) {
        if (v === 0) {
          zeroCount++;
        }
      }
      expect(zeroCount).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3000
     * @tc.name testUint32ArrayIterator030
     * @tc.desc Verify for...of (65535 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(65535);
      values.fill(1);
      let count = 0;
      for (const v of values) {
        count++;
      }
      expect(count).assertEqual(65535);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3100
     * @tc.name testUint32ArrayIterator031
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const before = values.join(',');
      let touched = 0;
      for (const v of values) {
        touched++;
      }
      const after = values.join(',');
      expect(after).assertEqual(before);
      expect(touched).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3200
     * @tc.name testUint32ArrayIterator032
     * @tc.desc Verify for...of (3 3=9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let pairs = 0;
      for (const a of values) {
        for (const b of values) {
          pairs++;
        }
      }
      expect(pairs).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3300
     * @tc.name testUint32ArrayIterator033
     * @tc.desc Verify ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const iter = values.$_iterator();
      const r0 = iter.next();
      values[2] = 99;
      const r1 = iter.next();
      const r2 = iter.next();
      expect(r0.value).assertEqual(1);
      expect(r1.value).assertEqual(2);
      expect(r2.value).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3400
     * @tc.name testUint32ArrayIterator034
     * @tc.desc Verify $_iterator() values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const itIter = values.$_iterator();
      const vIter = values.values();
      expect(itIter.next().value).assertEqual(vIter.next().value);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3500
     * @tc.name testUint32ArrayIterator035
     * @tc.desc Verify $_iterator() values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const itIter = values.$_iterator();
      const vIter = values.values();
      expect(itIter.next().value).assertEqual(vIter.next().value);
      expect(itIter.next().value).assertEqual(vIter.next().value);
      expect(itIter.next().value).assertEqual(vIter.next().value);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3600
     * @tc.name testUint32ArrayIterator036
     * @tc.desc Verify $_iterator() values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      let itCount = 0;
      for (const v of values.$_iterator()) {
        itCount++;
      }
      let vCount = 0;
      for (const v of values.values()) {
        vCount++;
      }
      expect(itCount).assertEqual(vCount);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3700
     * @tc.name testUint32ArrayIterator037
     * @tc.desc Verify for...of for...of values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const a: Array<number> = [];
      for (const v of values) {
        a.push(v);
      }
      const b: Array<number> = [];
      for (const v of values.values()) {
        b.push(v);
      }
      expect(a.length).assertEqual(b.length);
      expect(a[0]).assertEqual(b[0]);
      expect(a[2]).assertEqual(b[2]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3800
     * @tc.name testUint32ArrayIterator038
     * @tc.desc Verify $_iterator() values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      const itIter = values.$_iterator();
      const vIter = values.values();
      itIter.next();
      itIter.next();
      vIter.next();
      vIter.next();
      expect(itIter.next().done).assertTrue();
      expect(vIter.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_3900
     * @tc.name testUint32ArrayIterator039
     * @tc.desc Verify .next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array();
      const iter = values.$_iterator();
      const r = iter.next();
      expect(r.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4000
     * @tc.name testUint32ArrayIterator040
     * @tc.desc Verify .next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array();
      const iter = values.$_iterator();
      const r = iter.next();
      expect(r.value).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4100
     * @tc.name testUint32ArrayIterator041
     * @tc.desc Verify $_iterator() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array();
      const iter = values.$_iterator();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4200
     * @tc.name testUint32ArrayIterator042
     * @tc.desc Verify $_iterator() values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array();
      let itCount = 0;
      for (const v of values.$_iterator()) {
        itCount++;
      }
      let vCount = 0;
      for (const v of values.values()) {
        vCount++;
      }
      expect(itCount).assertEqual(0);
      expect(vCount).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4300
     * @tc.name testUint32ArrayIterator043
     * @tc.desc Verify constructor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array();
      const iter = values.$_iterator();
      expect(iter.next().done).assertTrue();
      expect(values.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4400
     * @tc.name testUint32ArrayIterator044
     * @tc.desc Verify new Uint32Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const iter = values.$_iterator();
      expect(iter.next().done).assertTrue();
      expect(values.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4500
     * @tc.name testUint32ArrayIterator045
     * @tc.desc Verify uint32 MAX (4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4600
     * @tc.name testUint32ArrayIterator046
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4700
     * @tc.name testUint32ArrayIterator047
     * @tc.desc Verify int32.MAX (2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2147483647);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(2147483647);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4800
     * @tc.name testUint32ArrayIterator048
     * @tc.desc Verify -1 4294967295 ( 2^32 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = -1;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_4900
     * @tc.name testUint32ArrayIterator049
     * @tc.desc Verify 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 4294967296;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5000
     * @tc.name testUint32ArrayIterator050
     * @tc.desc Verify Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = Number.NaN;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5100
     * @tc.name testUint32ArrayIterator051
     * @tc.desc Verify Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = Number.POSITIVE_INFINITY;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5200
     * @tc.name testUint32ArrayIterator052
     * @tc.desc Verify Number.NEGATIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = Number.NEGATIVE_INFINITY;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5300
     * @tc.name testUint32ArrayIterator053
     * @tc.desc Verify 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 3.14;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5400
     * @tc.name testUint32ArrayIterator054
     * @tc.desc Verify -2147483648 (int32.MIN) 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = -2147483648;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5500
     * @tc.name testUint32ArrayIterator055
     * @tc.desc Verify iterator next duplicate 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 7, 7);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5600
     * @tc.name testUint32ArrayIterator056
     * @tc.desc Verify [MIN, MAX] = [0, 4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 4294967295);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5700
     * @tc.name testUint32ArrayIterator057
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 5, 0);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(5);
      expect(iter.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5800
     * @tc.name testUint32ArrayIterator058
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [9.0, 8.0];
      const values = new Uint32Array(src);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(9);
      expect(iter.next().value).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_5900
     * @tc.name testUint32ArrayIterator059
     * @tc.desc Verify .next() (1st index0, 2nd index1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200);
      const iter = values.$_iterator();
      const r0 = iter.next();
      const r1 = iter.next();
      expect(r0.value).assertEqual(100);
      expect(r1.value).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6000
     * @tc.name testUint32ArrayIterator060
     * @tc.desc Verify .next() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6100
     * @tc.name testUint32ArrayIterator061
     * @tc.desc Verify for...of next ,for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const iter = values.$_iterator();
      const first = iter.next();
      let rest = 0;
      for (const v of iter) {
        rest++;
      }
      expect(first.value).assertEqual(1);
      expect(rest).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6200
     * @tc.name testUint32ArrayIterator062
     * @tc.desc Verify ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const iter = values.$_iterator();
      values[0] = 77;
      const r = iter.next();
      expect(r.value).assertEqual(77);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6300
     * @tc.name testUint32ArrayIterator063
     * @tc.desc Verify ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values[1] = 99;
      const iter = values.$_iterator();
      const r0 = iter.next();
      const r1 = iter.next();
      expect(r0.value).assertEqual(1);
      expect(r1.value).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6400
     * @tc.name testUint32ArrayIterator064
     * @tc.desc Verify fill()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.fill(5);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(5);
      expect(iter.next().value).assertEqual(5);
      expect(iter.next().value).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6500
     * @tc.name testUint32ArrayIterator065
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.reverse();
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6600
     * @tc.name testUint32ArrayIterator066
     * @tc.desc Verify sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      values.sort();
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6700
     * @tc.name testUint32ArrayIterator067
     * @tc.desc Verify copyWithin()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(0, 2, 4);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().value).assertEqual(4);
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().value).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6800
     * @tc.name testUint32ArrayIterator068
     * @tc.desc Verify set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.set(Uint32Array.of(7, 8, 9));
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(8);
      expect(iter.next().value).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_6900
     * @tc.name testUint32ArrayIterator069
     * @tc.desc Verify subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const sub = values.subarray(1, 3);
      const iter = sub.$_iterator();
      expect(iter.next().value).assertEqual(20);
      expect(iter.next().value).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7000
     * @tc.name testUint32ArrayIterator070
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const sub = values.subarray(0, 2);
      values[0] = 99;
      const iter = sub.$_iterator();
      expect(iter.next().value).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7100
     * @tc.name testUint32ArrayIterator071
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const sl = values.slice(0, 2);
      values[0] = 99;
      const iter = sl.$_iterator();
      expect(iter.next().value).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7200
     * @tc.name testUint32ArrayIterator072
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const rev = values.toReversed();
      const iter = rev.$_iterator();
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7300
     * @tc.name testUint32ArrayIterator073
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const sorted = values.toSorted();
      const iter = sorted.$_iterator();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7400
     * @tc.name testUint32ArrayIterator074
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      values[0] = 111;
      values[1] = 222;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(111);
      expect(iter.next().value).assertEqual(222);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7500
     * @tc.name testUint32ArrayIterator075
     * @tc.desc Verify byteOffset>0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const firstView = new Uint32Array(buf, 0, 3);
      firstView[0] = 1;
      firstView[1] = 2;
      firstView[2] = 3;
      const secondView = new Uint32Array(buf, 4, 2);
      const iter = secondView.$_iterator();
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7600
     * @tc.name testUint32ArrayIterator076
     * @tc.desc Verify map()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const mapped = values.map((value, index, array) => value + 1);
      const iter = mapped.$_iterator();
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().value).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7700
     * @tc.name testUint32ArrayIterator077
     * @tc.desc Verify filter()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const filtered = values.filter((value, index, array) => value > 2);
      const iter = filtered.$_iterator();
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().value).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7800
     * @tc.name testUint32ArrayIterator078
     * @tc.desc Verify from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [3.0, 6.0, 9.0];
      const values = Uint32Array.from(src);
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().value).assertEqual(6);
      expect(iter.next().value).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_7900
     * @tc.name testUint32ArrayIterator079
     * @tc.desc Verify iterator large array first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1000);
      values[0] = 111;
      const iter = values.$_iterator();
      expect(iter.next().value).assertEqual(111);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8000
     * @tc.name testUint32ArrayIterator080
     * @tc.desc Verify .next() , done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8100
     * @tc.name testUint32ArrayIterator081
     * @tc.desc Verify iterator large array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(10000);
      values.fill(2);
      let count = 0;
      for (const v of values) {
        count++;
      }
      expect(count).assertEqual(10000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8200
     * @tc.name testUint32ArrayIterator082
     * @tc.desc Verify MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 4294967295, 4294967295);
      let count = 0;
      for (const v of values) {
        count++;
      }
      expect(count).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8300
     * @tc.name testUint32ArrayIterator083
     * @tc.desc Verify for...of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      const iter = values.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      let count = 0;
      for (const v of iter) {
        count++;
      }
      expect(count).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8400
     * @tc.name testUint32ArrayIterator084
     * @tc.desc Verify .next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array();
      const iter = values.$_iterator();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8500
     * @tc.name testUint32ArrayIterator085
     * @tc.desc Verify $_iterator ( [index,value] entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const valIter = values.$_iterator();
      const entIter = values.entries();
      const vr = valIter.next();
      const er = entIter.next();
      expect(vr.value).assertEqual(10);
      expect(er.value![1]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8600
     * @tc.name testUint32ArrayIterator086
     * @tc.desc Verify $_iterator ( keys)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const valIter = values.$_iterator();
      const keyIter = values.keys();
      const vr = valIter.next();
      const kr = keyIter.next();
      expect(vr.value).assertEqual(10);
      expect(kr.value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8700
     * @tc.name testUint32ArrayIterator087
     * @tc.desc Verify for...of forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let forOfSum: number = 0;
      for (const v of values) {
        forOfSum = forOfSum + v;
      }
      let forEachSum: number = 0;
      values.forEach((value, index, array) => {
        forEachSum = forEachSum + value;
      });
      expect(forOfSum).assertEqual(forEachSum);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8800
     * @tc.name testUint32ArrayIterator088
     * @tc.desc Verify $_iterator map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 6, 7);
      const mapped = values.map((value, index, array) => value);
      const origIter = values.$_iterator();
      const mapIter = mapped.$_iterator();
      expect(origIter.next().value).assertEqual(mapIter.next().value);
      expect(origIter.next().value).assertEqual(mapIter.next().value);
      expect(origIter.next().value).assertEqual(mapIter.next().value);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_8900
     * @tc.name testUint32ArrayIterator089
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(255, 256);
      const iter = values.$_iterator();
      const s0 = iter.next().value!.toString();
      const s1 = iter.next().value!.toString();
      expect(s0 + "," + s1).assertEqual(values.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9000
     * @tc.name testUint32ArrayIterator090
     * @tc.desc Verify toReversed empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const rev = values.toReversed();
      expect(rev.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9100
     * @tc.name testUint32ArrayIterator091
     * @tc.desc Verify toReversed single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      const rev = values.toReversed();
      expect(rev.$_get(0)).assertEqual(42);
      expect(rev.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9200
     * @tc.name testUint32ArrayIterator092
     * @tc.desc Verify toReversed original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const before = values.$_get(0);
      values.toReversed();
      expect(values.$_get(0)).assertEqual(before);
      expect(values.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9300
     * @tc.name testUint32ArrayIterator093
     * @tc.desc Verify toSorted empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const sorted = values.toSorted();
      expect(sorted.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9400
     * @tc.name testUint32ArrayIterator094
     * @tc.desc Verify toSorted single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const sorted = values.toSorted();
      expect(sorted.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9500
     * @tc.name testUint32ArrayIterator095
     * @tc.desc Verify toSorted with duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 30, 20);
      const sorted = values.toSorted();
      expect(sorted.$_get(0)).assertEqual(10);
      expect(sorted.$_get(1)).assertEqual(20);
      expect(sorted.$_get(2)).assertEqual(30);
      expect(sorted.$_get(3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9600
     * @tc.name testUint32ArrayIterator096
     * @tc.desc Verify values independent iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const itA = values.values();
      const itB = values.values();
      itA.next();
      itA.next();
      expect(itB.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9700
     * @tc.name testUint32ArrayIterator097
     * @tc.desc Verify values empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const iter = values.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9800
     * @tc.name testUint32ArrayIterator098
     * @tc.desc Verify values exhausts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      const iter = values.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_ITERATOR_9900
     * @tc.name testUint32ArrayIterator099
     * @tc.desc Verify values for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIterator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 10, 15);
      let sum: number = 0;
      for (const v of values.values()) {
        sum += v;
      }
      expect(sum).assertEqual(30);
    });

  });
}
