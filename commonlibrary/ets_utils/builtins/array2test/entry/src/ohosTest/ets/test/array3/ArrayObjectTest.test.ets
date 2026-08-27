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

interface ArrayObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}

const OBJECT_A: ArrayObjectItem = { id: 1, label: '测试', name: '测试', age: 20 };
const OBJECT_B: ArrayObjectItem = { id: 0, label: '', name: '', age: 0 };
const OBJECT_C: ArrayObjectItem = { id: -1, label: '测试😀', name: 'a'.repeat(100), age: Number.MAX_SAFE_INTEGER };
const OBJECT_D: ArrayObjectItem = { id: 13800138000, label: '13800138000', name: 'test@example.com', age: 0, grade: 0 };
const OBJECT_E: ArrayObjectItem = { id: Number.MAX_SAFE_INTEGER, label: '<script>alert(1)</script>', name: 'https://test.com', age: Number.MIN_SAFE_INTEGER, className: '一班' };
const OBJECT_F: ArrayObjectItem = { id: 99999999, label: '2026-03-05', name: '138****8000', age: -1, extra: 1 };

interface ArrayWithAt extends Array<ArrayObjectItem> {
  at(index: number): ArrayObjectItem | undefined;
}

function runAt(values: Array<ArrayObjectItem>): ArrayObjectItem | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-0);
}

const VALID_VALUES: Array<ArrayObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];


interface ObjectInvalidObject { marker: string; }
const OBJECT_INVALID_OBJECT: ObjectInvalidObject = { marker: 'invalid' };
interface ObjectInvalidShape { name: number; age: string; }
type ObjectInvalidValue = number | string | null | undefined | ObjectInvalidObject | ObjectInvalidShape | Array<number>;
type ObjectAllValue = ArrayObjectItem | ObjectInvalidValue;
const ALL_VALUES: Array<ObjectAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, OBJECT_INVALID_OBJECT, { name: 123, age: '20' }, []
];

export default function arrayObjectTest() {
  describe('ArrayObjectTest', () => {
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
     * @tc.name testArrayObjectTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OBJECT_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with plain object values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ObjectAllValue> = ALL_VALUES;
      const emptyResult: Array<ObjectAllValue> = new Array<ObjectAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<ObjectAllValue> = new Array<ObjectAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<ObjectAllValue> = new Array<ObjectAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<ObjectAllValue> = new Array<ObjectAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<ObjectAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: ObjectAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<ObjectAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayObjectTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OBJECT_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with plain object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const copyValues: Array<ArrayObjectItem> = values.slice();
      const copyResult: Array<ArrayObjectItem> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertLargerOrEqual(0);
      expect(values.some((value: ArrayObjectItem): boolean => value === values[0])).assertTrue();

      const reduceResult: ArrayObjectItem = values.reduce(
        (acc: ArrayObjectItem, _value: ArrayObjectItem): ArrayObjectItem => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: ArrayObjectItem = values.reduceRight(
        (acc: ArrayObjectItem, _value: ArrayObjectItem): ArrayObjectItem => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<ArrayObjectItem> = values.slice();
      const popResult: ArrayObjectItem | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayObjectTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OBJECT_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with plain object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const pushValues: Array<ArrayObjectItem> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<ArrayObjectItem> = values.slice();
      const shiftResult: ArrayObjectItem | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<ArrayObjectItem> = values.slice();
      const reverseResult: Array<ArrayObjectItem> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined.indexOf(String(values[0]))).assertLargerOrEqual(0);

      const stringResult: string = values.toString();
      expect(stringResult.indexOf(String(values[0]))).assertLargerOrEqual(0);
    });

    /**
     * @tc.name testArrayObjectTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OBJECT_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with plain object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const unshiftValues: Array<ArrayObjectItem> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<ArrayObjectItem> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<ArrayObjectItem> = values.slice();
      const sortResult: Array<ArrayObjectItem> = sortValues.sort((valueA: ArrayObjectItem, valueB: ArrayObjectItem): number =>
        String(valueA).localeCompare(String(valueB)),
      );
      expect(sortResult).assertEqual(sortValues);
      expect(values.indexOf(values[0])).assertLargerOrEqual(0);

      let forEachLastValue: ArrayObjectItem = values[0];
      values.forEach((value: ArrayObjectItem): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<ArrayObjectItem> = values.map(
        (value: ArrayObjectItem): ArrayObjectItem => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<ArrayObjectItem> = values.filter(
        (value: ArrayObjectItem): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayObjectTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OBJECT_TEST_0500
     * @tc.desc Verify reduce, at(-0), entries/keys/values and find/includes/findIndex with plain object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const reduceInitialResult: ArrayObjectItem = values.reduce(
        (_acc: ArrayObjectItem, value: ArrayObjectItem): ArrayObjectItem => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[0]);

      const entriesItem: IteratorResult<[number, ArrayObjectItem]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<ArrayObjectItem> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: ArrayObjectItem | undefined = values.find(
        (value: ArrayObjectItem): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: ArrayObjectItem): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayObjectTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OBJECT_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with plain object values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<ArrayObjectItem> = VALID_VALUES;
      const fillValues: Array<ArrayObjectItem> = values.slice();
      const fillResult: Array<ArrayObjectItem> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<ArrayObjectItem> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<ArrayObjectItem> = values.slice();
      const removedItems: Array<ArrayObjectItem> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<ArrayObjectItem> = values.slice();
      const insertedItems: Array<ArrayObjectItem> = spliceInsertValues.splice(0, 0, values[1]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[1]);
      expect(spliceInsertValues[1]).assertEqual(values[0]);
      expect(values.every((value: ArrayObjectItem): boolean => value === OBJECT_A)).assertFalse();
      expect(values[0].id).assertEqual(1);

      const symbolItem: IteratorResult<ArrayObjectItem> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      expect(localeResult.indexOf(',')).assertLargerOrEqual(0);
    });

  });
}





