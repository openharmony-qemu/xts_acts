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

interface UnionInvalidObject {
  marker: string;
}

const UNION_INVALID_OBJECT: UnionInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [100, -99, 0x12, 1.2e3, 0, NaN, Number.MAX_SAFE_INTEGER, 100];

type UnionAllValue = number | boolean | UnionInvalidObject | null | undefined | bigint;

const ALL_VALUES: Array<UnionAllValue> = [
  ...VALID_VALUES,
  true, UNION_INVALID_OBJECT, null, undefined, 100n,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListUnionTest() {
  describe('LinkedListUnionTest', () => {
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
     * @tc.name   testLinkedListUnionTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_UNION_0100
     * @tc.desc   Verify LinkedList union type constructor length, add and get of number, boolean and bigint elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(list.add(ALL_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(ALL_VALUES.length);
      expect(list.get(0)).assertEqual(100);
      expect(list.get(4)).assertEqual(0);
      expect(list.get(8)).assertTrue();
      expect(list.get(12)).assertEqual(100n);
    });

    /**
     * @tc.name   testLinkedListUnionTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_UNION_0200
     * @tc.desc   Verify LinkedList union type addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      list.add(100);
      list.add('x' as Object as UnionAllValue);
      list.add(100);

      list.addFirst(true);
      expect(list.get(0)).assertTrue();
      expect(list.length).assertEqual(4);

      expect(list.has(100)).assertTrue();
      expect(list.getIndexOf(100)).assertEqual(1);
      expect(list.getLastIndexOf(100)).assertEqual(3);
      expect(list.getIndexOf(-999)).assertEqual(-1);

      list.insert(0, null);
      expect(list.get(0)).assertNull();
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListUnionTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_UNION_0300
     * @tc.desc   Verify LinkedList union type removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      list.add(3);
      list.add(1);
      list.add(2);
      list.add(4);
      list.add(5);

      const removed: UnionAllValue = list.removeByIndex(0);
      expect(removed).assertEqual(3);
      expect(list.length).assertEqual(4);

      expect(list.remove(1)).assertTrue();
      expect(list.get(0)).assertEqual(2);
      expect(list.remove(null)).assertFalse();

      const first: UnionAllValue = list.removeFirst();
      expect(first).assertEqual(2);
      expect(list.length).assertEqual(2);

      const last: UnionAllValue = list.removeLast();
      expect(last).assertEqual(5);
      expect(list.length).assertEqual(1);

      const dupList: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      dupList.add(7);
      dupList.add(true);
      dupList.add(7);
      dupList.add(7);
      expect(dupList.removeFirstFound(7)).assertTrue();
      expect(dupList.get(0)).assertTrue();
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(7)).assertTrue();
      expect(dupList.getLastIndexOf(7)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListUnionTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_UNION_0400
     * @tc.desc   Verify LinkedList union type set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      list.add(1);
      list.add(2);
      list.add(3);

      const old: UnionAllValue = list.set(1, true);
      expect(old).assertTrue();
      expect(list.get(1)).assertTrue();
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<UnionAllValue> = list.clone();
      cloned.add(20);
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned.get(0)).assertEqual(list.get(0));

      const arr: Array<UnionAllValue> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr instanceof Array).assertTrue();

      const collected: Array<UnionAllValue> = [];
      list.forEach((value: UnionAllValue) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[2]).assertEqual(3);

      let indexSum: number = 0;
      list.forEach((value: UnionAllValue, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<UnionAllValue> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(list.get(1));
    });

    /**
     * @tc.name   testLinkedListUnionTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_UNION_0500
     * @tc.desc   Verify LinkedList union type getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      list.add(5);
      list.add(1);
      list.add(3);

      expect(list.getFirst()).assertEqual(5);
      expect(list.getLast()).assertEqual(3);
      expect(list.get(0)).assertEqual(5);
      expect(list.get(list.length - 1)).assertEqual(3);
      expect(list.get(1)).assertEqual(1);

      const single: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      single.add(true);
      expect(single.getFirst()).assertTrue();
      expect(single.getLast()).assertTrue();

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(66)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListUnionTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_UNION_0600
     * @tc.desc   Verify LinkedList union type removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<UnionAllValue> = new LinkedList<UnionAllValue>();
      list.add(1);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(88);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(66, 9);
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
