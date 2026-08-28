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

interface DateInvalidObject {
  marker: string;
}

const DATE_INVALID_OBJECT: DateInvalidObject = { marker: 'invalid' };

const DATE_A: Date = new Date('2026-03-05');
const DATE_B: Date = new Date(0);
const DATE_C: Date = new Date(86400000);
const DATE_D: Date = new Date(-8640000000000000);
const DATE_E: Date = new Date(8640000000000000);
const DATE_F: Date = new Date(NaN);

const VALID_VALUES: Array<Date> = [DATE_A, DATE_B, DATE_C, DATE_D, DATE_E, DATE_F, DATE_A];

type DateInvalidValue = string | number | null | undefined | DateInvalidObject | Array<number>;
type DateAllValue = Date | DateInvalidValue;

const ALL_VALUES: Array<DateAllValue> = [
  ...VALID_VALUES,
  '2026-03-05', 0, null, undefined, DATE_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueDateTest() {
  describe('QueueDateTest', () => {
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
     * @tc.name   testQueueDateTest0100
     * @tc.number SUB_ARKTS_QUEUE_DATE_0100
     * @tc.desc   Verify Queue Date add returns true, length accumulates, getFirst and pop follow FIFO order preserving reference identity, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueDateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<Date> = new Queue<Date>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<Date> = new Queue<Date>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(DATE_A);
      const popped: Date = queue.pop();
      expect(popped).assertEqual(DATE_A);
      expect(queue.getFirst()).assertEqual(DATE_B);

      const mixed: Queue<DateAllValue> = new Queue<DateAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(DATE_A);
    });

    /**
     * @tc.name   testQueueDateTest0200
     * @tc.number SUB_ARKTS_QUEUE_DATE_0200
     * @tc.desc   Verify Queue Date getFirst does not remove elements and add appends to the tail, including an invalid NaN date whose getTime is NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueDateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Date> = new Queue<Date>();
      queue.add(DATE_A);
      queue.add(DATE_B);
      queue.add(DATE_A);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(DATE_A);
      expect(queue.getFirst()).assertEqual(DATE_A);
      expect(queue.length).assertEqual(3);

      queue.add(DATE_C);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(DATE_A);

      const invalidQueue: Queue<Date> = new Queue<Date>();
      invalidQueue.add(DATE_F);
      expect(Number.isNaN(invalidQueue.getFirst().getTime())).assertTrue();
    });

    /**
     * @tc.name   testQueueDateTest0300
     * @tc.number SUB_ARKTS_QUEUE_DATE_0300
     * @tc.desc   Verify Queue Date pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueDateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Date> = new Queue<Date>();
      queue.add(DATE_A);
      queue.add(DATE_B);
      queue.add(DATE_C);
      queue.add(DATE_D);

      const first: Date = queue.pop();
      expect(first).assertEqual(DATE_A);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(DATE_B);

      const second: Date = queue.pop();
      expect(second).assertEqual(DATE_B);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueDateTest0400
     * @tc.number SUB_ARKTS_QUEUE_DATE_0400
     * @tc.desc   Verify Queue Date forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueDateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Date> = new Queue<Date>();
      queue.add(DATE_B);
      queue.add(DATE_A);
      queue.add(DATE_C);

      const times: Array<number> = [];
      queue.forEach((value: Date) => {
        times.push(value.getTime());
      });
      expect(times.length).assertEqual(3);
      expect(times[0]).assertEqual(0);
      expect(times[1]).assertEqual(DATE_A.getTime());
      expect(times[2]).assertEqual(86400000);

      let indexSum: number = 0;
      queue.forEach((value: Date, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueDateTest0500
     * @tc.number SUB_ARKTS_QUEUE_DATE_0500
     * @tc.desc   Verify Queue Date Symbol.iterator and for-of traverse values in FIFO order keeping Date instance types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueDateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Date> = new Queue<Date>();
      queue.add(DATE_A);
      queue.add(DATE_B);
      queue.add(DATE_C);

      const iterValues: Array<Date> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<Date> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(DATE_A);
      expect(iterValues[2]).assertEqual(DATE_C);

      let count: number = 0;
      for (const value of queue) {
        expect(value instanceof Date).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueDateTest0600
     * @tc.number SUB_ARKTS_QUEUE_DATE_0600
     * @tc.desc   Verify empty Queue Date pop getFirst and iterator return undefined or done, then add-pop round trip works with the max boundary date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueDateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Date> = new Queue<Date>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(DATE_E)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(DATE_E);
      expect(queue.pop()).assertEqual(DATE_E);
      expect(queue.length).assertEqual(0);
    });
  });
}
