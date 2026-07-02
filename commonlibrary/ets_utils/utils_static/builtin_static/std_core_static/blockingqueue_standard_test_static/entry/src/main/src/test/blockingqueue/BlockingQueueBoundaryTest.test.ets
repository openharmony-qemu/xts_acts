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

export default function BlockingQueueBoundaryTest(): void {
  describe('BlockingQueueBoundaryTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0100
     * @tc.name testBlockingQueueBoundary001
     * @tc.desc Verify LinkedBlockingQueue capacity=2 (smallest non-trivial) edge: push 2, third push blocks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const ADD_VALUE: int = 3;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0200
     * @tc.name testBlockingQueueBoundary002
     * @tc.desc Verify ArrayBlockingQueue capacity=2 edge: same behavior as Linked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const ADD_VALUE: int = 1;
      const ADD_VALUE_2: int = 2;
      const ADD_VALUE_3: int = 3;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(q.add(ADD_VALUE)).assertTrue();
      expect(q.add(ADD_VALUE_2)).assertTrue();
      expect(q.add(ADD_VALUE_3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0300
     * @tc.name testBlockingQueueBoundary003
     * @tc.desc Verify capacity=Int.MAX_VALUE-2: queue allows MAX_VALUE-2 elements (test with smaller subset for performance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2147483645;
      const EXPECTED_CAPACITY: int = 2147483645;
      const LOOP_START: int = 0;
      const LOOP_END: int = 100;
      const EXPECTED_REMAINING_CAPACITY: int = 2147483645;
      const EXPECTED_REMAINING_CAPACITY_2: int = 100;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
      }
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY - EXPECTED_REMAINING_CAPACITY_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0400
     * @tc.name testBlockingQueueBoundary004
     * @tc.desc Verify ArrayBlockingQueue with large capacity=100000 (scaled-down proxy for MAX-1) constructs as empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 100000;
      const EXPECTED_CAPACITY: int = 100000;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0500
     * @tc.name testBlockingQueueBoundary005
     * @tc.desc Verify capacity=Int.MIN_VALUE+1 (-2147483647) throws RangeError on LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -2147483647;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0600
     * @tc.name testBlockingQueueBoundary006
     * @tc.desc Verify capacity=Int.MIN_VALUE+1 throws RangeError on ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -2147483647;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0700
     * @tc.name testBlockingQueueBoundary007
     * @tc.desc Verify capacity=-2 throws RangeError on ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -2;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0800
     * @tc.name testBlockingQueueBoundary008
     * @tc.desc Verify capacity=-1000 throws RangeError on ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -1000;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_0900
     * @tc.name testBlockingQueueBoundary009
     * @tc.desc Verify capacity=0 throws RangeError with iterable on LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const CAPACITY: int = 0;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3];
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1000
     * @tc.name testBlockingQueueBoundary010
     * @tc.desc Verify capacity=0 throws RangeError with empty iterable on LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 0;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let arr: int[] = [];
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1100
     * @tc.name testBlockingQueueBoundary011
     * @tc.desc Verify capacity=Int.MIN_VALUE throws RangeError with iterable on LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const CAPACITY: int = -2147483648;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let arr: int[] = [ARRAY_VALUE];
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1200
     * @tc.name testBlockingQueueBoundary012
     * @tc.desc Verify capacity=Int.MIN_VALUE throws RangeError with iterable on ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 5;
      const ARRAY_VALUE_2: int = 6;
      const CAPACITY: int = -2147483648;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2];
        let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1300
     * @tc.name testBlockingQueueBoundary013
     * @tc.desc Verify capacity=2 boundary: fill -> drain -> refill cycles preserve size invariants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const PUSH_VALUE: int = 2;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 1;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_POLLED_VALUE: int = 2;
      const EXPECTED_POLLED_VALUE_2: int = 2;
      const EXPECTED_POLLED_VALUE_3: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let cy: int = LOOP_START; cy < LOOP_END; cy++) {
        q.push(cy * PUSH_VALUE);
        q.push(cy * PUSH_VALUE_2 + PUSH_VALUE_3);
        expect(q.size).assertEqual(EXPECTED_SIZE);
        expect(q.pop()).assertEqual(cy * EXPECTED_POLLED_VALUE);
        expect(q.pop()).assertEqual(cy * EXPECTED_POLLED_VALUE_2 + EXPECTED_POLLED_VALUE_3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1400
     * @tc.name testBlockingQueueBoundary014
     * @tc.desc Verify push value at boundary Int.MAX_VALUE-1 preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 2147483646;
      const EXPECTED_POLLED_VALUE: int = 2147483646;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POLLED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1500
     * @tc.name testBlockingQueueBoundary015
     * @tc.desc Verify push value at boundary Int.MIN_VALUE+1 preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = -2147483647;
      const EXPECTED_POLLED_VALUE: int = -2147483647;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POLLED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1600
     * @tc.name testBlockingQueueBoundary016
     * @tc.desc Verify push -1 (boundary between negative and zero) preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = -1;
      const PUSH_VALUE_2: int = 0;
      const PUSH_VALUE_3: int = 1;
      const EXPECTED_POLLED_VALUE: int = -1;
      const EXPECTED_POLLED_VALUE_2: int = 0;
      const EXPECTED_POLLED_VALUE_3: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      expect(q.pop()).assertEqual(EXPECTED_POLLED_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POLLED_VALUE_2);
      expect(q.pop()).assertEqual(EXPECTED_POLLED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1700
     * @tc.name testBlockingQueueBoundary017
     * @tc.desc Verify capacity=1 single-slot lifecycle: push 1, getFirst, getEnd, pop, push, all return correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
        expect(q.getFirst()).assertEqual(i);
        expect(q.getEnd()).assertEqual(i);
        expect(q.size).assertEqual(EXPECTED_SIZE);
        expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
        expect(q.pop()).assertEqual(i);
        expect(q.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1800
     * @tc.name testBlockingQueueBoundary018
     * @tc.desc Verify ArrayBlockingQueue capacity=1 single-slot lifecycle behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const LOOP_START: int = 0;
      const LOOP_END: int = 30;
      const ADD_OFFSET: int = 1000;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        expect(q.add(i)).assertTrue();
        expect(q.add(i + ADD_OFFSET)).assertFalse();
        expect(q.size).assertEqual(EXPECTED_SIZE);
        expect(q.poll()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_1900
     * @tc.name testBlockingQueueBoundary019
     * @tc.desc Verify capacity=1 string queue with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const EMPTY_STRING: string = "";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_EMPTY_STRING: string = "";
      const ADD_VALUE: string = "x";
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY);
      q.push(EMPTY_STRING);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertFalse();
      expect(q.getFirst()).assertEqual(EXPECTED_EMPTY_STRING);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2000
     * @tc.name testBlockingQueueBoundary020
     * @tc.desc Verify capacity=1 boolean queue with false: false stored, queue still non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: boolean = false;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertFalse();
      expect(q.getFirst()).assertFalse();
      expect(q.getEnd()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2100
     * @tc.name testBlockingQueueBoundary021
     * @tc.desc Verify capacity=Int.MAX_VALUE remainingCapacity computed correctly with 0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2147483647;
      const EXPECTED_REMAINING_CAPACITY: int = 2147483647;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2200
     * @tc.name testBlockingQueueBoundary022
     * @tc.desc Verify capacity=Int.MAX_VALUE remainingCapacity decrements after 1 push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2147483647;
      const PUSH_VALUE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 2147483646;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2300
     * @tc.name testBlockingQueueBoundary023
     * @tc.desc Verify ArrayBlockingQueue with large capacity=50000 (scaled-down proxy for Int.MAX_VALUE) constructs as empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 50000;
      const EXPECTED_CAPACITY: int = 50000;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2400
     * @tc.name testBlockingQueueBoundary024
     * @tc.desc Verify push string with length 0 to capacity=1 queue: still consumes the slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const EMPTY_STRING: string = "";
      const EXPECTED_SIZE: int = 1;
      const ADD_VALUE: string = "anything";
      let q: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      q.push(EMPTY_STRING);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2500
     * @tc.name testBlockingQueueBoundary025
     * @tc.desc Verify pop on capacity=1 empty queue via poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.poll()).assertUndefined();
      expect(q.getFirst()).assertUndefined();
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2600
     * @tc.name testBlockingQueueBoundary026
     * @tc.desc Verify ArrayBlockingQueue capacity=1 empty: pop via poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(q.poll()).assertUndefined();
      expect(q.getFirst()).assertUndefined();
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2700
     * @tc.name testBlockingQueueBoundary027
     * @tc.desc Verify capacity=2 boundary: getFirst differs from getEnd when 2 elements present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 100;
      const PUSH_VALUE_2: int = 200;
      const EXPECTED_FIRST_VALUE: int = 100;
      const EXPECTED_END_VALUE: int = 200;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      expect(q.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      expect(q.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2800
     * @tc.name testBlockingQueueBoundary028
     * @tc.desc Verify ArrayBlockingQueue capacity=2: getFirst differs from getEnd when 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 7;
      const PUSH_VALUE_2: int = 8;
      const EXPECTED_FIRST_VALUE: int = 7;
      const EXPECTED_END_VALUE: int = 8;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      expect(q.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      expect(q.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_2900
     * @tc.name testBlockingQueueBoundary029
     * @tc.desc Verify capacity=3 boundary remainingCapacity decrement sequence: 3,2,1,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_REMAINING_CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const EXPECTED_REMAINING_CAPACITY_2: int = 2;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_REMAINING_CAPACITY_3: int = 1;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_REMAINING_CAPACITY_4: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      q.push(PUSH_VALUE_2);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
      q.push(PUSH_VALUE_3);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3000
     * @tc.name testBlockingQueueBoundary030
     * @tc.desc Verify ArrayBlockingQueue capacity=3 boundary remainingCapacity decrement sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_REMAINING_CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const EXPECTED_REMAINING_CAPACITY_2: int = 2;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_REMAINING_CAPACITY_3: int = 1;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_REMAINING_CAPACITY_4: int = 0;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      q.push(PUSH_VALUE_2);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
      q.push(PUSH_VALUE_3);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3100
     * @tc.name testBlockingQueueBoundary031
     * @tc.desc Verify capacity 1 -> 2 -> 3 -> ... -> 10 sweep: each capacity creates correct queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 1;
      const LOOP_START_2: int = 10;
      const LOOP_START_3: int = 0;
      for (let c: int = LOOP_START; c <= LOOP_START_2; c++) {
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(c);
        expect(q.capacity).assertEqual(c);
        expect(q.remainingCapacity()).assertEqual(c);
        for (let i: int = LOOP_START_3; i < c; i++) {
          q.push(i);
        }
        expect(q.size).assertEqual(c);
        expect(q.add(c)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3200
     * @tc.name testBlockingQueueBoundary032
     * @tc.desc Verify ArrayBlockingQueue capacity 1 -> 10 sweep: each creates correct queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 1;
      const LOOP_START_2: int = 10;
      const LOOP_START_3: int = 0;
      for (let c: int = LOOP_START; c <= LOOP_START_2; c++) {
        let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(c);
        expect(q.capacity).assertEqual(c);
        for (let i: int = LOOP_START_3; i < c; i++) {
          expect(q.add(i)).assertTrue();
        }
        expect(q.add(c)).assertFalse();
        expect(q.size).assertEqual(c);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3300
     * @tc.name testBlockingQueueBoundary033
     * @tc.desc Verify capacity boundary: 100, 1000, 10000 all valid and remainingCapacity correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY_VALUE: int = 100;
      const CAPACITY_VALUE_2: int = 1000;
      const CAPACITY_VALUE_3: int = 10000;
      const LOOP_START: int = 0;
      let caps: int[] = [CAPACITY_VALUE, CAPACITY_VALUE_2, CAPACITY_VALUE_3];
      for (let i: int = LOOP_START; i < caps.length; i++) {
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(caps[i]);
        expect(q.capacity).assertEqual(caps[i]);
        expect(q.remainingCapacity()).assertEqual(caps[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3400
     * @tc.name testBlockingQueueBoundary034
     * @tc.desc Verify push string with high-bit characters (emoji, surrogates) on capacity=1 boundary preserves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: string = "🔥💎🎉";
      const EXPECTED_STRING: string = "🔥💎🎉";
      const ADD_VALUE: string = "more";
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.getFirst()).assertEqual(EXPECTED_STRING);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3500
     * @tc.name testBlockingQueueBoundary035
     * @tc.desc Verify capacity=2 with iterable of 1 element leaves slack of 1 for further push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_VALUE: int = 99;
      const CAPACITY: int = 2;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      const PUSH_VALUE: int = 100;
      const EXPECTED_SIZE_2: int = 2;
      const ADD_VALUE: int = 101;
      let arr: int[] = [ARRAY_VALUE];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.size).assertEqual(EXPECTED_SIZE_2);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3600
     * @tc.name testBlockingQueueBoundary036
     * @tc.desc Verify ArrayBlockingQueue capacity=2 with iterable of 1 element: 1 slot remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_VALUE: int = 42;
      const CAPACITY: int = 2;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      const ADD_VALUE: int = 43;
      const ADD_VALUE_2: int = 44;
      let arr: int[] = [ARRAY_VALUE];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(q.add(ADD_VALUE)).assertTrue();
      expect(q.add(ADD_VALUE_2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3700
     * @tc.name testBlockingQueueBoundary037
     * @tc.desc Verify push string of length 1 (single character) on default queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueBoundary037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CHAR_VALUE: string = "a";
      const CHAR_VALUE_2: string = "Z";
      const CHAR_VALUE_3: string = "0";
      const CHAR_VALUE_4: string = "9";
      const CHAR_VALUE_5: string = " ";
      const CHAR_VALUE_6: string = "!";
      const CHAR_VALUE_7: string = "中";
      const CHAR_VALUE_8: string = "🔥";
      const LOOP_START: int = 0;
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let chars: string[] = [CHAR_VALUE, CHAR_VALUE_2, CHAR_VALUE_3, CHAR_VALUE_4, CHAR_VALUE_5, CHAR_VALUE_6, CHAR_VALUE_7, CHAR_VALUE_8];
      for (let i: int = LOOP_START; i < chars.length; i++) {
        q.push(chars[i]);
        expect(q.pop()).assertEqual(chars[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_BOUNDARY_3800
     * @tc.name testBlockingQueueBoundary038
     * @tc.desc Verify push 100000-character string preserved on default queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueBoundary038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const REPEAT_SOURCE: string = "x";
      const REPEAT_COUNT: int = 100000;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_VALUE: int = 100000;
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let big = REPEAT_SOURCE.repeat(REPEAT_COUNT);
      q.push(big);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      let r = q.pop();
      expect(r.length).assertEqual(EXPECTED_VALUE);
    });

  });
}
