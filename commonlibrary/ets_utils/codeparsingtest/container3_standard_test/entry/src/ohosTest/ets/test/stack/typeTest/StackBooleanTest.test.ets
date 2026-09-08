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

interface BooleanInvalidObject {
  marker: string;
}

const BOOLEAN_INVALID_OBJECT: BooleanInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<boolean> = [true, false, true, false];

type BooleanInvalidValue = number | string | null | undefined | BooleanInvalidObject | Array<number>;
type BooleanAllValue = boolean | BooleanInvalidValue;

const ALL_VALUES: Array<BooleanAllValue> = [
  ...VALID_VALUES,
  1, 0, NaN, 'true', 'false', null, undefined, '', BOOLEAN_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackBooleanTest() {
  describe('StackBooleanTest', () => {
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
     * @tc.name   testStackBooleanTest0100
     * @tc.number SUB_ARKTS_STACK_BOOLEAN_0100
     * @tc.desc   Verify Stack boolean push returns the pushed value and updates length and peek for valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<boolean> = new Stack<boolean>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<boolean> = new Stack<boolean>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertFalse();

      const mixed: Stack<BooleanAllValue> = new Stack<BooleanAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        const value: BooleanAllValue = ALL_VALUES[i];
        const returned: BooleanAllValue = mixed.push(value);
        if (typeof value === 'number' && Number.isNaN(value)) {
          expect(Number.isNaN(returned as number)).assertTrue();
        } else {
          expect(returned).assertEqual(value);
        }
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek() === ALL_VALUES[ALL_VALUES.length - 1]).assertTrue();
    });

    /**
     * @tc.name   testStackBooleanTest0200
     * @tc.number SUB_ARKTS_STACK_BOOLEAN_0200
     * @tc.desc   Verify Stack boolean peek does not change length and push updates the top element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<boolean> = new Stack<boolean>();
      stack.push(true);
      stack.push(false);
      stack.push(true);

      expect(stack.peek()).assertTrue();
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertTrue();
      expect(stack.length).assertEqual(3);

      const pushed: boolean = stack.push(false);
      expect(pushed).assertFalse();
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertFalse();
    });

    /**
     * @tc.name   testStackBooleanTest0300
     * @tc.number SUB_ARKTS_STACK_BOOLEAN_0300
     * @tc.desc   Verify Stack boolean pop removes elements in LIFO order until empty and can push again after emptying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<boolean> = new Stack<boolean>();
      stack.push(true);
      stack.push(false);
      stack.push(true);
      stack.push(true);

      expect(stack.pop()).assertTrue();
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertTrue();
      expect(stack.pop()).assertFalse();
      expect(stack.pop()).assertTrue();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(false);
      expect(stack.peek()).assertFalse();
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackBooleanTest0400
     * @tc.number SUB_ARKTS_STACK_BOOLEAN_0400
     * @tc.desc   Verify Stack boolean locate returns the zero-based index of a value from the top and -1 when absent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<boolean> = new Stack<boolean>();
      stack.push(true);
      stack.push(false);
      stack.push(true);
      stack.push(false);

      expect(stack.locate(true)).assertEqual(0);
      expect(stack.locate(false)).assertEqual(1);

      const other: Stack<boolean> = new Stack<boolean>();
      other.push(false);
      expect(stack.locate(true) === other.locate(true)).assertFalse();

      const single: Stack<boolean> = new Stack<boolean>();
      expect(single.locate(false)).assertEqual(-1);
    });

    /**
     * @tc.name   testStackBooleanTest0500
     * @tc.number SUB_ARKTS_STACK_BOOLEAN_0500
     * @tc.desc   Verify Stack boolean forEach traverses values with index and the iterator visits elements in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<boolean> = new Stack<boolean>();
      stack.push(true);
      stack.push(false);
      stack.push(true);

      const visited: Array<boolean> = [];
      stack.forEach((value: boolean) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertTrue();
      expect(visited[1]).assertFalse();

      let indexSum: number = 0;
      stack.forEach((value: boolean, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<boolean> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertTrue();
    });

    /**
     * @tc.name   testStackBooleanTest0600
     * @tc.number SUB_ARKTS_STACK_BOOLEAN_0600
     * @tc.desc   Verify Stack boolean empty-state behaviors where pop, peek and locate return undefined or -1 on an empty stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<boolean> = new Stack<boolean>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(true)).assertEqual(-1);

      stack.push(false);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertFalse();
      expect(stack.pop()).assertFalse();
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
