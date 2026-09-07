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
import { Deque } from '@kit.ArkTS';

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

export default function dequeDateTest() {
  describe('DequeDateTest', () => {
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
     * @tc.name   testDequeDateTest0100
     * @tc.number SUB_ARKTS_DEQUE_DATE_0100
     * @tc.desc   Verify Deque Date insertEnd of valid and mixed values, length, element access and getFirst/getLast including an invalid NaN date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeDateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<Date> = new Deque<Date>();
      expect(empty.length).assertEqual(0);

      const list: Deque<Date> = new Deque<Date>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(DATE_A);
      expect(list[6]).assertEqual(DATE_A);
      expect(Number.isNaN(list[5].getTime())).assertTrue();
      expect(list.getFirst()).assertEqual(DATE_A);
      expect(list.getLast()).assertEqual(DATE_A);

      const mixed: Deque<DateAllValue> = new Deque<DateAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(DATE_A);
    });

    /**
     * @tc.name   testDequeDateTest0200
     * @tc.number SUB_ARKTS_DEQUE_DATE_0200
     * @tc.desc   Verify Deque Date insertFront/insertEnd ordering, getFirst/getLast and has reference lookup including an equal-value new Date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeDateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Date> = new Deque<Date>();
      list.insertEnd(DATE_A);
      list.insertEnd(DATE_B);
      list.insertFront(DATE_C);
      list.insertEnd(DATE_A);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual(DATE_C);
      expect(list.getFirst()).assertEqual(DATE_C);
      expect(list.getLast()).assertEqual(DATE_A);
      expect(list.has(DATE_A)).assertTrue();
      expect(list.has(new Date('2026-03-05'))).assertFalse();

      const single: Deque<Date> = new Deque<Date>();
      single.insertFront(DATE_F);
      expect(single.getFirst()).assertEqual(DATE_F);
      expect(single.getLast()).assertEqual(DATE_F);
    });

    /**
     * @tc.name   testDequeDateTest0300
     * @tc.number SUB_ARKTS_DEQUE_DATE_0300
     * @tc.desc   Verify Deque Date popFirst and popLast return the correct Date references and update length on multi and single element deques.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeDateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Date> = new Deque<Date>();
      list.insertEnd(DATE_A);
      list.insertEnd(DATE_B);
      list.insertEnd(DATE_C);
      list.insertEnd(DATE_D);

      const first: Date = list.popFirst();
      expect(first).assertEqual(DATE_A);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(DATE_B);

      const last: Date = list.popLast();
      expect(last).assertEqual(DATE_D);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(DATE_C);

      const single: Deque<Date> = new Deque<Date>();
      single.insertEnd(DATE_E);
      expect(single.popFirst()).assertEqual(DATE_E);
      expect(single.length).assertEqual(0);

      single.insertEnd(DATE_F);
      expect(single.popLast()).assertEqual(DATE_F);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeDateTest0400
     * @tc.number SUB_ARKTS_DEQUE_DATE_0400
     * @tc.desc   Verify Deque Date forEach callback with index, Symbol.iterator traversal and for-of iteration visit all elements in order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeDateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Date> = new Deque<Date>();
      list.insertEnd(DATE_A);
      list.insertEnd(DATE_B);
      list.insertEnd(DATE_C);

      const visited: Array<Date> = [];
      list.forEach((value: Date) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(DATE_A);
      expect(visited[2]).assertEqual(DATE_C);

      let indexSum: number = 0;
      list.forEach((value: Date, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Date> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<Date> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(DATE_B);

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === DATE_B) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeDateTest0500
     * @tc.number SUB_ARKTS_DEQUE_DATE_0500
     * @tc.desc   Verify Deque Date index element access including boundary, out-of-range undefined results and getTime reads on stored dates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeDateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Date> = new Deque<Date>();
      list.insertEnd(DATE_A);
      list.insertEnd(DATE_B);
      list.insertEnd(DATE_C);
      list.insertFront(DATE_D);

      expect(list[0]).assertEqual(DATE_D);
      expect(list[1]).assertEqual(DATE_A);
      expect(list[3]).assertEqual(DATE_C);
      expect(list[list.length - 1]).assertEqual(DATE_C);
      let oobThrew: boolean = false;
      try {
        const oob: Date | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: Date | undefined = list[77];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list[1].getTime()).assertEqual(DATE_A.getTime());
    });

    /**
     * @tc.name   testDequeDateTest0600
     * @tc.number SUB_ARKTS_DEQUE_DATE_0600
     * @tc.desc   Verify Deque Date out-of-range access is undefined, popFirst on empty deque throws, and empty deque iteration/forEach visit nothing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeDateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Date> = new Deque<Date>();
      list.insertEnd(DATE_A);
      list.insertEnd(DATE_B);
      let t2: boolean = false;
      try {
        const v2: Date | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: Date | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<Date> = new Deque<Date>();
      const popped: Date | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: Date | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: Date) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
