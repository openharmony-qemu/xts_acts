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

export default function listSetTest() {
  describe('ListSetTest', () => {
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
     * @tc.name   testListSetTest0100
     * @tc.number SUB_ARKTS_LIST_SET_0100
     * @tc.desc   Verify List Set constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<Set<number>> = new List<Set<number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<Set<number>> = new List<Set<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(SET_A);
      expect(list.get(7)).assertEqual(SET_A);
      expect(list.get(6).size).assertEqual(0);
      expect(list.getFirst()).assertEqual(SET_A);
      expect(list.getLast()).assertEqual(SET_A);

      const mixed: List<SetAllValue> = new List<SetAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(SET_A);
    });

    /**
     * @tc.name   testListSetTest0200
     * @tc.number SUB_ARKTS_LIST_SET_0200
     * @tc.desc   Verify List Set has, getIndexOf, getLastIndexOf, insert, remove and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Set<number>> = new List<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_A);

      expect(list.has(SET_A)).assertTrue();
      expect(list.has(SET_C)).assertFalse();
      expect(list.getIndexOf(SET_A)).assertEqual(0);
      expect(list.getLastIndexOf(SET_A)).assertEqual(2);
      expect(list.getIndexOf(SET_G)).assertEqual(-1);

      list.insert(SET_C, 0);
      expect(list.get(0)).assertEqual(SET_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(SET_A)).assertTrue();
      expect(list.getIndexOf(SET_A)).assertEqual(2);
      expect(list.remove(SET_D)).assertFalse();

      const same: List<Set<number>> = new List<Set<number>>();
      same.add(SET_C);
      same.add(SET_B);
      same.add(SET_A);
      expect(list.equal(same)).assertTrue();
      same.add(SET_A);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListSetTest0300
     * @tc.number SUB_ARKTS_LIST_SET_0300
     * @tc.desc   Verify List Set removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Set<number>> = new List<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_C);
      list.add(SET_D);

      const removed: Set<number> = list.removeByIndex(2);
      expect(removed).assertEqual(SET_C);
      expect(list.length).assertEqual(3);

      expect(list.remove(SET_B)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<Set<number>> = new List<Set<number>>();
      src.add(SET_E);
      src.add(SET_F);
      const sub: List<Set<number>> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(1)).assertEqual(SET_F);
      expect(src.length).assertEqual(2);
      sub.add(SET_G);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.name   testListSetTest0400
     * @tc.number SUB_ARKTS_LIST_SET_0400
     * @tc.desc   Verify List Set set, replaceAllElements, forEach and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Set<number>> = new List<Set<number>>();
      list.add(SET_A);
      list.add(SET_B);
      list.add(SET_D);

      const old: Set<number> = list.set(1, SET_F);
      expect(old).assertEqual(SET_F);
      expect(list.get(1)).assertEqual(SET_F);
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: Set<number>): Set<number> => {
        const next: Set<number> = new Set<number>();
        value.forEach((v: number) => {
          next.add(v + 100);
        });
        return next;
      });
      expect(list.get(0).has(101)).assertTrue();
      expect(list.get(2).has(100)).assertTrue();
      expect(list.get(2).has(99)).assertTrue();

      const sizes: Array<number> = [];
      list.forEach((value: Set<number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[2]).assertEqual(2);

      let indexSum: number = 0;
      list.forEach((value: Set<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Set<number>> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(list.get(1));
    });

    /**
     * @tc.name   testListSetTest0500
     * @tc.number SUB_ARKTS_LIST_SET_0500
     * @tc.desc   Verify List Set sort by size plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Set<number>> = new List<Set<number>>();
      list.add(SET_D);
      list.add(SET_A);
      list.add(SET_E);

      list.sort((a: Set<number>, b: Set<number>): number => {
        return a.size - b.size;
      });
      expect(list.length).assertEqual(3);
      expect(list.has(SET_D)).assertTrue();
      expect(list.has(SET_E)).assertTrue();

      expect(list.getFirst()).assertEqual(SET_A);
      expect(list.getLast()).assertEqual(SET_E);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListSetTest0600
     * @tc.number SUB_ARKTS_LIST_SET_0600
     * @tc.desc   Verify List Set out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Set<number>> = new List<Set<number>>();
      list.add(SET_A);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

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
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<Set<number>> = new List<Set<number>>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
