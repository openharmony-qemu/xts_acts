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

class Comp020Data {
  val: int = 0;

  constructor(v: int) {
    this.val = v;
  }
}

export default function BlockingQueueComprehensiveTest(): void {
  describe('BlockingQueueComprehensiveTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0100
     * @tc.name testBlockingQueueComprehensive001
     * @tc.desc Verify LinkedBlockingQueue complete data flow: push(1)->push(2)->push(3)->getFirst()=1->getEnd()=3->pop()=1->pop()=2->pop()=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_FIRST_ELEMENT: int = 1;
      const EXPECTED_END_ELEMENT: int = 3;
      const EXPECTED_POP_VALUE: int = 1;
      const EXPECTED_POP_VALUE_2: int = 2;
      const EXPECTED_POP_VALUE_3: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0200
     * @tc.name testBlockingQueueComprehensive002
     * @tc.desc Verify LinkedBlockingQueue non-blocking alternation: add(1)->add(2)->poll()=1->add(3)->poll()=2->poll()=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 1;
      const ADD_VALUE_2: int = 2;
      const EXPECTED_POLL_VALUE: int = 1;
      const ADD_VALUE_3: int = 3;
      const EXPECTED_POLL_VALUE_2: int = 2;
      const EXPECTED_POLL_VALUE_3: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let r1: boolean = queue.add(ADD_VALUE);
      let r2: boolean = queue.add(ADD_VALUE_2);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      let r3: boolean = queue.add(ADD_VALUE_3);
      expect(r3).assertTrue();
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0300
     * @tc.name testBlockingQueueComprehensive003
     * @tc.desc Verify LinkedBlockingQueue mixed blocking/non-blocking operations: push(1)->add(2)->poll()=1->push(3)->add(4)->pop()=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const ADD_VALUE: int = 2;
      const EXPECTED_POLL_VALUE: int = 1;
      const PUSH_VALUE_2: int = 3;
      const ADD_VALUE_2: int = 4;
      const EXPECTED_POP_VALUE: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      let r1: boolean = queue.add(ADD_VALUE);
      expect(r1).assertTrue();
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      queue.push(PUSH_VALUE_2);
      let r2: boolean = queue.add(ADD_VALUE_2);
      expect(r2).assertTrue();
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0400
     * @tc.name testBlockingQueueComprehensive004
     * @tc.desc Verify LinkedBlockingQueue capacity=1 lifecycle: add->true, add->false, pop->then add succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const ADD_VALUE: int = 100;
      const EXPECTED_SIZE: int = 1;
      const ADD_VALUE_2: int = 200;
      const EXPECTED_SIZE_2: int = 1;
      const EXPECTED_SIZE_3: int = 0;
      const ADD_VALUE_3: int = 300;
      const EXPECTED_SIZE_4: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let r1: boolean = queue.add(ADD_VALUE);
      expect(r1).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      let r2: boolean = queue.add(ADD_VALUE_2);
      expect(r2).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_SIZE_2);
      queue.pop();
      expect(queue.size).assertEqual(EXPECTED_SIZE_3);
      let r3: boolean = queue.add(ADD_VALUE_3);
      expect(r3).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0600
     * @tc.name testBlockingQueueComprehensive006
     * @tc.desc Verify LinkedBlockingQueue 4 constructor variants: default(), capacity(10), iterable, capacity+iterable - each push 5 pop 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 5;
      const PUSH_VALUE: int = 1;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 5;
      const EXPECTED_POP_VALUE: int = 1;
      const CAPACITY: int = 10;
      const LOOP_START_3: int = 0;
      const LOOP_BOUND_3: int = 5;
      const PUSH_VALUE_2: int = 10;
      const LOOP_START_4: int = 0;
      const LOOP_BOUND_4: int = 5;
      const EXPECTED_POP_VALUE_2: int = 10;
      const LOOP_START_5: int = 0;
      const LOOP_BOUND_5: int = 5;
      const ARRAY_VALUE: int = 100;
      const LOOP_START_6: int = 0;
      const LOOP_BOUND_6: int = 5;
      const EXPECTED_POP_VALUE_3: int = 100;
      const LOOP_START_7: int = 0;
      const LOOP_BOUND_7: int = 5;
      const ARRAY_VALUE_2: int = 1000;
      const CAPACITY_2: int = 10;
      const LOOP_START_8: int = 0;
      const LOOP_BOUND_8: int = 5;
      const EXPECTED_POP_VALUE_4: int = 1000;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        q1.push(i + PUSH_VALUE);
      }
      for (let i = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q1.pop()).assertEqual(i + EXPECTED_POP_VALUE);
      }

      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = LOOP_START_3; i < LOOP_BOUND_3; i++) {
        q2.push(i + PUSH_VALUE_2);
      }
      for (let i = LOOP_START_4; i < LOOP_BOUND_4; i++) {
        expect(q2.pop()).assertEqual(i + EXPECTED_POP_VALUE_2);
      }

      let arr3: int[] = [];
      for (let i = LOOP_START_5; i < LOOP_BOUND_5; i++) {
        arr3.push(i + ARRAY_VALUE);
      }
      let q3: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr3);
      for (let i = LOOP_START_6; i < LOOP_BOUND_6; i++) {
        expect(q3.pop()).assertEqual(i + EXPECTED_POP_VALUE_3);
      }

      let arr4: int[] = [];
      for (let i = LOOP_START_7; i < LOOP_BOUND_7; i++) {
        arr4.push(i + ARRAY_VALUE_2);
      }
      let q4: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY_2, arr4);
      for (let i = LOOP_START_8; i < LOOP_BOUND_8; i++) {
        expect(q4.pop()).assertEqual(i + EXPECTED_POP_VALUE_4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0700
     * @tc.name testBlockingQueueComprehensive007
     * @tc.desc Verify LinkedBlockingQueue vs ArrayBlockingQueue behavior comparison: both capacity=5, push 3, pop 3, same interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_POP_VALUE: int = 1;
      const EXPECTED_POP_VALUE_2: int = 2;
      const EXPECTED_POP_VALUE_3: int = 3;
      const CAPACITY_2: int = 5;
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const EXPECTED_POP_VALUE_4: int = 1;
      const EXPECTED_POP_VALUE_5: int = 2;
      const EXPECTED_POP_VALUE_6: int = 3;
      let linkedQueue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      linkedQueue.push(PUSH_VALUE);
      linkedQueue.push(PUSH_VALUE_2);
      linkedQueue.push(PUSH_VALUE_3);
      expect(linkedQueue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(linkedQueue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(linkedQueue.pop()).assertEqual(EXPECTED_POP_VALUE_3);

      let arrayQueue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY_2);
      arrayQueue.push(ARRAY_VALUE);
      arrayQueue.push(ARRAY_VALUE_2);
      arrayQueue.push(ARRAY_VALUE_3);
      expect(arrayQueue.pop()).assertEqual(EXPECTED_POP_VALUE_4);
      expect(arrayQueue.pop()).assertEqual(EXPECTED_POP_VALUE_5);
      expect(arrayQueue.pop()).assertEqual(EXPECTED_POP_VALUE_6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0800
     * @tc.name testBlockingQueueComprehensive008
     * @tc.desc Verify LinkedBlockingQueue zero value as valid element: push(0)->getFirst()=0->pop()=0->isEmpty()=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 0;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const EXPECTED_POP_VALUE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0900
     * @tc.name testBlockingQueueComprehensive009
     * @tc.desc Verify LinkedBlockingQueue negative values preserved: push(-1)->push(-100)->push(Int.MIN_VALUE)->pop->pop->pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = -1;
      const PUSH_VALUE_2: int = -100;
      const PUSH_VALUE_3: int = -2147483648;
      const EXPECTED_POP_VALUE: int = -1;
      const EXPECTED_POP_VALUE_2: int = -100;
      const EXPECTED_POP_VALUE_3: int = -2147483648;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_3);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1000
     * @tc.name testBlockingQueueComprehensive010
     * @tc.desc Verify LinkedBlockingQueue extreme int values preserved: push(Int.MAX_VALUE)->push(Int.MIN_VALUE)->pop->pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 2147483647;
      const PUSH_VALUE_2: int = -2147483648;
      const EXPECTED_POP_VALUE: int = 2147483647;
      const EXPECTED_POP_VALUE_2: int = -2147483648;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1100
     * @tc.name testBlockingQueueComprehensive011
     * @tc.desc Verify LinkedBlockingQueue empty string not confused with empty queue: push("")->getFirst()=""->isEmpty()=false->pop()=""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: string = "";
      const EXPECTED_FIRST_ELEMENT: string = "";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_POP_VALUE: string = "";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1200
     * @tc.name testBlockingQueueComprehensive012
     * @tc.desc Verify LinkedBlockingQueue push 100 elements then getFirst/getEnd/poll alternating, verify consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 100;
      const EXPECTED_SIZE: int = 100;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const EXPECTED_END_ELEMENT: int = 99;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 50;
      const EXPECTED_FIRST_ELEMENT_2: int = 50;
      const EXPECTED_END_ELEMENT_2: int = 99;
      const LOOP_START_3: int = 50;
      const LOOP_BOUND_3: int = 100;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      for (let i = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(queue.poll()).assertEqual(i);
      }
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT_2);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT_2);
      for (let i = LOOP_START_3; i < LOOP_BOUND_3; i++) {
        expect(queue.poll()).assertEqual(i);
      }
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1300
     * @tc.name testBlockingQueueComprehensive013
     * @tc.desc Verify ArrayBlockingQueue push(add) mixed with poll(pop) mixed, verify data integrity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: int = 1;
      const ADD_VALUE: int = 2;
      const PUSH_VALUE_2: int = 3;
      const ADD_VALUE_2: int = 4;
      const ADD_VALUE_3: int = 5;
      const EXPECTED_POLL_VALUE: int = 1;
      const EXPECTED_POP_VALUE: int = 2;
      const EXPECTED_POLL_VALUE_2: int = 3;
      const EXPECTED_POP_VALUE_2: int = 4;
      const EXPECTED_POP_VALUE_3: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      let r1: boolean = queue.add(ADD_VALUE);
      queue.push(PUSH_VALUE_2);
      let r2: boolean = queue.add(ADD_VALUE_2);
      let r3: boolean = queue.add(ADD_VALUE_3);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertTrue();
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_3);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1400
     * @tc.name testBlockingQueueComprehensive014
     * @tc.desc Verify LinkedBlockingQueue string type, push/pop/getFirst/getEnd all methods combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: string = "a";
      const PUSH_VALUE_2: string = "b";
      const PUSH_VALUE_3: string = "c";
      const EXPECTED_FIRST_ELEMENT: string = "a";
      const EXPECTED_END_ELEMENT: string = "c";
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_POP_VALUE: string = "a";
      const PUSH_VALUE_4: string = "d";
      const EXPECTED_END_ELEMENT_2: string = "d";
      const EXPECTED_POLL_VALUE: string = "b";
      const EXPECTED_POP_VALUE_2: string = "c";
      const EXPECTED_POLL_VALUE_2: string = "d";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      queue.push(PUSH_VALUE_4);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT_2);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE_2);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1500
     * @tc.name testBlockingQueueComprehensive015
     * @tc.desc Verify LinkedBlockingQueue remainingCapacity + size always equals capacity after random operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 10;
      const PUSH_VALUE: int = 1;
      const EXPECTED_REMAINING_CAPACITY_2: int = 10;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_REMAINING_CAPACITY_3: int = 10;
      const EXPECTED_REMAINING_CAPACITY_4: int = 10;
      const PUSH_VALUE_4: int = 4;
      const PUSH_VALUE_5: int = 5;
      const PUSH_VALUE_6: int = 6;
      const PUSH_VALUE_7: int = 7;
      const PUSH_VALUE_8: int = 8;
      const PUSH_VALUE_9: int = 9;
      const PUSH_VALUE_10: int = 10;
      const EXPECTED_REMAINING_CAPACITY_5: int = 10;
      const EXPECTED_REMAINING_CAPACITY_6: int = 10;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.remainingCapacity() + queue.size).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.remainingCapacity() + queue.size).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.remainingCapacity() + queue.size).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
      queue.pop();
      expect(queue.remainingCapacity() + queue.size).assertEqual(EXPECTED_REMAINING_CAPACITY_4);
      queue.push(PUSH_VALUE_4);
      queue.push(PUSH_VALUE_5);
      queue.push(PUSH_VALUE_6);
      queue.push(PUSH_VALUE_7);
      queue.push(PUSH_VALUE_8);
      queue.push(PUSH_VALUE_9);
      queue.push(PUSH_VALUE_10);
      expect(queue.remainingCapacity() + queue.size).assertEqual(EXPECTED_REMAINING_CAPACITY_5);
      queue.pop();
      queue.pop();
      queue.pop();
      expect(queue.remainingCapacity() + queue.size).assertEqual(EXPECTED_REMAINING_CAPACITY_6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1600
     * @tc.name testBlockingQueueComprehensive016
     * @tc.desc Verify LinkedBlockingQueue(2): push/pop/add/poll/getFirst/getEnd/isEmpty/remainingCapacity all methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const EXPECTED_REMAINING_CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      const EXPECTED_FIRST_ELEMENT: int = 1;
      const EXPECTED_END_ELEMENT: int = 1;
      const EXPECTED_REMAINING_CAPACITY_2: int = 1;
      const ADD_VALUE: int = 2;
      const EXPECTED_REMAINING_CAPACITY_3: int = 0;
      const ADD_VALUE_2: int = 3;
      const EXPECTED_FIRST_ELEMENT_2: int = 1;
      const EXPECTED_END_ELEMENT_2: int = 2;
      const EXPECTED_POP_VALUE: int = 1;
      const EXPECTED_POLL_VALUE: int = 2;
      const EXPECTED_REMAINING_CAPACITY_4: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      expect(queue.add(ADD_VALUE)).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_3);
      expect(queue.add(ADD_VALUE_2)).assertFalse();
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT_2);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT_2);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1700
     * @tc.name testBlockingQueueComprehensive017
     * @tc.desc Verify ArrayBlockingQueue(3): full lifecycle from empty→full→empty with all methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_REMAINING_CAPACITY: int = 3;
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      const EXPECTED_REMAINING_CAPACITY_2: int = 0;
      const EXPECTED_FIRST_ELEMENT: int = 10;
      const EXPECTED_END_ELEMENT: int = 30;
      const EXPECTED_POP_VALUE: int = 10;
      const EXPECTED_POLL_VALUE: int = 20;
      const EXPECTED_POP_VALUE_2: int = 30;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.poll()).assertEqual(undefined);
      expect(queue.getFirst()).assertEqual(undefined);
      expect(queue.getEnd()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1800
     * @tc.name testBlockingQueueComprehensive018
     * @tc.desc Verify LinkedBlockingQueue boolean: push/add combined then pop/poll, all values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: boolean = true;
      const PUSH_VALUE_2: boolean = false;
      const ADD_VALUE: boolean = true;
      const ADD_VALUE_2: boolean = false;
      const ADD_VALUE_3: boolean = true;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      expect(queue.add(ADD_VALUE)).assertTrue();
      expect(queue.add(ADD_VALUE_2)).assertTrue();
      expect(queue.add(ADD_VALUE_3)).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.pop()).assertTrue();
      expect(queue.poll()).assertFalse();
      expect(queue.pop()).assertTrue();
      expect(queue.poll()).assertFalse();
      expect(queue.pop()).assertTrue();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1900
     * @tc.name testBlockingQueueComprehensive019
     * @tc.desc Verify LinkedBlockingQueue string with special chars: all operations preserve values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: string = "";
      const PUSH_VALUE_2: string = " ";
      const PUSH_VALUE_3: string = "中文";
      const PUSH_VALUE_4: string = "!@#$%";
      const PUSH_VALUE_5: string = "<script>";
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_FIRST_ELEMENT: string = "";
      const EXPECTED_END_ELEMENT: string = "<script>";
      const EXPECTED_POP_VALUE: string = "";
      const EXPECTED_POP_VALUE_2: string = " ";
      const EXPECTED_POP_VALUE_3: string = "中文";
      const EXPECTED_POP_VALUE_4: string = "!@#$%";
      const EXPECTED_POP_VALUE_5: string = "<script>";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      queue.push(PUSH_VALUE_4);
      queue.push(PUSH_VALUE_5);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_3);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_4);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_5);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2000
     * @tc.name testBlockingQueueComprehensive020
     * @tc.desc Verify LinkedBlockingQueue custom object: push 3 objects, verify all accessors and mutators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_VALUE: int = 100;
      const OBJECT_VALUE_2: int = 200;
      const OBJECT_VALUE_3: int = 300;
      const CAPACITY: int = 5;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_REMAINING_CAPACITY: int = 2;
      let d1 = new Comp020Data(OBJECT_VALUE);
      let d2 = new Comp020Data(OBJECT_VALUE_2);
      let d3 = new Comp020Data(OBJECT_VALUE_3);
      let queue: containers.BlockingQueue<Comp020Data> = new containers.LinkedBlockingQueue<Comp020Data>(CAPACITY);
      queue.push(d1);
      queue.push(d2);
      queue.push(d3);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(d1);
      expect(queue.getEnd()).assertEqual(d3);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.getFirst()).assertEqual(d1);
      let popped: Comp020Data | undefined = queue.pop();
      expect(popped).assertEqual(d1);
      let polled: Comp020Data | undefined = queue.poll();
      expect(polled).assertEqual(d2);
      expect(queue.pop()).assertEqual(d3);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2100
     * @tc.name testBlockingQueueComprehensive021
     * @tc.desc Verify ArrayBlockingQueue string: push+add then pop+poll mixed with getFirst/getEnd checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 4;
      const PUSH_VALUE: string = "first";
      const ADD_VALUE: string = "second";
      const PUSH_VALUE_2: string = "third";
      const ADD_VALUE_2: string = "fourth";
      const EXPECTED_SIZE: int = 4;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const ADD_VALUE_3: string = "fifth";
      const EXPECTED_FIRST_ELEMENT: string = "first";
      const EXPECTED_END_ELEMENT: string = "fourth";
      const EXPECTED_POP_VALUE: string = "first";
      const EXPECTED_POLL_VALUE: string = "second";
      const EXPECTED_POP_VALUE_2: string = "third";
      const EXPECTED_POLL_VALUE_2: string = "fourth";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.add(ADD_VALUE)).assertTrue();
      queue.push(PUSH_VALUE_2);
      expect(queue.add(ADD_VALUE_2)).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.add(ADD_VALUE_3)).assertFalse();
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE_2);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2200
     * @tc.name testBlockingQueueComprehensive022
     * @tc.desc Verify LinkedBlockingQueue pre-filled from iterable: post-init operations mix correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 5;
      const ARRAY_VALUE: int = 10;
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const EXPECTED_END_ELEMENT: int = 40;
      const EXPECTED_REMAINING_CAPACITY: int = 5;
      const PUSH_VALUE: int = 50;
      const PUSH_VALUE_2: int = 60;
      const ADD_VALUE: int = 70;
      const ADD_VALUE_2: int = 80;
      const ADD_VALUE_3: int = 90;
      const EXPECTED_SIZE_2: int = 10;
      const EXPECTED_REMAINING_CAPACITY_2: int = 0;
      const EXPECTED_END_ELEMENT_2: int = 90;
      const EXPECTED_POP_VALUE: int = 0;
      const EXPECTED_POP_VALUE_2: int = 10;
      const EXPECTED_POLL_VALUE: int = 20;
      const EXPECTED_SIZE_3: int = 7;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i * ARRAY_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      expect(queue.add(ADD_VALUE)).assertTrue();
      expect(queue.add(ADD_VALUE_2)).assertTrue();
      expect(queue.add(ADD_VALUE_3)).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE_2);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT_2);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2300
     * @tc.name testBlockingQueueComprehensive023
     * @tc.desc Verify ArrayBlockingQueue pre-filled from Set iterable: capacity=100 with 10 elements, all methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const CAPACITY: int = 100;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 90;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const EXPECTED_END_ELEMENT: int = 9;
      const EXPECTED_POP_VALUE: int = 0;
      const EXPECTED_POP_VALUE_2: int = 1;
      const EXPECTED_SIZE_2: int = 8;
      let s: Set<number> = new Set<number>();
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        s.add(i);
      }
      let queue: containers.BlockingQueue<number> = new containers.ArrayBlockingQueue<number>(CAPACITY, s);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_SIZE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2400
     * @tc.name testBlockingQueueComprehensive024
     * @tc.desc Verify LinkedBlockingQueue(1): all non-blocking methods combined, capacity=1 lifecycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      const ADD_VALUE: int = 1;
      const EXPECTED_REMAINING_CAPACITY_2: int = 0;
      const EXPECTED_FIRST_ELEMENT: int = 1;
      const EXPECTED_END_ELEMENT: int = 1;
      const ADD_VALUE_2: int = 2;
      const EXPECTED_POLL_VALUE: int = 1;
      const ADD_VALUE_3: int = 3;
      const EXPECTED_POP_VALUE: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.getFirst()).assertEqual(undefined);
      expect(queue.getEnd()).assertEqual(undefined);
      expect(queue.poll()).assertEqual(undefined);
      expect(queue.add(ADD_VALUE)).assertTrue();
      expect(queue.isEmpty()).assertFalse();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.add(ADD_VALUE_2)).assertFalse();
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.add(ADD_VALUE_3)).assertTrue();
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2500
     * @tc.name testBlockingQueueComprehensive025
     * @tc.desc Verify ArrayBlockingQueue(1) string: full non-blocking lifecycle including reusability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: string = "hello";
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const EXPECTED_FIRST_ELEMENT: string = "hello";
      const EXPECTED_END_ELEMENT: string = "hello";
      const ADD_VALUE: string = "world";
      const EXPECTED_POP_VALUE: string = "hello";
      const PUSH_VALUE_2: string = "reuse";
      const EXPECTED_POLL_VALUE: string = "reuse";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.poll()).assertEqual(undefined);
      expect(queue.getFirst()).assertEqual(undefined);
      queue.push(PUSH_VALUE);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      expect(queue.add(ADD_VALUE)).assertFalse();
      expect(queue.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2600
     * @tc.name testBlockingQueueComprehensive026
     * @tc.desc Verify LinkedBlockingQueue zero-arg constructor produces an empty queue with size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2700
     * @tc.name testBlockingQueueComprehensive027
     * @tc.desc Verify LinkedBlockingQueue single capacity-arg constructor sets capacity to the passed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(8);
      expect(q.capacity).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2800
     * @tc.name testBlockingQueueComprehensive028
     * @tc.desc Verify LinkedBlockingQueue single iterable-arg constructor fills queue with iterable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [3, 6, 9];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_2900
     * @tc.name testBlockingQueueComprehensive029
     * @tc.desc Verify LinkedBlockingQueue two-arg capacity+iterable constructor fills queue with iterable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [11, 22];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3000
     * @tc.name testBlockingQueueComprehensive030
     * @tc.desc Verify ArrayBlockingQueue single capacity-arg constructor sets capacity to the passed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3100
     * @tc.name testBlockingQueueComprehensive031
     * @tc.desc Verify ArrayBlockingQueue two-arg capacity+iterable constructor fills queue with iterable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [7, 8, 9, 10];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(6, src);
      expect(q.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3200
     * @tc.name testBlockingQueueComprehensive032
     * @tc.desc Verify LinkedBlockingQueue zero-arg constructor capacity defaults to Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.capacity).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3300
     * @tc.name testBlockingQueueComprehensive033
     * @tc.desc Verify LinkedBlockingQueue two-arg constructor remainingCapacity reflects unused slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.remainingCapacity()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3400
     * @tc.name testBlockingQueueComprehensive034
     * @tc.desc Verify LinkedBlockingQueue capacity 1 (minimum valid capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      expect(q.capacity).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3500
     * @tc.name testBlockingQueueComprehensive035
     * @tc.desc Verify LinkedBlockingQueue capacity 2 (second smallest capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      expect(q.capacity).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3600
     * @tc.name testBlockingQueueComprehensive036
     * @tc.desc Verify LinkedBlockingQueue capacity Int.MAX_VALUE (2147483647) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2147483647);
      expect(q.capacity).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3700
     * @tc.name testBlockingQueueComprehensive037
     * @tc.desc Verify LinkedBlockingQueue capacity from hexadecimal literal 0x10 equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0x10);
      expect(q.capacity).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3800
     * @tc.name testBlockingQueueComprehensive038
     * @tc.desc Verify LinkedBlockingQueue capacity from octal literal 0o20 equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0o20);
      expect(q.capacity).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_3900
     * @tc.name testBlockingQueueComprehensive039
     * @tc.desc Verify LinkedBlockingQueue capacity from binary literal 0b1000 equals 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0b1000);
      expect(q.capacity).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4000
     * @tc.name testBlockingQueueComprehensive040
     * @tc.desc Verify LinkedBlockingQueue capacity from arithmetic expression 4 * 5 equals 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4 * 5);
      expect(q.capacity).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4100
     * @tc.name testBlockingQueueComprehensive041
     * @tc.desc Verify LinkedBlockingQueue capacity 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4200
     * @tc.name testBlockingQueueComprehensive042
     * @tc.desc Verify LinkedBlockingQueue capacity -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4300
     * @tc.name testBlockingQueueComprehensive043
     * @tc.desc Verify LinkedBlockingQueue capacity -100 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4400
     * @tc.name testBlockingQueueComprehensive044
     * @tc.desc Verify LinkedBlockingQueue capacity Int.MIN_VALUE (-2147483648) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4500
     * @tc.name testBlockingQueueComprehensive045
     * @tc.desc Verify LinkedBlockingQueue capacity 1 yields remainingCapacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      expect(q.remainingCapacity()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4600
     * @tc.name testBlockingQueueComprehensive046
     * @tc.desc Verify LinkedBlockingQueue capacity 50 yields initial size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(50);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4700
     * @tc.name testBlockingQueueComprehensive047
     * @tc.desc Verify ArrayBlockingQueue capacity 1 (minimum valid capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      expect(q.capacity).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_4800
     * @tc.name testBlockingQueueComprehensive048
     * @tc.desc Verify ArrayBlockingQueue capacity 3 (small capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      expect(q.capacity).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5000
     * @tc.name testBlockingQueueComprehensive050
     * @tc.desc Verify ArrayBlockingQueue capacity from hexadecimal literal 0xFF equals 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0xFF);
      expect(q.capacity).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5100
     * @tc.name testBlockingQueueComprehensive051
     * @tc.desc Verify ArrayBlockingQueue capacity from octal literal 0o12 equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0o12);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5200
     * @tc.name testBlockingQueueComprehensive052
     * @tc.desc Verify ArrayBlockingQueue capacity from binary literal 0b1111 equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0b1111);
      expect(q.capacity).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5300
     * @tc.name testBlockingQueueComprehensive053
     * @tc.desc Verify ArrayBlockingQueue capacity 200 (large capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(200);
      expect(q.capacity).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5400
     * @tc.name testBlockingQueueComprehensive054
     * @tc.desc Verify ArrayBlockingQueue capacity 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5500
     * @tc.name testBlockingQueueComprehensive055
     * @tc.desc Verify ArrayBlockingQueue capacity -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5600
     * @tc.name testBlockingQueueComprehensive056
     * @tc.desc Verify ArrayBlockingQueue capacity -256 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-256);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5700
     * @tc.name testBlockingQueueComprehensive057
     * @tc.desc Verify ArrayBlockingQueue capacity Int.MIN_VALUE (-2147483648) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5800
     * @tc.name testBlockingQueueComprehensive058
     * @tc.desc Verify ArrayBlockingQueue capacity 1 yields remainingCapacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      expect(q.remainingCapacity()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_5900
     * @tc.name testBlockingQueueComprehensive059
     * @tc.desc Verify ArrayBlockingQueue capacity 64 yields initial size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(64);
      expect(q.size).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6000
     * @tc.name testBlockingQueueComprehensive060
     * @tc.desc Verify LinkedBlockingQueue empty Array iterable construction yields size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6100
     * @tc.name testBlockingQueueComprehensive061
     * @tc.desc Verify LinkedBlockingQueue single-element Array iterable construction yields size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6200
     * @tc.name testBlockingQueueComprehensive062
     * @tc.desc Verify LinkedBlockingQueue single-element Array iterable getFirst returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6300
     * @tc.name testBlockingQueueComprehensive063
     * @tc.desc Verify LinkedBlockingQueue multi-element Array iterable construction yields matching size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6400
     * @tc.name testBlockingQueueComprehensive064
     * @tc.desc Verify LinkedBlockingQueue Array iterable with negative values preserves first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1, -2, -3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6500
     * @tc.name testBlockingQueueComprehensive065
     * @tc.desc Verify LinkedBlockingQueue Array iterable with max int element preserves first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6600
     * @tc.name testBlockingQueueComprehensive066
     * @tc.desc Verify LinkedBlockingQueue Array iterable with min int element preserves first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-2147483648];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6700
     * @tc.name testBlockingQueueComprehensive067
     * @tc.desc Verify LinkedBlockingQueue all-zero Array iterable construction yields matching size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6800
     * @tc.name testBlockingQueueComprehensive068
     * @tc.desc Verify LinkedBlockingQueue all-identical-element Array iterable construction yields matching size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [7, 7, 7, 7];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_6900
     * @tc.name testBlockingQueueComprehensive069
     * @tc.desc Verify LinkedBlockingQueue mixed-radix-literal Array iterable preserves first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0x0A, 0o12, 0b1010];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7000
     * @tc.name testBlockingQueueComprehensive070
     * @tc.desc Verify LinkedBlockingQueue Set iterable construction yields matching size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(11);
      src.add(22);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7100
     * @tc.name testBlockingQueueComprehensive071
     * @tc.desc Verify LinkedBlockingQueue empty Set iterable construction yields size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7200
     * @tc.name testBlockingQueueComprehensive072
     * @tc.desc Verify LinkedBlockingQueue large Array iterable of 100 elements construction yields size 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i);
      }
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7300
     * @tc.name testBlockingQueueComprehensive073
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable with fewer elements than capacity enqueues all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7400
     * @tc.name testBlockingQueueComprehensive074
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable filling exactly to capacity yields size equal to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4, src);
      expect(q.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7500
     * @tc.name testBlockingQueueComprehensive075
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable filled to capacity yields remainingCapacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4, src);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7600
     * @tc.name testBlockingQueueComprehensive076
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable with more elements than capacity truncates to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5, 6];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7700
     * @tc.name testBlockingQueueComprehensive077
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable truncation keeps first capacity elements (first element check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30, 40, 50];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2, src);
      expect(q.getFirst()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7800
     * @tc.name testBlockingQueueComprehensive078
     * @tc.desc Verify LinkedBlockingQueue capacity 1 with iterable truncates to a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [99, 88, 77];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1, src);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_7900
     * @tc.name testBlockingQueueComprehensive079
     * @tc.desc Verify LinkedBlockingQueue capacity with empty iterable yields initial size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5, src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8000
     * @tc.name testBlockingQueueComprehensive080
     * @tc.desc Verify LinkedBlockingQueue capacity 0 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8100
     * @tc.name testBlockingQueueComprehensive081
     * @tc.desc Verify LinkedBlockingQueue capacity -1 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-1, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8200
     * @tc.name testBlockingQueueComprehensive082
     * @tc.desc Verify LinkedBlockingQueue capacity with Set iterable enqueues all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(5);
      src.add(6);
      src.add(7);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8300
     * @tc.name testBlockingQueueComprehensive083
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable with fewer elements than capacity enqueues all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(8, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8400
     * @tc.name testBlockingQueueComprehensive084
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable filling exactly to capacity yields size equal to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [9, 8, 7];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8500
     * @tc.name testBlockingQueueComprehensive085
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable filled to capacity yields remainingCapacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [9, 8, 7];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, src);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8600
     * @tc.name testBlockingQueueComprehensive086
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable with more elements than capacity truncates to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2, src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8700
     * @tc.name testBlockingQueueComprehensive087
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable truncation keeps first capacity elements (first element check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [100, 200, 300];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1, src);
      expect(q.getFirst()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8800
     * @tc.name testBlockingQueueComprehensive088
     * @tc.desc Verify ArrayBlockingQueue capacity with empty iterable yields initial size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(6, src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_8900
     * @tc.name testBlockingQueueComprehensive089
     * @tc.desc Verify ArrayBlockingQueue capacity 0 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9000
     * @tc.name testBlockingQueueComprehensive090
     * @tc.desc Verify ArrayBlockingQueue capacity Int.MIN_VALUE with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-2147483648, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9100
     * @tc.name testBlockingQueueComprehensive091
     * @tc.desc Verify ArrayBlockingQueue capacity -1 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [3, 4];
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-1, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9200
     * @tc.name testBlockingQueueComprehensive092
     * @tc.desc Verify ArrayBlockingQueue capacity with Set iterable enqueues all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9300
     * @tc.name testBlockingQueueComprehensive093
     * @tc.desc Verify ArrayBlockingQueue capacity with mixed-radix-literal iterable preserves first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0xFF, 0o10, 0b11];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.getFirst()).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9400
     * @tc.name testBlockingQueueComprehensive094
     * @tc.desc Verify LinkedBlockingQueue element 0 (default value) push then getFirst returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      q.push(0);
      expect(q.getFirst()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9500
     * @tc.name testBlockingQueueComprehensive095
     * @tc.desc Verify LinkedBlockingQueue element -1 push then getFirst returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      q.push(-1);
      expect(q.getFirst()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9600
     * @tc.name testBlockingQueueComprehensive096
     * @tc.desc Verify LinkedBlockingQueue element max int push then getFirst returns max int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      q.push(2147483647);
      expect(q.getFirst()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9700
     * @tc.name testBlockingQueueComprehensive097
     * @tc.desc Verify LinkedBlockingQueue element min int push then getFirst returns min int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      q.push(-2147483648);
      expect(q.getFirst()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9800
     * @tc.name testBlockingQueueComprehensive098
     * @tc.desc Verify LinkedBlockingQueue element hexadecimal literal 0x7F push then getFirst returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      q.push(0x7F);
      expect(q.getFirst()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_9900
     * @tc.name testBlockingQueueComprehensive099
     * @tc.desc Verify ArrayBlockingQueue element octal literal 0o17 push then getFirst returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(0o17);
      expect(q.getFirst()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10000
     * @tc.name testBlockingQueueComprehensive100
     * @tc.desc Verify ArrayBlockingQueue element binary literal 0b101 push then getFirst returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(0b101);
      expect(q.getFirst()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10100
     * @tc.name testBlockingQueueComprehensive101
     * @tc.desc Verify ArrayBlockingQueue element 0 push then getFirst returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(0);
      expect(q.getFirst()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10200
     * @tc.name testBlockingQueueComprehensive102
     * @tc.desc Verify ArrayBlockingQueue element max int push then getFirst returns max int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(2147483647);
      expect(q.getFirst()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10300
     * @tc.name testBlockingQueueComprehensive103
     * @tc.desc Verify ArrayBlockingQueue element min int push then getFirst returns min int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(-2147483648);
      expect(q.getFirst()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10400
     * @tc.name testBlockingQueueComprehensive104
     * @tc.desc Verify ArrayBlockingQueue number generic element 3.14 push then getFirst returns 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(4);
      q.push(3.14);
      expect(q.getFirst()).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10500
     * @tc.name testBlockingQueueComprehensive105
     * @tc.desc Verify LinkedBlockingQueue number generic element 1e10 push then getFirst returns 10000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(4);
      q.push(1e10);
      expect(q.getFirst()).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10600
     * @tc.name testBlockingQueueComprehensive106
     * @tc.desc Verify LinkedBlockingQueue remainingCapacity equals capacity minus size after pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10700
     * @tc.name testBlockingQueueComprehensive107
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity equals capacity minus size after pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10800
     * @tc.name testBlockingQueueComprehensive108
     * @tc.desc Verify LinkedBlockingQueue zero-arg constructor returns a LinkedBlockingQueue instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q instanceof containers.LinkedBlockingQueue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_10900
     * @tc.name testBlockingQueueComprehensive109
     * @tc.desc Verify LinkedBlockingQueue single capacity-arg constructor returns a LinkedBlockingQueue instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(8);
      expect(q instanceof containers.LinkedBlockingQueue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11000
     * @tc.name testBlockingQueueComprehensive110
     * @tc.desc Verify ArrayBlockingQueue single capacity-arg constructor returns an ArrayBlockingQueue instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(8);
      expect(q instanceof containers.ArrayBlockingQueue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11100
     * @tc.name testBlockingQueueComprehensive111
     * @tc.desc Verify LinkedBlockingQueue push returns undefined (void semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.push(1);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11200
     * @tc.name testBlockingQueueComprehensive112
     * @tc.desc Verify ArrayBlockingQueue push returns undefined (void semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.push(2);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11300
     * @tc.name testBlockingQueueComprehensive113
     * @tc.desc Verify LinkedBlockingQueue pop return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(42);
      let r = q.pop();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11400
     * @tc.name testBlockingQueueComprehensive114
     * @tc.desc Verify ArrayBlockingQueue pop return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(42);
      let r = q.pop();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11500
     * @tc.name testBlockingQueueComprehensive115
     * @tc.desc Verify LinkedBlockingQueue add return value type is boolean when not full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.add(1);
      expect(typeof r).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11600
     * @tc.name testBlockingQueueComprehensive116
     * @tc.desc Verify ArrayBlockingQueue add return value type is boolean when not full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.add(1);
      expect(typeof r).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11700
     * @tc.name testBlockingQueueComprehensive117
     * @tc.desc Verify LinkedBlockingQueue poll non-empty return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(3);
      let r = q.poll();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11800
     * @tc.name testBlockingQueueComprehensive118
     * @tc.desc Verify ArrayBlockingQueue poll non-empty return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(3);
      let r = q.poll();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_11900
     * @tc.name testBlockingQueueComprehensive119
     * @tc.desc Verify LinkedBlockingQueue poll on empty queue returns undefined (non-blocking semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.poll();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12000
     * @tc.name testBlockingQueueComprehensive120
     * @tc.desc Verify ArrayBlockingQueue poll on empty queue returns undefined (non-blocking semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.poll();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12100
     * @tc.name testBlockingQueueComprehensive121
     * @tc.desc Verify LinkedBlockingQueue getFirst non-empty return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(4);
      let r = q.getFirst();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12200
     * @tc.name testBlockingQueueComprehensive122
     * @tc.desc Verify ArrayBlockingQueue getFirst non-empty return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(4);
      let r = q.getFirst();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12300
     * @tc.name testBlockingQueueComprehensive123
     * @tc.desc Verify LinkedBlockingQueue getEnd non-empty return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(8);
      let r = q.getEnd();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12400
     * @tc.name testBlockingQueueComprehensive124
     * @tc.desc Verify ArrayBlockingQueue getEnd non-empty return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(8);
      let r = q.getEnd();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12500
     * @tc.name testBlockingQueueComprehensive125
     * @tc.desc Verify LinkedBlockingQueue isEmpty return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.isEmpty();
      expect(typeof r).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12600
     * @tc.name testBlockingQueueComprehensive126
     * @tc.desc Verify ArrayBlockingQueue isEmpty return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.isEmpty();
      expect(typeof r).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12700
     * @tc.name testBlockingQueueComprehensive127
     * @tc.desc Verify LinkedBlockingQueue remainingCapacity return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.remainingCapacity();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12800
     * @tc.name testBlockingQueueComprehensive128
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.remainingCapacity();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_12900
     * @tc.name testBlockingQueueComprehensive129
     * @tc.desc Verify LinkedBlockingQueue size property type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      expect(typeof q.size).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_13000
     * @tc.name testBlockingQueueComprehensive130
     * @tc.desc Verify ArrayBlockingQueue size property type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(typeof q.size).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_13100
     * @tc.name testBlockingQueueComprehensive131
     * @tc.desc Verify LinkedBlockingQueue capacity property type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      expect(typeof q.capacity).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_13200
     * @tc.name testBlockingQueueComprehensive132
     * @tc.desc Verify ArrayBlockingQueue capacity property type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(typeof q.capacity).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_13300
     * @tc.name testBlockingQueueComprehensive133
     * @tc.desc Verify LinkedBlockingQueue and ArrayBlockingQueue return identical pop value for same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      lq.push(100);
      aq.push(100);
      expect(lq.pop()).assertEqual(aq.pop());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_13400
     * @tc.name testBlockingQueueComprehensive134
     * @tc.desc Verify LinkedBlockingQueue and ArrayBlockingQueue full-queue add return values are identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      lq.add(1);
      aq.add(1);
      expect(lq.add(2)).assertEqual(aq.add(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_13500
     * @tc.name testBlockingQueueComprehensive135
     * @tc.desc Verify LinkedBlockingQueue and ArrayBlockingQueue empty-queue poll return values are identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(lq.poll()).assertEqual(aq.poll());
    });
  });
}
