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

class CustomObject004 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

class CustomObject021 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

class CustomObject042 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

export default function BlockingQueueConstructorTest(): void {
  describe('BlockingQueueConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0010
     * @tc.name testBlockingQueueConstructor001
     * @tc.desc Verify LinkedBlockingQueue default constructor creates empty queue with Int.MAX_VALUE capacity for int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0020
     * @tc.name testBlockingQueueConstructor002
     * @tc.desc Verify LinkedBlockingQueue default constructor creates empty queue with Int.MAX_VALUE capacity for string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0030
     * @tc.name testBlockingQueueConstructor003
     * @tc.desc Verify LinkedBlockingQueue default constructor creates empty queue with Int.MAX_VALUE capacity for boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0040
     * @tc.name testBlockingQueueConstructor004
     * @tc.desc Verify LinkedBlockingQueue default constructor creates empty queue for custom object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<CustomObject004> = new containers.LinkedBlockingQueue<CustomObject004>();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0050
     * @tc.name testBlockingQueueConstructor005
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=1 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const EXPECTED_CAPACITY: int = 1;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0060
     * @tc.name testBlockingQueueConstructor006
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=10 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0070
     * @tc.name testBlockingQueueConstructor007
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=1000 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1000;
      const EXPECTED_CAPACITY: int = 1000;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0080
     * @tc.name testBlockingQueueConstructor008
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=Int.MAX_VALUE creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2147483647;
      const EXPECTED_CAPACITY: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0090
     * @tc.name testBlockingQueueConstructor009
     * @tc.desc Verify LinkedBlockingQueue constructor throws RangeError when capacity=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 0;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0100
     * @tc.name testBlockingQueueConstructor010
     * @tc.desc Verify LinkedBlockingQueue constructor throws RangeError when capacity=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -1;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0110
     * @tc.name testBlockingQueueConstructor011
     * @tc.desc Verify LinkedBlockingQueue constructor throws RangeError when capacity=-100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -100;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0120
     * @tc.name testBlockingQueueConstructor012
     * @tc.desc Verify LinkedBlockingQueue constructor throws RangeError when capacity=Int.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -2147483648;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0130
     * @tc.name testBlockingQueueConstructor013
     * @tc.desc Verify LinkedBlockingQueue constructor with empty array iterable creates empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 2147483647;
      let arr: int[] = [];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0140
     * @tc.name testBlockingQueueConstructor014
     * @tc.desc Verify LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_ITEM: int = 42;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_ELEMENT: int = 42;
      let arr: int[] = [ARRAY_ITEM];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0150
     * @tc.name testBlockingQueueConstructor015
     * @tc.desc Verify LinkedBlockingQueue constructor with 10-element array iterable preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const EXPECTED_END_ELEMENT: int = 9;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0160
     * @tc.name testBlockingQueueConstructor016
     * @tc.desc Verify LinkedBlockingQueue constructor with Set iterable initializes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const SET_VALUE: int = 10;
      const SET_VALUE_2: int = 20;
      const SET_VALUE_3: int = 30;
      const EXPECTED_SIZE: int = 3;
      let set: Set<int> = new Set<int>();
      set.add(SET_VALUE);
      set.add(SET_VALUE_2);
      set.add(SET_VALUE_3);
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(set);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0170
     * @tc.name testBlockingQueueConstructor017
     * @tc.desc Verify LinkedBlockingQueue constructor with Array.values() iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_ITEM: int = 1;
      const ARRAY_ITEM_2: int = 2;
      const ARRAY_ITEM_3: int = 3;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_FIRST_ELEMENT: int = 1;
      let arr: int[] = [ARRAY_ITEM, ARRAY_ITEM_2, ARRAY_ITEM_3];
      let iter = arr.values();
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0180
     * @tc.name testBlockingQueueConstructor018
     * @tc.desc Verify LinkedBlockingQueue constructor with continuous array of 3 elements, verify size=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 0;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 4;
      const EXPECTED_SIZE: int = 3;
      let arr: int[] = [];
      arr.push(ARRAY_VALUE);
      arr.push(ARRAY_VALUE_2);
      arr.push(ARRAY_VALUE_3);
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0190
     * @tc.name testBlockingQueueConstructor019
     * @tc.desc Verify LinkedBlockingQueue constructor with string array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const STRING_ITEM: string = "hello";
      const STRING_ITEM_2: string = "world";
      const STRING_ITEM_3: string = "test";
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_FIRST_ELEMENT: string = "hello";
      let arr: string[] = [STRING_ITEM, STRING_ITEM_2, STRING_ITEM_3];
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0200
     * @tc.name testBlockingQueueConstructor020
     * @tc.desc Verify LinkedBlockingQueue constructor with custom object array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const OBJECT_NAME: string = "first";
      const OBJECT_VALUE: int = 1;
      const OBJECT_NAME_2: string = "second";
      const OBJECT_VALUE_2: int = 2;
      const EXPECTED_SIZE: int = 2;
      let obj1 = new CustomObject021(OBJECT_NAME, OBJECT_VALUE);
      let obj2 = new CustomObject021(OBJECT_NAME_2, OBJECT_VALUE_2);
      let arr: CustomObject021[] = [obj1, obj2];
      let queue: containers.BlockingQueue<CustomObject021> = new containers.LinkedBlockingQueue<CustomObject021>(arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(obj1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0210
     * @tc.name testBlockingQueueConstructor021
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=10 and 5-element iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 5;
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_CAPACITY: int = 10;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0220
     * @tc.name testBlockingQueueConstructor022
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=10 and 10-element iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0230
     * @tc.name testBlockingQueueConstructor023
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=1 and single-element iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_ITEM: int = 100;
      const CAPACITY: int = 1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_CAPACITY: int = 1;
      let arr: int[] = [ARRAY_ITEM];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0240
     * @tc.name testBlockingQueueConstructor024
     * @tc.desc Verify LinkedBlockingQueue constructor truncates when capacity=3 and iterable has 10 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const CAPACITY: int = 3;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const EXPECTED_END_ELEMENT: int = 2;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0250
     * @tc.name testBlockingQueueConstructor025
     * @tc.desc Verify LinkedBlockingQueue constructor truncates when capacity=1 and iterable has 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 100;
      const CAPACITY: int = 1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0260
     * @tc.name testBlockingQueueConstructor026
     * @tc.desc Verify LinkedBlockingQueue constructor throws RangeError when capacity=0 with non-empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const CAPACITY: int = 0;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let arr: int[] = [];
        arr.push(ARRAY_VALUE);
        arr.push(ARRAY_VALUE_2);
        arr.push(ARRAY_VALUE_3);
        let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0270
     * @tc.name testBlockingQueueConstructor027
     * @tc.desc Verify LinkedBlockingQueue constructor throws RangeError when capacity=-5 with non-empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const CAPACITY: int = -5;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let arr: int[] = [];
        arr.push(ARRAY_VALUE);
        arr.push(ARRAY_VALUE_2);
        arr.push(ARRAY_VALUE_3);
        let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0280
     * @tc.name testBlockingQueueConstructor028
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=10 and array of 4 elements, verify size=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 0;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 5;
      const ARRAY_VALUE_4: int = 8;
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 4;
      let arr: int[] = [];
      arr.push(ARRAY_VALUE);
      arr.push(ARRAY_VALUE_2);
      arr.push(ARRAY_VALUE_3);
      arr.push(ARRAY_VALUE_4);
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0290
     * @tc.name testBlockingQueueConstructor029
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=2 truncates 4-element dense array to size 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 0;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 5;
      const ARRAY_VALUE_4: int = 8;
      const CAPACITY: int = 2;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const EXPECTED_END_ELEMENT: int = 2;
      let arr: int[] = [];
      arr.push(ARRAY_VALUE);
      arr.push(ARRAY_VALUE_2);
      arr.push(ARRAY_VALUE_3);
      arr.push(ARRAY_VALUE_4);
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0300
     * @tc.name testBlockingQueueConstructor030
     * @tc.desc Verify LinkedBlockingQueue constructor with capacity=Int.MAX_VALUE and empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2147483647;
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 2147483647;
      let arr: int[] = [];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0310
     * @tc.name testBlockingQueueConstructor031
     * @tc.desc Verify ArrayBlockingQueue constructor with capacity=1 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      const EXPECTED_CAPACITY: int = 1;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0320
     * @tc.name testBlockingQueueConstructor032
     * @tc.desc Verify ArrayBlockingQueue constructor with capacity=10 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0330
     * @tc.name testBlockingQueueConstructor033
     * @tc.desc Verify ArrayBlockingQueue constructor with capacity=1000 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1000;
      const EXPECTED_CAPACITY: int = 1000;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0340
     * @tc.name testBlockingQueueConstructor034
     * @tc.desc Verify ArrayBlockingQueue constructor throws RangeError when capacity=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 0;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0350
     * @tc.name testBlockingQueueConstructor035
     * @tc.desc Verify ArrayBlockingQueue constructor throws RangeError when capacity=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -1;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0360
     * @tc.name testBlockingQueueConstructor036
     * @tc.desc Verify ArrayBlockingQueue constructor throws RangeError when capacity=Int.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = -2147483648;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0370
     * @tc.name testBlockingQueueConstructor037
     * @tc.desc Verify ArrayBlockingQueue<string> constructor with capacity=10 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0380
     * @tc.name testBlockingQueueConstructor038
     * @tc.desc Verify ArrayBlockingQueue<boolean> constructor with capacity=10 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0390
     * @tc.name testBlockingQueueConstructor039
     * @tc.desc Verify ArrayBlockingQueue<CustomClass> constructor with capacity=10 creates queue correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 0;
      let queue: containers.BlockingQueue<CustomObject042> = new containers.ArrayBlockingQueue<CustomObject042>(CAPACITY);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0400
     * @tc.name testBlockingQueueConstructor040
     * @tc.desc Verify ArrayBlockingQueue constructor with capacity=200 and Set(10) iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const CAPACITY: int = 200;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_CAPACITY: int = 200;
      let set: Set<number> = new Set<number>();
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        set.add(i);
      }
      let queue: containers.BlockingQueue<number> = new containers.ArrayBlockingQueue<number>(CAPACITY, set);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0410
     * @tc.name testBlockingQueueConstructor041
     * @tc.desc Verify ArrayBlockingQueue constructor with capacity=10 and 10-element array iterable fills completely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 10;
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_CAPACITY: int = 10;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0420
     * @tc.name testBlockingQueueConstructor042
     * @tc.desc Verify ArrayBlockingQueue constructor with capacity=1 and single-element iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_ITEM: int = 100;
      const CAPACITY: int = 1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_CAPACITY: int = 1;
      let arr: int[] = [ARRAY_ITEM];
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0430
     * @tc.name testBlockingQueueConstructor043
     * @tc.desc Verify ArrayBlockingQueue constructor truncates when capacity=5 and iterable has 20 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 20;
      const CAPACITY: int = 5;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      const EXPECTED_END_ELEMENT: int = 4;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0440
     * @tc.name testBlockingQueueConstructor044
     * @tc.desc Verify ArrayBlockingQueue constructor truncates when capacity=1 and iterable has 50 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_BOUND: int = 50;
      const CAPACITY: int = 1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_ELEMENT: int = 0;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_BOUND; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0450
     * @tc.name testBlockingQueueConstructor045
     * @tc.desc Verify ArrayBlockingQueue constructor throws RangeError when capacity=0 with non-empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const CAPACITY: int = 0;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let arr: int[] = [];
        arr.push(ARRAY_VALUE);
        arr.push(ARRAY_VALUE_2);
        arr.push(ARRAY_VALUE_3);
        let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0460
     * @tc.name testBlockingQueueConstructor046
     * @tc.desc Verify ArrayBlockingQueue constructor throws RangeError when capacity=-10 with non-empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const CAPACITY: int = -10;
      const EXPECTED_ERROR_NAME: string = 'RangeError';
      try {
        let arr: int[] = [];
        arr.push(ARRAY_VALUE);
        arr.push(ARRAY_VALUE_2);
        arr.push(ARRAY_VALUE_3);
        let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual(EXPECTED_ERROR_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0470
     * @tc.name testBlockingQueueConstructor047
     * @tc.desc Verify ArrayBlockingQueue constructor with array of 4 elements, verify size=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 0;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 5;
      const ARRAY_VALUE_4: int = 8;
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 4;
      let arr: int[] = [];
      arr.push(ARRAY_VALUE);
      arr.push(ARRAY_VALUE_2);
      arr.push(ARRAY_VALUE_3);
      arr.push(ARRAY_VALUE_4);
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0480
     * @tc.name testBlockingQueueConstructor048
     * @tc.desc Verify ArrayBlockingQueue constructor with Array.values() iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_ITEM: int = 1;
      const ARRAY_ITEM_2: int = 2;
      const ARRAY_ITEM_3: int = 3;
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 3;
      let arr: int[] = [ARRAY_ITEM, ARRAY_ITEM_2, ARRAY_ITEM_3];
      let iter = arr.values();
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, iter);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0490
     * @tc.name testBlockingQueueConstructor049
     * @tc.desc Verify ArrayBlockingQueue capacity-only constructor reports remainingCapacity equal to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.remainingCapacity()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0500
     * @tc.name testBlockingQueueConstructor050
     * @tc.desc Verify ArrayBlockingQueue capacity=1 reports remainingCapacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      expect(q.remainingCapacity()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0510
     * @tc.name testBlockingQueueConstructor051
     * @tc.desc Verify ArrayBlockingQueue capacity=2 minimal multi-element capacity constructs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      expect(q.capacity).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0520
     * @tc.name testBlockingQueueConstructor052
     * @tc.desc Verify ArrayBlockingQueue capacity=100 constructs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(100);
      expect(q.capacity).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0530
     * @tc.name testBlockingQueueConstructor053
     * @tc.desc Verify ArrayBlockingQueue capacity=200 reports remainingCapacity 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(200);
      expect(q.remainingCapacity()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0540
     * @tc.name testBlockingQueueConstructor054
     * @tc.desc Verify ArrayBlockingQueue capacity=1024 power-of-two capacity constructs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1024);
      expect(q.capacity).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0550
     * @tc.name testBlockingQueueConstructor055
     * @tc.desc Verify ArrayBlockingQueue capacity=65536 large capacity constructs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(65536);
      expect(q.capacity).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0560
     * @tc.name testBlockingQueueConstructor056
     * @tc.desc Verify ArrayBlockingQueue capacity hex literal 0xA constructs with capacity 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0xA);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0570
     * @tc.name testBlockingQueueConstructor057
     * @tc.desc Verify ArrayBlockingQueue capacity octal literal 0o12 constructs with capacity 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0o12);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0580
     * @tc.name testBlockingQueueConstructor058
     * @tc.desc Verify ArrayBlockingQueue capacity binary literal 0b1010 constructs with capacity 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0b1010);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0590
     * @tc.name testBlockingQueueConstructor059
     * @tc.desc Verify ArrayBlockingQueue capacity decimal literal 1000 constructs with capacity 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1000);
      expect(q.capacity).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0600
     * @tc.name testBlockingQueueConstructor060
     * @tc.desc Verify ArrayBlockingQueue capacity arithmetic expression (5+5) constructs with capacity 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5 + 5);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0610
     * @tc.name testBlockingQueueConstructor061
     * @tc.desc Verify ArrayBlockingQueue capacity shift expression (1<<4) constructs with capacity 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1 << 4);
      expect(q.capacity).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0620
     * @tc.name testBlockingQueueConstructor062
     * @tc.desc Verify ArrayBlockingQueue capacity from variable constructs with capacity 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cap: int = 32;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(cap);
      expect(q.capacity).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0630
     * @tc.name testBlockingQueueConstructor063
     * @tc.desc Verify ArrayBlockingQueue<number> capacity=50 constructs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(50);
      expect(q.capacity).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0640
     * @tc.name testBlockingQueueConstructor064
     * @tc.desc Verify ArrayBlockingQueue<string> capacity=8 reports remainingCapacity 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(8);
      expect(q.remainingCapacity()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0650
     * @tc.name testBlockingQueueConstructor065
     * @tc.desc Verify ArrayBlockingQueue capacity is 10 for a capacity-10 queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0660
     * @tc.name testBlockingQueueConstructor066
     * @tc.desc Verify ArrayBlockingQueue size is 0 for an empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0670
     * @tc.name testBlockingQueueConstructor067
     * @tc.desc Verify ArrayBlockingQueue empty queue poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0680
     * @tc.name testBlockingQueueConstructor068
     * @tc.desc Verify ArrayBlockingQueue empty queue getFirst returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.getFirst()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0690
     * @tc.name testBlockingQueueConstructor069
     * @tc.desc Verify ArrayBlockingQueue empty queue getEnd returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0700
     * @tc.name testBlockingQueueConstructor070
     * @tc.desc Verify ArrayBlockingQueue push one element makes size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(5);
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0710
     * @tc.name testBlockingQueueConstructor071
     * @tc.desc Verify ArrayBlockingQueue push one element decreases remainingCapacity by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(5);
      expect(q.remainingCapacity()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0720
     * @tc.name testBlockingQueueConstructor072
     * @tc.desc Verify ArrayBlockingQueue push then poll returns pushed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 42;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(TEST_VALUE);
      expect(q.poll()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0730
     * @tc.name testBlockingQueueConstructor073
     * @tc.desc Verify ArrayBlockingQueue push int min value then poll returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const BOUNDARY_VALUE: int = -2147483648;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(BOUNDARY_VALUE);
      expect(q.poll()).assertEqual(BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0740
     * @tc.name testBlockingQueueConstructor074
     * @tc.desc Verify ArrayBlockingQueue push elements FIFO order poll returns first pushed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.poll()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0750
     * @tc.name testBlockingQueueConstructor075
     * @tc.desc Verify ArrayBlockingQueue filled to capacity has size equal capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(TEST_VALUE);
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0760
     * @tc.name testBlockingQueueConstructor076
     * @tc.desc Verify ArrayBlockingQueue filled to capacity has remainingCapacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0770
     * @tc.name testBlockingQueueConstructor077
     * @tc.desc Verify ArrayBlockingQueue add returns false when queue is full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      expect(q.add(3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0780
     * @tc.name testBlockingQueueConstructor078
     * @tc.desc Verify ArrayBlockingQueue add returns true when queue not full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      expect(q.add(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0790
     * @tc.name testBlockingQueueConstructor079
     * @tc.desc Verify ArrayBlockingQueue add returns true when not full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      expect(q.add(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0800
     * @tc.name testBlockingQueueConstructor080
     * @tc.desc Verify ArrayBlockingQueue<number> push float then poll returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(3.14);
      expect(q.poll()).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0810
     * @tc.name testBlockingQueueConstructor081
     * @tc.desc Verify ArrayBlockingQueue<string> push string then poll returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(10);
      q.push('hello');
      expect(q.poll()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0820
     * @tc.name testBlockingQueueConstructor082
     * @tc.desc Verify ArrayBlockingQueue capacity=0 construction throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0830
     * @tc.name testBlockingQueueConstructor083
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable Set size equals Set element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<int> = new Set<int>([1, 2, 3, 4]);
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, set);
      expect(q.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0840
     * @tc.name testBlockingQueueConstructor084
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable single element Array poll returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, [42]);
      expect(q.poll()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0850
     * @tc.name testBlockingQueueConstructor085
     * @tc.desc Verify ArrayBlockingQueue capacity > element count reports correct remainingCapacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, [1, 2, 3]);
      expect(q.remainingCapacity()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0860
     * @tc.name testBlockingQueueConstructor086
     * @tc.desc Verify ArrayBlockingQueue capacity == element count fills exactly remainingCapacity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, [1, 2, 3]);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0870
     * @tc.name testBlockingQueueConstructor087
     * @tc.desc Verify ArrayBlockingQueue capacity < element count truncates keeping first capacity elements poll first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2, [11, 22, 33, 44]);
      expect(q.poll()).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0880
     * @tc.name testBlockingQueueConstructor088
     * @tc.desc Verify ArrayBlockingQueue capacity < element count truncates getEnd returns capacity-th element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, [1, 2, 3, 4, 5]);
      expect(q.getEnd()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0890
     * @tc.name testBlockingQueueConstructor089
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable initializes size=2 and capacity=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_CAPACITY: int = 10;
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, [1, 2]);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0900
     * @tc.name testBlockingQueueConstructor090
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable isEmpty returns false for non-empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, [1]);
      expect(q.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0910
     * @tc.name testBlockingQueueConstructor091
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable getEnd returns last valid element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, [10, 20, 30]);
      expect(q.getEnd()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0920
     * @tc.name testBlockingQueueConstructor092
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable does not modify source Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, arr);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0930
     * @tc.name testBlockingQueueConstructor093
     * @tc.desc Verify ArrayBlockingQueue capacity == element count fill then add returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, [1, 2, 3]);
      expect(q.add(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0940
     * @tc.name testBlockingQueueConstructor094
     * @tc.desc Verify ArrayBlockingQueue capacity > element count still allows add returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5, [1, 2]);
      expect(q.add(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0950
     * @tc.name testBlockingQueueConstructor095
     * @tc.desc Verify ArrayBlockingQueue capacity=0 with non-empty iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0, [1, 2]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0960
     * @tc.name testBlockingQueueConstructor096
     * @tc.desc Verify ArrayBlockingQueue capacity=-1 with iterable throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(-1, [5]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0970
     * @tc.name testBlockingQueueConstructor097
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable empty Array isEmpty returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, arr);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0980
     * @tc.name testBlockingQueueConstructor098
     * @tc.desc Verify ArrayBlockingQueue<number> capacity+iterable float Array poll returns first float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10, [1.5, 2.5]);
      expect(q.poll()).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_0990
     * @tc.name testBlockingQueueConstructor099
     * @tc.desc Verify ArrayBlockingQueue<string> capacity+iterable string Array poll returns first string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(10, ['a', 'b']);
      expect(q.poll()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1000
     * @tc.name testBlockingQueueConstructor100
     * @tc.desc Verify ArrayBlockingQueue capacity+iterable Set source does not modify source Set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<int> = new Set<int>([1, 2, 3]);
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10, set);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1010
     * @tc.name testBlockingQueueConstructor101
     * @tc.desc Verify LinkedBlockingQueue default constructor remainingCapacity equals Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.remainingCapacity()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1020
     * @tc.name testBlockingQueueConstructor102
     * @tc.desc Verify LinkedBlockingQueue default constructor empty queue poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1030
     * @tc.name testBlockingQueueConstructor103
     * @tc.desc Verify LinkedBlockingQueue default constructor empty queue getFirst returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.getFirst()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1040
     * @tc.name testBlockingQueueConstructor104
     * @tc.desc Verify LinkedBlockingQueue default constructor empty queue getEnd returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.getEnd()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1050
     * @tc.name testBlockingQueueConstructor105
     * @tc.desc Verify LinkedBlockingQueue default constructor push element then getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 99;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(TEST_VALUE);
      expect(q.getFirst()).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1060
     * @tc.name testBlockingQueueConstructor106
     * @tc.desc Verify LinkedBlockingQueue zero-arg constructor yields size=0 and default capacity 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 2147483647;
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1070
     * @tc.name testBlockingQueueConstructor107
     * @tc.desc Verify LinkedBlockingQueue iterable constructor capacity is Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.capacity).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1080
     * @tc.name testBlockingQueueConstructor108
     * @tc.desc Verify LinkedBlockingQueue iterable constructor remainingCapacity equals capacity minus element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.remainingCapacity()).assertEqual(2147483644);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1090
     * @tc.name testBlockingQueueConstructor109
     * @tc.desc Verify LinkedBlockingQueue iterable constructor FIFO poll returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [100, 200, 300];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.poll()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1100
     * @tc.name testBlockingQueueConstructor110
     * @tc.desc Verify LinkedBlockingQueue iterable constructor getEnd returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [10, 20, 30];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.getEnd()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1110
     * @tc.name testBlockingQueueConstructor111
     * @tc.desc Verify LinkedBlockingQueue iterable hex literal element 0x7fffffff entered correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [0x7fffffff];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.getFirst()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1120
     * @tc.name testBlockingQueueConstructor112
     * @tc.desc Verify LinkedBlockingQueue iterable octal literal element 0o777 entered correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [0o777];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.getFirst()).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1130
     * @tc.name testBlockingQueueConstructor113
     * @tc.desc Verify LinkedBlockingQueue iterable binary literal element 0b1010 entered correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [0b1010];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.getFirst()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1140
     * @tc.name testBlockingQueueConstructor114
     * @tc.desc Verify LinkedBlockingQueue iterable Set.values iterator source size correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(11);
      s.add(22);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(s.values());
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1150
     * @tc.name testBlockingQueueConstructor115
     * @tc.desc Verify LinkedBlockingQueue iterable construction does not modify source Set when later mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 2;
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(TEST_VALUE);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(s);
      s.add(3);
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1160
     * @tc.name testBlockingQueueConstructor116
     * @tc.desc Verify LinkedBlockingQueue capacity constructor remainingCapacity equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      expect(q.remainingCapacity()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1170
     * @tc.name testBlockingQueueConstructor117
     * @tc.desc Verify LinkedBlockingQueue capacity hex literal 0x10 constructs with capacity 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0x10);
      expect(q.capacity).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1180
     * @tc.name testBlockingQueueConstructor118
     * @tc.desc Verify LinkedBlockingQueue capacity=1 add until full then add returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.add(1);
      expect(q.add(2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1190
     * @tc.name testBlockingQueueConstructor119
     * @tc.desc Verify LinkedBlockingQueue capacity=1 add one element returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      expect(q.add(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1200
     * @tc.name testBlockingQueueConstructor120
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable pop returns single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.pop()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1210
     * @tc.name testBlockingQueueConstructor121
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable multi-element FIFO pop order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.pop()).assertEqual(10);
      expect(q.pop()).assertEqual(20);
      expect(q.pop()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1220
     * @tc.name testBlockingQueueConstructor122
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable getEnd returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3, 4, 5];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.getEnd()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1230
     * @tc.name testBlockingQueueConstructor123
     * @tc.desc Verify LinkedBlockingQueue capacity == element count fill then add returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3, src);
      expect(q.add(4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1240
     * @tc.name testBlockingQueueConstructor124
     * @tc.desc Verify LinkedBlockingQueue capacity > element count remainingCapacity correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.remainingCapacity()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1250
     * @tc.name testBlockingQueueConstructor125
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable Set source size equals dedup count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEST_VALUE: int = 3;
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(TEST_VALUE);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(q.size).assertEqual(TEST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1260
     * @tc.name testBlockingQueueConstructor126
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable Array.values source size correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [5, 6, 7];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, arr.values());
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1270
     * @tc.name testBlockingQueueConstructor127
     * @tc.desc Verify LinkedBlockingQueue<number> capacity+iterable float source first element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.5, 2.5];
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10, src);
      expect(q.getFirst()).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1280
     * @tc.name testBlockingQueueConstructor128
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable source Array not modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1290
     * @tc.name testBlockingQueueConstructor129
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable queue independent of source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      src.push(4);
      expect(q.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1300
     * @tc.name testBlockingQueueConstructor130
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable empty iterable poll returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5, src);
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1310
     * @tc.name testBlockingQueueConstructor131
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable throws RangeError when capacity=0 with empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src: Array<int> = [];
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1320
     * @tc.name testBlockingQueueConstructor132
     * @tc.desc Verify LinkedBlockingQueue capacity+iterable throws RangeError when capacity=-1 with iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let src: Array<int> = [1, 2];
        let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-1, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1330
     * @tc.name testBlockingQueueConstructor133
     * @tc.desc Verify LinkedBlockingQueue single int dispatches to capacity overload not iterable overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(7);
      expect(q.capacity).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1340
     * @tc.name testBlockingQueueConstructor134
     * @tc.desc Verify LinkedBlockingQueue empty Array iterable overload keeps default capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q.capacity).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1350
     * @tc.name testBlockingQueueConstructor135
     * @tc.desc Verify LinkedBlockingQueue single Set dispatches to iterable overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<int> = new Set<int>();
      set.add(11);
      set.add(22);
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(set);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1360
     * @tc.name testBlockingQueueConstructor136
     * @tc.desc Verify LinkedBlockingQueue two-arg overload capacity comes from first param independent of element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(50, src);
      expect(q.capacity).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1370
     * @tc.name testBlockingQueueConstructor137
     * @tc.desc Verify LinkedBlockingQueue zero-arg and iterable overload share default capacity Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1];
      let q0: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let qi: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      expect(q0.capacity).assertEqual(qi.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1380
     * @tc.name testBlockingQueueConstructor138
     * @tc.desc Verify LinkedBlockingQueue iterable and two-arg overload produce same first element from same source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [88, 99];
      let qi: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      let qci: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(qi.getFirst()).assertEqual(qci.getFirst());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1390
     * @tc.name testBlockingQueueConstructor139
     * @tc.desc Verify LinkedBlockingQueue iterable and two-arg overload produce same last element from same source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [12, 34, 56];
      let qi: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      let qci: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, src);
      expect(qi.getEnd()).assertEqual(qci.getEnd());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1400
     * @tc.name testBlockingQueueConstructor140
     * @tc.desc Verify LinkedBlockingQueue iterable and two-arg overload share same first pop from same source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let qi: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      let qci: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5, src);
      expect(qi.pop()).assertEqual(qci.pop());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1410
     * @tc.name testBlockingQueueConstructor141
     * @tc.desc Verify LinkedBlockingQueue zero-arg and capacity overload push then pop yield same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q0: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let qc: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q0.push(42);
      qc.push(42);
      expect(q0.pop()).assertEqual(qc.pop());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1420
     * @tc.name testBlockingQueueConstructor142
     * @tc.desc Verify LinkedBlockingQueue invalid capacity throws RangeError without affecting existing valid instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valid: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      try {
        let bad: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(valid.capacity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1430
     * @tc.name testBlockingQueueConstructor143
     * @tc.desc Verify LinkedBlockingQueue two-arg invalid capacity throws RangeError preserving prior iterable instance size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let valid: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      try {
        let bad: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-1, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(valid.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1440
     * @tc.name testBlockingQueueConstructor144
     * @tc.desc Verify LinkedBlockingQueue after RangeError a subsequent valid construction succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let ok: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      expect(ok.capacity).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1450
     * @tc.name testBlockingQueueConstructor145
     * @tc.desc Verify LinkedBlockingQueue two-arg construction does not deep-modify source on later element change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5, src);
      src[0] = 999;
      expect(q.getFirst()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1460
     * @tc.name testBlockingQueueConstructor146
     * @tc.desc Verify LinkedBlockingQueue two instances from same source are independent on pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let qa: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      let qb: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      qa.pop();
      expect(qb.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1470
     * @tc.name testBlockingQueueConstructor147
     * @tc.desc Verify LinkedBlockingQueue alias reference shares state push reflected via alias size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let alias: containers.LinkedBlockingQueue<int> = q;
      q.push(1);
      expect(alias.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_CONSTRUCTOR_1480
     * @tc.name testBlockingQueueConstructor148
     * @tc.desc Verify LinkedBlockingQueue alias pop affects original instance getFirst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueConstructor148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [7, 8, 9];
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(src);
      let alias: containers.LinkedBlockingQueue<int> = q;
      alias.pop();
      expect(q.getFirst()).assertEqual(8);
    });
  });
}
