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

class ChainObj {
  v: int = 0;

  constructor(v: int) {
    this.v = v;
  }
}

export default function BlockingQueueChainTest(): void {
  describe('BlockingQueueChainTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0100
     * @tc.name testBlockingQueueChain001
     * @tc.desc Verify long push chain on LinkedBlockingQueue: push 0..99, then pop all and verify FIFO
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 100;
      const EXPECTED_SIZE: int = 100;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 100;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(i);
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0200
     * @tc.name testBlockingQueueChain002
     * @tc.desc Verify alternating push/pop chain preserves FIFO and size returns to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      const EXPECTED_SIZE: int = 0;

      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();

      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
        expect(q.pop()).assertEqual(i);
      }

      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0300
     * @tc.name testBlockingQueueChain003
     * @tc.desc Verify add/poll chain: 50 add then 50 poll preserves FIFO
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 100;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 50;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        expect(q.add(i)).assertTrue();
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.poll()).assertEqual(i);
      }
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0400
     * @tc.name testBlockingQueueChain004
     * @tc.desc Verify push -> getFirst -> getEnd -> pop chain across 10 elements maintains head/tail invariants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 10;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
        expect(q.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
        expect(q.getEnd()).assertEqual(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.getFirst()).assertEqual(i);
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0500
     * @tc.name testBlockingQueueChain005
     * @tc.desc Verify mixed push/add/pop/poll chain on LinkedBlockingQueue<int>(20) preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const PUSH_VALUE: int = 1;
      const ADD_VALUE: int = 2;
      const PUSH_VALUE_2: int = 3;
      const ADD_VALUE_2: int = 4;
      const EXPECTED_POP_VALUE: int = 1;
      const EXPECTED_POLL_VALUE: int = 2;
      const EXPECTED_POP_VALUE_2: int = 3;
      const EXPECTED_POLL_VALUE_2: int = 4;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.add(ADD_VALUE)).assertTrue();
      q.push(PUSH_VALUE_2);
      expect(q.add(ADD_VALUE_2)).assertTrue();
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE_2);
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0600
     * @tc.name testBlockingQueueChain006
     * @tc.desc Verify capacity=5: fill -> drain -> refill -> drain (two full lifecycles) preserves FIFO each round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 2;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 5;
      const PUSH_VALUE: int = 10;
      const EXPECTED_SIZE: int = 5;
      const LOOP_START_3: int = 0;
      const LOOP_BOUND_3: int = 5;
      const EXPECTED_POP_VALUE: int = 10;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let r: int = LOOP_START; r < LOOP_BOUND; r++) {
        for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
          q.push(i + r * PUSH_VALUE);
        }
        expect(q.size).assertEqual(EXPECTED_SIZE);
        for (let i: int = LOOP_START_3; i < LOOP_BOUND_3; i++) {
          expect(q.pop()).assertEqual(i + r * EXPECTED_POP_VALUE);
        }
        expect(q.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0700
     * @tc.name testBlockingQueueChain007
     * @tc.desc Verify ArrayBlockingQueue capacity=10 fill -> drain -> refill maintains FIFO consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 10;
      const LOOP_START_3: int = 0;
      const LOOP_BOUND_3: int = 10;
      const PUSH_VALUE: int = 100;
      const LOOP_START_4: int = 0;
      const LOOP_BOUND_4: int = 10;
      const EXPECTED_POP_VALUE: int = 100;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(i);
      }
      for (let i: int = LOOP_START_3; i < LOOP_BOUND_3; i++) {
        q.push(i + PUSH_VALUE);
      }
      for (let i: int = LOOP_START_4; i < LOOP_BOUND_4; i++) {
        expect(q.pop()).assertEqual(i + EXPECTED_POP_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0800
     * @tc.name testBlockingQueueChain008
     * @tc.desc Verify partial drain then refill: ArrayBlockingQueue capacity=8, push 8, pop 4, push 4, pop all in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 8;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 8;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 4;
      const LOOP_START_3: int = 8;
      const LOOP_BOUND_3: int = 12;
      const LOOP_START_4: int = 4;
      const LOOP_BOUND_4: int = 12;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(i);
      }
      for (let i: int = LOOP_START_3; i < LOOP_BOUND_3; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_4; i < LOOP_BOUND_4; i++) {
        expect(q.pop()).assertEqual(i);
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_0900
     * @tc.name testBlockingQueueChain009
     * @tc.desc Verify circular buffer wraparound on ArrayBlockingQueue: push/pop cycles use ring properly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 4;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 5;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 3;
      const PUSH_VALUE: int = 10;
      const LOOP_START_3: int = 0;
      const LOOP_BOUND_3: int = 3;
      const EXPECTED_POP_VALUE: int = 10;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let cycle: int = LOOP_START; cycle < LOOP_BOUND; cycle++) {
        for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
          q.push(cycle * PUSH_VALUE + i);
        }
        for (let i: int = LOOP_START_3; i < LOOP_BOUND_3; i++) {
          expect(q.pop()).assertEqual(cycle * EXPECTED_POP_VALUE + i);
        }
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1000
     * @tc.name testBlockingQueueChain010
     * @tc.desc Verify add returns false repeatedly when queue stays full during chain of add attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 1;
      const ADD_VALUE_2: int = 2;
      const ADD_VALUE_3: int = 3;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const ADD_VALUE_4: int = 100;
      const EXPECTED_SIZE: int = 3;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q.add(ADD_VALUE)).assertTrue();
      expect(q.add(ADD_VALUE_2)).assertTrue();
      expect(q.add(ADD_VALUE_3)).assertTrue();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        expect(q.add(ADD_VALUE_4 + i)).assertFalse();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1100
     * @tc.name testBlockingQueueChain011
     * @tc.desc Verify poll returns undefined repeatedly when queue stays empty during chain of poll attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        expect(q.poll()).assertUndefined();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1200
     * @tc.name testBlockingQueueChain012
     * @tc.desc Verify getFirst/getEnd called repeatedly never modify queue state across long chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 100;
      const EXPECTED_FIRST_ELEMENT: int = 10;
      const EXPECTED_END_ELEMENT: int = 30;
      const EXPECTED_SIZE: int = 3;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        expect(q.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
        expect(q.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1300
     * @tc.name testBlockingQueueChain013
     * @tc.desc Verify isEmpty/remainingCapacity/size invariants hold through 100-step random chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 200;
      const EMPTY_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let expectedSize: int = 0;
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        if (i % 3 == 0 && expectedSize < CAPACITY) {
          q.push(i);
          expectedSize++;
        } else if (expectedSize > 0) {
          q.pop();
          expectedSize--;
        }
        expect(q.remainingCapacity()).assertEqual(CAPACITY - expectedSize);
        expect(q.isEmpty()).assertEqual(expectedSize == EMPTY_SIZE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1400
     * @tc.name testBlockingQueueChain014
     * @tc.desc Verify push/poll mixed chain on string queue preserves Unicode characters in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const STRING_ITEM: string = "α";
      const STRING_ITEM_2: string = "β";
      const STRING_ITEM_3: string = "γ";
      const STRING_ITEM_4: string = "δ";
      const STRING_ITEM_5: string = "ε";
      const STRING_ITEM_6: string = "中";
      const STRING_ITEM_7: string = "文";
      const STRING_ITEM_8: string = "🔥";
      const STRING_ITEM_9: string = "テ";
      const STRING_ITEM_10: string = "ㄓ";
      const LOOP_START: int = 0;
      const LOOP_START_2: int = 0;
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let strs: string[] = [STRING_ITEM, STRING_ITEM_2, STRING_ITEM_3, STRING_ITEM_4, STRING_ITEM_5, STRING_ITEM_6, STRING_ITEM_7, STRING_ITEM_8, STRING_ITEM_9, STRING_ITEM_10];
      for (let i: int = LOOP_START; i < strs.length; i++) {
        q.push(strs[i]);
      }
      for (let i: int = LOOP_START_2; i < strs.length; i++) {
        expect(q.poll()).assertEqual(strs[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1500
     * @tc.name testBlockingQueueChain015
     * @tc.desc Verify push/pop chain with negative numbers preserves sign across all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 50;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(-i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(-i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1600
     * @tc.name testBlockingQueueChain016
     * @tc.desc Verify chained push at boundary capacity Int.MAX_VALUE then drain works for first 1000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueChain016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2147483647;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 1000;
      const EXPECTED_SIZE: int = 1000;
      const EXPECTED_REMAINING_CAPACITY: int = 2147483647;
      const EXPECTED_REMAINING_CAPACITY_2: int = 1000;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY - EXPECTED_REMAINING_CAPACITY_2);
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1700
     * @tc.name testBlockingQueueChain017
     * @tc.desc Verify push -> add -> poll -> add cross-method chain correctly tracks size on capacity=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 4;
      const PUSH_VALUE: int = 1;
      const ADD_VALUE: int = 2;
      const EXPECTED_POLL_VALUE: int = 1;
      const ADD_VALUE_2: int = 3;
      const ADD_VALUE_3: int = 4;
      const ADD_VALUE_4: int = 5;
      const ADD_VALUE_5: int = 6;
      const EXPECTED_SIZE: int = 4;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.add(ADD_VALUE)).assertTrue();
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(q.add(ADD_VALUE_2)).assertTrue();
      expect(q.add(ADD_VALUE_3)).assertTrue();
      expect(q.add(ADD_VALUE_4)).assertTrue();
      expect(q.add(ADD_VALUE_5)).assertFalse();
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1800
     * @tc.name testBlockingQueueChain018
     * @tc.desc Verify chained operations on capacity=2: tight churn through 30 enqueue-dequeue cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 30;
      const PUSH_VALUE: int = 1000;
      const ADD_VALUE: int = 99999;
      const EXPECTED_POP_VALUE: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
        q.push(i + PUSH_VALUE);
        expect(q.add(i + ADD_VALUE)).assertFalse();
        expect(q.pop()).assertEqual(i);
        expect(q.pop()).assertEqual(i + EXPECTED_POP_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_1900
     * @tc.name testBlockingQueueChain019
     * @tc.desc Verify drain-and-fill chain preserves head pointer correctness across 50 cycles on ArrayBlockingQueue(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let cy: int = LOOP_START; cy < LOOP_BOUND; cy++) {
        q.push(cy);
        expect(q.getFirst()).assertEqual(cy);
        expect(q.getEnd()).assertEqual(cy);
        expect(q.pop()).assertEqual(cy);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2000
     * @tc.name testBlockingQueueChain020
     * @tc.desc Verify push then poll then push then poll then push then pop on string queue preserves order with 8 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: string = "a";
      const PUSH_VALUE_2: string = "b";
      const EXPECTED_POLL_VALUE: string = "a";
      const PUSH_VALUE_3: string = "c";
      const PUSH_VALUE_4: string = "d";
      const EXPECTED_POLL_VALUE_2: string = "b";
      const PUSH_VALUE_5: string = "e";
      const PUSH_VALUE_6: string = "f";
      const EXPECTED_POP_VALUE: string = "c";
      const EXPECTED_POP_VALUE_2: string = "d";
      const EXPECTED_POP_VALUE_3: string = "e";
      const EXPECTED_POP_VALUE_4: string = "f";
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE);
      q.push(PUSH_VALUE_3);
      q.push(PUSH_VALUE_4);
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE_2);
      q.push(PUSH_VALUE_5);
      q.push(PUSH_VALUE_6);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_3);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2100
     * @tc.name testBlockingQueueChain021
     * @tc.desc Verify capacity=1 boolean queue: push true, pop, push false, pop chain across 20 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 20;
      const PUSH_VALUE: boolean = true;
      const PUSH_VALUE_2: boolean = false;
      let q: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(PUSH_VALUE);
        expect(q.pop()).assertTrue();
        q.push(PUSH_VALUE_2);
        expect(q.pop()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2200
     * @tc.name testBlockingQueueChain022
     * @tc.desc Verify ArrayBlockingQueue boolean queue: alternating add/poll chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 30;
      let q: containers.BlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        let isFirstTrue: boolean = (i % 2 == 0);
        expect(q.add(isFirstTrue)).assertTrue();
        expect(q.add(!isFirstTrue)).assertTrue();
        expect(q.poll()).assertEqual(isFirstTrue);
        expect(q.poll()).assertEqual(!isFirstTrue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2300
     * @tc.name testBlockingQueueChain023
     * @tc.desc Verify chained push of objects: 30 ChainObj instances pushed then popped in same order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 30;
      const OBJECT_VALUE: int = 7;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 30;
      const EXPECTED_VALUE: int = 7;
      let q: containers.BlockingQueue<ChainObj> = new containers.LinkedBlockingQueue<ChainObj>();
      let arr: ChainObj[] = [];
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        let obj = new ChainObj(i * OBJECT_VALUE);
        arr.push(obj);
        q.push(obj);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        let o = q.pop();
        expect(o).assertEqual(arr[i]);
        expect(o.v).assertEqual(i * EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2400
     * @tc.name testBlockingQueueChain024
     * @tc.desc Verify chained queue-to-queue transfer preserves order and contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 15;
      const EXPECTED_SIZE: int = 15;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 15;
      let src: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let dst: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        src.push(i);
      }
      while (!src.isEmpty()) {
        dst.push(src.pop());
      }
      expect(src.isEmpty()).assertTrue();
      expect(dst.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(dst.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2500
     * @tc.name testBlockingQueueChain025
     * @tc.desc Verify chained operations: pre-filled iterable then push then pop pattern preserves combined order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_ITEM: int = 10;
      const ARRAY_ITEM_2: int = 20;
      const ARRAY_ITEM_3: int = 30;
      const PUSH_VALUE: int = 40;
      const PUSH_VALUE_2: int = 50;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_POP_VALUE: int = 10;
      const EXPECTED_POP_VALUE_2: int = 20;
      const EXPECTED_POP_VALUE_3: int = 30;
      const EXPECTED_POP_VALUE_4: int = 40;
      const EXPECTED_POP_VALUE_5: int = 50;
      let arr: int[] = [ARRAY_ITEM, ARRAY_ITEM_2, ARRAY_ITEM_3];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_3);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_4);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2600
     * @tc.name testBlockingQueueChain026
     * @tc.desc Verify long chained add operations on capacity=Int.MAX_VALUE all return true (default LinkedBlockingQueue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 500;
      const EXPECTED_SIZE: int = 500;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        expect(q.add(i)).assertTrue();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2700
     * @tc.name testBlockingQueueChain027
     * @tc.desc Verify size monotonicity: size is non-decreasing during pure push chain, non-increasing during pure pop chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 30;
      const EXPECTED_SIZE: int = 1;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 30;
      const EXPECTED_SIZE_2: int = 29;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
        expect(q.size).assertEqual(i + EXPECTED_SIZE);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        q.pop();
        expect(q.size).assertEqual(EXPECTED_SIZE_2 - i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2800
     * @tc.name testBlockingQueueChain028
     * @tc.desc Verify add result chain matches size delta: each true add increases size by 1, each false add leaves size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_SIZE_2: int = 5;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        let szBefore: int = q.size;
        let res: boolean = q.add(i);
        if (res) {
          expect(q.size).assertEqual(szBefore + EXPECTED_SIZE);
        } else {
          expect(q.size).assertEqual(szBefore);
        }
      }
      expect(q.size).assertEqual(EXPECTED_SIZE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_2900
     * @tc.name testBlockingQueueChain029
     * @tc.desc Verify poll undefined chain: empty queue 100 polls all return undefined and size remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 100;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        let r = q.poll();
        expect(r).assertUndefined();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3000
     * @tc.name testBlockingQueueChain030
     * @tc.desc Verify capacity-iterable construction then chain push+pop on ArrayBlockingQueue<int>(20, [1..10])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_ITEM: int = 1;
      const ARRAY_ITEM_2: int = 2;
      const ARRAY_ITEM_3: int = 3;
      const ARRAY_ITEM_4: int = 4;
      const ARRAY_ITEM_5: int = 5;
      const ARRAY_ITEM_6: int = 6;
      const ARRAY_ITEM_7: int = 7;
      const ARRAY_ITEM_8: int = 8;
      const ARRAY_ITEM_9: int = 9;
      const ARRAY_ITEM_10: int = 10;
      const CAPACITY: int = 20;
      const EXPECTED_SIZE: int = 10;
      const LOOP_START: int = 11;
      const LOOP_START_2: int = 20;
      const EXPECTED_SIZE_2: int = 20;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const LOOP_START_3: int = 1;
      const LOOP_START_4: int = 20;
      let arr: int[] = [ARRAY_ITEM, ARRAY_ITEM_2, ARRAY_ITEM_3, ARRAY_ITEM_4, ARRAY_ITEM_5, ARRAY_ITEM_6, ARRAY_ITEM_7, ARRAY_ITEM_8, ARRAY_ITEM_9, ARRAY_ITEM_10];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = LOOP_START; i <= LOOP_START_2; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE_2);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      for (let i: int = LOOP_START_3; i <= LOOP_START_4; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3100
     * @tc.name testBlockingQueueChain031
     * @tc.desc Verify ArrayBlockingQueue capacity=5: ring-buffer wrap when head moves past start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_POP_VALUE: int = 1;
      const EXPECTED_POP_VALUE_2: int = 2;
      const PUSH_VALUE_4: int = 4;
      const PUSH_VALUE_5: int = 5;
      const PUSH_VALUE_6: int = 6;
      const PUSH_VALUE_7: int = 7;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_POP_VALUE_3: int = 3;
      const EXPECTED_POP_VALUE_4: int = 4;
      const EXPECTED_POP_VALUE_5: int = 5;
      const EXPECTED_POP_VALUE_6: int = 6;
      const EXPECTED_POP_VALUE_7: int = 7;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      q.push(PUSH_VALUE_4);
      q.push(PUSH_VALUE_5);
      q.push(PUSH_VALUE_6);
      q.push(PUSH_VALUE_7);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_3);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_4);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_5);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_6);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3200
     * @tc.name testBlockingQueueChain032
     * @tc.desc Verify mixed push/poll chain on ArrayBlockingQueue<string>(3) with Unicode preserves all characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const STRING_ITEM: string = "你好";
      const STRING_ITEM_2: string = "世界";
      const STRING_ITEM_3: string = "🌍";
      const STRING_ITEM_4: string = "Привет";
      const STRING_ITEM_5: string = "مرحبا";
      const STRING_ITEM_6: string = "안녕";
      const STRING_ITEM_7: string = "こんにちは";
      const STRING_ITEM_8: string = "γειά";
      const LOOP_START: int = 0;
      let q: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      let strs: string[] = [STRING_ITEM, STRING_ITEM_2, STRING_ITEM_3, STRING_ITEM_4, STRING_ITEM_5, STRING_ITEM_6, STRING_ITEM_7, STRING_ITEM_8];
      for (let i: int = LOOP_START; i < strs.length; i++) {
        q.push(strs[i]);
        expect(q.poll()).assertEqual(strs[i]);
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3300
     * @tc.name testBlockingQueueChain033
     * @tc.desc Verify long chain: capacity=10 fill, drain via pop, fill via add, drain via poll, all FIFO
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 10;
      const LOOP_START_3: int = 100;
      const LOOP_BOUND_3: int = 110;
      const LOOP_START_4: int = 100;
      const LOOP_BOUND_4: int = 110;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(i);
      }
      for (let i: int = LOOP_START_3; i < LOOP_BOUND_3; i++) {
        expect(q.add(i)).assertTrue();
      }
      for (let i: int = LOOP_START_4; i < LOOP_BOUND_4; i++) {
        expect(q.poll()).assertEqual(i);
      }
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3400
     * @tc.name testBlockingQueueChain034
     * @tc.desc Verify push int max/min alternating chain preserves all extreme values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const PUSH_VALUE: int = 2147483647;
      const PUSH_VALUE_2: int = -2147483648;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 10;
      const EXPECTED_POP_VALUE: int = 2147483647;
      const EXPECTED_POP_VALUE_2: int = -2147483648;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(PUSH_VALUE);
        q.push(PUSH_VALUE_2);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
        expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3500
     * @tc.name testBlockingQueueChain035
     * @tc.desc Verify chain of getFirst between pushes always returns the very first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 7;
      const LOOP_START: int = 1;
      const LOOP_BOUND: int = 50;
      const PUSH_VALUE_2: int = 100;
      const EXPECTED_FIRST_ELEMENT: int = 7;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i + PUSH_VALUE_2);
        expect(q.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3600
     * @tc.name testBlockingQueueChain036
     * @tc.desc Verify chain of getEnd between pushes always returns the most recently pushed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      const PUSH_VALUE: int = 3;
      const EXPECTED_END_ELEMENT: int = 3;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i * PUSH_VALUE);
        expect(q.getEnd()).assertEqual(i * EXPECTED_END_ELEMENT);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3700
     * @tc.name testBlockingQueueChain037
     * @tc.desc Verify chain of pop on prefilled-by-iterable LinkedBlockingQueue preserves iterable order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_ITEM: int = 9;
      const ARRAY_ITEM_2: int = 8;
      const ARRAY_ITEM_3: int = 7;
      const ARRAY_ITEM_4: int = 6;
      const ARRAY_ITEM_5: int = 5;
      const ARRAY_ITEM_6: int = 4;
      const ARRAY_ITEM_7: int = 3;
      const ARRAY_ITEM_8: int = 2;
      const ARRAY_ITEM_9: int = 1;
      const ARRAY_ITEM_10: int = 0;
      const LOOP_START: int = 0;
      let arr: int[] = [ARRAY_ITEM, ARRAY_ITEM_2, ARRAY_ITEM_3, ARRAY_ITEM_4, ARRAY_ITEM_5, ARRAY_ITEM_6, ARRAY_ITEM_7, ARRAY_ITEM_8, ARRAY_ITEM_9, ARRAY_ITEM_10];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      for (let i: int = LOOP_START; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3800
     * @tc.name testBlockingQueueChain038
     * @tc.desc Verify chain on LinkedBlockingQueue<string>(50) with empty strings interleaved preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 25;
      const PUSH_VALUE: string = "";
      const PUSH_VALUE_2: string = "x";
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 25;
      const EXPECTED_POP_VALUE: string = "";
      const EXPECTED_POP_VALUE_2: string = "x";
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(PUSH_VALUE);
        q.push(PUSH_VALUE_2 + i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
        expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2 + i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_3900
     * @tc.name testBlockingQueueChain039
     * @tc.desc Verify ArrayBlockingQueue<string>(50) chain with whitespace and control characters interleaved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const STRING_ITEM: string = "";
      const STRING_ITEM_2: string = " ";
      const STRING_ITEM_3: string = "\t";
      const STRING_ITEM_4: string = "\n";
      const STRING_ITEM_5: string = "\r";
      const STRING_ITEM_6: string = "\r\n";
      const STRING_ITEM_7: string = "  ";
      const STRING_ITEM_8: string = "​";
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 4;
      const LOOP_START_2: int = 0;
      const LOOP_START_3: int = 0;
      const LOOP_BOUND_2: int = 4;
      const LOOP_START_4: int = 0;
      let q: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      let strs: string[] = [STRING_ITEM, STRING_ITEM_2, STRING_ITEM_3, STRING_ITEM_4, STRING_ITEM_5, STRING_ITEM_6, STRING_ITEM_7, STRING_ITEM_8];
      for (let r: int = LOOP_START; r < LOOP_BOUND; r++) {
        for (let i: int = LOOP_START_2; i < strs.length; i++) {
          q.push(strs[i]);
        }
      }
      for (let r: int = LOOP_START_3; r < LOOP_BOUND_2; r++) {
        for (let i: int = LOOP_START_4; i < strs.length; i++) {
          expect(q.pop()).assertEqual(strs[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4000
     * @tc.name testBlockingQueueChain040
     * @tc.desc Verify long chain test: 1000 push then 500 pop then 500 add then 500 poll then 500 pop on default LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueChain040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 1000;
      const EXPECTED_SIZE: int = 1000;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 500;
      const EXPECTED_SIZE_2: int = 500;
      const LOOP_START_3: int = 1000;
      const LOOP_BOUND_3: int = 1500;
      const EXPECTED_SIZE_3: int = 1000;
      const LOOP_START_4: int = 500;
      const LOOP_BOUND_4: int = 1000;
      const LOOP_START_5: int = 1000;
      const LOOP_BOUND_5: int = 1500;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(i);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE_2);
      for (let i: int = LOOP_START_3; i < LOOP_BOUND_3; i++) {
        expect(q.add(i)).assertTrue();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE_3);
      for (let i: int = LOOP_START_4; i < LOOP_BOUND_4; i++) {
        expect(q.poll()).assertEqual(i);
      }
      for (let i: int = LOOP_START_5; i < LOOP_BOUND_5; i++) {
        expect(q.pop()).assertEqual(i);
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4100
     * @tc.name testBlockingQueueChain041
     * @tc.desc Verify chain across both implementations same pattern: behavior identical for Linked vs Array(20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const CAPACITY_2: int = 20;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 20;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 20;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let q2: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY_2);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q1.push(i);
        q2.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q1.pop()).assertEqual(q2.pop());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4200
     * @tc.name testBlockingQueueChain042
     * @tc.desc Verify isEmpty/getFirst/getEnd consistency chain: when isEmpty, getFirst/getEnd return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 10;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
        expect(q.isEmpty()).assertFalse();
        expect(q.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        q.pop();
      }
      expect(q.isEmpty()).assertTrue();
      expect(q.getFirst()).assertUndefined();
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4300
     * @tc.name testBlockingQueueChain043
     * @tc.desc Verify chain interleaving add and pop on capacity=2 spans 100 operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 100;
      const EXPECTED_SIZE: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let expectedPop: int = 0;
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        if (q.size < 2) {
          expect(q.add(i)).assertTrue();
        } else {
          expect(q.pop()).assertEqual(expectedPop);
          if (expectedPop === 0) {
            expectedPop = 1;
          } else {
            expectedPop += 2;
          }
        }
      }
      while (!q.isEmpty()) {
        q.pop();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4400
     * @tc.name testBlockingQueueChain044
     * @tc.desc Verify chain consistency: poll after pop after push always returns expected next element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 11;
      const PUSH_VALUE_2: int = 22;
      const PUSH_VALUE_3: int = 33;
      const PUSH_VALUE_4: int = 44;
      const EXPECTED_POP_VALUE: int = 11;
      const EXPECTED_POLL_VALUE: int = 22;
      const EXPECTED_POP_VALUE_2: int = 33;
      const EXPECTED_POLL_VALUE_2: int = 44;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      q.push(PUSH_VALUE_4);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      expect(q.poll()).assertEqual(EXPECTED_POLL_VALUE_2);
      expect(q.poll()).assertUndefined();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4500
     * @tc.name testBlockingQueueChain045
     * @tc.desc Verify chain: capacity=Int.MAX_VALUE with 5000 push/pop operations preserves all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueChain045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2147483647;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 5000;
      const EXPECTED_SIZE: int = 5000;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 5000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4600
     * @tc.name testBlockingQueueChain046
     * @tc.desc Verify chain on default-constructed string queue: 200 strings push then pop in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 200;
      const PUSH_VALUE: string = "s";
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 200;
      const EXPECTED_POP_VALUE: string = "s";
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(PUSH_VALUE + i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        expect(q.pop()).assertEqual(EXPECTED_POP_VALUE + i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4700
     * @tc.name testBlockingQueueChain047
     * @tc.desc Verify chain on ArrayBlockingQueue: getEnd updates correctly after each push in 30-element chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 30;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 30;
      const PUSH_VALUE: int = 2;
      const EXPECTED_END_ELEMENT: int = 2;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i * PUSH_VALUE);
        expect(q.getEnd()).assertEqual(i * EXPECTED_END_ELEMENT);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4800
     * @tc.name testBlockingQueueChain048
     * @tc.desc Verify chain on iteration of producer/consumer simulation 1000 cycles single thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueChain048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 1000;
      const EXPECTED_VALUE: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let consumed: int = 0;
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        if (q.size < 10) {
          q.push(i);
        }
        if (q.size > 0) {
          q.pop();
          consumed++;
        }
      }
      expect(consumed).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_4900
     * @tc.name testBlockingQueueChain049
     * @tc.desc Verify chain on ArrayBlockingQueue starvation scenario: continuous add returns false 100 times when full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 100;
      const ADD_VALUE: int = 100;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_FIRST_ELEMENT: int = 1;
      const EXPECTED_END_ELEMENT: int = 2;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        expect(q.add(i + ADD_VALUE)).assertFalse();
      }
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(q.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5000
     * @tc.name testBlockingQueueChain050
     * @tc.desc Verify chain combining all 8 methods sequentially: push -> add -> getFirst -> getEnd -> isEmpty -> remainingCapacity -> poll -> pop, repeated 50 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      const ADD_VALUE: int = 1000;
      const EXPECTED_END_ELEMENT: int = 1000;
      const EXPECTED_POP_VALUE: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
        expect(q.add(i + ADD_VALUE)).assertTrue();
        expect(q.getFirst()).assertEqual(i);
        expect(q.getEnd()).assertEqual(i + EXPECTED_END_ELEMENT);
        expect(q.isEmpty()).assertFalse();
        expect(q.remainingCapacity()).assertEqual(8);
        expect(q.poll()).assertEqual(i);
        expect(q.pop()).assertEqual(i + EXPECTED_POP_VALUE);
        expect(q.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5100
     * @tc.name testBlockingQueueChain051
     * @tc.desc Verify ArrayBlockingQueue chain combining all 8 methods (same coverage as Chain050) for the array implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 30;
      const ADD_VALUE: int = 1000;
      const EXPECTED_END_ELEMENT: int = 1000;
      const EXPECTED_POP_VALUE: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
        expect(q.add(i + ADD_VALUE)).assertTrue();
        expect(q.getFirst()).assertEqual(i);
        expect(q.getEnd()).assertEqual(i + EXPECTED_END_ELEMENT);
        expect(q.poll()).assertEqual(i);
        expect(q.pop()).assertEqual(i + EXPECTED_POP_VALUE);
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5200
     * @tc.name testBlockingQueueChain052
     * @tc.desc Verify chain after multiple half-drains preserves head pointer correctness on ArrayBlockingQueue(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 7;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 5;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 2;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      let counter: int = 0;
      for (let cy: int = LOOP_START; cy < LOOP_BOUND; cy++) {
        for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
          q.push(counter);
          counter++;
        }
        q.pop();
      }
      let expected: int = 5;
      while (!q.isEmpty()) {
        expect(q.pop()).assertEqual(expected);
        expected++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5300
     * @tc.name testBlockingQueueChain053
     * @tc.desc Verify chain: pre-fill via iterable then drain via poll only (capacity=Int.MAX_VALUE LinkedBlockingQueue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_ITEM: int = 100;
      const ARRAY_ITEM_2: int = 200;
      const ARRAY_ITEM_3: int = 300;
      const ARRAY_ITEM_4: int = 400;
      const ARRAY_ITEM_5: int = 500;
      const LOOP_START: int = 0;
      let arr: int[] = [ARRAY_ITEM, ARRAY_ITEM_2, ARRAY_ITEM_3, ARRAY_ITEM_4, ARRAY_ITEM_5];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      for (let i: int = LOOP_START; i < arr.length; i++) {
        expect(q.poll()).assertEqual(arr[i]);
      }
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5400
     * @tc.name testBlockingQueueChain054
     * @tc.desc Verify chain: pre-fill via iterable + capacity then drain via pop on ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_ITEM: int = 11;
      const ARRAY_ITEM_2: int = 22;
      const ARRAY_ITEM_3: int = 33;
      const ARRAY_ITEM_4: int = 44;
      const ARRAY_ITEM_5: int = 55;
      const ARRAY_ITEM_6: int = 66;
      const ARRAY_ITEM_7: int = 77;
      const ARRAY_ITEM_8: int = 88;
      const ARRAY_ITEM_9: int = 99;
      const CAPACITY: int = 20;
      const LOOP_START: int = 0;
      const PUSH_VALUE: int = 1000;
      const EXPECTED_POP_VALUE: int = 1000;
      let arr: int[] = [ARRAY_ITEM, ARRAY_ITEM_2, ARRAY_ITEM_3, ARRAY_ITEM_4, ARRAY_ITEM_5, ARRAY_ITEM_6, ARRAY_ITEM_7, ARRAY_ITEM_8, ARRAY_ITEM_9];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      for (let i: int = LOOP_START; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
      expect(q.isEmpty()).assertTrue();
      q.push(PUSH_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5500
     * @tc.name testBlockingQueueChain055
     * @tc.desc Verify chain on int queue via push,push,push,pop,pop,push,push,pop pattern preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_POP_VALUE: int = 1;
      const EXPECTED_POP_VALUE_2: int = 2;
      const PUSH_VALUE_4: int = 4;
      const PUSH_VALUE_5: int = 5;
      const EXPECTED_POP_VALUE_3: int = 3;
      const EXPECTED_POP_VALUE_4: int = 4;
      const EXPECTED_POP_VALUE_5: int = 5;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_2);
      q.push(PUSH_VALUE_4);
      q.push(PUSH_VALUE_5);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_3);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_4);
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE_5);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5600
     * @tc.name testBlockingQueueChain056
     * @tc.desc Verify chain involving zero, negative, max, and min values mixed in single queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_ITEM: int = 0;
      const ARRAY_ITEM_2: int = -1;
      const ARRAY_ITEM_3: int = 1;
      const ARRAY_ITEM_4: int = 2147483647;
      const ARRAY_ITEM_5: int = -2147483648;
      const ARRAY_ITEM_6: int = 100;
      const ARRAY_ITEM_7: int = -100;
      const ARRAY_ITEM_8: int = 0;
      const LOOP_START: int = 0;
      const LOOP_START_2: int = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let vals: int[] = [ARRAY_ITEM, ARRAY_ITEM_2, ARRAY_ITEM_3, ARRAY_ITEM_4, ARRAY_ITEM_5, ARRAY_ITEM_6, ARRAY_ITEM_7, ARRAY_ITEM_8];
      for (let i: int = LOOP_START; i < vals.length; i++) {
        q.push(vals[i]);
      }
      for (let i: int = LOOP_START_2; i < vals.length; i++) {
        expect(q.pop()).assertEqual(vals[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5700
     * @tc.name testBlockingQueueChain057
     * @tc.desc Verify chain checking that getFirst === pop's next return value across many push/pop cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      const PUSH_VALUE: int = 11;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 50;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i * PUSH_VALUE);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        const EXPECTED_HEAD: int = i * PUSH_VALUE;
        let head: int | undefined = q.getFirst();
        let popped: int = q.pop();
        expect(head).assertEqual(EXPECTED_HEAD);
        expect(popped).assertEqual(EXPECTED_HEAD);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5800
     * @tc.name testBlockingQueueChain058
     * @tc.desc Verify chain checking that getEnd is invariant to head-side operations (pop only changes head, not tail)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 20;
      const LOOP_START_2: int = 0;
      const LOOP_BOUND_2: int = 19;
      const EXPECTED_END_ELEMENT: int = 19;
      const EXPECTED_POP_VALUE: int = 19;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        q.push(i);
      }
      for (let i: int = LOOP_START_2; i < LOOP_BOUND_2; i++) {
        q.pop();
        expect(q.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
      }
      expect(q.pop()).assertEqual(EXPECTED_POP_VALUE);
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_5900
     * @tc.name testBlockingQueueChain059
     * @tc.desc Verify chain: capacity=3 add fail does not change getFirst/getEnd snapshot across many failures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 7;
      const PUSH_VALUE_2: int = 8;
      const PUSH_VALUE_3: int = 9;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      const ADD_VALUE: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      let firstSnap = q.getFirst();
      let endSnap = q.getEnd();
      for (let i: int = LOOP_START; i < LOOP_BOUND; i++) {
        expect(q.add(i + ADD_VALUE)).assertFalse();
        expect(q.getFirst()).assertEqual(firstSnap);
        expect(q.getEnd()).assertEqual(endSnap);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CHAIN_6000
     * @tc.name testBlockingQueueChain060
     * @tc.desc Verify chain: capacity=5 ArrayBlockingQueue continuously refilled, drain to half then top up matches snapshot pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueChain060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 30;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      let pushCounter: int = 0;
      let popCounter: int = 0;
      for (let cy: int = LOOP_START; cy < LOOP_BOUND; cy++) {
        while (q.size < 5) {
          q.push(pushCounter);
          pushCounter++;
        }
        while (q.size > 2) {
          expect(q.pop()).assertEqual(popCounter);
          popCounter++;
        }
      }
      expect(pushCounter - popCounter).assertEqual(q.size);
    });

  });
}
