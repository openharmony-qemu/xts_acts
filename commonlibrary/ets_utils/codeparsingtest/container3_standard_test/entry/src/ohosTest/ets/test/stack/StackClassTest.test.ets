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

interface ClassInvalidObject {
  marker: string;
}

const CLASS_INVALID_OBJECT: ClassInvalidObject = { marker: 'invalid' };

class ArrayClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const CLASS_A = new ArrayClassItem(1, '测试');
const CLASS_B = new ArrayClassItem(0, '');
const CLASS_C = new ArrayClassItem(-1, '测试😀');
const CLASS_D = new ArrayClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E = new ArrayClassItem(13800138000, '13800138000');
const CLASS_F = new ArrayClassItem(99999999, '<script>alert(1)</script>');

const VALID_VALUES: Array<ArrayClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];

type ClassInvalidValue = number | string | null | undefined | ClassInvalidObject | Array<number>;
type ClassAllValue = ArrayClassItem | ClassInvalidValue;

const ALL_VALUES: Array<ClassAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, CLASS_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackClassTest() {
  describe('StackClassTest', () => {
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
     * @tc.name   testStackClassTest0100
     * @tc.number SUB_ARKTS_STACK_CLASS_0100
     * @tc.desc   Verify Stack class push returns the pushed instance and updates length and peek for valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<ArrayClassItem> = new Stack<ArrayClassItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<ArrayClassItem> = new Stack<ArrayClassItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(CLASS_A);
      expect(stack.peek() instanceof ArrayClassItem).assertTrue();

      const mixed: Stack<ClassAllValue> = new Stack<ClassAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek() === ALL_VALUES[ALL_VALUES.length - 1]).assertTrue();
    });

    /**
     * @tc.name   testStackClassTest0200
     * @tc.number SUB_ARKTS_STACK_CLASS_0200
     * @tc.desc   Verify Stack class peek does not change length and push updates the top element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayClassItem> = new Stack<ArrayClassItem>();
      stack.push(CLASS_A);
      stack.push(CLASS_B);
      stack.push(CLASS_A);

      expect(stack.peek()).assertEqual(CLASS_A);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(CLASS_A);
      expect(stack.length).assertEqual(3);

      const pushed: ArrayClassItem = stack.push(CLASS_C);
      expect(pushed).assertEqual(CLASS_C);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(CLASS_C);
    });

    /**
     * @tc.name   testStackClassTest0300
     * @tc.number SUB_ARKTS_STACK_CLASS_0300
     * @tc.desc   Verify Stack class pop removes instances in LIFO order until empty and can push again after emptying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayClassItem> = new Stack<ArrayClassItem>();
      stack.push(CLASS_A);
      stack.push(CLASS_B);
      stack.push(CLASS_C);
      stack.push(CLASS_D);

      expect(stack.pop()).assertEqual(CLASS_D);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(CLASS_C);
      expect(stack.peek()).assertEqual(CLASS_B);
      expect(stack.pop()).assertEqual(CLASS_B);
      expect(stack.pop()).assertEqual(CLASS_A);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(CLASS_E);
      expect(stack.peek()).assertEqual(CLASS_E);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackClassTest0400
     * @tc.number SUB_ARKTS_STACK_CLASS_0400
     * @tc.desc   Verify Stack class locate returns index by reference and does not match equal-content or absent instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayClassItem> = new Stack<ArrayClassItem>();
      stack.push(CLASS_A);
      stack.push(CLASS_B);
      stack.push(CLASS_A);

      expect(stack.locate(CLASS_A)).assertEqual(0);
      expect(stack.locate(CLASS_B)).assertEqual(1);
      expect(stack.locate(CLASS_C)).assertEqual(-1);
      expect(stack.locate(new ArrayClassItem(1, '测试'))).assertEqual(-1);
    });

    /**
     * @tc.name   testStackClassTest0500
     * @tc.number SUB_ARKTS_STACK_CLASS_0500
     * @tc.desc   Verify Stack class forEach traverses instances with index and the iterator visits elements in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayClassItem> = new Stack<ArrayClassItem>();
      stack.push(CLASS_A);
      stack.push(CLASS_B);
      stack.push(CLASS_C);

      const visited: Array<ArrayClassItem> = [];
      stack.forEach((value: ArrayClassItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(CLASS_A);
      expect(visited[2]).assertEqual(CLASS_C);

      let indexSum: number = 0;
      stack.forEach((value: ArrayClassItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<ArrayClassItem> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(CLASS_B);
    });

    /**
     * @tc.name   testStackClassTest0600
     * @tc.number SUB_ARKTS_STACK_CLASS_0600
     * @tc.desc   Verify Stack class empty-state behaviors where pop, peek and locate return undefined or -1 on an empty stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayClassItem> = new Stack<ArrayClassItem>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(CLASS_A)).assertEqual(-1);

      stack.push(CLASS_F);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(CLASS_F);
      expect(stack.pop()).assertEqual(CLASS_F);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
