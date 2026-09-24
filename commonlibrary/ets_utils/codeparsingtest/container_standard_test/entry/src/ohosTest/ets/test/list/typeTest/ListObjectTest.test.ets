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

interface ListObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}

interface ObjectInvalidObject {
  marker: string;
}

const OBJECT_INVALID_OBJECT: ObjectInvalidObject = { marker: 'invalid' };

const OBJECT_A: ListObjectItem = { id: 1, label: '', name: '测试', age: 20 };
const OBJECT_B: ListObjectItem = { id: 2, label: '测试😀', grade: 3, className: 'A' };
const OBJECT_C: ListObjectItem = { id: 3, label: 'a'.repeat(100), extra: Number.MAX_SAFE_INTEGER };
const OBJECT_D: ListObjectItem = { id: 4, label: '13800138000', name: '138****8000' };
const OBJECT_E: ListObjectItem = { id: 5, label: 'test@example.com' };
const OBJECT_F: ListObjectItem = { id: 6, label: 'https://test.com', grade: -1 };

const VALID_VALUES: Array<ListObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];

type ObjectAllValue = ListObjectItem | number | string | null | undefined | ObjectInvalidObject;

const ALL_VALUES: Array<ObjectAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, OBJECT_INVALID_OBJECT,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function listObjectTest() {
  describe('ListObjectTest', () => {
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
     * @tc.name   testListObjectTest0100
     * @tc.number SUB_ARKTS_LIST_OBJECT_0100
     * @tc.desc   Verify List object constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<ListObjectItem> = new List<ListObjectItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<ListObjectItem> = new List<ListObjectItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(OBJECT_A);
      expect(list.get(6)).assertEqual(OBJECT_A);
      expect(list.get(2).label.length).assertEqual(100);
      expect(list.getFirst()).assertEqual(OBJECT_A);
      expect(list.getLast()).assertEqual(OBJECT_A);

      const mixed: List<ObjectAllValue> = new List<ObjectAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(OBJECT_A);
    });

    /**
     * @tc.name   testListObjectTest0200
     * @tc.number SUB_ARKTS_LIST_OBJECT_0200
     * @tc.desc   Verify List object has, getIndexOf, getLastIndexOf, insert, remove and equal with reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListObjectItem> = new List<ListObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_A);

      expect(list.has(OBJECT_A)).assertTrue();
      expect(list.has({ id: 1, label: '', name: '测试', age: 20 })).assertFalse();
      expect(list.getIndexOf(OBJECT_A)).assertEqual(0);
      expect(list.getLastIndexOf(OBJECT_A)).assertEqual(2);
      expect(list.getIndexOf(OBJECT_C)).assertEqual(-1);

      list.insert(OBJECT_C, 0);
      expect(list.get(0)).assertEqual(OBJECT_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(OBJECT_A)).assertTrue();
      expect(list.getIndexOf(OBJECT_A)).assertEqual(2);
      expect(list.remove(OBJECT_D)).assertFalse();

      const same: List<ListObjectItem> = new List<ListObjectItem>();
      same.add(OBJECT_C);
      same.add(OBJECT_B);
      same.add(OBJECT_A);
      expect(list.equal(same)).assertTrue();
      same.add(OBJECT_A);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListObjectTest0300
     * @tc.number SUB_ARKTS_LIST_OBJECT_0300
     * @tc.desc   Verify List object removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListObjectItem> = new List<ListObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_C);
      list.add(OBJECT_D);

      const removed: ListObjectItem = list.removeByIndex(3);
      expect(removed).assertEqual(OBJECT_D);
      expect(list.length).assertEqual(3);

      expect(list.remove(OBJECT_A)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<ListObjectItem> = new List<ListObjectItem>();
      src.add(OBJECT_E);
      src.add(OBJECT_F);
      const sub: List<ListObjectItem> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(1)).assertEqual(OBJECT_F);
      expect(src.length).assertEqual(2);
      sub.add(OBJECT_A);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.name   testListObjectTest0400
     * @tc.number SUB_ARKTS_LIST_OBJECT_0400
     * @tc.desc   Verify List object set, replaceAllElements, forEach, iterator traversal and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListObjectItem> = new List<ListObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_C);

      const old: ListObjectItem = list.set(1, OBJECT_F);
      expect(old).assertEqual(OBJECT_F);
      expect(list.get(1)).assertEqual(OBJECT_F);
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: ListObjectItem): ListObjectItem => {
        const next: ListObjectItem = { id: value.id + 10, label: value.label };
        return next;
      });
      expect(list.get(0).id).assertEqual(11);
      expect(list.get(2).id).assertEqual(13);
      expect(list.get(0).label).assertEqual('');

      const ids: Array<number> = [];
      list.forEach((value: ListObjectItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[2]).assertEqual(13);

      let indexSum: number = 0;
      list.forEach((value: ListObjectItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<ListObjectItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(list.get(1));

      const arr: Array<ListObjectItem> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(list.get(0));
    });

    /**
     * @tc.name   testListObjectTest0500
     * @tc.number SUB_ARKTS_LIST_OBJECT_0500
     * @tc.desc   Verify List object sort by id field plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListObjectItem> = new List<ListObjectItem>();
      list.add(OBJECT_F);
      list.add(OBJECT_A);
      list.add(OBJECT_C);

      list.sort((a: ListObjectItem, b: ListObjectItem): number => {
        return a.id - b.id;
      });
      expect(list.get(0)).assertEqual(OBJECT_A);
      expect(list.get(2)).assertEqual(OBJECT_F);

      expect(list.getFirst()).assertEqual(OBJECT_A);
      expect(list.getLast()).assertEqual(OBJECT_F);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListObjectTest0600
     * @tc.number SUB_ARKTS_LIST_OBJECT_0600
     * @tc.desc   Verify List object out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListObjectItem> = new List<ListObjectItem>();
      list.add(OBJECT_A);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(10);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(OBJECT_B, 44);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<ListObjectItem> = new List<ListObjectItem>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
