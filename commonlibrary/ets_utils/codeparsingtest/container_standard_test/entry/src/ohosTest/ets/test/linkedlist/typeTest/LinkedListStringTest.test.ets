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
import { LinkedList } from '@kit.ArkTS';

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
  null, undefined, '', '😀', '󿿤',
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

export default function linkedListStringTest() {
  describe('LinkedListStringTest', () => {
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
     * @tc.name   testLinkedListStringTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_STRING_0100
     * @tc.desc   Verify LinkedList string constructor length, add, get and clear with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual('test');
      expect(list.get(10)).assertEqual('');

      const mixed: LinkedList<StringAllValue> = new LinkedList<StringAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual('test');

      list.clear();
      expect(list.length).assertEqual(0);
    });

    /**
     * @tc.name   testLinkedListStringTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_STRING_0200
     * @tc.desc   Verify LinkedList string addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      list.add('b');
      list.add('a');
      list.add('c');
      list.add('a');

      list.addFirst('A');
      expect(list.get(0)).assertEqual('A');
      expect(list.length).assertEqual(5);

      expect(list.has('a')).assertTrue();
      expect(list.has('zzz')).assertFalse();
      expect(list.has('')).assertFalse();
      expect(list.getIndexOf('a')).assertEqual(2);
      expect(list.getLastIndexOf('a')).assertEqual(4);
      expect(list.getIndexOf('zzz')).assertEqual(-1);
      expect(list.get(3)).assertEqual('c');

      list.insert(0, 'S');
      expect(list.get(0)).assertEqual('S');
      expect(list.length).assertEqual(6);
      list.insert(list.length, 'Z');
      expect(list.get(list.length - 1)).assertEqual('Z');
      expect(list.length).assertEqual(7);
    });

    /**
     * @tc.name   testLinkedListStringTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_STRING_0300
     * @tc.desc   Verify LinkedList string removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      list.add('a');
      list.add('b');
      list.add('c');
      list.add('d');
      list.add('e');

      const removed: StringDynamicItem = list.removeByIndex(1);
      expect(removed).assertEqual('b');
      expect(list.length).assertEqual(4);
      expect(list.get(1)).assertEqual('c');

      expect(list.remove('d')).assertTrue();
      expect(list.getIndexOf('d')).assertEqual(-1);
      expect(list.remove('nope')).assertFalse();

      const first: StringDynamicItem = list.removeFirst();
      expect(first).assertEqual('a');
      expect(list.length).assertEqual(2);

      const last: StringDynamicItem = list.removeLast();
      expect(last).assertEqual('e');
      expect(list.length).assertEqual(1);

      const dupList: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      dupList.add('x');
      dupList.add('y');
      dupList.add('x');
      dupList.add('x');
      expect(dupList.removeFirstFound('x')).assertTrue();
      expect(dupList.get(0)).assertEqual('y');
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound('x')).assertTrue();
      expect(dupList.getLastIndexOf('x')).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListStringTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_STRING_0400
     * @tc.desc   Verify LinkedList string set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      list.add('a');
      list.add('b');
      list.add('c');

      const old: StringDynamicItem = list.set(1, 'B');
      expect(old).assertEqual('B');
      expect(list.get(1)).assertEqual('B');
      expect(list.length).assertEqual(3);

      const cloned: LinkedList<StringDynamicItem> = list.clone();
      expect(cloned.length).assertEqual(3);
      cloned.add('5');
      expect(list.length).assertEqual(3);

      const arr: Array<StringDynamicItem> = list.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
      expect(arr instanceof Array).assertTrue();

      const visited: Array<StringDynamicItem> = [];
      list.forEach((value: StringDynamicItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual('a');
      expect(visited[2]).assertEqual('c');

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
      expect(iterValues[1]).assertEqual('B');

      let concat: string = '';
      for (const value of list) {
        concat += value;
      }
      expect(concat).assertEqual('aBc');
    });

    /**
     * @tc.name   testLinkedListStringTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_STRING_0500
     * @tc.desc   Verify LinkedList string getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      list.add('banana');
      list.add('apple');
      list.add('cherry');

      expect(list.getFirst()).assertEqual('banana');
      expect(list.getLast()).assertEqual('cherry');
      expect(list.get(0)).assertEqual('banana');
      expect(list.get(list.length - 1)).assertEqual('cherry');
      expect(list.get(1)).assertEqual('apple');

      const single: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      single.add('only');
      expect(single.getFirst()).assertEqual('only');
      expect(single.getLast()).assertEqual('only');

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(99)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListStringTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_STRING_0600
     * @tc.desc   Verify LinkedList string insert out-of-bounds no-op, removeByIndex exception on invalid index, nullish element lookup and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      list.add('x');
      list.add('y');

      let insertThrew: boolean = false;
      try {
        list.insert(99, 'out');
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

      let foundThrew: boolean = false;
      try {
        list.removeFirstFound('missing');
      } catch (e) {
        foundThrew = true;
      }
      expect(foundThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const nullList: LinkedList<StringDynamicItem> = new LinkedList<StringDynamicItem>();
      nullList.add(null);
      nullList.add(undefined);
      expect(nullList.has(null)).assertTrue();
      expect(nullList.has(undefined)).assertTrue();
      expect(nullList.getIndexOf(null)).assertEqual(0);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.getFirst()).assertUndefined();
      expect(list.getLast()).assertUndefined();
      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();
    });
  });
}
