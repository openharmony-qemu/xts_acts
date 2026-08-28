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

interface SetInvalidObject {
  marker: string;
}

const SET_INVALID_OBJECT: SetInvalidObject = { marker: 'invalid' };

const SET_A: Set<number> = new Set<number>([1]);
const SET_B: Set<number> = new Set<number>([2]);
const SET_C: Set<number> = new Set<number>([3]);
const SET_D: Set<number> = new Set<number>([0, -1]);
const SET_E: Set<number> = new Set<number>([NaN, Infinity]);
const SET_F: Set<number> = new Set<number>([Number.MAX_SAFE_INTEGER]);
const SET_G: Set<number> = new Set<number>();

const VALID_VALUES: Array<Set<number>> = [SET_A, SET_B, SET_C, SET_D, SET_E, SET_F, SET_G, SET_A];

type SetInvalidValue = string | number | null | undefined | SetInvalidObject | Array<number>;
type SetAllValue = Set<number> | SetInvalidValue;

const ALL_VALUES: Array<SetAllValue> = [
  ...VALID_VALUES,
  '1', 123, null, undefined, SET_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueSetTest() {
  describe('QueueSetTest', () => {
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
     * @tc.name   testQueueSetTest0100
     * @tc.number SUB_ARKTS_QUEUE_SET_0100
     * @tc.desc   Verify Queue of Set instances add returns true, length accumulates, getFirst and pop follow FIFO order preserving reference identity, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<Set<number>> = new Queue<Set<number>>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<Set<number>> = new Queue<Set<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(SET_A);
      const popped: Set<number> = queue.pop();
      expect(popped).assertEqual(SET_A);
      expect(queue.getFirst()).assertEqual(SET_B);

      const mixed: Queue<SetAllValue> = new Queue<SetAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(SET_A);
    });

    /**
     * @tc.name   testQueueSetTest0200
     * @tc.number SUB_ARKTS_QUEUE_SET_0200
     * @tc.desc   Verify Queue of Set instances getFirst does not remove elements and add appends to the tail, head Set members remaining queryable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Set<number>> = new Queue<Set<number>>();
      queue.add(SET_A);
      queue.add(SET_B);
      queue.add(SET_A);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(SET_A);
      expect(queue.getFirst()).assertEqual(SET_A);
      expect(queue.length).assertEqual(3);

      queue.add(SET_D);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(SET_A);
      expect(queue.getFirst().has(1)).assertTrue();
    });

    /**
     * @tc.name   testQueueSetTest0300
     * @tc.number SUB_ARKTS_QUEUE_SET_0300
     * @tc.desc   Verify Queue of Set instances pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Set<number>> = new Queue<Set<number>>();
      queue.add(SET_A);
      queue.add(SET_B);
      queue.add(SET_C);
      queue.add(SET_D);

      const first: Set<number> = queue.pop();
      expect(first).assertEqual(SET_A);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(SET_B);

      const second: Set<number> = queue.pop();
      expect(second).assertEqual(SET_B);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueSetTest0400
     * @tc.number SUB_ARKTS_QUEUE_SET_0400
     * @tc.desc   Verify Queue of Set instances forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Set<number>> = new Queue<Set<number>>();
      queue.add(SET_A);
      queue.add(SET_D);
      queue.add(SET_G);

      const sizes: Array<number> = [];
      queue.forEach((value: Set<number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[0]).assertEqual(1);
      expect(sizes[1]).assertEqual(2);
      expect(sizes[2]).assertEqual(0);

      let indexSum: number = 0;
      queue.forEach((value: Set<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueSetTest0500
     * @tc.number SUB_ARKTS_QUEUE_SET_0500
     * @tc.desc   Verify Queue of Set instances Symbol.iterator and for-of traverse values in FIFO order keeping Set instance types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Set<number>> = new Queue<Set<number>>();
      queue.add(SET_E);
      queue.add(SET_F);
      queue.add(SET_G);

      const iterValues: Array<Set<number>> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<Set<number>> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(SET_E);
      expect(iterValues[2].size).assertEqual(0);

      let count: number = 0;
      for (const value of queue) {
        expect(value instanceof Set).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueSetTest0600
     * @tc.number SUB_ARKTS_QUEUE_SET_0600
     * @tc.desc   Verify empty Queue of Set instances pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueSetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Set<number>> = new Queue<Set<number>>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(SET_F)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(SET_F);
      expect(queue.pop()).assertEqual(SET_F);
      expect(queue.length).assertEqual(0);
    });
  });
}
