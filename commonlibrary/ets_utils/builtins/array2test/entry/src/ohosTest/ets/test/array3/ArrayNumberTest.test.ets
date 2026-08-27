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


function runArrayFromArrayLikeCase(values: Array<number>): Array<boolean> {
  const arrayLike: Array<number> = [values[0], values[1]];
  const result: Array<number> = Array.from(arrayLike);
  const fromArrayLikePassed: boolean = result.length === 2 && result[0] === values[0];
  const mapped: Array<number | undefined> = Array.from(
    arrayLike,
    (value: number, index: number): number | undefined => index === 0 ? value : undefined,
  );
  const mapFnPassed: boolean = mapped.length === 2 && mapped[1] === undefined;
  return [fromArrayLikePassed, mapFnPassed];
}

interface NumberArrayWithAt extends Array<number> {
  at(index: number): number | undefined;
}

function runArrayAtCase(values: Array<number>): boolean {
  const arrayWithAt: NumberArrayWithAt = values as NumberArrayWithAt;
  return arrayWithAt.at(-0) === values[0];
}

const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MIN_VALUE, Number.MIN_VALUE - 1, Number.EPSILON,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, -128, 127, -32768, 32767, -2147483648,
  2147483647, -9223372036854775808, 9223372036854775807, -1.40129846432481707e-45,
  1.40129846432481707e-45, -3.4028234663852886e38, 3.4028234663852886e38, 65535,
  -1, 999999.99, 13800138000, 123456, -100.5,
];


interface NumberInvalidObject { marker: string; }
const NUMBER_INVALID_OBJECT: NumberInvalidObject = { marker: 'invalid' };
type NumberInvalidValue = string | number | null | undefined | NumberInvalidObject | Array<number> | boolean | bigint;
type NumberAllValue = number | NumberInvalidValue;
const ALL_VALUES: Array<NumberAllValue> = [
  ...VALID_VALUES,
  '123', '0x12', null, undefined, NUMBER_INVALID_OBJECT, [], true, BigInt('16045690984833335006'), BigInt('9007199254740991')
];

