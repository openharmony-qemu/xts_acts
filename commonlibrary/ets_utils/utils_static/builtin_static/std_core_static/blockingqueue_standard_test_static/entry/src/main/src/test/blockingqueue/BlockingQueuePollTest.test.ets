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

class Poll022Obj {
  name: string = "";

  constructor(n: string) {
    this.name = n;
  }
}

export default function BlockingQueuePollTest(): void {
  describe('BlockingQueuePollTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0010
     * @tc.name testBlockingQueuePoll001
     * @tc.desc Verify LinkedBlockingQueue default constructor: push 1 int then poll returns pushed value and size becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 42;
      const EXPECTED_VALUE: int = 42;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0020
     * @tc.name testBlockingQueuePoll002
     * @tc.desc Verify LinkedBlockingQueue default constructor: push 3 ints then poll 3 times verifies FIFO order and isEmpty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      const EXPECTED_VALUE_3: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0030
     * @tc.name testBlockingQueuePoll003
     * @tc.desc Verify LinkedBlockingQueue default constructor: push 10 then poll 5, verify size=5 and remaining elements at correct positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_VALUE: int = 5;
      const EXPECTED_VALUE_2: int = 6;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = 0; i < 10; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 5; i++) {
        expect(queue.poll()).assertEqual(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0040
     * @tc.name testBlockingQueuePoll004
     * @tc.desc Verify LinkedBlockingQueue default constructor: empty queue poll returns undefined and size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(undefined);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0050
     * @tc.name testBlockingQueuePoll005
     * @tc.desc Verify LinkedBlockingQueue default constructor: push then pop all, subsequent poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 100;
      const EXPECTED_VALUE: int = 100;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      let val: int | undefined = queue.poll();
      expect(val).assertEqual(EXPECTED_VALUE);
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0060
     * @tc.name testBlockingQueuePoll006
     * @tc.desc Verify LinkedBlockingQueue default constructor: push string "a" then poll returns "a"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "a";
      const EXPECTED_VALUE: string = "a";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      let result: string | undefined = queue.poll();
      expect(result).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0070
     * @tc.name testBlockingQueuePoll007
     * @tc.desc Verify LinkedBlockingQueue default constructor: push empty string then poll returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "";
      const EXPECTED_VALUE: string = "";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      let result: string | undefined = queue.poll();
      expect(result).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0080
     * @tc.name testBlockingQueuePoll008
     * @tc.desc Verify LinkedBlockingQueue default constructor: empty string queue poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let result: string | undefined = queue.poll();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0090
     * @tc.name testBlockingQueuePoll009
     * @tc.desc Verify LinkedBlockingQueue default constructor: push true then false on boolean queue, poll 2 verifies FIFO
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_FLAG: boolean = true;
      const PUSH_FLAG_2: boolean = false;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_FLAG);
      queue.push(PUSH_FLAG_2);
      expect(queue.poll()).assertTrue();
      expect(queue.poll()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0100
     * @tc.name testBlockingQueuePoll010
     * @tc.desc Verify LinkedBlockingQueue default constructor: push CustomObject then poll returns same object and size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_VALUE: int = 99;
      const OBJECT_NAME: string = "testObj";
      const EXPECTED_OBJECT_NAME: string = "testObj";
      const EXPECTED_OBJECT_VALUE: int = 99;
      const EXPECTED_SIZE: int = 0;
      let obj: CustomObject010 = new CustomObject010(OBJECT_NAME, OBJECT_VALUE);
      let queue: containers.BlockingQueue<CustomObject010> = new containers.LinkedBlockingQueue<CustomObject010>();
      queue.push(obj);
      let result: CustomObject010 | undefined = queue.poll();
      expect(result).assertEqual(obj);
      if (result !== undefined) {
        expect(result.name).assertEqual(EXPECTED_OBJECT_NAME);
        expect(result.value).assertEqual(EXPECTED_OBJECT_VALUE);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0110
     * @tc.name testBlockingQueuePoll011
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: fill 5 then poll 3, verify size=2 and remainingCapacity=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_REMAINING_CAPACITY: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 3; i++) {
        queue.poll();
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0120
     * @tc.name testBlockingQueuePoll012
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: fill 5 then poll all 5, verify isEmpty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 5; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 5; i++) {
        queue.poll();
      }
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0130
     * @tc.name testBlockingQueuePoll013
     * @tc.desc Verify LinkedBlockingQueue with capacity=5: empty queue poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0140
     * @tc.name testBlockingQueuePoll014
     * @tc.desc Verify LinkedBlockingQueue initialized with array iterable: poll 4 verifies FIFO equals iterator order, then poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const EXPECTED_VALUE: int = 1;
      let arr: int[] = [];
      for (let i = 0; i < 4; i++) {
        arr.push(i + PUSH_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      for (let i = 0; i < 4; i++) {
        expect(queue.poll()).assertEqual(i + EXPECTED_VALUE);
      }
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0150
     * @tc.name testBlockingQueuePoll015
     * @tc.desc Verify LinkedBlockingQueue with capacity=3 and iterable of 10 elements: only 3 pollable, 4th poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_SIZE: int = 3;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      for (let i = 0; i < 3; i++) {
        expect(queue.poll()).assertEqual(i);
      }
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0160
     * @tc.name testBlockingQueuePoll016
     * @tc.desc Verify ArrayBlockingQueue with capacity=5: push 3 then poll 2 verifies correct values and size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const PUSH_VALUE_3: int = 30;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_2: int = 20;
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0170
     * @tc.name testBlockingQueuePoll017
     * @tc.desc Verify ArrayBlockingQueue with capacity=5: empty queue poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      let result: int | undefined = queue.poll();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0180
     * @tc.name testBlockingQueuePoll018
     * @tc.desc Verify ArrayBlockingQueue<string> with capacity=5: push "x","y" then poll 2 verifies "x" then "y"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_TEXT: string = "x";
      const PUSH_TEXT_2: string = "y";
      const EXPECTED_VALUE: string = "x";
      const EXPECTED_VALUE_2: string = "y";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0190
     * @tc.name testBlockingQueuePoll019
     * @tc.desc Verify ArrayBlockingQueue initialized with Set(5) iterable: poll 5 verifies FIFO, 6th poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: number = 10;
      const ADD_VALUE_2: number = 20;
      const ADD_VALUE_3: number = 30;
      const ADD_VALUE_4: number = 40;
      const ADD_VALUE_5: number = 50;
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: number = 10;
      const EXPECTED_VALUE_2: number = 20;
      const EXPECTED_VALUE_3: number = 30;
      const EXPECTED_VALUE_4: number = 40;
      const EXPECTED_VALUE_5: number = 50;
      let set: Set<number> = new Set<number>();
      set.add(ADD_VALUE);
      set.add(ADD_VALUE_2);
      set.add(ADD_VALUE_3);
      set.add(ADD_VALUE_4);
      set.add(ADD_VALUE_5);
      let queue: containers.BlockingQueue<number> = new containers.ArrayBlockingQueue<number>(CAPACITY, set);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_4);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_5);
      let result: number | undefined = queue.poll();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0200
     * @tc.name testBlockingQueuePoll020
     * @tc.desc Verify ArrayBlockingQueue initialized with Array.values() iterable: poll all verifies insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i);
      }
      let iter: IterableIterator<int> = arr.values();
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, iter);
      for (let i = 0; i < 10; i++) {
        expect(queue.poll()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0210
     * @tc.name testBlockingQueuePoll021
     * @tc.desc Verify LinkedBlockingQueue boolean: push true,false then poll both, 3rd poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_FLAG: boolean = true;
      const PUSH_FLAG_2: boolean = false;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_FLAG);
      queue.push(PUSH_FLAG_2);
      expect(queue.poll()).assertTrue();
      expect(queue.poll()).assertFalse();
      let result: boolean | undefined = queue.poll();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0220
     * @tc.name testBlockingQueuePoll022
     * @tc.desc Verify LinkedBlockingQueue custom object: push 2 objects, poll returns first, second, then undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_NAME: string = "first";
      const OBJECT_NAME_2: string = "second";
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      let o1 = new Poll022Obj(OBJECT_NAME);
      let o2 = new Poll022Obj(OBJECT_NAME_2);
      let queue: containers.BlockingQueue<Poll022Obj> = new containers.LinkedBlockingQueue<Poll022Obj>();
      queue.push(o1);
      queue.push(o2);
      let r1: Poll022Obj | undefined = queue.poll();
      expect(r1).assertEqual(o1);
      let r2: Poll022Obj | undefined = queue.poll();
      expect(r2).assertEqual(o2);
      expect(queue.poll()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0230
     * @tc.name testBlockingQueuePoll023
     * @tc.desc Verify LinkedBlockingQueue initialized from array iterable: poll all elements, then poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 10;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_VALUE_2: int = 10;
      const EXPECTED_VALUE_3: int = 20;
      const EXPECTED_VALUE_4: int = 30;
      const EXPECTED_VALUE_5: int = 40;
      let arr: int[] = [];
      for (let i = 0; i < 5; i++) {
        arr.push(i * PUSH_VALUE);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_4);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_5);
      expect(queue.poll()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0240
     * @tc.name testBlockingQueuePoll024
     * @tc.desc Verify LinkedBlockingQueue(3, 10-element iterable): poll 3 truncated elements, then undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_VALUE_2: int = 1;
      const EXPECTED_VALUE_3: int = 2;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.poll()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0250
     * @tc.name testBlockingQueuePoll025
     * @tc.desc Verify poll after mixed push/add: successful and failed adds, poll retrieves correct elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const ADD_VALUE: int = 2;
      const ADD_VALUE_2: int = 3;
      const ADD_VALUE_3: int = 4;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      const EXPECTED_VALUE_3: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.add(ADD_VALUE);
      expect(queue.add(ADD_VALUE_2)).assertTrue();
      expect(queue.add(ADD_VALUE_3)).assertFalse();
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.poll()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0260
     * @tc.name testBlockingQueuePoll026
     * @tc.desc Verify poll on string queue with Unicode and emoji content preserves values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const PUSH_TEXT: string = "中文";
      const PUSH_TEXT_2: string = "😀";
      const PUSH_TEXT_3: string = "テスト";
      const EXPECTED_VALUE: string = "中文";
      const EXPECTED_VALUE_2: string = "😀";
      const EXPECTED_VALUE_3: string = "テスト";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      queue.push(PUSH_TEXT_3);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0270
     * @tc.name testBlockingQueuePoll027
     * @tc.desc Verify poll on queue with single element: returns element then undefined on second poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: int = 42;
      const EXPECTED_VALUE: int = 42;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(undefined);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0280
     * @tc.name testBlockingQueuePoll028
     * @tc.desc Verify poll after consuming all and re-pushing: poll returns new element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const PUSH_VALUE_4: int = 4;
      const EXPECTED_VALUE_3: int = 3;
      const EXPECTED_VALUE_4: int = 4;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.poll()).assertEqual(undefined);
      queue.push(PUSH_VALUE_3);
      queue.push(PUSH_VALUE_4);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.poll()).assertEqual(EXPECTED_VALUE_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0290
     * @tc.name testBlockingQueuePoll029
     * @tc.desc Verify ArrayBlockingQueue(1): push then poll repeatedly to verify reusability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const PUSH_VALUE: int = 10;
      const EXPECTED_VALUE: int = 10;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 5; i++) {
        queue.push(i * PUSH_VALUE);
        expect(queue.poll()).assertEqual(i * EXPECTED_VALUE);
        expect(queue.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0300
     * @tc.name testBlockingQueuePoll030
     * @tc.desc Verify ArrayBlockingQueue boolean: push false, poll returns false (not confused with undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePoll030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const PUSH_FLAG: boolean = false;
      const PUSH_FLAG_2: boolean = true;
      let queue: containers.BlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(CAPACITY);
      queue.push(PUSH_FLAG);
      queue.push(PUSH_FLAG_2);
      let r1: boolean | undefined = queue.poll();
      expect(r1).assertFalse();
      let r2: boolean | undefined = queue.poll();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0310
     * @tc.name testBlockingQueuePoll031
     * @tc.desc Verify poll restores int value -1 from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = -1;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0320
     * @tc.name testBlockingQueuePoll032
     * @tc.desc Verify poll restores scientific notation literal 1e3 equal to 1000 from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(1e3);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0330
     * @tc.name testBlockingQueuePoll033
     * @tc.desc Verify poll restores scientific notation literal 2e9 equal to 2000000000 from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(2e9);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(2000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0340
     * @tc.name testBlockingQueuePoll034
     * @tc.desc Verify poll restores math expression 1000 + 1 evaluating to 1001 from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1000 + 1);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(1001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0350
     * @tc.name testBlockingQueuePoll035
     * @tc.desc Verify poll restores math expression 2147483647 - 1 evaluating to 2147483646 from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(2147483647 - 1);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0360
     * @tc.name testBlockingQueuePoll036
     * @tc.desc Verify poll restores positive float number element 3.14 from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(3.14);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0370
     * @tc.name testBlockingQueuePoll037
     * @tc.desc Verify poll restores negative float number element -3.14 from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(-3.14);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(-3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0380
     * @tc.name testBlockingQueuePoll038
     * @tc.desc Verify poll restores Number.MAX_SAFE_INTEGER element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0390
     * @tc.name testBlockingQueuePoll039
     * @tc.desc Verify poll restores Number.MIN_SAFE_INTEGER element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MIN_SAFE_INTEGER);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(-9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0400
     * @tc.name testBlockingQueuePoll040
     * @tc.desc Verify poll restores Number.MAX_SAFE_INTEGER + 1 element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER + 1);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0410
     * @tc.name testBlockingQueuePoll041
     * @tc.desc Verify poll restores Number.MAX_SAFE_INTEGER - 1 element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER - 1);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(9007199254740990);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0420
     * @tc.name testBlockingQueuePoll042
     * @tc.desc Verify poll restores Number.EPSILON element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.EPSILON);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0430
     * @tc.name testBlockingQueuePoll043
     * @tc.desc Verify poll restores Infinity element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.POSITIVE_INFINITY);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0440
     * @tc.name testBlockingQueuePoll044
     * @tc.desc Verify poll restores -Infinity element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.NEGATIVE_INFINITY);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0450
     * @tc.name testBlockingQueuePoll045
     * @tc.desc Verify poll restores negative zero element -0 equal to 0 from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(-0);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0460
     * @tc.name testBlockingQueuePoll046
     * @tc.desc Verify poll restores Number.MAX_VALUE element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_VALUE);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0470
     * @tc.name testBlockingQueuePoll047
     * @tc.desc Verify poll restores Number.MIN_VALUE element from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MIN_VALUE);
      let result: number | undefined = q.poll();
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0480
     * @tc.name testBlockingQueuePoll048
     * @tc.desc Verify poll restores string element containing spaces from LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.push("a b c");
      let result: string | undefined = q.poll();
      expect(result).assertEqual("a b c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0490
     * @tc.name testBlockingQueuePoll049
     * @tc.desc Verify poll restores int max value 2147483647 from ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(BOUNDARY_VALUE);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0500
     * @tc.name testBlockingQueuePoll050
     * @tc.desc Verify poll restores hexadecimal literal 0x100 equal to 256 from ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(0x100);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0510
     * @tc.name testBlockingQueuePoll051
     * @tc.desc Verify poll restores binary literal 0b1111 equal to 15 from ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(0b1111);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0520
     * @tc.name testBlockingQueuePoll052
     * @tc.desc Verify poll restores unique element from capacity-1 LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 42;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(TEST_VALUE);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0530
     * @tc.name testBlockingQueuePoll053
     * @tc.desc Verify poll restores unique element from capacity-1 ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 42;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(TEST_VALUE);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0540
     * @tc.name testBlockingQueuePoll054
     * @tc.desc Verify poll restores head element from capacity-2 LinkedBlockingQueue with two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 8;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(TEST_VALUE);
      q.push(9);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0550
     * @tc.name testBlockingQueuePoll055
     * @tc.desc Verify poll restores head element from large capacity 2147483647 LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 123;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2147483647);
      q.push(TEST_VALUE);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0560
     * @tc.name testBlockingQueuePoll056
     * @tc.desc Verify poll restores head element from capacity-100 LinkedBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 77;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(100);
      q.push(TEST_VALUE);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0570
     * @tc.name testBlockingQueuePoll057
     * @tc.desc Verify poll on empty ArrayBlockingQueue returns undefined without blocking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let result: int | undefined = q.poll();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0580
     * @tc.name testBlockingQueuePoll058
     * @tc.desc Verify poll on capacity-1 empty LinkedBlockingQueue returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let result: int | undefined = q.poll();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0590
     * @tc.name testBlockingQueuePoll059
     * @tc.desc Verify poll on single-element ArrayBlockingQueue after poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(5);
      q.poll();
      let result: int | undefined = q.poll();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0600
     * @tc.name testBlockingQueuePoll060
     * @tc.desc Verify poll on full LinkedBlockingQueue where size equals capacity restores head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0610
     * @tc.name testBlockingQueuePoll061
     * @tc.desc Verify poll on full ArrayBlockingQueue restores head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0620
     * @tc.name testBlockingQueuePoll062
     * @tc.desc Verify add overflow returns false on full LinkedBlockingQueue then poll still returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 10;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(TEST_VALUE);
      q.push(20);
      let added: boolean = q.add(30);
      expect(added).assertFalse();
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0630
     * @tc.name testBlockingQueuePoll063
     * @tc.desc Verify full LinkedBlockingQueue add overflow element is discarded and poll does not return it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 20;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(10);
      q.push(TEST_VALUE);
      q.add(30);
      q.poll();
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0640
     * @tc.name testBlockingQueuePoll064
     * @tc.desc Verify capacity-1 full LinkedBlockingQueue after add overflow poll restores unique element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 88;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(TEST_VALUE);
      q.add(99);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0650
     * @tc.name testBlockingQueuePoll065
     * @tc.desc Verify poll on full LinkedBlockingQueue restores int max head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(BOUNDARY_VALUE);
      q.push(2147483646);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0660
     * @tc.name testBlockingQueuePoll066
     * @tc.desc Verify poll on full LinkedBlockingQueue restores int min head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = -2147483648;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(BOUNDARY_VALUE);
      q.push(-2147483647);
      let result: int | undefined = q.poll();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0670
     * @tc.name testBlockingQueuePoll067
     * @tc.desc Verify add overflow returns false on full ArrayBlockingQueue then poll restores head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 101;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.push(TEST_VALUE);
      q.push(202);
      let added: boolean = q.add(303);
      expect(added).assertFalse();
      let result: int | undefined = q.poll();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0680
     * @tc.name testBlockingQueuePoll068
     * @tc.desc Verify full LinkedBlockingQueue add overflow then drained poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(70);
      q.push(80);
      q.add(90);
      q.poll();
      q.poll();
      let result: int | undefined = q.poll();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0690
     * @tc.name testBlockingQueuePoll069
     * @tc.desc Verify typeof poll result for int element is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(17);
      let v: int | undefined = q.poll();
      expect(typeof v).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0700
     * @tc.name testBlockingQueuePoll070
     * @tc.desc Verify typeof poll result for float number element is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(2.718);
      let v: number | undefined = q.poll();
      expect(typeof v).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0710
     * @tc.name testBlockingQueuePoll071
     * @tc.desc Verify typeof poll result for string element is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.push('beta');
      let v: string | undefined = q.poll();
      expect(typeof v).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0720
     * @tc.name testBlockingQueuePoll072
     * @tc.desc Verify typeof poll result for boolean element is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(10);
      q.push(false);
      let v: boolean | undefined = q.poll();
      expect(v).assertEqual(false);
      expect(typeof v).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0730
     * @tc.name testBlockingQueuePoll073
     * @tc.desc Verify typeof poll result for element 0 is still number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(0);
      let v: int | undefined = q.poll();
      expect(typeof v).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0740
     * @tc.name testBlockingQueuePoll074
     * @tc.desc Verify typeof poll result for negative value element is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(-88);
      let v: int | undefined = q.poll();
      expect(typeof v).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0750
     * @tc.name testBlockingQueuePoll075
     * @tc.desc Verify typeof poll result for empty queue is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      let v: int | undefined = q.poll();
      expect(typeof v).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0760
     * @tc.name testBlockingQueuePoll076
     * @tc.desc Verify typeof poll result for int max value element is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(2147483647);
      let v: int | undefined = q.poll();
      expect(typeof v).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0770
     * @tc.name testBlockingQueuePoll077
     * @tc.desc Verify poll returns head value 0.5 from ArrayBlockingQueue number queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(0.5);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0780
     * @tc.name testBlockingQueuePoll078
     * @tc.desc Verify poll after single poll reduces size to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(5);
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0790
     * @tc.name testBlockingQueuePoll079
     * @tc.desc Verify poll reduces size from 3 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(TEST_VALUE);
      q.push(3);
      q.poll();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0800
     * @tc.name testBlockingQueuePoll080
     * @tc.desc Verify two polls reduce size from 4 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(10);
      q.push(20);
      q.push(30);
      q.push(40);
      q.poll();
      q.poll();
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0810
     * @tc.name testBlockingQueuePoll081
     * @tc.desc Verify poll on empty queue keeps size unchanged at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0820
     * @tc.name testBlockingQueuePoll082
     * @tc.desc Verify full queue poll once reduces size to capacity minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(TEST_VALUE);
      q.push(3);
      q.poll();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0830
     * @tc.name testBlockingQueuePoll083
     * @tc.desc Verify capacity stays unchanged after poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(8);
      q.push(1);
      q.poll();
      expect(q.capacity).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0840
     * @tc.name testBlockingQueuePoll084
     * @tc.desc Verify remainingCapacity increases by 1 after poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(1);
      q.push(2);
      q.poll();
      expect(q.remainingCapacity()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0850
     * @tc.name testBlockingQueuePoll085
     * @tc.desc Verify poll on empty queue keeps remainingCapacity equal to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(7);
      q.poll();
      expect(q.remainingCapacity()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0860
     * @tc.name testBlockingQueuePoll086
     * @tc.desc Verify getFirst returns second element after polling head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 22;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(11);
      q.push(TEST_VALUE);
      q.poll();
      expect(q.getFirst()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0870
     * @tc.name testBlockingQueuePoll087
     * @tc.desc Verify getEnd tail element unchanged after polling head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 33;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(11);
      q.push(22);
      q.push(TEST_VALUE);
      q.poll();
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0880
     * @tc.name testBlockingQueuePoll088
     * @tc.desc Verify poll head does not affect later pushed element position via getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.poll();
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0890
     * @tc.name testBlockingQueuePoll089
     * @tc.desc Verify ArrayBlockingQueue getFirst returns correct remaining head after poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 60;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(50);
      q.push(TEST_VALUE);
      q.poll();
      expect(q.getFirst()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0900
     * @tc.name testBlockingQueuePoll090
     * @tc.desc Verify poll return value equals getFirst value captured before poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(71);
      q.push(72);
      let first: int | undefined = q.getFirst();
      let polled: int | undefined = q.poll();
      expect(polled).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0910
     * @tc.name testBlockingQueuePoll091
     * @tc.desc Verify single element poll return value equals getEnd value captured before poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(99);
      let endV: int | undefined = q.getEnd();
      let polled: int | undefined = q.poll();
      expect(polled).assertEqual(endV);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0920
     * @tc.name testBlockingQueuePoll092
     * @tc.desc Verify poll head value restores int max boundary element ahead of another element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(BOUNDARY_VALUE);
      q.push(1);
      expect(q.poll()).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0930
     * @tc.name testBlockingQueuePoll093
     * @tc.desc Verify poll restores Infinity boundary element from ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(Number.POSITIVE_INFINITY);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0940
     * @tc.name testBlockingQueuePoll094
     * @tc.desc Verify poll restores -Infinity boundary element from ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(Number.NEGATIVE_INFINITY);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0950
     * @tc.name testBlockingQueuePoll095
     * @tc.desc Verify poll restores Number.MAX_SAFE_INTEGER boundary element from ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: number = 9007199254740991;
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(BOUNDARY_VALUE);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0960
     * @tc.name testBlockingQueuePoll096
     * @tc.desc Verify poll restores Number.MAX_SAFE_INTEGER minus 1 boundary element from ArrayBlockingQueue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: number = 9007199254740990;
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(BOUNDARY_VALUE);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0970
     * @tc.name testBlockingQueuePoll097
     * @tc.desc Verify poll restores capacity-1 single boundary int max element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(BOUNDARY_VALUE);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0980
     * @tc.name testBlockingQueuePoll098
     * @tc.desc Verify full queue poll once frees a slot then push new element enters tail via getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 4;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.push(TEST_VALUE);
      expect(q.getEnd()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_0990
     * @tc.name testBlockingQueuePoll099
     * @tc.desc Verify full queue poll frees slot then add returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      q.poll();
      let ok: boolean = q.add(9);
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1000
     * @tc.name testBlockingQueuePoll100
     * @tc.desc Verify full queue without poll add returns false with no overflow space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      let ok: boolean = q.add(9);
      expect(ok).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1010
     * @tc.name testBlockingQueuePoll101
     * @tc.desc Verify full queue poll then add restores size to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(TEST_VALUE);
      q.poll();
      q.add(4);
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1020
     * @tc.name testBlockingQueuePoll102
     * @tc.desc Verify full queue poll then push keeps FIFO head as old second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(TEST_VALUE);
      q.push(3);
      q.poll();
      q.push(4);
      expect(q.getFirst()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1030
     * @tc.name testBlockingQueuePoll103
     * @tc.desc Verify full queue poll leaves remainingCapacity at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      q.push(1);
      q.push(2);
      q.push(3);
      q.push(4);
      q.poll();
      expect(q.remainingCapacity()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1040
     * @tc.name testBlockingQueuePoll104
     * @tc.desc Verify full queue repeated poll and push cycle conserves size at capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(1);
      q.push(TEST_VALUE);
      q.poll();
      q.push(3);
      q.poll();
      q.push(4);
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1050
     * @tc.name testBlockingQueuePoll105
     * @tc.desc Verify full queue poll then push boundary int max element restorable via getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(1);
      q.push(2);
      q.poll();
      q.push(BOUNDARY_VALUE);
      expect(q.getEnd()).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1060
     * @tc.name testBlockingQueuePoll106
     * @tc.desc Verify poll result reused as nested push input restores original head value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 55;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      q.push(q.poll()!);
      expect(q.getFirst()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1070
     * @tc.name testBlockingQueuePoll107
     * @tc.desc Verify sum of two consecutive poll return values is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(3);
      q.push(4);
      let a: int | undefined = q.poll();
      let b: int | undefined = q.poll();
      expect(a! + b!).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1080
     * @tc.name testBlockingQueuePoll108
     * @tc.desc Verify poll return value re-added restores queue size to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(12);
      let v: int | undefined = q.poll();
      q.add(v!);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1090
     * @tc.name testBlockingQueuePoll109
     * @tc.desc Verify queue cleared by poll can be re-pushed and polled to restore new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      q.push(TEST_VALUE);
      expect(q.poll()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1100
     * @tc.name testBlockingQueuePoll110
     * @tc.desc Verify ArrayBlockingQueue nested clear then refill restores head via getFirst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 16;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(8);
      q.poll();
      q.push(TEST_VALUE);
      expect(q.getFirst()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1110
     * @tc.name testBlockingQueuePoll111
     * @tc.desc Verify LinkedBlockingQueue poll returns number type value 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(1.5);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1120
     * @tc.name testBlockingQueuePoll112
     * @tc.desc Verify ArrayBlockingQueue poll returns number type value 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(1.5);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1130
     * @tc.name testBlockingQueuePoll113
     * @tc.desc Verify LinkedBlockingQueue empty poll typeof is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      let v: number | undefined = q.poll();
      expect(typeof v).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POLL_1140
     * @tc.name testBlockingQueuePoll114
     * @tc.desc Verify ArrayBlockingQueue empty poll typeof is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePoll114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      let v: number | undefined = q.poll();
      expect(typeof v).assertEqual('undefined');
    });
  });
}
