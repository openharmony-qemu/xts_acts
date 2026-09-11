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

interface SetInvalidObject {
  marker: string;
}

const SET_INVALID_OBJECT: SetInvalidObject = { marker: 'invalid' };

const SET_A: Set<number> = new Set<number>([1]);
const SET_B: Set<number> = new Set<number>([2]);
const SET_C: Set<number> = new Set<number>([3]);
const SET_D: Set<number> = new Set<number>([0, -1]);
const SET_E: Set<number> = new Set<number>([NaN, Infinity]);
const SET_F: Set<number> = new Set<number>([Number.MAX_SAFE_INTEGER]);
const SET_G: Set<number> = new Set<number>();

const VALID_VALUES: Array<Set<number>> = [SET_A, SET_B, SET_C, SET_D, SET_E, SET_F, SET_G, SET_A];

type SetInvalidValue = string | number | null | undefined | SetInvalidObject | Array<number>;
type SetAllValue = Set<number> | SetInvalidValue;

const ALL_VALUES: Array<SetAllValue> = [
  ...VALID_VALUES,
  '1', 123, null, undefined, SET_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListSetTest() {
  describe('LinkedListSetTest', () => {
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
     * @tc.name   testLinkedListSetTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_SET_0100
     * @tc.desc   Verify LinkedList Set constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(SET_A);
      expect(list.get(7)).assertEqual(SET_A);
      expect(list.get(6).size).assertEqual(0);

      const mixed: LinkedList<SetAllValue> = new LinkedList<SetAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(SET_A);
    });

    /**
     * @tc.name   testLinkedListSetTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_SET_0200
     * @tc.desc   Verify LinkedList Set addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_A);

      list.addFirst(SET_C);
      expect(list.get(0)).assertEqual(SET_C);
      expect(list.length).assertEqual(4);

      expect(list.has(SET_A)).assertTrue();
      expect(list.has(SET_D)).assertFalse();
      expect(list.getIndexOf(SET_A)).assertEqual(1);
      expect(list.getLastIndexOf(SET_A)).assertEqual(3);
      expect(list.getIndexOf(SET_G)).assertEqual(-1);

      list.insert(0, SET_D);
      expect(list.get(0)).assertEqual(SET_D);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListSetTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_SET_0300
     * @tc.desc   Verify LinkedList Set removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_C);
      list.add(SET_D);

      const removed: Set<number> = list.removeByIndex(2);
      expect(removed).assertEqual(SET_C);
      expect(list.length).assertEqual(3);

      expect(list.remove(SET_B)).assertTrue();
      expect(list.get(0)).assertEqual(SET_A);
      expect(list.remove(SET_E)).assertFalse();

      const first: Set<number> = list.removeFirst();
      expect(first).assertEqual(SET_A);
      expect(list.length).assertEqual(1);

      const last: Set<number> = list.removeLast();
      expect(last).assertEqual(SET_D);
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      dupList.add(SET_E);
      dupList.add(SET_F);
      dupList.add(SET_E);
      dupList.add(SET_E);
      expect(dupList.removeFirstFound(SET_E)).assertTrue();
      expect(dupList.get(0)).assertEqual(SET_F);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(SET_E)).assertTrue();
      expect(dupList.getLastIndexOf(SET_E)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListSetTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_SET_0400
     * @tc.desc   Verify LinkedList Set set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_D);

      const old: Set<number> = list.set(1, SET_F);
      expect(old).assertEqual(SET_F);
      expect(list.get(1)).assertEqual(SET_F);
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<Set<number>> = list.clone();
      cloned.add(SET_G);
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned.get(0).size).assertEqual(list.get(0).size);

      const arr: Array<Set<number>> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0].size).assertEqual(SET_A.size);
      expect(arr instanceof Array).assertTrue();

      const sizes: Array<number> = [];
      list.forEach((value: Set<number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[2]).assertEqual(2);

      let indexSum: number = 0;
      list.forEach((value: Set<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Set<number>> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertEqual(list.get(2));
    });

    /**
     * @tc.name   testLinkedListSetTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_SET_0500
     * @tc.desc   Verify LinkedList Set getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      list.add(SET_D);
      list.add(SET_A);
      list.add(SET_E);

      expect(list.getFirst()).assertEqual(SET_D);
      expect(list.getLast()).assertEqual(SET_E);
      expect(list.get(0)).assertEqual(SET_D);
      expect(list.get(list.length - 1)).assertEqual(SET_E);
      expect(list.get(1)).assertEqual(SET_A);

      const single: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      single.add(SET_F);
      expect(single.getFirst()).assertEqual(SET_F);
      expect(single.getLast()).assertEqual(SET_F);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(55)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListSetTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_SET_0600
     * @tc.desc   Verify LinkedList Set removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListSetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Set<number>> = new LinkedList<Set<number>>();
      list.add(SET_A);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(9);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(55, SET_B);
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
