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

type StringDynamicItem = string | null | undefined;

interface ArrayWithAt extends Array<StringDynamicItem> {
  at(index: number): StringDynamicItem | undefined;
}

function runAt(values: Array<StringDynamicItem>): StringDynamicItem | undefined {
  const arrayWithAt: ArrayWithAt = values as ArrayWithAt;
  return arrayWithAt.at(-1);
}

const STRING_SPECIAL_CHARACTERS: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
const STRING_ASCII_VISIBLE: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
const STRING_SPECIAL_ESCAPES: string = "\\a \\b \\f \\n \\r \\t \\v \\\\ \\' \\\" \\? \\0 \\ddd \\xhh";
const STRING_CONTROL_ESCAPES: string = '\u0007\b\f\n\r\t\u000b\u0000';
const STRING_LONG_VALUE: string = 'a'.repeat(100000);

const VALID_VALUES: Array<StringDynamicItem> = [
  'test', '测试', `模板字符串${123}`, '\u4e2d\u6587', '\x61', 'a\nb', '0', 'NaN', 'true', 'null',
  '', '   ', '\u200B', '\u0000', '\t', '\r\n', 'a', STRING_LONG_VALUE, '测试😀', STRING_SPECIAL_CHARACTERS,
  STRING_ASCII_VISIBLE, STRING_SPECIAL_ESCAPES, STRING_CONTROL_ESCAPES, '👆', '\uD83D\uDC40', '\uD83D\uDCAF', '\uD83C\uDF85', '\uD83C\uDC04', '\uD83C\uDFF4', '13800138000',
  '310101199001011234', 'test@example.com', '<script>alert(1)</script>', 'https://test.com', '2026-03-05', '138****8000', null, undefined, '\udc04', '\ud83d',
  '\udff4',
];

interface StringInvalidObject { marker: string; }
const STRING_INVALID_OBJECT: StringInvalidObject = { marker: 'invalid' };
type StringInvalidValue = number | bigint | StringInvalidObject | Array<number>;
type StringAllValue = StringDynamicItem | StringInvalidValue;
const ALL_VALUES: Array<StringAllValue> = [
  ...VALID_VALUES,
  123, 0n, STRING_INVALID_OBJECT, [], 'Symbol()'
];

