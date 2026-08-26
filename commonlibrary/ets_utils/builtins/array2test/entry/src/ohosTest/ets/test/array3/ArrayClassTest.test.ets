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

class ArrayClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const CLASS_A: ArrayClassItem = new ArrayClassItem(1, '测试');
const CLASS_B: ArrayClassItem = new ArrayClassItem(0, '');
const CLASS_C: ArrayClassItem = new ArrayClassItem(-1, '测试😀');
const CLASS_D: ArrayClassItem = new ArrayClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E: ArrayClassItem = new ArrayClassItem(13800138000, '13800138000');
const CLASS_F: ArrayClassItem = new ArrayClassItem(99999999, '<script>alert(1)</script>');

interface ArrayWithAt extends Array<ArrayClassItem> {
  at(index: number): ArrayClassItem | undefined;
}

function runAt(values: Array<ArrayClassItem>): ArrayClassItem | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-0);
}

const VALID_VALUES: Array<ArrayClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];


interface ClassInvalidObject { marker: string; }
const CLASS_INVALID_OBJECT: ClassInvalidObject = { marker: 'invalid' };
type ClassInvalidValue = number | string | null | undefined | ClassInvalidObject | Array<number>;
type ClassAllValue = ArrayClassItem | ClassInvalidValue;
const ALL_VALUES: Array<ClassAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, CLASS_INVALID_OBJECT, []
];

export default function arrayClassTest() {
  describe('ArrayClassTest', () => {
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
     * @tc.name testArrayClassTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CLASS_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with class-instance values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ClassAllValue> = ALL_VALUES;
      const emptyResult: Array<ClassAllValue> = new Array<ClassAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<ClassAllValue> = new Array<ClassAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<ClassAllValue> = new Array<ClassAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<ClassAllValue> = new Array<ClassAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<ClassAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: ClassAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<ClassAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayClassTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CLASS_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with class-instance values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const copyValues: Array<ArrayClassItem> = values.slice();
      const copyResult: Array<ArrayClassItem> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: ArrayClassItem): boolean => value === values[0])).assertTrue();

      const reduceResult: ArrayClassItem = values.reduce(
        (acc: ArrayClassItem, _value: ArrayClassItem): ArrayClassItem => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: ArrayClassItem = values.reduceRight(
        (acc: ArrayClassItem, _value: ArrayClassItem): ArrayClassItem => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<ArrayClassItem> = values.slice();
      const popResult: ArrayClassItem | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayClassTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CLASS_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with class-instance values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const pushValues: Array<ArrayClassItem> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<ArrayClassItem> = values.slice();
      const shiftResult: ArrayClassItem | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<ArrayClassItem> = values.slice();
      const reverseResult: Array<ArrayClassItem> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined.indexOf(String(values[0]))).assertLargerOrEqual(0);

      const stringResult: string = values.toString();
      expect(stringResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArrayClassTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CLASS_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with class-instance values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const unshiftValues: Array<ArrayClassItem> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<ArrayClassItem> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<ArrayClassItem> = values.slice();
      const sortResult: Array<ArrayClassItem> = sortValues.sort((valueA: ArrayClassItem, valueB: ArrayClassItem): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: ArrayClassItem = values[0];
      values.forEach((value: ArrayClassItem): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<ArrayClassItem> = values.map(
        (value: ArrayClassItem): ArrayClassItem => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<ArrayClassItem> = values.filter(
        (value: ArrayClassItem): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayClassTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CLASS_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with class-instance values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const reduceInitialResult: ArrayClassItem = values.reduce(
        (_acc: ArrayClassItem, value: ArrayClassItem): ArrayClassItem => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[0]);

      const entriesItem: IteratorResult<[number, ArrayClassItem]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<ArrayClassItem> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: ArrayClassItem | undefined = values.find(
        (value: ArrayClassItem): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: ArrayClassItem): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayClassTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CLASS_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with class-instance values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayClassItem> = VALID_VALUES;
      const fillValues: Array<ArrayClassItem> = values.slice();
      const fillResult: Array<ArrayClassItem> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<ArrayClassItem> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<ArrayClassItem> = values.slice();
      const removedItems: Array<ArrayClassItem> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<ArrayClassItem> = values.slice();
      const insertedItems: Array<ArrayClassItem> = spliceInsertValues.splice(0, 0, values[0]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[0]);
      expect(values.every((value: ArrayClassItem): boolean => value === value)).assertTrue();
      expect(values[0]).assertEqual(values[0]);

      const symbolItem: IteratorResult<ArrayClassItem> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(typeof localeResult).assertEqual('string');
    });

  });
}