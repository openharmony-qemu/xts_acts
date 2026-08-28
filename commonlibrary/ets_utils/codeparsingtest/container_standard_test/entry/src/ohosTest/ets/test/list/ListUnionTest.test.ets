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

export default function listUnionTest() {
  describe('ListUnionTest', () => {
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
     * @tc.name   testListUnionTest0100
     * @tc.number SUB_ARKTS_LIST_UNION_0100
     * @tc.desc   Verify List union-type constructor, add, length, get, getFirst and getLast with mixed type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<UnionAllValue> = new List<UnionAllValue>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<UnionAllValue> = new List<UnionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(list.add(ALL_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(ALL_VALUES.length);
      expect(list.get(0)).assertEqual(100);
      expect(list.get(4)).assertEqual(0);
      expect(list.get(8)).assertTrue();
      expect(list.get(12)).assertEqual(100n);
      expect(list[0]).assertEqual(100);
      expect(list.getFirst()).assertEqual(100);
      expect(list.getLast()).assertEqual(100n);
    });

    /**
     * @tc.name   testListUnionTest0200
     * @tc.number SUB_ARKTS_LIST_UNION_0200
     * @tc.desc   Verify List union-type has, getIndexOf, getLastIndexOf, insert, remove and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<UnionAllValue> = new List<UnionAllValue>();
      list.add(100);
      list.add('x' as Object as UnionAllValue);
      list.add(100);

      expect(list.has(100)).assertTrue();
      expect(list.getIndexOf(100)).assertEqual(0);
      expect(list.getLastIndexOf(100)).assertEqual(2);
      expect(list.getIndexOf(-999)).assertEqual(-1);

      list.insert(true, 0);
      expect(list.get(0)).assertTrue();
      expect(list.length).assertEqual(4);

      expect(list.remove(100)).assertTrue();
      expect(list.getIndexOf(100)).assertEqual(2);
      expect(list.remove(null)).assertFalse();

      const same: List<UnionAllValue> = new List<UnionAllValue>();
      same.add(true);
      same.add('x' as Object as UnionAllValue);
      same.add(100);
      expect(list.equal(same)).assertTrue();
      same.add(100);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListUnionTest0300
     * @tc.number SUB_ARKTS_LIST_UNION_0300
     * @tc.desc   Verify List union-type removeByIndex, remove, getSubList independence and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<UnionAllValue> = new List<UnionAllValue>();
      list.add(3);
      list.add(1);
      list.add(2);
      list.add(4);

      const removed: UnionAllValue = list.removeByIndex(0);
      expect(removed).assertEqual(3);
      expect(list.length).assertEqual(3);

      expect(list.remove(4)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<UnionAllValue> = new List<UnionAllValue>();
      src.add(10);
      src.add(null);
      src.add(30);
      const sub: List<UnionAllValue> = src.getSubList(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.get(0)).assertNull();
      expect(sub.get(1)).assertEqual(30);
      expect(src.length).assertEqual(3);
      sub.add(20);
      expect(src.length).assertEqual(3);

      const arr: Array<UnionAllValue> = src.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.name   testListUnionTest0400
     * @tc.number SUB_ARKTS_LIST_UNION_0400
     * @tc.desc   Verify List union-type set, replaceAllElements, forEach and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<UnionAllValue> = new List<UnionAllValue>();
      list.add(1);
      list.add(2);
      list.add(3);

      const old: UnionAllValue = list.set(1, true);
      expect(old).assertTrue();
      expect(list.get(1)).assertTrue();
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: UnionAllValue): UnionAllValue => {
        if (typeof value === 'number') {
          return value * 100;
        }
        return 0;
      });
      expect(list.get(0)).assertEqual(100);
      expect(list.get(2)).assertEqual(300);

      const collected: Array<UnionAllValue> = [];
      list.forEach((value: UnionAllValue) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[2]).assertEqual(300);

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
      expect(iterValues[0]).assertEqual(100);
    });

    /**
     * @tc.name   testListUnionTest0500
     * @tc.number SUB_ARKTS_LIST_UNION_0500
     * @tc.desc   Verify List union-type sort with numeric-aware comparator plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<UnionAllValue> = new List<UnionAllValue>();
      list.add(5);
      list.add(1);
      list.add(3);

      list.sort((a: UnionAllValue, b: UnionAllValue): number => {
        const na: number = typeof a === 'number' ? a : 0;
        const nb: number = typeof b === 'number' ? b : 0;
        return na - nb;
      });
      expect(list.get(0)).assertEqual(1);
      expect(list.get(2)).assertEqual(5);

      expect(list.getFirst()).assertEqual(1);
      expect(list.getLast()).assertEqual(5);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListUnionTest0600
     * @tc.number SUB_ARKTS_LIST_UNION_0600
     * @tc.desc   Verify List union-type out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<UnionAllValue> = new List<UnionAllValue>();
      list.add(1);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

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
        list.insert(9, 66);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<UnionAllValue> = new List<UnionAllValue>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
