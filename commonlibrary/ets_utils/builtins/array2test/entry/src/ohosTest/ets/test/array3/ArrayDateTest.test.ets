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

import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const DATE_A: Date = new Date('2026-03-05');
const DATE_B: Date = new Date(0);
const DATE_C: Date = new Date(86400000);
const DATE_D: Date = new Date(-8640000000000000);
const DATE_E: Date = new Date(8640000000000000);
const DATE_F: Date = new Date(NaN);

interface ArrayWithAt extends Array<Date> {
  at(index: number): Date | undefined;
}

function runAt(values: Array<Date>): Date | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-1);
}

const VALID_VALUES: Array<Date> = [DATE_A, DATE_B, DATE_C, DATE_D, DATE_E, DATE_F, DATE_A];


interface DateInvalidObject { marker: string; }
const DATE_INVALID_OBJECT: DateInvalidObject = { marker: 'invalid' };
type DateInvalidValue = string | number | null | undefined | DateInvalidObject | Array<number>;
type DateAllValue = Date | DateInvalidValue;
const ALL_VALUES: Array<DateAllValue> = [
  ...VALID_VALUES,
  '2026-03-05', 0, null, undefined, DATE_INVALID_OBJECT, []
];

export default function arrayDateTest() {
  describe('ArrayDateTest', () => {
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
     * @tc.name testArrayDateTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_DATE_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with Date object values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayDateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<DateAllValue> = ALL_VALUES;
      const emptyResult: Array<DateAllValue> = new Array<DateAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<DateAllValue> = new Array<DateAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<DateAllValue> = new Array<DateAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<DateAllValue> = new Array<DateAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<DateAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: DateAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<DateAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayDateTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_DATE_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with Date object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayDateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Date> = VALID_VALUES;
      const copyValues: Array<Date> = values.slice();
      const copyResult: Array<Date> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertEqual(6);
      expect(values.some((value: Date): boolean => value === values[0])).assertTrue();

      const reduceResult: Date = values.reduce(
        (acc: Date, _value: Date): Date => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: Date = values.reduceRight(
        (acc: Date, _value: Date): Date => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<Date> = values.slice();
      const popResult: Date | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayDateTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_DATE_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with Date object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayDateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Date> = VALID_VALUES;
      const pushValues: Array<Date> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<Date> = values.slice();
      const shiftResult: Date | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<Date> = values.slice();
      const reverseResult: Array<Date> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined).assertEqual(
        String(DATE_A) + '|' + String(DATE_B) + '|' + String(DATE_C) + '|' + String(DATE_D) + '|' +
        String(DATE_E) + '|' + String(DATE_F) + '|' + String(DATE_A));

      const stringResult: string = values.toString();
      expect(stringResult).assertEqual(
        String(DATE_A) + ',' + String(DATE_B) + ',' + String(DATE_C) + ',' + String(DATE_D) + ',' +
        String(DATE_E) + ',' + String(DATE_F) + ',' + String(DATE_A));
    });

    /**
     * @tc.name testArrayDateTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_DATE_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with Date object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayDateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Date> = VALID_VALUES;
      const unshiftValues: Array<Date> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<Date> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<Date> = values.slice();
      const sortResult: Array<Date> = sortValues.sort((valueA: Date, valueB: Date): number => {
        const timeA: number = valueA.getTime();
        const timeB: number = valueB.getTime();
        const aIsInvalid: boolean = Number.isNaN(timeA);
        const bIsInvalid: boolean = Number.isNaN(timeB);
        if (aIsInvalid) {
          return bIsInvalid ? 0 : 1;
        }
        if (bIsInvalid) {
          return -1;
        }
        return timeA - timeB;
      });
      expect(sortResult[0].getTime()).assertEqual(DATE_D.getTime());
      expect(Number.isNaN(sortResult[sortResult.length - 1].getTime())).assertTrue();
      expect(values.indexOf(values[0])).assertEqual(0);

      let forEachLastValue: Date = values[0];
      values.forEach((value: Date): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<Date> = values.map(
        (value: Date): Date => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<Date> = values.filter(
        (value: Date): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayDateTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_DATE_TEST_0500
     * @tc.desc Verify reduce, at(-1), entries/keys/values and find/includes/findIndex with Date object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayDateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Date> = VALID_VALUES;
      const reduceInitialResult: Date = values.reduce(
        (_acc: Date, value: Date): Date => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[values.length - 1]);

      const entriesItem: IteratorResult<[number, Date]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<Date> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: Date | undefined = values.find(
        (value: Date): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: Date): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayDateTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_DATE_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with Date object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayDateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Date> = VALID_VALUES;
      const fillValues: Array<Date> = values.slice();
      const fillResult: Array<Date> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<Date> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<Date> = values.slice();
      const removedItems: Array<Date> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<Date> = values.slice();
      const insertedItems: Array<Date> = spliceInsertValues.splice(0, 0, values[0]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[0]);
      expect(values.every((value: Date): boolean => value instanceof Date)).assertTrue();

      const symbolItem: IteratorResult<Date> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(typeof localeResult).assertEqual('string');
    });

  });
}