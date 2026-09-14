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
import { ArrayList } from '@kit.ArkTS';

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

export default function arrayListMapTest() {
  describe('ArrayListMapTest', () => {
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
     * @tc.name   testArrayListMapTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_MAP_0100
     * @tc.desc   Verify ArrayList Map constructor and add with valid and mixed Map values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<Map<string, number>> = new ArrayList<Map<string, number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<Map<string, number>> = new ArrayList<Map<string, number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(MAP_A);
      expect(list[7]).assertEqual(MAP_A);
      expect(list[6].size).assertEqual(0);

      const mixed: ArrayList<MapAllValue> = new ArrayList<MapAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(MAP_A);
    });

    /**
     * @tc.name   testArrayListMapTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_MAP_0200
     * @tc.desc   Verify ArrayList Map has, getIndexOf, getLastIndexOf, insert and remove by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Map<string, number>> = new ArrayList<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_A);

      expect(list.has(MAP_A)).assertTrue();
      expect(list.has(MAP_C)).assertFalse();
      expect(list.getIndexOf(MAP_A)).assertEqual(0);
      expect(list.getLastIndexOf(MAP_A)).assertEqual(2);
      expect(list.getIndexOf(MAP_G)).assertEqual(-1);

      list.insert(MAP_C, 0);
      expect(list[0]).assertEqual(MAP_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(MAP_A)).assertTrue();
      expect(list.getIndexOf(MAP_A)).assertEqual(2);
      expect(list.remove(MAP_F)).assertFalse();
    });

    /**
     * @tc.name   testArrayListMapTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_MAP_0300
     * @tc.desc   Verify ArrayList Map removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Map<string, number>> = new ArrayList<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_C);
      list.add(MAP_D);

      const removed: Map<string, number> = list.removeByIndex(1);
      expect(removed).assertEqual(MAP_B);
      expect(list.length).assertEqual(3);
      expect(list[1]).assertEqual(MAP_C);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(MAP_D);

      const src: ArrayList<Map<string, number>> = new ArrayList<Map<string, number>>();
      src.add(MAP_E);
      src.add(MAP_F);
      const sub: ArrayList<Map<string, number>> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[1]).assertEqual(MAP_F);
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<Map<string, number>> = src.clone();
      cloned.add(MAP_G);
      expect(src.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);
      expect(cloned[0]).assertEqual(src[0]);
    });

    /**
     * @tc.name   testArrayListMapTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_MAP_0400
     * @tc.desc   Verify ArrayList Map replaceAllElements and forEach transforming stored Maps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Map<string, number>> = new ArrayList<Map<string, number>>();
      list.add(MAP_A);
      list.add(MAP_B);
      list.add(MAP_C);

      list.replaceAllElements((value: Map<string, number>): Map<string, number> => {
        const next: Map<string, number> = new Map<string, number>();
        value.forEach((v: number, k: string) => {
          next.set(k, v * 10);
        });
        return next;
      });
      expect(list[0].get('a')).assertEqual(10);
      expect(list[1].get('b')).assertEqual(20);
      expect(list[2].get('c')).assertEqual(30);

      const sizes: Array<number> = [];
      list.forEach((value: Map<string, number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[0]).assertEqual(1);
    });

    /**
     * @tc.name   testArrayListMapTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_MAP_0500
     * @tc.desc   Verify ArrayList Map sort by size, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Map<string, number>> = new ArrayList<Map<string, number>>();
      list.add(MAP_C);
      list.add(MAP_A);
      list.add(MAP_B);

      list.sort((a: Map<string, number>, b: Map<string, number>): number => {
        return a.size - b.size;
      });
      expect(list.length).assertEqual(3);
      expect(list.has(MAP_A)).assertTrue();
      expect(list.has(MAP_B)).assertTrue();

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(20);
      expect(list.getCapacity() >= 20).assertTrue();
      list.add(MAP_D);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
      expect(list[3]).assertEqual(MAP_D);
    });

    /**
     * @tc.name   testArrayListMapTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_MAP_0600
     * @tc.desc   Verify ArrayList Map boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Map<string, number>> = new ArrayList<Map<string, number>>();
      list.add(MAP_A);
      let accessThrew: boolean = false;
      try {
        const beyond: Map<string, number> = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

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
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.clone().length).assertEqual(0);
    });
  });
}
