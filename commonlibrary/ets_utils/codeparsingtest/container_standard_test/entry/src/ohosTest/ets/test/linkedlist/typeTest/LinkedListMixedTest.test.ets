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
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { LinkedList } from '@kit.ArkTS';

interface MixedInvalidObject {
  marker: string;
}

const MIXED_INVALID_OBJECT: MixedInvalidObject = { marker: 'invalid' };



class MixedClass {
  value: number;

  constructor(value: number) {
    this.value = value;
  }
}

type MixedItem = number | string | boolean | bigint | null | undefined | MixedClass | MixedInvalidObject | Array<number>;

const MIXED_VALUES: Array<MixedItem> = [
  1, 'text', true, 100n, null, undefined, 'sym', new MixedClass(7), MIXED_INVALID_OBJECT, [1, 2],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListMixedTest() {
  describe('LinkedListMixedTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name   testLinkedListMixedTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_MIXED_0100
     * @tc.desc   Verify LinkedList mixed union type constructor length, add and get of number, string, boolean, bigint, null, undefined and symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMixedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      for (let i = 0; i < MIXED_VALUES.length; i++) {
        expect(list.add(MIXED_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(MIXED_VALUES.length);
      expect(list.get(0)).assertEqual(1);
      expect(list.get(1)).assertEqual('text');
      expect(list.get(2)).assertTrue();
      expect(list.get(3)).assertEqual(100n);
      expect(list.get(4)).assertNull();
      expect(list.get(5)).assertUndefined();
      expect(list.get(6)).assertEqual('sym');
      expect(list.get(9)).assertEqual(MIXED_VALUES[9]);
    });

    /**
     * @tc.name   testLinkedListMixedTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_MIXED_0200
     * @tc.desc   Verify LinkedList mixed union type addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMixedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      const obj: MixedClass = new MixedClass(1);
      list.add(obj);
      list.add('dup');
      list.add(obj);

      list.addFirst(0);
      expect(list.get(0)).assertEqual(0);
      expect(list.length).assertEqual(4);

      expect(list.has(obj)).assertTrue();
      expect(list.has(new MixedClass(1))).assertFalse();
      expect(list.getIndexOf(obj)).assertEqual(1);
      expect(list.getLastIndexOf(obj)).assertEqual(3);
      expect(list.getIndexOf('dup')).assertEqual(2);
      expect(list.getIndexOf('missing')).assertEqual(-1);

      list.insert(0, null);
      expect(list.get(0)).assertNull();
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListMixedTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_MIXED_0300
     * @tc.desc   Verify LinkedList mixed union type removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMixedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      list.add(1);
      list.add('b');
      list.add(true);
      list.add(null);
      list.add(false);

      const removed: MixedItem = list.removeByIndex(1);
      expect(removed).assertEqual('b');
      expect(list.length).assertEqual(4);

      expect(list.remove(true)).assertTrue();
      expect(list.get(1)).assertNull();
      expect(list.remove(999)).assertFalse();

      const first: MixedItem = list.removeFirst();
      expect(first).assertEqual(1);
      expect(list.length).assertEqual(2);

      const last: MixedItem = list.removeLast();
      expect(last).assertFalse();
      expect(list.length).assertEqual(1);

      const dupList: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      const dupObj: MixedClass = new MixedClass(5);
      dupList.add(dupObj);
      dupList.add('x');
      dupList.add(dupObj);
      dupList.add(dupObj);
      expect(dupList.removeFirstFound(dupObj)).assertTrue();
      expect(dupList.get(0)).assertEqual('x');
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(dupObj)).assertTrue();
      expect(dupList.getLastIndexOf(dupObj)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListMixedTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_MIXED_0400
     * @tc.desc   Verify LinkedList mixed union type set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMixedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      list.add(1);
      list.add(2);
      list.add('skip');

      const old: MixedItem = list.set(2, 3);
      expect(old).assertEqual(3);
      expect(list.get(2)).assertEqual(3);
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<MixedItem> = list.clone();
      cloned.add('new');
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned.get(2)).assertEqual(list.get(2));

      const arr: Array<MixedItem> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr instanceof Array).assertTrue();

      const numbers: Array<number> = [];
      list.forEach((value: MixedItem) => {
        if (typeof value === 'number') {
          numbers.push(value);
        }
      });
      expect(numbers.length).assertEqual(3);
      expect(numbers[2]).assertEqual(3);

      let indexSum: number = 0;
      list.forEach((value: MixedItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<MixedItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListMixedTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_MIXED_0500
     * @tc.desc   Verify LinkedList mixed union type getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMixedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      list.add(30);
      list.add('10');
      list.add(20);

      expect(list.getFirst()).assertEqual(30);
      expect(list.getLast()).assertEqual(20);
      expect(list.get(0)).assertEqual(30);
      expect(list.get(list.length - 1)).assertEqual(20);
      expect(list.get(1)).assertEqual('10');

      const single: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      single.add(false);
      expect(single.getFirst()).assertFalse();
      expect(single.getLast()).assertFalse();

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(31)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListMixedTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_MIXED_0600
     * @tc.desc   Verify LinkedList mixed union type removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMixedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<MixedItem> = new LinkedList<MixedItem>();
      list.add(1);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(70);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(31, 'out');
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.getFirst()).assertUndefined();
      expect(list.getLast()).assertUndefined();
      expect(list.clone().length).assertEqual(0);
    });
  });
}
