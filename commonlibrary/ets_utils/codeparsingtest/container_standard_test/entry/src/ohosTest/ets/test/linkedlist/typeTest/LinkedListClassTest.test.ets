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

interface ClassInvalidObject {
  marker: string;
}

const CLASS_INVALID_OBJECT: ClassInvalidObject = { marker: 'invalid' };

class LinkedListClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const CLASS_A = new LinkedListClassItem(1, '测试');
const CLASS_B = new LinkedListClassItem(0, '');
const CLASS_C = new LinkedListClassItem(-1, '测试😀');
const CLASS_D = new LinkedListClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E = new LinkedListClassItem(13800138000, '13800138000');
const CLASS_F = new LinkedListClassItem(99999999, '<script>alert(1)</script>');

const VALID_VALUES: Array<LinkedListClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];

type ClassInvalidValue = number | string | null | undefined | ClassInvalidObject | Array<number>;
type ClassAllValue = LinkedListClassItem | ClassInvalidValue;

const ALL_VALUES: Array<ClassAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, CLASS_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListClassTest() {
  describe('LinkedListClassTest', () => {
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
     * @tc.name   testLinkedListClassTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_CLASS_0100
     * @tc.desc   Verify LinkedList class instance constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(CLASS_A);
      expect(list.get(6)).assertEqual(CLASS_A);
      expect(list.get(3).label.length).assertEqual(100);

      const mixed: LinkedList<ClassAllValue> = new LinkedList<ClassAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(CLASS_A);
    });

    /**
     * @tc.name   testLinkedListClassTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_CLASS_0200
     * @tc.desc   Verify LinkedList class instance addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_A);

      list.addFirst(CLASS_C);
      expect(list.get(0)).assertEqual(CLASS_C);
      expect(list.length).assertEqual(4);

      expect(list.has(CLASS_A)).assertTrue();
      expect(list.has(new LinkedListClassItem(1, '测试'))).assertFalse();
      expect(list.getIndexOf(CLASS_A)).assertEqual(1);
      expect(list.getLastIndexOf(CLASS_A)).assertEqual(3);
      expect(list.getIndexOf(CLASS_D)).assertEqual(-1);

      list.insert(0, CLASS_D);
      expect(list.get(0)).assertEqual(CLASS_D);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListClassTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_CLASS_0300
     * @tc.desc   Verify LinkedList class instance removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_C);
      list.add(CLASS_D);

      const removed: LinkedListClassItem = list.removeByIndex(1);
      expect(removed).assertEqual(CLASS_B);
      expect(list.length).assertEqual(3);
      expect(list.get(1)).assertEqual(CLASS_C);

      expect(list.remove(CLASS_A)).assertTrue();
      expect(list.get(0)).assertEqual(CLASS_C);
      expect(list.remove(CLASS_E)).assertFalse();

      const first: LinkedListClassItem = list.removeFirst();
      expect(first).assertEqual(CLASS_C);
      expect(list.length).assertEqual(1);

      const last: LinkedListClassItem = list.removeLast();
      expect(last).assertEqual(CLASS_D);
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      dupList.add(CLASS_F);
      dupList.add(CLASS_E);
      dupList.add(CLASS_F);
      dupList.add(CLASS_F);
      expect(dupList.removeFirstFound(CLASS_F)).assertTrue();
      expect(dupList.get(0)).assertEqual(CLASS_E);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(CLASS_F)).assertTrue();
      expect(dupList.getLastIndexOf(CLASS_F)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListClassTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_CLASS_0400
     * @tc.desc   Verify LinkedList class instance set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_C);

      const old: LinkedListClassItem = list.set(1, CLASS_D);
      expect(old).assertEqual(CLASS_D);
      expect(list.get(1)).assertEqual(CLASS_D);
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<LinkedListClassItem> = list.clone();
      cloned.add(CLASS_E);
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned.get(0).id).assertEqual(list.get(0).id);

      const arr: Array<LinkedListClassItem> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(CLASS_A);
      expect(arr instanceof Array).assertTrue();

      const ids: Array<number> = [];
      list.forEach((value: LinkedListClassItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);

      let indexSum: number = 0;
      list.forEach((value: LinkedListClassItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<LinkedListClassItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertEqual(list.get(2));
    });

    /**
     * @tc.name   testLinkedListClassTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_CLASS_0500
     * @tc.desc   Verify LinkedList class instance getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      list.add(CLASS_C);
      list.add(CLASS_A);
      list.add(CLASS_B);

      expect(list.getFirst()).assertEqual(CLASS_C);
      expect(list.getLast()).assertEqual(CLASS_B);
      expect(list.get(0)).assertEqual(CLASS_C);
      expect(list.get(list.length - 1)).assertEqual(CLASS_B);
      expect(list.get(1)).assertEqual(CLASS_A);

      const single: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      single.add(CLASS_E);
      expect(single.getFirst()).assertEqual(CLASS_E);
      expect(single.getLast()).assertEqual(CLASS_E);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(66)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListClassTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_CLASS_0600
     * @tc.desc   Verify LinkedList class instance removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListClassItem> = new LinkedList<LinkedListClassItem>();
      list.add(CLASS_A);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(7);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(66, CLASS_B);
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
