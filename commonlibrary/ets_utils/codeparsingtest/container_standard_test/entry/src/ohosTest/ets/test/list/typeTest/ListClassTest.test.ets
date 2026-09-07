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

interface ClassInvalidObject {
  marker: string;
}

const CLASS_INVALID_OBJECT: ClassInvalidObject = { marker: 'invalid' };

class ListClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const CLASS_A = new ListClassItem(1, '测试');
const CLASS_B = new ListClassItem(0, '');
const CLASS_C = new ListClassItem(-1, '测试😀');
const CLASS_D = new ListClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E = new ListClassItem(13800138000, '13800138000');
const CLASS_F = new ListClassItem(99999999, '<script>alert(1)</script>');

const VALID_VALUES: Array<ListClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];

type ClassInvalidValue = number | string | null | undefined | ClassInvalidObject | Array<number>;
type ClassAllValue = ListClassItem | ClassInvalidValue;

const ALL_VALUES: Array<ClassAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, CLASS_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function listClassTest() {
  describe('ListClassTest', () => {
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
     * @tc.name   testListClassTest0100
     * @tc.number SUB_ARKTS_LIST_CLASS_0100
     * @tc.desc   Verify List class instance constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<ListClassItem> = new List<ListClassItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<ListClassItem> = new List<ListClassItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(CLASS_A);
      expect(list.get(6)).assertEqual(CLASS_A);
      expect(list[3].label.length).assertEqual(100);
      expect(list.getFirst()).assertEqual(CLASS_A);
      expect(list.getLast()).assertEqual(CLASS_A);

      const mixed: List<ClassAllValue> = new List<ClassAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(CLASS_A);
    });

    /**
     * @tc.name   testListClassTest0200
     * @tc.number SUB_ARKTS_LIST_CLASS_0200
     * @tc.desc   Verify List class instance has, getIndexOf, getLastIndexOf, insert, remove and equal with reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListClassItem> = new List<ListClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_A);

      expect(list.has(CLASS_A)).assertTrue();
      expect(list.has(new ListClassItem(1, '测试'))).assertFalse();
      expect(list.getIndexOf(CLASS_A)).assertEqual(0);
      expect(list.getLastIndexOf(CLASS_A)).assertEqual(2);
      expect(list.getIndexOf(CLASS_C)).assertEqual(-1);

      list.insert(CLASS_C, 0);
      expect(list.get(0)).assertEqual(CLASS_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(CLASS_A)).assertTrue();
      expect(list.getIndexOf(CLASS_A)).assertEqual(2);
      expect(list.remove(CLASS_D)).assertFalse();

      const same: List<ListClassItem> = new List<ListClassItem>();
      same.add(CLASS_C);
      same.add(CLASS_B);
      same.add(CLASS_A);
      expect(list.equal(same)).assertTrue();
      same.add(CLASS_A);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListClassTest0300
     * @tc.number SUB_ARKTS_LIST_CLASS_0300
     * @tc.desc   Verify List class instance removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListClassItem> = new List<ListClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_C);
      list.add(CLASS_D);

      const removed: ListClassItem = list.removeByIndex(1);
      expect(removed).assertEqual(CLASS_B);
      expect(list.length).assertEqual(3);
      expect(list.get(1)).assertEqual(CLASS_C);

      expect(list.remove(CLASS_A)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<ListClassItem> = new List<ListClassItem>();
      src.add(CLASS_E);
      src.add(CLASS_F);
      const sub: List<ListClassItem> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(1)).assertEqual(CLASS_F);
      expect(src.length).assertEqual(2);
      sub.add(CLASS_A);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.name   testListClassTest0400
     * @tc.number SUB_ARKTS_LIST_CLASS_0400
     * @tc.desc   Verify List class instance set, replaceAllElements, forEach, iterator traversal and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListClassItem> = new List<ListClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_C);

      const old: ListClassItem = list.set(1, CLASS_F);
      expect(old).assertEqual(CLASS_F);
      expect(list.get(1)).assertEqual(CLASS_F);
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: ListClassItem): ListClassItem => {
        return new ListClassItem(value.id + 1, value.label);
      });
      expect(list.get(0).id).assertEqual(2);
      expect(list.get(2).id).assertEqual(0);
      expect(list.get(0).label).assertEqual('测试');

      const ids: Array<number> = [];
      list.forEach((value: ListClassItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(2);

      let indexSum: number = 0;
      list.forEach((value: ListClassItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<ListClassItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertEqual(list.get(2));

      const arr: Array<ListClassItem> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(list.get(0));
    });

    /**
     * @tc.name   testListClassTest0500
     * @tc.number SUB_ARKTS_LIST_CLASS_0500
     * @tc.desc   Verify List class instance sort by id field plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListClassItem> = new List<ListClassItem>();
      list.add(CLASS_C);
      list.add(CLASS_A);
      list.add(CLASS_B);

      list.sort((a: ListClassItem, b: ListClassItem): number => {
        return a.id - b.id;
      });
      expect(list.get(0)).assertEqual(CLASS_C);
      expect(list.get(2)).assertEqual(CLASS_A);

      expect(list.getFirst()).assertEqual(CLASS_C);
      expect(list.getLast()).assertEqual(CLASS_A);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListClassTest0600
     * @tc.number SUB_ARKTS_LIST_CLASS_0600
     * @tc.desc   Verify List class instance out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListClassItem> = new List<ListClassItem>();
      list.add(CLASS_A);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(7);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(CLASS_B, 66);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<ListClassItem> = new List<ListClassItem>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
