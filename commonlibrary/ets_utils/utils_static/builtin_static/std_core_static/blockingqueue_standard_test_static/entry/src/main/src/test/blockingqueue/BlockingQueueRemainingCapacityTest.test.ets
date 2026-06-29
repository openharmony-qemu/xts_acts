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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function BlockingQueueRemainingCapacityTest(): void {
  describe('BlockingQueueRemainingCapacityTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0100
     * @tc.name testBlockingQueueRemainingCapacity001
     * @tc.desc Verify LinkedBlockingQueue default constructor: new queue remainingCapacity() equals Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_REMAINING_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0200
     * @tc.name testBlockingQueueRemainingCapacity002
     * @tc.desc Verify LinkedBlockingQueue default constructor: push 1 element then remainingCapacity() decreases by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 100;
      const EXPECTED_REMAINING_CAPACITY: int = 2147483646;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0300
     * @tc.name testBlockingQueueRemainingCapacity003
     * @tc.desc Verify LinkedBlockingQueue default constructor: push 10 elements then remainingCapacity() decreases by 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_REMAINING_CAPACITY: int = 2147483637;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = 0; i < 10; i++) {
        queue.push(i);
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0400
     * @tc.name testBlockingQueueRemainingCapacity004
     * @tc.desc Verify LinkedBlockingQueue default constructor: push 5 then pop 3, remainingCapacity() reflects net of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_REMAINING_CAPACITY: int = 2147483645;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 3; i++) {
        queue.pop();
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0500
     * @tc.name testBlockingQueueRemainingCapacity005
     * @tc.desc Verify LinkedBlockingQueue default constructor: push then pop all, remainingCapacity() restored to Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_REMAINING_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 5; i++) {
        queue.pop();
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0600
     * @tc.name testBlockingQueueRemainingCapacity006
     * @tc.desc Verify LinkedBlockingQueue default constructor with string type: push then remainingCapacity() decreases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "test";
      const EXPECTED_REMAINING_CAPACITY: int = 2147483646;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0700
     * @tc.name testBlockingQueueRemainingCapacity007
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: new queue remainingCapacity() equals 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0800
     * @tc.name testBlockingQueueRemainingCapacity008
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: push 3 then remainingCapacity() = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 3; i++) {
        queue.push(i);
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_0900
     * @tc.name testBlockingQueueRemainingCapacity009
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: push 2 more (full) then remainingCapacity() = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1000
     * @tc.name testBlockingQueueRemainingCapacity010
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: pop 1 from full queue, remainingCapacity() = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      queue.pop();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1100
     * @tc.name testBlockingQueueRemainingCapacity011
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: pop all from full queue, remainingCapacity() restored to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 5; i++) {
        queue.pop();
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1200
     * @tc.name testBlockingQueueRemainingCapacity012
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: formula remainingCapacity() = capacity - size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
      queue.push(PUSH_VALUE_3);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1300
     * @tc.name testBlockingQueueRemainingCapacity013
     * @tc.desc Verify LinkedBlockingQueue with 3-element array iterable: remainingCapacity() = Int.MAX_VALUE - 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_REMAINING_CAPACITY: int = 2147483644;
      let arr: int[] = [10, 20, 30];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1400
     * @tc.name testBlockingQueueRemainingCapacity014
     * @tc.desc Verify LinkedBlockingQueue with 3-element iterable: push 2 more, remainingCapacity() decreases accordingly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 40;
      const PUSH_VALUE_2: int = 50;
      const EXPECTED_REMAINING_CAPACITY: int = 2147483642;
      let arr: int[] = [10, 20, 30];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1500
     * @tc.name testBlockingQueueRemainingCapacity015
     * @tc.desc Verify LinkedBlockingQueue capacity=5 with 8-element iterable: overflows, remainingCapacity() = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let arr: int[] = [];
      for (let i = 0; i < 8; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1600
     * @tc.name testBlockingQueueRemainingCapacity016
     * @tc.desc Verify LinkedBlockingQueue capacity=5 with 2-element iterable: remainingCapacity() = 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 3;
      let arr: int[] = [10, 20];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1700
     * @tc.name testBlockingQueueRemainingCapacity017
     * @tc.desc Verify ArrayBlockingQueue lifecycle: initial=10, push 5->5, push 5->0, pop 3->3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 10;
      const EXPECTED_REMAINING_CAPACITY_2: int = 5;
      const PUSH_OFFSET: int = 5;
      const EXPECTED_REMAINING_CAPACITY_3: int = 0;
      const EXPECTED_REMAINING_CAPACITY_4: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      for (let i = 0; i < 5; i++) {
        queue.push(i + PUSH_OFFSET);
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
      for (let i = 0; i < 3; i++) {
        queue.pop();
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1800
     * @tc.name testBlockingQueueRemainingCapacity018
     * @tc.desc Verify ArrayBlockingQueue formula: remainingCapacity() = capacity - size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const PUSH_VALUE_4: int = 4;
      const EXPECTED_REMAINING_CAPACITY: int = 6;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      queue.push(PUSH_VALUE_4);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_1900
     * @tc.name testBlockingQueueRemainingCapacity019
     * @tc.desc Verify ArrayBlockingQueue capacity=5 with 3-element iterable: remainingCapacity() = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 2;
      let arr: int[] = [10, 20, 30];
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2000
     * @tc.name testBlockingQueueRemainingCapacity020
     * @tc.desc Verify LinkedBlockingQueue default constructor: remainingCapacity() = 2147483647, formula holds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_REMAINING_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2100
     * @tc.name testBlockingQueueRemainingCapacity021
     * @tc.desc Verify LinkedBlockingQueue: push 50 elements, pop 30, remainingCapacity recalculates correctly from capacity-size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_REMAINING_CAPACITY: int = 2147483597;
      const EXPECTED_REMAINING_CAPACITY_2: int = 2147483627;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = 0; i < 50; i++) {
        queue.push(i);
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      for (let i = 0; i < 30; i++) {
        queue.pop();
      }
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2200
     * @tc.name testBlockingQueueRemainingCapacity022
     * @tc.desc Verify LinkedBlockingQueue(1): remainingCapacity=1 initially, =0 after push, =1 after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      const PUSH_VALUE: int = 42;
      const EXPECTED_REMAINING_CAPACITY_2: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      queue.pop();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2300
     * @tc.name testBlockingQueueRemainingCapacity023
     * @tc.desc Verify LinkedBlockingQueue(3): add success decrements capacity, add failure leaves capacity unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 2;
      const ADD_VALUE_2: int = 2;
      const EXPECTED_REMAINING_CAPACITY_2: int = 1;
      const ADD_VALUE_3: int = 3;
      const EXPECTED_REMAINING_CAPACITY_3: int = 0;
      const ADD_VALUE_4: int = 4;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.add(ADD_VALUE)).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.add(ADD_VALUE_2)).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      expect(queue.add(ADD_VALUE_3)).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
      expect(queue.add(ADD_VALUE_4)).assertFalse();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2400
     * @tc.name testBlockingQueueRemainingCapacity024
     * @tc.desc Verify LinkedBlockingQueue pre-filled with 3-element iterable: remainingCapacity is Int.MAX_VALUE-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_REMAINING_CAPACITY: int = 2147483644;
      let arr: int[] = [1, 2, 3];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2500
     * @tc.name testBlockingQueueRemainingCapacity025
     * @tc.desc Verify LinkedBlockingQueue(5, 2-element iterable): remainingCapacity=3 initially, formula holds through operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 3;
      const PUSH_VALUE: int = 30;
      const EXPECTED_REMAINING_CAPACITY_2: int = 2;
      let arr: int[] = [10, 20];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      queue.pop();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2600
     * @tc.name testBlockingQueueRemainingCapacity026
     * @tc.desc Verify LinkedBlockingQueue boolean type: remainingCapacity decrements and recovers correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_REMAINING_CAPACITY: int = 3;
      const PUSH_FLAG: boolean = true;
      const PUSH_FLAG_2: boolean = false;
      const EXPECTED_REMAINING_CAPACITY_2: int = 1;
      const EXPECTED_REMAINING_CAPACITY_3: int = 2;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(CAPACITY);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_FLAG);
      queue.push(PUSH_FLAG_2);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      queue.pop();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2700
     * @tc.name testBlockingQueueRemainingCapacity027
     * @tc.desc Verify ArrayBlockingQueue string type: remainingCapacity decrements with push, recovers with pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 4;
      const EXPECTED_REMAINING_CAPACITY: int = 4;
      const PUSH_TEXT: string = "a";
      const PUSH_TEXT_2: string = "b";
      const PUSH_TEXT_3: string = "c";
      const EXPECTED_REMAINING_CAPACITY_2: int = 1;
      const EXPECTED_REMAINING_CAPACITY_3: int = 2;
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      queue.push(PUSH_TEXT_3);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      queue.pop();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
      expect(queue.remainingCapacity()).assertEqual((queue.capacity - queue.size));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2800
     * @tc.name testBlockingQueueRemainingCapacity028
     * @tc.desc Verify LinkedBlockingQueue remainingCapacity() returns capacity for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r = q.remainingCapacity();
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_2900
     * @tc.name testBlockingQueueRemainingCapacity029
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity() returns capacity for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let r = q.remainingCapacity();
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3000
     * @tc.name testBlockingQueueRemainingCapacity030
     * @tc.desc Verify empty ArrayBlockingQueue with capacity 5 remainingCapacity() returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(q.remainingCapacity()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3100
     * @tc.name testBlockingQueueRemainingCapacity031
     * @tc.desc Verify empty ArrayBlockingQueue with capacity 1 remainingCapacity() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      expect(q.remainingCapacity()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3200
     * @tc.name testBlockingQueueRemainingCapacity032
     * @tc.desc Verify empty LinkedBlockingQueue with capacity 2 remainingCapacity() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      expect(q.remainingCapacity()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3300
     * @tc.name testBlockingQueueRemainingCapacity033
     * @tc.desc Verify empty ArrayBlockingQueue with capacity 200 remainingCapacity() returns 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(200);
      expect(q.remainingCapacity()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3400
     * @tc.name testBlockingQueueRemainingCapacity034
     * @tc.desc Verify empty LinkedBlockingQueue with capacity 1000 remainingCapacity() returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1000);
      expect(q.remainingCapacity()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3500
     * @tc.name testBlockingQueueRemainingCapacity035
     * @tc.desc Verify empty ArrayBlockingQueue with capacity 65536 remainingCapacity() returns 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(65536);
      expect(q.remainingCapacity()).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3600
     * @tc.name testBlockingQueueRemainingCapacity036
     * @tc.desc Verify LinkedBlockingQueue hexadecimal capacity literal 0x10 yields remainingCapacity() 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0x10);
      expect(q.remainingCapacity()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3700
     * @tc.name testBlockingQueueRemainingCapacity037
     * @tc.desc Verify LinkedBlockingQueue octal capacity literal 0o17 yields remainingCapacity() 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0o17);
      expect(q.remainingCapacity()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3800
     * @tc.name testBlockingQueueRemainingCapacity038
     * @tc.desc Verify LinkedBlockingQueue binary capacity literal 0b1000 yields remainingCapacity() 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0b1000);
      expect(q.remainingCapacity()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_3900
     * @tc.name testBlockingQueueRemainingCapacity039
     * @tc.desc Verify ArrayBlockingQueue hexadecimal capacity literal 0x100 yields remainingCapacity() 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0x100);
      expect(q.remainingCapacity()).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4000
     * @tc.name testBlockingQueueRemainingCapacity040
     * @tc.desc Verify ArrayBlockingQueue capacity 1 filled with 1 element remainingCapacity() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.add(0);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4100
     * @tc.name testBlockingQueueRemainingCapacity041
     * @tc.desc Verify ArrayBlockingQueue poll 1 element increases remainingCapacity() by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(0);
      q.add(1);
      let before = q.remainingCapacity();
      q.poll();
      expect(q.remainingCapacity()).assertEqual(before + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4200
     * @tc.name testBlockingQueueRemainingCapacity042
     * @tc.desc Verify empty ArrayBlockingQueue poll returns undefined and remainingCapacity() stays at capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.poll();
      expect(q.remainingCapacity()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4300
     * @tc.name testBlockingQueueRemainingCapacity043
     * @tc.desc Verify ArrayBlockingQueue poll all elements restores remainingCapacity() to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.add(0);
      q.add(1);
      q.add(2);
      q.poll();
      q.poll();
      q.poll();
      expect(q.remainingCapacity()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4400
     * @tc.name testBlockingQueueRemainingCapacity044
     * @tc.desc Verify ArrayBlockingQueue arithmetic expression capacity 5 * 2 yields remainingCapacity() 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5 * 2);
      expect(q.remainingCapacity()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4500
     * @tc.name testBlockingQueueRemainingCapacity045
     * @tc.desc Verify ArrayBlockingQueue constructed with capacity 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4600
     * @tc.name testBlockingQueueRemainingCapacity046
     * @tc.desc Verify ArrayBlockingQueue constructed with capacity -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4700
     * @tc.name testBlockingQueueRemainingCapacity047
     * @tc.desc Verify LinkedBlockingQueue constructed with capacity 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4800
     * @tc.name testBlockingQueueRemainingCapacity048
     * @tc.desc Verify LinkedBlockingQueue constructed with negative capacity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_4900
     * @tc.name testBlockingQueueRemainingCapacity049
     * @tc.desc Verify ArrayBlockingQueue constructed from Set decreases remainingCapacity() by set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, s);
      expect(q.remainingCapacity()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_5000
     * @tc.name testBlockingQueueRemainingCapacity050
     * @tc.desc Verify ArrayBlockingQueue with number(float) type element push decreases remainingCapacity() by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(3.14);
      expect(q.remainingCapacity()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_5100
     * @tc.name testBlockingQueueRemainingCapacity051
     * @tc.desc Verify LinkedBlockingQueue push max int boundary value decreases remainingCapacity() by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(2147483647);
      expect(q.remainingCapacity()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_5200
     * @tc.name testBlockingQueueRemainingCapacity052
     * @tc.desc Verify LinkedBlockingQueue push min int boundary value decreases remainingCapacity() by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(-2147483648);
      expect(q.remainingCapacity()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_5300
     * @tc.name testBlockingQueueRemainingCapacity053
     * @tc.desc Verify ArrayBlockingQueue getFirst does not change remainingCapacity()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(0);
      q.add(1);
      let before = q.remainingCapacity();
      q.getFirst();
      expect(q.remainingCapacity()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_5400
     * @tc.name testBlockingQueueRemainingCapacity054
     * @tc.desc Verify ArrayBlockingQueue getEnd does not change remainingCapacity()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(0);
      q.add(1);
      let before = q.remainingCapacity();
      q.getEnd();
      expect(q.remainingCapacity()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_5500
     * @tc.name testBlockingQueueRemainingCapacity055
     * @tc.desc Verify LinkedBlockingQueue constructed with capacity 2147483647 returns remainingCapacity() 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2147483647);
      expect(q.remainingCapacity()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_5600
     * @tc.name testBlockingQueueRemainingCapacity056
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity() call does not change size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(0);
      q.add(1);
      q.remainingCapacity();
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_REMAININGCAPACITY_5700
     * @tc.name testBlockingQueueRemainingCapacity057
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity() call leaves queue content intact for subsequent poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueRemainingCapacity057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(42);
      q.remainingCapacity();
      expect(q.poll()).assertEqual(42);
    });
  });
}
