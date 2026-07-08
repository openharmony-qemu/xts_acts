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

class CustomObject012 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

export default function BlockingQueueGetEndTest(): void {
  describe('BlockingQueueGetEndTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0010
     * @tc.name testBlockingQueueGetEnd001
     * @tc.desc Verify LinkedBlockingQueue getEnd returns the single pushed int element without removing it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 42;
      const EXPECTED_VALUE: int = 42;
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0020
     * @tc.name testBlockingQueueGetEnd002
     * @tc.desc Verify LinkedBlockingQueue getEnd returns the last pushed element (tail, not head)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_SIZE: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0030
     * @tc.name testBlockingQueueGetEnd003
     * @tc.desc Verify LinkedBlockingQueue getEnd is idempotent - calling twice returns the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      const EXPECTED_VALUE: int = 30;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      let first: int | undefined = queue.getEnd();
      expect(first).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0040
     * @tc.name testBlockingQueueGetEnd004
     * @tc.desc Verify LinkedBlockingQueue getEnd returns updated value after pushing a new element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_VALUE: int = 3;
      const PUSH_VALUE_4: int = 4;
      const EXPECTED_VALUE_2: int = 4;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
      queue.push(PUSH_VALUE_4);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0050
     * @tc.name testBlockingQueueGetEnd005
     * @tc.desc Verify LinkedBlockingQueue getEnd returns the tail element unchanged after pop removes head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      let popped: int = queue.pop();
      expect(popped).assertEqual(EXPECTED_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0060
     * @tc.name testBlockingQueueGetEnd006
     * @tc.desc Verify LinkedBlockingQueue getEnd returns undefined for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.getEnd()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0070
     * @tc.name testBlockingQueueGetEnd007
     * @tc.desc Verify LinkedBlockingQueue getEnd returns undefined after all elements are popped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      queue.pop();
      queue.pop();
      queue.pop();
      expect(queue.getEnd()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0080
     * @tc.name testBlockingQueueGetEnd008
     * @tc.desc Verify LinkedBlockingQueue getEnd on string queue returns the last pushed string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "a";
      const PUSH_TEXT_2: string = "b";
      const EXPECTED_VALUE: string = "b";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0090
     * @tc.name testBlockingQueueGetEnd009
     * @tc.desc Verify LinkedBlockingQueue getEnd on string queue returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "";
      const EXPECTED_VALUE: string = "";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0100
     * @tc.name testBlockingQueueGetEnd010
     * @tc.desc Verify LinkedBlockingQueue getEnd on string queue with multiple values returns last pushed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = " ";
      const PUSH_TEXT_2: string = "test";
      const EXPECTED_VALUE: string = "test";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0110
     * @tc.name testBlockingQueueGetEnd011
     * @tc.desc Verify LinkedBlockingQueue getEnd on boolean queue returns last pushed boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_FLAG: boolean = true;
      const PUSH_FLAG_2: boolean = false;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_FLAG);
      queue.push(PUSH_FLAG_2);
      expect(queue.getEnd()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0120
     * @tc.name testBlockingQueueGetEnd012
     * @tc.desc Verify LinkedBlockingQueue getEnd on custom object queue returns the second pushed object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const OBJECT_VALUE: int = 1;
      const OBJECT_NAME: string = "first";
      const OBJECT_VALUE_2: int = 2;
      const OBJECT_NAME_2: string = "second";
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_VALUE: int = 2;
      let obj1: CustomObject012 = new CustomObject012(OBJECT_NAME, OBJECT_VALUE);
      let obj2: CustomObject012 = new CustomObject012(OBJECT_NAME_2, OBJECT_VALUE_2);
      let queue: containers.BlockingQueue<CustomObject012> = new containers.LinkedBlockingQueue<CustomObject012>();
      queue.push(obj1);
      queue.push(obj2);
      expect(queue.getEnd()).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0130
     * @tc.name testBlockingQueueGetEnd013
     * @tc.desc Verify LinkedBlockingQueue getEnd with capacity=5 returns last pushed element and size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: int = 4;
      const EXPECTED_SIZE: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0140
     * @tc.name testBlockingQueueGetEnd014
     * @tc.desc Verify LinkedBlockingQueue getEnd with capacity=5 returns undefined for empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.getEnd()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0150
     * @tc.name testBlockingQueueGetEnd015
     * @tc.desc Verify LinkedBlockingQueue getEnd initialised with iterable returns the last element of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: int = 4;
      let arr: int[] = [];
      for (let i = 0; i < 5; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0160
     * @tc.name testBlockingQueueGetEnd016
     * @tc.desc Verify LinkedBlockingQueue getEnd on iterable-init queue returns newly pushed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 0;
      const PUSH_VALUE_2: int = 1;
      const PUSH_VALUE_3: int = 2;
      const PUSH_VALUE_4: int = 10;
      const EXPECTED_VALUE: int = 10;
      let arr: int[] = [];
      arr.push(PUSH_VALUE);
      arr.push(PUSH_VALUE_2);
      arr.push(PUSH_VALUE_3);
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      queue.push(PUSH_VALUE_4);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0170
     * @tc.name testBlockingQueueGetEnd017
     * @tc.desc Verify LinkedBlockingQueue getEnd with capacity+iterable returns the last truncated element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_VALUE: int = 2;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0180
     * @tc.name testBlockingQueueGetEnd018
     * @tc.desc Verify ArrayBlockingQueue getEnd returns last pushed int element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: int = 0;
      const PUSH_VALUE_2: int = 1;
      const PUSH_VALUE_3: int = 2;
      const EXPECTED_VALUE: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0190
     * @tc.name testBlockingQueueGetEnd019
     * @tc.desc Verify ArrayBlockingQueue getEnd remains unchanged after pop removes head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_2: int = 30;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      let popped: int = queue.pop();
      expect(popped).assertEqual(EXPECTED_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0200
     * @tc.name testBlockingQueueGetEnd020
     * @tc.desc Verify ArrayBlockingQueue getEnd returns undefined for empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.getEnd()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0210
     * @tc.name testBlockingQueueGetEnd021
     * @tc.desc Verify ArrayBlockingQueue getEnd returns last pushed string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const PUSH_TEXT: string = "x";
      const PUSH_TEXT_2: string = "y";
      const PUSH_TEXT_3: string = "z";
      const EXPECTED_VALUE: string = "z";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      queue.push(PUSH_TEXT_3);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0220
     * @tc.name testBlockingQueueGetEnd022
     * @tc.desc Verify ArrayBlockingQueue getEnd with iterable constructor returns last enqueued element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 4;
      let set: Set<int> = new Set<int>();
      for (let i = 0; i < 5; i++) {
        set.add(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, set);
      expect(queue.getEnd()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0230
     * @tc.name testBlockingQueueGetEnd023
     * @tc.desc Verify LinkedBlockingQueue getEnd called with zero arguments returns the single pushed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 5;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let res = q.getEnd();
      expect(res).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0240
     * @tc.name testBlockingQueueGetEnd024
     * @tc.desc Verify ArrayBlockingQueue getEnd called with zero arguments returns the single pushed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 7;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let res = q.getEnd();
      expect(res).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0250
     * @tc.name testBlockingQueueGetEnd025
     * @tc.desc Verify LinkedBlockingQueue getEnd returns 0 when the single pushed element is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0);
      expect(q.getEnd()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0260
     * @tc.name testBlockingQueueGetEnd026
     * @tc.desc Verify LinkedBlockingQueue getEnd returns 9 after pushing 0..9 in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i = 0; i < 10; i++) {
        q.push(i);
      }
      expect(q.getEnd()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0270
     * @tc.name testBlockingQueueGetEnd027
     * @tc.desc Verify LinkedBlockingQueue getEnd returns the last enqueued element after pushing two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 22;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(11);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0280
     * @tc.name testBlockingQueueGetEnd028
     * @tc.desc Verify LinkedBlockingQueue getEnd returns 1000 for decimal literal 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 1000;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2000);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0290
     * @tc.name testBlockingQueueGetEnd029
     * @tc.desc Verify LinkedBlockingQueue getEnd returns 123 for arithmetic expression 100+23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(200);
      q.push(100 + 23);
      expect(q.getEnd()).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0300
     * @tc.name testBlockingQueueGetEnd030
     * @tc.desc Verify ArrayBlockingQueue getEnd returns 0 when the single pushed element is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(0);
      expect(q.getEnd()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0310
     * @tc.name testBlockingQueueGetEnd031
     * @tc.desc Verify ArrayBlockingQueue getEnd returns 9 after pushing 0..9 in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 10; i++) {
        q.push(i);
      }
      expect(q.getEnd()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0320
     * @tc.name testBlockingQueueGetEnd032
     * @tc.desc Verify ArrayBlockingQueue getEnd returns the last enqueued element after pushing two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 44;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(33);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0330
     * @tc.name testBlockingQueueGetEnd033
     * @tc.desc Verify ArrayBlockingQueue getEnd returns 0 when 0 is the last enqueued element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(99);
      q.push(0);
      expect(q.getEnd()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0340
     * @tc.name testBlockingQueueGetEnd034
     * @tc.desc Verify ArrayBlockingQueue getEnd returns 200 for decimal literal 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 200;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1000);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0350
     * @tc.name testBlockingQueueGetEnd035
     * @tc.desc Verify ArrayBlockingQueue number generic getEnd returns float value 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(3.14);
      expect(q.getEnd()).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0360
     * @tc.name testBlockingQueueGetEnd036
     * @tc.desc Verify LinkedBlockingQueue getEnd return type is int via typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(8);
      let res = q.getEnd();
      expect(typeof res).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0370
     * @tc.name testBlockingQueueGetEnd037
     * @tc.desc Verify ArrayBlockingQueue getEnd return type is int via typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(8);
      let res = q.getEnd();
      expect(typeof res).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0380
     * @tc.name testBlockingQueueGetEnd038
     * @tc.desc Verify LinkedBlockingQueue empty queue getEnd return type is undefined via typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let res = q.getEnd();
      expect(typeof res).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0390
     * @tc.name testBlockingQueueGetEnd039
     * @tc.desc Verify ArrayBlockingQueue empty queue getEnd return type is undefined via typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let res = q.getEnd();
      expect(typeof res).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0400
     * @tc.name testBlockingQueueGetEnd040
     * @tc.desc Verify LinkedBlockingQueue capacity 1 empty queue getEnd returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0410
     * @tc.name testBlockingQueueGetEnd041
     * @tc.desc Verify ArrayBlockingQueue capacity 1 empty queue getEnd returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0420
     * @tc.name testBlockingQueueGetEnd042
     * @tc.desc Verify LinkedBlockingQueue getEnd returns undefined after all elements removed by poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.poll();
      q.poll();
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0430
     * @tc.name testBlockingQueueGetEnd043
     * @tc.desc Verify ArrayBlockingQueue getEnd returns undefined after all elements removed by poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.poll();
      q.poll();
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0440
     * @tc.name testBlockingQueueGetEnd044
     * @tc.desc Verify LinkedBlockingQueue getEnd updates to the third pushed element 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 30;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(10);
      q.push(20);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0450
     * @tc.name testBlockingQueueGetEnd045
     * @tc.desc Verify ArrayBlockingQueue getEnd updates to the second pushed element 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 20;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(10);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0460
     * @tc.name testBlockingQueueGetEnd046
     * @tc.desc Verify ArrayBlockingQueue getEnd updates to the third pushed element 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 30;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(10);
      q.push(20);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0470
     * @tc.name testBlockingQueueGetEnd047
     * @tc.desc Verify LinkedBlockingQueue getEnd returns the element enqueued via add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 55;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0480
     * @tc.name testBlockingQueueGetEnd048
     * @tc.desc Verify ArrayBlockingQueue getEnd returns the element enqueued via add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 66;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0490
     * @tc.name testBlockingQueueGetEnd049
     * @tc.desc Verify LinkedBlockingQueue getEnd returns the last enqueued element after mixed push and add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.add(2);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0500
     * @tc.name testBlockingQueueGetEnd050
     * @tc.desc Verify ArrayBlockingQueue getEnd returns the last enqueued element after mixed push and add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.add(2);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0510
     * @tc.name testBlockingQueueGetEnd051
     * @tc.desc Verify LinkedBlockingQueue size remains 2 after calling getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(TEST_VALUE);
      q.getEnd();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0520
     * @tc.name testBlockingQueueGetEnd052
     * @tc.desc Verify ArrayBlockingQueue size remains 2 after calling getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(TEST_VALUE);
      q.getEnd();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0530
     * @tc.name testBlockingQueueGetEnd053
     * @tc.desc Verify LinkedBlockingQueue size stays 3 after multiple getEnd calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(TEST_VALUE);
      q.getEnd();
      q.getEnd();
      q.getEnd();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0540
     * @tc.name testBlockingQueueGetEnd054
     * @tc.desc Verify ArrayBlockingQueue size stays 3 after multiple getEnd calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(TEST_VALUE);
      q.getEnd();
      q.getEnd();
      q.getEnd();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0550
     * @tc.name testBlockingQueueGetEnd055
     * @tc.desc Verify LinkedBlockingQueue getEnd called again still returns the original tail value 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 8;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(7);
      q.push(TEST_VALUE);
      q.getEnd();
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0560
     * @tc.name testBlockingQueueGetEnd056
     * @tc.desc Verify ArrayBlockingQueue getEnd called again still returns the original tail value 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 8;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(7);
      q.push(TEST_VALUE);
      q.getEnd();
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0570
     * @tc.name testBlockingQueueGetEnd057
     * @tc.desc Verify LinkedBlockingQueue getEnd does not change remainingCapacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.getEnd();
      expect(q.remainingCapacity()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0580
     * @tc.name testBlockingQueueGetEnd058
     * @tc.desc Verify ArrayBlockingQueue getEnd does not change remainingCapacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.getEnd();
      expect(q.remainingCapacity()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0590
     * @tc.name testBlockingQueueGetEnd059
     * @tc.desc Verify LinkedBlockingQueue isEmpty stays false after calling getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.getEnd();
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0600
     * @tc.name testBlockingQueueGetEnd060
     * @tc.desc Verify ArrayBlockingQueue isEmpty stays false after calling getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.getEnd();
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0610
     * @tc.name testBlockingQueueGetEnd061
     * @tc.desc Verify LinkedBlockingQueue getEnd equals getFirst when only one element present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(42);
      expect(q.getEnd()).assertEqual(q.getFirst());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0620
     * @tc.name testBlockingQueueGetEnd062
     * @tc.desc Verify ArrayBlockingQueue getEnd equals getFirst when only one element present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(42);
      expect(q.getEnd()).assertEqual(q.getFirst());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0630
     * @tc.name testBlockingQueueGetEnd063
     * @tc.desc Verify LinkedBlockingQueue getEnd equals getFirst when the single element is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0);
      expect(q.getEnd()).assertEqual(q.getFirst());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0640
     * @tc.name testBlockingQueueGetEnd064
     * @tc.desc Verify ArrayBlockingQueue getEnd equals getFirst when the single element is int min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(-2147483648);
      expect(q.getEnd()).assertEqual(q.getFirst());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0650
     * @tc.name testBlockingQueueGetEnd065
     * @tc.desc Verify ArrayBlockingQueue getEnd returns tail element 2 when multiple elements present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0660
     * @tc.name testBlockingQueueGetEnd066
     * @tc.desc Verify LinkedBlockingQueue filled to capacity 5 returns last pushed element 4 via getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      expect(q.getEnd()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0670
     * @tc.name testBlockingQueueGetEnd067
     * @tc.desc Verify ArrayBlockingQueue filled to capacity 5 returns last pushed element 4 via getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      expect(q.getEnd()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0680
     * @tc.name testBlockingQueueGetEnd068
     * @tc.desc Verify LinkedBlockingQueue getEnd returns tail 300 when size equals capacity 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 300;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(100);
      q.push(200);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0690
     * @tc.name testBlockingQueueGetEnd069
     * @tc.desc Verify ArrayBlockingQueue getEnd returns tail 300 when size equals capacity 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 300;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(100);
      q.push(200);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0700
     * @tc.name testBlockingQueueGetEnd070
     * @tc.desc Verify LinkedBlockingQueue getEnd remains original tail 2 after add fails on a full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(1);
      q.push(TEST_VALUE);
      q.add(3);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0710
     * @tc.name testBlockingQueueGetEnd071
     * @tc.desc Verify ArrayBlockingQueue getEnd remains original tail 2 after add fails on a full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.push(1);
      q.push(TEST_VALUE);
      q.add(3);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0720
     * @tc.name testBlockingQueueGetEnd072
     * @tc.desc Verify LinkedBlockingQueue getEnd still returns tail 3 after poll removes the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(TEST_VALUE);
      q.poll();
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0730
     * @tc.name testBlockingQueueGetEnd073
     * @tc.desc Verify ArrayBlockingQueue getEnd still returns tail 3 after poll removes the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(TEST_VALUE);
      q.poll();
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0740
     * @tc.name testBlockingQueueGetEnd074
     * @tc.desc Verify LinkedBlockingQueue getEnd returns remaining element 2 after poll leaves a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(TEST_VALUE);
      q.poll();
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0750
     * @tc.name testBlockingQueueGetEnd075
     * @tc.desc Verify ArrayBlockingQueue getEnd returns remaining element 2 after poll leaves a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(TEST_VALUE);
      q.poll();
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0760
     * @tc.name testBlockingQueueGetEnd076
     * @tc.desc Verify LinkedBlockingQueue getEnd returns new element 99 after polling all then pushing again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 99;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0770
     * @tc.name testBlockingQueueGetEnd077
     * @tc.desc Verify ArrayBlockingQueue getEnd returns new element 99 after polling all then pushing again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 99;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0780
     * @tc.name testBlockingQueueGetEnd078
     * @tc.desc Verify LinkedBlockingQueue getEnd follows latest element 4 after poll then multiple pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 4;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.poll();
      q.push(3);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0790
     * @tc.name testBlockingQueueGetEnd079
     * @tc.desc Verify ArrayBlockingQueue getEnd follows latest element 4 after poll then multiple pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 4;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.poll();
      q.push(3);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0800
     * @tc.name testBlockingQueueGetEnd080
     * @tc.desc Verify LinkedBlockingQueue built from capacity and iterable values returns last element 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      let iter = arr.values();
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter);
      expect(q.getEnd()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0810
     * @tc.name testBlockingQueueGetEnd081
     * @tc.desc Verify LinkedBlockingQueue built from single element iterable has getEnd equal to getFirst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [88];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.getEnd()).assertEqual(q.getFirst());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0820
     * @tc.name testBlockingQueueGetEnd082
     * @tc.desc Verify LinkedBlockingQueue built from empty array iterable returns undefined via getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0830
     * @tc.name testBlockingQueueGetEnd083
     * @tc.desc Verify ArrayBlockingQueue with capacity smaller than iterable returns truncated tail 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Number[] = [10, 20, 30, 40, 50];
      let set: Set<number> = new Set<number>(arr);
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(3, set);
      expect(q.getEnd()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0840
     * @tc.name testBlockingQueueGetEnd084
     * @tc.desc Verify ArrayBlockingQueue built from single element Set has getEnd equal to getFirst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Number[] = [77];
      let set: Set<number> = new Set<number>(arr);
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10, set);
      expect(q.getEnd()).assertEqual(q.getFirst());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0850
     * @tc.name testBlockingQueueGetEnd085
     * @tc.desc Verify ArrayBlockingQueue built from empty Set returns undefined via getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<number> = new Set<number>();
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10, set);
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0860
     * @tc.name testBlockingQueueGetEnd086
     * @tc.desc Verify ArrayBlockingQueue getEnd updates to new element 100 after iterable construction then push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 100;
      let arr: Number[] = [1, 2, 3];
      let set: Set<number> = new Set<number>(arr);
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10, set);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0870
     * @tc.name testBlockingQueueGetEnd087
     * @tc.desc Verify LinkedBlockingQueue getEnd returns last enqueued element 99 after repeated push poll cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 99;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      for (let i = 0; i < 6; i++) {
        q.push(i);
        q.poll();
      }
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0880
     * @tc.name testBlockingQueueGetEnd088
     * @tc.desc Verify ArrayBlockingQueue getEnd returns last enqueued element 99 after repeated push poll cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 99;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      for (let i = 0; i < 6; i++) {
        q.push(i);
        q.poll();
      }
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0890
     * @tc.name testBlockingQueueGetEnd089
     * @tc.desc Verify LinkedBlockingQueue getEnd returns last element 99 after pushing 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(100);
      for (let i = 0; i < 100; i++) {
        q.push(i);
      }
      expect(q.getEnd()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0900
     * @tc.name testBlockingQueueGetEnd090
     * @tc.desc Verify ArrayBlockingQueue getEnd returns last element 99 after pushing 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(100);
      for (let i = 0; i < 100; i++) {
        q.push(i);
      }
      expect(q.getEnd()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0910
     * @tc.name testBlockingQueueGetEnd091
     * @tc.desc Verify LinkedBlockingQueue getEnd returns 7 when all enqueued elements share the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 7;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(TEST_VALUE);
      }
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0920
     * @tc.name testBlockingQueueGetEnd092
     * @tc.desc Verify ArrayBlockingQueue getEnd returns 7 when all enqueued elements share the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 7;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(TEST_VALUE);
      }
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0930
     * @tc.name testBlockingQueueGetEnd093
     * @tc.desc Verify LinkedBlockingQueue getEnd does not change poll order so poll returns head 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.getEnd();
      expect(q.poll()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0940
     * @tc.name testBlockingQueueGetEnd094
     * @tc.desc Verify ArrayBlockingQueue getEnd does not change poll order so poll returns head 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.getEnd();
      expect(q.poll()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0950
     * @tc.name testBlockingQueueGetEnd095
     * @tc.desc Verify LinkedBlockingQueue getEnd preserves FIFO so final poll returns tail value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0);
      q.push(1);
      q.push(TEST_VALUE);
      q.getEnd();
      q.poll();
      q.poll();
      expect(q.poll()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0960
     * @tc.name testBlockingQueueGetEnd096
     * @tc.desc Verify ArrayBlockingQueue getEnd preserves FIFO so final poll returns tail value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(0);
      q.push(1);
      q.push(TEST_VALUE);
      q.getEnd();
      q.poll();
      q.poll();
      expect(q.poll()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0970
     * @tc.name testBlockingQueueGetEnd097
     * @tc.desc Verify LinkedBlockingQueue default capacity constructor returns tail 456 after two pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 456;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(123);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0980
     * @tc.name testBlockingQueueGetEnd098
     * @tc.desc Verify LinkedBlockingQueue number generic getEnd returns negative float -2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(-2.5);
      expect(q.getEnd()).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_0990
     * @tc.name testBlockingQueueGetEnd099
     * @tc.desc Verify LinkedBlockingQueue getEnd reflects the new tail 2 after push getEnd push sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.getEnd();
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1000
     * @tc.name testBlockingQueueGetEnd100
     * @tc.desc Verify ArrayBlockingQueue getEnd reflects the new tail 2 after push getEnd push sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.getEnd();
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1010
     * @tc.name testBlockingQueueGetEnd101
     * @tc.desc Verify LinkedBlockingQueue capacity 1 single element getEnd returns 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 999;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1020
     * @tc.name testBlockingQueueGetEnd102
     * @tc.desc Verify ArrayBlockingQueue capacity 1 single element getEnd returns 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 999;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1030
     * @tc.name testBlockingQueueGetEnd103
     * @tc.desc Verify LinkedBlockingQueue capacity 1 getEnd returns new element 2 after push poll push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(1);
      q.poll();
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1040
     * @tc.name testBlockingQueueGetEnd104
     * @tc.desc Verify ArrayBlockingQueue capacity 1 getEnd returns new element 2 after push poll push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(1);
      q.poll();
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1050
     * @tc.name testBlockingQueueGetEnd105
     * @tc.desc Verify LinkedBlockingQueue getEnd returns tail 33 while head differs across multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 33;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(11);
      q.push(22);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1060
     * @tc.name testBlockingQueueGetEnd106
     * @tc.desc Verify ArrayBlockingQueue getEnd returns tail 33 rather than head across multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 33;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(11);
      q.push(22);
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1070
     * @tc.name testBlockingQueueGetEnd107
     * @tc.desc Verify LinkedBlockingQueue built from Array.of iterable returns last element 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<int>(5, 6, 7);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.getEnd()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1080
     * @tc.name testBlockingQueueGetEnd108
     * @tc.desc Verify LinkedBlockingQueue with iterable exactly filling capacity returns last element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      let iter = arr.values();
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3, iter);
      expect(q.getEnd()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1090
     * @tc.name testBlockingQueueGetEnd109
     * @tc.desc Verify ArrayBlockingQueue with iterable exactly filling capacity returns last element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Number[] = [1, 2, 3];
      let set: Set<number> = new Set<number>(arr);
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(3, set);
      expect(q.getEnd()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1100
     * @tc.name testBlockingQueueGetEnd110
     * @tc.desc Verify LinkedBlockingQueue with iterable fewer than capacity returns last element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2];
      let iter = arr.values();
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter);
      expect(q.getEnd()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETEND_1110
     * @tc.name testBlockingQueueGetEnd111
     * @tc.desc Verify ArrayBlockingQueue with iterable fewer than capacity returns last element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetEnd111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Number[] = [1, 2];
      let set: Set<number> = new Set<number>(arr);
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10, set);
      expect(q.getEnd()).assertEqual(2);
    });
  });
}
