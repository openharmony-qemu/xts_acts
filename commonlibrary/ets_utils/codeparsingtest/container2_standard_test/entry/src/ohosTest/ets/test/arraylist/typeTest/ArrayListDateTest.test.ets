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

export default function arrayListDateTest() {
  describe('ArrayListDateTest', () => {
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
     * @tc.name   testArrayListDateTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_DATE_0100
     * @tc.desc   Verify ArrayList Date constructor and add including boundary and invalid Date values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListDateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<Date> = new ArrayList<Date>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<Date> = new ArrayList<Date>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(DATE_A);
      expect(list[6]).assertEqual(DATE_A);
      expect(Number.isNaN(list[5].getTime())).assertTrue();

      const mixed: ArrayList<DateAllValue> = new ArrayList<DateAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(DATE_A);
    });

    /**
     * @tc.name   testArrayListDateTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_DATE_0200
     * @tc.desc   Verify ArrayList Date has, getIndexOf, getLastIndexOf, insert and remove by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListDateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Date> = new ArrayList<Date>();
      list.add(DATE_A);
      list.add(DATE_B);
      list.add(DATE_A);

      expect(list.has(DATE_A)).assertTrue();
      expect(list.has(new Date('2026-03-05'))).assertFalse();
      expect(list.getIndexOf(DATE_A)).assertEqual(0);
      expect(list.getLastIndexOf(DATE_A)).assertEqual(2);
      expect(list.getIndexOf(DATE_C)).assertEqual(-1);

      list.insert(DATE_C, 0);
      expect(list[0]).assertEqual(DATE_C);
      expect(list.length).assertEqual(4);

      expect(list.remove(DATE_A)).assertTrue();
      expect(list.getIndexOf(DATE_A)).assertEqual(2);
      expect(list.remove(DATE_D)).assertFalse();
    });

    /**
     * @tc.name   testArrayListDateTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_DATE_0300
     * @tc.desc   Verify ArrayList Date removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListDateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Date> = new ArrayList<Date>();
      list.add(DATE_A);
      list.add(DATE_B);
      list.add(DATE_C);
      list.add(DATE_D);

      const removed: Date = list.removeByIndex(2);
      expect(removed).assertEqual(DATE_C);
      expect(list.length).assertEqual(3);
      expect(list[2]).assertEqual(DATE_D);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(DATE_D);

      const src: ArrayList<Date> = new ArrayList<Date>();
      src.add(DATE_E);
      src.add(DATE_F);
      const sub: ArrayList<Date> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[1]).assertEqual(DATE_F);
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<Date> = src.clone();
      cloned.add(DATE_A);
      expect(src.length).assertEqual(2);
      expect(cloned[0]).assertEqual(src[0]);
    });

    /**
     * @tc.name   testArrayListDateTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_DATE_0400
     * @tc.desc   Verify ArrayList Date replaceAllElements, forEach and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListDateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Date> = new ArrayList<Date>();
      list.add(DATE_B);
      list.add(DATE_A);
      list.add(DATE_C);

      list.replaceAllElements((value: Date): Date => {
        return new Date(value.getTime() + 1000);
      });
      expect(list[0].getTime()).assertEqual(1000);
      expect(list[1].getTime()).assertEqual(new Date('2026-03-05').getTime() + 1000);
      expect(list[2].getTime()).assertEqual(86401000);

      const times: Array<number> = [];
      list.forEach((value: Date) => {
        times.push(value.getTime());
      });
      expect(times.length).assertEqual(3);
      expect(times[0]).assertEqual(1000);

      const iterValues: Array<Date> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(list[1]);
    });

    /**
     * @tc.name   testArrayListDateTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_DATE_0500
     * @tc.desc   Verify ArrayList Date sort by time, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListDateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Date> = new ArrayList<Date>();
      list.add(DATE_C);
      list.add(DATE_B);
      list.add(DATE_A);

      list.sort((a: Date, b: Date): number => {
        return a.getTime() - b.getTime();
      });
      expect(list[0]).assertEqual(DATE_B);
      expect(list[1]).assertEqual(DATE_C);
      expect(list[2]).assertEqual(DATE_A);

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(12);
      expect(list.getCapacity() >= 12).assertTrue();
      list.trimToCurrentLength();
      expect(list.length).assertEqual(3);
    });

    /**
     * @tc.name   testArrayListDateTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_DATE_0600
     * @tc.desc   Verify ArrayList Date boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListDateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Date> = new ArrayList<Date>();
      list.add(DATE_A);
      let accessThrew: boolean = false;
      try {
        const beyond: Date = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

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
