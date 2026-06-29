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

export default function BlockingQueueStateTransitionTest(): void {
  describe('BlockingQueueStateTransitionTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0100
     * @tc.name testBlockingQueueState001
     * @tc.desc Verify state transition: empty -> partial via push: isEmpty true to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.isEmpty()).assertTrue();
      q.push(PUSH_VALUE);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0200
     * @tc.name testBlockingQueueState002
     * @tc.desc Verify state transition: partial -> full via push: remainingCapacity 1 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_REMAINING_CAPACITY_2: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      q.push(PUSH_VALUE_2);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0300
     * @tc.name testBlockingQueueState003
     * @tc.desc Verify state transition: full -> partial via pop: remainingCapacity 0 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const EXPECTED_REMAINING_CAPACITY_2: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      q.pop();
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0400
     * @tc.name testBlockingQueueState004
     * @tc.desc Verify state transition: partial -> empty via pop: isEmpty false to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.isEmpty()).assertFalse();
      q.pop();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0500
     * @tc.name testBlockingQueueState005
     * @tc.desc Verify full state: add returns false when capacity is full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const ADD_VALUE: int = 4;
      const EXPECTED_SIZE: int = 3;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      expect(q.add(ADD_VALUE)).assertFalse();
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0600
     * @tc.name testBlockingQueueState006
     * @tc.desc Verify empty state: poll returns undefined without blocking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.poll()).assertUndefined();
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0700
     * @tc.name testBlockingQueueState007
     * @tc.desc Verify state cycle: empty -> full -> empty -> full preserves invariants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const CYCLE_MULTIPLIER: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let cy: int = 0; cy < 5; cy++) {
        for (let i: int = 0; i < 3; i++) {
          q.push(cy * CYCLE_MULTIPLIER + i);
        }
        expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
        for (let i: int = 0; i < 3; i++) {
          q.pop();
        }
        expect(q.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0800
     * @tc.name testBlockingQueueState008
     * @tc.desc Verify constructor immediately full: capacity=3 with iterable=[1,2,3] starts full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const ADD_VALUE: int = 4;
      let arr: int[] = [1, 2, 3];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(q.isEmpty()).assertFalse();
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_0900
     * @tc.name testBlockingQueueState009
     * @tc.desc Verify ArrayBlockingQueue immediately full from iterable: capacity=4, iterable=4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 4;
      const EXPECTED_SIZE: int = 4;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const ADD_VALUE: int = 50;
      let arr: int[] = [10, 20, 30, 40];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1000
     * @tc.name testBlockingQueueState010
     * @tc.desc Verify constructor immediately empty: capacity=10 with empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_REMAINING_CAPACITY: int = 10;
      let arr: int[] = [];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertTrue();
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1100
     * @tc.name testBlockingQueueState011
     * @tc.desc Verify state under add: failed add returns false but state unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const ADD_VALUE: int = 4;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      let snapFirst = q.getFirst();
      let snapEnd = q.getEnd();
      let snapSize = q.size;
      expect(q.add(ADD_VALUE)).assertFalse();
      expect(q.getFirst()).assertEqual(snapFirst);
      expect(q.getEnd()).assertEqual(snapEnd);
      expect(q.size).assertEqual(snapSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1200
     * @tc.name testBlockingQueueState012
     * @tc.desc Verify state under poll: failed poll returns undefined, state unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.poll()).assertUndefined();
      expect(q.poll()).assertUndefined();
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1300
     * @tc.name testBlockingQueueState013
     * @tc.desc Verify state under push: getFirst is unchanged when there are already elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      let head = q.getFirst();
      for (let i: int = 2; i < 30; i++) {
        q.push(i);
        expect(q.getFirst()).assertEqual(head);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1400
     * @tc.name testBlockingQueueState014
     * @tc.desc Verify state under pop: getEnd is unchanged when there are still elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = 0; i < 10; i++) {
        q.push(i);
      }
      let tail = q.getEnd();
      while (q.size > 1) {
        q.pop();
        expect(q.getEnd()).assertEqual(tail);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1500
     * @tc.name testBlockingQueueState015
     * @tc.desc Verify post-pop final-element: size=1 -> getFirst=getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: int = 5;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = 1; i <= 5; i++) {
        q.push(i);
      }
      while (q.size > 1) {
        q.pop();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.getFirst()).assertEqual(q.getEnd());
      expect(q.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1600
     * @tc.name testBlockingQueueState016
     * @tc.desc Verify state transition matrix: from 0/n/full state, push/pop/add/poll behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 1;
      const ADD_VALUE_2: int = 2;
      const ADD_VALUE_3: int = 3;
      const ADD_VALUE_4: int = 4;
      const EXPECTED_POLL_VALUE: int = 1;
      const EXPECTED_SIZE: int = 3;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.poll()).assertUndefined();
      expect(q.add(ADD_VALUE)).assertTrue();
      expect(q.add(ADD_VALUE_2)).assertTrue();
      expect(q.add(ADD_VALUE_3)).assertTrue();
      expect(q.add(ADD_VALUE_4)).assertFalse();
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(q.add(ADD_VALUE_4)).assertTrue();
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1700
     * @tc.name testBlockingQueueState017
     * @tc.desc Verify ArrayBlockingQueue state transition matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const ADD_VALUE: int = 10;
      const ADD_VALUE_2: int = 20;
      const ADD_VALUE_3: int = 30;
      const EXPECTED_POLL_VALUE: int = 10;
      const EXPECTED_POLL_VALUE_2: int = 20;
      const EXPECTED_POLL_VALUE_3: int = 30;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(q.poll()).assertUndefined();
      expect(q.add(ADD_VALUE)).assertTrue();
      expect(q.add(ADD_VALUE_2)).assertTrue();
      expect(q.add(ADD_VALUE_3)).assertFalse();
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(q.add(ADD_VALUE_3)).assertTrue();
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE_2);
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE_3);
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1800
     * @tc.name testBlockingQueueState018
     * @tc.desc Verify isEmpty boundary: queue with single element is not empty, getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: int = 0;
      const EXPECTED_FIRST_VALUE: int = 0;
      const EXPECTED_END_VALUE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.isEmpty()).assertFalse();
      expect(q.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      expect(q.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_1900
     * @tc.name testBlockingQueueState019
     * @tc.desc Verify state after rapid push/pop alternation: capacity=3, 100 cycles, ends empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 100; i++) {
        q.push(i);
        q.pop();
      }
      expect(q.isEmpty()).assertTrue();
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2000
     * @tc.name testBlockingQueueState020
     * @tc.desc Verify state machine: stress pattern of 30 cycles with pre-fill, drain, refill, half-drain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const CYCLE_MULTIPLIER: int = 100;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_SIZE_2: int = 5;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let cy: int = 0; cy < 30; cy++) {
        for (let i: int = 0; i < 10; i++) {
          q.push(cy * CYCLE_MULTIPLIER + i);
        }
        expect(q.size).assertEqual(EXPECTED_SIZE);
        for (let i: int = 0; i < 5; i++) {
          q.pop();
        }
        expect(q.size).assertEqual(EXPECTED_SIZE_2);
        for (let i: int = 0; i < 5; i++) {
          q.pop();
        }
        expect(q.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2100
     * @tc.name testBlockingQueueState021
     * @tc.desc Verify capacity=5 ArrayBlockingQueue same stress pattern: 30 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const CYCLE_MULTIPLIER: int = 100;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const EXPECTED_REMAINING_CAPACITY_2: int = 5;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let cy: int = 0; cy < 30; cy++) {
        for (let i: int = 0; i < 5; i++) {
          q.push(cy * CYCLE_MULTIPLIER + i);
        }
        expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
        for (let i: int = 0; i < 5; i++) {
          q.pop();
        }
        expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2200
     * @tc.name testBlockingQueueState022
     * @tc.desc Verify state: poll on empty queue does not affect future push behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_POP_VALUE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 10; i++) {
        expect(q.poll()).assertUndefined();
      }
      q.push(PUSH_VALUE);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2300
     * @tc.name testBlockingQueueState023
     * @tc.desc Verify state: failed add on full queue does not affect future pop behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const ADD_OFFSET: int = 100;
      const EXPECTED_POP_VALUE: int = 1;
      const EXPECTED_POP_VALUE_2: int = 2;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      for (let i: int = 0; i < 10; i++) {
        expect(q.add(i + ADD_OFFSET)).assertFalse();
      }
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2400
     * @tc.name testBlockingQueueState024
     * @tc.desc Verify state: getFirst on empty returns undefined, then push then getFirst returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 99;
      const EXPECTED_FIRST_VALUE: int = 99;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.getFirst()).assertUndefined();
      q.push(PUSH_VALUE);
      expect(q.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      q.pop();
      expect(q.getFirst()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2500
     * @tc.name testBlockingQueueState025
     * @tc.desc Verify state: getEnd returns undefined on empty, after push returns element, after pop empty -> undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 123;
      const EXPECTED_END_VALUE: int = 123;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.getEnd()).assertUndefined();
      q.push(PUSH_VALUE);
      expect(q.getEnd()).assertEqual(EXPECTED_END_VALUE);
      q.pop();
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2600
     * @tc.name testBlockingQueueState026
     * @tc.desc Verify state: queue starts empty, immediately add 1 element, pop, then again - reusable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 100; i++) {
        expect(q.add(i)).assertTrue();
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2700
     * @tc.name testBlockingQueueState027
     * @tc.desc Verify state: ArrayBlockingQueue capacity=1 reusable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 100; i++) {
        expect(q.add(i)).assertTrue();
        expect(q.poll()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2800
     * @tc.name testBlockingQueueState028
     * @tc.desc Verify state: capacity=Int.MAX_VALUE never becomes "full" with add+pop pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueState028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 1000;
      const EXPECTED_REMAINING_CAPACITY: int = 2147483647;
      const EXPECTED_REMAINING_CAPACITY_2: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = 0; i < 1000; i++) {
        expect(q.add(i)).assertTrue();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY - EXPECTED_REMAINING_CAPACITY_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_2900
     * @tc.name testBlockingQueueState029
     * @tc.desc Verify state: empty -> 1 -> 2 -> ... -> capacity, sequence preserves invariants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 20;
      const EXPECTED_REMAINING_CAPACITY_2: int = 1;
      const EXPECTED_FIRST_VALUE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 20; i++) {
        q.push(i);
        expect(q.size).assertEqual(i + EXPECTED_SIZE);
        expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY - i - EXPECTED_REMAINING_CAPACITY_2);
        expect(q.getEnd()).assertEqual(i);
        expect(q.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3000
     * @tc.name testBlockingQueueState030
     * @tc.desc Verify state: capacity -> capacity-1 -> ... -> 0 via pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const EXPECTED_SIZE: int = 20;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 20; i++) {
        q.push(i);
      }
      for (let i: int = 0; i < 20; i++) {
        expect(q.size).assertEqual(EXPECTED_SIZE - i);
        expect(q.pop()).assertEqual(i);
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3100
     * @tc.name testBlockingQueueState031
     * @tc.desc Verify state on capacity=10 with iterable=5 elements: half-full state, can add 5 more
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 5;
      const EXPECTED_SIZE_2: int = 10;
      const ADD_VALUE: int = 11;
      let arr: int[] = [1, 2, 3, 4, 5];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      for (let i: int = 6; i <= 10; i++) {
        expect(q.add(i)).assertTrue();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE_2);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3200
     * @tc.name testBlockingQueueState032
     * @tc.desc Verify state: ArrayBlockingQueue capacity=10 with iterable=5 same half-full transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_SIZE_2: int = 10;
      const ADD_VALUE: int = 11;
      let arr: int[] = [1, 2, 3, 4, 5];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = 6; i <= 10; i++) {
        expect(q.add(i)).assertTrue();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE_2);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3300
     * @tc.name testBlockingQueueState033
     * @tc.desc Verify state idempotence: calling getFirst twice on full queue returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 11;
      const PUSH_VALUE_2: int = 22;
      const PUSH_VALUE_3: int = 33;
      const EXPECTED_VALUE: int = 11;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      let r1 = q.getFirst();
      let r2 = q.getFirst();
      let r3 = q.getFirst();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3400
     * @tc.name testBlockingQueueState034
     * @tc.desc Verify state idempotence: calling isEmpty twice returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.isEmpty()).assertEqual(q.isEmpty());
      q.push(PUSH_VALUE);
      expect(q.isEmpty()).assertEqual(q.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3500
     * @tc.name testBlockingQueueState035
     * @tc.desc Verify state idempotence: calling remainingCapacity twice returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 7;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.remainingCapacity()).assertEqual(q.remainingCapacity());
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      expect(q.remainingCapacity()).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3600
     * @tc.name testBlockingQueueState036
     * @tc.desc Verify state: large queue with 100 elements pop one-by-one preserves head ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = 0; i < 100; i++) {
        q.push(i);
      }
      for (let i: int = 0; i < 100; i++) {
        expect(q.getFirst()).assertEqual(i);
        q.pop();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3700
     * @tc.name testBlockingQueueState037
     * @tc.desc Verify state on capacity=2 oscillating: push push pop pop push push pop pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_OFFSET: int = 1000;
      const EXPECTED_POP_VALUE: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let cy: int = 0; cy < 30; cy++) {
        q.push(cy);
        q.push(cy + PUSH_OFFSET);
        expect(q.pop()).assertEqual(cy);
        expect(q.pop()).assertEqual(cy + EXPECTED_POP_VALUE);
        expect(q.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3800
     * @tc.name testBlockingQueueState038
     * @tc.desc Verify state ArrayBlockingQueue capacity=4 oscillating push x2, pop x2 pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 4;
      const PUSH_OFFSET: int = 100;
      const EXPECTED_POP_VALUE: int = 100;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let cy: int = 0; cy < 30; cy++) {
        q.push(cy);
        q.push(cy + PUSH_OFFSET);
        expect(q.pop()).assertEqual(cy);
        expect(q.pop()).assertEqual(cy + EXPECTED_POP_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_3900
     * @tc.name testBlockingQueueState039
     * @tc.desc Verify state: capacity Int.MAX_VALUE empty queue isEmpty returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2147483647;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.isEmpty()).assertTrue();
      expect(q.getFirst()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4000
     * @tc.name testBlockingQueueState040
     * @tc.desc Verify state: ArrayBlockingQueue capacity Int.MAX_VALUE empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueState040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 200000;
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 200000;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(q.isEmpty()).assertTrue();
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4100
     * @tc.name testBlockingQueueState041
     * @tc.desc Verify state: pop on empty causes blocking; here we only check poll path - returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 7;
      const EXPECTED_POLL_VALUE: int = 7;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.poll()).assertUndefined();
      q.push(PUSH_VALUE);
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4200
     * @tc.name testBlockingQueueState042
     * @tc.desc Verify state in heavily mixed access: 100 calls to size, isEmpty, capacity all consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_CAPACITY: int = 50;
      const EXPECTED_REMAINING_CAPACITY: int = 47;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      for (let i: int = 0; i < 100; i++) {
        expect(q.size).assertEqual(EXPECTED_SIZE);
        expect(q.isEmpty()).assertFalse();
        expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
        expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4300
     * @tc.name testBlockingQueueState043
     * @tc.desc Verify state: poll equals getFirst before poll, and queue size decrements after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 11;
      const PUSH_VALUE_2: int = 22;
      const PUSH_VALUE_3: int = 33;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      let initSize = q.size;
      let head = q.getFirst();
      let polled = q.poll();
      expect(head).assertEqual(polled);
      expect(q.size).assertEqual(initSize - EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4400
     * @tc.name testBlockingQueueState044
     * @tc.desc Verify state: full ArrayBlockingQueue add returns false, size unchanged, getFirst unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 7;
      const PUSH_VALUE_2: int = 8;
      const PUSH_VALUE_3: int = 9;
      const ADD_VALUE: int = 99;
      const EXPECTED_SIZE: int = 3;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      let snapHead = q.getFirst();
      let snapEnd = q.getEnd();
      expect(q.add(ADD_VALUE)).assertFalse();
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.getFirst()).assertEqual(snapHead);
      expect(q.getEnd()).assertEqual(snapEnd);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4500
     * @tc.name testBlockingQueueState045
     * @tc.desc Verify state: from full state, pop releases exactly 1 slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const EXPECTED_REMAINING_CAPACITY_2: int = 1;
      const ADD_VALUE: int = 99;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 5; i++) {
        q.push(i);
      }
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      q.pop();
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      expect(q.add(ADD_VALUE)).assertTrue();
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4600
     * @tc.name testBlockingQueueState046
     * @tc.desc Verify state: capacity boundary state transition with 50 elements pushed/popped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const EXPECTED_SIZE: int = 50;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const EXPECTED_SIZE_2: int = 0;
      const EXPECTED_REMAINING_CAPACITY_2: int = 50;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 50; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      for (let i: int = 0; i < 50; i++) {
        q.pop();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE_2);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4700
     * @tc.name testBlockingQueueState047
     * @tc.desc Verify ArrayBlockingQueue same as State046 transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const EXPECTED_SIZE: int = 50;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 50; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = 0; i < 50; i++) {
        q.pop();
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4800
     * @tc.name testBlockingQueueState048
     * @tc.desc Verify state: independent operations on multiple queues do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 100;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_SIZE_2: int = 1;
      let qa: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let qb: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      qa.push(PUSH_VALUE);
      qa.push(PUSH_VALUE_2);
      qb.push(PUSH_VALUE_3);
      expect(qa.size).assertEqual(EXPECTED_SIZE);
      expect(qb.size).assertEqual(EXPECTED_SIZE_2);
      qb.pop();
      expect(qa.size).assertEqual(EXPECTED_SIZE);
      expect(qb.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_4900
     * @tc.name testBlockingQueueState049
     * @tc.desc Verify state: 10 independent queues operating sequentially are mutually isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const EXPECTED_SIZE: int = 1;
      let queues: containers.BlockingQueue<int>[] = [];
      for (let i: int = 0; i < 10; i++) {
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
        for (let j: int = 0; j < i + 1; j++) {
          q.push(j);
        }
        queues.push(q);
      }
      for (let i: int = 0; i < 10; i++) {
        expect(queues[i].size).assertEqual(i + EXPECTED_SIZE);
      }
      for (let i: int = 0; i < 10; i++) {
        for (let j: int = 0; j < i + 1; j++) {
          expect(queues[i].pop()).assertEqual(j);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_STATE_5000
     * @tc.name testBlockingQueueState050
     * @tc.desc Verify state: queues constructed with same iterable but different capacities have different sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueState050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const CAPACITY_2: int = 7;
      const CAPACITY_3: int = 15;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_SIZE_2: int = 7;
      const EXPECTED_SIZE_3: int = 10;
      const EXPECTED_CAPACITY: int = 3;
      const EXPECTED_CAPACITY_2: int = 7;
      const EXPECTED_CAPACITY_3: int = 15;
      let arr: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY_2, arr);
      let q3: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY_3, arr);
      expect(q1.size).assertEqual(EXPECTED_SIZE);
      expect(q2.size).assertEqual(EXPECTED_SIZE_2);
      expect(q3.size).assertEqual(EXPECTED_SIZE_3);
      expect(q1.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(q2.capacity).assertEqual(EXPECTED_CAPACITY_2);
      expect(q3.capacity).assertEqual(EXPECTED_CAPACITY_3);
    });

  });
}
