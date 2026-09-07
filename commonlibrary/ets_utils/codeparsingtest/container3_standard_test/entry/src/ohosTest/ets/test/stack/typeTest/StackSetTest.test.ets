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

interface SetInvalidObject {
  marker: string;
}

const SET_INVALID_OBJECT: SetInvalidObject = { marker: 'invalid' };

const SET_A: Set<number> = new Set<number>([1]);
const SET_B: Set<number> = new Set<number>([2]);
const SET_C: Set<number> = new Set<number>([3]);
const SET_D: Set<number> = new Set<number>([0, -1]);
const SET_E: Set<number> = new Set<number>([NaN, Infinity]);
const SET_F: Set<number> = new Set<number>([Number.MAX_SAFE_INTEGER]);
const SET_G: Set<number> = new Set<number>();

const VALID_VALUES: Array<Set<number>> = [SET_A, SET_B, SET_C, SET_D, SET_E, SET_F, SET_G, SET_A];

type SetInvalidValue = string | number | null | undefined | SetInvalidObject | Array<number>;
type SetAllValue = Set<number> | SetInvalidValue;

const ALL_VALUES: Array<SetAllValue> = [
  ...VALID_VALUES,
  '1', 123, null, undefined, SET_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackSetTest() {
  describe('StackSetTest', () => {
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
     * @tc.name   testStackSetTest0100
     * @tc.number SUB_ARKTS_STACK_SET_0100
     * @tc.desc   Verify Stack set constructor, push of valid and mixed values, length and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<Set<number>> = new Stack<Set<number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<Set<number>> = new Stack<Set<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(SET_A);
      expect(stack.peek().has(1)).assertTrue();

      const mixed: Stack<SetAllValue> = new Stack<SetAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek() === ALL_VALUES[ALL_VALUES.length - 1]).assertTrue();
    });

    /**
     * @tc.name   testStackSetTest0200
     * @tc.number SUB_ARKTS_STACK_SET_0200
     * @tc.desc   Verify Stack set peek does not remove element and push returns the pushed value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Set<number>> = new Stack<Set<number>>();
      stack.push(SET_A);
      stack.push(SET_B);
      stack.push(SET_A);

      expect(stack.peek()).assertEqual(SET_A);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(SET_A);
      expect(stack.length).assertEqual(3);

      const pushed: Set<number> = stack.push(SET_C);
      expect(pushed).assertEqual(SET_C);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(SET_C);
    });

    /**
     * @tc.name   testStackSetTest0300
     * @tc.number SUB_ARKTS_STACK_SET_0300
     * @tc.desc   Verify Stack set pop removes elements in LIFO order until empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Set<number>> = new Stack<Set<number>>();
      stack.push(SET_A);
      stack.push(SET_B);
      stack.push(SET_C);
      stack.push(SET_D);

      expect(stack.pop()).assertEqual(SET_D);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(SET_C);
      expect(stack.pop()).assertEqual(SET_B);
      expect(stack.pop()).assertEqual(SET_A);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(SET_E);
      expect(stack.peek()).assertEqual(SET_E);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackSetTest0400
     * @tc.number SUB_ARKTS_STACK_SET_0400
     * @tc.desc   Verify Stack set locate returns first index of a value and -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Set<number>> = new Stack<Set<number>>();
      stack.push(SET_A);
      stack.push(SET_B);
      stack.push(SET_A);

      expect(stack.locate(SET_A)).assertEqual(0);
      expect(stack.locate(SET_B)).assertEqual(1);
      expect(stack.locate(SET_C)).assertEqual(-1);
      expect(stack.locate(SET_G)).assertEqual(-1);
    });

    /**
     * @tc.name   testStackSetTest0500
     * @tc.number SUB_ARKTS_STACK_SET_0500
     * @tc.desc   Verify Stack set forEach callback with index and for-of iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Set<number>> = new Stack<Set<number>>();
      stack.push(SET_A);
      stack.push(SET_B);
      stack.push(SET_D);

      const sizes: Array<number> = [];
      stack.forEach((value: Set<number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[0]).assertEqual(1);
      expect(sizes[2]).assertEqual(2);

      let indexSum: number = 0;
      stack.forEach((value: Set<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Set<number>> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(SET_B);
    });

    /**
     * @tc.name   testStackSetTest0600
     * @tc.number SUB_ARKTS_STACK_SET_0600
     * @tc.desc   Verify Stack set behavior on empty stack and transition between empty and non-empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Set<number>> = new Stack<Set<number>>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(SET_A)).assertEqual(-1);

      stack.push(SET_F);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(SET_F);
      expect(stack.peek().has(Number.MAX_SAFE_INTEGER)).assertTrue();
      expect(stack.pop()).assertEqual(SET_F);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
