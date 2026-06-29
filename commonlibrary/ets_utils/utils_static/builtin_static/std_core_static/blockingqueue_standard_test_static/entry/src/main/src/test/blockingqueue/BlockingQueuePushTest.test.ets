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


class CustomObject033 {
  name: string = "test";
  value: number = 100;
}

class CustomObject034 {
  prop: string | null = null;
}

class ChildObject035 {
  childName: string = "child";
}

class CustomObject035 {
  name: string = "parent";
  child: ChildObject035 = new ChildObject035();
}

class CustomObject045 {
  name: string;
  value: number;

  constructor(name: string, value: number) {
    this.name = name;
    this.value = value;
  }
}

export default function BlockingQueuePushTest(): void {
  describe('BlockingQueuePushTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0100
     * @tc.name testBlockingQueuePush001
     * @tc.desc Verify LinkedBlockingQueue push push(0) to LinkedBlockingQueue<int>, verify size=1, getFirst()=0, getEnd()=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 0;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = 0;
      const EXPECTED_END_VALUE: number = 0;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0200
     * @tc.name testBlockingQueuePush002
     * @tc.desc Verify LinkedBlockingQueue push push(1) to LinkedBlockingQueue<int>, verify size=1, element at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_END_VALUE: number = 1;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0300
     * @tc.name testBlockingQueuePush003
     * @tc.desc Verify LinkedBlockingQueue push push(-1) to LinkedBlockingQueue<int>, verify size=1, negative value preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_OFFSET: number = -1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = -1;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_OFFSET);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0400
     * @tc.name testBlockingQueuePush004
     * @tc.desc Verify LinkedBlockingQueue push push(100) to LinkedBlockingQueue<int>, verify element enqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 100;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = 100;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0500
     * @tc.name testBlockingQueuePush005
     * @tc.desc Verify LinkedBlockingQueue push push(Int.MAX_VALUE = 2147483647) to LinkedBlockingQueue<int>, verify max int preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 2147483647;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = 2147483647;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0600
     * @tc.name testBlockingQueuePush006
     * @tc.desc Verify LinkedBlockingQueue push push(Int.MIN_VALUE = -2147483648) to LinkedBlockingQueue<int>, verify min int preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_OFFSET: number = -2147483648;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = -2147483648;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_OFFSET);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0700
     * @tc.name testBlockingQueuePush007
     * @tc.desc Verify LinkedBlockingQueue push push(0x7FFFFFFF = 2147483647) to queue, verify value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 2147483647;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = 2147483647;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0800
     * @tc.name testBlockingQueuePush008
     * @tc.desc Verify LinkedBlockingQueue push push(0x1234 = 4660) to queue, verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 4660;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = 4660;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_0900
     * @tc.name testBlockingQueuePush009
     * @tc.desc Verify LinkedBlockingQueue push push(0b1010 = 10) to queue, verify value = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 10;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = 10;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1000
     * @tc.name testBlockingQueuePush010
     * @tc.desc Verify LinkedBlockingQueue push push(0o123 = 83) to queue, verify value = 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 83;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_FIRST_VALUE: number = 83;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1100
     * @tc.name testBlockingQueuePush011
     * @tc.desc Verify LinkedBlockingQueue push push("test") to LinkedBlockingQueue<string>, verify size=1, getFirst()="test"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "test";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "test";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1200
     * @tc.name testBlockingQueuePush012
     * @tc.desc Verify LinkedBlockingQueue push push("测试工程师") to LinkedBlockingQueue<string>, verify Chinese preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "测试工程师";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "测试工程师";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1300
     * @tc.name testBlockingQueuePush013
     * @tc.desc Verify LinkedBlockingQueue push push("Test123 测试") to LinkedBlockingQueue<string>, verify mixed preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "Test123 测试";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "Test123 测试";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1400
     * @tc.name testBlockingQueuePush014
     * @tc.desc Verify LinkedBlockingQueue push push("") to LinkedBlockingQueue<string>, verify getFirst()=""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1500
     * @tc.name testBlockingQueuePush015
     * @tc.desc Verify LinkedBlockingQueue push push(" ") to LinkedBlockingQueue<string>, verify spaces preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = " ";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = " ";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1600
     * @tc.name testBlockingQueuePush016
     * @tc.desc Verify LinkedBlockingQueue push push("\t") to LinkedBlockingQueue<string>, verify tab preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "\t";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "\t";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1700
     * @tc.name testBlockingQueuePush017
     * @tc.desc Verify LinkedBlockingQueue push push("\n") to LinkedBlockingQueue<string>, verify newline preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "\n";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "\n";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1800
     * @tc.name testBlockingQueuePush018
     * @tc.desc Verify LinkedBlockingQueue push push("\r") to LinkedBlockingQueue<string>, verify carriage return preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "\r";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "\r";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_1900
     * @tc.name testBlockingQueuePush019
     * @tc.desc Verify LinkedBlockingQueue push push zero-width space to LinkedBlockingQueue<string>, verify preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.LinkedBlockingQueue<string>();
      let zeroWidthSpace: string = "​";
      queue.push(zeroWidthSpace);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(zeroWidthSpace);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2000
     * @tc.name testBlockingQueuePush020
     * @tc.desc Verify LinkedBlockingQueue push push("!@#$%^&*()") to LinkedBlockingQueue<string>, verify special chars preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "!@#$%^&*()";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "!@#$%^&*()";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2100
     * @tc.name testBlockingQueuePush021
     * @tc.desc Verify LinkedBlockingQueue push push("<script>alert(1)</script>") to LinkedBlockingQueue<string>, verify XSS string preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "<script>alert(1)</script>";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "<script>alert(1)</script>";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2200
     * @tc.name testBlockingQueuePush022
     * @tc.desc Verify LinkedBlockingQueue push push(" 测试 \n 换行 \r\n 回车换行 ") to LinkedBlockingQueue<string>, verify whitespace preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.LinkedBlockingQueue<string>();
      let mixedStr: string = " 测试 \n 换行 \r\n 回车换行 ";
      queue.push(mixedStr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(mixedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2300
     * @tc.name testBlockingQueuePush023
     * @tc.desc Verify LinkedBlockingQueue push push("a") unicode "a" to LinkedBlockingQueue<string>, verify result is "a"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "a";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "a";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2400
     * @tc.name testBlockingQueuePush024
     * @tc.desc Verify LinkedBlockingQueue push push("测试") unicode "测试" to LinkedBlockingQueue<string>, verify result is "测试"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "测试";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "测试";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2500
     * @tc.name testBlockingQueuePush025
     * @tc.desc Verify LinkedBlockingQueue push push("😀") emoji to LinkedBlockingQueue<string>, verify emoji preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "😀";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "😀";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2600
     * @tc.name testBlockingQueuePush026
     * @tc.desc Verify LinkedBlockingQueue push push("😀测试🔥") emoji+Chinese to LinkedBlockingQueue<string>, verify all preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "😀测试🔥";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "😀测试🔥";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2700
     * @tc.name testBlockingQueuePush027
     * @tc.desc Verify LinkedBlockingQueue push push("テスト") Japanese to LinkedBlockingQueue<string>, verify preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "テスト";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "テスト";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2800
     * @tc.name testBlockingQueuePush028
     * @tc.desc Verify LinkedBlockingQueue push push("테스트") Korean to LinkedBlockingQueue<string>, verify preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_TEXT: string = "테스트";
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "테스트";
      let queue = new containers.LinkedBlockingQueue<string>();
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_TEXT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_2900
     * @tc.name testBlockingQueuePush029
     * @tc.desc Verify LinkedBlockingQueue push push 10000-character string to LinkedBlockingQueue<string>, verify preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush029', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.LinkedBlockingQueue<string>();
      let longStr: string = "";
      for (let i = 0; i < 10000; i++) {
        longStr += "a";
      }
      queue.push(longStr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3000
     * @tc.name testBlockingQueuePush030
     * @tc.desc Verify LinkedBlockingQueue push push 65535-character string to LinkedBlockingQueue<string>, verify preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush030', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.LinkedBlockingQueue<string>();
      let veryLongStr: string = "";
      for (let i = 0; i < 65535; i++) {
        veryLongStr += "a";
      }
      queue.push(veryLongStr);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(veryLongStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3100
     * @tc.name testBlockingQueuePush031
     * @tc.desc Verify LinkedBlockingQueue push push(true) to LinkedBlockingQueue<boolean>, verify getFirst()=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_FLAG: boolean = true;
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_FLAG);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3200
     * @tc.name testBlockingQueuePush032
     * @tc.desc Verify LinkedBlockingQueue push push(false) to LinkedBlockingQueue<boolean>, verify getFirst()=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_FLAG: boolean = false;
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.LinkedBlockingQueue<boolean>();
      queue.push(PUSH_FLAG);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3300
     * @tc.name testBlockingQueuePush033
     * @tc.desc Verify LinkedBlockingQueue push push CustomObject033 (name="test", value=100) to LinkedBlockingQueue<CustomObject033>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "test";
      const EXPECTED_VALUE: int = 100;
      let queue = new containers.LinkedBlockingQueue<CustomObject033>();
      let obj: CustomObject033 = new CustomObject033();
      queue.push(obj);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      let first: CustomObject033 = queue.getFirst()!;
      expect(first.name).assertEqual(EXPECTED_TEXT);
      expect(first.value).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3400
     * @tc.name testBlockingQueuePush034
     * @tc.desc Verify LinkedBlockingQueue push push object with null property to LinkedBlockingQueue<CustomObject034>, verify null preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.LinkedBlockingQueue<CustomObject034>();
      let obj: CustomObject034 = new CustomObject034();
      queue.push(obj);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      let first: CustomObject034 = queue.getFirst()!;
      expect(first.prop).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3500
     * @tc.name testBlockingQueuePush035
     * @tc.desc Verify LinkedBlockingQueue push push nested object to LinkedBlockingQueue<CustomObject035>, verify nested structure preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_TEXT: string = "parent";
      const EXPECTED_TEXT_2: string = "child";
      let queue = new containers.LinkedBlockingQueue<CustomObject035>();
      let obj: CustomObject035 = new CustomObject035();
      queue.push(obj);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      let first: CustomObject035 = queue.getFirst()!;
      expect(first.name).assertEqual(EXPECTED_TEXT);
      expect(first.child.childName).assertEqual(EXPECTED_TEXT_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3600
     * @tc.name testBlockingQueuePush036
     * @tc.desc Verify LinkedBlockingQueue push push 0 elements (empty operation), verify size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 0;
      let queue = new containers.LinkedBlockingQueue<number>();
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3700
     * @tc.name testBlockingQueuePush037
     * @tc.desc Verify LinkedBlockingQueue push push 1 element, verify size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 42;
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.LinkedBlockingQueue<number>();
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_3800
     * @tc.name testBlockingQueuePush038
     * @tc.desc Verify LinkedBlockingQueue push push 1000 int elements continuously, verify size=1000, getFirst()=first, getEnd()=last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush038', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 1000;
      const EXPECTED_FIRST_VALUE: number = 0;
      const EXPECTED_END_VALUE: number = 999;
      let queue = new containers.LinkedBlockingQueue<number>();
      for (let i = 0; i < 1000; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getFirst()).assertEqual(EXPECTED_FIRST_VALUE);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4000
     * @tc.name testBlockingQueuePush040
     * @tc.desc Verify LinkedBlockingQueue push push 1 element to capacity=10 queue, verify size=1, remainingCapacity()=9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: number = 1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 9;
      let queue = new containers.LinkedBlockingQueue<number>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4100
     * @tc.name testBlockingQueuePush041
     * @tc.desc Verify LinkedBlockingQueue push push 5 elements, verify size=5, remainingCapacity()=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_REMAINING_CAPACITY: int = 5;
      let queue = new containers.LinkedBlockingQueue<number>(CAPACITY);
      for (let i = 1; i <= 5; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4200
     * @tc.name testBlockingQueuePush042
     * @tc.desc Verify LinkedBlockingQueue push push 9 elements, verify size=9, remainingCapacity()=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 9;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      let queue = new containers.LinkedBlockingQueue<number>(CAPACITY);
      for (let i = 1; i <= 9; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4300
     * @tc.name testBlockingQueuePush043
     * @tc.desc Verify LinkedBlockingQueue push push 10 elements (fill completely), verify size=10, remainingCapacity()=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let queue = new containers.LinkedBlockingQueue<number>(CAPACITY);
      for (let i = 1; i <= 10; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4400
     * @tc.name testBlockingQueuePush044
     * @tc.desc Verify LinkedBlockingQueue push push 10 string elements to LinkedBlockingQueue<string>(10), verify size=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const PUSH_TEXT_PREFIX: string = "str";
      const EXPECTED_SIZE: int = 10;
      let queue = new containers.LinkedBlockingQueue<string>(CAPACITY);
      for (let i = 0; i < 10; i++) {
        queue.push(PUSH_TEXT_PREFIX + i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4500
     * @tc.name testBlockingQueuePush045
     * @tc.desc Verify LinkedBlockingQueue push push 10 custom objects to LinkedBlockingQueue<CustomObject045>(10), verify size=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const CONSTRUCTOR_TEXT: string = "name";
      const EXPECTED_SIZE: int = 10;
      let queue = new containers.LinkedBlockingQueue<CustomObject045>(CAPACITY);
      for (let i = 0; i < 10; i++) {
        let obj: CustomObject045 = new CustomObject045(CONSTRUCTOR_TEXT + i, i);
        queue.push(obj);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4600
     * @tc.name testBlockingQueuePush046
     * @tc.desc Verify LinkedBlockingQueue push create from Array(5) then push extra element, verify size=6, new element at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_VALUE: number = 6;
      const EXPECTED_SIZE: int = 6;
      const EXPECTED_END_VALUE: number = 6;
      let arr: number[] = [1, 2, 3, 4, 5];
      let queue = new containers.LinkedBlockingQueue<number>(arr);
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4700
     * @tc.name testBlockingQueuePush047
     * @tc.desc Verify LinkedBlockingQueue push create string queue from Array(["a","b","c"]) then push "d", verify order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const PUSH_TEXT: string = "d";
      const EXPECTED_SIZE: int = 4;
      const EXPECTED_END_VALUE: string = "d";
      let arr: string[] = ["a", "b", "c"];
      let queue = new containers.LinkedBlockingQueue<string>(arr);
      queue.push(PUSH_TEXT);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.getEnd()).assertEqual(EXPECTED_END_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_4900
     * @tc.name testBlockingQueuePush049
     * @tc.desc Verify LinkedBlockingQueue push capacity=3, 2 elements pre-filled, push 1 fills it, verify size=3, remainingCapacity()=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 3;
      const PUSH_VALUE: number = 10;
      const PUSH_VALUE_2: number = 20;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_REMAINING_CAPACITY: int = 1;
      const PUSH_VALUE_3: number = 30;
      const EXPECTED_SIZE_2: int = 3;
      const EXPECTED_REMAINING_CAPACITY_2: int = 0;
      let queue = new containers.LinkedBlockingQueue<number>(CAPACITY);
      queue.push(PUSH_VALUE);
      queue.push(PUSH_VALUE_2);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      queue.push(PUSH_VALUE_3);
      expect(queue.size).assertEqual(EXPECTED_SIZE_2);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5000
     * @tc.name testBlockingQueuePush050
     * @tc.desc Verify ArrayBlockingQueue push push 1 int to ArrayBlockingQueue<int>(10), verify size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: number = 42;
      const EXPECTED_SIZE: int = 1;
      let queue = new containers.ArrayBlockingQueue<number>(CAPACITY);
      queue.push(PUSH_VALUE);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5100
     * @tc.name testBlockingQueuePush051
     * @tc.desc Verify ArrayBlockingQueue push push 5 int elements, verify size=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 5;
      let queue = new containers.ArrayBlockingQueue<number>(CAPACITY);
      for (let i = 1; i <= 5; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5200
     * @tc.name testBlockingQueuePush052
     * @tc.desc Verify ArrayBlockingQueue push push 10 int elements (fill), verify size=10, remainingCapacity()=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let queue = new containers.ArrayBlockingQueue<number>(CAPACITY);
      for (let i = 1; i <= 10; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5300
     * @tc.name testBlockingQueuePush053
     * @tc.desc Verify ArrayBlockingQueue push push 10 string elements to ArrayBlockingQueue<string>(10), verify full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const PUSH_TEXT_PREFIX: string = "item";
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let queue = new containers.ArrayBlockingQueue<string>(CAPACITY);
      for (let i = 0; i < 10; i++) {
        queue.push(PUSH_TEXT_PREFIX + i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5400
     * @tc.name testBlockingQueuePush054
     * @tc.desc Verify ArrayBlockingQueue push push true to ArrayBlockingQueue<boolean>(1), verify size=1, remainingCapacity()=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueuePush054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const PUSH_FLAG: boolean = true;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      let queue = new containers.ArrayBlockingQueue<boolean>(CAPACITY);
      queue.push(PUSH_FLAG);
      expect(queue.size).assertEqual(EXPECTED_SIZE);
      expect(queue.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5500
     * @tc.name testBlockingQueuePush055
     * @tc.desc Verify ArrayBlockingQueue push Array(5) init ArrayBlockingQueue<int>(10, arr), push 5 more to fill, verify size=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 10;
      let arr: number[] = [1, 2, 3, 4, 5];
      let queue = new containers.ArrayBlockingQueue<number>(CAPACITY, arr);
      for (let i = 6; i <= 10; i++) {
        queue.push(i);
      }
      expect(queue.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5600
     * @tc.name testBlockingQueuePush056
     * @tc.desc Verify ArrayBlockingQueue push single element then getEnd returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(7);
      expect(q.getEnd()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5700
     * @tc.name testBlockingQueuePush057
     * @tc.desc Verify LinkedBlockingQueue push single element then poll returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(13);
      expect(q.poll()).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5800
     * @tc.name testBlockingQueuePush058
     * @tc.desc Verify ArrayBlockingQueue push element=0 then getEnd returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(0);
      expect(q.getEnd()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_5900
     * @tc.name testBlockingQueuePush059
     * @tc.desc Verify ArrayBlockingQueue push element=-1 then getEnd returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(-1);
      expect(q.getEnd()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6000
     * @tc.name testBlockingQueuePush060
     * @tc.desc Verify ArrayBlockingQueue push int max value then getEnd returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(2147483647);
      expect(q.getEnd()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6100
     * @tc.name testBlockingQueuePush061
     * @tc.desc Verify ArrayBlockingQueue push int min value then getEnd returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(-2147483648);
      expect(q.getEnd()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6200
     * @tc.name testBlockingQueuePush062
     * @tc.desc Verify LinkedBlockingQueue push element=-1 then poll returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(-1);
      expect(q.poll()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6300
     * @tc.name testBlockingQueuePush063
     * @tc.desc Verify LinkedBlockingQueue push int max value then poll returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(2147483647);
      expect(q.poll()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6400
     * @tc.name testBlockingQueuePush064
     * @tc.desc Verify LinkedBlockingQueue push int min value then poll returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(-2147483648);
      expect(q.poll()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6500
     * @tc.name testBlockingQueuePush065
     * @tc.desc Verify LinkedBlockingQueue push max-1 value 2147483646 then getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(2147483646);
      expect(q.getFirst()).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6600
     * @tc.name testBlockingQueuePush066
     * @tc.desc Verify LinkedBlockingQueue push min+1 value -2147483647 then getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(-2147483647);
      expect(q.getFirst()).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6700
     * @tc.name testBlockingQueuePush067
     * @tc.desc Verify ArrayBlockingQueue push value 100 then getEnd returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(100);
      expect(q.getEnd()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6800
     * @tc.name testBlockingQueuePush068
     * @tc.desc Verify ArrayBlockingQueue push value -100 then getEnd returns -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(-100);
      expect(q.getEnd()).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_6900
     * @tc.name testBlockingQueuePush069
     * @tc.desc Verify LinkedBlockingQueue push hex literal 0xFF then getFirst returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0xFF);
      expect(q.getFirst()).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7000
     * @tc.name testBlockingQueuePush070
     * @tc.desc Verify LinkedBlockingQueue push octal literal 0o17 then getFirst returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0o17);
      expect(q.getFirst()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7100
     * @tc.name testBlockingQueuePush071
     * @tc.desc Verify ArrayBlockingQueue push hex max literal 0x7FFFFFFF then getEnd returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(0x7FFFFFFF);
      expect(q.getEnd()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7200
     * @tc.name testBlockingQueuePush072
     * @tc.desc Verify ArrayBlockingQueue push octal literal 0o777 then getEnd returns 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(0o777);
      expect(q.getEnd()).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7300
     * @tc.name testBlockingQueuePush073
     * @tc.desc Verify ArrayBlockingQueue push binary literal 0b11111111 then getEnd returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(0b11111111);
      expect(q.getEnd()).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7400
     * @tc.name testBlockingQueuePush074
     * @tc.desc Verify LinkedBlockingQueue push hex zero 0x0 then getFirst returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(0x0);
      expect(q.getFirst()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7500
     * @tc.name testBlockingQueuePush075
     * @tc.desc Verify LinkedBlockingQueue push shift expression 1 << 10 then getFirst returns 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1 << 10);
      expect(q.getFirst()).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7600
     * @tc.name testBlockingQueuePush076
     * @tc.desc Verify ArrayBlockingQueue push arithmetic expression 2147483646 + 1 then getEnd returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(2147483646 + 1);
      expect(q.getEnd()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7700
     * @tc.name testBlockingQueuePush077
     * @tc.desc Verify LinkedBlockingQueue push arithmetic expression -2147483647 - 1 then getFirst returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(-2147483647 - 1);
      expect(q.getFirst()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7800
     * @tc.name testBlockingQueuePush078
     * @tc.desc Verify ArrayBlockingQueue push negative hex -0x80000000 then getEnd returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(-0x80000000);
      expect(q.getEnd()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_7900
     * @tc.name testBlockingQueuePush079
     * @tc.desc Verify LinkedBlockingQueue push float 3.14 then getFirst returns 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(3.14);
      expect(q.getFirst()).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8000
     * @tc.name testBlockingQueuePush080
     * @tc.desc Verify ArrayBlockingQueue push float -2.5 then getEnd returns -2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(-2.5);
      expect(q.getEnd()).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8100
     * @tc.name testBlockingQueuePush081
     * @tc.desc Verify LinkedBlockingQueue push Number.MAX_SAFE_INTEGER then getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER);
      expect(q.getFirst()).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8200
     * @tc.name testBlockingQueuePush082
     * @tc.desc Verify ArrayBlockingQueue push Number.MIN_SAFE_INTEGER then getEnd returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(Number.MIN_SAFE_INTEGER);
      expect(q.getEnd()).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8300
     * @tc.name testBlockingQueuePush083
     * @tc.desc Verify LinkedBlockingQueue push Number.MAX_VALUE then getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.MAX_VALUE);
      expect(q.getFirst()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8400
     * @tc.name testBlockingQueuePush084
     * @tc.desc Verify ArrayBlockingQueue push Number.MIN_VALUE then getEnd returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(Number.MIN_VALUE);
      expect(q.getEnd()).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8500
     * @tc.name testBlockingQueuePush085
     * @tc.desc Verify LinkedBlockingQueue push Number.EPSILON then getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.EPSILON);
      expect(q.getFirst()).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8600
     * @tc.name testBlockingQueuePush086
     * @tc.desc Verify LinkedBlockingQueue push Infinity then getFirst returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(Number.POSITIVE_INFINITY);
      expect(q.getFirst()).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8700
     * @tc.name testBlockingQueuePush087
     * @tc.desc Verify ArrayBlockingQueue push -Infinity then getEnd returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(Number.NEGATIVE_INFINITY);
      expect(q.getEnd()).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8800
     * @tc.name testBlockingQueuePush088
     * @tc.desc Verify ArrayBlockingQueue push Number.MAX_SAFE_INTEGER + 1 then getEnd returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(Number.MAX_SAFE_INTEGER + 1);
      expect(q.getEnd()).assertEqual(Number.MAX_SAFE_INTEGER + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_8900
     * @tc.name testBlockingQueuePush089
     * @tc.desc Verify LinkedBlockingQueue push scientific notation 1e10 then getFirst returns 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(10);
      q.push(1e10);
      expect(q.getFirst()).assertEqual(1e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9000
     * @tc.name testBlockingQueuePush090
     * @tc.desc Verify ArrayBlockingQueue push negative zero -0 then getEnd equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      q.push(-0);
      expect(q.getEnd()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9100
     * @tc.name testBlockingQueuePush091
     * @tc.desc Verify ArrayBlockingQueue push empty string then getEnd returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(10);
      q.push("");
      expect(q.getEnd()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9200
     * @tc.name testBlockingQueuePush092
     * @tc.desc Verify ArrayBlockingQueue push string with spaces then getEnd returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(10);
      q.push("a b c");
      expect(q.getEnd()).assertEqual("a b c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9300
     * @tc.name testBlockingQueuePush093
     * @tc.desc Verify LinkedBlockingQueue push single-char string then poll returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<string> = new containers.LinkedBlockingQueue<string>(10);
      q.push("x");
      expect(q.poll()).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9400
     * @tc.name testBlockingQueuePush094
     * @tc.desc Verify ArrayBlockingQueue push false then getEnd returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(10);
      q.push(false);
      expect(q.getEnd()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9500
     * @tc.name testBlockingQueuePush095
     * @tc.desc Verify ArrayBlockingQueue push capacity-size equals remainingCapacity invariant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(5);
      expect(q.capacity - q.size).assertEqual(q.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9600
     * @tc.name testBlockingQueuePush096
     * @tc.desc Verify ArrayBlockingQueue push sequence 0..4 then getFirst returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      expect(q.getFirst()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9700
     * @tc.name testBlockingQueuePush097
     * @tc.desc Verify ArrayBlockingQueue push sequence 0..4 then getEnd returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      expect(q.getEnd()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9800
     * @tc.name testBlockingQueuePush098
     * @tc.desc Verify LinkedBlockingQueue push 0..4 then sequential poll preserves FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      let ok: boolean = true;
      for (let i = 0; i < 5; i++) {
        if (q.poll() !== i) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_9900
     * @tc.name testBlockingQueuePush099
     * @tc.desc Verify ArrayBlockingQueue push 0..4 then sequential poll preserves FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      let ok: boolean = true;
      for (let i = 0; i < 5; i++) {
        if (q.poll() !== i) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10000
     * @tc.name testBlockingQueuePush100
     * @tc.desc Verify LinkedBlockingQueue push boundary sequence then getEnd is last pushed min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(2147483647);
      q.push(-2147483648);
      expect(q.getEnd()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10100
     * @tc.name testBlockingQueuePush101
     * @tc.desc Verify ArrayBlockingQueue push boundary sequence then getFirst is first pushed max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(2147483647);
      q.push(-2147483648);
      expect(q.getFirst()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10200
     * @tc.name testBlockingQueuePush102
     * @tc.desc Verify Linked and Array push same element then getFirst returns equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      lq.push(0);
      aq.push(0);
      expect(lq.getFirst()).assertEqual(aq.getFirst());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10300
     * @tc.name testBlockingQueuePush103
     * @tc.desc Verify Linked and Array push max value then getEnd returns equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      lq.push(2147483647);
      aq.push(2147483647);
      expect(lq.getEnd()).assertEqual(aq.getEnd());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10400
     * @tc.name testBlockingQueuePush104
     * @tc.desc Verify Linked and Array push min value then poll returns equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      lq.push(-2147483648);
      aq.push(-2147483648);
      expect(lq.poll()).assertEqual(aq.poll());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10500
     * @tc.name testBlockingQueuePush105
     * @tc.desc Verify Linked and Array single push then size are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      lq.push(5);
      aq.push(5);
      expect(lq.size).assertEqual(aq.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10600
     * @tc.name testBlockingQueuePush106
     * @tc.desc Verify Linked and Array same sequence push then remainingCapacity are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 3; i++) {
        lq.push(i);
        aq.push(i);
      }
      expect(lq.remainingCapacity()).assertEqual(aq.remainingCapacity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10700
     * @tc.name testBlockingQueuePush107
     * @tc.desc Verify Linked and Array same sequence push then FIFO poll sequence is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lq: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let aq: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      for (let i = 0; i < 4; i++) {
        lq.push(i);
        aq.push(i);
      }
      let same: boolean = true;
      for (let i = 0; i < 4; i++) {
        if (lq.poll() !== aq.poll()) {
          same = false;
        }
      }
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10800
     * @tc.name testBlockingQueuePush108
     * @tc.desc Verify default-capacity LinkedBlockingQueue push max value then getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(2147483647);
      expect(q.getFirst()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_10900
     * @tc.name testBlockingQueuePush109
     * @tc.desc Verify default-capacity LinkedBlockingQueue capacity equals 2147483647 after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(1);
      expect(q.capacity).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11000
     * @tc.name testBlockingQueuePush110
     * @tc.desc Verify capacity=1 LinkedBlockingQueue push fills it so size equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(0);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11100
     * @tc.name testBlockingQueuePush111
     * @tc.desc Verify capacity=1 ArrayBlockingQueue push fills it so size equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(0);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11200
     * @tc.name testBlockingQueuePush112
     * @tc.desc Verify capacity=1 ArrayBlockingQueue push fills it so remainingCapacity is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(0);
      expect(q.remainingCapacity()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11300
     * @tc.name testBlockingQueuePush113
     * @tc.desc Verify capacity=5 ArrayBlockingQueue fill then size equals capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(5);
      for (let i = 0; i < 5; i++) {
        q.push(i);
      }
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11400
     * @tc.name testBlockingQueuePush114
     * @tc.desc Verify capacity=3 ArrayBlockingQueue fill then getEnd is last inserted element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(11);
      q.push(22);
      q.push(33);
      expect(q.getEnd()).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11500
     * @tc.name testBlockingQueuePush115
     * @tc.desc Verify filled LinkedBlockingQueue poll one then push one restores size to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.push(4);
      expect(q.size).assertEqual(q.capacity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11600
     * @tc.name testBlockingQueuePush116
     * @tc.desc Verify filled ArrayBlockingQueue poll one then push one makes new tail the new element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.push(4);
      expect(q.getEnd()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11700
     * @tc.name testBlockingQueuePush117
     * @tc.desc Verify filled LinkedBlockingQueue poll one then push one makes new head the remaining second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
      q.push(1);
      q.push(2);
      q.push(3);
      q.poll();
      q.push(4);
      expect(q.getFirst()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11800
     * @tc.name testBlockingQueuePush118
     * @tc.desc Verify capacity=1 LinkedBlockingQueue push int max then getFirst returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      q.push(2147483647);
      expect(q.getFirst()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_11900
     * @tc.name testBlockingQueuePush119
     * @tc.desc Verify capacity=1 ArrayBlockingQueue push int min then getEnd returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(1);
      q.push(-2147483648);
      expect(q.getEnd()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12000
     * @tc.name testBlockingQueuePush120
     * @tc.desc Verify LinkedBlockingQueue push return value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r = q.push(5);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12100
     * @tc.name testBlockingQueuePush121
     * @tc.desc Verify ArrayBlockingQueue push return value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let r = q.push(5);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12200
     * @tc.name testBlockingQueuePush122
     * @tc.desc Verify LinkedBlockingQueue push return type is undefined via typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let r = q.push(5);
      expect(typeof r).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12300
     * @tc.name testBlockingQueuePush123
     * @tc.desc Verify ArrayBlockingQueue push return type is undefined via typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let r = q.push(5);
      expect(typeof r).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12400
     * @tc.name testBlockingQueuePush124
     * @tc.desc Verify ArrayBlockingQueue push does not change capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(5);
      expect(q.capacity).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12500
     * @tc.name testBlockingQueuePush125
     * @tc.desc Verify ArrayBlockingQueue size increases by 1 after a single push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      let before = q.size;
      q.push(6);
      expect(q.size - before).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12600
     * @tc.name testBlockingQueuePush126
     * @tc.desc Verify LinkedBlockingQueue getEnd does not consume element so size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.getEnd();
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12700
     * @tc.name testBlockingQueuePush127
     * @tc.desc Verify ArrayBlockingQueue getFirst does not consume element so size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.getFirst();
      expect(q.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12800
     * @tc.name testBlockingQueuePush128
     * @tc.desc Verify LinkedBlockingQueue push poll then push again so getEnd returns new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(1);
      q.poll();
      q.push(2);
      expect(q.getEnd()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_12900
     * @tc.name testBlockingQueuePush129
     * @tc.desc Verify LinkedBlockingQueue push external variable value then getEnd returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      let v: int = 123;
      q.push(v);
      expect(q.getEnd()).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_13000
     * @tc.name testBlockingQueuePush130
     * @tc.desc Verify ArrayBlockingQueue push twice poll all then push so getFirst equals new element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(10);
      q.push(1);
      q.push(2);
      q.poll();
      q.poll();
      q.push(9);
      expect(q.getFirst()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_PUSH_13100
     * @tc.name testBlockingQueuePush131
     * @tc.desc Verify LinkedBlockingQueue getFirst is idempotent returning same head after repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueuePush131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      q.push(55);
      q.push(66);
      q.getFirst();
      expect(q.getFirst()).assertEqual(55);
    });
  });
}
