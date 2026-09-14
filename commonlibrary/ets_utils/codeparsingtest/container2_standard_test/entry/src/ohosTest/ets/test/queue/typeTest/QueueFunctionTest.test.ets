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

interface FunctionInvalidObject {
  marker: string;
}

const FUNCTION_INVALID_OBJECT: FunctionInvalidObject = { marker: 'invalid' };

type ArrayFunctionItem = (value: number) => number;

const FUNCTION_A: ArrayFunctionItem = (value: number): number => value + 1;
const FUNCTION_B: ArrayFunctionItem = (value: number): number => value + 2;
const FUNCTION_C: ArrayFunctionItem = (value: number): number => value + 3;
const FUNCTION_D: ArrayFunctionItem = (value: number): number => value * value;
const FUNCTION_E: ArrayFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: ArrayFunctionItem = (value: number): number => value - 100.5;

const VALID_VALUES: Array<ArrayFunctionItem> = [
  FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A,
];

type FunctionInvalidValue = number | string | null | undefined | FunctionInvalidObject | Array<number>;
type FunctionAllValue = ArrayFunctionItem | FunctionInvalidValue;

const ALL_VALUES: Array<FunctionAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, FUNCTION_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueFunctionTest() {
  describe('QueueFunctionTest', () => {
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
     * @tc.name   testQueueFunctionTest0100
     * @tc.number SUB_ARKTS_QUEUE_FUNCTION_0100
     * @tc.desc   Verify Queue of functions add returns true, length accumulates, getFirst and pop return callable references in FIFO order, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<ArrayFunctionItem> = new Queue<ArrayFunctionItem>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<ArrayFunctionItem> = new Queue<ArrayFunctionItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(FUNCTION_A);
      expect(queue.getFirst()(1)).assertEqual(2);
      const popped: ArrayFunctionItem = queue.pop();
      expect(popped).assertEqual(FUNCTION_A);
      expect(queue.getFirst()).assertEqual(FUNCTION_B);

      const mixed: Queue<FunctionAllValue> = new Queue<FunctionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(FUNCTION_A);
    });

    /**
     * @tc.name   testQueueFunctionTest0200
     * @tc.number SUB_ARKTS_QUEUE_FUNCTION_0200
     * @tc.desc   Verify Queue of functions getFirst does not remove elements and add appends to the tail, with head function remaining callable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayFunctionItem> = new Queue<ArrayFunctionItem>();
      queue.add(FUNCTION_A);
      queue.add(FUNCTION_B);
      queue.add(FUNCTION_A);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(FUNCTION_A);
      expect(queue.getFirst()).assertEqual(FUNCTION_A);
      expect(queue.length).assertEqual(3);

      queue.add(FUNCTION_D);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(FUNCTION_A);
      expect(queue.getFirst()(5)).assertEqual(6);
    });

    /**
     * @tc.name   testQueueFunctionTest0300
     * @tc.number SUB_ARKTS_QUEUE_FUNCTION_0300
     * @tc.desc   Verify Queue of functions pop removes callable elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayFunctionItem> = new Queue<ArrayFunctionItem>();
      queue.add(FUNCTION_A);
      queue.add(FUNCTION_B);
      queue.add(FUNCTION_C);
      queue.add(FUNCTION_D);

      const first: ArrayFunctionItem = queue.pop();
      expect(first).assertEqual(FUNCTION_A);
      expect(first(10)).assertEqual(11);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(FUNCTION_B);

      const second: ArrayFunctionItem = queue.pop();
      expect(second).assertEqual(FUNCTION_B);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueFunctionTest0400
     * @tc.number SUB_ARKTS_QUEUE_FUNCTION_0400
     * @tc.desc   Verify Queue of functions forEach visits values in insertion order invoking them and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayFunctionItem> = new Queue<ArrayFunctionItem>();
      queue.add(FUNCTION_A);
      queue.add(FUNCTION_B);
      queue.add(FUNCTION_C);

      const results: Array<number> = [];
      queue.forEach((value: ArrayFunctionItem) => {
        results.push(value(3));
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(4);
      expect(results[1]).assertEqual(5);
      expect(results[2]).assertEqual(6);

      let indexSum: number = 0;
      queue.forEach((value: ArrayFunctionItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueFunctionTest0500
     * @tc.number SUB_ARKTS_QUEUE_FUNCTION_0500
     * @tc.desc   Verify Queue of functions Symbol.iterator and for-of traverse callable values in FIFO order with correct invocation results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayFunctionItem> = new Queue<ArrayFunctionItem>();
      queue.add(FUNCTION_A);
      queue.add(FUNCTION_E);
      queue.add(FUNCTION_F);

      const iterValues: Array<ArrayFunctionItem> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<ArrayFunctionItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(FUNCTION_A);
      expect(iterValues[2]).assertEqual(FUNCTION_F);

      const forOfResults: Array<number> = [];
      for (const value of queue) {
        forOfResults.push(value(0));
      }
      expect(forOfResults[0]).assertEqual(1);
      expect(forOfResults[1]).assertEqual(0);
      expect(forOfResults[2]).assertEqual(-100.5);
    });

    /**
     * @tc.name   testQueueFunctionTest0600
     * @tc.number SUB_ARKTS_QUEUE_FUNCTION_0600
     * @tc.desc   Verify empty Queue of functions pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayFunctionItem> = new Queue<ArrayFunctionItem>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(FUNCTION_C)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(FUNCTION_C);
      expect(queue.pop()).assertEqual(FUNCTION_C);
      expect(queue.length).assertEqual(0);
    });
  });
}
