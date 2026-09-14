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

interface ClassInvalidObject {
  marker: string;
}

const CLASS_INVALID_OBJECT: ClassInvalidObject = { marker: 'invalid' };

class ArrayClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const CLASS_A = new ArrayClassItem(1, '测试');
const CLASS_B = new ArrayClassItem(0, '');
const CLASS_C = new ArrayClassItem(-1, '测试😀');
const CLASS_D = new ArrayClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E = new ArrayClassItem(13800138000, '13800138000');
const CLASS_F = new ArrayClassItem(99999999, '<script>alert(1)</script>');

const VALID_VALUES: Array<ArrayClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];

type ClassInvalidValue = number | string | null | undefined | ClassInvalidObject | Array<number>;
type ClassAllValue = ArrayClassItem | ClassInvalidValue;

const ALL_VALUES: Array<ClassAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, CLASS_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueClassTest() {
  describe('QueueClassTest', () => {
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
     * @tc.name   testQueueClassTest0100
     * @tc.number SUB_ARKTS_QUEUE_CLASS_0100
     * @tc.desc   Verify Queue of class instances add returns true, length accumulates, getFirst and pop follow FIFO order preserving reference identity, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<ArrayClassItem> = new Queue<ArrayClassItem>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<ArrayClassItem> = new Queue<ArrayClassItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(CLASS_A);
      const popped: ArrayClassItem = queue.pop();
      expect(popped).assertEqual(CLASS_A);
      expect(queue.getFirst()).assertEqual(CLASS_B);

      const mixed: Queue<ClassAllValue> = new Queue<ClassAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(CLASS_A);
    });

    /**
     * @tc.name   testQueueClassTest0200
     * @tc.number SUB_ARKTS_QUEUE_CLASS_0200
     * @tc.desc   Verify Queue of class instances getFirst does not remove elements and add appends to the tail keeping the head reference unchanged, including shared duplicate instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayClassItem> = new Queue<ArrayClassItem>();
      queue.add(CLASS_A);
      queue.add(CLASS_B);
      queue.add(CLASS_A);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(CLASS_A);
      expect(queue.getFirst()).assertEqual(CLASS_A);
      expect(queue.length).assertEqual(3);

      queue.add(CLASS_C);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(CLASS_A);
      expect(queue.getFirst().id).assertEqual(1);

      const shared: Queue<ArrayClassItem> = new Queue<ArrayClassItem>();
      shared.add(CLASS_E);
      shared.add(CLASS_E);
      expect(shared.getFirst()).assertEqual(CLASS_E);
    });

    /**
     * @tc.name   testQueueClassTest0300
     * @tc.number SUB_ARKTS_QUEUE_CLASS_0300
     * @tc.desc   Verify Queue of class instances pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayClassItem> = new Queue<ArrayClassItem>();
      queue.add(CLASS_A);
      queue.add(CLASS_B);
      queue.add(CLASS_C);
      queue.add(CLASS_D);

      const first: ArrayClassItem = queue.pop();
      expect(first).assertEqual(CLASS_A);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(CLASS_B);

      const second: ArrayClassItem = queue.pop();
      expect(second).assertEqual(CLASS_B);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueClassTest0400
     * @tc.number SUB_ARKTS_QUEUE_CLASS_0400
     * @tc.desc   Verify Queue of class instances forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayClassItem> = new Queue<ArrayClassItem>();
      queue.add(CLASS_A);
      queue.add(CLASS_B);
      queue.add(CLASS_C);

      const ids: Array<number> = [];
      queue.forEach((value: ArrayClassItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(0);
      expect(ids[2]).assertEqual(-1);

      let indexSum: number = 0;
      queue.forEach((value: ArrayClassItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueClassTest0500
     * @tc.number SUB_ARKTS_QUEUE_CLASS_0500
     * @tc.desc   Verify Queue of class instances Symbol.iterator and for-of traverse values in FIFO order keeping instance types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayClassItem> = new Queue<ArrayClassItem>();
      queue.add(CLASS_A);
      queue.add(CLASS_B);
      queue.add(CLASS_C);

      const iterValues: Array<ArrayClassItem> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<ArrayClassItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(CLASS_A);
      expect(iterValues[2]).assertEqual(CLASS_C);

      let count: number = 0;
      for (const value of queue) {
        expect(value instanceof ArrayClassItem).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueClassTest0600
     * @tc.number SUB_ARKTS_QUEUE_CLASS_0600
     * @tc.desc   Verify empty Queue of class instances pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayClassItem> = new Queue<ArrayClassItem>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(CLASS_F)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(CLASS_F);
      expect(queue.pop()).assertEqual(CLASS_F);
      expect(queue.length).assertEqual(0);
    });
  });
}
