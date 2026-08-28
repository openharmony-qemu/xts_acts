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

interface ClassInvalidObject {
  marker: string;
}

const CLASS_INVALID_OBJECT: ClassInvalidObject = { marker: 'invalid' };

class ArrayClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const CLASS_A = new ArrayClassItem(1, '测试');
const CLASS_B = new ArrayClassItem(0, '');
const CLASS_C = new ArrayClassItem(-1, '测试😀');
const CLASS_D = new ArrayClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E = new ArrayClassItem(13800138000, '13800138000');
const CLASS_F = new ArrayClassItem(99999999, '<script>alert(1)</script>');

const VALID_VALUES: Array<ArrayClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];

type ClassInvalidValue = number | string | null | undefined | ClassInvalidObject | Array<number>;
type ClassAllValue = ArrayClassItem | ClassInvalidValue;

const ALL_VALUES: Array<ClassAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, CLASS_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function arrayListClassTest() {
  describe('ArrayListClassTest', () => {
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
     * @tc.name   testArrayListClassTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_CLASS_0100
     * @tc.desc   Verify ArrayList class instance constructor and add with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<ArrayClassItem> = new ArrayList<ArrayClassItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<ArrayClassItem> = new ArrayList<ArrayClassItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(CLASS_A);
      expect(list[6]).assertEqual(CLASS_A);
      expect(list[3].label.length).assertEqual(100);

      const mixed: ArrayList<ClassAllValue> = new ArrayList<ClassAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(CLASS_A);
    });

    /**
     * @tc.name   testArrayListClassTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_CLASS_0200
     * @tc.desc   Verify ArrayList class instance has, getIndexOf, getLastIndexOf, insert and remove by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayClassItem> = new ArrayList<ArrayClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_A);

      expect(list.has(CLASS_A)).assertTrue();
      expect(list.has(new ArrayClassItem(1, '测试'))).assertFalse();
      expect(list.getIndexOf(CLASS_A)).assertEqual(0);
      expect(list.getLastIndexOf(CLASS_A)).assertEqual(2);
      expect(list.getIndexOf(CLASS_C)).assertEqual(-1);

      list.insert(CLASS_C, 0);
      expect(list[0]).assertEqual(CLASS_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(CLASS_A)).assertTrue();
      expect(list.getIndexOf(CLASS_A)).assertEqual(2);
      expect(list.remove(CLASS_D)).assertFalse();
    });

    /**
     * @tc.name   testArrayListClassTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_CLASS_0300
     * @tc.desc   Verify ArrayList class instance removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayClassItem> = new ArrayList<ArrayClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_C);
      list.add(CLASS_D);

      const removed: ArrayClassItem = list.removeByIndex(1);
      expect(removed).assertEqual(CLASS_B);
      expect(list.length).assertEqual(3);
      expect(list[1]).assertEqual(CLASS_C);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(CLASS_D);

      const src: ArrayList<ArrayClassItem> = new ArrayList<ArrayClassItem>();
      src.add(CLASS_E);
      src.add(CLASS_F);
      const sub: ArrayList<ArrayClassItem> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[1]).assertEqual(CLASS_F);
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<ArrayClassItem> = src.clone();
      cloned.add(CLASS_A);
      expect(src.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);
      expect(cloned[0]).assertEqual(src[0]);
    });

    /**
     * @tc.name   testArrayListClassTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_CLASS_0400
     * @tc.desc   Verify ArrayList class instance replaceAllElements, forEach and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayClassItem> = new ArrayList<ArrayClassItem>();
      list.add(CLASS_A);
      list.add(CLASS_B);
      list.add(CLASS_C);

      list.replaceAllElements((value: ArrayClassItem): ArrayClassItem => {
        return new ArrayClassItem(value.id + 1, value.label);
      });
      expect(list[0].id).assertEqual(2);
      expect(list[1].id).assertEqual(1);
      expect(list[2].id).assertEqual(0);
      expect(list[0].label).assertEqual('测试');

      const ids: Array<number> = [];
      list.forEach((value: ArrayClassItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(2);

      const iterValues: Array<ArrayClassItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertEqual(list[2]);
    });

    /**
     * @tc.name   testArrayListClassTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_CLASS_0500
     * @tc.desc   Verify ArrayList class instance sort by id, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayClassItem> = new ArrayList<ArrayClassItem>();
      list.add(CLASS_C);
      list.add(CLASS_A);
      list.add(CLASS_B);

      list.sort((a: ArrayClassItem, b: ArrayClassItem): number => {
        return a.id - b.id;
      });
      expect(list[0]).assertEqual(CLASS_C);
      expect(list[2]).assertEqual(CLASS_A);

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(18);
      expect(list.getCapacity() >= 18).assertTrue();
      list.add(CLASS_D);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
      expect(list[3]).assertEqual(CLASS_D);
    });

    /**
     * @tc.name   testArrayListClassTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_CLASS_0600
     * @tc.desc   Verify ArrayList class instance boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayClassItem> = new ArrayList<ArrayClassItem>();
      list.add(CLASS_A);
      let accessThrew: boolean = false;
      try {
        const beyond: ArrayClassItem = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

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
