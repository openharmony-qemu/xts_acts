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

interface ArrayWithAt extends Array<bigint> {
  at(index: number): bigint | undefined;
}

function runAt(values: Array<bigint>): bigint | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-0);
}

const VALID_VALUES: Array<bigint> = [
  100n, -99n, BigInt("9007199254740991"), BigInt(Number.MAX_SAFE_INTEGER), 9007199254740991n, -9007199254740991n, 0n, BigInt("0"), BigInt("123456789012345678901234567890"), BigInt("138001380001234567890"),
  BigInt("100000000000000000000000"), -1n,
];


interface BigIntInvalidObject { marker: string; }
const BIGINT_INVALID_OBJECT: BigIntInvalidObject = { marker: 'invalid' };
type BigIntInvalidValue = number | string | null | undefined | BigIntInvalidObject;
type BigIntAllValue = bigint | BigIntInvalidValue;
const ALL_VALUES: Array<BigIntAllValue> = [
  ...VALID_VALUES,
  100, '100n', null, undefined, BIGINT_INVALID_OBJECT, NaN, Infinity
];

export default function arrayBigIntTest() {
  describe('ArrayBigIntTest', () => {
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
     * @tc.name testArrayBigIntTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BIGINT_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with BigInt values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<BigIntAllValue> = ALL_VALUES;
      const emptyResult: Array<BigIntAllValue> = new Array<BigIntAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<BigIntAllValue> = new Array<BigIntAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<BigIntAllValue> = new Array<BigIntAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<BigIntAllValue> = new Array<BigIntAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<BigIntAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: BigIntAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<BigIntAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayBigIntTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BIGINT_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with BigInt values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const copyValues: Array<bigint> = values.slice();
      const copyResult: Array<bigint> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: bigint): boolean => value === values[0])).assertTrue();

      const reduceResult: bigint = values.reduce(
        (acc: bigint, _value: bigint): bigint => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: bigint = values.reduceRight(
        (acc: bigint, _value: bigint): bigint => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<bigint> = values.slice();
      const popResult: bigint | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayBigIntTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BIGINT_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with BigInt values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const pushValues: Array<bigint> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<bigint> = values.slice();
      const shiftResult: bigint | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<bigint> = values.slice();
      const reverseResult: Array<bigint> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined.indexOf(String(values[0]))).assertLargerOrEqual(0);

      const stringResult: string = values.toString();
      expect(stringResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArrayBigIntTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BIGINT_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with BigInt values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const unshiftValues: Array<bigint> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<bigint> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<bigint> = values.slice();
      const sortResult: Array<bigint> = sortValues.sort((valueA: bigint, valueB: bigint): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: bigint = values[0];
      values.forEach((value: bigint): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<bigint> = values.map(
        (value: bigint): bigint => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<bigint> = values.filter(
        (value: bigint): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayBigIntTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BIGINT_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with BigInt values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const reduceInitialResult: bigint = values.reduce(
        (_acc: bigint, value: bigint): bigint => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[0]);

      const entriesItem: IteratorResult<[number, bigint]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<bigint> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: bigint | undefined = values.find(
        (value: bigint): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: bigint): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayBigIntTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BIGINT_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with BigInt values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const fillValues: Array<bigint> = values.slice();
      const fillResult: Array<bigint> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<bigint> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<bigint> = values.slice();
      const removedItems: Array<bigint> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<bigint> = values.slice();
      const insertedItems: Array<bigint> = spliceInsertValues.splice(0, 0, values[1]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[1]);
      expect(spliceInsertValues[1]).assertEqual(values[0]);
      expect(values.every((value: bigint): boolean => value > 0n)).assertFalse();
      expect(values[0]).assertEqual(100n);

      const symbolItem: IteratorResult<bigint> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(localeResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

  });
}