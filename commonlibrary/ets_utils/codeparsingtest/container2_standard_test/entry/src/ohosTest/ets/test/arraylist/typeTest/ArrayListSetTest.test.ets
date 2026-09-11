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

interface SetInvalidObject {
  marker: string;
}

const SET_INVALID_OBJECT: SetInvalidObject = { marker: 'invalid' };

const SET_A: Set<number> = new Set<number>([1]);
const SET_B: Set<number> = new Set<number>([2]);
const SET_C: Set<number> = new Set<number>([3]);
const SET_D: Set<number> = new Set<number>([0, -1]);
const SET_E: Set<number> = new Set<number>([NaN, Infinity]);
const SET_F: Set<number> = new Set<number>([Number.MAX_SAFE_INTEGER]);
const SET_G: Set<number> = new Set<number>();

const VALID_VALUES: Array<Set<number>> = [SET_A, SET_B, SET_C, SET_D, SET_E, SET_F, SET_G, SET_A];

type SetInvalidValue = string | number | null | undefined | SetInvalidObject | Array<number>;
type SetAllValue = Set<number> | SetInvalidValue;

const ALL_VALUES: Array<SetAllValue> = [
  ...VALID_VALUES,
  '1', 123, null, undefined, SET_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function arrayListSetTest() {
  describe('ArrayListSetTest', () => {
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
     * @tc.name   testArrayListSetTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_SET_0100
     * @tc.desc   Verify ArrayList Set constructor and add with valid and mixed Set values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<Set<number>> = new ArrayList<Set<number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<Set<number>> = new ArrayList<Set<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(SET_A);
      expect(list[7]).assertEqual(SET_A);
      expect(list[6].size).assertEqual(0);

      const mixed: ArrayList<SetAllValue> = new ArrayList<SetAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(SET_A);
    });

    /**
     * @tc.name   testArrayListSetTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_SET_0200
     * @tc.desc   Verify ArrayList Set has, getIndexOf, getLastIndexOf, insert and remove by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Set<number>> = new ArrayList<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_A);

      expect(list.has(SET_A)).assertTrue();
      expect(list.has(SET_C)).assertFalse();
      expect(list.getIndexOf(SET_A)).assertEqual(0);
      expect(list.getLastIndexOf(SET_A)).assertEqual(2);
      expect(list.getIndexOf(SET_G)).assertEqual(-1);

      list.insert(SET_C, 0);
      expect(list[0]).assertEqual(SET_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(SET_A)).assertTrue();
      expect(list.getIndexOf(SET_A)).assertEqual(2);
      expect(list.remove(SET_D)).assertFalse();
    });

    /**
     * @tc.name   testArrayListSetTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_SET_0300
     * @tc.desc   Verify ArrayList Set removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Set<number>> = new ArrayList<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_C);
      list.add(SET_D);

      const removed: Set<number> = list.removeByIndex(2);
      expect(removed).assertEqual(SET_C);
      expect(list.length).assertEqual(3);

      list.removeByRange(1, 3);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(SET_A);

      const src: ArrayList<Set<number>> = new ArrayList<Set<number>>();
      src.add(SET_E);
      src.add(SET_F);
      const sub: ArrayList<Set<number>> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[1]).assertEqual(SET_F);
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<Set<number>> = src.clone();
      cloned.add(SET_G);
      expect(src.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);
      expect(cloned[0]).assertEqual(src[0]);
    });

    /**
     * @tc.name   testArrayListSetTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_SET_0400
     * @tc.desc   Verify ArrayList Set replaceAllElements and forEach transforming stored Sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Set<number>> = new ArrayList<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_D);

      list.replaceAllElements((value: Set<number>): Set<number> => {
        const next: Set<number> = new Set<number>();
        value.forEach((v: number) => {
          next.add(v + 100);
        });
        return next;
      });
      expect(list[0].has(101)).assertTrue();
      expect(list[1].has(102)).assertTrue();
      expect(list[2].has(100)).assertTrue();
      expect(list[2].has(99)).assertTrue();

      const sizes: Array<number> = [];
      list.forEach((value: Set<number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[2]).assertEqual(2);
    });

    /**
     * @tc.name   testArrayListSetTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_SET_0500
     * @tc.desc   Verify ArrayList Set sort by size, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Set<number>> = new ArrayList<Set<number>>();
      list.add(SET_D);
      list.add(SET_A);
      list.add(SET_E);

      list.sort((a: Set<number>, b: Set<number>): number => {
        return a.size - b.size;
      });
      expect(list.length).assertEqual(3);
      expect(list.has(SET_D)).assertTrue();
      expect(list.has(SET_E)).assertTrue();

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(22);
      expect(list.getCapacity() >= 22).assertTrue();
      list.add(SET_F);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
      expect(list[3]).assertEqual(SET_F);
    });

    /**
     * @tc.name   testArrayListSetTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_SET_0600
     * @tc.desc   Verify ArrayList Set boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListSetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Set<number>> = new ArrayList<Set<number>>();
      list.add(SET_A);
      let accessThrew: boolean = false;
      try {
        const beyond: Set<number> = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(9);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(SET_B, 55);
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
