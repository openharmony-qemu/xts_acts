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

interface ArrayObjectItem {
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

const OBJECT_A: ArrayObjectItem = { id: 1, label: '', name: '测试', age: 20 };
const OBJECT_B: ArrayObjectItem = { id: 2, label: '测试😀', grade: 3, className: 'A' };
const OBJECT_C: ArrayObjectItem = { id: 3, label: 'a'.repeat(100), extra: Number.MAX_SAFE_INTEGER };
const OBJECT_D: ArrayObjectItem = { id: 4, label: '13800138000', name: '138****8000' };
const OBJECT_E: ArrayObjectItem = { id: 5, label: 'test@example.com' };
const OBJECT_F: ArrayObjectItem = { id: 6, label: 'https://test.com', grade: -1 };

const VALID_VALUES: Array<ArrayObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];

type ObjectAllValue = ArrayObjectItem | number | string | null | undefined | ObjectInvalidObject;

const ALL_VALUES: Array<ObjectAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, OBJECT_INVALID_OBJECT,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function arrayListObjectTest() {
  describe('ArrayListObjectTest', () => {
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
     * @tc.name   testArrayListObjectTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_OBJECT_0100
     * @tc.desc   Verify ArrayList object constructor and add with valid and mixed object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<ArrayObjectItem> = new ArrayList<ArrayObjectItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<ArrayObjectItem> = new ArrayList<ArrayObjectItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(OBJECT_A);
      expect(list[6]).assertEqual(OBJECT_A);
      expect(list[2].label.length).assertEqual(100);

      const mixed: ArrayList<ObjectAllValue> = new ArrayList<ObjectAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(OBJECT_A);
    });

    /**
     * @tc.name   testArrayListObjectTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_OBJECT_0200
     * @tc.desc   Verify ArrayList object has, getIndexOf, getLastIndexOf, insert and remove by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayObjectItem> = new ArrayList<ArrayObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_A);

      expect(list.has(OBJECT_A)).assertTrue();
      expect(list.has({ id: 1, label: '', name: '测试', age: 20 })).assertFalse();
      expect(list.getIndexOf(OBJECT_A)).assertEqual(0);
      expect(list.getLastIndexOf(OBJECT_A)).assertEqual(2);
      expect(list.getIndexOf(OBJECT_C)).assertEqual(-1);

      list.insert(OBJECT_C, 0);
      expect(list[0]).assertEqual(OBJECT_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(OBJECT_A)).assertTrue();
      expect(list.getIndexOf(OBJECT_A)).assertEqual(2);
      expect(list.remove(OBJECT_D)).assertFalse();
    });

    /**
     * @tc.name   testArrayListObjectTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_OBJECT_0300
     * @tc.desc   Verify ArrayList object removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayObjectItem> = new ArrayList<ArrayObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_C);
      list.add(OBJECT_D);

      const removed: ArrayObjectItem = list.removeByIndex(3);
      expect(removed).assertEqual(OBJECT_D);
      expect(list.length).assertEqual(3);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(OBJECT_C);

      const src: ArrayList<ArrayObjectItem> = new ArrayList<ArrayObjectItem>();
      src.add(OBJECT_E);
      src.add(OBJECT_F);
      const sub: ArrayList<ArrayObjectItem> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[1]).assertEqual(OBJECT_F);
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<ArrayObjectItem> = src.clone();
      cloned.add(OBJECT_A);
      expect(src.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);
      expect(cloned[0]).assertEqual(src[0]);
    });

    /**
     * @tc.name   testArrayListObjectTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_OBJECT_0400
     * @tc.desc   Verify ArrayList object replaceAllElements and forEach transforming stored objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayObjectItem> = new ArrayList<ArrayObjectItem>();
      list.add(OBJECT_A);
      list.add(OBJECT_B);
      list.add(OBJECT_C);

      list.replaceAllElements((value: ArrayObjectItem): ArrayObjectItem => {
        const next: ArrayObjectItem = { id: value.id + 10, label: value.label };
        return next;
      });
      expect(list[0].id).assertEqual(11);
      expect(list[1].id).assertEqual(12);
      expect(list[2].id).assertEqual(13);
      expect(list[0].label).assertEqual('');

      const ids: Array<number> = [];
      list.forEach((value: ArrayObjectItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[2]).assertEqual(13);
    });

    /**
     * @tc.name   testArrayListObjectTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_OBJECT_0500
     * @tc.desc   Verify ArrayList object sort by id, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayObjectItem> = new ArrayList<ArrayObjectItem>();
      list.add(OBJECT_F);
      list.add(OBJECT_A);
      list.add(OBJECT_C);

      list.sort((a: ArrayObjectItem, b: ArrayObjectItem): number => {
        return a.id - b.id;
      });
      expect(list[0]).assertEqual(OBJECT_A);
      expect(list[2]).assertEqual(OBJECT_F);

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(17);
      expect(list.getCapacity() >= 17).assertTrue();
      list.add(OBJECT_D);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
      expect(list[3]).assertEqual(OBJECT_D);
    });

    /**
     * @tc.name   testArrayListObjectTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_OBJECT_0600
     * @tc.desc   Verify ArrayList object boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayObjectItem> = new ArrayList<ArrayObjectItem>();
      list.add(OBJECT_A);
      let accessThrew: boolean = false;
      try {
        const beyond: ArrayObjectItem = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

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
