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

interface ArrayWithAt extends Array<Array<number>> {
  at(index: number): Array<number> | undefined;
}

function runAt(values: Array<Array<number>>): Array<number> | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-0);
}

const VALID_VALUES: Array<Array<number>> = [
  [1, 2, 3], [0, -1], [NaN, Infinity], new Array<number>(3), [], [Number.MAX_SAFE_INTEGER], [1, 2, 3],
];


interface NestedInvalidObject { marker: string; }
const NESTED_INVALID_OBJECT: NestedInvalidObject = { marker: 'invalid' };
interface NestedArrayLikeInvalid { length: number; }
type NestedInvalidValue = Array<number | string | null | undefined | NestedInvalidObject> | NestedArrayLikeInvalid;
type NestedAllValue = Array<number> | NestedInvalidValue;
const ALL_VALUES: Array<NestedAllValue> = [
  ...VALID_VALUES,
  [1, 'a'], [null, undefined], { length: 3 }, ['Symbol()', NESTED_INVALID_OBJECT], [1, 2, '3']
];

export default function arrayNestedTest() {
  describe('ArrayNestedTest', () => {
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
     * @tc.name testArrayNestedTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NESTED_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with nested array values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNestedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<NestedAllValue> = ALL_VALUES;
      const emptyResult: Array<NestedAllValue> = new Array<NestedAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<NestedAllValue> = new Array<NestedAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<NestedAllValue> = new Array<NestedAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<NestedAllValue> = new Array<NestedAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<NestedAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: NestedAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<NestedAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayNestedTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NESTED_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with nested array values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNestedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const copyValues: Array<Array<number>> = values.slice();
      const copyResult: Array<Array<number>> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: Array<number>): boolean => value === values[0])).assertTrue();

      const reduceResult: Array<number> = values.reduce(
        (acc: Array<number>, _value: Array<number>): Array<number> => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: Array<number> = values.reduceRight(
        (acc: Array<number>, _value: Array<number>): Array<number> => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<Array<number>> = values.slice();
      const popResult: Array<number> | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayNestedTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NESTED_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with nested array values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNestedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const pushValues: Array<Array<number>> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<Array<number>> = values.slice();
      const shiftResult: Array<number> | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<Array<number>> = values.slice();
      const reverseResult: Array<Array<number>> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined.indexOf(String(values[0]))).assertLargerOrEqual(0);

      const stringResult: string = values.toString();
      expect(stringResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArrayNestedTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NESTED_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with nested array values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNestedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const unshiftValues: Array<Array<number>> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<Array<number>> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<Array<number>> = values.slice();
      const sortResult: Array<Array<number>> = sortValues.sort((valueA: Array<number>, valueB: Array<number>): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: Array<number> = values[0];
      values.forEach((value: Array<number>): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<Array<number>> = values.map(
        (value: Array<number>): Array<number> => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<Array<number>> = values.filter(
        (value: Array<number>): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayNestedTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NESTED_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with nested array values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNestedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const reduceInitialResult: Array<number> = values.reduce(
        (_acc: Array<number>, value: Array<number>): Array<number> => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[0]);

      const entriesItem: IteratorResult<[number, Array<number>]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<Array<number>> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: Array<number> | undefined = values.find(
        (value: Array<number>): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: Array<number>): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayNestedTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NESTED_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with nested array values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNestedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Array<number>> = VALID_VALUES;
      const fillValues: Array<Array<number>> = values.slice();
      const fillResult: Array<Array<number>> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<Array<number>> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<Array<number>> = values.slice();
      const removedItems: Array<Array<number>> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<Array<number>> = values.slice();
      const insertedItems: Array<Array<number>> = spliceInsertValues.splice(0, 0, values[1]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[1]);
      expect(spliceInsertValues[1]).assertEqual(values[0]);
      expect(values.every((value: Array<number>): boolean => value === values[0])).assertFalse();
      expect(values[0][0]).assertEqual(1);

      const symbolItem: IteratorResult<Array<number>> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(localeResult.indexOf(String(values[0][0]))).assertLargerOrEqual(0);
    });

  });
}







