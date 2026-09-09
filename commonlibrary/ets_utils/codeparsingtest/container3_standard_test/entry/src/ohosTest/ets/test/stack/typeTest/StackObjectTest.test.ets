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

interface ArrayObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}

interface ObjectInvalidObject {
  marker: string;
}

const OBJECT_INVALID_OBJECT: ObjectInvalidObject = { marker: 'invalid' };

const OBJECT_A: ArrayObjectItem = { id: 1, label: '', name: '测试', age: 20 };
const OBJECT_B: ArrayObjectItem = { id: 2, label: '测试😀', grade: 3, className: 'A' };
const OBJECT_C: ArrayObjectItem = { id: 3, label: 'a'.repeat(100), extra: Number.MAX_SAFE_INTEGER };
const OBJECT_D: ArrayObjectItem = { id: 4, label: '13800138000', name: '138****8000' };
const OBJECT_E: ArrayObjectItem = { id: 5, label: 'test@example.com' };
const OBJECT_F: ArrayObjectItem = { id: 6, label: 'https://test.com', grade: -1 };

const VALID_VALUES: Array<ArrayObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];

type ObjectAllValue = ArrayObjectItem | number | string | null | undefined | ObjectInvalidObject;

const ALL_VALUES: Array<ObjectAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, OBJECT_INVALID_OBJECT,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackObjectTest() {
  describe('StackObjectTest', () => {
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
     * @tc.name   testStackObjectTest0100
     * @tc.number SUB_ARKTS_STACK_OBJECT_0100
     * @tc.desc   Verify Stack object constructor, isEmpty, push return values, length and peek including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<ArrayObjectItem> = new Stack<ArrayObjectItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<ArrayObjectItem> = new Stack<ArrayObjectItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(OBJECT_A);
      expect(stack.peek().id).assertEqual(1);

      const mixed: Stack<ObjectAllValue> = new Stack<ObjectAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek()).assertEqual(OBJECT_INVALID_OBJECT);
    });

    /**
     * @tc.name   testStackObjectTest0200
     * @tc.number SUB_ARKTS_STACK_OBJECT_0200
     * @tc.desc   Verify Stack object peek does not remove the top element and push returns the pushed object and updates length with duplicate references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayObjectItem> = new Stack<ArrayObjectItem>();
      stack.push(OBJECT_A);
      stack.push(OBJECT_B);
      stack.push(OBJECT_A);

      expect(stack.peek()).assertEqual(OBJECT_A);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(OBJECT_A);
      expect(stack.length).assertEqual(3);

      const pushed: ArrayObjectItem = stack.push(OBJECT_C);
      expect(pushed).assertEqual(OBJECT_C);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(OBJECT_C);
    });

    /**
     * @tc.name   testStackObjectTest0300
     * @tc.number SUB_ARKTS_STACK_OBJECT_0300
     * @tc.desc   Verify Stack object pop removes elements in LIFO order until empty, then supports pushing again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayObjectItem> = new Stack<ArrayObjectItem>();
      stack.push(OBJECT_A);
      stack.push(OBJECT_B);
      stack.push(OBJECT_C);
      stack.push(OBJECT_D);

      expect(stack.pop()).assertEqual(OBJECT_D);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(OBJECT_C);
      expect(stack.pop()).assertEqual(OBJECT_B);
      expect(stack.pop()).assertEqual(OBJECT_A);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(OBJECT_E);
      expect(stack.peek()).assertEqual(OBJECT_E);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackObjectTest0400
     * @tc.number SUB_ARKTS_STACK_OBJECT_0400
     * @tc.desc   Verify Stack object locate returns the topmost position of a reference-equal object and -1 for absent or content-equal new objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayObjectItem> = new Stack<ArrayObjectItem>();
      stack.push(OBJECT_A);
      stack.push(OBJECT_B);
      stack.push(OBJECT_A);

      expect(stack.locate(OBJECT_A)).assertEqual(0);
      expect(stack.locate(OBJECT_B)).assertEqual(1);
      expect(stack.locate(OBJECT_C)).assertEqual(-1);
      expect(stack.locate({ id: 1, label: '', name: '测试', age: 20 })).assertEqual(-1);
    });

    /**
     * @tc.name   testStackObjectTest0500
     * @tc.number SUB_ARKTS_STACK_OBJECT_0500
     * @tc.desc   Verify Stack object forEach callback values and indexes and for-of iteration order from bottom to top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayObjectItem> = new Stack<ArrayObjectItem>();
      stack.push(OBJECT_A);
      stack.push(OBJECT_B);
      stack.push(OBJECT_C);

      const ids: Array<number> = [];
      stack.forEach((value: ArrayObjectItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[2]).assertEqual(3);

      let indexSum: number = 0;
      stack.forEach((value: ArrayObjectItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<ArrayObjectItem> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(OBJECT_B);
    });

    /**
     * @tc.name   testStackObjectTest0600
     * @tc.number SUB_ARKTS_STACK_OBJECT_0600
     * @tc.desc   Verify Stack object boundary behavior when empty and when pushing and popping an object with a negative grade
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<ArrayObjectItem> = new Stack<ArrayObjectItem>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(OBJECT_A)).assertEqual(-1);

      stack.push(OBJECT_F);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(OBJECT_F);
      expect(stack.peek().grade).assertEqual(-1);
      expect(stack.pop()).assertEqual(OBJECT_F);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
