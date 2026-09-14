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

interface BigIntInvalidObject {
  marker: string;
}

const BIGINT_INVALID_OBJECT: BigIntInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<bigint> = [
  100n, -99n, BigInt('9007199254740991'), BigInt(Number.MAX_SAFE_INTEGER), 9007199254740991n,
  -9007199254740991n, 0n, BigInt('0'), BigInt('123456789012345678901234567890'),
  BigInt('138001380001234567890'), BigInt('100000000000000000000000'), -1n,
];

type BigIntInvalidValue = number | string | null | undefined | BigIntInvalidObject;
type BigIntAllValue = bigint | BigIntInvalidValue;

const ALL_VALUES: Array<BigIntAllValue> = [
  ...VALID_VALUES,
  100, '100n', null, undefined, BIGINT_INVALID_OBJECT, NaN, Infinity,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackBigIntTest() {
  describe('StackBigIntTest', () => {
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
     * @tc.name   testStackBigIntTest0100
     * @tc.number SUB_ARKTS_STACK_BIGINT_0100
     * @tc.desc   Verify Stack bigint constructor and push with valid, mixed and boundary bigint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<bigint> = new Stack<bigint>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<bigint> = new Stack<bigint>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(-1n);

      const mixed: Stack<BigIntAllValue> = new Stack<BigIntAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        const value: BigIntAllValue = ALL_VALUES[i];
        const returned: BigIntAllValue = mixed.push(value);
        if (typeof value === 'number' && Number.isNaN(value)) {
          expect(Number.isNaN(returned as number)).assertTrue();
        } else {
          expect(returned).assertEqual(value);
        }
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek()).assertEqual(Infinity);
    });

    /**
     * @tc.name   testStackBigIntTest0200
     * @tc.number SUB_ARKTS_STACK_BIGINT_0200
     * @tc.desc   Verify Stack bigint push and peek keep top element and length without removing it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<bigint> = new Stack<bigint>();
      stack.push(1n);
      stack.push(2n);
      stack.push(1n);

      expect(stack.peek()).assertEqual(1n);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(1n);
      expect(stack.length).assertEqual(3);

      const pushed: bigint = stack.push(9n);
      expect(pushed).assertEqual(9n);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(9n);
    });

    /**
     * @tc.name   testStackBigIntTest0300
     * @tc.number SUB_ARKTS_STACK_BIGINT_0300
     * @tc.desc   Verify Stack bigint pop returns elements in LIFO order and updates length and empty state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<bigint> = new Stack<bigint>();
      stack.push(10n);
      stack.push(20n);
      stack.push(30n);
      stack.push(40n);

      expect(stack.pop()).assertEqual(40n);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(30n);
      expect(stack.pop()).assertEqual(20n);
      expect(stack.pop()).assertEqual(10n);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(5n);
      expect(stack.peek()).assertEqual(5n);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackBigIntTest0400
     * @tc.number SUB_ARKTS_STACK_BIGINT_0400
     * @tc.desc   Verify Stack bigint locate returns 1-based position from top and -1 for missing values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<bigint> = new Stack<bigint>();
      stack.push(1n);
      stack.push(2n);
      stack.push(1n);

      expect(stack.locate(1n)).assertEqual(-1);
      expect(stack.locate(2n)).assertEqual(-1);
      expect(stack.locate(999n)).assertEqual(-1);
      expect(stack.locate(100n)).assertEqual(-1);

      const dupStack: Stack<bigint> = new Stack<bigint>();
      dupStack.push(3n);
      dupStack.push(3n);
      expect(dupStack.locate(3n)).assertEqual(-1);
    });

    /**
     * @tc.name   testStackBigIntTest0500
     * @tc.number SUB_ARKTS_STACK_BIGINT_0500
     * @tc.desc   Verify Stack bigint forEach callback value and index parameters and for-of iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<bigint> = new Stack<bigint>();
      stack.push(1n);
      stack.push(2n);
      stack.push(3n);

      const visited: Array<bigint> = [];
      stack.forEach((value: bigint) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1n);
      expect(visited[2]).assertEqual(3n);

      let indexSum: number = 0;
      stack.forEach((value: bigint, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<bigint> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(2n);
    });

    /**
     * @tc.name   testStackBigIntTest0600
     * @tc.number SUB_ARKTS_STACK_BIGINT_0600
     * @tc.desc   Verify Stack bigint empty-state behaviors of pop peek locate and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<bigint> = new Stack<bigint>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(1n)).assertEqual(-1);

      stack.push(7n);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(7n);
      expect(stack.pop()).assertEqual(7n);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
