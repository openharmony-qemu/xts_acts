'use static'
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class CustomObject003 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

class NullFieldUser001 {
  id: int | null = null;
  name: string = "";
  email: string | null = null;
  score: int = 0;

  constructor(name: string) {
    this.name = name;
  }
}

export default function BlockingQueueEdgeCaseTest(): void {
  describe('BlockingQueueEdgeCaseTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0100
     * @tc.name testBlockingQueueEdgeCase001
     * @tc.desc Verify push Int.MAX_VALUE as element value into LinkedBlockingQueue, then pop returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 2147483647;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
      let result: int = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0200
     * @tc.name testBlockingQueueEdgeCase002
     * @tc.desc Verify push Int.MIN_VALUE as element value into LinkedBlockingQueue, then pop returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = -2147483648;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: int = -2147483648;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      let result: int = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0300
     * @tc.name testBlockingQueueEdgeCase003
     * @tc.desc Verify LinkedBlockingQueue with capacity=2: push both Int.MAX_VALUE and Int.MIN_VALUE as elements, verify order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 2147483647;
      const PUSH_VALUE_1: int = -2147483648;
      const EXPECTED_VALUE: int = 2;
      const EXPECTED_VALUE_1: int = 2147483647;
      const EXPECTED_VALUE_2: int = -2147483648;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_2);
      let first: int = queue.pop();
      expect(first).assertEqual(EXPECTED_VALUE_1);
      let second: int = queue.pop();
      expect(second).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0400
     * @tc.name testBlockingQueueEdgeCase004
     * @tc.desc Verify push 0x7FFFFFFF (hex literal) as element preserves decimal value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let value: int = 0x7FFFFFFF;
      queue.push(value);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0500
     * @tc.name testBlockingQueueEdgeCase005
     * @tc.desc Verify push 0x1234 hex int as element into queue, value preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: int = 0x1234;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let value: int = 0x1234;
      queue.push(value);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0600
     * @tc.name testBlockingQueueEdgeCase006
     * @tc.desc Verify ArrayBlockingQueue with capacity=3: push Int.MAX_VALUE and Int.MIN_VALUE as elements, verify FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 2147483647;
      const PUSH_VALUE_1: int = 0;
      const PUSH_VALUE_2: int = -2147483648;
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_VALUE_1: int = 2147483647;
      const EXPECTED_VALUE_2: int = -2147483648;
      const EXPECTED_VALUE_3: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0700
     * @tc.name testBlockingQueueEdgeCase007
     * @tc.desc Verify push Unicode Chinese characters via escape sequence, string preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: string = "中文";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let text: string = "中文";
      queue.push(text);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      let result: string = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0800
     * @tc.name testBlockingQueueEdgeCase008
     * @tc.desc Verify push emoji character, preserved correctly through push-pop roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: string = "😀";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let emoji: string = "😀";
      queue.push(emoji);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_0900
     * @tc.name testBlockingQueueEdgeCase009
     * @tc.desc Verify push actual emoji characters (star, fire) pass through queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "⭐⭐";
      const PUSH_VALUE_1: string = "🔥🔥";
      const EXPECTED_VALUE: string = "⭐⭐";
      const EXPECTED_VALUE_1: string = "🔥🔥";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1000
     * @tc.name testBlockingQueueEdgeCase010
     * @tc.desc Verify push zero-width space (U+200B) as element, treated as valid string of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "​";
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: string = "​";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1100
     * @tc.name testBlockingQueueEdgeCase011
     * @tc.desc Verify push null character U+0000 as string element, not confused with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = " ";
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: string = " ";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1200
     * @tc.name testBlockingQueueEdgeCase012
     * @tc.desc Verify push control characters (tab, newline, carriage return) as string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "\t";
      const PUSH_VALUE_1: string = "\n";
      const PUSH_VALUE_2: string = "\r";
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_VALUE_1: string = "\t";
      const EXPECTED_VALUE_2: string = "\n";
      const EXPECTED_VALUE_3: string = "\r";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1300
     * @tc.name testBlockingQueueEdgeCase013
     * @tc.desc Verify push mixed special chars: control chars + zero-width space + emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "\t\n​😀";
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: string = "\t\n​😀";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      let result: string = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1400
     * @tc.name testBlockingQueueEdgeCase014
     * @tc.desc Verify push full-width and half-width hyphen characters are distinct and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "—";
      const PUSH_VALUE_1: string = "-";
      const EXPECTED_VALUE: int = 2;
      const EXPECTED_VALUE_1: string = "—";
      const EXPECTED_VALUE_2: string = "-";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1500
     * @tc.name testBlockingQueueEdgeCase015
     * @tc.desc Verify push Japanese string through LinkedBlockingQueue preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "テスト";
      const EXPECTED_VALUE: string = "テスト";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1600
     * @tc.name testBlockingQueueEdgeCase016
     * @tc.desc Verify push Korean string through LinkedBlockingQueue preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "테스트";
      const EXPECTED_VALUE: string = "테스트";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1700
     * @tc.name testBlockingQueueEdgeCase017
     * @tc.desc Verify push Russian Cyrillic string through LinkedBlockingQueue preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "АБВГД";
      const EXPECTED_VALUE: string = "АБВГД";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1800
     * @tc.name testBlockingQueueEdgeCase018
     * @tc.desc Verify push Arabic string through LinkedBlockingQueue preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "الاختبار";
      const EXPECTED_VALUE: string = "الاختبار";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_1900
     * @tc.name testBlockingQueueEdgeCase019
     * @tc.desc Verify push mixed-language string (CN+JP+KR+EN) through queue preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: int = 1;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let mixed: string = "Test 测试 テスト 테스트";
      queue.push(mixed);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      let result: string = queue.pop();
      expect(result).assertEqual(mixed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2000
     * @tc.name testBlockingQueueEdgeCase020
     * @tc.desc Verify push XSS script string preserved as-is (black-box: queue does not sanitize)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: int = 1;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let xss: string = "<script>alert(1)</script>";
      queue.push(xss);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(xss);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2100
     * @tc.name testBlockingQueueEdgeCase021
     * @tc.desc Verify push special ASCII symbol string through queue preserved intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let symbols: string = "!@#$%^&*()_+-=[]{}|;':\",./<>?";
      queue.push(symbols);
      expect(queue.getFirst()).assertEqual(symbols);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2200
     * @tc.name testBlockingQueueEdgeCase022
     * @tc.desc Verify push string with backslash and escape characters through queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let text: string = " test \\n new \\r line ";
      queue.push(text);
      let result: string = queue.pop();
      expect(result).assertEqual(text);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2300
     * @tc.name testBlockingQueueEdgeCase023
     * @tc.desc Verify push 10000-char string into LinkedBlockingQueue preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: int = 1;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let longStr: string = "";
      for (let i = 0; i < 10000; i++) {
        longStr += "a";
      }
      queue.push(longStr);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      let result: string = queue.pop();
      expect(result).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2400
     * @tc.name testBlockingQueueEdgeCase024
     * @tc.desc Verify push 65535-char string into ArrayBlockingQueue preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 1;
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      let longStr: string = "";
      for (let i = 0; i < 65535; i++) {
        longStr += "x";
      }
      queue.push(longStr);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2500
     * @tc.name testBlockingQueueEdgeCase025
     * @tc.desc Verify push false into LinkedBlockingQueue: isEmpty returns false (false != empty)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: boolean = false;
      const EXPECTED_VALUE: int = 1;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_VALUE);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertFalse();
      let result: boolean = queue.pop();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2600
     * @tc.name testBlockingQueueEdgeCase026
     * @tc.desc Verify ArrayBlockingQueue boolean: push false,false,true then poll all, verify FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: boolean = false;
      const PUSH_VALUE_1: boolean = true;
      const EXPECTED_VALUE: int = 3;
      let queue: containers.BlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertFalse();
      expect(queue.poll()).assertFalse();
      expect(queue.poll()).assertTrue();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2700
     * @tc.name testBlockingQueueEdgeCase027
     * @tc.desc Verify boolean queue with capacity=1: push true, add false returns false (queue full)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const BOOLEAN_VALUE: boolean = true;
      const BOOLEAN_VALUE_1: boolean = false;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(CAPACITY);
      expect(queue.add(BOOLEAN_VALUE)).assertTrue();
      expect(queue.add(BOOLEAN_VALUE_1)).assertFalse();
      expect(queue.getFirst()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2800
     * @tc.name testBlockingQueueEdgeCase028
     * @tc.desc Verify push object with some null properties, object reference preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CTOR_VALUE: string = "test";
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: string = "test";
      let obj: NullFieldUser001 = new NullFieldUser001(CTOR_VALUE);
      let queue: containers.BlockingQueue<NullFieldUser001> = new containers.LinkedBlockingQueue<NullFieldUser001>();
      queue.push(obj);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.isEmpty()).assertFalse();
      let first: NullFieldUser001 = queue.getFirst()!;
      expect(first.name).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_2900
     * @tc.name testBlockingQueueEdgeCase029
     * @tc.desc Verify ArrayBlockingQueue push custom object with all zero/default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CTOR_VALUE: string = "";
      const CTOR_VALUE_1: int = 0;
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: string = "";
      const EXPECTED_VALUE_1: int = 0;
      let obj = new CustomObject003(CTOR_VALUE, CTOR_VALUE_1);
      let queue: containers.BlockingQueue<CustomObject003> = new containers.ArrayBlockingQueue<CustomObject003>(CAPACITY);
      queue.push(obj);
      let result: CustomObject003 = queue.pop()!;
      expect(result.name).assertEqual(EXPECTED_VALUE);
      expect(result.value).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3000
     * @tc.name testBlockingQueueEdgeCase030
     * @tc.desc Verify push two different objects, verify FIFO order and reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CTOR_VALUE: string = "first";
      const CTOR_VALUE_1: int = 1;
      const CTOR_VALUE_2: string = "second";
      const CTOR_VALUE_3: int = 2;
      let obj1 = new CustomObject003(CTOR_VALUE, CTOR_VALUE_1);
      let obj2 = new CustomObject003(CTOR_VALUE_2, CTOR_VALUE_3);
      let queue: containers.BlockingQueue<CustomObject003> = new containers.LinkedBlockingQueue<CustomObject003>();
      queue.push(obj1);
      queue.push(obj2);
      expect(queue.getFirst()).assertEqual(obj1);
      expect(queue.getEnd()).assertEqual(obj2);
      let popped1: CustomObject003 | undefined = queue.pop();
      let popped2: CustomObject003 | undefined = queue.pop();
      expect(popped1).assertEqual(obj1);
      expect(popped2).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3100
     * @tc.name testBlockingQueueEdgeCase031
     * @tc.desc Verify LinkedBlockingQueue(1): add success, then poll removes element, then add succeeds again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const VALUE: int = 100;
      const VALUE_1: int = 200;
      const EXPECTED_VALUE: int = 100;
      const EXPECTED_VALUE_1: int = 200;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.add(VALUE)).assertTrue();
      expect(queue.add(VALUE_1)).assertFalse();
      let val: int | undefined = queue.poll();
      expect(val).assertEqual(EXPECTED_VALUE);
      expect(queue.add(VALUE_1)).assertTrue();
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3200
     * @tc.name testBlockingQueueEdgeCase032
     * @tc.desc Verify LinkedBlockingQueue(1): getFirst and getEnd both return same element, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: int = 42;
      const EXPECTED_VALUE: int = 42;
      const EXPECTED_VALUE_1: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(queue.getEnd());
      expect(queue.size).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3300
     * @tc.name testBlockingQueueEdgeCase033
     * @tc.desc Verify ArrayBlockingQueue(1): push, pop, push cycle with string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: string = "first";
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 1;
      const PUSH_VALUE_1: string = "second";
      const EXPECTED_VALUE_2: string = "second";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE);
      queue.pop();
      expect(queue.isEmpty()).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_1);
      queue.push(PUSH_VALUE_1);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3400
     * @tc.name testBlockingQueueEdgeCase034
     * @tc.desc Verify LinkedBlockingQueue(1) with boolean: push true, pop, push false, verify correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: boolean = true;
      const PUSH_VALUE_1: boolean = false;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.pop()).assertTrue();
      queue.push(PUSH_VALUE_1);
      expect(queue.pop()).assertFalse();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3500
     * @tc.name testBlockingQueueEdgeCase035
     * @tc.desc Verify LinkedBlockingQueue(2): push 2, pop 1, add 1, verify all size/capacity/remaining states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2;
      const EXPECTED_VALUE: int = 2;
      const PUSH_VALUE: int = 10;
      const EXPECTED_VALUE_1: int = 1;
      const PUSH_VALUE_1: int = 20;
      const EXPECTED_VALUE_2: int = 0;
      const VALUE: int = 30;
      const EXPECTED_VALUE_3: int = 30;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE);
      queue.push(PUSH_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_1);
      queue.push(PUSH_VALUE_1);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.add(VALUE)).assertFalse();
      queue.pop();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.add(VALUE)).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3600
     * @tc.name testBlockingQueueEdgeCase036
     * @tc.desc Verify ArrayBlockingQueue(2): fill completely, getFirst/getEnd, pop all, verify isEmpty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_1: int = 2;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3700
     * @tc.name testBlockingQueueEdgeCase037
     * @tc.desc Verify LinkedBlockingQueue constructed with Set<int> iterable: all elements enqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ADD_VALUE: int = 100;
      const ADD_VALUE_1: int = 200;
      const ADD_VALUE_2: int = 300;
      const EXPECTED_VALUE: int = 3;
      let s: Set<int> = new Set<int>();
      s.add(ADD_VALUE);
      s.add(ADD_VALUE_1);
      s.add(ADD_VALUE_2);
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(s);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3800
     * @tc.name testBlockingQueueEdgeCase038
     * @tc.desc Verify LinkedBlockingQueue constructed with Set<string> iterable: string elements enqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ADD_VALUE: string = "alpha";
      const ADD_VALUE_1: string = "beta";
      const ADD_VALUE_2: string = "gamma";
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_VALUE_1: int = 10;
      let s: Set<string> = new Set<string>();
      s.add(ADD_VALUE);
      s.add(ADD_VALUE_1);
      s.add(ADD_VALUE_2);
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY, s);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.capacity).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_3900
     * @tc.name testBlockingQueueEdgeCase039
     * @tc.desc Verify ArrayBlockingQueue constructed with Set<number> iterable: all elements enqueued with correct size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ADD_VALUE: int = 10;
      const CAPACITY: int = 100;
      const EXPECTED_VALUE: int = 15;
      const EXPECTED_VALUE_1: int = 100;
      let s: Set<number> = new Set<number>();
      for (let i = 0; i < 15; i++) {
        s.add(i * ADD_VALUE);
      }
      let queue: containers.BlockingQueue<number> = new containers.ArrayBlockingQueue<number>(CAPACITY, s);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.capacity).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4000
     * @tc.name testBlockingQueueEdgeCase040
     * @tc.desc Verify LinkedBlockingQueue(3): alternating add and poll without blocking any thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const VALUE: int = 1;
      const VALUE_1: int = 2;
      const EXPECTED_VALUE: int = 1;
      const VALUE_2: int = 3;
      const VALUE_3: int = 4;
      const VALUE_4: int = 5;
      const EXPECTED_VALUE_1: int = 3;
      const EXPECTED_VALUE_2: int = 2;
      const EXPECTED_VALUE_3: int = 4;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.add(VALUE)).assertTrue();
      expect(queue.add(VALUE_1)).assertTrue();
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.add(VALUE_2)).assertTrue();
      expect(queue.add(VALUE_3)).assertTrue();
      expect(queue.add(VALUE_4)).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_VALUE_1);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.poll()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4100
     * @tc.name testBlockingQueueEdgeCase041
     * @tc.desc Verify ArrayBlockingQueue(2): interleaved add/poll operations never block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2;
      const VALUE: int = 10;
      const VALUE_1: int = 20;
      const VALUE_2: int = 30;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_1: int = 20;
      const EXPECTED_VALUE_2: int = 30;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.add(VALUE)).assertTrue();
      expect(queue.add(VALUE_1)).assertTrue();
      expect(queue.add(VALUE_2)).assertFalse();
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.add(VALUE_2)).assertTrue();
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4200
     * @tc.name testBlockingQueueEdgeCase042
     * @tc.desc Verify LinkedBlockingQueue(2): push (blocking when full) + poll (non-blocking when empty) state transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_1: int = 2;
      const EXPECTED_VALUE: int = 2;
      const EXPECTED_VALUE_1: int = 0;
      const EXPECTED_VALUE_2: int = 1;
      const PUSH_VALUE_2: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_1);
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(EXPECTED_VALUE_2);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_2);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4300
     * @tc.name testBlockingQueueEdgeCase043
     * @tc.desc Verify ArrayBlockingQueue(3): mixed push/add/poll operations, verify size tracking accuracy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 100;
      const EXPECTED_VALUE: int = 1;
      const VALUE: int = 200;
      const EXPECTED_VALUE_1: int = 2;
      const EXPECTED_VALUE_2: int = 100;
      const PUSH_VALUE_1: int = 300;
      const PUSH_VALUE_2: int = 400;
      const EXPECTED_VALUE_3: int = 3;
      const VALUE_1: int = 500;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.add(VALUE)).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_VALUE_1);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      queue.push(PUSH_VALUE_1);
      expect(queue.size).assertEqual(EXPECTED_VALUE_1);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_VALUE_3);
      expect(queue.add(VALUE_1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4400
     * @tc.name testBlockingQueueEdgeCase044
     * @tc.desc Verify push format strings (phone number, email, date) through queue preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: string = "13800138000";
      const PUSH_VALUE_1: string = "test@example.com";
      const PUSH_VALUE_2: string = "2026-03-05";
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_VALUE_1: string = "13800138000";
      const EXPECTED_VALUE_2: string = "test@example.com";
      const EXPECTED_VALUE_3: string = "2026-03-05";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4500
     * @tc.name testBlockingQueueEdgeCase045
     * @tc.desc Verify push strings with hex/octal format content as literal strings (not interpreted as numbers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: string = "0x123";
      const PUSH_VALUE_1: string = "0123";
      const PUSH_VALUE_2: string = "0b1010";
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_VALUE_1: string = "0x123";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4600
     * @tc.name testBlockingQueueEdgeCase046
     * @tc.desc Verify LinkedBlockingQueue constructed with iterable: remainingCapacity decrements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 1;
      const PUSH_VALUE: int = 99;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE);
      queue.pop();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_1);
      queue.push(PUSH_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4700
     * @tc.name testBlockingQueueEdgeCase047
     * @tc.desc Verify LinkedBlockingQueue(5, iterableWith7Elements): only first 5 elements enqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 10;
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: int = 5;
      const EXPECTED_VALUE_1: int = 0;
      const EXPECTED_VALUE_2: int = 40;
      let arr: int[] = [];
      for (let i = 0; i < 7; i++) {
        arr.push(i * PUSH_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.capacity).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4800
     * @tc.name testBlockingQueueEdgeCase048
     * @tc.desc Verify ArrayBlockingQueue(5, iterableWith7Elements): only first 5 elements enqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 100;
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: int = 5;
      const EXPECTED_VALUE_1: int = 0;
      const EXPECTED_VALUE_2: int = 400;
      let arr: int[] = [];
      for (let i = 0; i < 7; i++) {
        arr.push(i * PUSH_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_4900
     * @tc.name testBlockingQueueEdgeCase049
     * @tc.desc Verify pre-filled LinkedBlockingQueue: pop 2, poll 1, push 3, add 2, verify final state and order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 100;
      const CAPACITY: int = 20;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_1: int = 0;
      const EXPECTED_VALUE_2: int = 100;
      const EXPECTED_VALUE_3: int = 200;
      const PUSH_VALUE_1: int = 1000;
      const PUSH_VALUE_2: int = 1100;
      const PUSH_VALUE_3: int = 1200;
      const VALUE: int = 1300;
      const VALUE_1: int = 1400;
      const EXPECTED_VALUE_4: int = 12;
      const EXPECTED_VALUE_5: int = 300;
      const EXPECTED_VALUE_6: int = 1400;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i * PUSH_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      queue.push(PUSH_VALUE_1);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.add(VALUE)).assertTrue();
      expect(queue.add(VALUE_1)).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_VALUE_4);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_5);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_5000
     * @tc.name testBlockingQueueEdgeCase050
     * @tc.desc Verify ArrayBlockingQueue pre-filled: all methods operate correctly (push,add,pop,poll,getFirst,getEnd,isEmpty,remainingCapacity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 8;
      const EXPECTED_VALUE_1: int = 2;
      const EXPECTED_VALUE_2: int = 0;
      const EXPECTED_VALUE_3: int = 7;
      const EXPECTED_VALUE_4: int = 1;
      const EXPECTED_VALUE_5: int = 6;
      const PUSH_VALUE: int = 100;
      const PUSH_VALUE_1: int = 200;
      const VALUE: int = 300;
      const VALUE_1: int = 400;
      const VALUE_2: int = 500;
      let arr: int[] = [];
      for (let i = 0; i < 8; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_4);
      expect(queue.size).assertEqual(EXPECTED_VALUE_5);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.add(VALUE)).assertTrue();
      expect(queue.add(VALUE_1)).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.add(VALUE_2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_5100
     * @tc.name testBlockingQueueEdgeCase051
     * @tc.desc Verify string queue with capacity=3: all operations including special chars, unicode, empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: string = "";
      const PUSH_VALUE_1: string = "中文";
      const PUSH_VALUE_2: string = "!@#$%";
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_VALUE_1: int = 0;
      const EXPECTED_VALUE_2: string = "";
      const EXPECTED_VALUE_3: string = "!@#$%";
      const EXPECTED_VALUE_4: string = "中文";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_4);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_EDGECASE_5200
     * @tc.name testBlockingQueueEdgeCase052
     * @tc.desc Verify ArrayBlockingQueue string: push Unicode+special+long strings, verify FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueEdgeCase052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: string = "😀";
      const PUSH_VALUE_1: string = "テスト";
      const PUSH_VALUE_2: string = "long_string_with_many_characters_12345";
      const PUSH_VALUE_3: string = "АБВ";
      const PUSH_VALUE_4: string = "";
      const EXPECTED_VALUE: int = 5;
      const EXPECTED_VALUE_1: string = "😀";
      const EXPECTED_VALUE_2: string = "テスト";
      const EXPECTED_VALUE_3: string = "long_string_with_many_characters_12345";
      const EXPECTED_VALUE_4: string = "АБВ";
      const EXPECTED_VALUE_5: string = "";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_1);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      queue.push(PUSH_VALUE_4);
      expect(queue.size).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_4);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_5);
    });
  });
}
