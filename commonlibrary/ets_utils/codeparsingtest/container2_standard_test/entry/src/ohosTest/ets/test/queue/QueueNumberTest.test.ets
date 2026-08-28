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
import { Queue } from '@kit.ArkTS';

interface NumberInvalidObject {
  marker: string;
}

const NUMBER_INVALID_OBJECT: NumberInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MIN_VALUE, Number.MIN_VALUE - 1, Number.EPSILON,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, -128, 127, -32768, 32767, -2147483648,
  2147483647, -9223372036854775808, 9223372036854775807, -1.40129846432481707e-45,
  1.40129846432481707e-45, -3.4028234663852886e38, 3.4028234663852886e38, 65535,
  -1, 999999.99, 13800138000, 123456, -100.5,
];

type NumberInvalidValue = string | null | undefined | NumberInvalidObject | Array<number> | boolean | bigint;
type NumberAllValue = number | NumberInvalidValue;

const ALL_VALUES: Array<NumberAllValue> = [
  ...VALID_VALUES,
  '123', '0x12', null, undefined, NUMBER_INVALID_OBJECT, [], true,
  BigInt('16045690984833335006'), BigInt('9007199254740991'),
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueNumberTest() {
  describe('QueueNumberTest', () => {
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
     * @tc.name   testQueueNumberTest0100
     * @tc.number SUB_ARKTS_QUEUE_NUMBER_0100
     * @tc.desc   Verify Queue number add returns true for boundary values, length accumulates, getFirst and pop follow FIFO order on empty and mixed-type queues
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<number> = new Queue<number>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<number> = new Queue<number>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        const added: boolean = queue.add(VALID_VALUES[i]);
        expect(added).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(1);

      const mixed: Queue<NumberAllValue> = new Queue<NumberAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(1);
      const mixedFirst: NumberAllValue = mixed.pop();
      expect(mixedFirst).assertEqual(1);
      expect(mixed.getFirst()).assertEqual(100.5);
    });

    /**
     * @tc.name   testQueueNumberTest0200
     * @tc.number SUB_ARKTS_QUEUE_NUMBER_0200
     * @tc.desc   Verify Queue number getFirst does not remove elements, add appends to the tail, and NaN head is preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<number> = new Queue<number>();
      queue.add(2);
      queue.add(4);
      queue.add(5);
      queue.add(2);

      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(2);
      expect(queue.getFirst()).assertEqual(2);
      expect(queue.length).assertEqual(4);

      queue.add(9);
      expect(queue.length).assertEqual(5);
      expect(queue.getFirst()).assertEqual(2);

      const nanQueue: Queue<number> = new Queue<number>();
      nanQueue.add(NaN);
      expect(nanQueue.getFirst()).assertNaN();
    });

    /**
     * @tc.name   testQueueNumberTest0300
     * @tc.number SUB_ARKTS_QUEUE_NUMBER_0300
     * @tc.desc   Verify Queue number pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<number> = new Queue<number>();
      queue.add(2);
      queue.add(4);
      queue.add(5);
      queue.add(2);
      queue.add(4);

      const first: number = queue.pop();
      expect(first).assertEqual(2);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(4);

      const second: number = queue.pop();
      expect(second).assertEqual(4);
      expect(queue.length).assertEqual(3);

      queue.pop();
      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueNumberTest0400
     * @tc.number SUB_ARKTS_QUEUE_NUMBER_0400
     * @tc.desc   Verify Queue number forEach visits values in insertion order including duplicates and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<number> = new Queue<number>();
      queue.add(2);
      queue.add(4);
      queue.add(5);
      queue.add(4);

      const visited: Array<number> = [];
      queue.forEach((value: number) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(2);
      expect(visited[1]).assertEqual(4);
      expect(visited[2]).assertEqual(5);
      expect(visited[3]).assertEqual(4);

      let indexSum: number = 0;
      queue.forEach((value: number, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(6);
    });

    /**
     * @tc.name   testQueueNumberTest0500
     * @tc.number SUB_ARKTS_QUEUE_NUMBER_0500
     * @tc.desc   Verify Queue number Symbol.iterator and for-of traverse values in FIFO order with correct sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<number> = new Queue<number>();
      queue.add(2);
      queue.add(4);
      queue.add(5);
      queue.add(4);

      const iterValues: Array<number> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<number> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(4);
      expect(iterValues[0]).assertEqual(2);
      expect(iterValues[3]).assertEqual(4);

      let sum: number = 0;
      for (const value of queue) {
        sum += value;
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.name   testQueueNumberTest0600
     * @tc.number SUB_ARKTS_QUEUE_NUMBER_0600
     * @tc.desc   Verify empty Queue number pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<number> = new Queue<number>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(1)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(1);
      expect(queue.pop()).assertEqual(1);
      expect(queue.length).assertEqual(0);
    });
  });
}
