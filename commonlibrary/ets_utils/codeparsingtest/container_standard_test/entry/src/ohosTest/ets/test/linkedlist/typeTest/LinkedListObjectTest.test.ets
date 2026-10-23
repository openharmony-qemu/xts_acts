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

interface ArrayObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}

interface ObjectInvalidObject {
  marker: string;
}

const OBJECT_INVALID_OBJECT: ObjectInvalidObject = { marker: 'invalid' };

const OBJECT_A: ArrayObjectItem = { id: 1, label: '', name: '测试', age: 20 };
const OBJECT_B: ArrayObjectItem = { id: 2, label: '测试😀', grade: 3, className: 'A' };
const OBJECT_C: ArrayObjectItem = { id: 3, label: 'a'.repeat(100), extra: Number.MAX_SAFE_INTEGER };
const OBJECT_D: ArrayObjectItem = { id: 4, label: '13800138000', name: '138****8000' };
const OBJECT_E: ArrayObjectItem = { id: 5, label: 'test@example.com' };
const OBJECT_F: ArrayObjectItem = { id: 6, label: 'https://test.com', grade: -1 };

const VALID_VALUES: Array<ArrayObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];

type ObjectAllValue = ArrayObjectItem | number | string | null | undefined | ObjectInvalidObject;

const ALL_VALUES: Array<ObjectAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, OBJECT_INVALID_OBJECT,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListObjectTest() {
  describe('LinkedListObjectTest', () => {
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
     * @tc.name   testLinkedListObjectTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_OBJECT_0100
     * @tc.desc   Verify LinkedList plain object constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(OBJECT_A);
      expect(list.get(6)).assertEqual(OBJECT_A);
      expect(list.get(2).label.length).assertEqual(100);

      const mixed: LinkedList<ObjectAllValue> = new LinkedList<ObjectAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(OBJECT_A);
    });

    /**
     * @tc.name   testLinkedListObjectTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_OBJECT_0200
     * @tc.desc   Verify LinkedList plain object addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_A);

      list.addFirst(OBJECT_C);
      expect(list.get(0)).assertEqual(OBJECT_C);
      expect(list.length).assertEqual(4);

      expect(list.has(OBJECT_A)).assertTrue();
      expect(list.has({ id: 1, label: '', name: '测试', age: 20 })).assertFalse();
      expect(list.getIndexOf(OBJECT_A)).assertEqual(1);
      expect(list.getLastIndexOf(OBJECT_A)).assertEqual(3);
      expect(list.getIndexOf(OBJECT_D)).assertEqual(-1);

      list.insert(0, OBJECT_D);
      expect(list.get(0)).assertEqual(OBJECT_D);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListObjectTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_OBJECT_0300
     * @tc.desc   Verify LinkedList plain object removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_C);
      list.add(OBJECT_D);

      const removed: ArrayObjectItem = list.removeByIndex(3);
      expect(removed).assertEqual(OBJECT_D);
      expect(list.length).assertEqual(3);

      expect(list.remove(OBJECT_A)).assertTrue();
      expect(list.get(0)).assertEqual(OBJECT_B);
      expect(list.remove(OBJECT_E)).assertFalse();

      const first: ArrayObjectItem = list.removeFirst();
      expect(first).assertEqual(OBJECT_B);
      expect(list.length).assertEqual(1);

      const last: ArrayObjectItem = list.removeLast();
      expect(last).assertEqual(OBJECT_C);
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      dupList.add(OBJECT_F);
      dupList.add(OBJECT_E);
      dupList.add(OBJECT_F);
      dupList.add(OBJECT_F);
      expect(dupList.removeFirstFound(OBJECT_F)).assertTrue();
      expect(dupList.get(0)).assertEqual(OBJECT_E);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(OBJECT_F)).assertTrue();
      expect(dupList.getLastIndexOf(OBJECT_F)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListObjectTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_OBJECT_0400
     * @tc.desc   Verify LinkedList plain object set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_C);

      const old: ArrayObjectItem = list.set(1, OBJECT_F);
      expect(old).assertEqual(OBJECT_F);
      expect(list.get(1)).assertEqual(OBJECT_F);
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<ArrayObjectItem> = list.clone();
      cloned.add(OBJECT_D);
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned.get(0).id).assertEqual(list.get(0).id);

      const arr: Array<ArrayObjectItem> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0].id).assertEqual(OBJECT_A.id);
      expect(arr instanceof Array).assertTrue();

      const ids: Array<number> = [];
      list.forEach((value: ArrayObjectItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[2]).assertEqual(3);

      let indexSum: number = 0;
      list.forEach((value: ArrayObjectItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<ArrayObjectItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertEqual(list.get(2));
    });

    /**
     * @tc.name   testLinkedListObjectTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_OBJECT_0500
     * @tc.desc   Verify LinkedList plain object getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      list.add(OBJECT_F);
      list.add(OBJECT_A);
      list.add(OBJECT_C);

      expect(list.getFirst()).assertEqual(OBJECT_F);
      expect(list.getLast()).assertEqual(OBJECT_C);
      expect(list.get(0)).assertEqual(OBJECT_F);
      expect(list.get(list.length - 1)).assertEqual(OBJECT_C);
      expect(list.get(1)).assertEqual(OBJECT_A);

      const single: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      single.add(OBJECT_E);
      expect(single.getFirst()).assertEqual(OBJECT_E);
      expect(single.getLast()).assertEqual(OBJECT_E);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(44)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListObjectTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_OBJECT_0600
     * @tc.desc   Verify LinkedList plain object removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<ArrayObjectItem> = new LinkedList<ArrayObjectItem>();
      list.add(OBJECT_A);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(10);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(44, OBJECT_B);
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
