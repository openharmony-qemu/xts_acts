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

export default function queueUnionTest() {
  describe('QueueUnionTest', () => {
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
     * @tc.name   testQueueUnionTest0100
     * @tc.number SUB_ARKTS_QUEUE_UNION_0100
     * @tc.desc   Verify Queue of union type values add returns true, length accumulates, getFirst and pop follow FIFO order across number boolean object null undefined and bigint elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<UnionAllValue> = new Queue<UnionAllValue>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<UnionAllValue> = new Queue<UnionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(queue.add(ALL_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(ALL_VALUES.length);
      expect(queue.getFirst()).assertEqual(100);
      expect(queue.pop()).assertEqual(100);
      expect(queue.getFirst()).assertEqual(-99);
      expect(queue.length).assertEqual(ALL_VALUES.length - 1);
    });

    /**
     * @tc.name   testQueueUnionTest0200
     * @tc.number SUB_ARKTS_QUEUE_UNION_0200
     * @tc.desc   Verify Queue union getFirst does not remove elements, add appends to the tail, and NaN head is preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<UnionAllValue> = new Queue<UnionAllValue>();
      queue.add(100);
      queue.add(true);
      queue.add(100);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(100);
      expect(queue.getFirst()).assertEqual(100);
      expect(queue.length).assertEqual(3);

      queue.add(null);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(100);

      const nanQueue: Queue<UnionAllValue> = new Queue<UnionAllValue>();
      nanQueue.add(NaN);
      expect(nanQueue.getFirst()).assertNaN();
    });

    /**
     * @tc.name   testQueueUnionTest0300
     * @tc.number SUB_ARKTS_QUEUE_UNION_0300
     * @tc.desc   Verify Queue union pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<UnionAllValue> = new Queue<UnionAllValue>();
      queue.add(3);
      queue.add(1);
      queue.add(2);
      queue.add(4);

      const first: UnionAllValue = queue.pop();
      expect(first).assertEqual(3);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(1);

      const second: UnionAllValue = queue.pop();
      expect(second).assertEqual(1);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueUnionTest0400
     * @tc.number SUB_ARKTS_QUEUE_UNION_0400
     * @tc.desc   Verify Queue union forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<UnionAllValue> = new Queue<UnionAllValue>();
      queue.add(1);
      queue.add(true);
      queue.add(null);

      const collected: Array<UnionAllValue> = [];
      queue.forEach((value: UnionAllValue) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertTrue();
      expect(collected[2]).assertNull();

      let indexSum: number = 0;
      queue.forEach((value: UnionAllValue, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueUnionTest0500
     * @tc.number SUB_ARKTS_QUEUE_UNION_0500
     * @tc.desc   Verify Queue union Symbol.iterator and for-of traverse values of different types in FIFO order including bigint and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<UnionAllValue> = new Queue<UnionAllValue>();
      queue.add(5);
      queue.add(100n);
      queue.add(undefined);

      const iterValues: Array<UnionAllValue> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<UnionAllValue> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(5);
      expect(iterValues[1]).assertEqual(100n);
      expect(iterValues[2]).assertUndefined();

      let count: number = 0;
      for (const value of queue) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueUnionTest0600
     * @tc.number SUB_ARKTS_QUEUE_UNION_0600
     * @tc.desc   Verify empty Queue union pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<UnionAllValue> = new Queue<UnionAllValue>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(9)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(9);
      expect(queue.pop()).assertEqual(9);
      expect(queue.length).assertEqual(0);
    });
  });
}
