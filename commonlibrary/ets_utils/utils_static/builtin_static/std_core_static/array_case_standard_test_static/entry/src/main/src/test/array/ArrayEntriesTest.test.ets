'use static';
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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class EntryItem010 {
  value: int = 0;
}

class EntryObject014 {
  id: int = 0;
  name: string = '';
}

class EntrySummary029 {
  zero: string = '';
  one: string = '';
  two: string = '';
}

export default function ArrayEntriesTest(): void {
  describe('ArrayEntriesTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0100
     * @tc.name testArrayEntries001
     * @tc.desc Verify entries returns an iterator object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iterator = arr.entries();
      const nextType = iterator.next;
      expect(iterator != null).assertTrue();
      expect(nextType.name).assertEqual('next');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0200
     * @tc.name testArrayEntries002
     * @tc.desc Verify entries yields index value pairs in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const iterator = arr.entries();

      const first = iterator.next();
      const second = iterator.next();
      const third = iterator.next();
      const end = iterator.next();

      const firstEntry = first.value as [int, int] | undefined;
      const secondEntry = second.value as [int, int] | undefined;
      const thirdEntry = third.value as [int, int] | undefined;
      if (firstEntry != undefined && secondEntry != undefined && thirdEntry != undefined) {
        expect(firstEntry[0]).assertEqual(0);
        expect(firstEntry[1]).assertEqual(10);
        expect(secondEntry[0]).assertEqual(1);
        expect(secondEntry[1]).assertEqual(20);
        expect(thirdEntry[0]).assertEqual(2);
        expect(thirdEntry[1]).assertEqual(30);
      }else {
        expect().assertFail();
      }
      expect(end.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0300
     * @tc.name testArrayEntries003
     * @tc.desc Verify entries does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const original = arr.toString();
      arr.entries();
      expect(arr.toString()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0400
     * @tc.name testArrayEntries004
     * @tc.desc Verify empty arrays finish iteration immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const result = arr.entries().next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0500
     * @tc.name testArrayEntries005
     * @tc.desc Verify entries works with single-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(42);
      const iterator = arr.entries();
      const first = iterator.next().value as [int, int] | undefined;
      const end = iterator.next();
      if (first != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertEqual(42);
      }else {
        expect().assertFail();
      }
      expect(end.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0600
     * @tc.name testArrayEntries006
     * @tc.desc Verify entries works with string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const first = arr.entries().next().value as [int, string] | undefined;
      if (first != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertEqual('a');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0700
     * @tc.name testArrayEntries007
     * @tc.desc Verify entries works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      const iterator = arr.entries();
      const first = iterator.next().value as [int, boolean] | undefined;
      const second = iterator.next().value as [int, boolean] | undefined;
      if (first != undefined && second != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertTrue();
        expect(second[0]).assertEqual(1);
        expect(second[1]).assertFalse();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0800
     * @tc.name testArrayEntries008
     * @tc.desc Verify multiple entries iterators are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iterator1 = arr.entries();
      const iterator2 = arr.entries();
      const first1 = iterator1.next().value as [int, int] | undefined;
      const first2 = iterator2.next().value as [int, int] | undefined;
      expect(iterator1 === iterator2).assertFalse();
      if (first1 != undefined && first2 != undefined) {
        expect(first1[0]).assertEqual(0);
        expect(first2[0]).assertEqual(0);
        expect(first1[1]).assertEqual(first2[1]);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0900
     * @tc.name testArrayEntries009
     * @tc.desc Verify entries can be compared with keys and values iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const entry = arr.entries().next().value as [int, int] | undefined;
      const key = arr.keys().next().value as int;
      const value = arr.values().next().value as int;
      if (entry != undefined) {
        expect(entry[0]).assertEqual(key);
        expect(entry[1]).assertEqual(value);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1000
     * @tc.name testArrayEntries010
     * @tc.desc Verify entries preserves object references in iterator values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new EntryItem010();
      item1.value = 1;
      const item2 = new EntryItem010();
      item2.value = 2;
      const arr = new Array<EntryItem010>(item1, item2);
      const entry = arr.entries().next().value as [int, EntryItem010] | undefined;
      if (entry != undefined) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1] === item1).assertTrue();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1100
     * @tc.name testArrayEntries011
     * @tc.desc Verify entries supports while-loop traversal of all pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const iterator = arr.entries();
      let sum = 0;
      let indexSum = 0;
      let result = iterator.next();
      while (!result.done) {
        const entry = result.value as [int, int] | undefined;
        if (entry != undefined) {
          indexSum += entry[0];
          sum += entry[1];
        }else {
          expect().assertFail();
        }
        result = iterator.next();
      }
      expect(sum).assertEqual(15);
      expect(indexSum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1200
     * @tc.name testArrayEntries012
     * @tc.desc Verify entries works for arrays that include undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, undefined, 3);
      const iterator = arr.entries();
      iterator.next();
      const second = iterator.next().value as [int, int | undefined] | undefined;
      if (second != undefined) {
        expect(second[0]).assertEqual(1);
        expect(second[1]).assertUndefined();
      }else {
        expect().assertFail();
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1300
     * @tc.name testArrayEntries013
     * @tc.desc Verify entries works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const iterator = arr.entries();
      const first = iterator.next().value as [int, boolean] | undefined;
      const second = iterator.next().value as [int, boolean] | undefined;
      if (first != undefined && second != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertTrue();
        expect(second[0]).assertEqual(1);
        expect(second[1]).assertFalse();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1400
     * @tc.name testArrayEntries014
     * @tc.desc Verify entries works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstItem = new EntryObject014();
      firstItem.id = 1;
      firstItem.name = 'first';
      const secondItem = new EntryObject014();
      secondItem.id = 2;
      secondItem.name = 'second';
      const arr = new Array<EntryObject014>(firstItem, secondItem);
      const iterator = arr.entries();
      const secondEntry = iterator.next();
      const target = iterator.next().value as [int, EntryObject014] | undefined;
      if (target != undefined) {
        expect(target[0]).assertEqual(1);
        expect(target[1] === secondItem).assertTrue();
        expect(target[1].name).assertEqual('second');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1500
     * @tc.name testArrayEntries015
     * @tc.desc Verify entries works with mixed primitive arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string | boolean>(7, 'arkts', true);
      const iterator = arr.entries();
      const first = iterator.next().value as [int, int | string | boolean] | undefined;
      const second = iterator.next().value as [int, int | string | boolean] | undefined;
      const third = iterator.next().value as [int, int | string | boolean] | undefined;
      if (first != undefined && second != undefined && third != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertEqual(7);
        expect(second[0]).assertEqual(1);
        expect(second[1]).assertEqual('arkts');
        expect(third[0]).assertEqual(2);
        expect(third[1]).assertTrue();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1600
     * @tc.name testArrayEntries016
     * @tc.desc Verify next returns entry state transitions in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iterator = new Array<int>(11, 22).entries();
      const first = iterator.next();
      const second = iterator.next();
      const end = iterator.next();
      expect(first.done).assertFalse();
      expect(second.done).assertFalse();
      expect(end.done).assertTrue();
      const firstEntry = first.value as [int, int] | undefined;
      const secondEntry = second.value as [int, int] | undefined;
      if (firstEntry != undefined && secondEntry != undefined) {
        expect(firstEntry[0]).assertEqual(0);
        expect(firstEntry[1]).assertEqual(11);
        expect(secondEntry[0]).assertEqual(1);
        expect(secondEntry[1]).assertEqual(22);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1700
     * @tc.name testArrayEntries017
     * @tc.desc Verify entries preserves source order during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('first', 'second', 'third');
      const iterator = arr.entries();
      let order = '';
      let next = iterator.next();
      while (!next.done) {
        const entry = next.value as [int, string] | undefined;
        if (entry != undefined) {
          order += entry[0] + ':' + entry[1] + ';';
        }else {
          expect().assertFail();
        }
        next = iterator.next();
      }
      expect(order).assertEqual('0:first;1:second;2:third;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1800
     * @tc.name testArrayEntries018
     * @tc.desc Verify done stays true after the iterator is exhausted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(5);
      const iterator = arr.entries();
      const first = iterator.next();
      const end1 = iterator.next();
      const end2 = iterator.next();
      expect(first.done).assertFalse();
      expect(end1.done).assertTrue();
      expect(end2.done).assertTrue();
      expect(end1.value).assertUndefined();
      expect(end2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1900
     * @tc.name testArrayEntries019
     * @tc.desc Verify each iterator result exposes a two-item entry tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<int>(9, 18).entries().next();
      const entry = result.value as [int, int] | undefined;
      expect(result.done).assertFalse();
      if (entry != undefined) {
        expect(entry.length).assertEqual(2);
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(9);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2000
     * @tc.name testArrayEntries020
     * @tc.desc Verify entries indexes stay aligned with keys iterator output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const entryIterator = arr.entries();
      const keyIterator = arr.keys();
      const firstEntry = entryIterator.next().value as [int, int] | undefined;
      const firstKey = keyIterator.next().value as int;
      const secondEntry = entryIterator.next().value as [int, int] | undefined;
      const secondKey = keyIterator.next().value as int;
      if (firstEntry != undefined && secondEntry != undefined) {
        expect(firstEntry[0]).assertEqual(firstKey);
        expect(secondEntry[0]).assertEqual(secondKey);
        expect(firstEntry[1]).assertEqual(10);
        expect(secondEntry[1]).assertEqual(20);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2100
     * @tc.name testArrayEntries021
     * @tc.desc Verify entries can be used alongside keys and values iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C');
      const entry = arr.entries().next().value as [int, string] | undefined;
      const key = arr.keys().next().value as int;
      const value = arr.values().next().value as string;
      if (entry != undefined) {
        expect(entry[0]).assertEqual(key);
        expect(entry[1]).assertEqual(value);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2200
     * @tc.name testArrayEntries022
     * @tc.desc Verify entry values stay aligned with the values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(4, 8, 12);
      const entryIterator = arr.entries();
      const valueIterator = arr.values();
      const firstEntry = entryIterator.next().value as [int, int] | undefined;
      const firstValue = valueIterator.next().value as int;
      const secondEntry = entryIterator.next().value as [int, int] | undefined;
      const secondValue = valueIterator.next().value as int;
      if (firstEntry != undefined && secondEntry != undefined) {
        expect(firstEntry[1]).assertEqual(firstValue);
        expect(secondEntry[1]).assertEqual(secondValue);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2300
     * @tc.name testArrayEntries023
     * @tc.desc Verify entries is convenient when both index and value are needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 15, 25, 35);
      let locatedIndex = -1;
      let locatedValue = -1;
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        if (entry[1] > 20) {
          locatedIndex = entry[0];
          locatedValue = entry[1];
          break;
        }
      }
      expect(locatedIndex).assertEqual(2);
      expect(locatedValue).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2400
     * @tc.name testArrayEntries024
     * @tc.desc Verify iterating entries does not mutate the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('left', 'middle', 'right');
      const snapshot = arr.toString();
      let visited = 0;
      for (const pair of arr.entries()) {
        const entry = pair as [int, string];
        visited++;
      }
      expect(visited).assertEqual(3);
      expect(arr.toString()).assertEqual(snapshot);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2500
     * @tc.name testArrayEntries025
     * @tc.desc Verify two entries iterators keep independent states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100, 200, 300);
      const iterator1 = arr.entries();
      const iterator2 = arr.entries();
      const first1 = iterator1.next().value as [int, int] | undefined;
      const second1 = iterator1.next().value as [int, int] | undefined;
      const first2 = iterator2.next().value as [int, int] | undefined;
      if (first1 != undefined && second1 != undefined && first2 != undefined) {
        expect(first1[0]).assertEqual(0);
        expect(second1[0]).assertEqual(1);
        expect(first2[0]).assertEqual(0);
        expect(second1[1]).assertEqual(200);
        expect(first2[1]).assertEqual(100);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2600
     * @tc.name testArrayEntries026
     * @tc.desc Verify entries supports for-of traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 6, 9);
      let indexTotal = 0;
      let valueTotal = 0;
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        indexTotal += entry[0];
        valueTotal += entry[1];
      }
      expect(indexTotal).assertEqual(3);
      expect(valueTotal).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2700
     * @tc.name testArrayEntries027
     * @tc.desc Verify each entry can directly index back into the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'green', 'blue');
      for (const pair of arr.entries()) {
        const entry = pair as [int, string];
        expect(arr[entry[0]]).assertEqual(entry[1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2800
     * @tc.name testArrayEntries028
     * @tc.desc Verify entries can drive conditional filtering logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 15, 20, 25, 30);
      const filtered = new Array<string>();
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        if (entry[0] % 2 == 0 && entry[1] >= 20) {
          filtered.pushOne(entry[0] + ':' + entry[1]);
        }
      }
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual('2:20');
      expect(filtered[1]).assertEqual('4:30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2900
     * @tc.name testArrayEntries029
     * @tc.desc Verify entries can be used to build an object-style summary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('zero', 'one', 'two');
      const summary = new EntrySummary029();
      for (const pair of arr.entries()) {
        const entry = pair as [int, string];
        if (entry[0] == 0) {
          summary.zero = entry[1];
        } else if (entry[0] == 1) {
          summary.one = entry[1];
        } else if (entry[0] == 2) {
          summary.two = entry[1];
        }
      }
      expect(summary.zero).assertEqual('zero');
      expect(summary.one).assertEqual('one');
      expect(summary.two).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3000
     * @tc.name testArrayEntries030
     * @tc.desc Verify entries preserves null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(null, 2, null);
      const iterator = arr.entries();
      const first = iterator.next().value as [int, int | null] | undefined;
      iterator.next();
      const third = iterator.next().value as [int, int | null] | undefined;
      if (first != undefined && third != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertNull();
        expect(third[0]).assertEqual(2);
        expect(third[1]).assertNull();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3100
     * @tc.name testArrayEntries031
     * @tc.desc Verify entries preserves undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(undefined, 2, undefined);
      const iterator = arr.entries();
      const first = iterator.next().value as [int, int | undefined] | undefined;
      iterator.next();
      const third = iterator.next().value as [int, int | undefined] | undefined;
      if (first != undefined && third != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertUndefined();
        expect(third[0]).assertEqual(2);
        expect(third[1]).assertUndefined();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3200
     * @tc.name testArrayEntries032
     * @tc.desc Verify entries preserves zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 5, 0);
      const iterator = arr.entries();
      const first = iterator.next().value as [int, int] | undefined;
      iterator.next();
      const third = iterator.next().value as [int, int] | undefined;
      if (first != undefined && third != undefined) {
        expect(first[1]).assertEqual(0);
        expect(third[1]).assertEqual(0);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3300
     * @tc.name testArrayEntries033
     * @tc.desc Verify entries preserves empty string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'filled');
      const iterator = arr.entries();
      const first = iterator.next().value as [int, string] | undefined;
      const second = iterator.next().value as [int, string] | undefined;
      if (first != undefined && second != undefined) {
        expect(first[1]).assertEqual('');
        expect(second[1]).assertEqual('filled');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3400
     * @tc.name testArrayEntries034
     * @tc.desc Verify generic object types remain intact through entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new EntryObject014();
      item.id = 99;
      item.name = 'generic';
      const entry = Array.create<EntryObject014>(1, item).entries().next().value as [int, EntryObject014] | undefined;
      if (entry != undefined) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1].id).assertEqual(99);
        expect(entry[1].name).assertEqual('generic');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3500
     * @tc.name testArrayEntries035
     * @tc.desc Verify entries works when array elements are tuples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<[string, int]>(['age', 18], ['score', 95]);
      const first = arr.entries().next().value as [int, [string, int]] | undefined;
      if (first != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1][0]).assertEqual('age');
        expect(first[1][1]).assertEqual(18);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3600
     * @tc.name testArrayEntries036
     * @tc.desc Verify entries behaves consistently across different generic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intArray = new Array<int>();
      intArray.pushOne(1);
      const stringArray = new Array<string>();
      stringArray.pushOne('one');
      const booleanArray = new Array<boolean>();
      booleanArray.pushOne(false);
      const intEntry = intArray.entries().next().value as [int, int] | undefined;
      const stringEntry = stringArray.entries().next().value as [int, string] | undefined;
      const booleanEntry = booleanArray.entries().next().value as [int, boolean] | undefined;
      if (intEntry != undefined && stringEntry != undefined && booleanEntry != undefined) {
        expect(intEntry[1]).assertEqual(1);
        expect(stringEntry[1]).assertEqual('one');
        expect(booleanEntry[1]).assertFalse();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3700
     * @tc.name testArrayEntries037
     * @tc.desc Verify entries can be combined with map-style transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const mapped = new Array<string>();
      for (const pair of arr.entries()) {
        const entry = pair as [int, string];
        mapped.pushOne(entry[0] + '-' + entry[1].toUpperCase());
      }
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual('0-A');
      expect(mapped[2]).assertEqual('2-C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3800
     * @tc.name testArrayEntries038
     * @tc.desc Verify entries can be combined with filter-style selection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 5, 8, 11, 14);
      const selected = new Array<int>();
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        if (entry[1] % 2 == 0 && entry[0] >= 2) {
          selected.pushOne(entry[1]);
        }
      }
      expect(selected.length).assertEqual(2);
      expect(selected[0]).assertEqual(8);
      expect(selected[1]).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3900
     * @tc.name testArrayEntries039
     * @tc.desc Verify entries can drive reduce-style accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      let weightedSum = 0;
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        weightedSum += entry[0] * entry[1];
      }
      expect(weightedSum).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4000
     * @tc.name testArrayEntries040
     * @tc.desc Verify large arrays can be fully traversed by entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 128; i++) {
        arr.pushOne(i * 2);
      }
      let count = 0;
      let lastValue = -1;
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        count++;
        lastValue = entry[1];
      }
      expect(count).assertEqual(128);
      expect(lastValue).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4100
     * @tc.name testArrayEntries041
     * @tc.desc Verify repeated entries creation always starts from the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(9, 8, 7);
      let firstValueTotal = 0;
      for (let i = 0; i < 5; i++) {
        const entry = arr.entries().next().value as [int, int] | undefined;
        if (entry != undefined) {
          expect(entry[0]).assertEqual(0);
          firstValueTotal += entry[1];
        }else {
          expect().assertFail();
        }
      }
      expect(firstValueTotal).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4200
     * @tc.name testArrayEntries042
     * @tc.desc Verify entries iterator follows the iterable protocol in for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iterator = new Array<int>(1, 2, 3).entries();
      const nextType = iterator.next;
      expect(nextType.name).assertEqual('next');
      let count = 0;
      for (const pair of iterator) {
        const entry = pair as [int, int];
        count += entry[1];
      }
      expect(count).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4300
     * @tc.name testArrayEntries043
     * @tc.desc Verify iterator result value behaves like an array entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<string>('x', 'y').entries().next();
      const entry = result.value as [int, string] | undefined;
      expect(result.done).assertFalse();
      if (entry != undefined) {
        expect(entry.length).assertEqual(2);
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual('x');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4400
     * @tc.name testArrayEntries044
     * @tc.desc Verify entries can locate the index of a matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta', 'gamma');
      let foundIndex = -1;
      for (const pair of arr.entries()) {
        const entry = pair as [int, string];
        if (entry[1] == 'beta') {
          foundIndex = entry[0];
          break;
        }
      }
      expect(foundIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4500
     * @tc.name testArrayEntries045
     * @tc.desc Verify entries can build a formatted key-value pair list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('sun', 'moon', 'star');
      const pairs = new Array<string>();
      for (const pair of arr.entries()) {
        const entry = pair as [int, string];
        pairs.pushOne('[' + entry[0] + ',' + entry[1] + ']');
      }
      expect(pairs.length).assertEqual(3);
      expect(pairs[0]).assertEqual('[0,sun]');
      expect(pairs[2]).assertEqual('[2,star]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4600
     * @tc.name testArrayEntries046
     * @tc.desc Verify entries supports index-based conditional processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 6, 9, 12, 15);
      let oddIndexSum = 0;
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        if (entry[0] % 2 == 1) {
          oddIndexSum += entry[1];
        }
      }
      expect(oddIndexSum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4700
     * @tc.name testArrayEntries047
     * @tc.desc Verify entries can build forward and reverse lookup summaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('north', 'south', 'east');
      const indexToValue = new Array<string>();
      const valueToIndex = new Array<string>();
      for (const pair of arr.entries()) {
        const entry = pair as [int, string];
        indexToValue.pushOne(entry[0] + '->' + entry[1]);
        valueToIndex.pushOne(entry[1] + '->' + entry[0]);
      }
      expect(indexToValue[1]).assertEqual('1->south');
      expect(valueToIndex[2]).assertEqual('east->2');
      expect(indexToValue.length).assertEqual(3);
      expect(valueToIndex.length).assertEqual(3);
    });

  });
}

