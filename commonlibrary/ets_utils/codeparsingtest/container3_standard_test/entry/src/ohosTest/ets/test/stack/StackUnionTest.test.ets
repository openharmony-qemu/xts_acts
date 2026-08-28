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

interface UnionInvalidObject {
  marker: string;
}

const UNION_INVALID_OBJECT: UnionInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [100, -99, 0x12, 1.2e3, 0, NaN, Number.MAX_SAFE_INTEGER, 100];

type UnionAllValue = number | boolean | UnionInvalidObject | null | undefined | bigint;

const ALL_VALUES: Array<UnionAllValue> = [
  ...VALID_VALUES,
  true, UNION_INVALID_OBJECT, null, undefined, 100n,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackUnionTest() {
  describe('StackUnionTest', () => {
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
     * @tc.name   testStackUnionTest0100
     * @tc.number SUB_ARKTS_STACK_UNION_0100
     * @tc.desc   Verify Stack union constructor, push of mixed union values, length and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<UnionAllValue> = new Stack<UnionAllValue>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<UnionAllValue> = new Stack<UnionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        const value: UnionAllValue = ALL_VALUES[i];
        const returned: UnionAllValue = stack.push(value);
        if (typeof value === 'number' && Number.isNaN(value)) {
          expect(Number.isNaN(returned as number)).assertTrue();
        } else {
          expect(returned).assertEqual(value);
        }
      }
      expect(stack.length).assertEqual(ALL_VALUES.length);
      expect(stack.peek()).assertEqual(100n);
    });

    /**
     * @tc.name   testStackUnionTest0200
     * @tc.number SUB_ARKTS_STACK_UNION_0200
     * @tc.desc   Verify Stack union peek does not remove element and push returns the pushed value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<UnionAllValue> = new Stack<UnionAllValue>();
      stack.push(100);
      stack.push('x' as Object as UnionAllValue);
      stack.push(100);

      expect(stack.peek()).assertEqual(100);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(100);
      expect(stack.length).assertEqual(3);

      const pushed: UnionAllValue = stack.push(true);
      expect(pushed).assertTrue();
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertTrue();
    });

    /**
     * @tc.name   testStackUnionTest0300
     * @tc.number SUB_ARKTS_STACK_UNION_0300
     * @tc.desc   Verify Stack union pop removes elements in LIFO order until empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<UnionAllValue> = new Stack<UnionAllValue>();
      stack.push(3);
      stack.push(1);
      stack.push(null);
      stack.push(4);

      expect(stack.pop()).assertEqual(4);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertNull();
      expect(stack.pop()).assertEqual(1);
      expect(stack.pop()).assertEqual(3);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(10);
      expect(stack.peek()).assertEqual(10);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackUnionTest0400
     * @tc.number SUB_ARKTS_STACK_UNION_0400
     * @tc.desc   Verify Stack union locate returns first index of a value and -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<UnionAllValue> = new Stack<UnionAllValue>();
      stack.push(100);
      stack.push(null);
      stack.push(100);

      expect(stack.locate(100)).assertEqual(0);
      expect(stack.locate(null)).assertEqual(1);
      expect(stack.locate(-999)).assertEqual(-1);
      expect(stack.locate(true)).assertEqual(-1);
    });

    /**
     * @tc.name   testStackUnionTest0500
     * @tc.number SUB_ARKTS_STACK_UNION_0500
     * @tc.desc   Verify Stack union forEach callback with index and for-of iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<UnionAllValue> = new Stack<UnionAllValue>();
      stack.push(1);
      stack.push(null);
      stack.push('u' as Object as UnionAllValue);

      const collected: Array<UnionAllValue> = [];
      stack.forEach((value: UnionAllValue) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertNull();

      let indexSum: number = 0;
      stack.forEach((value: UnionAllValue, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<UnionAllValue> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertEqual('u');
    });

    /**
     * @tc.name   testStackUnionTest0600
     * @tc.number SUB_ARKTS_STACK_UNION_0600
     * @tc.desc   Verify Stack union behavior on empty stack and transition between empty and non-empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<UnionAllValue> = new Stack<UnionAllValue>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(1)).assertEqual(-1);

      stack.push(false);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertFalse();
      expect(stack.pop()).assertFalse();
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
