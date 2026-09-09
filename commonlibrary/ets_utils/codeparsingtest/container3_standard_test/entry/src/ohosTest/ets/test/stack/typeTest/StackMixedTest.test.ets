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

interface MixedInvalidObject {
  marker: string;
}

const MIXED_INVALID_OBJECT: MixedInvalidObject = { marker: 'invalid' };

class MixedClass {
  value: number;

  constructor(value: number) {
    this.value = value;
  }
}

type MixedItem = number | string | boolean | bigint | null | undefined | MixedClass | MixedInvalidObject | Array<number>;

const MIXED_VALUES: Array<MixedItem> = [
  1, 'text', true, 100n, null, undefined, 'sym', new MixedClass(7), MIXED_INVALID_OBJECT, [1, 2],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackMixedTest() {
  describe('StackMixedTest', () => {
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
     * @tc.name   testStackMixedTest0100
     * @tc.number SUB_ARKTS_STACK_MIXED_0100
     * @tc.desc   Verify Stack mixed-type push and peek on empty stack and with various mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMixedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<MixedItem> = new Stack<MixedItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<MixedItem> = new Stack<MixedItem>();
      for (let i = 0; i < MIXED_VALUES.length; i++) {
        expect(stack.push(MIXED_VALUES[i])).assertEqual(MIXED_VALUES[i]);
      }
      expect(stack.length).assertEqual(MIXED_VALUES.length);
      expect(stack.peek()).assertEqual(MIXED_VALUES[9]);
      expect(stack.peek() instanceof Array).assertTrue();
    });

    /**
     * @tc.name   testStackMixedTest0200
     * @tc.number SUB_ARKTS_STACK_MIXED_0200
     * @tc.desc   Verify Stack mixed-type peek does not remove elements and push returns the pushed value including null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMixedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<MixedItem> = new Stack<MixedItem>();
      const obj: MixedClass = new MixedClass(1);
      stack.push(obj);
      stack.push('dup');
      stack.push(obj);

      expect(stack.peek()).assertEqual(obj);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.length).assertEqual(3);

      const pushed: MixedItem = stack.push(null);
      expect(pushed).assertNull();
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertNull();
    });

    /**
     * @tc.name   testStackMixedTest0300
     * @tc.number SUB_ARKTS_STACK_MIXED_0300
     * @tc.desc   Verify Stack mixed-type pop removes elements in LIFO order until empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMixedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<MixedItem> = new Stack<MixedItem>();
      stack.push(1);
      stack.push('b');
      stack.push(true);
      stack.push(null);

      expect(stack.pop()).assertNull();
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertTrue();
      expect(stack.pop()).assertEqual('b');
      expect(stack.pop()).assertEqual(1);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(undefined);
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackMixedTest0400
     * @tc.number SUB_ARKTS_STACK_MIXED_0400
     * @tc.desc   Verify Stack mixed-type locate returns 1-based position by reference or -1 for absent values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMixedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<MixedItem> = new Stack<MixedItem>();
      const obj: MixedClass = new MixedClass(1);
      stack.push(obj);
      stack.push('dup');
      stack.push(obj);

      expect(stack.locate(obj)).assertEqual(0);
      expect(stack.locate('dup')).assertEqual(1);
      expect(stack.locate(new MixedClass(1))).assertEqual(-1);
      expect(stack.locate('missing')).assertEqual(-1);
    });

    /**
     * @tc.name   testStackMixedTest0500
     * @tc.number SUB_ARKTS_STACK_MIXED_0500
     * @tc.desc   Verify Stack mixed-type forEach callback with value and index and for-of iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMixedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<MixedItem> = new Stack<MixedItem>();
      stack.push(1);
      stack.push('b');
      stack.push(true);

      const collected: Array<MixedItem> = [];
      stack.forEach((value: MixedItem) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual('b');
      expect(collected[2]).assertTrue();

      let indexSum: number = 0;
      stack.forEach((value: MixedItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<MixedItem> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertTrue();
    });

    /**
     * @tc.name   testStackMixedTest0600
     * @tc.number SUB_ARKTS_STACK_MIXED_0600
     * @tc.desc   Verify Stack mixed-type behavior on empty stack and isEmpty transitions when pushing and popping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMixedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<MixedItem> = new Stack<MixedItem>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(1)).assertEqual(-1);

      const obj: MixedClass = new MixedClass(9);
      stack.push(obj);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(obj);
      const peeked: MixedItem = stack.peek() as MixedItem;
      expect(peeked instanceof MixedClass).assertTrue();
      expect(stack.pop()).assertEqual(obj);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
