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
import { getSymbolAllValues, getSymbolAtZero, getSymbolValidValues } from './ArraySymbolTest';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

function runArraySymbolTest0100(): Array<boolean> {
  const values = getSymbolAllValues();
  const constructorResult = new Array(values[0], values[1]);
  const spreadResult = new Array(...values);
  const fromArrayLikeResult = Array.from(values);
  const mappedResult = Array.from(values, (value) => String(value));
  const ofResult = Array.of(...values);
  return [
    Array.isArray(values),
    constructorResult[1] === values[1],
    spreadResult[0] === values[0],
    fromArrayLikeResult[values.length - 1] === values[values.length - 1],
    mappedResult[1] === String(values[1]),
    ofResult[1] === values[1],
  ];
}

function runArraySymbolTest0200(): Array<boolean> {
  const values = getSymbolValidValues();
  const copyValues = values.slice();
  const copyResult = copyValues.copyWithin(0, 1, 2);
  const reduceResult = values.reduce((acc) => acc);
  const reduceRightResult = values.reduceRight((acc) => acc);
  const popValues = values.slice();
  const popResult = popValues.pop();
  return [
    copyResult[0] === values[1],
    copyValues[1] === values[1],
    values.lastIndexOf(values[0]) >= 0,
    values.some((value) => value === values[0]),
    reduceResult === values[0],
    reduceRightResult === values[values.length - 1],
    popResult === values[values.length - 1],
  ];
}

function runArraySymbolTest0300(): Array<boolean> {
  const values = getSymbolValidValues();
  const pushValues = values.slice();
  const pushResult = pushValues.push(values[0]);
  const shiftValues = values.slice();
  const shiftResult = shiftValues.shift();
  const reverseValues = values.slice();
  const reverseResult = reverseValues.reverse();
  let joinThrew = false;
  let stringConversionThrew = false;
  try {
    values.join('|');
  } catch (_error) {
    joinThrew = true;
  }
  try {
    values.toString();
  } catch (_error) {
    stringConversionThrew = true;
  }
  return [
    pushResult === values.length + 1,
    pushValues[pushValues.length - 1] === values[0],
    shiftResult === values[0],
    shiftValues[0] === values[1],
    reverseResult[0] === values[values.length - 1],
    joinThrew,
    stringConversionThrew,
  ];
}

function runArraySymbolTest0400(): Array<boolean> {
  const values = getSymbolValidValues();
  const unshiftValues = values.slice();
  const unshiftResult = unshiftValues.unshift(values[0]);
  const sliceResult = values.slice(0, 2);
  const sortValues = values.slice();
  const sortResult = sortValues.sort((valueA, valueB) =>
    String(valueA).localeCompare(String(valueB))
  );
  let forEachLastValue = values[0];
  values.forEach((value) => {
    forEachLastValue = value;
  });
  const mapResult = values.map((value) => value);
  const filterResult = values.filter((value) => value === values[0]);
  return [
    unshiftResult === values.length + 1,
    unshiftValues[0] === values[0],
    sliceResult[0] === values[0],
    sliceResult[1] === values[1],
    sortResult === sortValues,
    values.indexOf(values[0]) >= 0,
    forEachLastValue === values[values.length - 1],
    mapResult[1] === values[1],
    filterResult[0] === values[0],
  ];
}

function runArraySymbolTest0500(): Array<boolean> {
  const values = getSymbolValidValues();
  const reduceInitialResult = values.reduce((_acc, value) => value, values[0]);
  const entriesItem = values.entries().next();
  const keysItem = values.keys().next();
  const valuesItem = values.values().next();
  const findResult = values.find((value) => value === values[0]);
  return [
    reduceInitialResult === values[values.length - 1],
    getSymbolAtZero() === values[0],
    entriesItem.value[0] === 0,
    entriesItem.value[1] === values[0],
    keysItem.value === 0,
    valuesItem.value === values[0],
    findResult === values[0],
    values.includes(values[0]),
    values.findIndex((value) => value === values[0]) === 0,
  ];
}

function runArraySymbolTest0600(): Array<boolean> {
  const values = getSymbolValidValues();
  const fillValues = values.slice();
  const fillResult = fillValues.fill(values[0], 0, 1);
  const concatResult = values.concat([values[0]]);
  const spliceDeleteValues = values.slice();
  const removedItems = spliceDeleteValues.splice(0, 1);
  const spliceInsertValues = values.slice();
  const insertedItems = spliceInsertValues.splice(0, 0, values[1]);
  const symbolItem = values[Symbol.iterator]().next();
  const localeResult = values.toLocaleString();

  return [
    fillResult[0] === values[0],
    concatResult[concatResult.length - 1] === values[0],
    removedItems[0] === values[0],
    spliceDeleteValues[0] === values[1],
    insertedItems.length === 0,
    spliceInsertValues[0] === values[1],
    spliceInsertValues[1] === values[0],
    values.every((value) => typeof value === 'symbol'),
    symbolItem.value === values[0],
    localeResult.indexOf(String(values[0])) >= 0,
  ];
}

export default function arraySymbolTest() {
  describe('ArraySymbolTest', () => {
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
     * @tc.name testArraySymbolTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SYMBOL_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray preserve Symbol references and map-callback results.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyResult: Array<undefined> = new Array<undefined>();
      expect(Array.isArray(emptyResult)).assertTrue();
      const lengthResult: Array<undefined> = new Array<undefined>(3);
      expect(lengthResult.length).assertEqual(3);
      const results: Array<boolean> = runArraySymbolTest0100();
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
      expect(results[3]).assertTrue();
      expect(results[4]).assertTrue();
      expect(results[5]).assertTrue();
    });

    /**
     * @tc.name testArraySymbolTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SYMBOL_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with Symbol references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const results: Array<boolean> = runArraySymbolTest0200();
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
      expect(results[3]).assertTrue();
      expect(results[4]).assertTrue();
      expect(results[5]).assertTrue();
      expect(results[6]).assertTrue();
    });

    /**
     * @tc.name testArraySymbolTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SYMBOL_TEST_0300
     * @tc.desc Verify push, shift and reverse preserve Symbol references; join/toString throw as expected.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const results: Array<boolean> = runArraySymbolTest0300();
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
      expect(results[3]).assertTrue();
      expect(results[4]).assertTrue();
      expect(results[5]).assertTrue();
      expect(results[6]).assertTrue();
    });

    /**
     * @tc.name testArraySymbolTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SYMBOL_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with Symbol references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const results: Array<boolean> = runArraySymbolTest0400();
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
      expect(results[3]).assertTrue();
      expect(results[4]).assertTrue();
      expect(results[5]).assertTrue();
      expect(results[6]).assertTrue();
      expect(results[7]).assertTrue();
      expect(results[8]).assertTrue();
    });

    /**
     * @tc.name testArraySymbolTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SYMBOL_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with Symbol references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const results: Array<boolean> = runArraySymbolTest0500();
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
      expect(results[3]).assertTrue();
      expect(results[4]).assertTrue();
      expect(results[5]).assertTrue();
      expect(results[6]).assertTrue();
      expect(results[7]).assertTrue();
      expect(results[8]).assertTrue();
    });

    /**
     * @tc.name testArraySymbolTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SYMBOL_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with Symbol references.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const results: Array<boolean> = runArraySymbolTest0600();
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
      expect(results[3]).assertTrue();
      expect(results[4]).assertTrue();
      expect(results[5]).assertTrue();
      expect(results[6]).assertTrue();
      expect(results[7]).assertTrue();
      expect(results[8]).assertTrue();
    });
  });
}
