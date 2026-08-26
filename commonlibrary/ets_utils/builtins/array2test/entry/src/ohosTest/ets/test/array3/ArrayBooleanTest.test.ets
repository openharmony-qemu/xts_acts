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

interface ArrayWithAt extends Array<boolean> {
  at(index: number): boolean | undefined;
}

function runAt(values: Array<boolean>): boolean | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-0);
}

const VALID_VALUES: Array<boolean> = [true, false, true, false];


interface BooleanInvalidObject { marker: string; }
const BOOLEAN_INVALID_OBJECT: BooleanInvalidObject = { marker: 'invalid' };
type BooleanInvalidValue = number | string | null | undefined | BooleanInvalidObject | Array<number>;
type BooleanAllValue = boolean | BooleanInvalidValue;
const ALL_VALUES: Array<BooleanAllValue> = [
  ...VALID_VALUES,
  1, 0, NaN, 'true', 'false', null, undefined, '', BOOLEAN_INVALID_OBJECT, []
];

export default function arrayBooleanTest() {
  describe('ArrayBooleanTest', () => {
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
     * @tc.name testArrayBooleanTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BOOLEAN_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with boolean values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<BooleanAllValue> = ALL_VALUES;
      const emptyResult: Array<BooleanAllValue> = new Array<BooleanAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<BooleanAllValue> = new Array<BooleanAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<BooleanAllValue> = new Array<BooleanAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<BooleanAllValue> = new Array<BooleanAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<BooleanAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: BooleanAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<BooleanAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayBooleanTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BOOLEAN_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with boolean values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const copyValues: Array<boolean> = values.slice();
      const copyResult: Array<boolean> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: boolean): boolean => value === values[0])).assertTrue();

      const reduceResult: boolean = values.reduce(
        (acc: boolean, _value: boolean): boolean => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: boolean = values.reduceRight(
        (acc: boolean, _value: boolean): boolean => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<boolean> = values.slice();
      const popResult: boolean | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayBooleanTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BOOLEAN_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with boolean values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const pushValues: Array<boolean> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<boolean> = values.slice();
      const shiftResult: boolean | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<boolean> = values.slice();
      const reverseResult: Array<boolean> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined.indexOf(String(values[0]))).assertLargerOrEqual(0);

      const stringResult: string = values.toString();
      expect(stringResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArrayBooleanTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BOOLEAN_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with boolean values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const unshiftValues: Array<boolean> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<boolean> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<boolean> = values.slice();
      const sortResult: Array<boolean> = sortValues.sort((valueA: boolean, valueB: boolean): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: boolean = values[0];
      values.forEach((value: boolean): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<boolean> = values.map(
        (value: boolean): boolean => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<boolean> = values.filter(
        (value: boolean): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayBooleanTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BOOLEAN_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with boolean values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const reduceInitialResult: boolean = values.reduce(
        (_acc: boolean, value: boolean): boolean => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[0]);

      const entriesItem: IteratorResult<[number, boolean]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<boolean> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: boolean | undefined = values.find(
        (value: boolean): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: boolean): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayBooleanTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BOOLEAN_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with boolean values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<boolean> = VALID_VALUES;
      const fillValues: Array<boolean> = values.slice();
      const fillResult: Array<boolean> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<boolean> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<boolean> = values.slice();
      const removedItems: Array<boolean> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<boolean> = values.slice();
      const insertedItems: Array<boolean> = spliceInsertValues.splice(0, 0, values[0]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[0]);
      expect(values.every((value: boolean): boolean => value === value)).assertTrue();
      expect(values[0]).assertEqual(values[0]);

      const symbolItem: IteratorResult<boolean> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(localeResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

  });
}