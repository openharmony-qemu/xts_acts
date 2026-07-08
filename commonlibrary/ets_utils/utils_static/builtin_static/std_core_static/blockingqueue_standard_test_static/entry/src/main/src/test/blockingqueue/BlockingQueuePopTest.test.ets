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

class CustomObject013 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

export default function BlockingQueuePopTest(): void {
  describe('BlockingQueuePopTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0010
     * @tc.name testBlockingQueuePop001
     * @tc.desc Verify LinkedBlockingQueue default constructor pop returns pushed int value and size reduces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 42;
      const EXPECTED_VALUE: int = 42;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      let result: int | undefined = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0020
     * @tc.name testBlockingQueuePop002
     * @tc.desc Verify LinkedBlockingQueue default constructor pop returns first pushed element (FIFO) and size=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const PUSH_VALUE_3: int = 3;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_SIZE: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      queue.push(PUSH_VALUE_3);
      let result: int | undefined = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0030
     * @tc.name testBlockingQueuePop003
     * @tc.desc Verify LinkedBlockingQueue default constructor pop maintains FIFO order over 10 elements and isEmpty=true after all pops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = 0; i < 10; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 10; i++) {
        let result: int | undefined = queue.pop();
        expect(result).assertEqual(i);
      }
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0040
     * @tc.name testBlockingQueuePop004
     * @tc.desc Verify LinkedBlockingQueue default constructor second pop returns second pushed value after first pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 10;
      const PUSH_VALUE_2: int = 20;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_2: int = 20;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      let first: int | undefined = queue.pop();
      expect(first).assertEqual(EXPECTED_VALUE);
      let second: int | undefined = queue.pop();
      expect(second).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0050
     * @tc.name testBlockingQueuePop005
     * @tc.desc Verify LinkedBlockingQueue default constructor push then immediately pop returns the pushed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: int = 99;
      const EXPECTED_VALUE: int = 99;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queue.push(PUSH_VALUE);
      let result: int | undefined = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0060
     * @tc.name testBlockingQueuePop006
     * @tc.desc Verify LinkedBlockingQueue default constructor pop returns pushed hello string and size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "hello";
      const EXPECTED_VALUE: string = "hello";
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      let result: string | undefined = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0070
     * @tc.name testBlockingQueuePop007
     * @tc.desc Verify LinkedBlockingQueue default constructor pop maintains FIFO a-b-c order for string queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "a";
      const PUSH_TEXT_2: string = "b";
      const PUSH_TEXT_3: string = "c";
      const EXPECTED_VALUE: string = "a";
      const EXPECTED_VALUE_2: string = "b";
      const EXPECTED_VALUE_3: string = "c";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      queue.push(PUSH_TEXT_3);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0080
     * @tc.name testBlockingQueuePop008
     * @tc.desc Verify LinkedBlockingQueue default constructor pop on empty string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "";
      const EXPECTED_VALUE: string = "";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      let result: string | undefined = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0090
     * @tc.name testBlockingQueuePop009
     * @tc.desc Verify LinkedBlockingQueue default constructor pop preserves Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "测试";
      const EXPECTED_VALUE: string = "测试";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      let result: string | undefined = queue.pop();
      expect(result).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0100
     * @tc.name testBlockingQueuePop010
     * @tc.desc Verify LinkedBlockingQueue default constructor pop maintains FIFO true then false for boolean queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_FLAG: boolean = true;
      const PUSH_FLAG_2: boolean = false;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_FLAG);
      queue.push(PUSH_FLAG_2);
      expect(queue.pop()).assertTrue();
      expect(queue.pop()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0110
     * @tc.name testBlockingQueuePop011
     * @tc.desc Verify LinkedBlockingQueue default constructor pop returns correct custom object references in FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const OBJECT_VALUE: int = 1;
      const OBJECT_NAME: string = "first";
      const OBJECT_VALUE_2: int = 2;
      const OBJECT_NAME_2: string = "second";
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_2: int = 2;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      let obj1: CustomObject013 = new CustomObject013(OBJECT_NAME, OBJECT_VALUE);
      let obj2: CustomObject013 = new CustomObject013(OBJECT_NAME_2, OBJECT_VALUE_2);
      let queue: containers.BlockingQueue<CustomObject013> = new containers.LinkedBlockingQueue<CustomObject013>();
      queue.push(obj1);
      queue.push(obj2);
      expect(queue.pop()).assertEqual(obj1);
      expect(queue.pop()).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0120
     * @tc.name testBlockingQueuePop012
     * @tc.desc Verify LinkedBlockingQueue with capacity=10 pop reduces size to 9 and remainingCapacity becomes 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 9;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 10; i++) {
        queue.push(i);
      }
      queue.pop();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0130
     * @tc.name testBlockingQueuePop013
     * @tc.desc Verify LinkedBlockingQueue with capacity=10 pop all 10 elements maintains FIFO and isEmpty=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 10; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 10; i++) {
        expect(queue.pop()).assertEqual(i);
      }
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0140
     * @tc.name testBlockingQueuePop014
     * @tc.desc Verify LinkedBlockingQueue pre-filled with Array(5) pop maintains FIFO iterator order and isEmpty=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i = 0; i < 5; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      for (let i = 0; i < 5; i++) {
        expect(queue.pop()).assertEqual(i);
      }
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0150
     * @tc.name testBlockingQueuePop015
     * @tc.desc Verify LinkedBlockingQueue capacity=3 with iterable of 10 elements pop returns first 3 elements in FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_VALUE_2: int = 1;
      const EXPECTED_VALUE_3: int = 2;
      let arr: int[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0160
     * @tc.name testBlockingQueuePop016
     * @tc.desc Verify LinkedBlockingQueue capacity=5 full pop 1 frees slot then push succeeds and size returns to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      const PUSH_VALUE: int = 5;
      const EXPECTED_SIZE: int = 5;
      let arr: int[] = [];
      for (let i = 0; i < 5; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      let popped: int | undefined = queue.pop();
      expect(popped).assertEqual(EXPECTED_VALUE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0170
     * @tc.name testBlockingQueuePop017
     * @tc.desc Verify ArrayBlockingQueue capacity=10 pop maintains FIFO order and correct size after 3 pops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      const EXPECTED_VALUE_3: int = 3;
      const EXPECTED_SIZE: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i = 1; i <= 5; i++) {
        queue.push(i);
      }
      expect(queue.pop()).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_3);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0180
     * @tc.name testBlockingQueuePop018
     * @tc.desc Verify ArrayBlockingQueue capacity=10 pop all 10 elements maintains FIFO and isEmpty=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i = 0; i < 10; i++) {
        queue.push(i);
      }
      for (let i = 0; i < 10; i++) {
        expect(queue.pop()).assertEqual(i);
      }
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0190
     * @tc.name testBlockingQueuePop019
     * @tc.desc Verify ArrayBlockingQueue capacity=10 string queue pop maintains FIFO x-y-z order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const PUSH_TEXT: string = "x";
      const PUSH_TEXT_2: string = "y";
      const PUSH_TEXT_3: string = "z";
      const EXPECTED_VALUE: string = "x";
      const EXPECTED_VALUE_2: string = "y";
      const EXPECTED_VALUE_3: string = "z";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      queue.push(PUSH_TEXT);
      queue.push(PUSH_TEXT_2);
      queue.push(PUSH_TEXT_3);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(queue.pop()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0200
     * @tc.name testBlockingQueuePop020
     * @tc.desc Verify ArrayBlockingQueue with Set iterable pop maintains FIFO iterator order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 200;
      const EXPECTED_SIZE: int = 10;
      let set: Set<number> = new Set<number>();
      for (let i = 0; i < 10; i++) {
        set.add(i);
      }
      let queue: containers.BlockingQueue<number> = new containers.ArrayBlockingQueue<number>(CAPACITY, set);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      for (let i = 0; i < 10; i++) {
        expect(queue.pop()).assertEqual(i);
      }
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0210
     * @tc.name testBlockingQueuePop021
     * @tc.desc Verify ArrayBlockingQueue capacity=10 single element pop returns the head value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 5;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let result: int = q.pop();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0220
     * @tc.name testBlockingQueuePop022
     * @tc.desc Verify pop restores element value -1 negative marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = -1;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      let result: int = q.pop();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0230
     * @tc.name testBlockingQueuePop023
     * @tc.desc Verify pop restores hexadecimal literal 0xff equals 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0xff);
      let result: int = q.pop();
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0240
     * @tc.name testBlockingQueuePop024
     * @tc.desc Verify pop restores octal literal 0o17 equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0o17);
      let result: int = q.pop();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0250
     * @tc.name testBlockingQueuePop025
     * @tc.desc Verify pop restores octal literal 0o777 equals 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0o777);
      let result: int = q.pop();
      expect(result).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0260
     * @tc.name testBlockingQueuePop026
     * @tc.desc Verify pop restores binary literal 0b1010 equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0b1010);
      let result: int = q.pop();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0270
     * @tc.name testBlockingQueuePop027
     * @tc.desc Verify pop restores binary literal 0b1111 equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0b1111);
      let result: int = q.pop();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0280
     * @tc.name testBlockingQueuePop028
     * @tc.desc Verify pop restores scientific notation literal 1e3 equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(1e3);
      let result: number = q.pop();
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0290
     * @tc.name testBlockingQueuePop029
     * @tc.desc Verify pop restores scientific notation literal 2e5 equals 200000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(2e5);
      let result: number = q.pop();
      expect(result).assertEqual(200000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0300
     * @tc.name testBlockingQueuePop030
     * @tc.desc Verify pop restores math expression 1+2 equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1 + 2);
      let result: int = q.pop();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0310
     * @tc.name testBlockingQueuePop031
     * @tc.desc Verify pop restores math expression 10*10 equals 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(10 * 10);
      let result: int = q.pop();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0320
     * @tc.name testBlockingQueuePop032
     * @tc.desc Verify pop restores hexadecimal literal 0x0 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0x0);
      let result: int = q.pop();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0330
     * @tc.name testBlockingQueuePop033
     * @tc.desc Verify pop restores float value 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(3.14);
      let result: number = q.pop();
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0340
     * @tc.name testBlockingQueuePop034
     * @tc.desc Verify pop restores float value -2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(-2.5);
      let result: number = q.pop();
      expect(result).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0350
     * @tc.name testBlockingQueuePop035
     * @tc.desc Verify pop restores float epsilon boundary value 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(0.1);
      let result: number = q.pop();
      expect(result).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0360
     * @tc.name testBlockingQueuePop036
     * @tc.desc Verify pop restores Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER);
      let result: number = q.pop();
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0370
     * @tc.name testBlockingQueuePop037
     * @tc.desc Verify pop restores Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MIN_SAFE_INTEGER);
      let result: number = q.pop();
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0380
     * @tc.name testBlockingQueuePop038
     * @tc.desc Verify pop restores Number.MAX_SAFE_INTEGER plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER + 1);
      let result: number = q.pop();
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0390
     * @tc.name testBlockingQueuePop039
     * @tc.desc Verify pop restores Number.MIN_SAFE_INTEGER minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MIN_SAFE_INTEGER - 1);
      let result: number = q.pop();
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0400
     * @tc.name testBlockingQueuePop040
     * @tc.desc Verify pop restores Number.MAX_VALUE without precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_VALUE);
      let result: number = q.pop();
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0410
     * @tc.name testBlockingQueuePop041
     * @tc.desc Verify pop restores Number.MIN_VALUE without underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MIN_VALUE);
      let result: number = q.pop();
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0420
     * @tc.name testBlockingQueuePop042
     * @tc.desc Verify pop restores Number.EPSILON without precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.EPSILON);
      let result: number = q.pop();
      expect(result).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0430
     * @tc.name testBlockingQueuePop043
     * @tc.desc Verify pop restores Infinity without overflow truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.POSITIVE_INFINITY);
      let result: number = q.pop();
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0440
     * @tc.name testBlockingQueuePop044
     * @tc.desc Verify pop restores -Infinity without overflow truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.NEGATIVE_INFINITY);
      let result: number = q.pop();
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0450
     * @tc.name testBlockingQueuePop045
     * @tc.desc Verify pop restores NaN validated via Number.isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.NaN);
      let result: number = q.pop();
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0460
     * @tc.name testBlockingQueuePop046
     * @tc.desc Verify pop restores positive zero 0 as numeric 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(0);
      let result: number = q.pop();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0470
     * @tc.name testBlockingQueuePop047
     * @tc.desc Verify pop restores negative zero -0 as numeric 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(-0);
      let result: number = q.pop();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0480
     * @tc.name testBlockingQueuePop048
     * @tc.desc Verify pop returns the pushed value for number queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 7;
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(TEST_VALUE);
      let result: number = q.pop();
      expect(result).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0490
     * @tc.name testBlockingQueuePop049
     * @tc.desc Verify pop return value equals getFirst peeked head value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(42);
      let peeked: int | undefined = q.getFirst();
      let popped: int = q.pop();
      expect(popped).assertEqual(peeked);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0500
     * @tc.name testBlockingQueuePop050
     * @tc.desc Verify pop after single element reduces size to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(5);
      q.pop();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0510
     * @tc.name testBlockingQueuePop051
     * @tc.desc Verify pop after three elements reduces size to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(TEST_VALUE);
      q.push(3);
      q.pop();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0520
     * @tc.name testBlockingQueuePop052
     * @tc.desc Verify pop increases remainingCapacity by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.pop();
      expect(q.remainingCapacity()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0530
     * @tc.name testBlockingQueuePop053
     * @tc.desc Verify full queue capacity=3 pop once leaves size equal to capacity minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(TEST_VALUE);
      q.push(3);
      q.pop();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0540
     * @tc.name testBlockingQueuePop054
     * @tc.desc Verify ArrayBlockingQueue int max value pop without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(BOUNDARY_VALUE);
      let result: int = q.pop();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0550
     * @tc.name testBlockingQueuePop055
     * @tc.desc Verify ArrayBlockingQueue int min value pop without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = -2147483648;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.push(BOUNDARY_VALUE);
      let result: int = q.pop();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0560
     * @tc.name testBlockingQueuePop056
     * @tc.desc Verify ArrayBlockingQueue Number.MAX_VALUE pop without precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(5);
      q.push(Number.MAX_VALUE);
      let result: number = q.pop();
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0570
     * @tc.name testBlockingQueuePop057
     * @tc.desc Verify capacity=1 full queue single int max value pop restores value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(BOUNDARY_VALUE);
      let result: int = q.pop();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0580
     * @tc.name testBlockingQueuePop058
     * @tc.desc Verify capacity=1 full queue single int min value pop restores value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = -2147483648;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(BOUNDARY_VALUE);
      let result: int = q.pop();
      expect(result).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0590
     * @tc.name testBlockingQueuePop059
     * @tc.desc Verify large number 1e308 pop without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(5);
      q.push(1e308);
      let result: number = q.pop();
      expect(result).assertEqual(1e308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0600
     * @tc.name testBlockingQueuePop060
     * @tc.desc Verify tiny number 1e-308 pop without underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(5);
      q.push(1e-308);
      let result: number = q.pop();
      expect(result).assertEqual(1e-308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0610
     * @tc.name testBlockingQueuePop061
     * @tc.desc Verify negative float boundary -1.7976931348623157e308 pop equals -Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(5);
      q.push(-1.7976931348623157e308);
      let result: number = q.pop();
      expect(result).assertEqual(-Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0620
     * @tc.name testBlockingQueuePop062
     * @tc.desc Verify binary all-ones int 0b1111111111111111111111111111111 pop equals int max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(0b1111111111111111111111111111111);
      let result: int = q.pop();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0630
     * @tc.name testBlockingQueuePop063
     * @tc.desc Verify pop returns the pushed value for ArrayBlockingQueue float element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(3.14);
      let v: number = q.pop();
      expect(v).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0640
     * @tc.name testBlockingQueuePop064
     * @tc.desc Verify pop returns the pushed value for string queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.push('alpha');
      let v: string = q.pop();
      expect(v).assertEqual('alpha');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0650
     * @tc.name testBlockingQueuePop065
     * @tc.desc Verify pop returns the pushed value for boolean queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(10);
      q.push(true);
      let v: boolean = q.pop();
      expect(v).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0660
     * @tc.name testBlockingQueuePop066
     * @tc.desc Verify pop returns the pushed value for element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(0);
      let v: int = q.pop();
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0670
     * @tc.name testBlockingQueuePop067
     * @tc.desc Verify pop returns the pushed value for negative element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = -55;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(TEST_VALUE);
      let v: int = q.pop();
      expect(v).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0680
     * @tc.name testBlockingQueuePop068
     * @tc.desc Verify pop returns the pushed value for ArrayBlockingQueue decimal element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(5);
      q.push(2.718281828);
      let v: number = q.pop();
      expect(v).assertEqual(2.718281828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0690
     * @tc.name testBlockingQueuePop069
     * @tc.desc Verify pop returns the pushed value for empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(5);
      q.push('');
      let v: string = q.pop();
      expect(v).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0700
     * @tc.name testBlockingQueuePop070
     * @tc.desc Verify pop returned array element preserves length=3 and first=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_LENGTH: int = 3;
      const EXPECTED_FIRST: int = 1;
      let q: containers.LinkedBlockingQueue<Array<int>> = new containers.LinkedBlockingQueue<Array<int>>(5);
      let arr: Array<int> = [1, 2, 3];
      q.push(arr);
      let v: Array<int> = q.pop();
      expect(v.length).assertEqual(EXPECTED_LENGTH);
      expect(v[0]).assertEqual(EXPECTED_FIRST);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0710
     * @tc.name testBlockingQueuePop071
     * @tc.desc Verify pop returned object element keeps the same reference as pushed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_LENGTH: int = 3;
      let q: containers.LinkedBlockingQueue<Array<int>> = new containers.LinkedBlockingQueue<Array<int>>(5);
      let arr: Array<int> = [9, 8, 7];
      q.push(arr);
      let v: Array<int> = q.pop();
      expect(v).assertEqual(arr);
      expect(v.length).assertEqual(EXPECTED_LENGTH);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0720
     * @tc.name testBlockingQueuePop072
     * @tc.desc Verify pop returned string element preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(5);
      q.push('hello-pop');
      let v: string = q.pop();
      expect(v.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0730
     * @tc.name testBlockingQueuePop073
     * @tc.desc Verify pop returns string element value equal to pushed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(5);
      q.push('return-value');
      let v: string = q.pop();
      expect(v).assertEqual('return-value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0740
     * @tc.name testBlockingQueuePop074
     * @tc.desc Verify pop returns ArrayBlockingQueue float element value equal to pushed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(5);
      q.push(99.999);
      let v: number = q.pop();
      expect(v).assertEqual(99.999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0750
     * @tc.name testBlockingQueuePop075
     * @tc.desc Verify pop returns boolean false element equal to pushed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(5);
      q.push(false);
      let v: boolean = q.pop();
      expect(v).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0760
     * @tc.name testBlockingQueuePop076
     * @tc.desc Verify pop two consecutive times returns second pushed element 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_FIRST: int = 11;
      const EXPECTED_SECOND: int = 22;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(11);
      q.push(22);
      let first: int = q.pop();
      let second: int = q.pop();
      expect(first).assertEqual(EXPECTED_FIRST);
      expect(second).assertEqual(EXPECTED_SECOND);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0770
     * @tc.name testBlockingQueuePop077
     * @tc.desc Verify pop two times then size of 5 element queue reduces to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(TEST_VALUE);
      q.push(4);
      q.push(5);
      q.pop();
      q.pop();
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0780
     * @tc.name testBlockingQueuePop078
     * @tc.desc Verify pop reduces size by exactly 1 compared to before pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(81);
      q.push(82);
      q.push(83);
      let before: int = q.size;
      q.pop();
      expect(q.size).assertEqual(before - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0790
     * @tc.name testBlockingQueuePop079
     * @tc.desc Verify ArrayBlockingQueue pop reduces size by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(901);
      q.push(902);
      q.pop();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0800
     * @tc.name testBlockingQueuePop080
     * @tc.desc Verify pop keeps LinkedBlockingQueue capacity unchanged at constructed value 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(15);
      q.push(111);
      q.pop();
      expect(q.capacity).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0810
     * @tc.name testBlockingQueuePop081
     * @tc.desc Verify multiple pops keep capacity at constructed value 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(8);
      q.push(1);
      q.push(2);
      q.push(3);
      q.pop();
      q.pop();
      expect(q.capacity).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0820
     * @tc.name testBlockingQueuePop082
     * @tc.desc Verify ArrayBlockingQueue capacity stays unchanged at constructed value 12 after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(12);
      q.push(321);
      q.pop();
      expect(q.capacity).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0830
     * @tc.name testBlockingQueuePop083
     * @tc.desc Verify pop increases remainingCapacity by 1 compared to before pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(201);
      q.push(202);
      let before: int = q.remainingCapacity();
      q.pop();
      expect(q.remainingCapacity()).assertEqual(before + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0840
     * @tc.name testBlockingQueuePop084
     * @tc.desc Verify single element pop restores remainingCapacity to full capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(6);
      q.push(601);
      q.pop();
      expect(q.remainingCapacity()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0850
     * @tc.name testBlockingQueuePop085
     * @tc.desc Verify single element queue pop then poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(999);
      q.pop();
      let after = q.poll();
      expect(after).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0860
     * @tc.name testBlockingQueuePop086
     * @tc.desc Verify single element queue pop then getFirst returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(444);
      q.pop();
      let head = q.getFirst();
      expect(head).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0870
     * @tc.name testBlockingQueuePop087
     * @tc.desc Verify single element queue pop then getEnd returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(555);
      q.pop();
      let tail = q.getEnd();
      expect(tail).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0880
     * @tc.name testBlockingQueuePop088
     * @tc.desc Verify full queue pop then add returns true after freeing a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(91);
      q.push(92);
      q.pop();
      let added: boolean = q.add(93);
      expect(added).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0890
     * @tc.name testBlockingQueuePop089
     * @tc.desc Verify full queue pop frees a slot making remainingCapacity become 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(15);
      q.push(16);
      q.pop();
      expect(q.remainingCapacity()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0900
     * @tc.name testBlockingQueuePop090
     * @tc.desc Verify pop makes remaining head become the original second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 212;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(211);
      q.push(TEST_VALUE);
      q.pop();
      let head: int = q.getFirst()!;
      expect(head).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0910
     * @tc.name testBlockingQueuePop091
     * @tc.desc Verify pop keeps the remaining tail element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 223;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(221);
      q.push(222);
      q.push(TEST_VALUE);
      q.pop();
      let tail: int = q.getEnd()!;
      expect(tail).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0920
     * @tc.name testBlockingQueuePop092
     * @tc.desc Verify pop does not disturb FIFO order of remaining elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 243;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(241);
      q.push(242);
      q.push(TEST_VALUE);
      q.pop();
      q.pop();
      let v: int = q.pop();
      expect(v).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0930
     * @tc.name testBlockingQueuePop093
     * @tc.desc Verify push pop then add keeps total valid element count within capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(1);
      q.push(TEST_VALUE);
      q.pop();
      q.add(3);
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0940
     * @tc.name testBlockingQueuePop094
     * @tc.desc Verify full queue pop then add succeeds and size returns to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(11);
      q.push(12);
      q.push(13);
      q.pop();
      q.add(14);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0950
     * @tc.name testBlockingQueuePop095
     * @tc.desc Verify full queue pop then add overflow second element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(21);
      q.push(22);
      q.pop();
      q.add(23);
      let overflow: boolean = q.add(24);
      expect(overflow).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0960
     * @tc.name testBlockingQueuePop096
     * @tc.desc Verify full queue pop then add new element keeps old remaining element popped first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 32;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(31);
      q.push(TEST_VALUE);
      q.pop();
      q.add(33);
      let v: int = q.pop();
      expect(v).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0970
     * @tc.name testBlockingQueuePop097
     * @tc.desc Verify full queue pop add new element then pop twice returns newly added element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 43;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      q.push(41);
      q.push(42);
      q.pop();
      q.add(TEST_VALUE);
      q.pop();
      let v: int = q.pop();
      expect(v).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0980
     * @tc.name testBlockingQueuePop098
     * @tc.desc Verify capacity=1 queue pop then add succeeds with size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(51);
      q.pop();
      q.add(52);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_0990
     * @tc.name testBlockingQueuePop099
     * @tc.desc Verify capacity=1 full queue pop then add second overflow returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(61);
      q.pop();
      q.add(62);
      let overflow: boolean = q.add(63);
      expect(overflow).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_1000
     * @tc.name testBlockingQueuePop100
     * @tc.desc Verify repeated pop-add cycle keeps size never exceeding capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(71);
      q.push(72);
      q.push(73);
      for (let i = 0; i < 3; i++) {
        q.pop();
        q.add(80 + i);
      }
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_1010
     * @tc.name testBlockingQueuePop101
     * @tc.desc Verify ArrayBlockingQueue full queue pop then add keeps size equal to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(91);
      q.push(92);
      q.push(93);
      q.pop();
      q.add(94);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_1020
     * @tc.name testBlockingQueuePop102
     * @tc.desc Verify multi-element queue popped empty then poll returns undefined without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(311);
      q.push(312);
      q.pop();
      q.pop();
      let after = q.poll();
      expect(after).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_1030
     * @tc.name testBlockingQueuePop103
     * @tc.desc Verify popping all elements restores remainingCapacity to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(331);
      q.push(332);
      q.pop();
      q.pop();
      expect(q.remainingCapacity()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_1040
     * @tc.name testBlockingQueuePop104
     * @tc.desc Verify popping all then pushing a new element returns the new element on pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 342;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.push(341);
      q.pop();
      q.push(TEST_VALUE);
      let v: int = q.pop();
      expect(v).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_POP_1050
     * @tc.name testBlockingQueuePop105
     * @tc.desc Verify pop clears queue then refilling to capacity does not throw and size is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePop105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(351);
      q.pop();
      q.push(352);
      q.push(353);
      q.push(354);
      expect(q.size).assertEqual(3);
    });
  });
}
