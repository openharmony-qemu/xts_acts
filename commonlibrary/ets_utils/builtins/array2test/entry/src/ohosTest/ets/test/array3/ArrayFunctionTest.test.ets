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

type ArrayFunctionItem = (value: number) => number;

function FUNCTION_A(value: number): number {
  return value + 1;
}

function FUNCTION_B(value: number): number {
  return value + 2;
}

function FUNCTION_C(value: number): number {
  return value + 3;
}

interface ArrayWithAt extends Array<ArrayFunctionItem> {
  at(index: number): ArrayFunctionItem | undefined;
}

function runAt(values: Array<ArrayFunctionItem>): ArrayFunctionItem | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-0);
}

const FUNCTION_D: ArrayFunctionItem = (value: number): number => value * value;
const FUNCTION_E: ArrayFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: ArrayFunctionItem = (value: number): number => value - 100.5;

const VALID_VALUES: Array<ArrayFunctionItem> = [FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A];


interface FunctionInvalidObject { marker: string; }
const FUNCTION_INVALID_OBJECT: FunctionInvalidObject = { marker: 'invalid' };
type FunctionInvalidValue = number | string | null | undefined | FunctionInvalidObject | Array<number>;
type FunctionAllValue = ArrayFunctionItem | FunctionInvalidValue;
const ALL_VALUES: Array<FunctionAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, FUNCTION_INVALID_OBJECT, []
];

export default function arrayFunctionTest() {
  describe('ArrayFunctionTest', () => {
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
     * @tc.name testArrayFunctionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FUNCTION_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with function references, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<FunctionAllValue> = ALL_VALUES;
      const emptyResult: Array<FunctionAllValue> = new Array<FunctionAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<FunctionAllValue> = new Array<FunctionAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<FunctionAllValue> = new Array<FunctionAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<FunctionAllValue> = new Array<FunctionAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<FunctionAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: FunctionAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<FunctionAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayFunctionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FUNCTION_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with function references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const copyValues: Array<ArrayFunctionItem> = values.slice();
      const copyResult: Array<ArrayFunctionItem> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: ArrayFunctionItem): boolean => value === values[0])).assertTrue();

      const reduceResult: ArrayFunctionItem = values.reduce(
        (acc: ArrayFunctionItem, _value: ArrayFunctionItem): ArrayFunctionItem => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: ArrayFunctionItem = values.reduceRight(
        (acc: ArrayFunctionItem, _value: ArrayFunctionItem): ArrayFunctionItem => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<ArrayFunctionItem> = values.slice();
      const popResult: ArrayFunctionItem | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayFunctionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FUNCTION_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with function references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const pushValues: Array<ArrayFunctionItem> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<ArrayFunctionItem> = values.slice();
      const shiftResult: ArrayFunctionItem | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<ArrayFunctionItem> = values.slice();
      const reverseResult: Array<ArrayFunctionItem> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined.indexOf(String(values[0]))).assertLargerOrEqual(0);

      const stringResult: string = values.toString();
      expect(stringResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArrayFunctionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FUNCTION_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with function references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const unshiftValues: Array<ArrayFunctionItem> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<ArrayFunctionItem> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<ArrayFunctionItem> = values.slice();
      const sortResult: Array<ArrayFunctionItem> = sortValues.sort((valueA: ArrayFunctionItem, valueB: ArrayFunctionItem): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: ArrayFunctionItem = values[0];
      values.forEach((value: ArrayFunctionItem): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<ArrayFunctionItem> = values.map(
        (value: ArrayFunctionItem): ArrayFunctionItem => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<ArrayFunctionItem> = values.filter(
        (value: ArrayFunctionItem): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayFunctionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FUNCTION_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with function references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const reduceInitialResult: ArrayFunctionItem = values.reduce(
        (_acc: ArrayFunctionItem, value: ArrayFunctionItem): ArrayFunctionItem => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[0]);

      const entriesItem: IteratorResult<[number, ArrayFunctionItem]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<ArrayFunctionItem> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: ArrayFunctionItem | undefined = values.find(
        (value: ArrayFunctionItem): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: ArrayFunctionItem): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayFunctionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FUNCTION_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with function references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayFunctionItem> = VALID_VALUES;
      const fillValues: Array<ArrayFunctionItem> = values.slice();
      const fillResult: Array<ArrayFunctionItem> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<ArrayFunctionItem> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<ArrayFunctionItem> = values.slice();
      const removedItems: Array<ArrayFunctionItem> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<ArrayFunctionItem> = values.slice();
      const insertedItems: Array<ArrayFunctionItem> = spliceInsertValues.splice(0, 0, values[1]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[1]);
      expect(spliceInsertValues[1]).assertEqual(values[0]);
      expect(values.every((value: ArrayFunctionItem): boolean => value === FUNCTION_A)).assertFalse();
      expect(values[0]).assertEqual(FUNCTION_A);

      const symbolItem: IteratorResult<ArrayFunctionItem> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(localeResult.indexOf(',')).assertLargerOrEqual(0);
    });

  });
}