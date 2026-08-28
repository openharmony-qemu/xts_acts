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

interface NumberInvalidObject {
  marker: string;
}

const NUMBER_INVALID_OBJECT: NumberInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MIN_VALUE, Number.MIN_VALUE - 1, Number.EPSILON,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, -128, 127, -32768, 32767, -2147483648,
  2147483647, -9223372036854775808, 9223372036854775807, -1.40129846432481707e-45,
  1.40129846432481707e-45, -3.4028234663852886e38, 3.4028234663852886e38, 65535,
  -1, 999999.99, 13800138000, 123456, -100.5,
];

type NumberInvalidValue = string | null | undefined | NumberInvalidObject | Array<number> | boolean | bigint;
type NumberAllValue = number | NumberInvalidValue;

const ALL_VALUES: Array<NumberAllValue> = [
  ...VALID_VALUES,
  '123', '0x12', null, undefined, NUMBER_INVALID_OBJECT, [], true,
  BigInt('16045690984833335006'), BigInt('9007199254740991'),
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackNumberTest() {
  describe('StackNumberTest', () => {
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
     * @tc.name   testStackNumberTest0100
     * @tc.number SUB_ARKTS_STACK_NUMBER_0100
     * @tc.desc   Verify Stack number constructor, isEmpty, push return values, length and peek including mixed-type values with bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<number> = new Stack<number>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<number> = new Stack<number>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        const value: number = VALID_VALUES[i];
        const returned: number = stack.push(value);
        if (Number.isNaN(value)) {
          expect(Number.isNaN(returned)).assertTrue();
        } else {
          expect(returned).assertEqual(value);
        }
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(VALID_VALUES[VALID_VALUES.length - 1]);
      expect(stack.isEmpty()).assertFalse();

      const mixed: Stack<NumberAllValue> = new Stack<NumberAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        const value: NumberAllValue = ALL_VALUES[i];
        const returned: NumberAllValue = mixed.push(value);
        if (typeof value === 'number' && Number.isNaN(value)) {
          expect(Number.isNaN(returned as number)).assertTrue();
        } else {
          expect(returned).assertEqual(value);
        }
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek()).assertEqual(BigInt('9007199254740991'));
    });

    /**
     * @tc.name   testStackNumberTest0200
     * @tc.number SUB_ARKTS_STACK_NUMBER_0200
     * @tc.desc   Verify Stack number peek does not remove the top element and push returns the pushed value and updates length with duplicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<number> = new Stack<number>();
      stack.push(2);
      expect(stack.length).assertEqual(1);
      stack.push(4);
      stack.push(5);
      stack.push(2);
      stack.push(4);

      expect(stack.peek()).assertEqual(4);
      expect(stack.length).assertEqual(5);
      expect(stack.peek()).assertEqual(4);
      expect(stack.length).assertEqual(5);

      const pushed: number = stack.push(88);
      expect(pushed).assertEqual(88);
      expect(stack.length).assertEqual(6);
      expect(stack.peek()).assertEqual(88);

      stack.push(88);
      expect(stack.length).assertEqual(7);
      expect(stack.peek()).assertEqual(88);
    });

    /**
     * @tc.name   testStackNumberTest0300
     * @tc.number SUB_ARKTS_STACK_NUMBER_0300
     * @tc.desc   Verify Stack number pop removes elements in LIFO order until empty, then supports pushing and popping again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<number> = new Stack<number>();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      stack.push(4);

      expect(stack.pop()).assertEqual(4);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(5);
      expect(stack.length).assertEqual(2);
      expect(stack.pop()).assertEqual(4);
      expect(stack.pop()).assertEqual(2);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(7);
      stack.push(8);
      expect(stack.pop()).assertEqual(8);
      expect(stack.peek()).assertEqual(7);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackNumberTest0400
     * @tc.number SUB_ARKTS_STACK_NUMBER_0400
     * @tc.desc   Verify Stack number locate returns the topmost position for existing values, NaN and duplicates, and -1 for absent values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<number> = new Stack<number>();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      stack.push(2);

      expect(stack.locate(2)).assertEqual(0);
      expect(stack.locate(4)).assertEqual(1);
      expect(stack.locate(5)).assertEqual(2);
      expect(stack.locate(999)).assertEqual(-1);

      const nanStack: Stack<number> = new Stack<number>();
      nanStack.push(1);
      nanStack.push(NaN);
      expect(nanStack.locate(NaN)).assertEqual(1);

      const dupStack: Stack<number> = new Stack<number>();
      dupStack.push(8);
      dupStack.push(8);
      expect(dupStack.locate(8)).assertEqual(0);
    });

    /**
     * @tc.name   testStackNumberTest0500
     * @tc.number SUB_ARKTS_STACK_NUMBER_0500
     * @tc.desc   Verify Stack number forEach callback values and indexes, Symbol.iterator traversal and for-of summation in insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<number> = new Stack<number>();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      stack.push(4);

      const visited: Array<number> = [];
      stack.forEach((value: number) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(2);
      expect(visited[2]).assertEqual(5);
      expect(visited[3]).assertEqual(4);

      let indexSum: number = 0;
      stack.forEach((value: number, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(6);

      const iterValues: Array<number> = [];
      const iter = stack[Symbol.iterator]();
      let temp: IteratorResult<number> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(4);
      expect(iterValues[0]).assertEqual(2);
      expect(iterValues[3]).assertEqual(4);

      let forOfSum: number = 0;
      for (const value of stack) {
        forOfSum += value;
      }
      expect(forOfSum).assertEqual(15);
    });

    /**
     * @tc.name   testStackNumberTest0600
     * @tc.number SUB_ARKTS_STACK_NUMBER_0600
     * @tc.desc   Verify Stack number boundary behavior when empty including pop, peek, locate and empty iterator, and after pushing and popping one element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<number> = new Stack<number>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.length).assertEqual(0);
      expect(stack.pop()).assertUndefined();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(1)).assertEqual(-1);

      const emptyIter = stack[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      stack.push(9);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(9);
      expect(stack.pop()).assertEqual(9);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
