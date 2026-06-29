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

class AlgObj {
  v: int = 0;

  constructor(v: int) {
    this.v = v;
  }
}

export default function BlockingQueueAlgebraicTest(): void {
  describe('BlockingQueueAlgebraicTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0100
     * @tc.name testBlockingQueueAlgebraic001
     * @tc.desc Verify FIFO invariant: pop sequence equals push sequence on LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const PUSH_VALUE: int = 7;
      const PUSH_VALUE_2: int = 3;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 50;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let pushed: int[] = [];
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        pushed.push(i * PUSH_VALUE + PUSH_VALUE_2);
        q.push(pushed[i]);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        expect(q.pop()).assertEqual(pushed[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0200
     * @tc.name testBlockingQueueAlgebraic002
     * @tc.desc Verify FIFO invariant on ArrayBlockingQueue: pop sequence equals push sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 100;
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 50;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0300
     * @tc.name testBlockingQueueAlgebraic003
     * @tc.desc Verify size + remainingCapacity = capacity invariant after each push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const EXPECTED_REMAINING_CAPACITY: int = 50;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
        expect(q.size + q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0400
     * @tc.name testBlockingQueueAlgebraic004
     * @tc.desc Verify size + remainingCapacity = capacity invariant after each pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const LOOP_START: int = 0;
      const LOOP_END: int = 20;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 20;
      const EXPECTED_REMAINING_CAPACITY: int = 20;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        q.pop();
        expect(q.size + q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0500
     * @tc.name testBlockingQueueAlgebraic005
     * @tc.desc Verify isEmpty equivalent to size===0 across multiple state transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 0;
      const PUSH_VALUE: int = 1;
      const EXPECTED_SIZE_2: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_SIZE_3: int = 2;
      const EXPECTED_SIZE_4: int = 1;
      const EXPECTED_SIZE_5: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertTrue();
      q.push(PUSH_VALUE);
      expect(q.size).assertEqual(EXPECTED_SIZE_2);
      expect(q.isEmpty()).assertFalse();
      q.push(PUSH_VALUE_2);
      expect(q.size).assertEqual(EXPECTED_SIZE_3);
      expect(q.isEmpty()).assertFalse();
      q.pop();
      expect(q.size).assertEqual(EXPECTED_SIZE_4);
      expect(q.isEmpty()).assertFalse();
      q.pop();
      expect(q.size).assertEqual(EXPECTED_SIZE_5);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0600
     * @tc.name testBlockingQueueAlgebraic006
     * @tc.desc Verify getFirst idempotent: 100 calls return same value with size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 42;
      const PUSH_VALUE_2: int = 43;
      const LOOP_START: int = 0;
      const LOOP_END: int = 100;
      const EXPECTED_FIRST_VALUE: int = 42;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      let initSize = q.size;
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        expect(q.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
        expect(q.size).assertEqual(initSize);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0700
     * @tc.name testBlockingQueueAlgebraic007
     * @tc.desc Verify getEnd idempotent: 100 calls return same value with size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 99;
      const PUSH_VALUE_2: int = 100;
      const PUSH_VALUE_3: int = 101;
      const LOOP_START: int = 0;
      const LOOP_END: int = 100;
      const EXPECTED_END_VALUE: int = 101;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      let initSize = q.size;
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        expect(q.getEnd()).assertEqual(EXPECTED_END_VALUE);
        expect(q.size).assertEqual(initSize);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0800
     * @tc.name testBlockingQueueAlgebraic008
     * @tc.desc Verify size invariant: pure read methods (getFirst, getEnd, isEmpty, remainingCapacity, size, capacity) never change size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      let s = q.size;
      let c = q.capacity;
      q.getFirst();
      q.getEnd();
      q.isEmpty();
      q.remainingCapacity();
      expect(q.size).assertEqual(s);
      expect(q.capacity).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_0900
     * @tc.name testBlockingQueueAlgebraic009
     * @tc.desc Verify capacity invariant: capacity unchanged across all operation types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 7;
      const EXPECTED_CAPACITY: int = 7;
      const PUSH_VALUE: int = 1;
      const EXPECTED_CAPACITY_2: int = 7;
      const ADD_VALUE: int = 2;
      const EXPECTED_CAPACITY_3: int = 7;
      const EXPECTED_CAPACITY_4: int = 7;
      const EXPECTED_CAPACITY_5: int = 7;
      const PUSH_VALUE_2: int = 3;
      const EXPECTED_CAPACITY_6: int = 7;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY_2);
      q.add(ADD_VALUE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY_3);
      q.pop();
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY_4);
      q.poll();
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY_5);
      q.push(PUSH_VALUE_2);
      q.getFirst();
      q.getEnd();
      q.isEmpty();
      q.remainingCapacity();
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY_6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1000
     * @tc.name testBlockingQueueAlgebraic010
     * @tc.desc Verify push then pop returns input element (left-inverse property)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const VALUE: int = 0;
      const VALUE_2: int = 1;
      const VALUE_3: int = -1;
      const VALUE_4: int = 100;
      const VALUE_5: int = -100;
      const VALUE_6: int = 2147483647;
      const VALUE_7: int = -2147483648;
      const LOOP_START: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let vals: int[] = [VALUE, VALUE_2, VALUE_3, VALUE_4, VALUE_5, VALUE_6, VALUE_7];
      for (let i: int = LOOP_START; i < vals.length; i++) {
        q.push(vals[i]);
        expect(q.pop()).assertEqual(vals[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1100
     * @tc.name testBlockingQueueAlgebraic011
     * @tc.desc Verify add then poll returns input element (left-inverse for non-blocking pair)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const VALUE: int = 42;
      const VALUE_2: int = 0;
      const VALUE_3: int = -7;
      const VALUE_4: int = 1000;
      const LOOP_START: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let vals: int[] = [VALUE, VALUE_2, VALUE_3, VALUE_4];
      for (let i: int = LOOP_START; i < vals.length; i++) {
        expect(q.add(vals[i])).assertTrue();
        expect(q.poll()).assertEqual(vals[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1200
     * @tc.name testBlockingQueueAlgebraic012
     * @tc.desc Verify push n elements then pop n elements returns to initial state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 30;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 30;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let initialSize = q.size;
      let initialCap = q.capacity;
      let initialEmpty = q.isEmpty();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        q.pop();
      }
      expect(q.size).assertEqual(initialSize);
      expect(q.capacity).assertEqual(initialCap);
      expect(q.isEmpty()).assertEqual(initialEmpty);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1300
     * @tc.name testBlockingQueueAlgebraic013
     * @tc.desc Verify getFirst === pop next-return (peek consistency)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 20;
      const PUSH_VALUE: int = 13;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 20;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i * PUSH_VALUE);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        let peek = q.getFirst();
        expect(q.pop()).assertEqual(peek);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1400
     * @tc.name testBlockingQueueAlgebraic014
     * @tc.desc Verify getFirst === poll next-return (peek/poll consistency)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 20;
      const PUSH_VALUE: int = 17;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 20;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i * PUSH_VALUE);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        let peek = q.getFirst();
        expect(q.poll()).assertEqual(peek);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1500
     * @tc.name testBlockingQueueAlgebraic015
     * @tc.desc Verify getEnd === last-pushed-value invariant on default capacity LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 30;
      const PUSH_VALUE: int = 1000;
      const EXPECTED_END_VALUE: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i + PUSH_VALUE);
        expect(q.getEnd()).assertEqual(i + EXPECTED_END_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1600
     * @tc.name testBlockingQueueAlgebraic016
     * @tc.desc Verify getFirst on single-element queue equals getEnd (head=tail invariant)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = -10;
      const LOOP_START_2: int = 10;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let v: int = LOOP_START; v <= LOOP_START_2; v++) {
        q.push(v);
        expect(q.getFirst()).assertEqual(q.getEnd());
        q.pop();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1700
     * @tc.name testBlockingQueueAlgebraic017
     * @tc.desc Verify size monotonicity under pure push: size never decreases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 100;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
        expect(q.size).assertEqual(i + EXPECTED_SIZE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1800
     * @tc.name testBlockingQueueAlgebraic018
     * @tc.desc Verify size monotonicity under pure pop: size never increases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 50;
      const EXPECTED_SIZE: int = 49;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        q.pop();
        expect(q.size).assertEqual(EXPECTED_SIZE - i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_1900
     * @tc.name testBlockingQueueAlgebraic019
     * @tc.desc Verify push always increases size by exactly 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        let before = q.size;
        q.push(i);
        expect(q.size).assertEqual(before + EXPECTED_SIZE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2000
     * @tc.name testBlockingQueueAlgebraic020
     * @tc.desc Verify pop on non-empty always decreases size by exactly 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
      }
      while (!q.isEmpty()) {
        let before = q.size;
        q.pop();
        expect(q.size).assertEqual(before - EXPECTED_SIZE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2100
     * @tc.name testBlockingQueueAlgebraic021
     * @tc.desc Verify add on non-full always increases size by exactly 1 and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        let before = q.size;
        let r = q.add(i);
        expect(r).assertTrue();
        expect(q.size).assertEqual(before + EXPECTED_SIZE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2200
     * @tc.name testBlockingQueueAlgebraic022
     * @tc.desc Verify add on full always returns false and leaves size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const LOOP_START: int = 0;
      const LOOP_END: int = 20;
      const ADD_OFFSET: int = 100;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        let before = q.size;
        let r = q.add(i + ADD_OFFSET);
        expect(r).assertFalse();
        expect(q.size).assertEqual(before);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2300
     * @tc.name testBlockingQueueAlgebraic023
     * @tc.desc Verify poll on non-empty decreases size by 1 and returns valid element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 30;
      const INITIAL_VALUE: int = 0;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.push(i);
      }
      let expected: int = INITIAL_VALUE;
      while (!q.isEmpty()) {
        let before = q.size;
        let r = q.poll();
        expect(r).assertEqual(expected);
        expect(q.size).assertEqual(before - EXPECTED_SIZE);
        expected++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2400
     * @tc.name testBlockingQueueAlgebraic024
     * @tc.desc Verify poll on empty leaves size unchanged at 0 and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 20;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        let before = q.size;
        let r = q.poll();
        expect(r).assertUndefined();
        expect(q.size).assertEqual(before);
        expect(q.size).assertEqual(EXPECTED_SIZE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2500
     * @tc.name testBlockingQueueAlgebraic025
     * @tc.desc Verify pop on non-empty decreases size and returns FIFO head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const VALUE: int = 10;
      const VALUE_2: int = 20;
      const VALUE_3: int = 30;
      const VALUE_4: int = 40;
      const VALUE_5: int = 50;
      const LOOP_START: int = 0;
      const LOOP_START_2: int = 0;
      const EXPECTED_SIZE: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let inputs: int[] = [VALUE, VALUE_2, VALUE_3, VALUE_4, VALUE_5];
      for (let i: int = LOOP_START; i < inputs.length; i++) {
        q.push(inputs[i]);
      }
      for (let i: int = LOOP_START_2; i < inputs.length; i++) {
        let before = q.size;
        let r = q.pop();
        expect(r).assertEqual(inputs[i]);
        expect(q.size).assertEqual(before - EXPECTED_SIZE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2600
     * @tc.name testBlockingQueueAlgebraic026
     * @tc.desc Verify size always equals number of successful pushes minus successful pops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const INITIAL_VALUE: int = 0;
      const INITIAL_VALUE_2: int = 0;
      const LOOP_START: int = 0;
      const LOOP_END: int = 200;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_SIZE_2: int = 0;
      const EXPECTED_SIZE_3: int = 50;
      const EXPECTED_SIZE_4: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let pushes: int = INITIAL_VALUE;
      let pops: int = INITIAL_VALUE_2;
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        if (i % EXPECTED_SIZE == EXPECTED_SIZE_2 && q.size < EXPECTED_SIZE_3) {
          q.push(i);
          pushes++;
        } else if (q.size > EXPECTED_SIZE_4) {
          q.pop();
          pops++;
        }
        expect(q.size).assertEqual(pushes - pops);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2700
     * @tc.name testBlockingQueueAlgebraic027
     * @tc.desc Verify capacity equals constructor parameter for both implementations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY_VALUE: int = 1;
      const CAPACITY_VALUE_2: int = 2;
      const CAPACITY_VALUE_3: int = 5;
      const CAPACITY_VALUE_4: int = 10;
      const CAPACITY_VALUE_5: int = 100;
      const CAPACITY_VALUE_6: int = 1000;
      const CAPACITY_VALUE_7: int = 10000;
      const CAPACITY_VALUE_8: int = 100000;
      const LOOP_START: int = 0;
      const CAPACITY: int = 2147483647;
      const EXPECTED_CAPACITY: int = 2147483647;
      let caps: int[] =
        [CAPACITY_VALUE, CAPACITY_VALUE_2, CAPACITY_VALUE_3, CAPACITY_VALUE_4, CAPACITY_VALUE_5, CAPACITY_VALUE_6,
          CAPACITY_VALUE_7, CAPACITY_VALUE_8];
      for (let i: int = LOOP_START; i < caps.length; i++) {
        let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(caps[i]);
        let q2: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(caps[i]);
        expect(q1.capacity).assertEqual(caps[i]);
        expect(q2.capacity).assertEqual(caps[i]);
      }
      let qBig: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(qBig.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2800
     * @tc.name testBlockingQueueAlgebraic028
     * @tc.desc Verify default LinkedBlockingQueue.capacity equals Int.MAX_VALUE invariant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 10;
      const EXPECTED_CAPACITY: int = 2147483647;
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
        expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_2900
     * @tc.name testBlockingQueueAlgebraic029
     * @tc.desc Verify both implementations same observable behavior for same operations on capacity=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const CAPACITY_2: int = 10;
      const LOOP_START: int = 0;
      const LOOP_END: int = 10;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let q2: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY_2);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q1.push(i);
        q2.push(i);
        expect(q1.size).assertEqual(q2.size);
        expect(q1.getFirst()).assertEqual(q2.getFirst());
        expect(q1.getEnd()).assertEqual(q2.getEnd());
      }
      while (!q1.isEmpty()) {
        expect(q1.pop()).assertEqual(q2.pop());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3000
     * @tc.name testBlockingQueueAlgebraic030
     * @tc.desc Verify reflexivity of getFirst: q1=q2 (same construction) -> q1.getFirst()=q2.getFirst()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_VALUE: int = 5;
      const ARRAY_VALUE_2: int = 10;
      const ARRAY_VALUE_3: int = 15;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3];
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q1.getFirst()).assertEqual(q2.getFirst());
      expect(q1.getEnd()).assertEqual(q2.getEnd());
      expect(q1.size).assertEqual(q2.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3100
     * @tc.name testBlockingQueueAlgebraic031
     * @tc.desc Verify FIFO commutativity does NOT hold (queues are not commutative): different push order yields different pop order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 2;
      const PUSH_VALUE_4: int = 1;
      const EXPECTED_POLLED_VALUE: int = 1;
      const EXPECTED_POLLED_VALUE_2: int = 2;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q1.push(PUSH_VALUE);
      q1.push(PUSH_VALUE_2);
      q2.push(PUSH_VALUE_3);
      q2.push(PUSH_VALUE_4);
      expect(q1.pop()).assertEqual(EXPECTED_POLLED_VALUE);
      expect(q2.pop()).assertEqual(EXPECTED_POLLED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3200
     * @tc.name testBlockingQueueAlgebraic032
     * @tc.desc Verify total transferred elements: pushes - pops = final size for any pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const INITIAL_VALUE: int = 0;
      const INITIAL_VALUE_2: int = 0;
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const EXPECTED_SIZE: int = 20;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 10;
      const EXPECTED_SIZE_2: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let pushes: int = INITIAL_VALUE;
      let pops: int = INITIAL_VALUE_2;
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        if (q.size < EXPECTED_SIZE) {
          q.push(i);
          pushes++;
        }
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        if (q.size > EXPECTED_SIZE_2) {
          q.pop();
          pops++;
        }
      }
      expect(q.size).assertEqual(pushes - pops);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3300
     * @tc.name testBlockingQueueAlgebraic033
     * @tc.desc Verify capacity bound: size never exceeds capacity even with many add attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAlgebraic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 7;
      const LOOP_START: int = 0;
      const LOOP_END: int = 1000;
      const VALUE: int = 7;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_SIZE_2: int = 7;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.add(i);
        if (i < VALUE) {
          expect(q.size).assertEqual(i + EXPECTED_SIZE);
        } else {
          expect(q.size).assertEqual(EXPECTED_SIZE_2);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3400
     * @tc.name testBlockingQueueAlgebraic034
     * @tc.desc Verify ArrayBlockingQueue capacity bound: size never exceeds capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAlgebraic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const LOOP_START: int = 0;
      const LOOP_END: int = 1000;
      const VALUE: int = 5;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_SIZE_2: int = 5;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.add(i);
        if (i < VALUE) {
          expect(q.size).assertEqual(i + EXPECTED_SIZE);
        } else {
          expect(q.size).assertEqual(EXPECTED_SIZE_2);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3500
     * @tc.name testBlockingQueueAlgebraic035
     * @tc.desc Verify size lower bound: size never goes below 0 after many pop attempts on empty queue (poll case)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 100;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.poll();
        expect(q.size).assertEqual(EXPECTED_SIZE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3600
     * @tc.name testBlockingQueueAlgebraic036
     * @tc.desc Verify remainingCapacity upper bound: never exceeds capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const INITIAL_VALUE: int = 0;
      const LOOP_START: int = 0;
      const LOOP_END: int = 30;
      const EXPECTED_SIZE: int = 20;
      const VALUE: int = 2;
      const INITIAL_VALUE_2: int = 0;
      const EXPECTED_REMAINING_CAPACITY: int = 20;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let expectedSize: int = INITIAL_VALUE;
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        if (q.size < EXPECTED_SIZE) {
          q.push(i);
          expectedSize++;
        }
        if (i % VALUE === INITIAL_VALUE_2) {
          q.pop();
          expectedSize--;
        }
        expect(q.size).assertEqual(expectedSize);
        expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY - expectedSize);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3700
     * @tc.name testBlockingQueueAlgebraic037
     * @tc.desc Verify remainingCapacity lower bound: never goes below 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const VALUE: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 4;
      const EXPECTED_REMAINING_CAPACITY_2: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q.add(i);
        if (i < VALUE) {
          expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY - i);
        } else {
          expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3800
     * @tc.name testBlockingQueueAlgebraic038
     * @tc.desc Verify isEmpty contradicts size>0: not(isEmpty) iff size>0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const INITIAL_VALUE: int = 0;
      const LOOP_START: int = 0;
      const LOOP_END: int = 30;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_SIZE_2: int = 0;
      const EXPECTED_SIZE_3: int = 20;
      const EXPECTED_SIZE_4: int = 0;
      const VALUE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let expectedSize: int = INITIAL_VALUE;
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        if (i % EXPECTED_SIZE === EXPECTED_SIZE_2 && q.size < EXPECTED_SIZE_3) {
          q.push(i);
          expectedSize++;
        } else if (q.size > EXPECTED_SIZE_4) {
          q.pop();
          expectedSize--;
        }
        expect(q.size).assertEqual(expectedSize);
        if (expectedSize > VALUE) {
          expect(q.isEmpty()).assertFalse();
        } else {
          expect(q.isEmpty()).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_3900
     * @tc.name testBlockingQueueAlgebraic039
     * @tc.desc Verify push then poll correctly returns input value (alternative left-inverse with non-blocking poll)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EMPTY_STRING: string = "";
      const STRING_VALUE: string = "a";
      const STRING_VALUE_2: string = "中";
      const STRING_VALUE_3: string = "🔥";
      const STRING_VALUE_4: string = "test";
      const LOOP_START: int = 0;
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let vals: string[] = [EMPTY_STRING, STRING_VALUE, STRING_VALUE_2, STRING_VALUE_3, STRING_VALUE_4];
      for (let i: int = LOOP_START; i < vals.length; i++) {
        q.push(vals[i]);
        expect(q.poll()).assertEqual(vals[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4000
     * @tc.name testBlockingQueueAlgebraic040
     * @tc.desc Verify add successful equivalent to push (size delta same)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const CAPACITY_2: int = 20;
      const LOOP_START: int = 0;
      const LOOP_END: int = 15;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 15;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY_2);
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q1.push(i);
        expect(q2.add(i)).assertTrue();
        expect(q1.size).assertEqual(q2.size);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        expect(q1.pop()).assertEqual(q2.pop());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4100
     * @tc.name testBlockingQueueAlgebraic041
     * @tc.desc Verify pop equivalent to poll on non-empty queue (returned value same)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 10;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 10;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        q1.push(i);
        q2.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        expect(q1.pop()).assertEqual(q2.poll());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4200
     * @tc.name testBlockingQueueAlgebraic042
     * @tc.desc Verify object reference identity preserved through push/pop roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 20;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 20;
      let q: containers.BlockingQueue<AlgObj> = new containers.LinkedBlockingQueue<AlgObj>();
      let objs: AlgObj[] = [];
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        let o = new AlgObj(i);
        objs.push(o);
        q.push(o);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        let r = q.pop();
        expect(r).assertEqual(objs[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4300
     * @tc.name testBlockingQueueAlgebraic043
     * @tc.desc Verify ArrayBlockingQueue object reference identity preserved through push/pop roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const LOOP_START: int = 0;
      const LOOP_END: int = 20;
      const OBJECT_VALUE: int = 5;
      const LOOP_START_2: int = 0;
      const LOOP_END_2: int = 20;
      let q: containers.BlockingQueue<AlgObj> = new containers.ArrayBlockingQueue<AlgObj>(CAPACITY);
      let objs: AlgObj[] = [];
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        let o = new AlgObj(i * OBJECT_VALUE);
        objs.push(o);
        q.push(o);
      }
      for (let i: int = LOOP_START_2; i < LOOP_END_2; i++) {
        let r = q.pop();
        expect(r).assertEqual(objs[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4400
     * @tc.name testBlockingQueueAlgebraic044
     * @tc.desc Verify capacity invariant in iterable construction: queue.capacity equals constructor arg even if iterable larger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 100;
      const CAPACITY_VALUE: int = 1;
      const CAPACITY_VALUE_2: int = 5;
      const CAPACITY_VALUE_3: int = 10;
      const CAPACITY_VALUE_4: int = 50;
      const CAPACITY_VALUE_5: int = 100;
      const CAPACITY_VALUE_6: int = 200;
      const LOOP_START_2: int = 0;
      let arr: int[] = [];
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        arr.push(i);
      }
      let caps: int[] =
        [CAPACITY_VALUE, CAPACITY_VALUE_2, CAPACITY_VALUE_3, CAPACITY_VALUE_4, CAPACITY_VALUE_5, CAPACITY_VALUE_6];
      for (let j: int = LOOP_START_2; j < caps.length; j++) {
        let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(caps[j], arr);
        expect(q.capacity).assertEqual(caps[j]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4500
     * @tc.name testBlockingQueueAlgebraic045
     * @tc.desc Verify ArrayBlockingQueue capacity invariant in iterable construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 50;
      const CAPACITY_VALUE: int = 1;
      const CAPACITY_VALUE_2: int = 5;
      const CAPACITY_VALUE_3: int = 10;
      const CAPACITY_VALUE_4: int = 50;
      const CAPACITY_VALUE_5: int = 100;
      const LOOP_START_2: int = 0;
      let arr: int[] = [];
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        arr.push(i);
      }
      let caps: int[] = [CAPACITY_VALUE, CAPACITY_VALUE_2, CAPACITY_VALUE_3, CAPACITY_VALUE_4, CAPACITY_VALUE_5];
      for (let j: int = LOOP_START_2; j < caps.length; j++) {
        let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(caps[j], arr);
        expect(q.capacity).assertEqual(caps[j]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4600
     * @tc.name testBlockingQueueAlgebraic046
     * @tc.desc Verify all-empty operations: empty queue isEmpty, getFirst/getEnd undefined, size=0, remainingCapacity=capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 15;
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_REMAINING_CAPACITY: int = 15;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.isEmpty()).assertTrue();
      expect(q.getFirst()).assertUndefined();
      expect(q.getEnd()).assertUndefined();
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4700
     * @tc.name testBlockingQueueAlgebraic047
     * @tc.desc Verify all-full operations: full queue not isEmpty, getFirst=first, getEnd=last, size=capacity, remainingCapacity=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const LOOP_START: int = 1;
      const LOOP_START_2: int = 5;
      const EXPECTED_FIRST_VALUE: int = 1;
      const EXPECTED_END_VALUE: int = 5;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i <= LOOP_START_2; i++) {
        q.push(i);
      }
      expect(q.isEmpty()).assertFalse();
      expect(q.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      expect(q.getEnd()).assertEqual(EXPECTED_END_VALUE);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4800
     * @tc.name testBlockingQueueAlgebraic048
     * @tc.desc Verify multiple instances independence: operations on q1 don't affect q2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const CAPACITY_2: int = 10;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_SIZE: int = 0;
      const PUSH_VALUE_4: int = 100;
      const EXPECTED_SIZE_2: int = 3;
      const EXPECTED_FIRST_VALUE: int = 1;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY_2);
      q1.push(PUSH_VALUE);
      q1.push(PUSH_VALUE_2);
      q1.push(PUSH_VALUE_3);
      expect(q2.size).assertEqual(EXPECTED_SIZE);
      expect(q2.isEmpty()).assertTrue();
      q2.push(PUSH_VALUE_4);
      expect(q1.size).assertEqual(EXPECTED_SIZE_2);
      expect(q1.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_4900
     * @tc.name testBlockingQueueAlgebraic049
     * @tc.desc Verify cross-implementation independence: Linked and Array instances don't share state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAlgebraic049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const CAPACITY_2: int = 10;
      const PUSH_VALUE: int = 11;
      const PUSH_VALUE_2: int = 22;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_SIZE_2: int = 1;
      const EXPECTED_FIRST_VALUE: int = 11;
      const EXPECTED_FIRST_VALUE_2: int = 22;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let q2: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY_2);
      q1.push(PUSH_VALUE);
      expect(q2.isEmpty()).assertTrue();
      q2.push(PUSH_VALUE_2);
      expect(q1.size).assertEqual(EXPECTED_SIZE);
      expect(q2.size).assertEqual(EXPECTED_SIZE_2);
      expect(q1.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      expect(q2.getFirst()).assertEqual(EXPECTED_FIRST_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ALGEBRAIC_5000
     * @tc.name testBlockingQueueAlgebraic050
     * @tc.desc Verify push-then-pop cancellation: 1000 random push/pop pairs, count equality holds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAlgebraic050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 50;
      const INITIAL_VALUE: int = 0;
      const INITIAL_VALUE_2: int = 0;
      const LOOP_START: int = 0;
      const LOOP_END: int = 1000;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_SIZE_2: int = 0;
      const EXPECTED_SIZE_3: int = 50;
      const EXPECTED_SIZE_4: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let totalPush: int = INITIAL_VALUE;
      let totalPop: int = INITIAL_VALUE_2;
      for (let i: int = LOOP_START; i < LOOP_END; i++) {
        if (i % EXPECTED_SIZE == EXPECTED_SIZE_2 && q.size < EXPECTED_SIZE_3) {
          q.push(i);
          totalPush++;
        } else if (q.size > EXPECTED_SIZE_4) {
          q.pop();
          totalPop++;
        }
      }
      while (!q.isEmpty()) {
        q.pop();
        totalPop++;
      }
      expect(totalPush).assertEqual(totalPop);
      expect(q.isEmpty()).assertTrue();
    });

  });
}
