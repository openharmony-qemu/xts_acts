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

interface BooleanInvalidObject {
  marker: string;
}

const BOOLEAN_INVALID_OBJECT: BooleanInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<boolean> = [true, false, true, false];

type BooleanInvalidValue = number | string | null | undefined | BooleanInvalidObject | Array<number>;
type BooleanAllValue = boolean | BooleanInvalidValue;

const ALL_VALUES: Array<BooleanAllValue> = [
  ...VALID_VALUES,
  1, 0, NaN, 'true', 'false', null, undefined, '', BOOLEAN_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueBooleanTest() {
  describe('QueueBooleanTest', () => {
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
     * @tc.name   testQueueBooleanTest0100
     * @tc.number SUB_ARKTS_QUEUE_BOOLEAN_0100
     * @tc.desc   Verify Queue boolean add returns true, length accumulates, getFirst and pop follow FIFO order on empty and populated queues including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<boolean> = new Queue<boolean>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<boolean> = new Queue<boolean>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertTrue();
      expect(queue.pop()).assertTrue();
      expect(queue.getFirst()).assertFalse();

      const mixed: Queue<BooleanAllValue> = new Queue<BooleanAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertTrue();
    });

    /**
     * @tc.name   testQueueBooleanTest0200
     * @tc.number SUB_ARKTS_QUEUE_BOOLEAN_0200
     * @tc.desc   Verify Queue boolean getFirst does not remove elements and add appends to the tail without changing the head
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<boolean> = new Queue<boolean>();
      queue.add(true);
      queue.add(false);
      queue.add(true);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertTrue();
      expect(queue.getFirst()).assertTrue();
      expect(queue.length).assertEqual(3);

      queue.add(false);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertTrue();
    });

    /**
     * @tc.name   testQueueBooleanTest0300
     * @tc.number SUB_ARKTS_QUEUE_BOOLEAN_0300
     * @tc.desc   Verify Queue boolean pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<boolean> = new Queue<boolean>();
      queue.add(true);
      queue.add(false);
      queue.add(true);
      queue.add(true);

      const first: boolean = queue.pop();
      expect(first).assertTrue();
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertFalse();

      const second: boolean = queue.pop();
      expect(second).assertFalse();
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueBooleanTest0400
     * @tc.number SUB_ARKTS_QUEUE_BOOLEAN_0400
     * @tc.desc   Verify Queue boolean forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<boolean> = new Queue<boolean>();
      queue.add(true);
      queue.add(false);
      queue.add(true);

      let trueCount: number = 0;
      const visited: Array<boolean> = [];
      queue.forEach((value: boolean) => {
        visited.push(value);
        if (value) {
          trueCount++;
        }
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertTrue();
      expect(visited[1]).assertFalse();
      expect(trueCount).assertEqual(2);

      let indexSum: number = 0;
      queue.forEach((value: boolean, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueBooleanTest0500
     * @tc.number SUB_ARKTS_QUEUE_BOOLEAN_0500
     * @tc.desc   Verify Queue boolean Symbol.iterator and for-of traverse values in FIFO order counting true values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<boolean> = new Queue<boolean>();
      queue.add(false);
      queue.add(true);
      queue.add(false);

      const iterValues: Array<boolean> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<boolean> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertFalse();
      expect(iterValues[1]).assertTrue();

      let trueCount: number = 0;
      for (const value of queue) {
        if (value) {
          trueCount++;
        }
      }
      expect(trueCount).assertEqual(1);
    });

    /**
     * @tc.name   testQueueBooleanTest0600
     * @tc.number SUB_ARKTS_QUEUE_BOOLEAN_0600
     * @tc.desc   Verify empty Queue boolean pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<boolean> = new Queue<boolean>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(true)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertTrue();
      expect(queue.pop()).assertTrue();
      expect(queue.length).assertEqual(0);
    });
  });
}
