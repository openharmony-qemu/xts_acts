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

interface MapInvalidObject {
  marker: string;
}

const MAP_INVALID_OBJECT: MapInvalidObject = { marker: 'invalid' };

const MAP_A: Map<string, number> = new Map<string, number>();
const MAP_B: Map<string, number> = new Map<string, number>();
const MAP_C: Map<string, number> = new Map<string, number>();
const MAP_D: Map<string, number> = new Map<string, number>();
const MAP_E: Map<string, number> = new Map<string, number>();
const MAP_F: Map<string, number> = new Map<string, number>();
const MAP_G: Map<string, number> = new Map<string, number>();

MAP_A.set('a', 1);
MAP_B.set('b', 2);
MAP_C.set('c', 3);
MAP_D.set('', 0);
MAP_E.set('', -1);
MAP_F.set('max', Number.MAX_SAFE_INTEGER);

const VALID_VALUES: Array<Map<string, number>> = [MAP_A, MAP_B, MAP_C, MAP_D, MAP_E, MAP_F, MAP_G, MAP_A];

type MapInvalidValue = string | number | null | undefined | MapInvalidObject | Array<number>;
type MapAllValue = Map<string, number> | MapInvalidValue;

const ALL_VALUES: Array<MapAllValue> = [
  ...VALID_VALUES,
  'key', 123, null, undefined, MAP_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListMapTest() {
  describe('LinkedListMapTest', () => {
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
     * @tc.name   testLinkedListMapTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_MAP_0100
     * @tc.desc   Verify LinkedList Map constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(MAP_A);
      expect(list.get(7)).assertEqual(MAP_A);
      expect(list.get(6).size).assertEqual(0);

      const mixed: LinkedList<MapAllValue> = new LinkedList<MapAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(MAP_A);
    });

    /**
     * @tc.name   testLinkedListMapTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_MAP_0200
     * @tc.desc   Verify LinkedList Map addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_A);

      list.addFirst(MAP_C);
      expect(list.get(0)).assertEqual(MAP_C);
      expect(list.length).assertEqual(4);

      expect(list.has(MAP_A)).assertTrue();
      expect(list.has(MAP_D)).assertFalse();
      expect(list.getIndexOf(MAP_A)).assertEqual(1);
      expect(list.getLastIndexOf(MAP_A)).assertEqual(3);
      expect(list.getIndexOf(MAP_G)).assertEqual(-1);

      list.insert(0, MAP_D);
      expect(list.get(0)).assertEqual(MAP_D);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListMapTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_MAP_0300
     * @tc.desc   Verify LinkedList Map removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_C);
      list.add(MAP_D);

      const removed: Map<string, number> = list.removeByIndex(1);
      expect(removed).assertEqual(MAP_B);
      expect(list.length).assertEqual(3);
      expect(list.get(1)).assertEqual(MAP_C);

      expect(list.remove(MAP_A)).assertTrue();
      expect(list.get(0)).assertEqual(MAP_C);
      expect(list.remove(MAP_F)).assertFalse();

      const first: Map<string, number> = list.removeFirst();
      expect(first).assertEqual(MAP_C);
      expect(list.length).assertEqual(1);

      const last: Map<string, number> = list.removeLast();
      expect(last).assertEqual(MAP_D);
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      dupList.add(MAP_E);
      dupList.add(MAP_F);
      dupList.add(MAP_E);
      dupList.add(MAP_E);
      expect(dupList.removeFirstFound(MAP_E)).assertTrue();
      expect(dupList.get(0)).assertEqual(MAP_F);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(MAP_E)).assertTrue();
      expect(dupList.getLastIndexOf(MAP_E)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListMapTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_MAP_0400
     * @tc.desc   Verify LinkedList Map set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_C);

      const old: Map<string, number> = list.set(1, MAP_F);
      expect(old).assertEqual(MAP_F);
      expect(list.get(1)).assertEqual(MAP_F);
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<Map<string, number>> = list.clone();
      cloned.add(MAP_G);
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned.get(0).size).assertEqual(list.get(0).size);

      const arr: Array<Map<string, number>> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0].size).assertEqual(MAP_A.size);
      expect(arr instanceof Array).assertTrue();

      const sizes: Array<number> = [];
      list.forEach((value: Map<string, number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[0]).assertEqual(1);

      let indexSum: number = 0;
      list.forEach((value: Map<string, number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Map<string, number>> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertEqual(list.get(2));
    });

    /**
     * @tc.name   testLinkedListMapTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_MAP_0500
     * @tc.desc   Verify LinkedList Map getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      list.add(MAP_C);
      list.add(MAP_A);
      list.add(MAP_B);

      expect(list.getFirst()).assertEqual(MAP_C);
      expect(list.getLast()).assertEqual(MAP_B);
      expect(list.get(0)).assertEqual(MAP_C);
      expect(list.get(list.length - 1)).assertEqual(MAP_B);
      expect(list.get(1)).assertEqual(MAP_A);

      const single: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      single.add(MAP_F);
      expect(single.getFirst()).assertEqual(MAP_F);
      expect(single.getLast()).assertEqual(MAP_F);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(33)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListMapTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_MAP_0600
     * @tc.desc   Verify LinkedList Map removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Map<string, number>> = new LinkedList<Map<string, number>>();
      list.add(MAP_A);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(8);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(33, MAP_B);
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
