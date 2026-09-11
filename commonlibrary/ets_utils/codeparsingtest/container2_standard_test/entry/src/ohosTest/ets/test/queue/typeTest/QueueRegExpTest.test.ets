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

interface RegExpInvalidObject {
  marker: string;
}

const REGEXP_INVALID_OBJECT: RegExpInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<RegExp> = [
  /abc/gi, /def/m, /^test$/u, new RegExp(''), /测试😀/u, /[ -]/g, /abc/gi,
];

type RegExpInvalidValue = string | number | null | undefined | RegExpInvalidObject | Array<number>;
type RegExpAllValue = RegExp | RegExpInvalidValue;

const ALL_VALUES: Array<RegExpAllValue> = [
  ...VALID_VALUES,
  'abc', 123, null, undefined, REGEXP_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueRegExpTest() {
  describe('QueueRegExpTest', () => {
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
     * @tc.name   testQueueRegExpTest0100
     * @tc.number SUB_ARKTS_QUEUE_REGEXP_0100
     * @tc.desc   Verify Queue of RegExp add returns true, length accumulates, getFirst and pop follow FIFO order keeping patterns matchable, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<RegExp> = new Queue<RegExp>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<RegExp> = new Queue<RegExp>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(queue.getFirst().test('ABC')).assertTrue();
      const popped: RegExp = queue.pop();
      expect(popped).assertEqual(VALID_VALUES[0]);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[1]);

      const mixed: Queue<RegExpAllValue> = new Queue<RegExpAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testQueueRegExpTest0200
     * @tc.number SUB_ARKTS_QUEUE_REGEXP_0200
     * @tc.desc   Verify Queue of RegExp getFirst does not remove elements and add appends to the tail without changing the head
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<RegExp> = new Queue<RegExp>();
      queue.add(VALID_VALUES[0]);
      queue.add(VALID_VALUES[1]);
      queue.add(VALID_VALUES[0]);

      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(queue.length).assertEqual(3);

      queue.add(VALID_VALUES[4]);
      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testQueueRegExpTest0300
     * @tc.number SUB_ARKTS_QUEUE_REGEXP_0300
     * @tc.desc   Verify Queue of RegExp pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<RegExp> = new Queue<RegExp>();
      queue.add(VALID_VALUES[0]);
      queue.add(VALID_VALUES[1]);
      queue.add(VALID_VALUES[2]);
      queue.add(VALID_VALUES[3]);

      const first: RegExp = queue.pop();
      expect(first).assertEqual(VALID_VALUES[0]);
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual(VALID_VALUES[1]);

      const second: RegExp = queue.pop();
      expect(second).assertEqual(VALID_VALUES[1]);
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueRegExpTest0400
     * @tc.number SUB_ARKTS_QUEUE_REGEXP_0400
     * @tc.desc   Verify Queue of RegExp forEach visits values in insertion order exposing their source patterns and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<RegExp> = new Queue<RegExp>();
      queue.add(VALID_VALUES[0]);
      queue.add(VALID_VALUES[2]);
      queue.add(VALID_VALUES[4]);

      const sources: Array<string> = [];
      queue.forEach((value: RegExp) => {
        sources.push(value.source);
      });
      expect(sources.length).assertEqual(3);
      expect(sources[0]).assertEqual('abc');
      expect(sources[1]).assertEqual('^test$');
      expect(sources[2]).assertEqual('测试😀');

      let indexSum: number = 0;
      queue.forEach((value: RegExp, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueRegExpTest0500
     * @tc.number SUB_ARKTS_QUEUE_REGEXP_0500
     * @tc.desc   Verify Queue of RegExp Symbol.iterator and for-of traverse values in FIFO order keeping RegExp instance types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<RegExp> = new Queue<RegExp>();
      queue.add(VALID_VALUES[0]);
      queue.add(VALID_VALUES[3]);
      queue.add(VALID_VALUES[5]);

      const iterValues: Array<RegExp> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<RegExp> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(VALID_VALUES[0]);
      expect(iterValues[2]).assertEqual(VALID_VALUES[5]);

      let count: number = 0;
      for (const value of queue) {
        expect(value instanceof RegExp).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   testQueueRegExpTest0600
     * @tc.number SUB_ARKTS_QUEUE_REGEXP_0600
     * @tc.desc   Verify empty Queue of RegExp pop getFirst and iterator return undefined or done, then add-pop round trip works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<RegExp> = new Queue<RegExp>();
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
