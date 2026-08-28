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

export default function queueNestedTest() {
  describe('QueueNestedTest', () => {
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
     * @tc.name   testQueueNestedTest0100
     * @tc.number SUB_ARKTS_QUEUE_NESTED_0100
     * @tc.desc   Verify Queue of number arrays add returns true, length accumulates, getFirst and pop follow FIFO order with inner elements accessible, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNestedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<Array<number>> = new Queue<Array<number>>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(queue.getFirst()[1]).assertEqual(2);
      const popped: Array<number> = queue.pop();
      expect(popped).assertEqual(VALID_VALUES[0]);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[1]);

      const mixed: Queue<NestedAllValue> = new Queue<NestedAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testQueueNestedTest0200
     * @tc.number SUB_ARKTS_QUEUE_NESTED_0200
     * @tc.desc   Verify Queue of number arrays getFirst does not remove elements and add appends to the tail without changing the head
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNestedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      queue.add(VALID_VALUES[0]);
      queue.add(VALID_VALUES[1]);
      queue.add(VALID_VALUES[0]);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(queue.length).assertEqual(3);

      queue.add(VALID_VALUES[5]);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testQueueNestedTest0300
     * @tc.number SUB_ARKTS_QUEUE_NESTED_0300
     * @tc.desc   Verify Queue of number arrays pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNestedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      queue.add(VALID_VALUES[0]);
      queue.add(VALID_VALUES[1]);
      queue.add(VALID_VALUES[2]);
      queue.add(VALID_VALUES[3]);

      const first: Array<number> = queue.pop();
      expect(first).assertEqual(VALID_VALUES[0]);
      expect(first[2]).assertEqual(3);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[1]);

      const second: Array<number> = queue.pop();
      expect(second).assertEqual(VALID_VALUES[1]);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueNestedTest0400
     * @tc.number SUB_ARKTS_QUEUE_NESTED_0400
     * @tc.desc   Verify Queue of number arrays forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNestedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      queue.add(VALID_VALUES[0]);
      queue.add(VALID_VALUES[1]);
      queue.add(VALID_VALUES[4]);

      const lengths: Array<number> = [];
      queue.forEach((value: Array<number>) => {
        lengths.push(value.length);
      });
      expect(lengths.length).assertEqual(3);
      expect(lengths[0]).assertEqual(3);
      expect(lengths[1]).assertEqual(2);
      expect(lengths[2]).assertEqual(0);

      let indexSum: number = 0;
      queue.forEach((value: Array<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueNestedTest0500
     * @tc.number SUB_ARKTS_QUEUE_NESTED_0500
     * @tc.desc   Verify Queue of number arrays Symbol.iterator and for-of traverse values in FIFO order keeping Array instance types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNestedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      queue.add(VALID_VALUES[0]);
      queue.add(VALID_VALUES[5]);
      queue.add(VALID_VALUES[4]);

      const iterValues: Array<Array<number>> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<Array<number>> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(VALID_VALUES[0]);
      expect(iterValues[2]).assertEqual(VALID_VALUES[4]);

      let count: number = 0;
      for (const value of queue) {
        expect(value instanceof Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueNestedTest0600
     * @tc.number SUB_ARKTS_QUEUE_NESTED_0600
     * @tc.desc   Verify empty Queue of number arrays pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueNestedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(VALID_VALUES[2])).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[2]);
      expect(queue.pop()).assertEqual(VALID_VALUES[2]);
      expect(queue.length).assertEqual(0);
    });
  });
}