export default function arrayStringTest() {
  describe('ArrayStringTest', () => {
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
     * @tc.name testArrayStringTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_STRING_TEST_0100
     * @tc.desc Verify Array constructors, Array.from/of and Array.isArray with special string values, including map conversion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<StringAllValue> = ALL_VALUES;
      const emptyResult: Array<StringAllValue> = new Array<StringAllValue>();
      expect(Array.isArray(values)).assertTrue();
      expect(Array.isArray(emptyResult)).assertTrue();

      const lengthResult: Array<StringAllValue> = new Array<StringAllValue>(3);
      expect(lengthResult.length).assertEqual(3);

      const constructorResult: Array<StringAllValue> = new Array<StringAllValue>(values[0], values[1]);
      expect(constructorResult[1]).assertEqual(values[1]);

      const spreadResult: Array<StringAllValue> = new Array<StringAllValue>(...values);
      expect(spreadResult[0]).assertEqual(values[0]);

      const fromArrayLikeResult: Array<StringAllValue> = Array.from(values);
      expect(fromArrayLikeResult[values.length - 1]).assertEqual(values[values.length - 1]);

      const mappedResult: Array<string> = Array.from(values, (value: StringAllValue): string => String(value));
      expect(mappedResult[1]).assertEqual(String(values[1]));

      const ofResult: Array<StringAllValue> = Array.of(...values);
      expect(ofResult[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name testArrayStringTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_STRING_TEST_0200
     * @tc.desc Verify copyWithin/slice, lastIndexOf/some, reduce/reduceRight and pop with special string values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<StringDynamicItem> = VALID_VALUES;
      const copyValues: Array<StringDynamicItem> = values.slice();
      const copyResult: Array<StringDynamicItem> = copyValues.copyWithin(0, 1, 2);
      expect(copyResult[0]).assertEqual(values[1]);
      expect(copyValues[1]).assertEqual(values[1]);
      expect(values.lastIndexOf(values[0])).assertEqual(0);
      expect(values.some((value: StringDynamicItem): boolean => value === values[0])).assertTrue();

      const reduceResult: StringDynamicItem = values.reduce(
        (acc: StringDynamicItem, _value: StringDynamicItem): StringDynamicItem => acc,
      );
      expect(reduceResult).assertEqual(values[0]);

      const reduceRightResult: StringDynamicItem = values.reduceRight(
        (acc: StringDynamicItem, _value: StringDynamicItem): StringDynamicItem => acc,
      );
      expect(reduceRightResult).assertEqual(values[values.length - 1]);

      const popValues: Array<StringDynamicItem> = values.slice();
      const popResult: StringDynamicItem | undefined = popValues.pop();
      expect(popResult).assertEqual(values[values.length - 1]);
    });

    /**
     * @tc.name testArrayStringTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_STRING_TEST_0300
     * @tc.desc Verify push, shift, reverse, join and toString with special string values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<StringDynamicItem> = VALID_VALUES;
      const pushValues: Array<StringDynamicItem> = values.slice();
      const pushResult: number = pushValues.push(values[0]);
      expect(pushResult).assertEqual(values.length + 1);
      expect(pushValues[pushValues.length - 1]).assertEqual(values[0]);

      const shiftValues: Array<StringDynamicItem> = values.slice();
      const shiftResult: StringDynamicItem | undefined = shiftValues.shift();
      expect(shiftResult).assertEqual(values[0]);
      expect(shiftValues[0]).assertEqual(values[1]);

      const reverseValues: Array<StringDynamicItem> = values.slice();
      const reverseResult: Array<StringDynamicItem> = reverseValues.reverse();
      expect(reverseResult[0]).assertEqual(values[values.length - 1]);

      const joined: string = values.join('|');
      expect(joined).assertEqual(
        'test|测试|模板字符串123|中文|a|a\nb|0|NaN|true|null||   |\u200B|\u0000|\t|\r\n|a|' +
        STRING_LONG_VALUE + '|测试😀|' + STRING_SPECIAL_CHARACTERS + '|' + STRING_ASCII_VISIBLE + '|' +
        STRING_SPECIAL_ESCAPES + '|' + STRING_CONTROL_ESCAPES + '|👆|👀|💯|🎅|🀄|🏴|13800138000|' +
        '310101199001011234|test@example.com|<script>alert(1)</script>|https://test.com|2026-03-05|' +
        '138****8000|||\udc04|\ud83d|\udff4');

      const stringResult: string = values.toString();
      expect(stringResult).assertEqual(
        'test,测试,模板字符串123,中文,a,a\nb,0,NaN,true,null,,   ,\u200B,\u0000,\t,\r\n,a,' +
        STRING_LONG_VALUE + ',测试😀,' + STRING_SPECIAL_CHARACTERS + ',' + STRING_ASCII_VISIBLE + ',' +
        STRING_SPECIAL_ESCAPES + ',' + STRING_CONTROL_ESCAPES + ',👆,👀,💯,🎅,🀄,🏴,13800138000,' +
        '310101199001011234,test@example.com,<script>alert(1)</script>,https://test.com,2026-03-05,' +
        '138****8000,,,\udc04,\ud83d,\udff4');
    });

    /**
     * @tc.name testArrayStringTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_STRING_TEST_0400
     * @tc.desc Verify unshift, slice, sort, indexOf, forEach, map and filter with special string values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<StringDynamicItem> = VALID_VALUES;
      const unshiftValues: Array<StringDynamicItem> = values.slice();
      const unshiftResult: number = unshiftValues.unshift(values[0]);
      expect(unshiftResult).assertEqual(values.length + 1);
      expect(unshiftValues[0]).assertEqual(values[0]);

      const sliceResult: Array<StringDynamicItem> = values.slice(0, 2);
      expect(sliceResult[0]).assertEqual(values[0]);
      expect(sliceResult[1]).assertEqual(values[1]);

      const sortValues: Array<StringDynamicItem> = values.slice();
      const sortResult: Array<StringDynamicItem> = sortValues.sort((valueA: StringDynamicItem, valueB: StringDynamicItem): number =>
        String(valueB).length - String(valueA).length,
      );
      expect(String(sortResult[0]).length).assertEqual(STRING_LONG_VALUE.length);
      expect(sortResult[sortResult.length - 2]).assertEqual('');
      expect(sortResult[sortResult.length - 1]).assertEqual(undefined);
      expect(values.indexOf(values[0])).assertEqual(0);

      let forEachLastValue: StringDynamicItem = values[0];
      values.forEach((value: StringDynamicItem): void => {
        forEachLastValue = value;
      });
      expect(forEachLastValue).assertEqual(values[values.length - 1]);

      const mapResult: Array<StringDynamicItem> = values.map(
        (value: StringDynamicItem): StringDynamicItem => value,
      );
      expect(mapResult[1]).assertEqual(values[1]);

      const filterResult: Array<StringDynamicItem> = values.filter(
        (value: StringDynamicItem): boolean => value === values[0],
      );
      expect(filterResult[0]).assertEqual(values[0]);
    });

    /**
     * @tc.name testArrayStringTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_STRING_TEST_0500
     * @tc.desc Verify reduce, at(-1), entries/keys/values and find/includes/findIndex with special string values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<StringDynamicItem> = VALID_VALUES;
      const reduceInitialResult: StringDynamicItem = values.reduce(
        (_acc: StringDynamicItem, value: StringDynamicItem): StringDynamicItem => value,
        values[0],
      );
      expect(reduceInitialResult).assertEqual(values[values.length - 1]);
      expect(runAt(values)).assertEqual(values[values.length - 1]);

      const entriesItem: IteratorResult<[number, StringDynamicItem]> = values.entries().next();
      expect(entriesItem.value[0]).assertEqual(0);
      expect(entriesItem.value[1]).assertEqual(values[0]);

      const keysItem: IteratorResult<number> = values.keys().next();
      expect(keysItem.value).assertEqual(0);

      const valuesItem: IteratorResult<StringDynamicItem> = values.values().next();
      expect(valuesItem.value).assertEqual(values[0]);

      const findResult: StringDynamicItem | undefined = values.find(
        (value: StringDynamicItem): boolean => value === values[0],
      );
      expect(findResult).assertEqual(values[0]);
      expect(values.includes(values[0])).assertTrue();
      expect(values.findIndex((value: StringDynamicItem): boolean => value === values[0])).assertEqual(0);
    });

    /**
     * @tc.name testArrayStringTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_STRING_TEST_0600
     * @tc.desc Verify fill, concat, splice, every, Symbol.iterator and toLocaleString with special string values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<StringDynamicItem> = VALID_VALUES;
      const fillValues: Array<StringDynamicItem> = values.slice();
      const fillResult: Array<StringDynamicItem> = fillValues.fill(values[0], 0, 1);
      expect(fillResult[0]).assertEqual(values[0]);

      const concatResult: Array<StringDynamicItem> = values.concat([values[0]]);
      expect(concatResult[concatResult.length - 1]).assertEqual(values[0]);

      const spliceDeleteValues: Array<StringDynamicItem> = values.slice();
      const removedItems: Array<StringDynamicItem> = spliceDeleteValues.splice(0, 1);
      expect(removedItems[0]).assertEqual(values[0]);
      expect(spliceDeleteValues[0]).assertEqual(values[1]);

      const spliceInsertValues: Array<StringDynamicItem> = values.slice();
      const insertedItems: Array<StringDynamicItem> = spliceInsertValues.splice(0, 0, values[0]);
      expect(insertedItems.length).assertEqual(0);
      expect(spliceInsertValues[0]).assertEqual(values[0]);
      expect(values.every((value: StringDynamicItem): boolean => typeof value === 'string' || value === null || value === undefined)).assertTrue();

      const symbolItem: IteratorResult<StringDynamicItem> = values[Symbol.iterator]().next();
      expect(symbolItem.value).assertEqual(values[0]);

      const localeResult: string = values.toLocaleString();
      const expectedLocaleResult: string = values.map((value: StringDynamicItem): string =>
        value === null || value === undefined ? '' : value.toLocaleString().replace(/\u0000/g, '')).join(',');
      expect(localeResult).assertEqual(expectedLocaleResult);
    });

  });
}













