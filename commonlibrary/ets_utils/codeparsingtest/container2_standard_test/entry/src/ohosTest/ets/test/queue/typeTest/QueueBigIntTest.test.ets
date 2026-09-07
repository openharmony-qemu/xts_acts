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

export default function queueBigIntTest() {
  describe('QueueBigIntTest', () => {
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
     * @tc.name   testQueueBigIntTest0100
     * @tc.number SUB_ARKTS_QUEUE_BIGINT_0100
     * @tc.desc   Verify Queue bigint add returns true, length accumulates, getFirst and pop follow FIFO order on empty and populated queues including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<bigint> = new Queue<bigint>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<bigint> = new Queue<bigint>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(100n);
      expect(queue.pop()).assertEqual(100n);
      expect(queue.getFirst()).assertEqual(-99n);

      const mixed: Queue<BigIntAllValue> = new Queue<BigIntAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(100n);
    });

    /**
     * @tc.name   testQueueBigIntTest0200
     * @tc.number SUB_ARKTS_QUEUE_BIGINT_0200
     * @tc.desc   Verify Queue bigint getFirst does not remove elements and add appends to the tail without changing the head, including zero bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<bigint> = new Queue<bigint>();
      queue.add(1n);
      queue.add(2n);
      queue.add(1n);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(1n);
      expect(queue.getFirst()).assertEqual(1n);
      expect(queue.length).assertEqual(3);

      queue.add(0n);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(1n);

      const zeroQueue: Queue<bigint> = new Queue<bigint>();
      zeroQueue.add(0n);
      expect(zeroQueue.getFirst()).assertEqual(0n);
    });

    /**
     * @tc.name   testQueueBigIntTest0300
     * @tc.number SUB_ARKTS_QUEUE_BIGINT_0300
     * @tc.desc   Verify Queue bigint pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<bigint> = new Queue<bigint>();
      queue.add(10n);
      queue.add(20n);
      queue.add(30n);
      queue.add(40n);

      const first: bigint = queue.pop();
      expect(first).assertEqual(10n);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(20n);

      const second: bigint = queue.pop();
      expect(second).assertEqual(20n);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueBigIntTest0400
     * @tc.number SUB_ARKTS_QUEUE_BIGINT_0400
     * @tc.desc   Verify Queue bigint forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<bigint> = new Queue<bigint>();
      queue.add(1n);
      queue.add(2n);
      queue.add(3n);

      const visited: Array<bigint> = [];
      queue.forEach((value: bigint) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1n);
      expect(visited[1]).assertEqual(2n);
      expect(visited[2]).assertEqual(3n);

      let indexSum: number = 0;
      queue.forEach((value: bigint, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueBigIntTest0500
     * @tc.number SUB_ARKTS_QUEUE_BIGINT_0500
     * @tc.desc   Verify Queue bigint Symbol.iterator and for-of traverse values in FIFO order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<bigint> = new Queue<bigint>();
      queue.add(5n);
      queue.add(6n);
      queue.add(7n);

      const iterValues: Array<bigint> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<bigint> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(5n);
      expect(iterValues[2]).assertEqual(7n);

      let sum: bigint = 0n;
      for (const value of queue) {
        sum += value;
      }
      expect(sum).assertEqual(18n);
    });

    /**
     * @tc.name   testQueueBigIntTest0600
     * @tc.number SUB_ARKTS_QUEUE_BIGINT_0600
     * @tc.desc   Verify empty Queue bigint pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<bigint> = new Queue<bigint>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(9n)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(9n);
      expect(queue.pop()).assertEqual(9n);
      expect(queue.length).assertEqual(0);
    });
  });
}
