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
import { Deque } from '@kit.ArkTS';

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

export default function dequeStringTest() {
  describe('DequeStringTest', () => {
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
     * @tc.name   testDequeStringTest0100
     * @tc.number SUB_ARKTS_DEQUE_STRING_0100
     * @tc.desc   Verify Deque string construction, insertEnd of valid/invalid string values, length, indexed access, getFirst and getLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      expect(empty.length).assertEqual(0);

      const list: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual('test');
      expect(list[10]).assertEqual('');
      expect(list.getFirst()).assertEqual('test');
      expect(list.getLast()).assertEqual('\udff4');

      const mixed: Deque<StringAllValue> = new Deque<StringAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual('test');
      expect(mixed[ALL_VALUES.length - 1]).assertFalse();
    });

    /**
     * @tc.name   testDequeStringTest0200
     * @tc.number SUB_ARKTS_DEQUE_STRING_0200
     * @tc.desc   Verify insertFront and insertEnd ordering, length updates, boundary elements, and has() lookups including single-element deque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      list.insertEnd('b');
      list.insertEnd('a');
      list.insertFront('c');
      list.insertFront('a');

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual('a');
      expect(list.getFirst()).assertEqual('a');
      expect(list.getLast()).assertEqual('a');
      expect(list.has('a')).assertTrue();
      expect(list.has('zzz')).assertFalse();
      expect(list.has('')).assertFalse();
      expect(list.has(null)).assertFalse();

      list.insertFront('A');
      expect(list[0]).assertEqual('A');
      expect(list.length).assertEqual(5);
      list.insertEnd('Z');
      expect(list[list.length - 1]).assertEqual('Z');
      expect(list.length).assertEqual(6);

      const single: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      single.insertFront('only');
      expect(single.getFirst()).assertEqual('only');
      expect(single.getLast()).assertEqual('only');
    });

    /**
     * @tc.name   testDequeStringTest0300
     * @tc.number SUB_ARKTS_DEQUE_STRING_0300
     * @tc.desc   Verify popFirst and popLast return the correct end elements and update length, including single-element deque behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      list.insertEnd('a');
      list.insertEnd('b');
      list.insertEnd('c');
      list.insertEnd('d');

      const first: StringDynamicItem = list.popFirst();
      expect(first).assertEqual('a');
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual('b');

      const last: StringDynamicItem = list.popLast();
      expect(last).assertEqual('d');
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual('c');

      const single: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      single.insertEnd('x');
      expect(single.popFirst()).assertEqual('x');
      expect(single.length).assertEqual(0);

      single.insertEnd('y');
      expect(single.popLast()).assertEqual('y');
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeStringTest0400
     * @tc.number SUB_ARKTS_DEQUE_STRING_0400
     * @tc.desc   Verify forEach callback with values and indexes, Symbol.iterator traversal, and for-of iteration over string deque elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      list.insertEnd('a');
      list.insertEnd('b');
      list.insertEnd('c');

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
      expect(iterValues[1]).assertEqual('b');

      let concat: string = '';
      for (const value of list) {
        concat += value;
      }
      expect(concat).assertEqual('abc');
    });

    /**
     * @tc.name   testDequeStringTest0500
     * @tc.number SUB_ARKTS_DEQUE_STRING_0500
     * @tc.desc   Verify indexed access at valid, last, out-of-range positions returns values or undefined, and that null/undefined elements are stored and found by has().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      list.insertEnd('banana');
      list.insertEnd('apple');
      list.insertEnd('cherry');
      list.insertFront('avocado');

      expect(list[0]).assertEqual('avocado');
      expect(list[1]).assertEqual('banana');
      expect(list[3]).assertEqual('cherry');
      expect(list[list.length - 1]).assertEqual('cherry');
      let oobThrew: boolean = false;
      try {
        const oob: StringDynamicItem | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: StringDynamicItem | undefined = list[99];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();

      const nullDeque: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      nullDeque.insertEnd(null);
      nullDeque.insertEnd(undefined);
      expect(nullDeque.length).assertEqual(2);
      expect(nullDeque.has(null)).assertTrue();
      expect(nullDeque.has(undefined)).assertTrue();
      expect(nullDeque[0]).assertNull();
    });

    /**
     * @tc.name   testDequeStringTest0600
     * @tc.number SUB_ARKTS_DEQUE_STRING_0600
     * @tc.desc   Verify out-of-bounds index access returns undefined, popLast on empty deque throws, and emptied deque yields empty iteration and forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      list.insertEnd('x');
      list.insertEnd('y');
      let t2: boolean = false;
      try {
        const v2: StringDynamicItem | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: StringDynamicItem | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<StringDynamicItem> = new Deque<StringDynamicItem>();
      const popped: StringDynamicItem | undefined = empty.popLast();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popLast();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: StringDynamicItem | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: StringDynamicItem) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
