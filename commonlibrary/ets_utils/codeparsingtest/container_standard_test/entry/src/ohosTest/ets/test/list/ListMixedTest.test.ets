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

interface MixedInvalidObject {
  marker: string;
}

const MIXED_INVALID_OBJECT: MixedInvalidObject = { marker: 'invalid' };

class MixedClass {
  value: number;

  constructor(value: number) {
    this.value = value;
  }
}

type MixedItem = number | string | boolean | bigint | null | undefined | MixedClass | MixedInvalidObject | Array<number>;

const MIXED_VALUES: Array<MixedItem> = [
  1, 'text', true, 100n, null, undefined, 'sym', new MixedClass(7), MIXED_INVALID_OBJECT, [1, 2],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function listMixedTest() {
  describe('ListMixedTest', () => {
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
     * @tc.name   testListMixedTest0100
     * @tc.number SUB_ARKTS_LIST_MIXED_0100
     * @tc.desc   Verify List mixed-type constructor, add, length, get, getFirst and getLast with various value types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMixedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<MixedItem> = new List<MixedItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<MixedItem> = new List<MixedItem>();
      for (let i = 0; i < MIXED_VALUES.length; i++) {
        expect(list.add(MIXED_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(MIXED_VALUES.length);
      expect(list.get(0)).assertEqual(1);
      expect(list.get(1)).assertEqual('text');
      expect(list.get(2)).assertTrue();
      expect(list.get(3)).assertEqual(100n);
      expect(list.get(4)).assertNull();
      expect(list.get(5)).assertUndefined();
      expect(list.get(6)).assertEqual('sym');
      expect(list.get(9)).assertEqual(MIXED_VALUES[9]);
      expect(list.getFirst()).assertEqual(1);
      expect(list.getLast()).assertEqual(MIXED_VALUES[9]);
    });

    /**
     * @tc.name   testListMixedTest0200
     * @tc.number SUB_ARKTS_LIST_MIXED_0200
     * @tc.desc   Verify List mixed-type has, getIndexOf, getLastIndexOf, insert, remove and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMixedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<MixedItem> = new List<MixedItem>();
      const obj: MixedClass = new MixedClass(1);
      list.add(obj);
      list.add('dup');
      list.add(obj);

      expect(list.has(obj)).assertTrue();
      expect(list.has(new MixedClass(1))).assertFalse();
      expect(list.getIndexOf(obj)).assertEqual(0);
      expect(list.getLastIndexOf(obj)).assertEqual(2);
      expect(list.getIndexOf('dup')).assertEqual(1);
      expect(list.getIndexOf('missing')).assertEqual(-1);

      list.insert(null, 0);
      expect(list.get(0)).assertNull();
      expect(list.length).assertEqual(4);

      expect(list.remove(obj)).assertTrue();
      expect(list.getIndexOf(obj)).assertEqual(2);
      expect(list.remove(999)).assertFalse();

      const same: List<MixedItem> = new List<MixedItem>();
      same.add(null);
      same.add('dup');
      same.add(obj);
      expect(list.equal(same)).assertTrue();
      same.add(null);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListMixedTest0300
     * @tc.number SUB_ARKTS_LIST_MIXED_0300
     * @tc.desc   Verify List mixed-type removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMixedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<MixedItem> = new List<MixedItem>();
      list.add(1);
      list.add('b');
      list.add(true);
      list.add(null);

      const removed: MixedItem = list.removeByIndex(1);
      expect(removed).assertEqual('b');
      expect(list.length).assertEqual(3);

      expect(list.remove(true)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<MixedItem> = new List<MixedItem>();
      src.add('x');
      src.add(undefined);
      src.add('y');
      const sub: List<MixedItem> = src.getSubList(0, 3);
      expect(sub.length).assertEqual(3);
      expect(sub.get(1)).assertUndefined();
      expect(src.length).assertEqual(3);
      sub.add('new');
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.name   testListMixedTest0400
     * @tc.number SUB_ARKTS_LIST_MIXED_0400
     * @tc.desc   Verify List mixed-type set, replaceAllElements, forEach, iterator traversal and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMixedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<MixedItem> = new List<MixedItem>();
      list.add(1);
      list.add(2);
      list.add('skip');

      const old: MixedItem = list.set(2, false);
      expect(old).assertFalse();
      expect(list.get(2)).assertFalse();
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: MixedItem): MixedItem => {
        if (typeof value === 'number') {
          return value * 10;
        }
        return 0;
      });
      expect(list.get(0)).assertEqual(10);
      expect(list.get(1)).assertEqual(20);
      expect(list.get(2)).assertEqual(0);

      const numbers: Array<number> = [];
      list.forEach((value: MixedItem) => {
        if (typeof value === 'number') {
          numbers.push(value);
        }
      });
      expect(numbers.length).assertEqual(3);
      expect(numbers[2]).assertEqual(0);

      let indexSum: number = 0;
      list.forEach((value: MixedItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<MixedItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(20);

      const arr: Array<MixedItem> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.name   testListMixedTest0500
     * @tc.number SUB_ARKTS_LIST_MIXED_0500
     * @tc.desc   Verify List mixed-type sort with numeric-aware comparator plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMixedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<MixedItem> = new List<MixedItem>();
      list.add(30);
      list.add('10');
      list.add(20);

      list.sort((a: MixedItem, b: MixedItem): number => {
        const na: number = typeof a === 'number' ? a : 0;
        const nb: number = typeof b === 'number' ? b : 0;
        return na - nb;
      });
      expect(list.get(0)).assertEqual('10');
      expect(list.get(1)).assertEqual(20);
      expect(list.get(2)).assertEqual(30);

      expect(list.getFirst()).assertEqual('10');
      expect(list.getLast()).assertEqual(30);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListMixedTest0600
     * @tc.number SUB_ARKTS_LIST_MIXED_0600
     * @tc.desc   Verify List mixed-type out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListMixedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<MixedItem> = new List<MixedItem>();
      list.add(1);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(70);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert('out', 31);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<MixedItem> = new List<MixedItem>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
