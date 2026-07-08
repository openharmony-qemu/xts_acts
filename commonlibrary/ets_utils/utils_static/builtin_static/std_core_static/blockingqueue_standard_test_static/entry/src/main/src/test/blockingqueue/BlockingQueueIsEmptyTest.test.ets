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

class CustomObject010 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

export default function BlockingQueueIsEmptyTest(): void {
  describe('BlockingQueueIsEmptyTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0010
     * @tc.name testBlockingQueueIsEmpty001
     * @tc.desc Verify LinkedBlockingQueue default constructor: new queue isEmpty() returns true for int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0020
     * @tc.name testBlockingQueueIsEmpty002
     * @tc.desc Verify LinkedBlockingQueue default constructor: push 0 then isEmpty() returns false (zero is not an empty marker)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_VALUE);
      expect(queue.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0030
     * @tc.name testBlockingQueueIsEmpty003
     * @tc.desc Verify LinkedBlockingQueue default constructor: push multiple elements then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0040
     * @tc.name testBlockingQueueIsEmpty004
     * @tc.desc Verify LinkedBlockingQueue default constructor: push then pop all, isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.isEmpty()).assertFalse();
      queue.pop();
      queue.pop();
      queue.pop();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0050
     * @tc.name testBlockingQueueIsEmpty005
     * @tc.desc Verify LinkedBlockingQueue default constructor: new string queue isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0060
     * @tc.name testBlockingQueueIsEmpty006
     * @tc.desc Verify LinkedBlockingQueue default constructor: push("") empty string then isEmpty() returns false (empty string != empty queue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_TEXT);
      expect(queue.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0070
     * @tc.name testBlockingQueueIsEmpty007
     * @tc.desc Verify LinkedBlockingQueue default constructor: push("test") then pop(), isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "test";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_TEXT);
      expect(queue.isEmpty()).assertFalse();
      queue.pop();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0080
     * @tc.name testBlockingQueueIsEmpty008
     * @tc.desc Verify LinkedBlockingQueue default constructor: boolean queue isEmpty lifecycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_FLAG: boolean = false;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_FLAG);
      expect(queue.isEmpty()).assertFalse();
      queue.pop();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0090
     * @tc.name testBlockingQueueIsEmpty009
     * @tc.desc Verify LinkedBlockingQueue default constructor: push CustomObject then pop, isEmpty() returns false then true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_VALUE: int = 100;
      const OBJECT_NAME: string = "obj";
      let obj: CustomObject010 = new CustomObject010(OBJECT_NAME, OBJECT_VALUE);
      let queue: containers.BlockingQueue<CustomObject010> = new containers.LinkedBlockingQueue<CustomObject010>();
      expect(queue.isEmpty()).assertTrue();
      queue.push(obj);
      expect(queue.isEmpty()).assertFalse();
      queue.pop();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0100
     * @tc.name testBlockingQueueIsEmpty010
     * @tc.desc Verify LinkedBlockingQueue with capacity=3: lifecycle empty->push 1 (false)->push 2 (false)->fill (false)->pop all (true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_VALUE);
      expect(queue.isEmpty()).assertFalse();
      queue.push(PUSH_VALUE_2);
      expect(queue.isEmpty()).assertFalse();
      queue.push(PUSH_VALUE_3);
      expect(queue.isEmpty()).assertFalse();
      queue.pop();
      queue.pop();
      queue.pop();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0110
     * @tc.name testBlockingQueueIsEmpty011
     * @tc.desc Verify LinkedBlockingQueue with empty array iterable: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0120
     * @tc.name testBlockingQueueIsEmpty012
     * @tc.desc Verify LinkedBlockingQueue with 5-element array iterable: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 10;
      let arr: int[] = [];
      for (let i = 0; i < 5; i++) {
        arr.push(i * PUSH_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0130
     * @tc.name testBlockingQueueIsEmpty013
     * @tc.desc Verify LinkedBlockingQueue with capacity=3 and 10-element iterable: isEmpty() returns false (3 elements enqueued)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0140
     * @tc.name testBlockingQueueIsEmpty014
     * @tc.desc Verify LinkedBlockingQueue with capacity=3 and empty array iterable: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      let arr: int[] = [];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0150
     * @tc.name testBlockingQueueIsEmpty015
     * @tc.desc Verify ArrayBlockingQueue int type: initial isEmpty()=true, push 5 then isEmpty()=false, pop 5 then isEmpty()=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      const PUSH_VALUE_4: int = 40;
      const PUSH_VALUE_5: int = 50;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      queue.push(PUSH_VALUE_4);
      queue.push(PUSH_VALUE_5);
      expect(queue.isEmpty()).assertFalse();
      queue.pop();
      queue.pop();
      queue.pop();
      queue.pop();
      queue.pop();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0160
     * @tc.name testBlockingQueueIsEmpty016
     * @tc.desc Verify ArrayBlockingQueue string type: initial isEmpty()=true, push("a") then isEmpty()=false, pop then isEmpty()=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIsEmpty016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_TEXT: string = "a";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      expect(queue.isEmpty()).assertTrue();
      queue.push(PUSH_TEXT);
      expect(queue.isEmpty()).assertFalse();
      queue.pop();
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0170
     * @tc.name testBlockingQueueIsEmpty017
     * @tc.desc Verify ArrayBlockingQueue with Set(3) iterable: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ADD_VALUE: number = 10;
      const ADD_VALUE_2: number = 20;
      const ADD_VALUE_3: number = 30;
      const CAPACITY: int = 10;
      let set: Set<number> = new Set<number>();
      set.add(ADD_VALUE);
      set.add(ADD_VALUE_2);
      set.add(ADD_VALUE_3);
      let queue: containers.BlockingQueue<number> = new containers.ArrayBlockingQueue<number>(CAPACITY, set);
      expect(queue.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0180
     * @tc.name testBlockingQueueIsEmpty018
     * @tc.desc Verify ArrayBlockingQueue with capacity arity=0: new queue isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let r: boolean = q.isEmpty();
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0190
     * @tc.name testBlockingQueueIsEmpty019
     * @tc.desc Verify ArrayBlockingQueue with capacity=1: new empty queue isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      let r: boolean = q.isEmpty();
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0200
     * @tc.name testBlockingQueueIsEmpty020
     * @tc.desc Verify LinkedBlockingQueue with capacity=1: new empty queue isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0210
     * @tc.name testBlockingQueueIsEmpty021
     * @tc.desc Verify LinkedBlockingQueue with capacity=2147483647: new empty queue isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2147483647);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0220
     * @tc.name testBlockingQueueIsEmpty022
     * @tc.desc Verify LinkedBlockingQueue new empty queue: size is 0 and isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      expect(q.size).assertEqual(0);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0230
     * @tc.name testBlockingQueueIsEmpty023
     * @tc.desc Verify ArrayBlockingQueue new empty queue: size is 0 and isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.size).assertEqual(0);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0240
     * @tc.name testBlockingQueueIsEmpty024
     * @tc.desc Verify ArrayBlockingQueue constructed from empty Array iterable: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, arr);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0250
     * @tc.name testBlockingQueueIsEmpty025
     * @tc.desc Verify LinkedBlockingQueue constructed from empty Set iterable: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, s);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0260
     * @tc.name testBlockingQueueIsEmpty026
     * @tc.desc Verify ArrayBlockingQueue constructed from empty Set iterable: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, s);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0270
     * @tc.name testBlockingQueueIsEmpty027
     * @tc.desc Verify ArrayBlockingQueue push 1 int element then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0280
     * @tc.name testBlockingQueueIsEmpty028
     * @tc.desc Verify LinkedBlockingQueue push element=-1 then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(-1);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0290
     * @tc.name testBlockingQueueIsEmpty029
     * @tc.desc Verify ArrayBlockingQueue push 2 elements then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0300
     * @tc.name testBlockingQueueIsEmpty030
     * @tc.desc Verify LinkedBlockingQueue capacity=1 push to full then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(1);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0310
     * @tc.name testBlockingQueueIsEmpty031
     * @tc.desc Verify ArrayBlockingQueue capacity=1 push to full then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(1);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0320
     * @tc.name testBlockingQueueIsEmpty032
     * @tc.desc Verify LinkedBlockingQueue push then size is 1 and isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(5);
      expect(q.size).assertEqual(1);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0330
     * @tc.name testBlockingQueueIsEmpty033
     * @tc.desc Verify ArrayBlockingQueue push then size is 1 and isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(5);
      expect(q.size).assertEqual(1);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0340
     * @tc.name testBlockingQueueIsEmpty034
     * @tc.desc Verify LinkedBlockingQueue add 1 element then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(1);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0350
     * @tc.name testBlockingQueueIsEmpty035
     * @tc.desc Verify ArrayBlockingQueue add 1 element then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(1);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0360
     * @tc.name testBlockingQueueIsEmpty036
     * @tc.desc Verify LinkedBlockingQueue add element=0 then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(0);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0370
     * @tc.name testBlockingQueueIsEmpty037
     * @tc.desc Verify ArrayBlockingQueue add element=2147483647 then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(2147483647);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0380
     * @tc.name testBlockingQueueIsEmpty038
     * @tc.desc Verify LinkedBlockingQueue add multiple elements then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0390
     * @tc.name testBlockingQueueIsEmpty039
     * @tc.desc Verify ArrayBlockingQueue add multiple elements then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0400
     * @tc.name testBlockingQueueIsEmpty040
     * @tc.desc Verify LinkedBlockingQueue from single-element Array iterable: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, arr);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0410
     * @tc.name testBlockingQueueIsEmpty041
     * @tc.desc Verify ArrayBlockingQueue from single-element Array iterable: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, arr);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0420
     * @tc.name testBlockingQueueIsEmpty042
     * @tc.desc Verify ArrayBlockingQueue from multi-element Array iterable: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, arr);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0430
     * @tc.name testBlockingQueueIsEmpty043
     * @tc.desc Verify LinkedBlockingQueue from single-element Set iterable: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(7);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, s);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0440
     * @tc.name testBlockingQueueIsEmpty044
     * @tc.desc Verify LinkedBlockingQueue from Array with valid count equal to capacity (exactly full): isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3, arr);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0450
     * @tc.name testBlockingQueueIsEmpty045
     * @tc.desc Verify ArrayBlockingQueue from Array with valid count greater than capacity (overflow dropped): isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2, arr);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0460
     * @tc.name testBlockingQueueIsEmpty046
     * @tc.desc Verify LinkedBlockingQueue push 1 then pop clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.pop();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0470
     * @tc.name testBlockingQueueIsEmpty047
     * @tc.desc Verify ArrayBlockingQueue push 1 then pop clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.pop();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0480
     * @tc.name testBlockingQueueIsEmpty048
     * @tc.desc Verify LinkedBlockingQueue push 1 then poll clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0490
     * @tc.name testBlockingQueueIsEmpty049
     * @tc.desc Verify ArrayBlockingQueue push 1 then poll clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0500
     * @tc.name testBlockingQueueIsEmpty050
     * @tc.desc Verify LinkedBlockingQueue push 3 then poll all clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.poll();
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0510
     * @tc.name testBlockingQueueIsEmpty051
     * @tc.desc Verify ArrayBlockingQueue push 3 then poll all clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.poll();
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0520
     * @tc.name testBlockingQueueIsEmpty052
     * @tc.desc Verify ArrayBlockingQueue push 3 then pop all clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      q.pop();
      q.pop();
      q.pop();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0530
     * @tc.name testBlockingQueueIsEmpty053
     * @tc.desc Verify LinkedBlockingQueue push 3 then poll only 2 (not cleared): isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.poll();
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0540
     * @tc.name testBlockingQueueIsEmpty054
     * @tc.desc Verify ArrayBlockingQueue push 3 then poll only 2 (not cleared): isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.poll();
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0550
     * @tc.name testBlockingQueueIsEmpty055
     * @tc.desc Verify LinkedBlockingQueue capacity=1 push then pop clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(99);
      q.pop();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0560
     * @tc.name testBlockingQueueIsEmpty056
     * @tc.desc Verify ArrayBlockingQueue capacity=1 push then poll clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(99);
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0570
     * @tc.name testBlockingQueueIsEmpty057
     * @tc.desc Verify LinkedBlockingQueue add then poll clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(5);
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0580
     * @tc.name testBlockingQueueIsEmpty058
     * @tc.desc Verify ArrayBlockingQueue add then pop clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(5);
      q.pop();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0590
     * @tc.name testBlockingQueueIsEmpty059
     * @tc.desc Verify LinkedBlockingQueue from Array then poll all clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, arr);
      q.poll();
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0600
     * @tc.name testBlockingQueueIsEmpty060
     * @tc.desc Verify ArrayBlockingQueue from Array then pop all clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, arr);
      q.pop();
      q.pop();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0610
     * @tc.name testBlockingQueueIsEmpty061
     * @tc.desc Verify LinkedBlockingQueue cleared then push again: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      q.push(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0620
     * @tc.name testBlockingQueueIsEmpty062
     * @tc.desc Verify ArrayBlockingQueue cleared then push again: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      q.push(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0630
     * @tc.name testBlockingQueueIsEmpty063
     * @tc.desc Verify LinkedBlockingQueue cleared then add again: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.pop();
      q.add(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0640
     * @tc.name testBlockingQueueIsEmpty064
     * @tc.desc Verify ArrayBlockingQueue cleared then add again: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.pop();
      q.add(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0650
     * @tc.name testBlockingQueueIsEmpty065
     * @tc.desc Verify LinkedBlockingQueue empty->push->poll->empty three-state isEmpty sequence final true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      expect(q.isEmpty()).assertTrue();
      q.push(1);
      expect(q.isEmpty()).assertFalse();
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0660
     * @tc.name testBlockingQueueIsEmpty066
     * @tc.desc Verify ArrayBlockingQueue empty->push->poll->empty three-state isEmpty sequence final true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.isEmpty()).assertTrue();
      q.push(1);
      expect(q.isEmpty()).assertFalse();
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0670
     * @tc.name testBlockingQueueIsEmpty067
     * @tc.desc Verify LinkedBlockingQueue multiple push/poll rounds back to empty: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(i);
        q.poll();
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0680
     * @tc.name testBlockingQueueIsEmpty068
     * @tc.desc Verify ArrayBlockingQueue multiple push/poll rounds back to empty: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(i);
        q.poll();
      }
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0690
     * @tc.name testBlockingQueueIsEmpty069
     * @tc.desc Verify LinkedBlockingQueue batch push then batch poll leaving 1: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      for (let i = 0; i < 4; i++) {
        q.poll();
      }
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0700
     * @tc.name testBlockingQueueIsEmpty070
     * @tc.desc Verify ArrayBlockingQueue batch push then batch poll leaving 1: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      for (let i = 0; i < 4; i++) {
        q.poll();
      }
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0710
     * @tc.name testBlockingQueueIsEmpty071
     * @tc.desc Verify LinkedBlockingQueue empty queue isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r: boolean = q.isEmpty();
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0720
     * @tc.name testBlockingQueueIsEmpty072
     * @tc.desc Verify LinkedBlockingQueue non-empty queue isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      let r: boolean = q.isEmpty();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0730
     * @tc.name testBlockingQueueIsEmpty073
     * @tc.desc Verify LinkedBlockingQueue empty queue isEmpty() value assertion equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      expect(q.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0740
     * @tc.name testBlockingQueueIsEmpty074
     * @tc.desc Verify ArrayBlockingQueue non-empty queue isEmpty() value assertion equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      expect(q.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0750
     * @tc.name testBlockingQueueIsEmpty075
     * @tc.desc Verify LinkedBlockingQueue isEmpty() does not modify size (size unchanged before/after)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.isEmpty();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0760
     * @tc.name testBlockingQueueIsEmpty076
     * @tc.desc Verify ArrayBlockingQueue isEmpty() does not modify size (size unchanged before/after)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.isEmpty();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0770
     * @tc.name testBlockingQueueIsEmpty077
     * @tc.desc Verify LinkedBlockingQueue isEmpty() has no side effect: getFirst still reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 42;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.isEmpty();
      let v: int | undefined = q.getFirst();
      expect(v).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0780
     * @tc.name testBlockingQueueIsEmpty078
     * @tc.desc Verify ArrayBlockingQueue isEmpty() has no side effect: getFirst still reads first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 42;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.isEmpty();
      let v: int | undefined = q.getFirst();
      expect(v).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0790
     * @tc.name testBlockingQueueIsEmpty079
     * @tc.desc Verify LinkedBlockingQueue isEmpty() consistent with size===0 when size is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      expect(q.isEmpty()).assertEqual(q.size === 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0800
     * @tc.name testBlockingQueueIsEmpty080
     * @tc.desc Verify ArrayBlockingQueue isEmpty() consistent with size===0 when size greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      expect(q.isEmpty()).assertEqual(q.size === 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0810
     * @tc.name testBlockingQueueIsEmpty081
     * @tc.desc Verify new empty Linked and Array queues isEmpty() results are consistent (both true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(lq.isEmpty()).assertEqual(aq.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0820
     * @tc.name testBlockingQueueIsEmpty082
     * @tc.desc Verify push 1 element then Linked and Array isEmpty() results are consistent (both false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      lq.push(1);
      aq.push(1);
      expect(lq.isEmpty()).assertEqual(aq.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0830
     * @tc.name testBlockingQueueIsEmpty083
     * @tc.desc Verify push then poll cleared then Linked and Array isEmpty() results are consistent (both true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      lq.push(1);
      aq.push(1);
      lq.poll();
      aq.poll();
      expect(lq.isEmpty()).assertEqual(aq.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0840
     * @tc.name testBlockingQueueIsEmpty084
     * @tc.desc Verify add then Linked and Array isEmpty() results are consistent (both false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      lq.add(1);
      aq.add(1);
      expect(lq.isEmpty()).assertEqual(aq.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0850
     * @tc.name testBlockingQueueIsEmpty085
     * @tc.desc Verify from same Array Linked and Array isEmpty() results are consistent (both false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, arr);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, arr);
      expect(lq.isEmpty()).assertEqual(aq.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0860
     * @tc.name testBlockingQueueIsEmpty086
     * @tc.desc Verify from empty Array Linked and Array isEmpty() results are consistent (both true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, arr);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, arr);
      expect(lq.isEmpty()).assertEqual(aq.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0870
     * @tc.name testBlockingQueueIsEmpty087
     * @tc.desc Verify multiple push/poll back to empty then Linked and Array isEmpty() results are consistent (both true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 3; i++) {
        lq.push(i);
        aq.push(i);
        lq.poll();
        aq.poll();
      }
      expect(lq.isEmpty()).assertEqual(aq.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0880
     * @tc.name testBlockingQueueIsEmpty088
     * @tc.desc Verify capacity=1 filled then Linked and Array isEmpty() results are consistent (both false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      lq.push(1);
      aq.push(1);
      expect(lq.isEmpty()).assertEqual(aq.isEmpty());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0890
     * @tc.name testBlockingQueueIsEmpty089
     * @tc.desc Verify ArrayBlockingQueue number generic empty queue isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0900
     * @tc.name testBlockingQueueIsEmpty090
     * @tc.desc Verify ArrayBlockingQueue number generic push float then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(1.5);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0910
     * @tc.name testBlockingQueueIsEmpty091
     * @tc.desc Verify LinkedBlockingQueue number generic empty queue isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0920
     * @tc.name testBlockingQueueIsEmpty092
     * @tc.desc Verify LinkedBlockingQueue number generic push float then isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(3.14);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0930
     * @tc.name testBlockingQueueIsEmpty093
     * @tc.desc Verify ArrayBlockingQueue number generic push float then poll clears: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(2.71);
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0940
     * @tc.name testBlockingQueueIsEmpty094
     * @tc.desc Verify LinkedBlockingQueue capacity=2 filled to size==capacity: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0950
     * @tc.name testBlockingQueueIsEmpty095
     * @tc.desc Verify ArrayBlockingQueue capacity=2 filled to size==capacity: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0960
     * @tc.name testBlockingQueueIsEmpty096
     * @tc.desc Verify ArrayBlockingQueue full queue add returns false then isEmpty() still returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(1);
      q.add(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0970
     * @tc.name testBlockingQueueIsEmpty097
     * @tc.desc Verify LinkedBlockingQueue full queue add returns false then isEmpty() still returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(1);
      q.add(2);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0980
     * @tc.name testBlockingQueueIsEmpty098
     * @tc.desc Verify LinkedBlockingQueue capacity=2 filled then poll 1: isEmpty() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      q.poll();
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_0990
     * @tc.name testBlockingQueueIsEmpty099
     * @tc.desc Verify ArrayBlockingQueue capacity=2 filled then poll all: isEmpty() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      q.poll();
      q.poll();
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ISEMPTY_1000
     * @tc.name testBlockingQueueIsEmpty100
     * @tc.desc Verify ArrayBlockingQueue full queue isEmpty() does not throw and returns false (no exception path)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIsEmpty100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(1);
      let r: boolean = q.isEmpty();
      expect(r).assertFalse();
    });
  });
}
