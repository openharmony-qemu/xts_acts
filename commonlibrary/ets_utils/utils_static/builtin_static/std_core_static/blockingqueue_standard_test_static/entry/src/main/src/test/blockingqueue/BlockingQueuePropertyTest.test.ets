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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function BlockingQueuePropertyTest(): void {
  describe('BlockingQueuePropertyTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0100
     * @tc.name testBlockingQueueProperty001
     * @tc.desc Verify LinkedBlockingQueue default constructor: size lifecycle 0 -> 1 -> 11 -> 6 through push and pop operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const PUSH_VALUE: int = 1;
      const EXPECTED_SIZE_2: int = 1;
      const PUSH_OFFSET: int = 2;
      const EXPECTED_SIZE_3: int = 11;
      const EXPECTED_SIZE_4: int = 6;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE_2);
      for (let i = 0; i < 10; i++) {
        queue.push(i + PUSH_OFFSET);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE_3);
      for (let i = 0; i < 5; i++) {
        queue.pop();
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0200
     * @tc.name testBlockingQueueProperty002
     * @tc.desc Verify LinkedBlockingQueue add method: successful add increments size, failed add due to full capacity leaves size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const ADD_VALUE: int = 1;
      const EXPECTED_SIZE: int = 1;
      const ADD_VALUE_2: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      result = queue.add(ADD_VALUE_2);
      expect(result).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0300
     * @tc.name testBlockingQueueProperty003
     * @tc.desc Verify LinkedBlockingQueue poll method: successful poll decrements size, poll on empty queue returns undefined and size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_SIZE_2: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      const EXPECTED_SIZE_3: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      let val: int | undefined = queue.poll();
      expect(val).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE_2);
      val = queue.poll();
      expect(val).assertEqual(EXPECTED_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_SIZE_3);
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(undefined);
      expect(queue.size).assertEqual(EXPECTED_SIZE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0400
     * @tc.name testBlockingQueueProperty004
     * @tc.desc Verify LinkedBlockingQueue getFirst and getEnd methods: size remains unchanged after read-only operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_2: int = 30;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      let first: int | undefined = queue.getFirst();
      expect(first).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      let end: int | undefined = queue.getEnd();
      expect(end).assertEqual(EXPECTED_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0500
     * @tc.name testBlockingQueueProperty005
     * @tc.desc Verify LinkedBlockingQueue with capacity=3: size never exceeds capacity when attempting to add beyond capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_SIZE: int = 3;
      const ADD_VALUE: int = 4;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0600
     * @tc.name testBlockingQueueProperty006
     * @tc.desc Verify LinkedBlockingQueue constructed from sparse array: size only counts non-undefined elements,
     *       5-slot array with 3 filled yields size=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_SIZE: int = 3;
      let arr: int[] = [];
      arr.push(PUSH_VALUE);
      arr.push(PUSH_VALUE_2);
      arr.push(PUSH_VALUE_3);
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0700
     * @tc.name testBlockingQueueProperty007
     * @tc.desc Verify LinkedBlockingQueue string queue: pushing empty string "" results in size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "";
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0800
     * @tc.name testBlockingQueueProperty008
     * @tc.desc Verify ArrayBlockingQueue with capacity=10: push 10 elements size=10, pop 5 elements size=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_SIZE_2: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 10; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      for (let i = 0; i < 5; i++) {
        queue.pop();
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_0900
     * @tc.name testBlockingQueueProperty009
     * @tc.desc Verify LinkedBlockingQueue default constructor: capacity equals 2147483647 (Int.MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1000
     * @tc.name testBlockingQueueProperty010
     * @tc.desc Verify LinkedBlockingQueue with capacity=10: capacity property returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1100
     * @tc.name testBlockingQueueProperty011
     * @tc.desc Verify LinkedBlockingQueue with capacity=1: capacity property returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const EXPECTED_CAPACITY: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1200
     * @tc.name testBlockingQueueProperty012
     * @tc.desc Verify LinkedBlockingQueue with capacity=2147483647: capacity property returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2147483647;
      const EXPECTED_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1300
     * @tc.name testBlockingQueueProperty013
     * @tc.desc Verify LinkedBlockingQueue with iterable-only constructor: capacity defaults to 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_CAPACITY: int = 2147483647;
      let arr: int[] = [1, 2, 3];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1400
     * @tc.name testBlockingQueueProperty014
     * @tc.desc Verify LinkedBlockingQueue with capacity=10 and 3-element iterable: capacity property returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      let arr: int[] = [1, 2, 3];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1500
     * @tc.name testBlockingQueueProperty015
     * @tc.desc Verify LinkedBlockingQueue: push and pop operations do not change capacity, it remains constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      queue.pop();
      queue.pop();
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      queue.pop();
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1600
     * @tc.name testBlockingQueueProperty016
     * @tc.desc Verify ArrayBlockingQueue with capacity=5 and 3-element iterable: size=3, capacity=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_CAPACITY: int = 5;
      let arr: int[] = [10, 20, 30];
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1700
     * @tc.name testBlockingQueueProperty017
     * @tc.desc Verify ArrayBlockingQueue empty queue size reads 0 directly after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1800
     * @tc.name testBlockingQueueProperty018
     * @tc.desc Verify ArrayBlockingQueue capacity reads constructed value directly after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_1900
     * @tc.name testBlockingQueueProperty019
     * @tc.desc Verify empty LinkedBlockingQueue with explicit capacity argument has size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2000
     * @tc.name testBlockingQueueProperty020
     * @tc.desc Verify ArrayBlockingQueue size becomes 1 after pushing one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(0);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2100
     * @tc.name testBlockingQueueProperty021
     * @tc.desc Verify ArrayBlockingQueue size becomes 2 after pushing two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2200
     * @tc.name testBlockingQueueProperty022
     * @tc.desc Verify ArrayBlockingQueue size becomes 3 after pushing three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2300
     * @tc.name testBlockingQueueProperty023
     * @tc.desc Verify ArrayBlockingQueue size becomes 1 after one successful add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(0);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2400
     * @tc.name testBlockingQueueProperty024
     * @tc.desc Verify ArrayBlockingQueue size becomes 2 after two successful adds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(1);
      q.add(2);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2500
     * @tc.name testBlockingQueueProperty025
     * @tc.desc Verify ArrayBlockingQueue size returns to 0 after push then poll one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(7);
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2600
     * @tc.name testBlockingQueueProperty026
     * @tc.desc Verify ArrayBlockingQueue size becomes 1 after pushing two and polling one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      q.poll();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2700
     * @tc.name testBlockingQueueProperty027
     * @tc.desc Verify ArrayBlockingQueue size becomes 1 after pushing three and polling two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.poll();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2800
     * @tc.name testBlockingQueueProperty028
     * @tc.desc Verify ArrayBlockingQueue size returns to 0 after push then pop one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(9);
      q.pop();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_2900
     * @tc.name testBlockingQueueProperty029
     * @tc.desc Verify ArrayBlockingQueue size becomes 1 after pushing two and popping one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      q.pop();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3000
     * @tc.name testBlockingQueueProperty030
     * @tc.desc Verify ArrayBlockingQueue size returns to 0 after add then poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(3);
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3100
     * @tc.name testBlockingQueueProperty031
     * @tc.desc Verify ArrayBlockingQueue size equals capacity after filling the queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3200
     * @tc.name testBlockingQueueProperty032
     * @tc.desc Verify ArrayBlockingQueue with capacity 1 has size 1 after filling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(42);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3300
     * @tc.name testBlockingQueueProperty033
     * @tc.desc Verify ArrayBlockingQueue size unchanged when add returns false on a full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3400
     * @tc.name testBlockingQueueProperty034
     * @tc.desc Verify ArrayBlockingQueue add returns false when adding a third element to a full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      let r: boolean = q.add(3);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3500
     * @tc.name testBlockingQueueProperty035
     * @tc.desc Verify ArrayBlockingQueue add returns true when the queue is not full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.add(1);
      let r: boolean = q.add(2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3600
     * @tc.name testBlockingQueueProperty036
     * @tc.desc Verify ArrayBlockingQueue size becomes 1 after pushing the int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(2147483647);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3700
     * @tc.name testBlockingQueueProperty037
     * @tc.desc Verify ArrayBlockingQueue size becomes 1 after pushing the int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(-2147483648);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3800
     * @tc.name testBlockingQueueProperty038
     * @tc.desc Verify ArrayBlockingQueue size becomes 1 after pushing the value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(-1);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_3900
     * @tc.name testBlockingQueueProperty039
     * @tc.desc Verify LinkedBlockingQueue size becomes 3 after pushing three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4000
     * @tc.name testBlockingQueueProperty040
     * @tc.desc Verify LinkedBlockingQueue size returns to 0 after push then poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(5);
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4100
     * @tc.name testBlockingQueueProperty041
     * @tc.desc Verify LinkedBlockingQueue size becomes 2 after two successful adds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(1);
      q.add(2);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4200
     * @tc.name testBlockingQueueProperty042
     * @tc.desc Verify default-constructor LinkedBlockingQueue size becomes 1 after pushing one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(8);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4300
     * @tc.name testBlockingQueueProperty043
     * @tc.desc Verify ArrayBlockingQueue size returns to 0 after pushing three elements and polling all of them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.poll();
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4400
     * @tc.name testBlockingQueueProperty044
     * @tc.desc Verify ArrayBlockingQueue size stays at 1 after alternating push and poll operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.poll();
      q.push(2);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4500
     * @tc.name testBlockingQueueProperty045
     * @tc.desc Verify ArrayBlockingQueue size becomes 5 after pushing five elements to fill capacity 5 in a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4600
     * @tc.name testBlockingQueueProperty046
     * @tc.desc Verify ArrayBlockingQueue size stays 0 after polling an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4700
     * @tc.name testBlockingQueueProperty047
     * @tc.desc Verify ArrayBlockingQueue constructed from a single-element iterable has size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [99];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4800
     * @tc.name testBlockingQueueProperty048
     * @tc.desc Verify ArrayBlockingQueue constructed from an empty iterable has size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_4900
     * @tc.name testBlockingQueueProperty049
     * @tc.desc Verify ArrayBlockingQueue size equals capacity when iterable element count equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5000
     * @tc.name testBlockingQueueProperty050
     * @tc.desc Verify ArrayBlockingQueue size equals capacity when iterable element count exceeds capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5100
     * @tc.name testBlockingQueueProperty051
     * @tc.desc Verify ArrayBlockingQueue constructed from a Set iterable has size equal to deduplicated element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5200
     * @tc.name testBlockingQueueProperty052
     * @tc.desc Verify ArrayBlockingQueue capacity equals 1 when constructed with capacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      expect(q.capacity).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5300
     * @tc.name testBlockingQueueProperty053
     * @tc.desc Verify ArrayBlockingQueue capacity equals 2 when constructed with capacity 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      expect(q.capacity).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5400
     * @tc.name testBlockingQueueProperty054
     * @tc.desc Verify ArrayBlockingQueue capacity equals 100 when constructed with capacity 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(100);
      expect(q.capacity).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5600
     * @tc.name testBlockingQueueProperty056
     * @tc.desc Verify ArrayBlockingQueue capacity equals 16 when constructed with hexadecimal literal 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0x10);
      expect(q.capacity).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5700
     * @tc.name testBlockingQueueProperty057
     * @tc.desc Verify ArrayBlockingQueue capacity equals 16 when constructed with octal literal 0o20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0o20);
      expect(q.capacity).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5800
     * @tc.name testBlockingQueueProperty058
     * @tc.desc Verify ArrayBlockingQueue capacity equals 10 when constructed with binary literal 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0b1010);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_5900
     * @tc.name testBlockingQueueProperty059
     * @tc.desc Verify LinkedBlockingQueue capacity equals 5 when constructed with capacity 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6000
     * @tc.name testBlockingQueueProperty060
     * @tc.desc Verify ArrayBlockingQueue capacity equals explicit value 8 even when constructed with an iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(8, src);
      expect(q.capacity).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6100
     * @tc.name testBlockingQueueProperty061
     * @tc.desc Verify ArrayBlockingQueue capacity equals 10 when constructed with the arithmetic expression 5 * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5 * 2);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6200
     * @tc.name testBlockingQueueProperty062
     * @tc.desc Verify ArrayBlockingQueue capacity equals 10 when constructed with scientific notation literal 1e1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6300
     * @tc.name testBlockingQueueProperty063
     * @tc.desc Verify ArrayBlockingQueue capacity equals 1000 when constructed with a large capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1000);
      expect(q.capacity).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6400
     * @tc.name testBlockingQueueProperty064
     * @tc.desc Verify number-element ArrayBlockingQueue capacity equals the constructed value 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(20);
      expect(q.capacity).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6500
     * @tc.name testBlockingQueueProperty065
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after pushing one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6600
     * @tc.name testBlockingQueueProperty066
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after pushing multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6700
     * @tc.name testBlockingQueueProperty067
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(1);
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6800
     * @tc.name testBlockingQueueProperty068
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.poll();
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_6900
     * @tc.name testBlockingQueueProperty069
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.pop();
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7000
     * @tc.name testBlockingQueueProperty070
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after filling the queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.capacity).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7100
     * @tc.name testBlockingQueueProperty071
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after filling then emptying the queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.poll();
      q.poll();
      expect(q.capacity).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7200
     * @tc.name testBlockingQueueProperty072
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after a failed add on a full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.capacity).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7300
     * @tc.name testBlockingQueueProperty073
     * @tc.desc Verify default-constructor LinkedBlockingQueue capacity stays int maximum after pushing an element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(1);
      expect(q.capacity).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7400
     * @tc.name testBlockingQueueProperty074
     * @tc.desc Verify ArrayBlockingQueue capacity remains unchanged after multiple rounds of alternating push and poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(1);
      q.poll();
      q.push(2);
      q.poll();
      expect(q.capacity).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7500
     * @tc.name testBlockingQueueProperty075
     * @tc.desc Verify ArrayBlockingQueue capacity equals size when the queue is full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.capacity).assertEqual(q.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7700
     * @tc.name testBlockingQueueProperty077
     * @tc.desc Verify ArrayBlockingQueue construction with capacity 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7800
     * @tc.name testBlockingQueueProperty078
     * @tc.desc Verify ArrayBlockingQueue construction with capacity -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_7900
     * @tc.name testBlockingQueueProperty079
     * @tc.desc Verify ArrayBlockingQueue construction with int minimum capacity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8000
     * @tc.name testBlockingQueueProperty080
     * @tc.desc Verify LinkedBlockingQueue construction with capacity 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8100
     * @tc.name testBlockingQueueProperty081
     * @tc.desc Verify LinkedBlockingQueue construction with capacity -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8200
     * @tc.name testBlockingQueueProperty082
     * @tc.desc Verify ArrayBlockingQueue construction with capacity -100 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8300
     * @tc.name testBlockingQueueProperty083
     * @tc.desc Verify ArrayBlockingQueue size return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      expect(typeof q.size).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8400
     * @tc.name testBlockingQueueProperty084
     * @tc.desc Verify ArrayBlockingQueue capacity return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(typeof q.capacity).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8500
     * @tc.name testBlockingQueueProperty085
     * @tc.desc Verify ArrayBlockingQueue full-queue size equals capacity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(1);
      q.push(2);
      q.push(3);
      q.push(4);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8600
     * @tc.name testBlockingQueueProperty086
     * @tc.desc Verify ArrayBlockingQueue repeated size reads are idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      let a: int = q.size;
      let b: int = q.size;
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8700
     * @tc.name testBlockingQueueProperty087
     * @tc.desc Verify ArrayBlockingQueue repeated capacity reads are idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let a: int = q.capacity;
      let b: int = q.capacity;
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8800
     * @tc.name testBlockingQueueProperty088
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity equals capacity minus size on an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(6);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_8900
     * @tc.name testBlockingQueueProperty089
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity equals capacity minus size on a partially filled queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(6);
      q.push(1);
      q.push(2);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9000
     * @tc.name testBlockingQueueProperty090
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity equals capacity minus size on a full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9100
     * @tc.name testBlockingQueueProperty091
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity is 0 on a full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9200
     * @tc.name testBlockingQueueProperty092
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity equals capacity on an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(8);
      expect(q.remainingCapacity()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9300
     * @tc.name testBlockingQueueProperty093
     * @tc.desc Verify ArrayBlockingQueue with capacity 1 caps size at 1 when pushing then adding overflow element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(1);
      q.add(2);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9400
     * @tc.name testBlockingQueueProperty094
     * @tc.desc Verify LinkedBlockingQueue size return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      expect(typeof q.size).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9500
     * @tc.name testBlockingQueueProperty095
     * @tc.desc Verify LinkedBlockingQueue capacity return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      expect(typeof q.capacity).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9600
     * @tc.name testBlockingQueueProperty096
     * @tc.desc Verify default-constructor LinkedBlockingQueue remainingCapacity equals capacity minus size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(1);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9700
     * @tc.name testBlockingQueueProperty097
     * @tc.desc Verify ArrayBlockingQueue partially filled size plus remainingCapacity equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(1);
      q.push(2);
      expect(q.size + q.remainingCapacity()).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9800
     * @tc.name testBlockingQueueProperty098
     * @tc.desc Verify ArrayBlockingQueue empty-queue size plus remainingCapacity equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(9);
      expect(q.size + q.remainingCapacity()).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_9900
     * @tc.name testBlockingQueueProperty099
     * @tc.desc Verify LinkedBlockingQueue size plus remainingCapacity equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(6);
      q.push(1);
      q.push(2);
      expect(q.size + q.remainingCapacity()).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10000
     * @tc.name testBlockingQueueProperty100
     * @tc.desc Verify ArrayBlockingQueue constructed from an iterable containing undefined skips undefined in size count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int | undefined> = [1, undefined, 2];
      let q: containers.ArrayBlockingQueue<int | undefined> = new containers.ArrayBlockingQueue<int | undefined>(5, src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10100
     * @tc.name testBlockingQueueProperty101
     * @tc.desc Verify ArrayBlockingQueue size increment is 1 after a push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      let before: int = q.size;
      q.push(2);
      expect(q.size - before).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10200
     * @tc.name testBlockingQueueProperty102
     * @tc.desc Verify ArrayBlockingQueue size decrement is 1 after a poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      let before: int = q.size;
      q.poll();
      expect(before - q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10300
     * @tc.name testBlockingQueueProperty103
     * @tc.desc Verify ArrayBlockingQueue size decrement is 1 after a pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      let before: int = q.size;
      q.pop();
      expect(before - q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10400
     * @tc.name testBlockingQueueProperty104
     * @tc.desc Verify ArrayBlockingQueue size increment is 1 after a successful add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(1);
      let before: int = q.size;
      q.add(2);
      expect(q.size - before).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10500
     * @tc.name testBlockingQueueProperty105
     * @tc.desc Verify reading ArrayBlockingQueue capacity does not change size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      let c: int = q.capacity;
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10600
     * @tc.name testBlockingQueueProperty106
     * @tc.desc Verify reading ArrayBlockingQueue size does not change size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      let s: int = q.size;
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10700
     * @tc.name testBlockingQueueProperty107
     * @tc.desc Verify reading ArrayBlockingQueue size does not change capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let s: int = q.size;
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10800
     * @tc.name testBlockingQueueProperty108
     * @tc.desc Verify ArrayBlockingQueue size never exceeds capacity when adding beyond capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      q.add(4);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_10900
     * @tc.name testBlockingQueueProperty109
     * @tc.desc Verify ArrayBlockingQueue size equals 10 after pushing 10 elements in a loop to fill capacity 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 10; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11000
     * @tc.name testBlockingQueueProperty110
     * @tc.desc Verify ArrayBlockingQueue size decreases to 0 after filling then polling all elements in a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      for (let i = 0; i < 4; i++) {
        q.push(i);
      }
      for (let i = 0; i < 4; i++) {
        q.poll();
      }
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11100
     * @tc.name testBlockingQueueProperty111
     * @tc.desc Verify ArrayBlockingQueue constructed from iterable has size equal to capacity minus remainingCapacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(q.capacity - q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11200
     * @tc.name testBlockingQueueProperty112
     * @tc.desc Verify number-element ArrayBlockingQueue size becomes 1 after pushing a fractional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(5);
      q.push(1.5);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11300
     * @tc.name testBlockingQueueProperty113
     * @tc.desc Verify string-element ArrayBlockingQueue size becomes 1 after pushing a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(5);
      q.push('a');
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11400
     * @tc.name testBlockingQueueProperty114
     * @tc.desc Verify ArrayBlockingQueue capacity minus size equals capacity minus 1 after one push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      expect(q.capacity - q.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11500
     * @tc.name testBlockingQueueProperty115
     * @tc.desc Verify ArrayBlockingQueue poll on an empty queue returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r: int | undefined = q.poll();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11600
     * @tc.name testBlockingQueueProperty116
     * @tc.desc Verify ArrayBlockingQueue getFirst on an empty queue keeps size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r: int | undefined = q.getFirst();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11700
     * @tc.name testBlockingQueueProperty117
     * @tc.desc Verify ArrayBlockingQueue getFirst on an empty queue returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r: int | undefined = q.getFirst();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11800
     * @tc.name testBlockingQueueProperty118
     * @tc.desc Verify ArrayBlockingQueue getEnd on an empty queue returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r: int | undefined = q.getEnd();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_11900
     * @tc.name testBlockingQueueProperty119
     * @tc.desc Verify ArrayBlockingQueue getFirst read does not change size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.getFirst();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12000
     * @tc.name testBlockingQueueProperty120
     * @tc.desc Verify ArrayBlockingQueue getEnd read does not change size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.getEnd();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12100
     * @tc.name testBlockingQueueProperty121
     * @tc.desc Verify ArrayBlockingQueue getFirst read does not change capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.getFirst();
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12200
     * @tc.name testBlockingQueueProperty122
     * @tc.desc Verify ArrayBlockingQueue full-queue size equals capacity with remainingCapacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12300
     * @tc.name testBlockingQueueProperty123
     * @tc.desc Verify ArrayBlockingQueue half-filled size is less than capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12400
     * @tc.name testBlockingQueueProperty124
     * @tc.desc Verify ArrayBlockingQueue half-filled remainingCapacity equals capacity minus size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.remainingCapacity()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12500
     * @tc.name testBlockingQueueProperty125
     * @tc.desc Verify LinkedBlockingQueue full-queue size equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12600
     * @tc.name testBlockingQueueProperty126
     * @tc.desc Verify LinkedBlockingQueue empty-queue remainingCapacity equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(7);
      expect(q.remainingCapacity()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12700
     * @tc.name testBlockingQueueProperty127
     * @tc.desc Verify ArrayBlockingQueue constructed from iterable of identical elements has size equal to element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [5, 5, 5];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12800
     * @tc.name testBlockingQueueProperty128
     * @tc.desc Verify ArrayBlockingQueue constructed from iterable of negative values counts size correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1, -2, -3];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_12900
     * @tc.name testBlockingQueueProperty129
     * @tc.desc Verify ArrayBlockingQueue constructed from iterable of boundary values counts size correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647, -2147483648, 0];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_13000
     * @tc.name testBlockingQueueProperty130
     * @tc.desc Verify large-capacity ArrayBlockingQueue size is far below capacity after a small push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1000);
      q.push(1);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_13300
     * @tc.name testBlockingQueueProperty133
     * @tc.desc Verify ArrayBlockingQueue size stays equal to capacity after polling one then pushing one on a full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.push(4);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_13400
     * @tc.name testBlockingQueueProperty134
     * @tc.desc Verify ArrayBlockingQueue size reaches 0 after FIFO consumption of all pushed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      let first: int | undefined = q.poll();
      for (let i = 0; i < 4; i++) {
        q.poll();
      }
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_13500
     * @tc.name testBlockingQueueProperty135
     * @tc.desc Verify number-element ArrayBlockingQueue size becomes 1 after pushing MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(5);
      q.push(Number.MAX_SAFE_INTEGER);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_13600
     * @tc.name testBlockingQueueProperty136
     * @tc.desc Verify number-element ArrayBlockingQueue size becomes 1 after pushing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(5);
      q.push(Number.NaN);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_13700
     * @tc.name testBlockingQueueProperty137
     * @tc.desc Verify number-element ArrayBlockingQueue size becomes 1 after pushing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(5);
      q.push(Number.POSITIVE_INFINITY);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_13800
     * @tc.name testBlockingQueueProperty138
     * @tc.desc Verify ArrayBlockingQueue size truncated to 2 when capacity 2 constructed with 3-element iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2, src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_13900
     * @tc.name testBlockingQueueProperty139
     * @tc.desc Verify ArrayBlockingQueue size truncated to 1 when capacity 1 constructed with 5-element iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1, src);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14000
     * @tc.name testBlockingQueueProperty140
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity is 0 after truncated construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2, src);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14100
     * @tc.name testBlockingQueueProperty141
     * @tc.desc Verify ArrayBlockingQueue size equals capacity after truncated construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2, src);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14200
     * @tc.name testBlockingQueueProperty142
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity is greater than 0 after underfilled iterable construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.remainingCapacity()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14300
     * @tc.name testBlockingQueueProperty143
     * @tc.desc Verify ArrayBlockingQueue size strictly returns to 0 after filling then polling all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      q.poll();
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14400
     * @tc.name testBlockingQueueProperty144
     * @tc.desc Verify ArrayBlockingQueue remaining size is correct after a pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      q.push(3);
      q.pop();
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14500
     * @tc.name testBlockingQueueProperty145
     * @tc.desc Verify ArrayBlockingQueue size decreases by 1 after pop returns the front element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(11);
      q.push(22);
      let v: int = q.pop();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14600
     * @tc.name testBlockingQueueProperty146
     * @tc.desc Verify two independent ArrayBlockingQueue instances have independent capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q1: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      let q2: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(7);
      expect(q1.capacity).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14700
     * @tc.name testBlockingQueueProperty147
     * @tc.desc Verify two independent ArrayBlockingQueue instances have independent size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q1: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let q2: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q1.push(1);
      expect(q2.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14800
     * @tc.name testBlockingQueueProperty148
     * @tc.desc Verify size readable through base BlockingQueue declared type after a push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(1);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PROPERTY_14900
     * @tc.name testBlockingQueueProperty149
     * @tc.desc Verify capacity readable through base BlockingQueue declared type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueProperty149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(8);
      expect(q.capacity).assertEqual(8);
    });
  });
}
