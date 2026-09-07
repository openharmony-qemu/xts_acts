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

interface StringInvalidObject {
  marker: string;
}

const STRING_INVALID_OBJECT: StringInvalidObject = { marker: 'invalid' };

type StringDynamicItem = string | null | undefined;

const STRING_SPECIAL_CHARACTERS: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
const STRING_ASCII_VISIBLE: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
const STRING_SPECIAL_ESCAPES: string = "\\a \\b \\f \\n \\r \\t \\v \\\\ \\' \\\" \\? \\0 \\ddd \\xhh";
const STRING_CONTROL_ESCAPES: string = '\b\f\n\r\t ';
const STRING_LONG_VALUE: string = 'a'.repeat(100000);

const VALID_VALUES: Array<StringDynamicItem> = [
  'test', '测试', `模板字符串${123}`, '中文', '\x61', 'a\nb', '0', 'NaN', 'true', 'null',
  '', '   ', '​', ' ', '\t', '\r\n', 'a', STRING_LONG_VALUE, '测试😀', STRING_SPECIAL_CHARACTERS,
  STRING_ASCII_VISIBLE, STRING_SPECIAL_ESCAPES, STRING_CONTROL_ESCAPES, '👆', '👀', '💯',
  '🎅', '🀄', '🏴', '13800138000', '310101199001011234',
  'test@example.com', '<script>alert(1)</script>', 'https://test.com', '2026-03-05', '138****8000',
  null, undefined, '\udc04', '\ud83d', '\udff4',
];

type StringAllValue = StringDynamicItem | number | bigint | boolean | StringInvalidObject | Array<number>;

const ALL_VALUES: Array<StringAllValue> = [
  ...VALID_VALUES,
  123, 0n, STRING_INVALID_OBJECT, [], false,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function queueStringTest() {
  describe('QueueStringTest', () => {
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
     * @tc.name   testQueueStringTest0100
     * @tc.number SUB_ARKTS_QUEUE_STRING_0100
     * @tc.desc   Verify Queue string add returns true for special emoji and boundary values, length accumulates, getFirst and pop follow FIFO order, including mixed-type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      expect(empty.length).assertEqual(0);

      const queue: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(queue.add(VALID_VALUES[i])).assertTrue();
      }
      expect(queue.length).assertEqual(VALID_VALUES.length);
      expect(queue.getFirst()).assertEqual('test');

      const mixed: Queue<StringAllValue> = new Queue<StringAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.getFirst()).assertEqual('test');
    });

    /**
     * @tc.name   testQueueStringTest0200
     * @tc.number SUB_ARKTS_QUEUE_STRING_0200
     * @tc.desc   Verify Queue string getFirst does not remove elements, add appends to the tail, and empty string head is preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      queue.add('b');
      queue.add('a');
      queue.add('c');
      queue.add('a');

      expect(queue.length).assertEqual(4);
      expect(queue.getFirst()).assertEqual('b');
      expect(queue.getFirst()).assertEqual('b');
      expect(queue.length).assertEqual(4);

      queue.add('Z');
      expect(queue.length).assertEqual(5);
      expect(queue.getFirst()).assertEqual('b');

      const emptyStrQueue: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      emptyStrQueue.add('');
      expect(emptyStrQueue.getFirst()).assertEqual('');
      expect(emptyStrQueue.length).assertEqual(1);
    });

    /**
     * @tc.name   testQueueStringTest0300
     * @tc.number SUB_ARKTS_QUEUE_STRING_0300
     * @tc.desc   Verify Queue string pop removes elements in FIFO order until empty where getFirst returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      queue.add('a');
      queue.add('b');
      queue.add('c');
      queue.add('d');

      const first: StringDynamicItem = queue.pop();
      expect(first).assertEqual('a');
      expect(queue.length).assertEqual(3);
      expect(queue.getFirst()).assertEqual('b');

      const second: StringDynamicItem = queue.pop();
      expect(second).assertEqual('b');
      expect(queue.length).assertEqual(2);

      queue.pop();
      queue.pop();
      expect(queue.length).assertEqual(0);
      expect(queue.getFirst()).assertUndefined();
    });

    /**
     * @tc.name   testQueueStringTest0400
     * @tc.number SUB_ARKTS_QUEUE_STRING_0400
     * @tc.desc   Verify Queue string forEach visits values in insertion order and provides cumulative indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      queue.add('a');
      queue.add('b');
      queue.add('c');

      const visited: Array<StringDynamicItem> = [];
      queue.forEach((value: StringDynamicItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual('a');
      expect(visited[1]).assertEqual('b');
      expect(visited[2]).assertEqual('c');

      let indexSum: number = 0;
      queue.forEach((value: StringDynamicItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.name   testQueueStringTest0500
     * @tc.number SUB_ARKTS_QUEUE_STRING_0500
     * @tc.desc   Verify Queue string Symbol.iterator and for-of traverse values in FIFO order with correct concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      queue.add('a');
      queue.add('b');
      queue.add('c');

      const iterValues: Array<StringDynamicItem> = [];
      const iter = queue[Symbol.iterator]();
      let temp: IteratorResult<StringDynamicItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual('a');
      expect(iterValues[2]).assertEqual('c');

      let concat: string = '';
      for (const value of queue) {
        concat += value;
      }
      expect(concat).assertEqual('abc');
    });

    /**
     * @tc.name   testQueueStringTest0600
     * @tc.number SUB_ARKTS_QUEUE_STRING_0600
     * @tc.desc   Verify empty Queue string pop getFirst and iterator return undefined or done, then add-pop round trip works including null and undefined members
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const queue: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      expect(queue.length).assertEqual(0);
      expect(queue.pop()).assertUndefined();
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

      const nullQueue: Queue<StringDynamicItem> = new Queue<StringDynamicItem>();
      nullQueue.add(null);
      nullQueue.add(undefined);
      expect(nullQueue.getFirst()).assertNull();
      expect(nullQueue.pop()).assertNull();
      expect(nullQueue.getFirst()).assertUndefined();
    });
  });
}
