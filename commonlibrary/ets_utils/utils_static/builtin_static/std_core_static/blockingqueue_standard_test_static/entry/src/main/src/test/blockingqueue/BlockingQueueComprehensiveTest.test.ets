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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0010
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0020
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0030
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0040
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0050
     * @tc.name testBlockingQueueComprehensive005
     * @tc.desc Verify LinkedBlockingQueue 4 constructor variants: default(), capacity(10), iterable, capacity+iterable - each push 5 pop 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0060
     * @tc.name testBlockingQueueComprehensive006
     * @tc.desc Verify LinkedBlockingQueue vs ArrayBlockingQueue behavior comparison: both capacity=5, push 3, pop 3, same interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0070
     * @tc.name testBlockingQueueComprehensive007
     * @tc.desc Verify LinkedBlockingQueue zero value as valid element: push(0)->getFirst()=0->pop()=0->isEmpty()=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0080
     * @tc.name testBlockingQueueComprehensive008
     * @tc.desc Verify LinkedBlockingQueue negative values preserved: push(-1)->push(-100)->push(Int.MIN_VALUE)->pop->pop->pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0090
     * @tc.name testBlockingQueueComprehensive009
     * @tc.desc Verify LinkedBlockingQueue extreme int values preserved: push(Int.MAX_VALUE)->push(Int.MIN_VALUE)->pop->pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0100
     * @tc.name testBlockingQueueComprehensive010
     * @tc.desc Verify LinkedBlockingQueue empty string not confused with empty queue: push("")->getFirst()=""->isEmpty()=false->pop()=""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0110
     * @tc.name testBlockingQueueComprehensive011
     * @tc.desc Verify LinkedBlockingQueue push 100 elements then getFirst/getEnd/poll alternating, verify consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0120
     * @tc.name testBlockingQueueComprehensive012
     * @tc.desc Verify ArrayBlockingQueue push(add) mixed with poll(pop) mixed, verify data integrity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0130
     * @tc.name testBlockingQueueComprehensive013
     * @tc.desc Verify LinkedBlockingQueue string type, push/pop/getFirst/getEnd all methods combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0140
     * @tc.name testBlockingQueueComprehensive014
     * @tc.desc Verify LinkedBlockingQueue remainingCapacity + size always equals capacity after random operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0150
     * @tc.name testBlockingQueueComprehensive015
     * @tc.desc Verify LinkedBlockingQueue(2): push/pop/add/poll/getFirst/getEnd/isEmpty/remainingCapacity all methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0160
     * @tc.name testBlockingQueueComprehensive016
     * @tc.desc Verify ArrayBlockingQueue(3): full lifecycle from empty→full→empty with all methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0170
     * @tc.name testBlockingQueueComprehensive017
     * @tc.desc Verify LinkedBlockingQueue boolean: push/add combined then pop/poll, all values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0180
     * @tc.name testBlockingQueueComprehensive018
     * @tc.desc Verify LinkedBlockingQueue string with special chars: all operations preserve values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0190
     * @tc.name testBlockingQueueComprehensive019
     * @tc.desc Verify LinkedBlockingQueue custom object: push 3 objects, verify all accessors and mutators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0200
     * @tc.name testBlockingQueueComprehensive020
     * @tc.desc Verify ArrayBlockingQueue string: push+add then pop+poll mixed with getFirst/getEnd checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0210
     * @tc.name testBlockingQueueComprehensive021
     * @tc.desc Verify LinkedBlockingQueue pre-filled from iterable: post-init operations mix correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0220
     * @tc.name testBlockingQueueComprehensive022
     * @tc.desc Verify ArrayBlockingQueue pre-filled from Set iterable: capacity=100 with 10 elements, all methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0230
     * @tc.name testBlockingQueueComprehensive023
     * @tc.desc Verify LinkedBlockingQueue(1): all non-blocking methods combined, capacity=1 lifecycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0240
     * @tc.name testBlockingQueueComprehensive024
     * @tc.desc Verify ArrayBlockingQueue(1) string: full non-blocking lifecycle including reusability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueComprehensive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0250
     * @tc.name testBlockingQueueComprehensive025
     * @tc.desc Verify LinkedBlockingQueue zero-arg constructor produces an empty queue with size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0260
     * @tc.name testBlockingQueueComprehensive026
     * @tc.desc Verify LinkedBlockingQueue single capacity-arg constructor sets capacity to the passed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(8);
      expect(q.capacity).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0270
     * @tc.name testBlockingQueueComprehensive027
     * @tc.desc Verify LinkedBlockingQueue single iterable-arg constructor fills queue with iterable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [3, 6, 9];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0280
     * @tc.name testBlockingQueueComprehensive028
     * @tc.desc Verify LinkedBlockingQueue two-arg capacity+iterable constructor fills queue with iterable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [11, 22];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0290
     * @tc.name testBlockingQueueComprehensive029
     * @tc.desc Verify ArrayBlockingQueue single capacity-arg constructor sets capacity to the passed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0300
     * @tc.name testBlockingQueueComprehensive030
     * @tc.desc Verify ArrayBlockingQueue two-arg capacity+iterable constructor fills queue with iterable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [7, 8, 9, 10];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(6, src);
      expect(q.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0310
     * @tc.name testBlockingQueueComprehensive031
     * @tc.desc Verify LinkedBlockingQueue zero-arg constructor capacity defaults to Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.capacity).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0320
     * @tc.name testBlockingQueueComprehensive032
     * @tc.desc Verify LinkedBlockingQueue two-arg constructor remainingCapacity reflects unused slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.remainingCapacity()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0330
     * @tc.name testBlockingQueueComprehensive033
     * @tc.desc Verify LinkedBlockingQueue capacity 1 (minimum valid capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      expect(q.capacity).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0340
     * @tc.name testBlockingQueueComprehensive034
     * @tc.desc Verify LinkedBlockingQueue capacity 2 (second smallest capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      expect(q.capacity).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0350
     * @tc.name testBlockingQueueComprehensive035
     * @tc.desc Verify LinkedBlockingQueue capacity Int.MAX_VALUE (2147483647) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2147483647);
      expect(q.capacity).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0360
     * @tc.name testBlockingQueueComprehensive036
     * @tc.desc Verify LinkedBlockingQueue capacity from hexadecimal literal 0x10 equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0x10);
      expect(q.capacity).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0370
     * @tc.name testBlockingQueueComprehensive037
     * @tc.desc Verify LinkedBlockingQueue capacity from arithmetic expression 4 * 5 equals 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4 * 5);
      expect(q.capacity).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0380
     * @tc.name testBlockingQueueComprehensive038
     * @tc.desc Verify LinkedBlockingQueue capacity 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0390
     * @tc.name testBlockingQueueComprehensive039
     * @tc.desc Verify LinkedBlockingQueue capacity -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0400
     * @tc.name testBlockingQueueComprehensive040
     * @tc.desc Verify LinkedBlockingQueue capacity -100 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0410
     * @tc.name testBlockingQueueComprehensive041
     * @tc.desc Verify LinkedBlockingQueue capacity Int.MIN_VALUE (-2147483648) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0420
     * @tc.name testBlockingQueueComprehensive042
     * @tc.desc Verify LinkedBlockingQueue capacity 1 yields remainingCapacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      expect(q.remainingCapacity()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0430
     * @tc.name testBlockingQueueComprehensive043
     * @tc.desc Verify LinkedBlockingQueue capacity 50 yields initial size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(50);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0440
     * @tc.name testBlockingQueueComprehensive044
     * @tc.desc Verify ArrayBlockingQueue capacity 1 (minimum valid capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      expect(q.capacity).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0450
     * @tc.name testBlockingQueueComprehensive045
     * @tc.desc Verify ArrayBlockingQueue capacity 3 (small capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      expect(q.capacity).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0460
     * @tc.name testBlockingQueueComprehensive046
     * @tc.desc Verify ArrayBlockingQueue capacity from hexadecimal literal 0xFF equals 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0xFF);
      expect(q.capacity).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0470
     * @tc.name testBlockingQueueComprehensive047
     * @tc.desc Verify ArrayBlockingQueue capacity from octal literal 0o12 equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0o12);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0480
     * @tc.name testBlockingQueueComprehensive048
     * @tc.desc Verify ArrayBlockingQueue capacity from binary literal 0b1111 equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0b1111);
      expect(q.capacity).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0490
     * @tc.name testBlockingQueueComprehensive049
     * @tc.desc Verify ArrayBlockingQueue capacity 200 (large capacity) is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(200);
      expect(q.capacity).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0500
     * @tc.name testBlockingQueueComprehensive050
     * @tc.desc Verify ArrayBlockingQueue capacity 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0510
     * @tc.name testBlockingQueueComprehensive051
     * @tc.desc Verify ArrayBlockingQueue capacity -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0520
     * @tc.name testBlockingQueueComprehensive052
     * @tc.desc Verify ArrayBlockingQueue capacity -256 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-256);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0530
     * @tc.name testBlockingQueueComprehensive053
     * @tc.desc Verify ArrayBlockingQueue capacity Int.MIN_VALUE (-2147483648) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0540
     * @tc.name testBlockingQueueComprehensive054
     * @tc.desc Verify ArrayBlockingQueue capacity 1 yields remainingCapacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      expect(q.remainingCapacity()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0550
     * @tc.name testBlockingQueueComprehensive055
     * @tc.desc Verify ArrayBlockingQueue capacity 64 yields initial size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(64);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0560
     * @tc.name testBlockingQueueComprehensive056
     * @tc.desc Verify LinkedBlockingQueue empty Array iterable construction yields size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0570
     * @tc.name testBlockingQueueComprehensive057
     * @tc.desc Verify LinkedBlockingQueue single-element Array iterable construction yields size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0580
     * @tc.name testBlockingQueueComprehensive058
     * @tc.desc Verify LinkedBlockingQueue single-element Array iterable getFirst returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0590
     * @tc.name testBlockingQueueComprehensive059
     * @tc.desc Verify LinkedBlockingQueue multi-element Array iterable construction yields matching size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0600
     * @tc.name testBlockingQueueComprehensive060
     * @tc.desc Verify LinkedBlockingQueue Array iterable with negative values preserves first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1, -2, -3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0610
     * @tc.name testBlockingQueueComprehensive061
     * @tc.desc Verify LinkedBlockingQueue Array iterable with max int element preserves first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0620
     * @tc.name testBlockingQueueComprehensive062
     * @tc.desc Verify LinkedBlockingQueue Array iterable with min int element preserves first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-2147483648];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0630
     * @tc.name testBlockingQueueComprehensive063
     * @tc.desc Verify LinkedBlockingQueue all-zero Array iterable construction yields matching size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0640
     * @tc.name testBlockingQueueComprehensive064
     * @tc.desc Verify LinkedBlockingQueue all-identical-element Array iterable construction yields matching size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [7, 7, 7, 7];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0650
     * @tc.name testBlockingQueueComprehensive065
     * @tc.desc Verify LinkedBlockingQueue mixed-radix-literal Array iterable preserves first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0x0A, 0o12, 0b1010];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.getFirst()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0660
     * @tc.name testBlockingQueueComprehensive066
     * @tc.desc Verify LinkedBlockingQueue Set iterable construction yields matching size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(11);
      src.add(22);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0670
     * @tc.name testBlockingQueueComprehensive067
     * @tc.desc Verify LinkedBlockingQueue empty Set iterable construction yields size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0680
     * @tc.name testBlockingQueueComprehensive068
     * @tc.desc Verify LinkedBlockingQueue large Array iterable of 100 elements construction yields size 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i);
      }
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.size).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0690
     * @tc.name testBlockingQueueComprehensive069
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable with fewer elements than capacity enqueues all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0700
     * @tc.name testBlockingQueueComprehensive070
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable filling exactly to capacity yields size equal to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4, src);
      expect(q.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0710
     * @tc.name testBlockingQueueComprehensive071
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable filled to capacity yields remainingCapacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4, src);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0720
     * @tc.name testBlockingQueueComprehensive072
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable with more elements than capacity truncates to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5, 6];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0730
     * @tc.name testBlockingQueueComprehensive073
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable truncation keeps first capacity elements (first element check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30, 40, 50];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2, src);
      expect(q.getFirst()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0740
     * @tc.name testBlockingQueueComprehensive074
     * @tc.desc Verify LinkedBlockingQueue capacity 1 with iterable truncates to a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [99, 88, 77];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1, src);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0750
     * @tc.name testBlockingQueueComprehensive075
     * @tc.desc Verify LinkedBlockingQueue capacity with empty iterable yields initial size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5, src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0760
     * @tc.name testBlockingQueueComprehensive076
     * @tc.desc Verify LinkedBlockingQueue capacity 0 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0770
     * @tc.name testBlockingQueueComprehensive077
     * @tc.desc Verify LinkedBlockingQueue capacity -1 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      try {
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-1, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0780
     * @tc.name testBlockingQueueComprehensive078
     * @tc.desc Verify LinkedBlockingQueue capacity with Set iterable enqueues all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(5);
      src.add(6);
      src.add(7);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0790
     * @tc.name testBlockingQueueComprehensive079
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable with fewer elements than capacity enqueues all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(8, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0800
     * @tc.name testBlockingQueueComprehensive080
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable filling exactly to capacity yields size equal to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [9, 8, 7];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, src);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0810
     * @tc.name testBlockingQueueComprehensive081
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable filled to capacity yields remainingCapacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [9, 8, 7];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, src);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0820
     * @tc.name testBlockingQueueComprehensive082
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable with more elements than capacity truncates to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2, src);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0830
     * @tc.name testBlockingQueueComprehensive083
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable truncation keeps first capacity elements (first element check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [100, 200, 300];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1, src);
      expect(q.getFirst()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0840
     * @tc.name testBlockingQueueComprehensive084
     * @tc.desc Verify ArrayBlockingQueue capacity with empty iterable yields initial size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(6, src);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0850
     * @tc.name testBlockingQueueComprehensive085
     * @tc.desc Verify ArrayBlockingQueue capacity 0 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0860
     * @tc.name testBlockingQueueComprehensive086
     * @tc.desc Verify ArrayBlockingQueue capacity Int.MIN_VALUE with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-2147483648, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0870
     * @tc.name testBlockingQueueComprehensive087
     * @tc.desc Verify ArrayBlockingQueue capacity -1 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [3, 4];
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-1, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0880
     * @tc.name testBlockingQueueComprehensive088
     * @tc.desc Verify ArrayBlockingQueue capacity with Set iterable enqueues all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(TEST_VALUE);
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0890
     * @tc.name testBlockingQueueComprehensive089
     * @tc.desc Verify ArrayBlockingQueue capacity with mixed-radix-literal iterable preserves first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0xFF, 0o10, 0b11];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, src);
      expect(q.getFirst()).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0900
     * @tc.name testBlockingQueueComprehensive090
     * @tc.desc Verify LinkedBlockingQueue element 0 (default value) push then getFirst returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      q.push(0);
      expect(q.getFirst()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0910
     * @tc.name testBlockingQueueComprehensive091
     * @tc.desc Verify LinkedBlockingQueue element hexadecimal literal 0x7F push then getFirst returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      q.push(0x7F);
      expect(q.getFirst()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0920
     * @tc.name testBlockingQueueComprehensive092
     * @tc.desc Verify ArrayBlockingQueue element octal literal 0o17 push then getFirst returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(0o17);
      expect(q.getFirst()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0930
     * @tc.name testBlockingQueueComprehensive093
     * @tc.desc Verify ArrayBlockingQueue element binary literal 0b101 push then getFirst returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(0b101);
      expect(q.getFirst()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0940
     * @tc.name testBlockingQueueComprehensive094
     * @tc.desc Verify ArrayBlockingQueue element 0 push then getFirst returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(0);
      expect(q.getFirst()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0950
     * @tc.name testBlockingQueueComprehensive095
     * @tc.desc Verify ArrayBlockingQueue element max int push then getFirst returns max int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(BOUNDARY_VALUE);
      expect(q.getFirst()).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0960
     * @tc.name testBlockingQueueComprehensive096
     * @tc.desc Verify ArrayBlockingQueue element min int push then getFirst returns min int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = -2147483648;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(4);
      q.push(BOUNDARY_VALUE);
      expect(q.getFirst()).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0970
     * @tc.name testBlockingQueueComprehensive097
     * @tc.desc Verify ArrayBlockingQueue number generic element 3.14 push then getFirst returns 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(4);
      q.push(3.14);
      expect(q.getFirst()).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0980
     * @tc.name testBlockingQueueComprehensive098
     * @tc.desc Verify LinkedBlockingQueue number generic element 1e10 push then getFirst returns 10000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(4);
      q.push(1e10);
      expect(q.getFirst()).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_0990
     * @tc.name testBlockingQueueComprehensive099
     * @tc.desc Verify LinkedBlockingQueue zero-arg constructor yields size=0 and default capacity 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1000
     * @tc.name testBlockingQueueComprehensive100
     * @tc.desc Verify LinkedBlockingQueue single capacity-arg constructor yields size=0 and capacity=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 8;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(8);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1010
     * @tc.name testBlockingQueueComprehensive101
     * @tc.desc Verify ArrayBlockingQueue single capacity-arg constructor yields size=0 and capacity=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 8;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(8);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1020
     * @tc.name testBlockingQueueComprehensive102
     * @tc.desc Verify LinkedBlockingQueue push returns undefined (void semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.push(1);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1030
     * @tc.name testBlockingQueueComprehensive103
     * @tc.desc Verify ArrayBlockingQueue push returns undefined (void semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.push(2);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1040
     * @tc.name testBlockingQueueComprehensive104
     * @tc.desc Verify LinkedBlockingQueue pop returns the pushed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 42;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(TEST_VALUE);
      let r = q.pop();
      expect(r).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1050
     * @tc.name testBlockingQueueComprehensive105
     * @tc.desc Verify ArrayBlockingQueue pop returns the pushed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 42;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(TEST_VALUE);
      let r = q.pop();
      expect(r).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1060
     * @tc.name testBlockingQueueComprehensive106
     * @tc.desc Verify LinkedBlockingQueue add returns true when not full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.add(1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1070
     * @tc.name testBlockingQueueComprehensive107
     * @tc.desc Verify ArrayBlockingQueue add returns true when not full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.add(1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1080
     * @tc.name testBlockingQueueComprehensive108
     * @tc.desc Verify LinkedBlockingQueue poll non-empty return value type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(3);
      let r = q.poll();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1090
     * @tc.name testBlockingQueueComprehensive109
     * @tc.desc Verify ArrayBlockingQueue poll non-empty return value type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(3);
      let r = q.poll();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1100
     * @tc.name testBlockingQueueComprehensive110
     * @tc.desc Verify LinkedBlockingQueue poll on empty queue returns undefined (non-blocking semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.poll();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1110
     * @tc.name testBlockingQueueComprehensive111
     * @tc.desc Verify ArrayBlockingQueue poll on empty queue returns undefined (non-blocking semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.poll();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1120
     * @tc.name testBlockingQueueComprehensive112
     * @tc.desc Verify LinkedBlockingQueue getFirst non-empty return value type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(4);
      let r = q.getFirst();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1130
     * @tc.name testBlockingQueueComprehensive113
     * @tc.desc Verify ArrayBlockingQueue getFirst non-empty return value type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(4);
      let r = q.getFirst();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1140
     * @tc.name testBlockingQueueComprehensive114
     * @tc.desc Verify LinkedBlockingQueue getEnd non-empty return value type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(8);
      let r = q.getEnd();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1150
     * @tc.name testBlockingQueueComprehensive115
     * @tc.desc Verify ArrayBlockingQueue getEnd non-empty return value type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(8);
      let r = q.getEnd();
      expect(typeof r).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1160
     * @tc.name testBlockingQueueComprehensive116
     * @tc.desc Verify LinkedBlockingQueue isEmpty returns true for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.isEmpty();
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1170
     * @tc.name testBlockingQueueComprehensive117
     * @tc.desc Verify ArrayBlockingQueue isEmpty returns true for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.isEmpty();
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1180
     * @tc.name testBlockingQueueComprehensive118
     * @tc.desc Verify LinkedBlockingQueue remainingCapacity returns capacity for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let r = q.remainingCapacity();
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1190
     * @tc.name testBlockingQueueComprehensive119
     * @tc.desc Verify ArrayBlockingQueue remainingCapacity returns capacity for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let r = q.remainingCapacity();
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1200
     * @tc.name testBlockingQueueComprehensive120
     * @tc.desc Verify LinkedBlockingQueue size is 0 for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1210
     * @tc.name testBlockingQueueComprehensive121
     * @tc.desc Verify ArrayBlockingQueue size is 0 for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1220
     * @tc.name testBlockingQueueComprehensive122
     * @tc.desc Verify LinkedBlockingQueue capacity is 5 for a capacity-5 queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      expect(q.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1230
     * @tc.name testBlockingQueueComprehensive123
     * @tc.desc Verify LinkedBlockingQueue and ArrayBlockingQueue return identical pop value for same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      lq.push(100);
      aq.push(100);
      expect(lq.pop()).assertEqual(aq.pop());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1240
     * @tc.name testBlockingQueueComprehensive124
     * @tc.desc Verify LinkedBlockingQueue and ArrayBlockingQueue full-queue add return values are identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      lq.add(1);
      aq.add(1);
      expect(lq.add(2)).assertEqual(aq.add(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_COMPREHENSIVE_1250
     * @tc.name testBlockingQueueComprehensive125
     * @tc.desc Verify LinkedBlockingQueue and ArrayBlockingQueue empty-queue poll return values are identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueComprehensive125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      expect(lq.poll()).assertEqual(aq.poll());
    });
  });
}
