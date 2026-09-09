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

export default function listDateTest() {
  describe('ListDateTest', () => {
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
     * @tc.name   testListDateTest0100
     * @tc.number SUB_ARKTS_LIST_DATE_0100
     * @tc.desc   Verify List Date constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<Date> = new List<Date>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<Date> = new List<Date>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(DATE_A);
      expect(list.get(6)).assertEqual(DATE_A);
      expect(Number.isNaN(list.get(5).getTime())).assertTrue();
      expect(list.getFirst()).assertEqual(DATE_A);
      expect(list.getLast()).assertEqual(DATE_A);

      const mixed: List<DateAllValue> = new List<DateAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(DATE_A);
    });

    /**
     * @tc.name   testListDateTest0200
     * @tc.number SUB_ARKTS_LIST_DATE_0200
     * @tc.desc   Verify List Date has, getIndexOf, getLastIndexOf, insert, remove and equal with reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Date> = new List<Date>();
      list.add(DATE_A);
      list.add(DATE_B);
      list.add(DATE_A);

      expect(list.has(DATE_A)).assertTrue();
      expect(list.has(new Date('2026-03-05'))).assertFalse();
      expect(list.getIndexOf(DATE_A)).assertEqual(0);
      expect(list.getLastIndexOf(DATE_A)).assertEqual(2);
      expect(list.getIndexOf(DATE_C)).assertEqual(-1);

      list.insert(DATE_C, 0);
      expect(list.get(0)).assertEqual(DATE_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(DATE_A)).assertTrue();
      expect(list.getIndexOf(DATE_A)).assertEqual(2);
      expect(list.remove(DATE_D)).assertFalse();

      const same: List<Date> = new List<Date>();
      same.add(DATE_C);
      same.add(DATE_B);
      same.add(DATE_A);
      expect(list.equal(same)).assertTrue();
      same.add(DATE_A);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListDateTest0300
     * @tc.number SUB_ARKTS_LIST_DATE_0300
     * @tc.desc   Verify List Date removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Date> = new List<Date>();
      list.add(DATE_A);
      list.add(DATE_B);
      list.add(DATE_C);
      list.add(DATE_D);

      const removed: Date = list.removeByIndex(2);
      expect(removed).assertEqual(DATE_C);
      expect(list.length).assertEqual(3);
      expect(list.get(2)).assertEqual(DATE_D);

      expect(list.remove(DATE_A)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<Date> = new List<Date>();
      src.add(DATE_E);
      src.add(DATE_F);
      const sub: List<Date> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(1)).assertEqual(DATE_F);
      expect(src.length).assertEqual(2);
      sub.add(DATE_A);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.name   testListDateTest0400
     * @tc.number SUB_ARKTS_LIST_DATE_0400
     * @tc.desc   Verify List Date set, replaceAllElements, forEach, iterator traversal and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Date> = new List<Date>();
      list.add(DATE_B);
      list.add(DATE_A);
      list.add(DATE_C);

      const old: Date = list.set(1, DATE_D);
      expect(old.getTime()).assertEqual(DATE_D.getTime());
      expect(list.get(1).getTime()).assertEqual(DATE_D.getTime());
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: Date): Date => {
        return new Date(value.getTime() + 1000);
      });
      expect(list.get(0).getTime()).assertEqual(1000);
      expect(Number.isNaN(list.get(2).getTime()) === false ? list.get(2).getTime() : -1).assertEqual(86401000);

      const times: Array<number> = [];
      list.forEach((value: Date) => {
        times.push(value.getTime());
      });
      expect(times.length).assertEqual(3);
      expect(times[0]).assertEqual(1000);

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

      const arr: Array<Date> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(list.get(0));
    });

    /**
     * @tc.name   testListDateTest0500
     * @tc.number SUB_ARKTS_LIST_DATE_0500
     * @tc.desc   Verify List Date sort by getTime plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Date> = new List<Date>();
      list.add(DATE_C);
      list.add(DATE_B);
      list.add(DATE_A);

      list.sort((a: Date, b: Date): number => {
        return a.getTime() - b.getTime();
      });
      expect(list.get(0)).assertEqual(DATE_B);
      expect(list.get(1)).assertEqual(DATE_C);
      expect(list.get(2)).assertEqual(DATE_A);

      expect(list.getFirst()).assertEqual(DATE_B);
      expect(list.getLast()).assertEqual(DATE_A);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListDateTest0600
     * @tc.number SUB_ARKTS_LIST_DATE_0600
     * @tc.desc   Verify List Date out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Date> = new List<Date>();
      list.add(DATE_A);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

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
        list.insert(DATE_B, 30);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<Date> = new List<Date>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
