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

export default function arrayListMixedTest() {
  describe('ArrayListMixedTest', () => {
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
     * @tc.name   testArrayListMixedTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_MIXED_0100
     * @tc.desc   Verify ArrayList mixed-type constructor and add with number, string, boolean, bigint, null and object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMixedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<MixedItem> = new ArrayList<MixedItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<MixedItem> = new ArrayList<MixedItem>();
      for (let i = 0; i < MIXED_VALUES.length; i++) {
        expect(list.add(MIXED_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(MIXED_VALUES.length);
      expect(list[0]).assertEqual(1);
      expect(list[1]).assertEqual('text');
      expect(list[2]).assertTrue();
      expect(list[3]).assertEqual(100n);
      expect(list[4]).assertNull();
      expect(list[5]).assertUndefined();
      expect(list[6]).assertEqual('sym');
      expect(list[9]).assertEqual(MIXED_VALUES[9]);
    });

    /**
     * @tc.name   testArrayListMixedTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_MIXED_0200
     * @tc.desc   Verify ArrayList mixed-type has, getIndexOf, getLastIndexOf, insert and remove behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMixedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<MixedItem> = new ArrayList<MixedItem>();
      const obj: MixedClass = new MixedClass(1);
      list.add(obj);
      list.add('dup');
      list.add(obj);

      expect(list.has(obj)).assertTrue();
      expect(list.has(new MixedClass(1))).assertFalse();      expect(list.getIndexOf(obj)).assertEqual(0);
      expect(list.getLastIndexOf(obj)).assertEqual(2);
      expect(list.getIndexOf('dup')).assertEqual(1);
      expect(list.getIndexOf('missing')).assertEqual(-1);

      list.insert(null, 0);
      expect(list[0]).assertNull();
      expect(list.length).assertEqual(4);

      expect(list.remove(obj)).assertTrue();
      expect(list.getIndexOf(obj)).assertEqual(2);
      expect(list.remove(999)).assertFalse();
    });

    /**
     * @tc.name   testArrayListMixedTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_MIXED_0300
     * @tc.desc   Verify ArrayList mixed-type removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMixedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<MixedItem> = new ArrayList<MixedItem>();
      list.add(1);
      list.add('b');
      list.add(true);
      list.add(null);

      const removed: MixedItem = list.removeByIndex(1);
      expect(removed).assertEqual('b');
      expect(list.length).assertEqual(3);

      list.removeByRange(1, 3);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(1);

      const src: ArrayList<MixedItem> = new ArrayList<MixedItem>();
      src.add('x');
      src.add(undefined);
      src.add('y');
      const sub: ArrayList<MixedItem> = src.subArrayList(0, 3);
      expect(sub.length).assertEqual(3);
      expect(sub[1]).assertUndefined();
      expect(src.length).assertEqual(3);

      const cloned: ArrayList<MixedItem> = src.clone();
      cloned.add('new');
      expect(src.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned[2]).assertEqual(src[2]);
    });

    /**
     * @tc.name   testArrayListMixedTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_MIXED_0400
     * @tc.desc   Verify ArrayList mixed-type replaceAllElements and forEach with typeof filtering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMixedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<MixedItem> = new ArrayList<MixedItem>();
      list.add(1);
      list.add(2);
      list.add('skip');

      list.replaceAllElements((value: MixedItem): MixedItem => {
        if (typeof value === 'number') {
          return value * 10;
        }
        return 0;
      });
      expect(list[0]).assertEqual(10);
      expect(list[1]).assertEqual(20);
      expect(list[2]).assertEqual(0);

      const numbers: Array<number> = [];
      list.forEach((value: MixedItem) => {
        if (typeof value === 'number') {
          numbers.push(value);
        }
      });
      expect(numbers.length).assertEqual(3);
      expect(numbers[2]).assertEqual(0);
    });

    /**
     * @tc.name   testArrayListMixedTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_MIXED_0500
     * @tc.desc   Verify ArrayList mixed-type sort with numeric fallback, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMixedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<MixedItem> = new ArrayList<MixedItem>();
      list.add(30);
      list.add('10');
      list.add(20);

      list.sort((a: MixedItem, b: MixedItem): number => {
        const na: number = typeof a === 'number' ? a : 0;
        const nb: number = typeof b === 'number' ? b : 0;
        return na - nb;
      });
      expect(list[0]).assertEqual('10');
      expect(list[1]).assertEqual(20);
      expect(list[2]).assertEqual(30);

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(30);
      expect(list.getCapacity() >= 30).assertTrue();
      list.add(false);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
    });

    /**
     * @tc.name   testArrayListMixedTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_MIXED_0600
     * @tc.desc   Verify ArrayList mixed-type boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListMixedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<MixedItem> = new ArrayList<MixedItem>();
      list.add(1);
      let accessThrew: boolean = false;
      try {
        const beyond: MixedItem = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

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
