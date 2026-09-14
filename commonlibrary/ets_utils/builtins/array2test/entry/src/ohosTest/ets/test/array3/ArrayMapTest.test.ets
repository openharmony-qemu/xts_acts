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

function getMapSortValue(value: Map<string, number>): number {
  let sortValue: number = Number.MIN_SAFE_INTEGER;
  value.forEach((mapValue: number): void => {
    sortValue = mapValue;
  });
  return sortValue;
}

const MAP_A: Map<string, number> = new Map<string, number>();
MAP_A.set('a', 1);
const MAP_B: Map<string, number> = new Map<string, number>();
MAP_B.set('b', 2);
const MAP_C: Map<string, number> = new Map<string, number>();
MAP_C.set('c', 3);

interface ArrayWithAt extends Array<Map<string, number>> {
  at(index: number): Map<string, number> | undefined;
}

function runAt(values: Array<Map<string, number>>): Map<string, number> | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-1);
}

const MAP_D: Map<string, number> = new Map<string, number>();
MAP_D.set('', 0);
const MAP_E: Map<string, number> = new Map<string, number>();
MAP_E.set('\u200B', -1);
const MAP_F: Map<string, number> = new Map<string, number>();
MAP_F.set('max', Number.MAX_SAFE_INTEGER);
const MAP_G: Map<string, number> = new Map<string, number>();

const VALID_VALUES: Array<Map<string, number>> = [MAP_A, MAP_B, MAP_C, MAP_D, MAP_E, MAP_F, MAP_G, MAP_A];


interface MapInvalidObject { marker: string; }
const MAP_INVALID_OBJECT: MapInvalidObject = { marker: 'invalid' };
type MapInvalidValue = string | number | null | undefined | MapInvalidObject | Array<number>;
type MapAllValue = Map<string, number> | MapInvalidValue;
const ALL_VALUES: Array<MapAllValue> = [
  ...VALID_VALUES,
  'key', 123, null, undefined, MAP_INVALID_OBJECT, []
];

export default function arrayMapTest() {
  describe('ArrayMapTest', () => {
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
     * @tc.name testArrayMapTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with Map object values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<MapAllValue> = ALL_VALUES;
      const emptyResult: Array<MapAllValue> = new Array<MapAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<MapAllValue> = new Array<MapAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<MapAllValue> = new Array<MapAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<MapAllValue> = new Array<MapAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<MapAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: MapAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<MapAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayMapTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with Map object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const copyValues: Array<Map<string, number>> = values.slice();
      const copyResult: Array<Map<string, number>> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertEqual(7);
      expect(values.some((value: Map<string, number>): boolean => value === values[0])).assertTrue();

      const reduceResult: Map<string, number> = values.reduce(
        (acc: Map<string, number>, _value: Map<string, number>): Map<string, number> => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: Map<string, number> = values.reduceRight(
        (acc: Map<string, number>, _value: Map<string, number>): Map<string, number> => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<Map<string, number>> = values.slice();
      const popResult: Map<string, number> | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayMapTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with Map object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const pushValues: Array<Map<string, number>> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<Map<string, number>> = values.slice();
      const shiftResult: Map<string, number> | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<Map<string, number>> = values.slice();
      const reverseResult: Array<Map<string, number>> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined).assertEqual(
        '[object Map]|[object Map]|[object Map]|[object Map]|[object Map]|[object Map]|[object Map]|[object Map]');

      const stringResult: string = values.toString();
      expect(stringResult).assertEqual(
        '[object Map],[object Map],[object Map],[object Map],[object Map],[object Map],[object Map],[object Map]');
    });

    /**
     * @tc.name testArrayMapTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with Map object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const unshiftValues: Array<Map<string, number>> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<Map<string, number>> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<Map<string, number>> = values.slice();
      const sortResult: Array<Map<string, number>> = sortValues.sort((valueA: Map<string, number>, valueB: Map<string, number>): number =>
        getMapSortValue(valueA) - getMapSortValue(valueB),
      );
      expect(sortResult[0].size).assertEqual(0);
      expect(sortResult[1].get('\u200B')).assertEqual(-1);
      expect(sortResult[sortResult.length - 1].get('max')).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(values.indexOf(values[0])).assertEqual(0);

      let forEachLastValue: Map<string, number> = values[0];
      values.forEach((value: Map<string, number>): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<Map<string, number>> = values.map(
        (value: Map<string, number>): Map<string, number> => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<Map<string, number>> = values.filter(
        (value: Map<string, number>): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayMapTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_TEST_0500
     * @tc.desc Verify reduce, at(-1), entries/keys/values and find/includes/findIndex with Map object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const reduceInitialResult: Map<string, number> = values.reduce(
        (_acc: Map<string, number>, value: Map<string, number>): Map<string, number> => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[values.length - 1]);

      const entriesItem: IteratorResult<[number, Map<string, number>]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<Map<string, number>> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: Map<string, number> | undefined = values.find(
        (value: Map<string, number>): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: Map<string, number>): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayMapTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with Map object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<Map<string, number>> = VALID_VALUES;
      const fillValues: Array<Map<string, number>> = values.slice();
      const fillResult: Array<Map<string, number>> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<Map<string, number>> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<Map<string, number>> = values.slice();
      const removedItems: Array<Map<string, number>> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<Map<string, number>> = values.slice();
      const insertedItems: Array<Map<string, number>> = spliceInsertValues.splice(0, 0, values[0]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[0]);
      expect(values.every((value: Map<string, number>): boolean => value instanceof Map)).assertTrue();

      const symbolItem: IteratorResult<Map<string, number>> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(typeof localeResult).assertEqual('string');
    });

  });
}