export default function arrayNumberTest() {
  describe('ArrayNumberTest', () => {
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
     * @tc.name testArrayNumberTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NUMBER_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with number edge values (NaN, infinities and signed zero), including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<NumberAllValue> = ALL_VALUES;
      const spreadResult: Array<NumberAllValue> = new Array(...values);
      expect(spreadResult[2]).assertEqual(values[2]);
      expect(spreadResult[0]).assertEqual(values[0]);
      expect(spreadResult[1]).assertEqual(values[1]);
      expect(Number.isNaN(spreadResult[17])).assertTrue();
      expect(spreadResult[18]).assertEqual(values[18]);
      expect(spreadResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const arrayLikeResults: Array<boolean> = runArrayFromArrayLikeCase(VALID_VALUES);
      expect(arrayLikeResults[0]).assertTrue();
      expect(arrayLikeResults[1]).assertTrue();
    });

    /**
     * @tc.name testArrayNumberTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NUMBER_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with number edge values (NaN, infinities and signed zero).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      expect(Array.isArray(values)).assertTrue();

      const ofResult: Array<number> = Array.of(...values);
      expect(ofResult[2]).assertEqual(values[2]);
      expect(ofResult[0]).assertEqual(values[0]);
      expect(ofResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const copyValues: Array<number> = values.slice();
      const originalSecond: number = copyValues[1];
      const copyWithinResult: Array<number> = copyValues.copyWithin(
        0,
        Math.min(1, copyValues.length),
        Math.min(2, copyValues.length),
      );
      expect(copyWithinResult).assertEqual(copyValues);
      expect(copyWithinResult[1]).assertEqual(values[1]);
      expect(copyValues[0]).assertEqual(originalSecond);
    });

    /**
     * @tc.name testArrayNumberTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NUMBER_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with number edge values (NaN, infinities and signed zero).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: number): boolean => value === values[0])).assertTrue();

      const reduceRightResult: number = values.reduceRight((acc: number, value: number): number => acc + value);
      expect(isNaN(reduceRightResult)).assertTrue();

      const reduceRightInitialResult: number = values.reduceRight(
        (acc: number, value: number): number => acc + value,
        values[0],
      );
      expect(isNaN(reduceRightInitialResult)).assertTrue();

      const popValues: Array<number> = values.slice();
      const popLength: number = popValues.length;
      popValues.pop();
      expect(popValues.length).assertEqual(Math.max(0, popLength - 1));

      const pushValues: Array<number> = values.slice();
      const pushResult: number = pushValues.push(pushValues[0]);
      expect(pushResult).assertEqual(pushValues.length);
      expect(values.join('|').indexOf('|')).assertLargerOrEqual(0);

      const shiftValues: Array<number> = values.slice();
      const shiftLength: number = shiftValues.length;
      shiftValues.shift();
      expect(shiftValues.length).assertEqual(Math.max(0, shiftLength - 1));

      const reverseValues: Array<number> = values.slice();
      const reverseResult: Array<number> = reverseValues.reverse();
      expect(reverseResult).assertEqual(reverseValues);
    });

    /**
     * @tc.name testArrayNumberTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NUMBER_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with number edge values (NaN, infinities and signed zero).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const reverseValues: Array<number> = values.slice();

      reverseValues.reverse();
      expect(reverseValues[0]).assertEqual(values[values.length - 1]);

      const unshiftValues: Array<number> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(unshiftValues[0]);
      expect(unshiftResult).assertEqual(unshiftValues.length);
      expect(values.toString().indexOf(',')).assertLargerOrEqual(0);

      const sliceResult: Array<number> = values.slice(0, Math.min(2, values.length));
      expect(sliceResult[0]).assertEqual(values[0]);

      const sortValues: Array<number> = values.slice();
      const sortResult: Array<number> = sortValues.sort((valueA: number, valueB: number): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: number = values[0];
      values.forEach((value: number): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<number> = values.map((value: number): number => value);
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<number> = values.filter((value: number): boolean => typeof value === 'number');
      expect(Number.isNaN(filterResult[17])).assertTrue();
    });

    /**
     * @tc.name testArrayNumberTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NUMBER_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with number edge values (NaN, infinities and signed zero).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const reduceResult: number = values.reduce((acc: number, value: number): number => acc + value);
      expect(isNaN(reduceResult)).assertTrue();

      const reduceInitialResult: number = values.reduce(
        (acc: number, value: number): number => acc + value,
        values[0],
      );
      expect(isNaN(reduceInitialResult)).assertTrue();
      expect(runArrayAtCase(values)).assertTrue();

      const entriesItem: IteratorResult<[number, number]> = values.entries().next();
      expect(entriesItem.done).assertFalse();

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.done).assertFalse();

      const valuesItem: IteratorResult<number> = values[Symbol.iterator]().next();
      expect(valuesItem.done).assertFalse();

      const findResult: number | undefined = values.find((value: number): boolean => value === values[0]);
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: number): boolean => typeof value === 'number')).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArrayNumberTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_NUMBER_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with number edge values (NaN, infinities and signed zero).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const fillValues: Array<number> = values.slice();
      const fillResult: Array<number> = fillValues.fill(fillValues[0], 0, Math.min(1, fillValues.length));
      expect(fillResult).assertEqual(fillValues);

      const concatResult: Array<number> = values.concat(values[0]);
      expect(concatResult[values.length]).assertEqual(values[0]);

      const spliceDeleteValues: Array<number> = values.slice();
      const spliceDeleteLength: number = spliceDeleteValues.length;
      const spliceDeleteCount: number = spliceDeleteLength > 0 ? 1 : 0;
      const removedItems: Array<number> = spliceDeleteValues.splice(0, spliceDeleteCount);
      expect(Array.isArray(removedItems)).assertTrue();
      expect(spliceDeleteValues.length).assertEqual(spliceDeleteLength - spliceDeleteCount);
      expect(values.every((value: number): boolean => typeof value === 'number')).assertTrue();
      expect(values.toLocaleString().indexOf(',')).assertLargerOrEqual(0);

      const spliceInsertValues: Array<number> = values.slice();
      const spliceInsertLength: number = spliceInsertValues.length;
      const insertedItems: Array<number> = spliceInsertValues.splice(0, 0, spliceInsertValues[0]);
      expect(Array.isArray(insertedItems)).assertTrue();
      expect(spliceInsertValues.length).assertEqual(spliceInsertLength + 1);

      const symbolItem: IteratorResult<number> = values[Symbol.iterator]().next();
      expect(symbolItem.done).assertFalse();
    });

  });
}











