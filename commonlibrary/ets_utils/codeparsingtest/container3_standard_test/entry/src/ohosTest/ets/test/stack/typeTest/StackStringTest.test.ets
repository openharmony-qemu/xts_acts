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
import { Stack } from '@kit.ArkTS';

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

export default function stackStringTest() {
  describe('StackStringTest', () => {
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
     * @tc.name   testStackStringTest0100
     * @tc.number SUB_ARKTS_STACK_STRING_0100
     * @tc.desc   Verify Stack string constructor, push of special and mixed values, length and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(VALID_VALUES[VALID_VALUES.length - 1]);

      const mixed: Stack<StringAllValue> = new Stack<StringAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek()).assertFalse();
    });

    /**
     * @tc.name   testStackStringTest0200
     * @tc.number SUB_ARKTS_STACK_STRING_0200
     * @tc.desc   Verify Stack string peek does not remove element and push returns the pushed value including duplicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      stack.push('b');
      stack.push('a');
      stack.push('c');
      stack.push('a');

      expect(stack.peek()).assertEqual('a');
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual('a');
      expect(stack.length).assertEqual(4);

      const pushed: StringDynamicItem = stack.push('Z');
      expect(pushed).assertEqual('Z');
      expect(stack.length).assertEqual(5);
      expect(stack.peek()).assertEqual('Z');

      stack.push('Z');
      expect(stack.length).assertEqual(6);
      expect(stack.peek()).assertEqual('Z');
    });

    /**
     * @tc.name   testStackStringTest0300
     * @tc.number SUB_ARKTS_STACK_STRING_0300
     * @tc.desc   Verify Stack string pop removes elements in LIFO order until empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      stack.push('a');
      stack.push('b');
      stack.push('c');
      stack.push('d');

      expect(stack.pop()).assertEqual('d');
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual('c');
      expect(stack.pop()).assertEqual('b');
      expect(stack.pop()).assertEqual('a');
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push('x');
      expect(stack.peek()).assertEqual('x');
      expect(stack.length).assertEqual(1);
      expect(stack.pop()).assertEqual('x');
    });

    /**
     * @tc.name   testStackStringTest0400
     * @tc.number SUB_ARKTS_STACK_STRING_0400
     * @tc.desc   Verify Stack string locate returns first index of a value and -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      stack.push('a');
      stack.push('b');
      stack.push('a');
      stack.push('c');

      expect(stack.locate('a')).assertEqual(0);
      expect(stack.locate('b')).assertEqual(1);
      expect(stack.locate('c')).assertEqual(3);
      expect(stack.locate('zzz')).assertEqual(-1);
      expect(stack.locate('')).assertEqual(-1);

      const dupStack: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      dupStack.push('d');
      dupStack.push('d');
      expect(dupStack.locate('d')).assertEqual(0);
    });

    /**
     * @tc.name   testStackStringTest0500
     * @tc.number SUB_ARKTS_STACK_STRING_0500
     * @tc.desc   Verify Stack string forEach with index, Symbol.iterator manual iteration and for-of concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      stack.push('a');
      stack.push('b');
      stack.push('c');

      const visited: Array<StringDynamicItem> = [];
      stack.forEach((value: StringDynamicItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual('a');
      expect(visited[2]).assertEqual('c');

      let indexSum: number = 0;
      stack.forEach((value: StringDynamicItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<StringDynamicItem> = [];
      const iter = stack[Symbol.iterator]();
      let temp: IteratorResult<StringDynamicItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual('b');

      let concat: string = '';
      for (const value of stack) {
        concat += value;
      }
      expect(concat).assertEqual('abc');
    });

    /**
     * @tc.name   testStackStringTest0600
     * @tc.number SUB_ARKTS_STACK_STRING_0600
     * @tc.desc   Verify Stack string behavior on empty stack, locate of null/undefined, and empty/non-empty transition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate('a')).assertEqual(-1);

      const nullStack: Stack<StringDynamicItem> = new Stack<StringDynamicItem>();
      nullStack.push(null);
      nullStack.push(undefined);
      expect(nullStack.locate(null)).assertEqual(0);
      expect(nullStack.locate(undefined)).assertEqual(1);

      stack.push('r');
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual('r');
      expect(stack.pop()).assertEqual('r');
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
