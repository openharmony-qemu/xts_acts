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

interface BooleanInvalidObject {
  marker: string;
}

const BOOLEAN_INVALID_OBJECT: BooleanInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<boolean> = [true, false, true, false];

type BooleanInvalidValue = number | string | null | undefined | BooleanInvalidObject | Array<number>;
type BooleanAllValue = boolean | BooleanInvalidValue;

const ALL_VALUES: Array<BooleanAllValue> = [
  ...VALID_VALUES,
  1, 0, NaN, 'true', 'false', null, undefined, '', BOOLEAN_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function listBooleanTest() {
  describe('ListBooleanTest', () => {
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
     * @tc.name   testListBooleanTest0100
     * @tc.number SUB_ARKTS_LIST_BOOLEAN_0100
     * @tc.desc   Verify List boolean constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<boolean> = new List<boolean>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<boolean> = new List<boolean>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(4);
      expect(list.get(0)).assertTrue();
      expect(list.get(1)).assertFalse();
      expect(list[2]).assertTrue();
      expect(list.getFirst()).assertTrue();
      expect(list.getLast()).assertFalse();

      const mixed: List<BooleanAllValue> = new List<BooleanAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(4)).assertEqual(1);
    });

    /**
     * @tc.name   testListBooleanTest0200
     * @tc.number SUB_ARKTS_LIST_BOOLEAN_0200
     * @tc.desc   Verify List boolean has, getIndexOf, getLastIndexOf, insert, remove and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<boolean> = new List<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);

      expect(list.has(true)).assertTrue();
      expect(list.has(false)).assertTrue();
      expect(list.getIndexOf(false)).assertEqual(1);
      expect(list.getLastIndexOf(true)).assertEqual(2);
      expect(list.getLastIndexOf(false)).assertEqual(1);

      list.insert(false, 0);
      expect(list.get(0)).assertFalse();
      expect(list.length).assertEqual(4);
      expect(list.remove(false)).assertTrue();
      expect(list.getIndexOf(false)).assertEqual(1);
      expect(list.remove(false)).assertTrue();
      expect(list.has(false)).assertFalse();

      const same: List<boolean> = new List<boolean>();
      same.add(true);
      same.add(true);
      expect(list.equal(same)).assertTrue();
      same.add(false);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListBooleanTest0300
     * @tc.number SUB_ARKTS_LIST_BOOLEAN_0300
     * @tc.desc   Verify List boolean removeByIndex, remove, getSubList and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<boolean> = new List<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);
      list.add(true);

      const removed: boolean = list.removeByIndex(1);
      expect(removed).assertFalse();
      expect(list.length).assertEqual(3);

      expect(list.remove(true)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<boolean> = new List<boolean>();
      src.add(false);
      src.add(true);
      const sub: List<boolean> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(0)).assertFalse();
      expect(src.length).assertEqual(2);
      sub.add(false);
      expect(src.length).assertEqual(2);

      const arr: Array<boolean> = src.convertToArray();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertTrue();
    });

    /**
     * @tc.name   testListBooleanTest0400
     * @tc.number SUB_ARKTS_LIST_BOOLEAN_0400
     * @tc.desc   Verify List boolean set, replaceAllElements, forEach and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<boolean> = new List<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);

      const old: boolean = list.set(0, false);
      expect(old).assertFalse();
      expect(list.get(0)).assertFalse();
      expect(list.length).assertEqual(3);

      const beforeReverse: Array<boolean> = [];
      list.forEach((value: boolean) => {
        beforeReverse.push(value);
      });
      list.replaceAllElements((value: boolean): boolean => {
        return !value;
      });
      const afterReverse: Array<boolean> = [];
      list.forEach((value: boolean) => {
        afterReverse.push(value);
      });
      expect(afterReverse.length).assertEqual(beforeReverse.length);

      let trueCount: number = 0;
      list.forEach((value: boolean) => {
        if (value) {
          trueCount++;
        }
      });
      expect(trueCount).assertEqual(2);

      let indexSum: number = 0;
      list.forEach((value: boolean, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<boolean> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
    });

    /**
     * @tc.name   testListBooleanTest0500
     * @tc.number SUB_ARKTS_LIST_BOOLEAN_0500
     * @tc.desc   Verify List boolean sort with comparator plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<boolean> = new List<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);
      list.add(false);

      list.sort((a: boolean, b: boolean): number => {
        return Number(a) - Number(b);
      });
      expect(list.get(0)).assertFalse();
      expect(list.get(3)).assertTrue();

      expect(list.getFirst()).assertFalse();
      expect(list.getLast()).assertTrue();
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListBooleanTest0600
     * @tc.number SUB_ARKTS_LIST_BOOLEAN_0600
     * @tc.desc   Verify List boolean out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<boolean> = new List<boolean>();
      list.add(true);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(5);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(false, 100);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<boolean> = new List<boolean>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
