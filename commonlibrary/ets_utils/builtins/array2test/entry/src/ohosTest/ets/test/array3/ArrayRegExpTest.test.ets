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

const REGEXP_A: RegExp = /abc/gi;
const REGEXP_B: RegExp = /def/m;
const REGEXP_C: RegExp = /^test$/u;
const REGEXP_D: RegExp = new RegExp('');
const REGEXP_E: RegExp = /测试😀/u;
const REGEXP_F: RegExp = /[\u0000-\u001F]/g;

interface ArrayWithAt extends Array<RegExp> {
  at(index: number): RegExp | undefined;
}

function runAt(values: Array<RegExp>): RegExp | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-0);
}

const VALID_VALUES: Array<RegExp> = [REGEXP_A, REGEXP_B, REGEXP_C, REGEXP_D, REGEXP_E, REGEXP_F, REGEXP_A];


interface RegExpInvalidObject { marker: string; }
const REGEXP_INVALID_OBJECT: RegExpInvalidObject = { marker: 'invalid' };
type RegExpInvalidValue = string | number | null | undefined | RegExpInvalidObject | Array<number>;
type RegExpAllValue = RegExp | RegExpInvalidValue;
const ALL_VALUES: Array<RegExpAllValue> = [
  ...VALID_VALUES,
  'abc', 123, null, undefined, REGEXP_INVALID_OBJECT, []
];

export default function arrayRegExpTest() {
  describe('ArrayRegExpTest', () => {
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
     * @tc.name testArrayRegExpTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REGEXP_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with RegExp object values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExpAllValue> = ALL_VALUES;
      const emptyResult: Array<RegExpAllValue> = new Array<RegExpAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<RegExpAllValue> = new Array<RegExpAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<RegExpAllValue> = new Array<RegExpAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<RegExpAllValue> = new Array<RegExpAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<RegExpAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: RegExpAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<RegExpAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayRegExpTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REGEXP_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with RegExp object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const copyValues: Array<RegExp> = values.slice();
      const copyResult: Array<RegExp> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: RegExp): boolean => value === values[0])).assertTrue();

      const reduceResult: RegExp = values.reduce(
        (acc: RegExp, _value: RegExp): RegExp => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: RegExp = values.reduceRight(
        (acc: RegExp, _value: RegExp): RegExp => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<RegExp> = values.slice();
      const popResult: RegExp | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayRegExpTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REGEXP_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with RegExp object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const pushValues: Array<RegExp> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<RegExp> = values.slice();
      const shiftResult: RegExp | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<RegExp> = values.slice();
      const reverseResult: Array<RegExp> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined.indexOf(String(values[0]))).assertLargerOrEqual(0);

      const stringResult: string = values.toString();
      expect(stringResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArrayRegExpTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REGEXP_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with RegExp object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const unshiftValues: Array<RegExp> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<RegExp> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<RegExp> = values.slice();
      const sortResult: Array<RegExp> = sortValues.sort((valueA: RegExp, valueB: RegExp): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: RegExp = values[0];
      values.forEach((value: RegExp): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<RegExp> = values.map(
        (value: RegExp): RegExp => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<RegExp> = values.filter(
        (value: RegExp): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayRegExpTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REGEXP_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with RegExp object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const reduceInitialResult: RegExp = values.reduce(
        (_acc: RegExp, value: RegExp): RegExp => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[0]);

      const entriesItem: IteratorResult<[number, RegExp]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<RegExp> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: RegExp | undefined = values.find(
        (value: RegExp): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: RegExp): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayRegExpTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REGEXP_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with RegExp object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const fillValues: Array<RegExp> = values.slice();
      const fillResult: Array<RegExp> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<RegExp> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<RegExp> = values.slice();
      const removedItems: Array<RegExp> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<RegExp> = values.slice();
      const insertedItems: Array<RegExp> = spliceInsertValues.splice(0, 0, values[1]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[1]);
      expect(spliceInsertValues[1]).assertEqual(values[0]);
      expect(values.every((value: RegExp): boolean => value === REGEXP_A)).assertFalse();
      expect(values[0].source).assertEqual('abc');

      const symbolItem: IteratorResult<RegExp> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(localeResult.indexOf(',')).assertLargerOrEqual(0);
    });

  });
}





