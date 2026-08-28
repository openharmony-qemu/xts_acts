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

interface FunctionInvalidObject {
  marker: string;
}

const FUNCTION_INVALID_OBJECT: FunctionInvalidObject = { marker: 'invalid' };

type LinkedListFunctionItem = (value: number) => number;

const FUNCTION_A: LinkedListFunctionItem = (value: number): number => value + 1;
const FUNCTION_B: LinkedListFunctionItem = (value: number): number => value + 2;
const FUNCTION_C: LinkedListFunctionItem = (value: number): number => value + 3;
const FUNCTION_D: LinkedListFunctionItem = (value: number): number => value * value;
const FUNCTION_E: LinkedListFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: LinkedListFunctionItem = (value: number): number => value - 100.5;

const VALID_VALUES: Array<LinkedListFunctionItem> = [
  FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A,
];

type FunctionInvalidValue = number | string | null | undefined | FunctionInvalidObject | Array<number>;
type FunctionAllValue = LinkedListFunctionItem | FunctionInvalidValue;

const ALL_VALUES: Array<FunctionAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, FUNCTION_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListFunctionTest() {
  describe('LinkedListFunctionTest', () => {
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
     * @tc.name   testLinkedListFunctionTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_FUNCTION_0100
     * @tc.desc   Verify LinkedList function constructor length, add, get and invocation of stored functions with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(FUNCTION_A);
      expect(list.get(6)).assertEqual(FUNCTION_A);
      expect(list.get(0)(1)).assertEqual(2);
      expect(list.get(3)(3)).assertEqual(9);

      const mixed: LinkedList<FunctionAllValue> = new LinkedList<FunctionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(FUNCTION_A);
    });

    /**
     * @tc.name   testLinkedListFunctionTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_FUNCTION_0200
     * @tc.desc   Verify LinkedList function addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_A);

      list.addFirst(FUNCTION_E);
      expect(list.get(0)).assertEqual(FUNCTION_E);
      expect(list.length).assertEqual(4);

      expect(list.has(FUNCTION_A)).assertTrue();
      expect(list.has(FUNCTION_C)).assertFalse();
      expect(list.getIndexOf(FUNCTION_A)).assertEqual(1);
      expect(list.getLastIndexOf(FUNCTION_A)).assertEqual(3);
      expect(list.getIndexOf(FUNCTION_D)).assertEqual(-1);

      list.insert(0, FUNCTION_D);
      expect(list.get(0)).assertEqual(FUNCTION_D);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListFunctionTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_FUNCTION_0300
     * @tc.desc   Verify LinkedList function removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_C);
      list.add(FUNCTION_D);

      const removed: LinkedListFunctionItem = list.removeByIndex(3);
      expect(removed).assertEqual(FUNCTION_D);
      expect(list.length).assertEqual(3);

      expect(list.remove(FUNCTION_A)).assertTrue();
      expect(list.get(0)).assertEqual(FUNCTION_B);
      expect(list.remove(FUNCTION_F)).assertFalse();

      const first: LinkedListFunctionItem = list.removeFirst();
      expect(first).assertEqual(FUNCTION_B);
      expect(list.length).assertEqual(1);

      const last: LinkedListFunctionItem = list.removeLast();
      expect(last).assertEqual(FUNCTION_C);
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      dupList.add(FUNCTION_F);
      dupList.add(FUNCTION_E);
      dupList.add(FUNCTION_F);
      dupList.add(FUNCTION_F);
      expect(dupList.removeFirstFound(FUNCTION_F)).assertTrue();
      expect(dupList.get(0)).assertEqual(FUNCTION_E);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(FUNCTION_F)).assertTrue();
      expect(dupList.getLastIndexOf(FUNCTION_F)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListFunctionTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_FUNCTION_0400
     * @tc.desc   Verify LinkedList function set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_C);

      const old: LinkedListFunctionItem = list.set(1, FUNCTION_D);
      expect(old(3)).assertEqual(9);
      expect(list.get(1)(3)).assertEqual(9);
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<LinkedListFunctionItem> = list.clone();
      cloned.add(FUNCTION_E);
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);

      const arr: Array<LinkedListFunctionItem> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0](1)).assertEqual(2);
      expect(arr instanceof Array).assertTrue();

      const results: Array<number> = [];
      list.forEach((value: LinkedListFunctionItem) => {
        results.push(value(3));
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(4);
      expect(results[1]).assertEqual(9);

      let indexSum: number = 0;
      list.forEach((value: LinkedListFunctionItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<LinkedListFunctionItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2](0)).assertEqual(3);
    });

    /**
     * @tc.name   testLinkedListFunctionTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_FUNCTION_0500
     * @tc.desc   Verify LinkedList function getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_E);
      list.add(FUNCTION_F);

      expect(list.getFirst()).assertEqual(FUNCTION_A);
      expect(list.getLast()).assertEqual(FUNCTION_F);
      expect(list.get(0)).assertEqual(FUNCTION_A);
      expect(list.get(list.length - 1)).assertEqual(FUNCTION_F);
      expect(list.get(1)).assertEqual(FUNCTION_E);

      const single: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      single.add(FUNCTION_C);
      expect(single.getFirst()).assertEqual(FUNCTION_C);
      expect(single.getLast()).assertEqual(FUNCTION_C);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(11)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListFunctionTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_FUNCTION_0600
     * @tc.desc   Verify LinkedList function removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<LinkedListFunctionItem> = new LinkedList<LinkedListFunctionItem>();
      list.add(FUNCTION_A);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(6);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(11, FUNCTION_B);
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
