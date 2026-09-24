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
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { ArrayList } from '@kit.ArkTS';

interface StringInvalidObject {
  marker: string;
}

const STRING_INVALID_OBJECT: StringInvalidObject = { marker: 'invalid' };

type StringDynamicItem = string | null | undefined;

const STRING_SPECIAL_CHARACTERS: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
const STRING_ASCII_VISIBLE: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
const STRING_SPECIAL_ESCAPES: string = "\\a \\b \\f \\n \\r \\t \\v \\\\ \\' \\\" \\? \\0 \\ddd \\xhh";
const STRING_CONTROL_ESCAPES: string = '\u0007\b\f\n\r\t\u000B\u0000';
const STRING_LONG_VALUE: string = 'a'.repeat(100000);

const VALID_VALUES: Array<StringDynamicItem> = [
  'test', '测试', `模板字符串${123}`, '中文', '\x61', 'a\nb', '0', 'NaN', 'true', 'null',
  '', '   ', '​', '\u0000', '\t', '\r\n', 'a', STRING_LONG_VALUE, '测试😀', STRING_SPECIAL_CHARACTERS,
  STRING_ASCII_VISIBLE, STRING_SPECIAL_ESCAPES, STRING_CONTROL_ESCAPES, '👆', '👀', '💯',
  '🎅', '🀄', '🏴', '13800138000', '310101199001011234',
  'test@example.com', '<script>alert(1)</script>', 'https://test.com', '2026-03-05', '138****8000',
  null, undefined, '\udc04', '\ud83d', '\udff4',
];

type StringAllValue = StringDynamicItem | number | bigint | boolean | StringInvalidObject | Array<number>;

const ALL_VALUES: Array<StringAllValue> = [
  ...VALID_VALUES,
  123, 0n, STRING_INVALID_OBJECT, [], false,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function arrayListStringTest() {
  describe('ArrayListStringTest', () => {
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
     * @tc.name   testArrayListStringTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_STRING_0100
     * @tc.desc   Verify ArrayList string constructor and add with special, unicode, null and mixed string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual('test');
      expect(list[10]).assertEqual('');

      const mixed: ArrayList<StringAllValue> = new ArrayList<StringAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual('test');

      list.clear();
      expect(list.length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayListStringTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_STRING_0200
     * @tc.desc   Verify ArrayList string has, getIndexOf, getLastIndexOf, insert and remove behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      list.add('b');
      list.add('a');
      list.add('c');
      list.add('a');

      expect(list.has('a')).assertTrue();
      expect(list.has('zzz')).assertFalse();
      expect(list.has('')).assertFalse();
      expect(list.getIndexOf('a')).assertEqual(1);
      expect(list.getLastIndexOf('a')).assertEqual(3);
      expect(list.getIndexOf('zzz')).assertEqual(-1);
      expect(list[2]).assertEqual('c');

      list.insert('A', 0);
      expect(list[0]).assertEqual('A');
      expect(list.length).assertEqual(5);
      list.insert('Z', list.length);
      expect(list[list.length - 1]).assertEqual('Z');
      expect(list.length).assertEqual(6);

      expect(list.remove('a')).assertTrue();
      expect(list.getIndexOf('a')).assertEqual(3);
      expect(list.remove('nope')).assertFalse();
    });

    /**
     * @tc.name   testArrayListStringTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_STRING_0300
     * @tc.desc   Verify ArrayList string removeByIndex, removeByRange, subArrayList, clone and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      list.add('a');
      list.add('b');
      list.add('c');
      list.add('d');

      const removed: StringDynamicItem = list.removeByIndex(1);
      expect(removed).assertEqual('b');
      expect(list.length).assertEqual(3);
      expect(list[1]).assertEqual('c');

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual('d');

      const src: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      src.add('1');
      src.add('2');
      src.add('3');
      src.add('4');
      const sub: ArrayList<StringDynamicItem> = src.subArrayList(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual('2');
      expect(sub[1]).assertEqual('3');
      expect(src.length).assertEqual(4);

      const cloned: ArrayList<StringDynamicItem> = src.clone();
      expect(cloned.length).assertEqual(4);
      cloned.add('5');
      expect(src.length).assertEqual(4);

      const arr: Array<StringDynamicItem> = src.convertToArray();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('1');
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.name   testArrayListStringTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_STRING_0400
     * @tc.desc   Verify ArrayList string replaceAllElements, forEach, Symbol.iterator and for-of traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      list.add('a');
      list.add('b');
      list.add('c');

      list.replaceAllElements((value: StringDynamicItem): StringDynamicItem => {
        return value + '!';
      });
      expect(list[0]).assertEqual('a!');
      expect(list[2]).assertEqual('c!');

      const visited: Array<StringDynamicItem> = [];
      list.forEach((value: StringDynamicItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual('a!');
      expect(visited[2]).assertEqual('c!');

      const iterValues: Array<StringDynamicItem> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<StringDynamicItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual('b!');

      let concat: string = '';
      for (const value of list) {
        concat += value;
      }
      expect(concat).assertEqual('a!b!c!');
    });

    /**
     * @tc.name   testArrayListStringTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_STRING_0500
     * @tc.desc   Verify ArrayList string sort with localeCompare, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      list.add('banana');
      list.add('apple');
      list.add('cherry');

      list.sort((a: StringDynamicItem, b: StringDynamicItem): number => {
        return String(a).localeCompare(String(b));
      });
      expect(list[0]).assertEqual('apple');
      expect(list[2]).assertEqual('cherry');

      list.sort((a: StringDynamicItem, b: StringDynamicItem): number => {
        return String(b).localeCompare(String(a));
      });
      expect(list[0]).assertEqual('cherry');
      expect(list[2]).assertEqual('apple');

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(20);
      expect(list.getCapacity() >= 20).assertTrue();
      list.add('date');
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
      expect(list[3]).assertEqual('date');
    });

    /**
     * @tc.name   testArrayListStringTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_STRING_0600
     * @tc.desc   Verify ArrayList string boundary access, out-of-range insert, removeByIndex and subArrayList throwing, null and undefined lookup, clear and empty iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      list.add('x');
      list.add('y');
      let accessThrew: boolean = false;
      try {
        const beyond: StringDynamicItem = list[2];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(accessThrew || list.length === 2).assertTrue();
      expect(list.length).assertEqual(2);

      let insertThrew: boolean = false;
      try {
        list.insert('out', 99);
      } catch (e) {
        insertThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(insertThrew).assertTrue();
      expect(list.has('out')).assertFalse();
      expect(list.length).assertEqual(2);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(2);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(2);

      let subThrew: boolean = false;
      try {
        list.subArrayList(1, 0);
      } catch (e) {
        subThrew = true;
      }
      expect(subThrew).assertTrue();

      const nullList: ArrayList<StringDynamicItem> = new ArrayList<StringDynamicItem>();
      nullList.add(null);
      nullList.add(undefined);
      expect(nullList.has(null)).assertTrue();
      expect(nullList.has(undefined)).assertTrue();
      expect(nullList.getIndexOf(null)).assertEqual(0);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();
    });
  });
}
