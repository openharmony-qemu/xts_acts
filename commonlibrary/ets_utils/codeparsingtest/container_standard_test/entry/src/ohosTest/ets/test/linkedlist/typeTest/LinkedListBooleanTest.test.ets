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

interface BooleanInvalidObject {
  marker: string;
}

const BOOLEAN_INVALID_OBJECT: BooleanInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<boolean> = [true, false, true, false];

type BooleanInvalidValue = number | string | null | undefined | BooleanInvalidObject | Array<number>;
type BooleanAllValue = boolean | BooleanInvalidValue;

const ALL_VALUES: Array<BooleanAllValue> = [
  ...VALID_VALUES,
  1, 0, NaN, 'true', 'false', null, undefined, '', BOOLEAN_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListBooleanTest() {
  describe('LinkedListBooleanTest', () => {
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
     * @tc.name   testLinkedListBooleanTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_BOOLEAN_0100
     * @tc.desc   Verify LinkedList boolean constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<boolean> = new LinkedList<boolean>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<boolean> = new LinkedList<boolean>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(4);
      expect(list.get(0)).assertTrue();
      expect(list.get(1)).assertFalse();
      expect(list.get(2)).assertTrue();

      const mixed: LinkedList<BooleanAllValue> = new LinkedList<BooleanAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(4)).assertEqual(1);
    });

    /**
     * @tc.name   testLinkedListBooleanTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_BOOLEAN_0200
     * @tc.desc   Verify LinkedList boolean addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<boolean> = new LinkedList<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);

      list.addFirst(false);
      expect(list.get(0)).assertFalse();
      expect(list.length).assertEqual(4);

      expect(list.has(true)).assertTrue();
      expect(list.has(false)).assertTrue();
      expect(list.getIndexOf(false)).assertEqual(0);
      expect(list.getLastIndexOf(true)).assertEqual(3);
      expect(list.getLastIndexOf(false)).assertEqual(2);

      list.insert(0, true);
      expect(list.get(0)).assertTrue();
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListBooleanTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_BOOLEAN_0300
     * @tc.desc   Verify LinkedList boolean removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<boolean> = new LinkedList<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);
      list.add(true);

      const removed: boolean = list.removeByIndex(1);
      expect(removed).assertFalse();
      expect(list.length).assertEqual(3);

      expect(list.remove(true)).assertTrue();
      expect(list.length).assertEqual(2);

      const first: boolean = list.removeFirst();
      expect(first).assertTrue();
      expect(list.length).assertEqual(1);

      const last: boolean = list.removeLast();
      expect(last).assertTrue();
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<boolean> = new LinkedList<boolean>();
      dupList.add(true);
      dupList.add(false);
      dupList.add(true);
      expect(dupList.removeFirstFound(true)).assertTrue();
      expect(dupList.get(0)).assertFalse();
      expect(dupList.length).assertEqual(2);
      expect(dupList.removeLastFound(true)).assertTrue();
      expect(dupList.has(true)).assertFalse();
      expect(dupList.length).assertEqual(1);
    });

    /**
     * @tc.name   testLinkedListBooleanTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_BOOLEAN_0400
     * @tc.desc   Verify LinkedList boolean set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<boolean> = new LinkedList<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);

      const old: boolean = list.set(1, true);
      expect(old).assertTrue();
      expect(list.get(1)).assertTrue();
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<boolean> = list.clone();
      cloned.add(false);
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);

      const arr: Array<boolean> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertTrue();
      expect(arr instanceof Array).assertTrue();

      let trueCount: number = 0;
      list.forEach((value: boolean) => {
        if (value) {
          trueCount++;
        }
      });
      expect(trueCount).assertEqual(3);

      let indexSum: number = 0;
      list.forEach((value: boolean, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<boolean> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertTrue();
    });

    /**
     * @tc.name   testLinkedListBooleanTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_BOOLEAN_0500
     * @tc.desc   Verify LinkedList boolean getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<boolean> = new LinkedList<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);
      list.add(false);

      expect(list.getFirst()).assertTrue();
      expect(list.getLast()).assertFalse();
      expect(list.get(0)).assertTrue();
      expect(list.get(list.length - 1)).assertFalse();

      const single: LinkedList<boolean> = new LinkedList<boolean>();
      single.add(true);
      expect(single.getFirst()).assertTrue();
      expect(single.getLast()).assertTrue();

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(88)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListBooleanTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_BOOLEAN_0600
     * @tc.desc   Verify LinkedList boolean removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<boolean> = new LinkedList<boolean>();
      list.add(true);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(5);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(100, false);
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
