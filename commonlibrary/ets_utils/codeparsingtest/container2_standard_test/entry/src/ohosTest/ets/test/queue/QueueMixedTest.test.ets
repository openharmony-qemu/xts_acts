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

export default function queueMixedTest() {
  describe('QueueMixedTest', () => {
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
     * @tc.name   testQueueMixedTest0100
     * @tc.number SUB_ARKTS_QUEUE_MIXED_0100
     * @tc.desc   Verify Queue of mixed-type values add returns true, length accumulates, getFirst and pop follow FIFO order across number string boolean bigint null undefined object and array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMixedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<MixedItem> = new Queue<MixedItem>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<MixedItem> = new Queue<MixedItem>();
      for (let i = 0; i < MIXED_VALUES.length; i++) {
        expect(queue.add(MIXED_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(MIXED_VALUES.length);
      expect(queue.getFirst()).assertEqual(1);
      expect(queue.pop()).assertEqual(1);
      expect(queue.getFirst()).assertEqual('text');
      expect(queue.length).assertEqual(MIXED_VALUES.length - 1);
    });

    /**
     * @tc.name   testQueueMixedTest0200
     * @tc.number SUB_ARKTS_QUEUE_MIXED_0200
     * @tc.desc   Verify Queue mixed getFirst does not remove elements and add appends to the tail, head object keeping its class instance type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMixedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<MixedItem> = new Queue<MixedItem>();
      const obj: MixedClass = new MixedClass(1);
      queue.add(obj);
      queue.add('dup');
      queue.add(obj);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(obj);
      expect(queue.getFirst()).assertEqual(obj);
      expect(queue.length).assertEqual(3);

      queue.add(null);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(obj);
      const gotObj: MixedItem = queue.getFirst() as MixedItem;
      expect(gotObj instanceof MixedClass).assertTrue();
    });

    /**
     * @tc.name   testQueueMixedTest0300
     * @tc.number SUB_ARKTS_QUEUE_MIXED_0300
     * @tc.desc   Verify Queue mixed pop removes elements of different types in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMixedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<MixedItem> = new Queue<MixedItem>();
      queue.add(1);
      queue.add('b');
      queue.add(true);
      queue.add(null);

      const first: MixedItem = queue.pop();
      expect(first).assertEqual(1);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual('b');

      const second: MixedItem = queue.pop();
      expect(second).assertEqual('b');
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueMixedTest0400
     * @tc.number SUB_ARKTS_QUEUE_MIXED_0400
     * @tc.desc   Verify Queue mixed forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMixedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<MixedItem> = new Queue<MixedItem>();
      queue.add(1);
      queue.add('b');
      queue.add(true);

      const collected: Array<MixedItem> = [];
      queue.forEach((value: MixedItem) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual('b');
      expect(collected[2]).assertTrue();

      let indexSum: number = 0;
      queue.forEach((value: MixedItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueMixedTest0500
     * @tc.number SUB_ARKTS_QUEUE_MIXED_0500
     * @tc.desc   Verify Queue mixed Symbol.iterator and for-of traverse values of different types in FIFO order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMixedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<MixedItem> = new Queue<MixedItem>();
      queue.add(30);
      queue.add('10');
      queue.add(100n);

      const iterValues: Array<MixedItem> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<MixedItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(30);
      expect(iterValues[1]).assertEqual('10');
      expect(iterValues[2]).assertEqual(100n);

      let count: number = 0;
      for (const value of queue) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueMixedTest0600
     * @tc.number SUB_ARKTS_QUEUE_MIXED_0600
     * @tc.desc   Verify empty Queue mixed pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMixedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<MixedItem> = new Queue<MixedItem>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add('x')).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual('x');
      expect(queue.pop()).assertEqual('x');
      expect(queue.length).assertEqual(0);
    });
  });
}
