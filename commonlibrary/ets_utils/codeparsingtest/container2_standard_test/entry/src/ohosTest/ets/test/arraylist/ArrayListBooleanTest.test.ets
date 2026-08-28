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

export default function arrayListBooleanTest() {
  describe('ArrayListBooleanTest', () => {
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
     * @tc.name   testArrayListBooleanTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_BOOLEAN_0100
     * @tc.desc   Verify ArrayList boolean constructor and add with valid and mixed boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<boolean> = new ArrayList<boolean>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<boolean> = new ArrayList<boolean>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(4);
      expect(list[0]).assertTrue();
      expect(list[1]).assertFalse();
      expect(list[2]).assertTrue();

      const mixed: ArrayList<BooleanAllValue> = new ArrayList<BooleanAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[4]).assertEqual(1);
    });

    /**
     * @tc.name   testArrayListBooleanTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_BOOLEAN_0200
     * @tc.desc   Verify ArrayList boolean has, getIndexOf, getLastIndexOf, insert and remove behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<boolean> = new ArrayList<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);

      expect(list.has(true)).assertTrue();
      expect(list.has(false)).assertTrue();
      expect(list.getIndexOf(false)).assertEqual(1);
      expect(list.getLastIndexOf(true)).assertEqual(2);
      expect(list.getIndexOf(false)).assertEqual(list.getLastIndexOf(false));

      list.insert(false, 0);
      expect(list[0]).assertFalse();
      expect(list.length).assertEqual(4);
      expect(list.remove(false)).assertTrue();
      expect(list.getIndexOf(false)).assertEqual(1);
      expect(list.remove(false)).assertTrue();
      expect(list.has(false)).assertFalse();
    });

    /**
     * @tc.name   testArrayListBooleanTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_BOOLEAN_0300
     * @tc.desc   Verify ArrayList boolean removeByIndex, removeByRange, subArrayList, clone and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<boolean> = new ArrayList<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);
      list.add(true);

      const removed: boolean = list.removeByIndex(1);
      expect(removed).assertFalse();
      expect(list.length).assertEqual(3);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertTrue();

      const src: ArrayList<boolean> = new ArrayList<boolean>();
      src.add(false);
      src.add(true);
      const sub: ArrayList<boolean> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertFalse();
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<boolean> = src.clone();
      cloned.add(false);
      expect(src.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);

      const arr: Array<boolean> = src.convertToArray();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertTrue();
    });

    /**
     * @tc.name   testArrayListBooleanTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_BOOLEAN_0400
     * @tc.desc   Verify ArrayList boolean replaceAllElements, forEach and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<boolean> = new ArrayList<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);

      list.replaceAllElements((value: boolean): boolean => {
        return !value;
      });
      expect(list[0]).assertFalse();
      expect(list[1]).assertTrue();
      expect(list[2]).assertFalse();

      let trueCount: number = 0;
      list.forEach((value: boolean) => {
        if (value) {
          trueCount++;
        }
      });
      expect(trueCount).assertEqual(1);

      const iterValues: Array<boolean> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertTrue();
    });

    /**
     * @tc.name   testArrayListBooleanTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_BOOLEAN_0500
     * @tc.desc   Verify ArrayList boolean sort, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<boolean> = new ArrayList<boolean>();
      list.add(true);
      list.add(false);
      list.add(true);
      list.add(false);

      list.sort((a: boolean, b: boolean): number => {
        return Number(a) - Number(b);
      });
      expect(list[0]).assertFalse();
      expect(list[3]).assertTrue();

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(16);
      expect(list.getCapacity() >= 16).assertTrue();
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
    });

    /**
     * @tc.name   testArrayListBooleanTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_BOOLEAN_0600
     * @tc.desc   Verify ArrayList boolean boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<boolean> = new ArrayList<boolean>();
      list.add(true);
      let accessThrew: boolean = false;
      try {
        const beyond: boolean = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

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
