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

class CustomObject013 {
  name: string = "";
  value: int = 0;

  constructor(name: string, value: int) {
    this.name = name;
    this.value = value;
  }
}

class CustomObject014 {
  stringProp: string | null = null;
  intProp: int = 0;

  constructor(stringProp: string | null, intProp: int) {
    this.stringProp = stringProp;
    this.intProp = intProp;
  }
}

class CustomObject022 {
  name: string = "";

  constructor(name: string) {
    this.name = name;
  }
}

export default function BlockingQueueAddTest(): void {
  describe('BlockingQueueAddTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0100
     * @tc.name testBlockingQueueAdd001
     * @tc.desc Verify LinkedBlockingQueue add(0) returns true and size becomes 1 for int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 0;
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0200
     * @tc.name testBlockingQueueAdd002
     * @tc.desc Verify LinkedBlockingQueue add(100) returns true and element is placed at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 100;
      const EXPECTED_END_VALUE: int = 100;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0300
     * @tc.name testBlockingQueueAdd003
     * @tc.desc Verify LinkedBlockingQueue add(2147483647) Int.MAX_VALUE returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 2147483647;
      const EXPECTED_END_VALUE: int = 2147483647;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0400
     * @tc.name testBlockingQueueAdd004
     * @tc.desc Verify LinkedBlockingQueue add(-2147483648) Int.MIN_VALUE returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = -2147483648;
      const EXPECTED_END_VALUE: int = -2147483648;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0500
     * @tc.name testBlockingQueueAdd005
     * @tc.desc Verify LinkedBlockingQueue add(4660) which is 0x1234 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 4660;
      const EXPECTED_END_VALUE: int = 4660;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0600
     * @tc.name testBlockingQueueAdd006
     * @tc.desc Verify LinkedBlockingQueue add(83) which is 0o123 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 83;
      const EXPECTED_END_VALUE: int = 83;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0700
     * @tc.name testBlockingQueueAdd007
     * @tc.desc Verify LinkedBlockingQueue add(10) which is 0b1010 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 10;
      const EXPECTED_END_VALUE: int = 10;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0800
     * @tc.name testBlockingQueueAdd008
     * @tc.desc Verify LinkedBlockingQueue add("hello") returns true for string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: string = "hello";
      const EXPECTED_STRING: string = "hello";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.getEnd()).assertEqual(EXPECTED_STRING);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_0900
     * @tc.name testBlockingQueueAdd009
     * @tc.desc Verify LinkedBlockingQueue add("") empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EMPTY_STRING: string = "";
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let result: boolean = queue.add(EMPTY_STRING);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1000
     * @tc.name testBlockingQueueAdd010
     * @tc.desc Verify LinkedBlockingQueue add zero-width space character returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: string = "​";
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1100
     * @tc.name testBlockingQueueAdd011
     * @tc.desc Verify LinkedBlockingQueue add of 10000-character string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EMPTY_STRING: string = "";
      const LOOP_START: int = 0;
      const LOOP_END: int = 10000;
      const STRING_VALUE: string = "a";
      const EXPECTED_SIZE: int = 1;
      let longStr: string = EMPTY_STRING;
      for (let i = LOOP_START; i < LOOP_END; i++) {
        longStr += STRING_VALUE;
      }
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let result: boolean = queue.add(longStr);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1200
     * @tc.name testBlockingQueueAdd012
     * @tc.desc Verify LinkedBlockingQueue add(true) and add(false) both return true for boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: boolean = true;
      const ADD_VALUE_2: boolean = false;
      const EXPECTED_SIZE: int = 2;
      let queue: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      let r1: boolean = queue.add(ADD_VALUE);
      let r2: boolean = queue.add(ADD_VALUE_2);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1300
     * @tc.name testBlockingQueueAdd013
     * @tc.desc Verify LinkedBlockingQueue add of custom object returns true and getFirst returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_NAME: string = "testObject";
      const OBJECT_VALUE: int = 42;
      let obj: CustomObject013 = new CustomObject013(OBJECT_NAME, OBJECT_VALUE);
      let queue: containers.BlockingQueue<CustomObject013> = new containers.LinkedBlockingQueue<CustomObject013>();
      let result: boolean = queue.add(obj);
      expect(result).assertTrue();
      expect(queue.getFirst()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1400
     * @tc.name testBlockingQueueAdd014
     * @tc.desc Verify LinkedBlockingQueue add of custom object with null property returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_VALUE: int = 100;
      const EXPECTED_SIZE: int = 1;
      let obj: CustomObject014 = new CustomObject014(null, OBJECT_VALUE);
      let queue: containers.BlockingQueue<CustomObject014> = new containers.LinkedBlockingQueue<CustomObject014>();
      let result: boolean = queue.add(obj);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1500
     * @tc.name testBlockingQueueAdd015
     * @tc.desc Verify LinkedBlockingQueue add of 100 elements continuously all return true and size becomes 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 100;
      const EXPECTED_SIZE: int = 100;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i = LOOP_START; i < LOOP_END; i++) {
        let result: boolean = queue.add(i);
        expect(result).assertTrue();
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1600
     * @tc.name testBlockingQueueAdd016
     * @tc.desc Verify LinkedBlockingQueue with capacity=3 add first element returns true and size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 10;
      const EXPECTED_SIZE: int = 1;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1700
     * @tc.name testBlockingQueueAdd017
     * @tc.desc Verify LinkedBlockingQueue with capacity=3 add second element returns true and size=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 10;
      const ADD_VALUE_2: int = 20;
      const EXPECTED_SIZE: int = 2;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.add(ADD_VALUE);
      let result: boolean = queue.add(ADD_VALUE_2);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1800
     * @tc.name testBlockingQueueAdd018
     * @tc.desc Verify LinkedBlockingQueue with capacity=3 add third element fills queue and remainingCapacity=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 10;
      const ADD_VALUE_2: int = 20;
      const ADD_VALUE_3: int = 30;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.add(ADD_VALUE);
      queue.add(ADD_VALUE_2);
      let result: boolean = queue.add(ADD_VALUE_3);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_1900
     * @tc.name testBlockingQueueAdd019
     * @tc.desc Verify LinkedBlockingQueue with capacity=3 full returns false when adding fourth element and size remains 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 10;
      const ADD_VALUE_2: int = 20;
      const ADD_VALUE_3: int = 30;
      const ADD_VALUE_4: int = 40;
      const EXPECTED_SIZE: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.add(ADD_VALUE);
      queue.add(ADD_VALUE_2);
      queue.add(ADD_VALUE_3);
      let result: boolean = queue.add(ADD_VALUE_4);
      expect(result).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2000
     * @tc.name testBlockingQueueAdd020
     * @tc.desc Verify LinkedBlockingQueue capacity=3 after pop and add returns true and size remains 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 10;
      const ADD_VALUE_2: int = 20;
      const ADD_VALUE_3: int = 30;
      const ADD_VALUE_4: int = 40;
      const EXPECTED_SIZE: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      queue.add(ADD_VALUE);
      queue.add(ADD_VALUE_2);
      queue.add(ADD_VALUE_3);
      queue.pop();
      let result: boolean = queue.add(ADD_VALUE_4);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2100
     * @tc.name testBlockingQueueAdd021
     * @tc.desc Verify LinkedBlockingQueue<string> with capacity=2 first two adds succeed and third returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2;
      const ADD_VALUE: string = "a";
      const ADD_VALUE_2: string = "b";
      const ADD_VALUE_3: string = "c";
      let queue: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(CAPACITY);
      let r1: boolean = queue.add(ADD_VALUE);
      let r2: boolean = queue.add(ADD_VALUE_2);
      let r3: boolean = queue.add(ADD_VALUE_3);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2200
     * @tc.name testBlockingQueueAdd022
     * @tc.desc Verify LinkedBlockingQueue<CustomObject022> with capacity=1 add first succeeds and second returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const OBJECT_NAME: string = "first";
      const OBJECT_NAME_2: string = "second";
      const CAPACITY: int = 1;
      let obj1: CustomObject022 = new CustomObject022(OBJECT_NAME);
      let obj2: CustomObject022 = new CustomObject022(OBJECT_NAME_2);
      let queue: containers.BlockingQueue<CustomObject022> = new containers.LinkedBlockingQueue<CustomObject022>(CAPACITY);
      let r1: boolean = queue.add(obj1);
      let r2: boolean = queue.add(obj2);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2300
     * @tc.name testBlockingQueueAdd023
     * @tc.desc Verify LinkedBlockingQueue initialized with 3-element array then add extra element returns true and size=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const ADD_VALUE: int = 4;
      const EXPECTED_SIZE: int = 4;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertTrue();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2400
     * @tc.name testBlockingQueueAdd024
     * @tc.desc Verify LinkedBlockingQueue capacity=3 with 3 pre-filled elements add returns false and size stays 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 4;
      const EXPECTED_SIZE: int = 3;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2500
     * @tc.name testBlockingQueueAdd025
     * @tc.desc Verify LinkedBlockingQueue capacity=3 with 2 pre-filled elements add third succeeds then add fourth fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 3;
      const ADD_VALUE_2: int = 4;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2];
      let queue: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      let r1: boolean = queue.add(ADD_VALUE);
      let r2: boolean = queue.add(ADD_VALUE_2);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2600
     * @tc.name testBlockingQueueAdd026
     * @tc.desc Verify ArrayBlockingQueue<int> capacity=3 add 4th element returns false and size stays 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const ADD_VALUE: int = 1;
      const ADD_VALUE_2: int = 2;
      const ADD_VALUE_3: int = 3;
      const ADD_VALUE_4: int = 4;
      const EXPECTED_SIZE: int = 3;
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      queue.add(ADD_VALUE);
      queue.add(ADD_VALUE_2);
      queue.add(ADD_VALUE_3);
      let result: boolean = queue.add(ADD_VALUE_4);
      expect(result).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2700
     * @tc.name testBlockingQueueAdd027
     * @tc.desc Verify ArrayBlockingQueue<string> capacity=2 first two adds succeed and third returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueAdd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const ADD_VALUE: string = "a";
      const ADD_VALUE_2: string = "b";
      const ADD_VALUE_3: string = "c";
      let queue: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY);
      let r1: boolean = queue.add(ADD_VALUE);
      let r2: boolean = queue.add(ADD_VALUE_2);
      let r3: boolean = queue.add(ADD_VALUE_3);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2800
     * @tc.name testBlockingQueueAdd028
     * @tc.desc Verify ArrayBlockingQueue<int> capacity=5 with 5 pre-filled elements add returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LOOP_START: int = 0;
      const LOOP_END: int = 5;
      const CAPACITY: int = 5;
      const ADD_VALUE: int = 100;
      const EXPECTED_SIZE: int = 5;
      let arr: int[] = [];
      for (let i = LOOP_START; i < LOOP_END; i++) {
        arr.push(i);
      }
      let queue: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      let result: boolean = queue.add(ADD_VALUE);
      expect(result).assertFalse();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_2900
     * @tc.name testBlockingQueueAdd029
     * @tc.desc Verify ArrayBlockingQueue add(1) single int arity returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let r: boolean = q.add(1);
      expect(typeof r).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3000
     * @tc.name testBlockingQueueAdd030
     * @tc.desc Verify ArrayBlockingQueue add(7) on unfilled queue returns true and size becomes 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let r: boolean = q.add(7);
      expect(r).assertTrue();
      expect(q.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3100
     * @tc.name testBlockingQueueAdd031
     * @tc.desc Verify LinkedBlockingQueue add element=0 then poll returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(0);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3200
     * @tc.name testBlockingQueueAdd032
     * @tc.desc Verify LinkedBlockingQueue add element=-1 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r: boolean = q.add(-1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3300
     * @tc.name testBlockingQueueAdd033
     * @tc.desc Verify LinkedBlockingQueue add element=-1 then poll returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(-1);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3400
     * @tc.name testBlockingQueueAdd034
     * @tc.desc Verify LinkedBlockingQueue add Int.MAX_VALUE then poll returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(2147483647);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3500
     * @tc.name testBlockingQueueAdd035
     * @tc.desc Verify LinkedBlockingQueue add Int.MIN_VALUE then poll returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(-2147483648);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3600
     * @tc.name testBlockingQueueAdd036
     * @tc.desc Verify LinkedBlockingQueue add element=2147483646 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r: boolean = q.add(2147483646);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3700
     * @tc.name testBlockingQueueAdd037
     * @tc.desc Verify LinkedBlockingQueue add element=2147483646 then poll returns 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(2147483646);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3800
     * @tc.name testBlockingQueueAdd038
     * @tc.desc Verify LinkedBlockingQueue add element=-2147483647 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r: boolean = q.add(-2147483647);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_3900
     * @tc.name testBlockingQueueAdd039
     * @tc.desc Verify LinkedBlockingQueue add element=-2147483647 then poll returns -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(-2147483647);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4000
     * @tc.name testBlockingQueueAdd040
     * @tc.desc Verify LinkedBlockingQueue add element=100 then poll returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(100);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4100
     * @tc.name testBlockingQueueAdd041
     * @tc.desc Verify LinkedBlockingQueue add element=-100 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r: boolean = q.add(-100);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4200
     * @tc.name testBlockingQueueAdd042
     * @tc.desc Verify LinkedBlockingQueue add element=-100 then poll returns -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(-100);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4300
     * @tc.name testBlockingQueueAdd043
     * @tc.desc Verify LinkedBlockingQueue add hex literal 0x7fffffff then poll returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(0x7fffffff);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4400
     * @tc.name testBlockingQueueAdd044
     * @tc.desc Verify LinkedBlockingQueue add hex literal 0xff then poll returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(0xff);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4500
     * @tc.name testBlockingQueueAdd045
     * @tc.desc Verify LinkedBlockingQueue add octal literal 0o17 then poll returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(0o17);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4600
     * @tc.name testBlockingQueueAdd046
     * @tc.desc Verify LinkedBlockingQueue add binary literal 0b1010 then poll returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(0b1010);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4700
     * @tc.name testBlockingQueueAdd047
     * @tc.desc Verify LinkedBlockingQueue add binary literal 0b0 then poll returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(0b0);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4800
     * @tc.name testBlockingQueueAdd048
     * @tc.desc Verify LinkedBlockingQueue add octal literal 0o0 then poll returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(0o0);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_4900
     * @tc.name testBlockingQueueAdd049
     * @tc.desc Verify LinkedBlockingQueue add hex literal 0x80000000 then poll returns 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(0x80000000);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5000
     * @tc.name testBlockingQueueAdd050
     * @tc.desc Verify LinkedBlockingQueue add scientific notation 1e3 then poll returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(1e3);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5100
     * @tc.name testBlockingQueueAdd051
     * @tc.desc Verify LinkedBlockingQueue add numeric separator literal 2_147_483_647 then poll returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(2_147_483_647);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5200
     * @tc.name testBlockingQueueAdd052
     * @tc.desc Verify LinkedBlockingQueue add float 3.14 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      let r: boolean = q.add(3.14);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5300
     * @tc.name testBlockingQueueAdd053
     * @tc.desc Verify LinkedBlockingQueue add float 3.14 then poll returns 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(3.14);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5400
     * @tc.name testBlockingQueueAdd054
     * @tc.desc Verify LinkedBlockingQueue add float -3.14 then poll returns -3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(-3.14);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(-3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5500
     * @tc.name testBlockingQueueAdd055
     * @tc.desc Verify LinkedBlockingQueue add Number.MAX_SAFE_INTEGER then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(Number.MAX_SAFE_INTEGER);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5600
     * @tc.name testBlockingQueueAdd056
     * @tc.desc Verify LinkedBlockingQueue add Number.MIN_SAFE_INTEGER then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(Number.MIN_SAFE_INTEGER);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5700
     * @tc.name testBlockingQueueAdd057
     * @tc.desc Verify LinkedBlockingQueue add Number.MAX_VALUE then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(Number.MAX_VALUE);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5800
     * @tc.name testBlockingQueueAdd058
     * @tc.desc Verify LinkedBlockingQueue add Number.MIN_VALUE then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(Number.MIN_VALUE);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_5900
     * @tc.name testBlockingQueueAdd059
     * @tc.desc Verify LinkedBlockingQueue add Number.EPSILON then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(Number.EPSILON);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6000
     * @tc.name testBlockingQueueAdd060
     * @tc.desc Verify LinkedBlockingQueue add Infinity returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      let r: boolean = q.add(Number.POSITIVE_INFINITY);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6100
     * @tc.name testBlockingQueueAdd061
     * @tc.desc Verify LinkedBlockingQueue add Infinity then poll returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(Number.POSITIVE_INFINITY);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6200
     * @tc.name testBlockingQueueAdd062
     * @tc.desc Verify LinkedBlockingQueue add -Infinity returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      let r: boolean = q.add(Number.NEGATIVE_INFINITY);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6300
     * @tc.name testBlockingQueueAdd063
     * @tc.desc Verify LinkedBlockingQueue add -Infinity then poll returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(Number.NEGATIVE_INFINITY);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6400
     * @tc.name testBlockingQueueAdd064
     * @tc.desc Verify LinkedBlockingQueue add negative zero returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      let r: boolean = q.add(-0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6500
     * @tc.name testBlockingQueueAdd065
     * @tc.desc Verify LinkedBlockingQueue add negative zero then poll returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(-0);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6600
     * @tc.name testBlockingQueueAdd066
     * @tc.desc Verify LinkedBlockingQueue add float 0.1 then poll returns 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.add(0.1);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6700
     * @tc.name testBlockingQueueAdd067
     * @tc.desc Verify LinkedBlockingQueue add empty string then poll returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.add("");
      let v: string | undefined = q.poll();
      expect(v).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6800
     * @tc.name testBlockingQueueAdd068
     * @tc.desc Verify LinkedBlockingQueue add normal string then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.add("hello");
      let v: string | undefined = q.poll();
      expect(v).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_6900
     * @tc.name testBlockingQueueAdd069
     * @tc.desc Verify LinkedBlockingQueue add Chinese string then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.add("队列测试");
      let v: string | undefined = q.poll();
      expect(v).assertEqual("队列测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7000
     * @tc.name testBlockingQueueAdd070
     * @tc.desc Verify LinkedBlockingQueue add single char string then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.add("a");
      let v: string | undefined = q.poll();
      expect(v).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7100
     * @tc.name testBlockingQueueAdd071
     * @tc.desc Verify LinkedBlockingQueue add boolean true then poll returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(10);
      q.add(true);
      let v: boolean | undefined = q.poll();
      expect(v).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7200
     * @tc.name testBlockingQueueAdd072
     * @tc.desc Verify LinkedBlockingQueue add boolean false then poll returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(10);
      q.add(false);
      let v: boolean | undefined = q.poll();
      expect(v).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7300
     * @tc.name testBlockingQueueAdd073
     * @tc.desc Verify ArrayBlockingQueue add element=0 then poll returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(0);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7400
     * @tc.name testBlockingQueueAdd074
     * @tc.desc Verify ArrayBlockingQueue add element=-1 then poll returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(-1);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7500
     * @tc.name testBlockingQueueAdd075
     * @tc.desc Verify ArrayBlockingQueue add Int.MAX_VALUE then poll returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(2147483647);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7600
     * @tc.name testBlockingQueueAdd076
     * @tc.desc Verify ArrayBlockingQueue add Int.MIN_VALUE then poll returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(-2147483648);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7700
     * @tc.name testBlockingQueueAdd077
     * @tc.desc Verify ArrayBlockingQueue add hex literal 0xff then poll returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(0xff);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7800
     * @tc.name testBlockingQueueAdd078
     * @tc.desc Verify ArrayBlockingQueue add binary literal 0b1111 then poll returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(0b1111);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_7900
     * @tc.name testBlockingQueueAdd079
     * @tc.desc Verify ArrayBlockingQueue add Infinity then poll returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.add(Number.POSITIVE_INFINITY);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8000
     * @tc.name testBlockingQueueAdd080
     * @tc.desc Verify ArrayBlockingQueue add Number.MAX_SAFE_INTEGER then poll returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.add(Number.MAX_SAFE_INTEGER);
      let v: number | undefined = q.poll();
      expect(v).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8100
     * @tc.name testBlockingQueueAdd081
     * @tc.desc Verify LinkedBlockingQueue add returns boolean type via typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r: boolean = q.add(1);
      expect(typeof r).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8200
     * @tc.name testBlockingQueueAdd082
     * @tc.desc Verify LinkedBlockingQueue add on unfilled queue returns value strictly equal true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r: boolean = q.add(42);
      expect(r).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8300
     * @tc.name testBlockingQueueAdd083
     * @tc.desc Verify LinkedBlockingQueue capacity=1 full then add returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.add(1);
      let r: boolean = q.add(2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8400
     * @tc.name testBlockingQueueAdd084
     * @tc.desc Verify LinkedBlockingQueue capacity=1 full then overflow add does not change head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.add(7);
      q.add(8);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8500
     * @tc.name testBlockingQueueAdd085
     * @tc.desc Verify LinkedBlockingQueue full add fails then poll one and add again returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.add(1);
      q.add(2);
      q.poll();
      let r: boolean = q.add(3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8600
     * @tc.name testBlockingQueueAdd086
     * @tc.desc Verify ArrayBlockingQueue capacity=1 full then overflow add does not change head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.add(5);
      q.add(6);
      let v: int | undefined = q.poll();
      expect(v).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8700
     * @tc.name testBlockingQueueAdd087
     * @tc.desc Verify ArrayBlockingQueue capacity=1 first insert returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      let r: boolean = q.add(99);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8800
     * @tc.name testBlockingQueueAdd088
     * @tc.desc Verify ArrayBlockingQueue add returns value strictly equal false when full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      let r: boolean = q.add(3);
      expect(r).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_8900
     * @tc.name testBlockingQueueAdd089
     * @tc.desc Verify ArrayBlockingQueue add result asserted directly with assertFalse when full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.add(9);
      expect(q.add(10)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9000
     * @tc.name testBlockingQueueAdd090
     * @tc.desc Verify ArrayBlockingQueue single add then size increases by 1 relative to before
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      let before = q.size;
      q.add(8);
      expect(q.size - before).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9100
     * @tc.name testBlockingQueueAdd091
     * @tc.desc Verify ArrayBlockingQueue filled then size equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9200
     * @tc.name testBlockingQueueAdd092
     * @tc.desc Verify ArrayBlockingQueue add success keeps capacity property unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(1);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9300
     * @tc.name testBlockingQueueAdd093
     * @tc.desc Verify ArrayBlockingQueue add success decreases remainingCapacity by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(1);
      expect(q.remainingCapacity()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9400
     * @tc.name testBlockingQueueAdd094
     * @tc.desc Verify ArrayBlockingQueue two adds decrease remainingCapacity by 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(1);
      q.add(2);
      expect(q.remainingCapacity()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9500
     * @tc.name testBlockingQueueAdd095
     * @tc.desc Verify ArrayBlockingQueue add success keeps invariant capacity minus size equals remainingCapacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.add(1);
      q.add(2);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9600
     * @tc.name testBlockingQueueAdd096
     * @tc.desc Verify ArrayBlockingQueue add success element readable via getFirst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(55);
      expect(q.getFirst()).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9700
     * @tc.name testBlockingQueueAdd097
     * @tc.desc Verify ArrayBlockingQueue add success element readable via getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(66);
      expect(q.getEnd()).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9800
     * @tc.name testBlockingQueueAdd098
     * @tc.desc Verify ArrayBlockingQueue single element getFirst equals getEnd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(77);
      expect(q.getFirst()).assertEqual(q.getEnd());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_9900
     * @tc.name testBlockingQueueAdd099
     * @tc.desc Verify ArrayBlockingQueue multiple adds then getEnd returns last inserted element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.getEnd()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10000
     * @tc.name testBlockingQueueAdd100
     * @tc.desc Verify ArrayBlockingQueue multiple adds then getFirst returns first inserted element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.getFirst()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10100
     * @tc.name testBlockingQueueAdd101
     * @tc.desc Verify ArrayBlockingQueue add success then pop returns the element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      q.add(88);
      expect(q.pop()).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10200
     * @tc.name testBlockingQueueAdd102
     * @tc.desc Verify ArrayBlockingQueue tail insert 0..4 then first pop returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      for (let i = 0; i < 5; i++) {
        q.add(i);
      }
      expect(q.pop()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10300
     * @tc.name testBlockingQueueAdd103
     * @tc.desc Verify ArrayBlockingQueue tail insert 0..4 then second pop returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      for (let i = 0; i < 5; i++) {
        q.add(i);
      }
      q.pop();
      expect(q.pop()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10400
     * @tc.name testBlockingQueueAdd104
     * @tc.desc Verify ArrayBlockingQueue tail insert then all poll empties queue and size becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.add(1);
      q.add(2);
      q.add(3);
      q.poll();
      q.poll();
      q.poll();
      expect(q.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10500
     * @tc.name testBlockingQueueAdd105
     * @tc.desc Verify ArrayBlockingQueue full add false then head element still earliest element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.getFirst()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10600
     * @tc.name testBlockingQueueAdd106
     * @tc.desc Verify ArrayBlockingQueue full add false then tail element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.getEnd()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10700
     * @tc.name testBlockingQueueAdd107
     * @tc.desc Verify ArrayBlockingQueue rejected overflow element not retrievable by pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(99);
      q.pop();
      expect(q.pop()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10800
     * @tc.name testBlockingQueueAdd108
     * @tc.desc Verify ArrayBlockingQueue overflow then remainingCapacity stays 0 not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_10900
     * @tc.name testBlockingQueueAdd109
     * @tc.desc Verify ArrayBlockingQueue overflow then capacity property unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.add(1);
      q.add(2);
      q.add(3);
      q.add(4);
      expect(q.capacity).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11000
     * @tc.name testBlockingQueueAdd110
     * @tc.desc Verify ArrayBlockingQueue overflow then pop one and add new element returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      q.pop();
      expect(q.add(4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11100
     * @tc.name testBlockingQueueAdd111
     * @tc.desc Verify ArrayBlockingQueue overflow then pop one and add returns size back to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(3);
      q.pop();
      q.add(4);
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11200
     * @tc.name testBlockingQueueAdd112
     * @tc.desc Verify ArrayBlockingQueue rejected element then pop and add new becomes tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(2);
      q.add(1);
      q.add(2);
      q.add(99);
      q.pop();
      q.add(5);
      expect(q.getEnd()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11300
     * @tc.name testBlockingQueueAdd113
     * @tc.desc Verify ArrayBlockingQueue all-same element fill then overflow add returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.add(7);
      q.add(7);
      q.add(7);
      expect(q.add(7)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11400
     * @tc.name testBlockingQueueAdd114
     * @tc.desc Verify LinkedBlockingQueue bounded capacity success then getEnd returns inserted element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.add(33);
      expect(q.getEnd()).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11500
     * @tc.name testBlockingQueueAdd115
     * @tc.desc Verify LinkedBlockingQueue bounded capacity success keeps invariant capacity minus size equals remainingCapacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.add(1);
      q.add(2);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11600
     * @tc.name testBlockingQueueAdd116
     * @tc.desc Verify LinkedBlockingQueue tail insert FIFO first pop returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(4);
      for (let i = 0; i < 4; i++) {
        q.add(i);
      }
      expect(q.pop()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11700
     * @tc.name testBlockingQueueAdd117
     * @tc.desc Verify LinkedBlockingQueue add Int.MIN_VALUE then getEnd reads back correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
      q.add(-2147483648);
      expect(q.getEnd()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ADD_11800
     * @tc.name testBlockingQueueAdd118
     * @tc.desc Verify LinkedBlockingQueue add success keeps capacity property unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueAdd118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(8);
      q.add(1);
      expect(q.capacity).assertEqual(8);
    });
  });
}
