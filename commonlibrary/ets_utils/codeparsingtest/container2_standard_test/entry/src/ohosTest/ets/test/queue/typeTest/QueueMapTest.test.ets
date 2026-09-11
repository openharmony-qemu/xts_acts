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

interface MapInvalidObject {
  marker: string;
}

const MAP_INVALID_OBJECT: MapInvalidObject = { marker: 'invalid' };

const MAP_A: Map<string, number> = new Map<string, number>();
const MAP_B: Map<string, number> = new Map<string, number>();
const MAP_C: Map<string, number> = new Map<string, number>();
const MAP_D: Map<string, number> = new Map<string, number>();
const MAP_E: Map<string, number> = new Map<string, number>();
const MAP_F: Map<string, number> = new Map<string, number>();
const MAP_G: Map<string, number> = new Map<string, number>();

MAP_A.set('a', 1);
MAP_B.set('b', 2);
MAP_C.set('c', 3);
MAP_D.set('', 0);
MAP_E.set('​', -1);
MAP_F.set('max', Number.MAX_SAFE_INTEGER);

const VALID_VALUES: Array<Map<string, number>> = [MAP_A, MAP_B, MAP_C, MAP_D, MAP_E, MAP_F, MAP_G, MAP_A];

type MapInvalidValue = string | number | null | undefined | MapInvalidObject | Array<number>;
type MapAllValue = Map<string, number> | MapInvalidValue;

const ALL_VALUES: Array<MapAllValue> = [
  ...VALID_VALUES,
  'key', 123, null, undefined, MAP_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueMapTest() {
  describe('QueueMapTest', () => {
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
     * @tc.name   testQueueMapTest0100
     * @tc.number SUB_ARKTS_QUEUE_MAP_0100
     * @tc.desc   Verify Queue of Map instances add returns true, length accumulates, getFirst and pop follow FIFO order preserving reference identity, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<Map<string, number>> = new Queue<Map<string, number>>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<Map<string, number>> = new Queue<Map<string, number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(MAP_A);
      const popped: Map<string, number> = queue.pop();
      expect(popped).assertEqual(MAP_A);
      expect(queue.getFirst()).assertEqual(MAP_B);

      const mixed: Queue<MapAllValue> = new Queue<MapAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(MAP_A);
    });

    /**
     * @tc.name   testQueueMapTest0200
     * @tc.number SUB_ARKTS_QUEUE_MAP_0200
     * @tc.desc   Verify Queue of Map instances getFirst does not remove elements and add appends to the tail, head Map entries remaining accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Map<string, number>> = new Queue<Map<string, number>>();
      queue.add(MAP_A);
      queue.add(MAP_B);
      queue.add(MAP_A);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(MAP_A);
      expect(queue.getFirst()).assertEqual(MAP_A);
      expect(queue.length).assertEqual(3);

      queue.add(MAP_C);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(MAP_A);
      expect(queue.getFirst().get('a')).assertEqual(1);
    });

    /**
     * @tc.name   testQueueMapTest0300
     * @tc.number SUB_ARKTS_QUEUE_MAP_0300
     * @tc.desc   Verify Queue of Map instances pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Map<string, number>> = new Queue<Map<string, number>>();
      queue.add(MAP_A);
      queue.add(MAP_B);
      queue.add(MAP_C);
      queue.add(MAP_D);

      const first: Map<string, number> = queue.pop();
      expect(first).assertEqual(MAP_A);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(MAP_B);

      const second: Map<string, number> = queue.pop();
      expect(second).assertEqual(MAP_B);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueMapTest0400
     * @tc.number SUB_ARKTS_QUEUE_MAP_0400
     * @tc.desc   Verify Queue of Map instances forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Map<string, number>> = new Queue<Map<string, number>>();
      queue.add(MAP_A);
      queue.add(MAP_B);
      queue.add(MAP_C);

      const sizes: Array<number> = [];
      queue.forEach((value: Map<string, number>) => {
        sizes.push(value.size);
      });
      expect(sizes.length).assertEqual(3);
      expect(sizes[0]).assertEqual(1);
      expect(sizes[1]).assertEqual(1);
      expect(sizes[2]).assertEqual(1);

      let indexSum: number = 0;
      queue.forEach((value: Map<string, number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueMapTest0500
     * @tc.number SUB_ARKTS_QUEUE_MAP_0500
     * @tc.desc   Verify Queue of Map instances Symbol.iterator and for-of traverse values in FIFO order keeping Map instance types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Map<string, number>> = new Queue<Map<string, number>>();
      queue.add(MAP_A);
      queue.add(MAP_F);
      queue.add(MAP_G);

      const iterValues: Array<Map<string, number>> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<Map<string, number>> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(MAP_A);
      expect(iterValues[2].size).assertEqual(0);

      let count: number = 0;
      for (const value of queue) {
        expect(value instanceof Map).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueMapTest0600
     * @tc.number SUB_ARKTS_QUEUE_MAP_0600
     * @tc.desc   Verify empty Queue of Map instances pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<Map<string, number>> = new Queue<Map<string, number>>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();

      const emptyIter = queue[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      expect(queue.add(MAP_D)).assertTrue();
      expect(queue.length).assertEqual(1);
      expect(queue.getFirst()).assertEqual(MAP_D);
      expect(queue.pop()).assertEqual(MAP_D);
      expect(queue.length).assertEqual(0);
    });
  });
}
