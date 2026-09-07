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
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { List } from '@kit.ArkTS';

interface StringInvalidObject {
  marker: string;
}

const STRING_INVALID_OBJECT: StringInvalidObject = { marker: 'invalid' };

type StringDynamicItem = string | null | undefined;

const STRING_SPECIAL_CHARACTERS: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
const STRING_ASCII_VISIBLE: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
const STRING_SPECIAL_ESCAPES: string = "\\a \\b \\f \\n \\r \\t \\v \\\\ \\' \\\" \\? \\0 \\ddd \\xhh";
const STRING_CONTROL_ESCAPES: string = '\b\f\n\r\t ';
const STRING_LONG_VALUE: string = 'a'.repeat(100000);

const VALID_VALUES: Array<StringDynamicItem> = [
  'test', '测试', `模板字符串${123}`, '中文', '\x61', 'a\nb', '0', 'NaN', 'true', 'null',
  '', '   ', '​', ' ', '\t', '\r\n', 'a', STRING_LONG_VALUE, '测试😀', STRING_SPECIAL_CHARACTERS,
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

export default function listStringTest() {
  describe('ListStringTest', () => {
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
     * @tc.name   testListStringTest0100
     * @tc.number SUB_ARKTS_LIST_STRING_0100
     * @tc.desc   Verify List string constructor, add, length, get, getFirst, getLast and clear with special and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<StringDynamicItem> = new List<StringDynamicItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<StringDynamicItem> = new List<StringDynamicItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual('test');
      expect(list.get(10)).assertEqual('');
      expect(list[0]).assertEqual('test');
      expect(list.getFirst()).assertEqual('test');
      expect(list.getLast()).assertEqual('\udff4');

      const mixed: List<StringAllValue> = new List<StringAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual('test');

      list.clear();
      expect(list.length).assertEqual(0);
    });

    /**
     * @tc.name   testListStringTest0200
     * @tc.number SUB_ARKTS_LIST_STRING_0200
     * @tc.desc   Verify List string has, getIndexOf, getLastIndexOf, insert, remove and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<StringDynamicItem> = new List<StringDynamicItem>();
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
      expect(list.get(2)).assertEqual('c');
      expect(list[2]).assertEqual('c');

      list.insert('A', 0);
      expect(list.get(0)).assertEqual('A');
      expect(list.length).assertEqual(5);
      list.insert('Z', list.length);
      expect(list.get(list.length - 1)).assertEqual('Z');
      expect(list.length).assertEqual(6);

      expect(list.remove('a')).assertTrue();
      expect(list.getIndexOf('a')).assertEqual(3);
      expect(list.remove('nope')).assertFalse();

      const same: List<StringDynamicItem> = new List<StringDynamicItem>();
      same.add('A');
      same.add('b');
      same.add('c');
      same.add('a');
      same.add('Z');
      expect(list.equal(same)).assertTrue();
      same.add('Q');
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListStringTest0300
     * @tc.number SUB_ARKTS_LIST_STRING_0300
     * @tc.desc   Verify List string removeByIndex, remove, getSubList independence and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<StringDynamicItem> = new List<StringDynamicItem>();
      list.add('a');
      list.add('b');
      list.add('c');
      list.add('d');

      const removed: StringDynamicItem = list.removeByIndex(1);
      expect(removed).assertEqual('b');
      expect(list.length).assertEqual(3);
      expect(list.get(1)).assertEqual('c');

      expect(list.remove('d')).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<StringDynamicItem> = new List<StringDynamicItem>();
      src.add('1');
      src.add('2');
      src.add('3');
      src.add('4');
      const sub: List<StringDynamicItem> = src.getSubList(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.get(0)).assertEqual('2');
      expect(sub.get(1)).assertEqual('3');
      expect(src.length).assertEqual(4);
      sub.add('5');
      expect(src.length).assertEqual(4);

      const arr: Array<StringDynamicItem> = src.convertToArray();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('1');
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.name   testListStringTest0400
     * @tc.number SUB_ARKTS_LIST_STRING_0400
     * @tc.desc   Verify List string set, replaceAllElements, forEach, Symbol.iterator and for-of traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<StringDynamicItem> = new List<StringDynamicItem>();
      list.add('a');
      list.add('b');
      list.add('c');

      const old: StringDynamicItem = list.set(1, 'B');
      expect(old).assertEqual('B');
      expect(list.get(1)).assertEqual('B');
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: StringDynamicItem): StringDynamicItem => {
        return value + '!';
      });
      expect(list.get(0)).assertEqual('a!');
      expect(list.get(2)).assertEqual('c!');

      const visited: Array<StringDynamicItem> = [];
      list.forEach((value: StringDynamicItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual('a!');
      expect(visited[2]).assertEqual('c!');

      let indexSum: number = 0;
      list.forEach((value: StringDynamicItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<StringDynamicItem> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<StringDynamicItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual('B!');

      let concat: string = '';
      for (const value of list) {
        concat += value;
      }
      expect(concat).assertEqual('a!B!c!');
    });

    /**
     * @tc.name   testListStringTest0500
     * @tc.number SUB_ARKTS_LIST_STRING_0500
     * @tc.desc   Verify List string ascending and descending localeCompare sort plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<StringDynamicItem> = new List<StringDynamicItem>();
      list.add('banana');
      list.add('apple');
      list.add('cherry');

      list.sort((a: StringDynamicItem, b: StringDynamicItem): number => {
        return String(a).localeCompare(String(b));
      });
      expect(list.get(0)).assertEqual('apple');
      expect(list.get(2)).assertEqual('cherry');

      list.sort((a: StringDynamicItem, b: StringDynamicItem): number => {
        return String(b).localeCompare(String(a));
      });
      expect(list.get(0)).assertEqual('cherry');
      expect(list.get(2)).assertEqual('apple');

      expect(list.getFirst()).assertEqual('cherry');
      expect(list.getLast()).assertEqual('apple');
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListStringTest0600
     * @tc.number SUB_ARKTS_LIST_STRING_0600
     * @tc.desc   Verify List string out-of-bounds get/insert/getSubList behavior, null/undefined lookup, clear and empty iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<StringDynamicItem> = new List<StringDynamicItem>();
      list.add('x');
      list.add('y');
      expect(list.get(2)).assertUndefined();
      expect(list[2]).assertUndefined();

      let insertThrew: boolean = false;
      try {
        list.insert('out', 99);
      } catch (e) {
        insertThrew = true;
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
        list.getSubList(1, 0);
      } catch (e) {
        subThrew = true;
      }
      expect(subThrew).assertTrue();

      const nullList: List<StringDynamicItem> = new List<StringDynamicItem>();
      nullList.add(null);
      nullList.add(undefined);
      expect(nullList.has(null)).assertTrue();
      expect(nullList.has(undefined)).assertTrue();
      expect(nullList.getIndexOf(null)).assertEqual(0);

      const empty: List<StringDynamicItem> = new List<StringDynamicItem>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();
    });
  });
}
