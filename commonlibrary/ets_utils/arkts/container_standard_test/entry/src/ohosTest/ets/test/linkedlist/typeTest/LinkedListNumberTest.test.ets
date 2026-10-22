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

interface NumberInvalidObject {
  marker: string;
}

const NUMBER_INVALID_OBJECT: NumberInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MIN_VALUE, Number.MIN_VALUE - 1, Number.EPSILON,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, -128, 127, -32768, 32767, -2147483648,
  2147483647, -9223372036854775808, 9223372036854775807, -1.40129846432481707e-45,
  1.40129846432481707e-45, -3.4028234663852886e38, 3.4028234663852886e38, 65535,
  -1, 999999.99, 13800138000, 123456, -100.5,
];

type NumberInvalidValue = string | null | undefined | NumberInvalidObject | Array<number> | boolean | bigint;
type NumberAllValue = number | NumberInvalidValue;

const ALL_VALUES: Array<NumberAllValue> = [
  ...VALID_VALUES,
  '123', '0x12', null, undefined, NUMBER_INVALID_OBJECT, [], true,
  BigInt('16045690984833335006'), BigInt('9007199254740991'),
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListNumberTest() {
  describe('LinkedListNumberTest', () => {
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
     * @tc.name   testLinkedListNumberTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_NUMBER_0100
     * @tc.desc   Verify LinkedList number constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<number> = new LinkedList<number>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<number> = new LinkedList<number>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        const added: boolean = list.add(VALID_VALUES[i]);
        expect(added).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(1);
      expect(list.get(1)).assertEqual(100.5);

      const mixed: LinkedList<NumberAllValue> = new LinkedList<NumberAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(1);
      expect(mixed.get(ALL_VALUES.length - 1)).assertEqual(BigInt('9007199254740991'));
    });

    /**
     * @tc.name   testLinkedListNumberTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_NUMBER_0200
     * @tc.desc   Verify LinkedList number addFirst, has, getIndexOf, getLastIndexOf and insert operations including NaN lookup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<number> = new LinkedList<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(2);
      list.add(1);
      list.add(2);
      list.add(4);

      list.addFirst(88);
      expect(list.get(0)).assertEqual(88);
      expect(list.length).assertEqual(8);

      expect(list.has(5)).assertTrue();
      expect(list.has(999)).assertFalse();
      expect(list.getIndexOf(2)).assertEqual(1);
      expect(list.getLastIndexOf(2)).assertEqual(6);
      expect(list.getIndexOf(999)).assertEqual(-1);
      expect(list.getLastIndexOf(999)).assertEqual(-1);
      expect(list.get(3)).assertEqual(5);

      list.insert(7, 0);
      expect(list.get(0)).assertEqual(88);
      expect(list.get(7)).assertEqual(0);
      expect(list.length).assertEqual(9);
      let tailInsertThrew: boolean = false;
      try {
        list.insert(99, list.length);
      } catch (e) {
        tailInsertThrew = true;
      }
      expect(tailInsertThrew).assertTrue();
      expect(list.length).assertEqual(9);

      const nanList: LinkedList<number> = new LinkedList<number>();
      nanList.add(NaN);
      expect(nanList.has(NaN)).assertTrue();
      expect(nanList.getIndexOf(NaN)).assertEqual(0);
    });

    /**
     * @tc.name   testLinkedListNumberTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_NUMBER_0300
     * @tc.desc   Verify LinkedList number removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<number> = new LinkedList<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(4);
      list.add(6);

      const removed: number = list.removeByIndex(2);
      expect(removed).assertEqual(5);
      expect(list.length).assertEqual(4);
      expect(list.get(2)).assertEqual(4);

      expect(list.remove(4)).assertTrue();
      expect(list.getIndexOf(4)).assertEqual(1);
      expect(list.remove(777)).assertFalse();

      const first: number = list.removeFirst();
      expect(first).assertEqual(2);
      expect(list.get(0)).assertEqual(4);
      expect(list.length).assertEqual(2);

      const last: number = list.removeLast();
      expect(last).assertEqual(6);
      expect(list.length).assertEqual(1);

      const dupList: LinkedList<number> = new LinkedList<number>();
      dupList.add(4);
      dupList.add(2);
      dupList.add(4);
      dupList.add(4);
      expect(dupList.removeFirstFound(4)).assertTrue();
      expect(dupList.get(0)).assertEqual(2);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(4)).assertTrue();
      expect(dupList.getLastIndexOf(4)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListNumberTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_NUMBER_0400
     * @tc.desc   Verify LinkedList number set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<number> = new LinkedList<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(4);

      const old: number = list.set(2, 50);
      expect(old).assertEqual(50);
      expect(list.get(2)).assertEqual(50);
      expect(list.length).assertEqual(4);

      const cloned: LinkedList<number> = list.clone();
      expect(cloned.length).assertEqual(4);
      cloned.add(6);
      expect(list.length).assertEqual(4);
      expect(cloned.get(4)).assertEqual(6);

      const arr: Array<number> = list.convertToArray();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(50);
      expect(arr instanceof Array).assertTrue();

      const visited: Array<number> = [];
      list.forEach((value: number) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(2);
      expect(visited[3]).assertEqual(4);

      let indexSum: number = 0;
      list.forEach((value: number, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(6);

      const iterValues: Array<number> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<number> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(4);
      expect(iterValues[0]).assertEqual(2);

      let forOfSum: number = 0;
      for (const value of list) {
        forOfSum += value;
      }
      expect(forOfSum).assertEqual(60);
    });

    /**
     * @tc.name   testLinkedListNumberTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_NUMBER_0500
     * @tc.desc   Verify LinkedList number getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<number> = new LinkedList<number>();
      list.add(5);
      list.add(1);
      list.add(4);
      list.add(2);
      list.add(3);

      expect(list.getFirst()).assertEqual(5);
      expect(list.getLast()).assertEqual(3);
      expect(list.get(0)).assertEqual(5);
      expect(list.get(list.length - 1)).assertEqual(3);
      expect(list.get(2)).assertEqual(4);

      const single: LinkedList<number> = new LinkedList<number>();
      single.add(42);
      expect(single.getFirst()).assertEqual(42);
      expect(single.getLast()).assertEqual(42);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(99)).assertUndefined();

      const boundary: LinkedList<number> = new LinkedList<number>();
      boundary.add(1);
      boundary.add(2);
      boundary.add(3);
      expect(boundary.get(3)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListNumberTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_NUMBER_0600
     * @tc.desc   Verify LinkedList number insert out-of-bounds no-op, removeByIndex exception on invalid index and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<number> = new LinkedList<number>();
      list.add(1);
      list.add(2);
      list.add(3);

      let insertFailed: boolean = false;
      try {
        list.insert(100, 99);
      } catch (e) {
        insertFailed = true;
      }
      expect(list.has(100)).assertFalse();
      expect(list.length).assertEqual(3);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(3);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(3);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.has(1)).assertFalse();
      expect(list.convertToArray().length).assertEqual(0);
      expect(list.getFirst()).assertUndefined();
      expect(list.getLast()).assertUndefined();
      expect(list.clone().length).assertEqual(0);

      const emptyIter = list[Symbol.iterator]();
      const first: IteratorResult<number> = emptyIter.next();
      expect(first.done).assertTrue();
    });
  });
}
