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
import { LinkedList } from '@kit.ArkTS';

interface DateInvalidObject {
  marker: string;
}

const DATE_INVALID_OBJECT: DateInvalidObject = { marker: 'invalid' };

const DATE_A: Date = new Date('2026-03-05');
const DATE_B: Date = new Date(0);
const DATE_C: Date = new Date(86400000);
const DATE_D: Date = new Date(-8640000000000000);
const DATE_E: Date = new Date(8640000000000000);
const DATE_F: Date = new Date(NaN);

const VALID_VALUES: Array<Date> = [DATE_A, DATE_B, DATE_C, DATE_D, DATE_E, DATE_F, DATE_A];

type DateInvalidValue = string | number | null | undefined | DateInvalidObject | Array<number>;
type DateAllValue = Date | DateInvalidValue;

const ALL_VALUES: Array<DateAllValue> = [
  ...VALID_VALUES,
  '2026-03-05', 0, null, undefined, DATE_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListDateTest() {
  describe('LinkedListDateTest', () => {
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
     * @tc.name   testLinkedListDateTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_DATE_0100
     * @tc.desc   Verify LinkedList Date constructor length, add and get with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListDateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<Date> = new LinkedList<Date>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<Date> = new LinkedList<Date>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(DATE_A);
      expect(list.get(6)).assertEqual(DATE_A);
      expect(Number.isNaN(list.get(5).getTime())).assertTrue();

      const mixed: LinkedList<DateAllValue> = new LinkedList<DateAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(DATE_A);
    });

    /**
     * @tc.name   testLinkedListDateTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_DATE_0200
     * @tc.desc   Verify LinkedList Date addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListDateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Date> = new LinkedList<Date>();
      list.add(DATE_A);
      list.add(DATE_B);
      list.add(DATE_A);

      list.addFirst(DATE_C);
      expect(list.get(0)).assertEqual(DATE_C);
      expect(list.length).assertEqual(4);

      expect(list.has(DATE_A)).assertTrue();
      expect(list.has(new Date('2026-03-05'))).assertFalse();
      expect(list.getIndexOf(DATE_A)).assertEqual(1);
      expect(list.getLastIndexOf(DATE_A)).assertEqual(3);
      expect(list.getIndexOf(DATE_D)).assertEqual(-1);

      list.insert(0, DATE_D);
      expect(list.get(0)).assertEqual(DATE_D);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListDateTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_DATE_0300
     * @tc.desc   Verify LinkedList Date removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListDateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Date> = new LinkedList<Date>();
      list.add(DATE_A);
      list.add(DATE_B);
      list.add(DATE_C);
      list.add(DATE_D);

      const removed: Date = list.removeByIndex(2);
      expect(removed).assertEqual(DATE_C);
      expect(list.length).assertEqual(3);
      expect(list.get(2)).assertEqual(DATE_D);

      expect(list.remove(DATE_A)).assertTrue();
      expect(list.get(0)).assertEqual(DATE_B);
      expect(list.remove(DATE_E)).assertFalse();

      const first: Date = list.removeFirst();
      expect(first).assertEqual(DATE_B);
      expect(list.length).assertEqual(1);

      const last: Date = list.removeLast();
      expect(last).assertEqual(DATE_D);
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<Date> = new LinkedList<Date>();
      dupList.add(DATE_E);
      dupList.add(DATE_F);
      dupList.add(DATE_E);
      dupList.add(DATE_E);
      expect(dupList.removeFirstFound(DATE_E)).assertTrue();
      expect(dupList.get(0)).assertEqual(DATE_F);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(DATE_E)).assertTrue();
      expect(dupList.getLastIndexOf(DATE_E)).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListDateTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_DATE_0400
     * @tc.desc   Verify LinkedList Date set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListDateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Date> = new LinkedList<Date>();
      list.add(DATE_B);
      list.add(DATE_A);
      list.add(DATE_C);

      const old: Date = list.set(1, DATE_E);
      expect(old.getTime()).assertEqual(DATE_E.getTime());
      expect(list.get(1).getTime()).assertEqual(DATE_E.getTime());
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<Date> = list.clone();
      cloned.add(DATE_D);
      expect(list.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned.get(0)).assertEqual(list.get(0));

      const arr: Array<Date> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(DATE_B);
      expect(arr instanceof Array).assertTrue();

      const times: Array<number> = [];
      list.forEach((value: Date) => {
        times.push(value.getTime());
      });
      expect(times.length).assertEqual(3);
      expect(times[0]).assertEqual(0);

      let indexSum: number = 0;
      list.forEach((value: Date, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Date> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(list.get(1));
    });

    /**
     * @tc.name   testLinkedListDateTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_DATE_0500
     * @tc.desc   Verify LinkedList Date getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListDateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Date> = new LinkedList<Date>();
      list.add(DATE_C);
      list.add(DATE_B);
      list.add(DATE_A);

      expect(list.getFirst()).assertEqual(DATE_C);
      expect(list.getLast()).assertEqual(DATE_A);
      expect(list.get(0)).assertEqual(DATE_C);
      expect(list.get(list.length - 1)).assertEqual(DATE_A);
      expect(list.get(1)).assertEqual(DATE_B);

      const single: LinkedList<Date> = new LinkedList<Date>();
      single.add(DATE_E);
      expect(single.getFirst()).assertEqual(DATE_E);
      expect(single.getLast()).assertEqual(DATE_E);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(30)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListDateTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_DATE_0600
     * @tc.desc   Verify LinkedList Date removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListDateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<Date> = new LinkedList<Date>();
      list.add(DATE_A);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(4);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(30, DATE_B);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.getFirst()).assertUndefined();
      expect(list.getLast()).assertUndefined();
      expect(list.clone().length).assertEqual(0);
    });
  });
}
