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

interface FunctionInvalidObject {
  marker: string;
}

const FUNCTION_INVALID_OBJECT: FunctionInvalidObject = { marker: 'invalid' };

type ArrayFunctionItem = (value: number) => number;

const FUNCTION_A: ArrayFunctionItem = (value: number): number => value + 1;
const FUNCTION_B: ArrayFunctionItem = (value: number): number => value + 2;
const FUNCTION_C: ArrayFunctionItem = (value: number): number => value + 3;
const FUNCTION_D: ArrayFunctionItem = (value: number): number => value * value;
const FUNCTION_E: ArrayFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: ArrayFunctionItem = (value: number): number => value - 100.5;

const VALID_VALUES: Array<ArrayFunctionItem> = [
  FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A,
];

type FunctionInvalidValue = number | string | null | undefined | FunctionInvalidObject | Array<number>;
type FunctionAllValue = ArrayFunctionItem | FunctionInvalidValue;

const ALL_VALUES: Array<FunctionAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, FUNCTION_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackFunctionTest() {
  describe('StackFunctionTest', () => {
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
     * @tc.name   testStackFunctionTest0100
     * @tc.number SUB_ARKTS_STACK_FUNCTION_0100
     * @tc.desc   Verify Stack function push and peek on empty, valid and mixed-type stacks including length and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<ArrayFunctionItem> = new Stack<ArrayFunctionItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<ArrayFunctionItem> = new Stack<ArrayFunctionItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(FUNCTION_A);
      expect(stack.peek()(1)).assertEqual(2);

      const mixed: Stack<FunctionAllValue> = new Stack<FunctionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek() === ALL_VALUES[ALL_VALUES.length - 1]).assertTrue();
    });

    /**
     * @tc.name   testStackFunctionTest0200
     * @tc.number SUB_ARKTS_STACK_FUNCTION_0200
     * @tc.desc   Verify Stack function peek does not remove elements and push returns the pushed function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayFunctionItem> = new Stack<ArrayFunctionItem>();
      stack.push(FUNCTION_A);
      stack.push(FUNCTION_B);
      stack.push(FUNCTION_A);

      expect(stack.peek()).assertEqual(FUNCTION_A);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(FUNCTION_A);
      expect(stack.length).assertEqual(3);

      const pushed: ArrayFunctionItem = stack.push(FUNCTION_D);
      expect(pushed).assertEqual(FUNCTION_D);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(FUNCTION_D);
      expect(stack.peek()(3)).assertEqual(9);
    });

    /**
     * @tc.name   testStackFunctionTest0300
     * @tc.number SUB_ARKTS_STACK_FUNCTION_0300
     * @tc.desc   Verify Stack function pop removes elements in LIFO order until empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayFunctionItem> = new Stack<ArrayFunctionItem>();
      stack.push(FUNCTION_A);
      stack.push(FUNCTION_B);
      stack.push(FUNCTION_C);
      stack.push(FUNCTION_D);

      expect(stack.pop()).assertEqual(FUNCTION_D);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(FUNCTION_C);
      expect(stack.pop()).assertEqual(FUNCTION_B);
      expect(stack.pop()).assertEqual(FUNCTION_A);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(FUNCTION_E);
      expect(stack.peek()).assertEqual(FUNCTION_E);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackFunctionTest0400
     * @tc.number SUB_ARKTS_STACK_FUNCTION_0400
     * @tc.desc   Verify Stack function locate returns 1-based position or -1 for present and absent functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayFunctionItem> = new Stack<ArrayFunctionItem>();
      stack.push(FUNCTION_A);
      stack.push(FUNCTION_B);
      stack.push(FUNCTION_A);

      expect(stack.locate(FUNCTION_A)).assertEqual(0);
      expect(stack.locate(FUNCTION_B)).assertEqual(1);
      expect(stack.locate(FUNCTION_C)).assertEqual(-1);
      expect(stack.locate(FUNCTION_D)).assertEqual(-1);
    });

    /**
     * @tc.name   testStackFunctionTest0500
     * @tc.number SUB_ARKTS_STACK_FUNCTION_0500
     * @tc.desc   Verify Stack function forEach callback with value and index and for-of iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayFunctionItem> = new Stack<ArrayFunctionItem>();
      stack.push(FUNCTION_A);
      stack.push(FUNCTION_B);
      stack.push(FUNCTION_C);

      const results: Array<number> = [];
      stack.forEach((value: ArrayFunctionItem) => {
        results.push(value(3));
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(4);
      expect(results[2]).assertEqual(6);

      let indexSum: number = 0;
      stack.forEach((value: ArrayFunctionItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<ArrayFunctionItem> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(FUNCTION_B);
    });

    /**
     * @tc.name   testStackFunctionTest0600
     * @tc.number SUB_ARKTS_STACK_FUNCTION_0600
     * @tc.desc   Verify Stack function behavior on empty stack and isEmpty transitions when pushing and popping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayFunctionItem> = new Stack<ArrayFunctionItem>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(FUNCTION_A)).assertEqual(-1);

      stack.push(FUNCTION_F);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(FUNCTION_F);
      expect(stack.peek()(0)).assertEqual(-100.5);
      expect(stack.pop()).assertEqual(FUNCTION_F);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
