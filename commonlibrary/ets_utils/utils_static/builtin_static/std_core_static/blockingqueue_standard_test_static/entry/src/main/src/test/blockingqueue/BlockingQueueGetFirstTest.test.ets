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

class CustomObject010 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

class GetFirst020Obj {
  id: int = 0;

  constructor(i: int) {
    this.id = i;
  }
}

export default function BlockingQueueGetFirstTest(): void {
  describe('BlockingQueueGetFirstTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0100
     * @tc.name testBlockingQueueGetFirst001
     * @tc.desc Verify LinkedBlockingQueue getFirst returns pushed int value and size remains unchanged at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 42;
      const EXPECTED_VALUE: int = 42;
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0200
     * @tc.name testBlockingQueueGetFirst002
     * @tc.desc Verify LinkedBlockingQueue getFirst is idempotent: two consecutive calls return the same first value with size unchanged at 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_SIZE: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0300
     * @tc.name testBlockingQueueGetFirst003
     * @tc.desc Verify LinkedBlockingQueue getFirst returns new head after pop removes the previous head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      queue.pop();
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0400
     * @tc.name testBlockingQueueGetFirst004
     * @tc.desc Verify LinkedBlockingQueue getFirst returns undefined on empty int queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: int | undefined = queue.getFirst();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0500
     * @tc.name testBlockingQueueGetFirst005
     * @tc.desc Verify LinkedBlockingQueue getFirst returns undefined after all elements are popped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.pop();
      queue.pop();
      let result: int | undefined = queue.getFirst();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0600
     * @tc.name testBlockingQueueGetFirst006
     * @tc.desc Verify LinkedBlockingQueue getFirst returns "hello" on string queue with size unchanged at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "hello";
      const EXPECTED_VALUE: string = "hello";
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0700
     * @tc.name testBlockingQueueGetFirst007
     * @tc.desc Verify LinkedBlockingQueue getFirst returns empty string ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "";
      const EXPECTED_VALUE: string = "";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0800
     * @tc.name testBlockingQueueGetFirst008
     * @tc.desc Verify LinkedBlockingQueue getFirst returns undefined on empty string queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let result: string | undefined = queue.getFirst();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_0900
     * @tc.name testBlockingQueueGetFirst009
     * @tc.desc Verify LinkedBlockingQueue getFirst returns true on boolean queue after push(true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_FLAG: boolean = true;
      const PUSH_FLAG_2: boolean = false;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_FLAG);
      queue.push(PUSH_FLAG_2);
      expect(queue.getFirst()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1000
     * @tc.name testBlockingQueueGetFirst010
     * @tc.desc Verify LinkedBlockingQueue getFirst returns first custom object and is idempotent with size 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_VALUE: int = 1;
      const OBJECT_NAME: string = "first";
      const OBJECT_VALUE_2: int = 2;
      const OBJECT_NAME_2: string = "second";
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_SIZE: int = 2;
      let obj1: CustomObject010 = new CustomObject010(OBJECT_NAME, OBJECT_VALUE);
      let obj2: CustomObject010 = new CustomObject010(OBJECT_NAME_2, OBJECT_VALUE_2);
      let queue: containers.BlockingQueue<CustomObject010> = new containers.LinkedBlockingQueue<CustomObject010>();
      queue.push(obj1);
      queue.push(obj2);
      expect(queue.getFirst()).assertEqual(obj1);
      expect(queue.getFirst()).assertEqual(obj1);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1100
     * @tc.name testBlockingQueueGetFirst011
     * @tc.desc Verify LinkedBlockingQueue getFirst with capacity=5 always returns first pushed element 0 and size is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_SIZE: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 5; i++) {
        queue.push(i);
      }
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1200
     * @tc.name testBlockingQueueGetFirst012
     * @tc.desc Verify LinkedBlockingQueue getFirst with capacity=5 returns undefined on empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let result: int | undefined = queue.getFirst();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1300
     * @tc.name testBlockingQueueGetFirst013
     * @tc.desc Verify LinkedBlockingQueue getFirst is idempotent when initialized with array iterable [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: int = 10;
      const ARRAY_VALUE: int = 10;
      const ARRAY_VALUE_2: int = 20;
      const ARRAY_VALUE_3: int = 30;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1400
     * @tc.name testBlockingQueueGetFirst014
     * @tc.desc Verify LinkedBlockingQueue getFirst with capacity=3 and 10-element iterable returns first enqueued element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_VALUE: int = 0;
      let arr: int[] = [];
      for (let i: int = 0; i < 10; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1500
     * @tc.name testBlockingQueueGetFirst015
     * @tc.desc Verify ArrayBlockingQueue getFirst on int queue returns first pushed element and is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_VALUE: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1600
     * @tc.name testBlockingQueueGetFirst016
     * @tc.desc Verify ArrayBlockingQueue getFirst returns undefined on empty int queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      let result: int | undefined = queue.getFirst();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1700
     * @tc.name testBlockingQueueGetFirst017
     * @tc.desc Verify ArrayBlockingQueue getFirst on string queue returns "a" and is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_TEXT: string = "a";
      const PUSH_TEXT_2: string = "b";
      const EXPECTED_VALUE: string = "a";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1800
     * @tc.name testBlockingQueueGetFirst018
     * @tc.desc Verify ArrayBlockingQueue getFirst with Set iterable returns first enqueued element and is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ADD_VALUE: number = 10;
      const ADD_VALUE_2: number = 20;
      const ADD_VALUE_3: number = 30;
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: number = 10;
      let set: Set<number> = new Set<number>();
      set.add(ADD_VALUE);
      set.add(ADD_VALUE_2);
      set.add(ADD_VALUE_3);
      let queue: containers.BlockingQueue<number> = new containers.ArrayBlockingQueue<number>(CAPACITY, set);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_1900
     * @tc.name testBlockingQueueGetFirst019
     * @tc.desc Verify LinkedBlockingQueue boolean: push true then false, getFirst returns true (head unchanged)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_FLAG: boolean = true;
      const PUSH_FLAG_2: boolean = false;
      const EXPECTED_SIZE: int = 2;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_FLAG);
      queue.push(PUSH_FLAG_2);
      expect(queue.getFirst()).assertTrue();
      expect(queue.getFirst()).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2000
     * @tc.name testBlockingQueueGetFirst020
     * @tc.desc Verify LinkedBlockingQueue custom object: push 2 objects, getFirst returns first object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGetFirst020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_ID: int = 100;
      const OBJECT_ID_2: int = 200;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_SIZE: int = 2;
      let o1 = new GetFirst020Obj(OBJECT_ID);
      let o2 = new GetFirst020Obj(OBJECT_ID_2);
      let queue: containers.BlockingQueue<GetFirst020Obj> = new containers.LinkedBlockingQueue<GetFirst020Obj>();
      queue.push(o1);
      queue.push(o2);
      let result: GetFirst020Obj | undefined = queue.getFirst();
      expect(result).assertEqual(o1);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2100
     * @tc.name testBlockingQueueGetFirst021
     * @tc.desc Verify LinkedBlockingQueue initialized from 5-element array iterable: getFirst returns first element, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 10;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_SIZE: int = 5;
      let arr: int[] = [];
      for (let i = 0; i < 5; i++) {
        arr.push(i * PUSH_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2200
     * @tc.name testBlockingQueueGetFirst022
     * @tc.desc Verify LinkedBlockingQueue(3, 10-element iterable): getFirst returns element at index 0 from truncated set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_SIZE: int = 3;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2300
     * @tc.name testBlockingQueueGetFirst023
     * @tc.desc Verify LinkedBlockingQueue getFirst after pop: head shifts to next element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 100;
      const PUSH_VALUE_2: int = 200;
      const PUSH_VALUE_3: int = 300;
      const EXPECTED_VALUE: int = 100;
      const EXPECTED_VALUE_2: int = 200;
      const EXPECTED_VALUE_3: int = 300;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      queue.pop();
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_2);
      queue.pop();
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2400
     * @tc.name testBlockingQueueGetFirst024
     * @tc.desc Verify LinkedBlockingQueue(1): getFirst and getEnd return same element, size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: int = 99;
      const EXPECTED_VALUE: int = 99;
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(queue.getFirst()).assertEqual(queue.getEnd());
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2500
     * @tc.name testBlockingQueueGetFirst025
     * @tc.desc Verify LinkedBlockingQueue string with Unicode: getFirst returns correct Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "中文";
      const PUSH_TEXT_2: string = "😀🔥";
      const EXPECTED_VALUE: string = "中文";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      expect(queue.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2600
     * @tc.name testBlockingQueueGetFirst026
     * @tc.desc Verify ArrayBlockingQueue pre-filled with 5-element Set iterable: getFirst is head, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ADD_VALUE: int = 100;
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_SIZE: int = 5;
      let s: Set<int> = new Set<int>();
      for (let i = 0; i < 5; i++) {
        s.add(i * ADD_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, s);
      let first: int | undefined = queue.getFirst();
      expect(first).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2700
     * @tc.name testBlockingQueueGetFirst027
     * @tc.desc Verify LinkedBlockingQueue getFirst returns element 7 on ArrayBlockingQueue with no-arg arity call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 7;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2800
     * @tc.name testBlockingQueueGetFirst028
     * @tc.desc Verify LinkedBlockingQueue getFirst reads marker value -1 from head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = -1;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_2900
     * @tc.name testBlockingQueueGetFirst029
     * @tc.desc Verify LinkedBlockingQueue getFirst reads scientific literal 1e3 as 1000 from head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(1e3);
      let result: number | undefined = q.getFirst();
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3000
     * @tc.name testBlockingQueueGetFirst030
     * @tc.desc Verify LinkedBlockingQueue getFirst reads math expression result 2147483646+1 as 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(2147483646 + 1);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3100
     * @tc.name testBlockingQueueGetFirst031
     * @tc.desc Verify LinkedBlockingQueue getFirst reads number element Number.MAX_SAFE_INTEGER from head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER);
      let result: number | undefined = q.getFirst();
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3200
     * @tc.name testBlockingQueueGetFirst032
     * @tc.desc Verify LinkedBlockingQueue getFirst reads number element Number.MIN_SAFE_INTEGER from head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MIN_SAFE_INTEGER);
      let result: number | undefined = q.getFirst();
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3300
     * @tc.name testBlockingQueueGetFirst033
     * @tc.desc Verify LinkedBlockingQueue getFirst reads number element Number.MAX_SAFE_INTEGER+1 from head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER + 1);
      let result: number | undefined = q.getFirst();
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3400
     * @tc.name testBlockingQueueGetFirst034
     * @tc.desc Verify LinkedBlockingQueue getFirst returns earliest enqueued element in three-element queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 31;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.push(32);
      q.push(33);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3500
     * @tc.name testBlockingQueueGetFirst035
     * @tc.desc Verify ArrayBlockingQueue getFirst returns earliest enqueued element across multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 41;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.push(42);
      q.push(43);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3600
     * @tc.name testBlockingQueueGetFirst036
     * @tc.desc Verify LinkedBlockingQueue getFirst returns new head 52 after pop removes previous head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 52;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(51);
      q.push(TEST_VALUE);
      q.pop();
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3700
     * @tc.name testBlockingQueueGetFirst037
     * @tc.desc Verify LinkedBlockingQueue getFirst returns new head 62 after poll removes previous head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 62;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(61);
      q.push(TEST_VALUE);
      q.poll();
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3800
     * @tc.name testBlockingQueueGetFirst038
     * @tc.desc Verify LinkedBlockingQueue getFirst returns earliest element when queue is filled to capacity 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 71;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(TEST_VALUE);
      q.push(72);
      q.push(73);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_3900
     * @tc.name testBlockingQueueGetFirst039
     * @tc.desc Verify LinkedBlockingQueue getFirst returns earliest element after add enqueues elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 101;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(TEST_VALUE);
      q.add(102);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4000
     * @tc.name testBlockingQueueGetFirst040
     * @tc.desc Verify LinkedBlockingQueue getFirst returns earliest element 0 in a 100-element queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(200);
      for (let i = 0; i < 100; i++) {
        q.push(i);
      }
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4100
     * @tc.name testBlockingQueueGetFirst041
     * @tc.desc Verify LinkedBlockingQueue getFirst returns head negative value -5 in mixed queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = -5;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.push(3);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4200
     * @tc.name testBlockingQueueGetFirst042
     * @tc.desc Verify LinkedBlockingQueue getFirst returns head int max value in boundary-value queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(BOUNDARY_VALUE);
      q.push(-2147483648);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4300
     * @tc.name testBlockingQueueGetFirst043
     * @tc.desc Verify LinkedBlockingQueue getFirst second call after first call still returns 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 13;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.getFirst();
      let second: int | undefined = q.getFirst();
      expect(second).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4400
     * @tc.name testBlockingQueueGetFirst044
     * @tc.desc Verify LinkedBlockingQueue getFirst third consecutive call still returns 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 14;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.getFirst();
      q.getFirst();
      let third: int | undefined = q.getFirst();
      expect(third).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4500
     * @tc.name testBlockingQueueGetFirst045
     * @tc.desc Verify ArrayBlockingQueue getFirst stays stable on consecutive calls returning 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 23;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.push(24);
      q.getFirst();
      let second: int | undefined = q.getFirst();
      expect(second).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4600
     * @tc.name testBlockingQueueGetFirst046
     * @tc.desc Verify LinkedBlockingQueue getFirst head stays 25 after a getFirst call followed by push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 25;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.getFirst();
      q.push(26);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4700
     * @tc.name testBlockingQueueGetFirst047
     * @tc.desc Verify LinkedBlockingQueue getFirst return value equals subsequent pop return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(55);
      let peeked: int | undefined = q.getFirst();
      let popped: int = q.pop();
      expect(peeked).assertEqual(popped);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4800
     * @tc.name testBlockingQueueGetFirst048
     * @tc.desc Verify LinkedBlockingQueue getFirst return value equals subsequent poll return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(56);
      let peeked: int | undefined = q.getFirst();
      let polled: int | undefined = q.poll();
      expect(peeked).assertEqual(polled);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_4900
     * @tc.name testBlockingQueueGetFirst049
     * @tc.desc Verify LinkedBlockingQueue getFirst keeps size unchanged at 2 (does not remove element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(TEST_VALUE);
      q.getFirst();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5000
     * @tc.name testBlockingQueueGetFirst050
     * @tc.desc Verify LinkedBlockingQueue getFirst before/after size comparison stays consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(3);
      q.push(4);
      q.push(5);
      let before: int = q.size;
      q.getFirst();
      expect(q.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5100
     * @tc.name testBlockingQueueGetFirst051
     * @tc.desc Verify LinkedBlockingQueue getFirst keeps remainingCapacity unchanged at 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.getFirst();
      expect(q.remainingCapacity()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5200
     * @tc.name testBlockingQueueGetFirst052
     * @tc.desc Verify ArrayBlockingQueue getFirst keeps capacity unchanged at 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.getFirst();
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5300
     * @tc.name testBlockingQueueGetFirst053
     * @tc.desc Verify LinkedBlockingQueue element survives getFirst and can still be popped as 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 77;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.getFirst();
      let result: int = q.pop();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5400
     * @tc.name testBlockingQueueGetFirst054
     * @tc.desc Verify LinkedBlockingQueue getFirst return value type is int via typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(33);
      let result: int | undefined = q.getFirst();
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5500
     * @tc.name testBlockingQueueGetFirst055
     * @tc.desc Verify LinkedBlockingQueue getFirst return value type is string via typeof for string generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.push("x");
      let result: string | undefined = q.getFirst();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5600
     * @tc.name testBlockingQueueGetFirst056
     * @tc.desc Verify LinkedBlockingQueue getEnd still returns original tail 92 after getFirst (invariance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 92;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(91);
      q.push(TEST_VALUE);
      q.getFirst();
      let end: int | undefined = q.getEnd();
      expect(end).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5700
     * @tc.name testBlockingQueueGetFirst057
     * @tc.desc Verify LinkedBlockingQueue size grows to 2 when pushing a new element after getFirst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.getFirst();
      q.push(TEST_VALUE);
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5800
     * @tc.name testBlockingQueueGetFirst058
     * @tc.desc Verify ArrayBlockingQueue getFirst returns undefined on empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let result: int | undefined = q.getFirst();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_5900
     * @tc.name testBlockingQueueGetFirst059
     * @tc.desc Verify LinkedBlockingQueue(1) getFirst returns undefined on empty capacity-1 queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let result: int | undefined = q.getFirst();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6000
     * @tc.name testBlockingQueueGetFirst060
     * @tc.desc Verify LinkedBlockingQueue getFirst returns undefined on consecutive calls over empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.getFirst();
      let second: int | undefined = q.getFirst();
      expect(second).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6100
     * @tc.name testBlockingQueueGetFirst061
     * @tc.desc Verify LinkedBlockingQueue getFirst on empty queue does not throw and keeps size at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.getFirst();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6200
     * @tc.name testBlockingQueueGetFirst062
     * @tc.desc Verify LinkedBlockingQueue getFirst returns undefined after single push then pop empties queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.pop();
      let result: int | undefined = q.getFirst();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6300
     * @tc.name testBlockingQueueGetFirst063
     * @tc.desc Verify LinkedBlockingQueue getFirst returns undefined after single push then poll empties queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      let result: int | undefined = q.getFirst();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6400
     * @tc.name testBlockingQueueGetFirst064
     * @tc.desc Verify LinkedBlockingQueue getFirst does not affect FIFO pop order, first pop returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0);
      q.push(1);
      q.push(2);
      q.getFirst();
      let first: int = q.pop();
      expect(first).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6500
     * @tc.name testBlockingQueueGetFirst065
     * @tc.desc Verify LinkedBlockingQueue getFirst does not affect FIFO pop order, second pop returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0);
      q.push(1);
      q.push(2);
      q.getFirst();
      q.pop();
      let second: int = q.pop();
      expect(second).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6600
     * @tc.name testBlockingQueueGetFirst066
     * @tc.desc Verify LinkedBlockingQueue head stays first-enqueued 100 after four pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 100;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.push(200);
      q.push(300);
      q.push(400);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6700
     * @tc.name testBlockingQueueGetFirst067
     * @tc.desc Verify LinkedBlockingQueue(2) getFirst returns earliest element 1 after add overflow attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6800
     * @tc.name testBlockingQueueGetFirst068
     * @tc.desc Verify LinkedBlockingQueue getFirst value saved to variable keeps original 64 after a later push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 64;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let saved: int | undefined = q.getFirst();
      q.push(65);
      expect(saved).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_6900
     * @tc.name testBlockingQueueGetFirst069
     * @tc.desc Verify LinkedBlockingQueue head stays 70 after modifying an external copy of getFirst result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 70;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let external: int = q.getFirst()!;
      external = external + 1;
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7000
     * @tc.name testBlockingQueueGetFirst070
     * @tc.desc Verify ArrayBlockingQueue(200, Set) getFirst returns earliest enqueued element 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 11;
      let set: Set<number> = new Set<number>();
      set.add(TEST_VALUE);
      set.add(22);
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(200, set);
      let result: number | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7100
     * @tc.name testBlockingQueueGetFirst071
     * @tc.desc Verify LinkedBlockingQueue number getFirst returns earliest float 1.5 in multi-element queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(1.5);
      q.push(2.5);
      let result: number | undefined = q.getFirst();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7200
     * @tc.name testBlockingQueueGetFirst072
     * @tc.desc Verify LinkedBlockingQueue getFirst returns head 0 in queue mixing zero and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0);
      q.push(-7);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7300
     * @tc.name testBlockingQueueGetFirst073
     * @tc.desc Verify LinkedBlockingQueue getFirst returns int min value when it is at head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = -2147483648;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(BOUNDARY_VALUE);
      q.push(2147483647);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7400
     * @tc.name testBlockingQueueGetFirst074
     * @tc.desc Verify LinkedBlockingQueue(2) getFirst returns earliest element 44 in exactly-full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 44;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(TEST_VALUE);
      q.push(45);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7500
     * @tc.name testBlockingQueueGetFirst075
     * @tc.desc Verify LinkedBlockingQueue getFirst returns 2 after repeated push and pop sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.pop();
      q.push(TEST_VALUE);
      q.push(3);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7600
     * @tc.name testBlockingQueueGetFirst076
     * @tc.desc Verify LinkedBlockingQueue getFirst returns head 10 after loop fill of values 10..39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(50);
      for (let i = 10; i < 40; i++) {
        q.push(i);
      }
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7700
     * @tc.name testBlockingQueueGetFirst077
     * @tc.desc Verify LinkedBlockingQueue getFirst returns 5 after loop fill 0..9 then popping first five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(50);
      for (let i = 0; i < 10; i++) {
        q.push(i);
      }
      for (let j = 0; j < 5; j++) {
        q.pop();
      }
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7800
     * @tc.name testBlockingQueueGetFirst078
     * @tc.desc Verify ArrayBlockingQueue getFirst returns head 100 after loop fill of values 100..129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(50);
      for (let i = 100; i < 130; i++) {
        q.push(i);
      }
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_7900
     * @tc.name testBlockingQueueGetFirst079
     * @tc.desc Verify LinkedBlockingQueue pop still returns 11 after two getFirst calls (no side effect)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 11;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.push(12);
      q.push(13);
      q.getFirst();
      q.getFirst();
      let popped: int = q.pop();
      expect(popped).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8000
     * @tc.name testBlockingQueueGetFirst080
     * @tc.desc Verify LinkedBlockingQueue getFirst returns new head 202 after popping previous head 201
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE_1: int = 201;
      const TEST_VALUE_2: int = 202;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE_1);
      q.push(TEST_VALUE_2);
      let before: int | undefined = q.getFirst();
      q.pop();
      let after: int | undefined = q.getFirst();
      expect(before).assertEqual(TEST_VALUE_1);
      expect(after).assertEqual(TEST_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8100
     * @tc.name testBlockingQueueGetFirst081
     * @tc.desc Verify LinkedBlockingQueue(3) head stays 1 after getFirst then add filling the queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.getFirst();
      q.add(2);
      q.add(3);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8200
     * @tc.name testBlockingQueueGetFirst082
     * @tc.desc Verify LinkedBlockingQueue number getFirst returns earliest float 1.1 in filled capacity-3 queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(3);
      q.push(1.1);
      q.push(2.2);
      q.push(3.3);
      let result: number | undefined = q.getFirst();
      expect(result).assertEqual(1.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8300
     * @tc.name testBlockingQueueGetFirst083
     * @tc.desc Verify LinkedBlockingQueue getFirst stays at int max head on consecutive calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(BOUNDARY_VALUE);
      q.push(1);
      q.getFirst();
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8400
     * @tc.name testBlockingQueueGetFirst084
     * @tc.desc Verify LinkedBlockingQueue size stays 2 after reading int min head twice with getFirst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(-2147483648);
      q.push(1);
      q.getFirst();
      q.getFirst();
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8500
     * @tc.name testBlockingQueueGetFirst085
     * @tc.desc Verify LinkedBlockingQueue getFirst returns consistent value on consecutive calls with 0x10 head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0x10);
      let first: int | undefined = q.getFirst();
      let second: int | undefined = q.getFirst();
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8600
     * @tc.name testBlockingQueueGetFirst086
     * @tc.desc Verify LinkedBlockingQueue getFirst returns decimal 15 for binary literal head 0b1111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0b1111);
      q.push(2);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8700
     * @tc.name testBlockingQueueGetFirst087
     * @tc.desc Verify LinkedBlockingQueue getFirst returns decimal 16 for octal literal head 0o20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0o20);
      q.push(2);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8800
     * @tc.name testBlockingQueueGetFirst088
     * @tc.desc Verify LinkedBlockingQueue number getFirst returns 200 for scientific literal head 2e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(2e2);
      q.push(3);
      let result: number | undefined = q.getFirst();
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_8900
     * @tc.name testBlockingQueueGetFirst089
     * @tc.desc Verify LinkedBlockingQueue getFirst returns 100 for math expression head 50*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(50 * 2);
      q.push(3);
      let result: int | undefined = q.getFirst();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GETFIRST_9000
     * @tc.name testBlockingQueueGetFirst090
     * @tc.desc Verify LinkedBlockingQueue getFirst peeked value 301 stays valid through a later pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGetFirst090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE_1: int = 301;
      const TEST_VALUE_2: int = 302;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE_1);
      q.push(TEST_VALUE_2);
      let peeked: int | undefined = q.getFirst();
      q.pop();
      let nextFirst: int | undefined = q.getFirst();
      expect(peeked).assertEqual(TEST_VALUE_1);
      expect(nextFirst).assertEqual(TEST_VALUE_2);
    });
  });
}
