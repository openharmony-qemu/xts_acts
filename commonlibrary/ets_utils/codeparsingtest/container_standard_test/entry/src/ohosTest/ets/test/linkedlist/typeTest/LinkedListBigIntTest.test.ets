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

interface BigIntInvalidObject {
  marker: string;
}

const BIGINT_INVALID_OBJECT: BigIntInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<bigint> = [
  100n, -99n, BigInt('9007199254740991'), BigInt(Number.MAX_SAFE_INTEGER), 9007199254740991n,
  -9007199254740991n, 0n, BigInt('0'), BigInt('123456789012345678901234567890'),
  BigInt('138001380001234567890'), BigInt('100000000000000000000000'), -1n,
];

type BigIntInvalidValue = number | string | null | undefined | BigIntInvalidObject;
type BigIntAllValue = bigint | BigIntInvalidValue;

const ALL_VALUES: Array<BigIntAllValue> = [
  ...VALID_VALUES,
  100, '100n', null, undefined, BIGINT_INVALID_OBJECT, NaN, Infinity,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListBigIntTest() {
  describe('LinkedListBigIntTest', () => {
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
     * @tc.name   testLinkedListBigIntTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_BIGINT_0100
     * @tc.desc   Verify LinkedList bigint constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<bigint> = new LinkedList<bigint>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<bigint> = new LinkedList<bigint>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(100n);
      expect(list.get(6)).assertEqual(0n);

      const mixed: LinkedList<BigIntAllValue> = new LinkedList<BigIntAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(VALID_VALUES.length)).assertEqual(100);
    });

    /**
     * @tc.name   testLinkedListBigIntTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_BIGINT_0200
     * @tc.desc   Verify LinkedList bigint addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<bigint> = new LinkedList<bigint>();
      list.add(1n);
      list.add(2n);
      list.add(1n);

      list.addFirst(0n);
      expect(list.get(0)).assertEqual(0n);
      expect(list.length).assertEqual(4);

      expect(list.has(1n)).assertTrue();
      expect(list.has(999n)).assertFalse();
      expect(list.getIndexOf(1n)).assertEqual(1);
      expect(list.getLastIndexOf(1n)).assertEqual(3);
      expect(list.getIndexOf(2n)).assertEqual(2);
      expect(list.getIndexOf(999n)).assertEqual(-1);

      list.insert(0, 5n);
      expect(list.get(0)).assertEqual(5n);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListBigIntTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_BIGINT_0300
     * @tc.desc   Verify LinkedList bigint removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<bigint> = new LinkedList<bigint>();
      list.add(10n);
      list.add(20n);
      list.add(30n);
      list.add(40n);
      list.add(50n);

      const removed: bigint = list.removeByIndex(1);
      expect(removed).assertEqual(20n);
      expect(list.length).assertEqual(4);
      expect(list.get(1)).assertEqual(30n);

      expect(list.remove(40n)).assertTrue();
      expect(list.getIndexOf(40n)).assertEqual(-1);
      expect(list.remove(777n)).assertFalse();

      const first: bigint = list.removeFirst();
      expect(first).assertEqual(10n);
      expect(list.length).assertEqual(2);

      const last: bigint = list.removeLast();
      expect(last).assertEqual(50n);
      expect(list.length).assertEqual(1);

      const dupList: LinkedList<bigint> = new LinkedList<bigint>();
      dupList.add(7n);
      dupList.add(8n);
      dupList.add(7n);
      dupList.add(7n);
      expect(dupList.removeFirstFound(7n)).assertTrue();
      expect(dupList.get(0)).assertEqual(8n);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(7n)).assertTrue();
      expect(dupList.getLastIndexOf(7n)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListBigIntTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_BIGINT_0400
     * @tc.desc   Verify LinkedList bigint set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<bigint> = new LinkedList<bigint>();
      list.add(1n);
      list.add(2n);
      list.add(3n);

      const old: bigint = list.set(1, 20n);
      expect(old).assertEqual(20n);
      expect(list.get(1)).assertEqual(20n);
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<bigint> = list.clone();
      cloned.add(4n);
      expect(list.length).assertEqual(3);
      expect(cloned.get(3)).assertEqual(4n);

      const arr: Array<bigint> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3n);
      expect(arr instanceof Array).assertTrue();

      const visited: Array<bigint> = [];
      list.forEach((value: bigint) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[1]).assertEqual(20n);

      let indexSum: number = 0;
      list.forEach((value: bigint, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<bigint> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(1n);
    });

    /**
     * @tc.name   testLinkedListBigIntTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_BIGINT_0500
     * @tc.desc   Verify LinkedList bigint getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<bigint> = new LinkedList<bigint>();
      list.add(300n);
      list.add(100n);
      list.add(200n);

      expect(list.getFirst()).assertEqual(300n);
      expect(list.getLast()).assertEqual(200n);
      expect(list.get(0)).assertEqual(300n);
      expect(list.get(list.length - 1)).assertEqual(200n);
      expect(list.get(1)).assertEqual(100n);

      const single: LinkedList<bigint> = new LinkedList<bigint>();
      single.add(9n);
      expect(single.getFirst()).assertEqual(9n);
      expect(single.getLast()).assertEqual(9n);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(50)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListBigIntTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_BIGINT_0600
     * @tc.desc   Verify LinkedList bigint removeByIndex exception on invalid index, insert out-of-bounds no-op, clear behavior and empty iterator done state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<bigint> = new LinkedList<bigint>();
      list.add(1n);
      list.add(2n);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(9);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(2);

      let insertThrew: boolean = false;
      try {
        list.insert(50, 9n);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(2);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.getFirst()).assertUndefined();
      expect(list.getLast()).assertUndefined();
      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();
    });
  });
}
