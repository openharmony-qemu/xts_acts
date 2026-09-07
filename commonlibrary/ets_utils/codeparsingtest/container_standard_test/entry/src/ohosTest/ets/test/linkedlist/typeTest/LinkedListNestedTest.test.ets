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

interface NestedInvalidObject {
  marker: string;
}

const NESTED_INVALID_OBJECT: NestedInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<Array<number>> = [
  [1, 2, 3], [0, -1], [NaN, Infinity], new Array<number>(3), new Array<number>(),
  [Number.MAX_SAFE_INTEGER], [1, 2, 3],
];

type NestedAllValue = Array<number> | NestedInvalidObject | null | undefined;

const ALL_VALUES: Array<NestedAllValue> = [
  ...VALID_VALUES,
  [1, 2, 3], NESTED_INVALID_OBJECT, null, undefined,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListNestedTest() {
  describe('LinkedListNestedTest', () => {
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
     * @tc.name   testLinkedListNestedTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_NESTED_0100
     * @tc.desc   Verify LinkedList nested Array constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNestedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(VALID_VALUES[0]);
      expect(list.get(0)[1]).assertEqual(2);
      expect(list.get(4).length).assertEqual(0);

      const mixed: LinkedList<NestedAllValue> = new LinkedList<NestedAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testLinkedListNestedTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_NESTED_0200
     * @tc.desc   Verify LinkedList nested Array addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNestedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);

      list.addFirst(VALID_VALUES[2]);
      expect(list.get(0)).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(4);

      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(VALID_VALUES[5])).assertFalse();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(1);
      expect(list.getLastIndexOf(VALID_VALUES[0])).assertEqual(3);
      expect(list.getIndexOf(VALID_VALUES[5])).assertEqual(-1);

      list.insert(0, VALID_VALUES[3]);
      expect(list.get(0)).assertEqual(VALID_VALUES[3]);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListNestedTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_NESTED_0300
     * @tc.desc   Verify LinkedList nested Array removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNestedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[2]);
      list.add(VALID_VALUES[3]);

      const removed: Array<number> = list.removeByIndex(2);
      expect(removed).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(3);

      expect(list.remove(VALID_VALUES[0])).assertTrue();
      expect(list.get(0)).assertEqual(VALID_VALUES[1]);
      expect(list.remove(VALID_VALUES[5])).assertFalse();

      const first: Array<number> = list.removeFirst();
      expect(first).assertEqual(VALID_VALUES[1]);
      expect(list.length).assertEqual(1);

      const last: Array<number> = list.removeLast();
      expect(last).assertEqual(VALID_VALUES[3]);
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      dupList.add(VALID_VALUES[0]);
      dupList.add(VALID_VALUES[4]);
      dupList.add(VALID_VALUES[0]);
      dupList.add(VALID_VALUES[0]);
      expect(dupList.removeFirstFound(VALID_VALUES[0])).assertTrue();
      expect(dupList.get(0)).assertEqual(VALID_VALUES[4]);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(VALID_VALUES[0])).assertTrue();
      expect(dupList.getLastIndexOf(VALID_VALUES[0])).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListNestedTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_NESTED_0400
     * @tc.desc   Verify LinkedList nested Array set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNestedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);

      const old: Array<number> = list.set(1, VALID_VALUES[5]);
      expect(old).assertEqual(VALID_VALUES[5]);
      expect(list.get(1)).assertEqual(VALID_VALUES[5]);
      expect(list.length).assertEqual(2);

      const cloned: LinkedList<Array<number>> = list.clone();
      cloned.add(VALID_VALUES[2]);
      expect(list.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);
      expect(cloned.get(0)).assertEqual(list.get(0));

      const arr: Array<Array<number>> = list.convertToArray();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(VALID_VALUES[0]);
      expect(arr instanceof Array).assertTrue();

      const totalLengths: Array<number> = [];
      list.forEach((value: Array<number>) => {
        totalLengths.push(value.length);
      });
      expect(totalLengths.length).assertEqual(2);
      expect(totalLengths[0]).assertEqual(3);

      let indexSum: number = 0;
      list.forEach((value: Array<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(1);

      const iterValues: Array<Array<number>> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(2);
      expect(iterValues[1]).assertEqual(list.get(1));
    });

    /**
     * @tc.name   testLinkedListNestedTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_NESTED_0500
     * @tc.desc   Verify LinkedList nested Array getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNestedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[4]);

      expect(list.getFirst()).assertEqual(VALID_VALUES[1]);
      expect(list.getLast()).assertEqual(VALID_VALUES[4]);
      expect(list.get(0)).assertEqual(VALID_VALUES[1]);
      expect(list.get(list.length - 1)).assertEqual(VALID_VALUES[4]);
      expect(list.get(1)).assertEqual(VALID_VALUES[0]);

      const single: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      single.add(VALID_VALUES[5]);
      expect(single.getFirst()).assertEqual(VALID_VALUES[5]);
      expect(single.getLast()).assertEqual(VALID_VALUES[5]);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(21)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListNestedTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_NESTED_0600
     * @tc.desc   Verify LinkedList nested Array removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNestedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Array<number>> = new LinkedList<Array<number>>();
      list.add(VALID_VALUES[0]);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(12);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(21, VALID_VALUES[1]);
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
