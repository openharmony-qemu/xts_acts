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

interface MapInvalidObject {
  marker: string;
}

const MAP_INVALID_OBJECT: MapInvalidObject = { marker: 'invalid' };

const MAP_A: Map<string, number> = new Map<string, number>();
const MAP_B: Map<string, number> = new Map<string, number>();
const MAP_C: Map<string, number> = new Map<string, number>();
const MAP_D: Map<string, number> = new Map<string, number>();
const MAP_E: Map<string, number> = new Map<string, number>();
const MAP_F: Map<string, number> = new Map<string, number>();
const MAP_G: Map<string, number> = new Map<string, number>();

MAP_A.set('a', 1);
MAP_B.set('b', 2);
MAP_C.set('c', 3);
MAP_D.set('', 0);
MAP_E.set('​', -1);
MAP_F.set('max', Number.MAX_SAFE_INTEGER);

const VALID_VALUES: Array<Map<string, number>> = [MAP_A, MAP_B, MAP_C, MAP_D, MAP_E, MAP_F, MAP_G, MAP_A];

type MapInvalidValue = string | number | null | undefined | MapInvalidObject | Array<number>;
type MapAllValue = Map<string, number> | MapInvalidValue;

const ALL_VALUES: Array<MapAllValue> = [
  ...VALID_VALUES,
  'key', 123, null, undefined, MAP_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackMapTest() {
  describe('StackMapTest', () => {
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
     * @tc.name   testStackMapTest0100
     * @tc.number SUB_ARKTS_STACK_MAP_0100
     * @tc.desc   Verify Stack map push and peek on empty, valid and mixed-type stacks including length and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<Map<string, number>> = new Stack<Map<string, number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<Map<string, number>> = new Stack<Map<string, number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(MAP_A);
      expect(stack.peek().get('a')).assertEqual(1);

      const mixed: Stack<MapAllValue> = new Stack<MapAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek() === ALL_VALUES[ALL_VALUES.length - 1]).assertTrue();
    });

    /**
     * @tc.name   testStackMapTest0200
     * @tc.number SUB_ARKTS_STACK_MAP_0200
     * @tc.desc   Verify Stack map peek does not remove elements and push returns the pushed map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Map<string, number>> = new Stack<Map<string, number>>();
      stack.push(MAP_A);
      stack.push(MAP_B);
      stack.push(MAP_A);

      expect(stack.peek()).assertEqual(MAP_A);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(MAP_A);
      expect(stack.length).assertEqual(3);

      const pushed: Map<string, number> = stack.push(MAP_C);
      expect(pushed).assertEqual(MAP_C);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(MAP_C);
    });

    /**
     * @tc.name   testStackMapTest0300
     * @tc.number SUB_ARKTS_STACK_MAP_0300
     * @tc.desc   Verify Stack map pop removes elements in LIFO order until empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Map<string, number>> = new Stack<Map<string, number>>();
      stack.push(MAP_A);
      stack.push(MAP_B);
      stack.push(MAP_C);
      stack.push(MAP_D);

      expect(stack.pop()).assertEqual(MAP_D);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(MAP_C);
      expect(stack.pop()).assertEqual(MAP_B);
      expect(stack.pop()).assertEqual(MAP_A);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(MAP_E);
      expect(stack.peek()).assertEqual(MAP_E);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackMapTest0400
     * @tc.number SUB_ARKTS_STACK_MAP_0400
     * @tc.desc   Verify Stack map locate returns 1-based position or -1 for present and absent maps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Map<string, number>> = new Stack<Map<string, number>>();
      stack.push(MAP_A);
      stack.push(MAP_B);
      stack.push(MAP_A);

      expect(stack.locate(MAP_A)).assertEqual(0);
      expect(stack.locate(MAP_B)).assertEqual(1);
      expect(stack.locate(MAP_C)).assertEqual(-1);
      expect(stack.locate(MAP_G)).assertEqual(-1);
    });

    /**
     * @tc.name   testStackMapTest0500
     * @tc.number SUB_ARKTS_STACK_MAP_0500
     * @tc.desc   Verify Stack map forEach callback with value and index and for-of iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Map<string, number>> = new Stack<Map<string, number>>();
      stack.push(MAP_A);
      stack.push(MAP_B);
      stack.push(MAP_C);

      const sizes: Array<number> = [];
      stack.forEach((value: Map<string, number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[0]).assertEqual(1);
      expect(sizes[2]).assertEqual(1);

      let indexSum: number = 0;
      stack.forEach((value: Map<string, number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Map<string, number>> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(MAP_B);
    });

    /**
     * @tc.name   testStackMapTest0600
     * @tc.number SUB_ARKTS_STACK_MAP_0600
     * @tc.desc   Verify Stack map behavior on empty stack and isEmpty transitions when pushing and popping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Map<string, number>> = new Stack<Map<string, number>>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(MAP_A)).assertEqual(-1);

      stack.push(MAP_F);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(MAP_F);
      expect(stack.peek().get('max')).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(stack.pop()).assertEqual(MAP_F);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
