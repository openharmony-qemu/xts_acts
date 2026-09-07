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

interface ArrayObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}

interface ObjectInvalidObject {
  marker: string;
}

const OBJECT_INVALID_OBJECT: ObjectInvalidObject = { marker: 'invalid' };

const OBJECT_A: ArrayObjectItem = { id: 1, label: '', name: '测试', age: 20 };
const OBJECT_B: ArrayObjectItem = { id: 2, label: '测试😀', grade: 3, className: 'A' };
const OBJECT_C: ArrayObjectItem = { id: 3, label: 'a'.repeat(100), extra: Number.MAX_SAFE_INTEGER };
const OBJECT_D: ArrayObjectItem = { id: 4, label: '13800138000', name: '138****8000' };
const OBJECT_E: ArrayObjectItem = { id: 5, label: 'test@example.com' };
const OBJECT_F: ArrayObjectItem = { id: 6, label: 'https://test.com', grade: -1 };

const VALID_VALUES: Array<ArrayObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];

type ObjectAllValue = ArrayObjectItem | number | string | null | undefined | ObjectInvalidObject;

const ALL_VALUES: Array<ObjectAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, OBJECT_INVALID_OBJECT,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueObjectTest() {
  describe('QueueObjectTest', () => {
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
     * @tc.name   testQueueObjectTest0100
     * @tc.number SUB_ARKTS_QUEUE_OBJECT_0100
     * @tc.desc   Verify Queue of object literals add returns true, length accumulates, getFirst and pop follow FIFO order preserving reference identity, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<ArrayObjectItem> = new Queue<ArrayObjectItem>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<ArrayObjectItem> = new Queue<ArrayObjectItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(OBJECT_A);
      const popped: ArrayObjectItem = queue.pop();
      expect(popped).assertEqual(OBJECT_A);
      expect(queue.getFirst()).assertEqual(OBJECT_B);

      const mixed: Queue<ObjectAllValue> = new Queue<ObjectAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(OBJECT_A);
    });

    /**
     * @tc.name   testQueueObjectTest0200
     * @tc.number SUB_ARKTS_QUEUE_OBJECT_0200
     * @tc.desc   Verify Queue of object literals getFirst does not remove elements and add appends to the tail, head object properties remaining accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayObjectItem> = new Queue<ArrayObjectItem>();
      queue.add(OBJECT_A);
      queue.add(OBJECT_B);
      queue.add(OBJECT_A);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(OBJECT_A);
      expect(queue.getFirst()).assertEqual(OBJECT_A);
      expect(queue.length).assertEqual(3);

      queue.add(OBJECT_C);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(OBJECT_A);
      expect(queue.getFirst().id).assertEqual(1);
    });

    /**
     * @tc.name   testQueueObjectTest0300
     * @tc.number SUB_ARKTS_QUEUE_OBJECT_0300
     * @tc.desc   Verify Queue of object literals pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayObjectItem> = new Queue<ArrayObjectItem>();
      queue.add(OBJECT_A);
      queue.add(OBJECT_B);
      queue.add(OBJECT_C);
      queue.add(OBJECT_D);

      const first: ArrayObjectItem = queue.pop();
      expect(first).assertEqual(OBJECT_A);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(OBJECT_B);

      const second: ArrayObjectItem = queue.pop();
      expect(second).assertEqual(OBJECT_B);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueObjectTest0400
     * @tc.number SUB_ARKTS_QUEUE_OBJECT_0400
     * @tc.desc   Verify Queue of object literals forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayObjectItem> = new Queue<ArrayObjectItem>();
      queue.add(OBJECT_A);
      queue.add(OBJECT_B);
      queue.add(OBJECT_C);

      const ids: Array<number> = [];
      queue.forEach((value: ArrayObjectItem) => {
        ids.push(value.id);
      });
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(3);

      let indexSum: number = 0;
      queue.forEach((value: ArrayObjectItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueObjectTest0500
     * @tc.number SUB_ARKTS_QUEUE_OBJECT_0500
     * @tc.desc   Verify Queue of object literals Symbol.iterator and for-of traverse values in FIFO order with properties intact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayObjectItem> = new Queue<ArrayObjectItem>();
      queue.add(OBJECT_A);
      queue.add(OBJECT_E);
      queue.add(OBJECT_F);

      const iterValues: Array<ArrayObjectItem> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<ArrayObjectItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(OBJECT_A);
      expect(iterValues[2]).assertEqual(OBJECT_F);

      let count: number = 0;
      for (const value of queue) {
        expect(value.id > 0).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueObjectTest0600
     * @tc.number SUB_ARKTS_QUEUE_OBJECT_0600
     * @tc.desc   Verify empty Queue of object literals pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<ArrayObjectItem> = new Queue<ArrayObjectItem>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(OBJECT_D)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(OBJECT_D);
      expect(queue.pop()).assertEqual(OBJECT_D);
      expect(queue.length).assertEqual(0);
    });
  });
}
