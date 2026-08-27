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
import { getAtZero, getUnionSymbol } from './ArrayUnionTest';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

interface UnionObjectValue {
  id: number;
  label: string;
  name: string;
  extra: number;
}

class ArrayClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const UNION_CLASS_VALUE = new ArrayClassItem(Number.MAX_SAFE_INTEGER, '测试😀');
const UNION_DATE_VALUE = new Date(NaN);
const UNION_FUNCTION_VALUE: ArrayUnionFunctionItem = (value: number): number => value * value;
const UNION_MAP_VALUE = new Map<string, number>([['\u200B', -1]]);
const UNION_SET_VALUE = new Set<number>([NaN, Infinity]);
const UNION_NESTED_VALUE = [NaN, Infinity];
const UNION_OBJECT_VALUE: UnionObjectValue = {
  id: Number.MIN_SAFE_INTEGER,
  label: '\u200B',
  name: '测试😀',
  extra: Number.MAX_VALUE,
};
const UNION_REGEXP_VALUE = /[\u0000-\u001F]/g;
type ArrayUnionSymbolItem = Object;
type ArrayUnionFunctionItem = (value: number) => number;
type ArrayUnionItem = number | string | null | undefined | boolean | bigint |
  ArrayUnionSymbolItem | ArrayClassItem | Date | ArrayUnionFunctionItem |
  Map<string, number> | Set<number> | Array<number> | UnionObjectValue | RegExp;
const VALID_VALUES: Array<ArrayUnionItem> = [
  NaN, '\u0000', null, undefined, false,
  123456789012345678901234567890n, getUnionSymbol(),
  UNION_CLASS_VALUE, UNION_DATE_VALUE, UNION_FUNCTION_VALUE,
  UNION_MAP_VALUE, UNION_SET_VALUE, UNION_NESTED_VALUE,
  UNION_OBJECT_VALUE, UNION_REGEXP_VALUE,
];
const ALL_VALUES: Array<ArrayUnionItem> = [...VALID_VALUES];

