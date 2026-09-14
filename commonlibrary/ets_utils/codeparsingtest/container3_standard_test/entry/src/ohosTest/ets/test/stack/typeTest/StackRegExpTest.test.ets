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

interface RegExpInvalidObject {
  marker: string;
}

const REGEXP_INVALID_OBJECT: RegExpInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<RegExp> = [
  /abc/gi, /def/m, /^test$/u, new RegExp(''), /测试😀/u, /[ -]/g, /abc/gi,
];

type RegExpInvalidValue = string | number | null | undefined | RegExpInvalidObject | Array<number>;
type RegExpAllValue = RegExp | RegExpInvalidValue;

const ALL_VALUES: Array<RegExpAllValue> = [
  ...VALID_VALUES,
  'abc', 123, null, undefined, REGEXP_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackRegExpTest() {
  describe('StackRegExpTest', () => {
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
     * @tc.name   testStackRegExpTest0100
     * @tc.number SUB_ARKTS_STACK_REGEXP_0100
     * @tc.desc   Verify Stack regexp constructor, push of valid and mixed values, length and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<RegExp> = new Stack<RegExp>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<RegExp> = new Stack<RegExp>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(VALID_VALUES[6]);
      expect(stack.peek().test('ABC')).assertTrue();

      const mixed: Stack<RegExpAllValue> = new Stack<RegExpAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek() === ALL_VALUES[ALL_VALUES.length - 1]).assertTrue();
    });

    /**
     * @tc.name   testStackRegExpTest0200
     * @tc.number SUB_ARKTS_STACK_REGEXP_0200
     * @tc.desc   Verify Stack regexp peek does not remove element and push returns the pushed value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<RegExp> = new Stack<RegExp>();
      stack.push(VALID_VALUES[0]);
      stack.push(VALID_VALUES[1]);
      stack.push(VALID_VALUES[0]);

      expect(stack.peek()).assertEqual(VALID_VALUES[0]);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(VALID_VALUES[0]);
      expect(stack.length).assertEqual(3);

      const pushed: RegExp = stack.push(VALID_VALUES[2]);
      expect(pushed).assertEqual(VALID_VALUES[2]);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(VALID_VALUES[2]);
    });

    /**
     * @tc.name   testStackRegExpTest0300
     * @tc.number SUB_ARKTS_STACK_REGEXP_0300
     * @tc.desc   Verify Stack regexp pop removes elements in LIFO order until empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<RegExp> = new Stack<RegExp>();
      stack.push(VALID_VALUES[0]);
      stack.push(VALID_VALUES[1]);
      stack.push(VALID_VALUES[2]);
      stack.push(VALID_VALUES[3]);

      expect(stack.pop()).assertEqual(VALID_VALUES[3]);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(VALID_VALUES[2]);
      expect(stack.pop()).assertEqual(VALID_VALUES[1]);
      expect(stack.pop()).assertEqual(VALID_VALUES[0]);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(VALID_VALUES[4]);
      expect(stack.peek()).assertEqual(VALID_VALUES[4]);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackRegExpTest0400
     * @tc.number SUB_ARKTS_STACK_REGEXP_0400
     * @tc.desc   Verify Stack regexp locate returns first index of a value and -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<RegExp> = new Stack<RegExp>();
      stack.push(VALID_VALUES[0]);
      stack.push(VALID_VALUES[1]);
      stack.push(VALID_VALUES[0]);

      expect(stack.locate(VALID_VALUES[0])).assertEqual(0);
      expect(stack.locate(VALID_VALUES[1])).assertEqual(1);
      expect(stack.locate(VALID_VALUES[2])).assertEqual(-1);
      expect(stack.locate(/abc/gi)).assertEqual(-1);
    });

    /**
     * @tc.name   testStackRegExpTest0500
     * @tc.number SUB_ARKTS_STACK_REGEXP_0500
     * @tc.desc   Verify Stack regexp forEach callback with index and for-of iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<RegExp> = new Stack<RegExp>();
      stack.push(VALID_VALUES[0]);
      stack.push(VALID_VALUES[2]);
      stack.push(VALID_VALUES[4]);

      const sources: Array<string> = [];
      stack.forEach((value: RegExp) => {
        sources.push(value.source);
      });
      expect(sources.length).assertEqual(3);
      expect(sources[0]).assertEqual('abc');
      expect(sources[2]).assertEqual('测试😀');

      let indexSum: number = 0;
      stack.forEach((value: RegExp, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<RegExp> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(VALID_VALUES[2]);
    });

    /**
     * @tc.name   testStackRegExpTest0600
     * @tc.number SUB_ARKTS_STACK_REGEXP_0600
     * @tc.desc   Verify Stack regexp behavior on empty stack and transition between empty and non-empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<RegExp> = new Stack<RegExp>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(VALID_VALUES[0])).assertEqual(-1);

      stack.push(VALID_VALUES[5]);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(VALID_VALUES[5]);
      expect(stack.peek().test(' ')).assertTrue();
      expect(stack.pop()).assertEqual(VALID_VALUES[5]);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
