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

const SET_A: Set<number> = new Set<number>();
SET_A.add(1);
const SET_B: Set<number> = new Set<number>();
SET_B.add(2);
const SET_C: Set<number> = new Set<number>();
SET_C.add(3);

interface ArrayWithAt extends Array<Set<number>> {
  at(index: number): Set<number> | undefined;
}

function runAt(values: Array<Set<number>>): Set<number> | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-0);
}

const SET_D: Set<number> = new Set<number>();
SET_D.add(0);
SET_D.add(-1);
const SET_E: Set<number> = new Set<number>();
SET_E.add(NaN);
SET_E.add(Infinity);
const SET_F: Set<number> = new Set<number>();
SET_F.add(Number.MAX_SAFE_INTEGER);
const SET_G: Set<number> = new Set<number>();

const VALID_VALUES: Array<Set<number>> = [SET_A, SET_B, SET_C, SET_D, SET_E, SET_F, SET_G, SET_A];


interface SetInvalidObject { marker: string; }
const SET_INVALID_OBJECT: SetInvalidObject = { marker: 'invalid' };
type SetInvalidValue = string | number | null | undefined | SetInvalidObject | Array<number>;
type SetAllValue = Set<number> | SetInvalidValue;
const ALL_VALUES: Array<SetAllValue> = [
  ...VALID_VALUES,
  '1', 123, null, undefined, SET_INVALID_OBJECT, []
];

export default function arraySetTest() {
  describe('ArraySetTest', () => {
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
     * @tc.name testArraySetTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with Set object values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<SetAllValue> = ALL_VALUES;
      const emptyResult: Array<SetAllValue> = new Array<SetAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<SetAllValue> = new Array<SetAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<SetAllValue> = new Array<SetAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<SetAllValue> = new Array<SetAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<SetAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: SetAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<SetAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArraySetTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with Set object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Set<number>> = VALID_VALUES;
      const copyValues: Array<Set<number>> = values.slice();
      const copyResult: Array<Set<number>> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: Set<number>): boolean => value === values[0])).assertTrue();

      const reduceResult: Set<number> = values.reduce(
        (acc: Set<number>, _value: Set<number>): Set<number> => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: Set<number> = values.reduceRight(
        (acc: Set<number>, _value: Set<number>): Set<number> => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<Set<number>> = values.slice();
      const popResult: Set<number> | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArraySetTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with Set object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Set<number>> = VALID_VALUES;
      const pushValues: Array<Set<number>> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<Set<number>> = values.slice();
      const shiftResult: Set<number> | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<Set<number>> = values.slice();
      const reverseResult: Array<Set<number>> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined.indexOf(String(values[0]))).assertLargerOrEqual(0);

      const stringResult: string = values.toString();
      expect(stringResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArraySetTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with Set object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Set<number>> = VALID_VALUES;
      const unshiftValues: Array<Set<number>> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<Set<number>> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<Set<number>> = values.slice();
      const sortResult: Array<Set<number>> = sortValues.sort((valueA: Set<number>, valueB: Set<number>): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: Set<number> = values[0];
      values.forEach((value: Set<number>): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<Set<number>> = values.map(
        (value: Set<number>): Set<number> => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<Set<number>> = values.filter(
        (value: Set<number>): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArraySetTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with Set object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Set<number>> = VALID_VALUES;
      const reduceInitialResult: Set<number> = values.reduce(
        (_acc: Set<number>, value: Set<number>): Set<number> => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[0]);

      const entriesItem: IteratorResult<[number, Set<number>]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<Set<number>> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: Set<number> | undefined = values.find(
        (value: Set<number>): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: Set<number>): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArraySetTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with Set object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Set<number>> = VALID_VALUES;
      const fillValues: Array<Set<number>> = values.slice();
      const fillResult: Array<Set<number>> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<Set<number>> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<Set<number>> = values.slice();
      const removedItems: Array<Set<number>> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<Set<number>> = values.slice();
      const insertedItems: Array<Set<number>> = spliceInsertValues.splice(0, 0, values[1]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[1]);
      expect(spliceInsertValues[1]).assertEqual(values[0]);
      expect(values.every((value: Set<number>): boolean => value === SET_A)).assertFalse();
      expect(values[0].size).assertEqual(1);

      const symbolItem: IteratorResult<Set<number>> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(localeResult.indexOf(',')).assertLargerOrEqual(0);
    });

  });
}