export default function arrayUnionTest() {
  describe('ArrayUnionTest', () => {
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
     * @tc.name testArrayUnionTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNION_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray preserve mixed union values (including NaN, null and undefined) and map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyResult: Array<undefined> = new Array<undefined>();
      expect(Array.isArray(emptyResult)).assertTrue();
      const lengthResult: Array<undefined> = new Array<undefined>(3);
      expect(lengthResult.length).assertEqual(3);

      const values = ALL_VALUES;
      const constructorResult = new Array(values[0], values[1], values[2]);
      expect(Array.isArray(values)).assertTrue();
      expect(constructorResult[2] === null).assertTrue();

      const spreadResult = new Array(...values);
      expect(spreadResult[6] === values[6]).assertTrue();

      const fromArrayLikeResult = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1] === values[values.length - 1]).assertTrue();

      const mappedResult = Array.from(values, (value) => String(value));
      expect(mappedResult[1] === String(values[1])).assertTrue();

      const ofResult = Array.of(...values);
      expect(ofResult[10] === values[10]).assertTrue();
    });

    /**
     * @tc.name testArrayUnionTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNION_TEST_0200
     * @tc.desc Verify copyWithin/slice, Symbol search, reduce/reduceRight and pop with mixed union values (including NaN, null and undefined).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = ALL_VALUES;
      const copyValues = values.slice();
      const copyResult = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0] === values[1]).assertTrue();
      expect(copyValues[1] === values[1]).assertTrue();

      expect(values.lastIndexOf(values[6]) === 6).assertTrue();
      expect(values.some((value) => value === values[6])).assertTrue();

      const reduceResult = values.reduce((acc) => acc);
      expect(String(reduceResult)).assertEqual('NaN');
      const reduceRightResult = values.reduceRight((acc) => acc);
      expect(reduceRightResult === values[values.length - 1]).assertTrue();

      const popValues = values.slice();
      const popResult = popValues.pop();
      expect(popResult === values[values.length - 1]).assertTrue();
    });

    /**
     * @tc.name testArrayUnionTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNION_TEST_0300
     * @tc.desc Verify push, shift and reverse with mixed union values (including NaN, null and undefined); join/toString reject Symbol conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = ALL_VALUES;
      const pushValues = values.slice();
      const pushResult = pushValues.push(values[6]);
      expect(pushResult === values.length + 1).assertTrue();
      expect(pushValues[pushValues.length - 1] === values[6]).assertTrue();

      const shiftValues = values.slice();
      const shiftResult = shiftValues.shift();
      expect(String(shiftResult)).assertEqual('NaN');
      expect(shiftValues[0] === values[1]).assertTrue();

      const reverseValues = values.slice();
      const reverseResult = reverseValues.reverse();
      expect(reverseResult[0] === values[values.length - 1]).assertTrue();

      let joinThrew = false;
      try {
        values.join('|');
      } catch (_error) {
        joinThrew = true;
      }
      expect(joinThrew).assertTrue();

      let stringConversionThrew = false;
      try {
        values.toString();
      } catch (_error) {
        stringConversionThrew = true;
      }
      expect(stringConversionThrew).assertTrue();
    });

    /**
     * @tc.name testArrayUnionTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNION_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with mixed union values (including NaN, null and undefined).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = ALL_VALUES;
      const unshiftValues = values.slice();
      const unshiftResult = unshiftValues.unshift(values[6]);
      expect(unshiftResult === values.length + 1).assertTrue();
      expect(unshiftValues[0] === values[6]).assertTrue();

      const sliceResult = values.slice(0, 2);
      expect(Number.isNaN(sliceResult[0])).assertTrue();
      expect(sliceResult[1] === values[1]).assertTrue();

      const sortValues = values.slice();
      const sortResult = sortValues.sort((valueA, valueB) =>
        String(valueA).localeCompare(String(valueB))
      );
      expect(sortResult === sortValues).assertTrue();
      expect(values.indexOf(values[6]) === 6).assertTrue();

      let forEachLastValue = values[0];
      values.forEach((value) => {
        forEachLastValue = value;
      });
      expect(forEachLastValue === values[values.length - 1]).assertTrue();

      const mapResult = values.map((value) => value);
      expect(mapResult[10] === values[10]).assertTrue();

      const filterResult = values.filter((value) => value === null);
      expect(filterResult[0] === null).assertTrue();
    });

    /**
     * @tc.name testArrayUnionTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNION_TEST_0500
     * @tc.desc Verify reduce, at(-0), iterators and find/includes/findIndex with mixed union values (including NaN, null and undefined).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = ALL_VALUES;
      const reduceInitialResult = values.reduce((_acc, value) => value, values[0]);
      expect(reduceInitialResult === values[values.length - 1]).assertTrue();

      expect(Number.isNaN(getAtZero(values))).assertTrue();

      const entriesItem = values.entries().next();
      expect(entriesItem.value[0] === 0).assertTrue();
      expect(Number.isNaN(entriesItem.value[1])).assertTrue();

      const keysItem = values.keys().next();
      expect(keysItem.value === 0).assertTrue();

      const valuesItem = values.values().next();
      expect(Number.isNaN(valuesItem.value)).assertTrue();

      const findResult = values.find((value) => value === values[6]);
      expect(findResult === values[6]).assertTrue();
      expect(values.includes(values[6])).assertTrue();
      expect(values.findIndex((value) => value === values[6]) === 6).assertTrue();
    });

    /**
     * @tc.name testArrayUnionTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNION_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with mixed union values (including NaN, null and undefined).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = ALL_VALUES;
      const fillValues = values.slice();
      const fillResult = fillValues.fill(values[6], 0, 1);
      expect(fillResult[0] === values[6]).assertTrue();

      const concatResult = values.concat([values[6]]);
      expect(concatResult[concatResult.length - 1] === values[6]).assertTrue();

      const spliceDeleteValues = values.slice();
      const removedItems = spliceDeleteValues.splice(0, 1);
      expect(Number.isNaN(removedItems[0])).assertTrue();
      expect(spliceDeleteValues[0] === values[1]).assertTrue();

      const spliceInsertValues = values.slice();
      const insertedItems = spliceInsertValues.splice(0, 0, values[6]);
      expect(insertedItems.length === 0).assertTrue();
      expect(spliceInsertValues[0] === values[6]).assertTrue();

      expect(values.every((value) => value !== '__missing__')).assertTrue();

      const symbolItem = values[Symbol.iterator]().next();
      expect(Number.isNaN(symbolItem.value)).assertTrue();

      const localeResult = values.toLocaleString();
      expect(localeResult.indexOf(String(values[6])) >= 0).assertTrue();
    });
  });
}


