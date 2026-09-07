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
import { List } from '@kit.ArkTS';

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
MAP_E.set('​', -1);
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

export default function listMapTest() {
  describe('ListMapTest', () => {
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
     * @tc.name   testListMapTest0100
     * @tc.number SUB_ARKTS_LIST_MAP_0100
     * @tc.desc   Verify List Map constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<Map<string, number>> = new List<Map<string, number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<Map<string, number>> = new List<Map<string, number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(MAP_A);
      expect(list.get(7)).assertEqual(MAP_A);
      expect(list.get(6).size).assertEqual(0);
      expect(list.getFirst()).assertEqual(MAP_A);
      expect(list.getLast()).assertEqual(MAP_A);

      const mixed: List<MapAllValue> = new List<MapAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(MAP_A);
    });

    /**
     * @tc.name   testListMapTest0200
     * @tc.number SUB_ARKTS_LIST_MAP_0200
     * @tc.desc   Verify List Map has, getIndexOf, getLastIndexOf, insert, remove and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Map<string, number>> = new List<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_A);

      expect(list.has(MAP_A)).assertTrue();
      expect(list.has(MAP_C)).assertFalse();
      expect(list.getIndexOf(MAP_A)).assertEqual(0);
      expect(list.getLastIndexOf(MAP_A)).assertEqual(2);
      expect(list.getIndexOf(MAP_G)).assertEqual(-1);

      list.insert(MAP_C, 0);
      expect(list.get(0)).assertEqual(MAP_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(MAP_A)).assertTrue();
      expect(list.getIndexOf(MAP_A)).assertEqual(2);
      expect(list.remove(MAP_F)).assertFalse();

      const same: List<Map<string, number>> = new List<Map<string, number>>();
      same.add(MAP_C);
      same.add(MAP_B);
      same.add(MAP_A);
      expect(list.equal(same)).assertTrue();
      same.add(MAP_A);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListMapTest0300
     * @tc.number SUB_ARKTS_LIST_MAP_0300
     * @tc.desc   Verify List Map removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Map<string, number>> = new List<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_C);
      list.add(MAP_D);

      const removed: Map<string, number> = list.removeByIndex(1);
      expect(removed).assertEqual(MAP_B);
      expect(list.length).assertEqual(3);
      expect(list.get(1)).assertEqual(MAP_C);

      expect(list.remove(MAP_A)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<Map<string, number>> = new List<Map<string, number>>();
      src.add(MAP_E);
      src.add(MAP_F);
      const sub: List<Map<string, number>> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(1)).assertEqual(MAP_F);
      expect(src.length).assertEqual(2);
      sub.add(MAP_G);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.name   testListMapTest0400
     * @tc.number SUB_ARKTS_LIST_MAP_0400
     * @tc.desc   Verify List Map set, replaceAllElements, forEach, iterator traversal and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Map<string, number>> = new List<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_C);

      const old: Map<string, number> = list.set(1, MAP_F);
      expect(old).assertEqual(MAP_F);
      const replaced: Map<string, number> = list.set(1, MAP_F);
      expect(replaced).assertEqual(MAP_F);
      expect(list.get(1)).assertEqual(MAP_F);
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: Map<string, number>): Map<string, number> => {
        const next: Map<string, number> = new Map<string, number>();
        value.forEach((v: number, k: string) => {
          next.set(k, v * 10);
        });
        return next;
      });
      expect(list.get(0).get('a')).assertEqual(10);
      expect(list.get(2).get('c')).assertEqual(30);

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
      expect(iterValues[1]).assertEqual(list.get(1));

      const arr: Array<Map<string, number>> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(list.get(0));
    });

    /**
     * @tc.name   testListMapTest0500
     * @tc.number SUB_ARKTS_LIST_MAP_0500
     * @tc.desc   Verify List Map sort by size plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Map<string, number>> = new List<Map<string, number>>();
      list.add(MAP_C);
      list.add(MAP_A);
      list.add(MAP_B);

      list.sort((a: Map<string, number>, b: Map<string, number>): number => {
        return a.size - b.size;
      });
      expect(list.length).assertEqual(3);
      expect(list.has(MAP_A)).assertTrue();
      expect(list.has(MAP_B)).assertTrue();

      expect(list.getFirst()).assertEqual(MAP_C);
      expect(list.getLast()).assertEqual(MAP_B);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListMapTest0600
     * @tc.number SUB_ARKTS_LIST_MAP_0600
     * @tc.desc   Verify List Map out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Map<string, number>> = new List<Map<string, number>>();
      list.add(MAP_A);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

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
        list.insert(MAP_B, 33);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<Map<string, number>> = new List<Map<string, number>>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
