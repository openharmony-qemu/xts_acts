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

interface NestedInvalidObject {
  marker: string;
}

const NESTED_INVALID_OBJECT: NestedInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<Array<number>> = [
  [1, 2, 3], [0, -1], [NaN, Infinity], new Array<number>(3), new Array<number>(),
  [Number.MAX_SAFE_INTEGER], [1, 2, 3],
];

type NestedAllValue = Array<number> | NestedInvalidObject | null | undefined;

const ALL_VALUES: Array<NestedAllValue> = [
  ...VALID_VALUES,
  [1, 2, 3], NESTED_INVALID_OBJECT, null, undefined,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackNestedTest() {
  describe('StackNestedTest', () => {
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
     * @tc.name   testStackNestedTest0100
     * @tc.number SUB_ARKTS_STACK_NESTED_0100
     * @tc.desc   Verify Stack nested array constructor, isEmpty, push return values, length and peek including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNestedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<Array<number>> = new Stack<Array<number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<Array<number>> = new Stack<Array<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(VALID_VALUES[6]);
      expect(stack.peek()[1]).assertEqual(2);

      const mixed: Stack<NestedAllValue> = new Stack<NestedAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek()).assertUndefined();
    });

    /**
     * @tc.name   testStackNestedTest0200
     * @tc.number SUB_ARKTS_STACK_NESTED_0200
     * @tc.desc   Verify Stack nested array peek does not remove the top element and push returns the pushed array and updates length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNestedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Array<number>> = new Stack<Array<number>>();
      stack.push(VALID_VALUES[0]);
      stack.push(VALID_VALUES[1]);
      stack.push(VALID_VALUES[0]);

      expect(stack.peek()).assertEqual(VALID_VALUES[0]);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(VALID_VALUES[0]);
      expect(stack.length).assertEqual(3);

      const pushed: Array<number> = stack.push(VALID_VALUES[2]);
      expect(pushed).assertEqual(VALID_VALUES[2]);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(VALID_VALUES[2]);
    });

    /**
     * @tc.name   testStackNestedTest0300
     * @tc.number SUB_ARKTS_STACK_NESTED_0300
     * @tc.desc   Verify Stack nested array pop removes elements in LIFO order and returns the popped array until empty, then supports pushing again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNestedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Array<number>> = new Stack<Array<number>>();
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

      stack.push(VALID_VALUES[5]);
      expect(stack.peek()).assertEqual(VALID_VALUES[5]);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackNestedTest0400
     * @tc.number SUB_ARKTS_STACK_NESTED_0400
     * @tc.desc   Verify Stack nested array locate returns the 1-based position of a reference-equal array and -1 for absent or content-equal new arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNestedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Array<number>> = new Stack<Array<number>>();
      stack.push(VALID_VALUES[0]);
      stack.push(VALID_VALUES[1]);
      stack.push(VALID_VALUES[0]);

      expect(stack.locate(VALID_VALUES[0])).assertEqual(0);
      expect(stack.locate(VALID_VALUES[1])).assertEqual(1);
      expect(stack.locate(VALID_VALUES[5])).assertEqual(-1);
      expect(stack.locate([1, 2, 3])).assertEqual(-1);
    });

    /**
     * @tc.name   testStackNestedTest0500
     * @tc.number SUB_ARKTS_STACK_NESTED_0500
     * @tc.desc   Verify Stack nested array forEach callback values and indexes and for-of iteration order from bottom to top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNestedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Array<number>> = new Stack<Array<number>>();
      stack.push(VALID_VALUES[0]);
      stack.push(VALID_VALUES[1]);
      stack.push(VALID_VALUES[3]);

      const lengths: Array<number> = [];
      stack.forEach((value: Array<number>) => {
        lengths.push(value.length);
      });
      expect(lengths.length).assertEqual(3);
      expect(lengths[0]).assertEqual(3);
      expect(lengths[2]).assertEqual(3);

      let indexSum: number = 0;
      stack.forEach((value: Array<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Array<number>> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(VALID_VALUES[1]);
    });

    /**
     * @tc.name   testStackNestedTest0600
     * @tc.number SUB_ARKTS_STACK_NESTED_0600
     * @tc.desc   Verify Stack nested array boundary behavior when empty and when pushing and popping an empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackNestedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Array<number>> = new Stack<Array<number>>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(VALID_VALUES[0])).assertEqual(-1);

      stack.push(VALID_VALUES[4]);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(VALID_VALUES[4]);
      expect(stack.peek().length).assertEqual(0);
      expect(stack.pop()).assertEqual(VALID_VALUES[4]);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
