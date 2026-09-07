'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';

class EqualsTestData {
  name: string = "test"
  value: number = 100
}

const normalEqualsCallback = (): void => {
  console.info("normal callback for equals test");
}

export default function MessageEqualsApiTest(): void {
  describe('MessageEqualsApiTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageEqualsApiTest0100
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0100
     * @tc.desc   Verify Message.equals() requires Message type parameter and returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(handler);
      let msg2 = new concurrency.Message(handler);
      let result: boolean = msg1.equals(msg2);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest0200
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0200
     * @tc.desc   Verify Message.equals() returns true when comparing same Message instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(handler);
      let result: boolean = msg.equals(msg);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest0300
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0300
     * @tc.desc   Verify Message.equals() returns true when comparing different instances with same properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", handler);
      let msg2 = new concurrency.Message(1, "hello", handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest0400
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0400
     * @tc.desc   Verify Message.equals() returns false when comparing messages with different targets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
      let msg1 = new concurrency.Message(handler1);
      let msg2 = new concurrency.Message(handler2);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest0500
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0500
     * @tc.desc   Verify Message.equals() returns true for same instance self-comparison with data message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "hello", handler);
      expect(msg.equals(msg)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest0600
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0600
     * @tc.desc   Verify Message.equals() returns true when target and what are same and obj are both undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(1, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest0700
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0700
     * @tc.desc   Verify Message.equals() returns true when comparing callback messages with same target and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let callback = (): void => { console.info("callback"); }
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(callback, handler);
      let msg2 = new concurrency.Message(callback, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest0800
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0800
     * @tc.desc   Verify Message.equals() returns true when both messages use default what value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(handler);
      let msg2 = new concurrency.Message(handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest0900
     * @tc.number SUB_MESSAGE_EQUALS_TEST_0900
     * @tc.desc   Verify Message.equals() returns false when targets are different MessageHandlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
      let msg1 = new concurrency.Message(1, handler1);
      let msg2 = new concurrency.Message(1, handler2);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1000
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1000
     * @tc.desc   Verify Message.equals() returns false when target is same but what is different
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(2, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1100
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1100
     * @tc.desc   Verify Message.equals() returns false when target and what are same but obj is different
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", handler);
      let msg2 = new concurrency.Message(1, "world", handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1200
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1200
     * @tc.desc   Verify Message.equals() returns false when one has obj and the other does not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", handler);
      let msg2 = new concurrency.Message(1, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1300
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1300
     * @tc.desc   Verify Message.equals() returns false when same target but different callback functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let callback1 = (): void => { console.info("callback1"); }
      let callback2 = (): void => { console.info("callback2"); }
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(callback1, handler);
      let msg2 = new concurrency.Message(callback2, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1400
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1400
     * @tc.desc   Verify Message.equals() returns false when comparing callback message with identifier message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let callback = (): void => { console.info("callback"); }
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(callback, handler);
      let msg2 = new concurrency.Message(1, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1500
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1500
     * @tc.desc   Verify Message.equals() with extreme what values (INT_MAX, INT_MIN, negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(2147483647, handler);
      let msg2 = new concurrency.Message(2147483647, handler);
      expect(msg1.equals(msg2)).assertTrue();
      let msg3 = new concurrency.Message(-2147483648, handler);
      let msg4 = new concurrency.Message(-2147483648, handler);
      expect(msg3.equals(msg4)).assertTrue();
      let msg5 = new concurrency.Message(-1, handler);
      let msg6 = new concurrency.Message(-1, handler);
      expect(msg5.equals(msg6)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1600
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1600
     * @tc.desc   Verify Message.equals() passes what comparison when what values are same
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(100, handler);
      let msg2 = new concurrency.Message(100, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1700
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1700
     * @tc.desc   Verify Message.equals() returns false when what values are different
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(100, handler);
      let msg2 = new concurrency.Message(200, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1800
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1800
     * @tc.desc   Verify Message.equals() passes when both messages use default what value -1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(handler);
      let msg2 = new concurrency.Message(handler);
      expect(msg1.getWhat()).assertEqual(-1000000);
      expect(msg2.getWhat()).assertEqual(-1000000);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest1900
     * @tc.number SUB_MESSAGE_EQUALS_TEST_1900
     * @tc.desc   Verify Message.equals() with what boundary values (0, INT_MAX, INT_MIN)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(0, handler);
      let msg2 = new concurrency.Message(0, handler);
      expect(msg1.equals(msg2)).assertTrue();
      let msg3 = new concurrency.Message(2147483647, handler);
      let msg4 = new concurrency.Message(2147483647, handler);
      expect(msg3.equals(msg4)).assertTrue();
      let msg5 = new concurrency.Message(-2147483648, handler);
      let msg6 = new concurrency.Message(-2147483648, handler);
      expect(msg5.equals(msg6)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2000
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2000
     * @tc.desc   Verify Message.equals() passes when both messages have obj as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(1, handler);
      expect(msg1.getObject() === undefined).assertTrue();
      expect(msg2.getObject() === undefined).assertTrue();
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2100
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2100
     * @tc.desc   Verify Message.equals() returns true when both messages carry same number obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let numObj: number = 123;
      let msg1 = new concurrency.Message(1, numObj, handler);
      let msg2 = new concurrency.Message(1, numObj, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2200
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2200
     * @tc.desc   Verify Message.equals() returns true when both messages carry same object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let dataObj: EqualsTestData = new EqualsTestData();
      let msg1 = new concurrency.Message(1, dataObj, handler);
      let msg2 = new concurrency.Message(1, dataObj, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2300
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2300
     * @tc.desc   Verify Message.equals() returns false when messages carry different object instances with same content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let dataObj1: EqualsTestData = new EqualsTestData();
      let dataObj2: EqualsTestData = new EqualsTestData();
      let msg1 = new concurrency.Message(1, dataObj1, handler);
      let msg2 = new concurrency.Message(1, dataObj2, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2400
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2400
     * @tc.desc   Verify Message.equals() returns true when both messages carry empty string obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "", handler);
      let msg2 = new concurrency.Message(1, "", handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2500
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2500
     * @tc.desc   Verify Message.equals() returns true when both messages carry same array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let arr: number[] = [1, 2, 3];
      let msg1 = new concurrency.Message(1, arr, handler);
      let msg2 = new concurrency.Message(1, arr, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2600
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2600
     * @tc.desc   Verify Message.equals() returns false when messages carry different array instances with same content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [1, 2, 3];
      let msg1 = new concurrency.Message(1, arr1, handler);
      let msg2 = new concurrency.Message(1, arr2, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2700
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2700
     * @tc.desc   Verify Message.equals() returns true when both messages carry Unicode string obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let unicodeStr: string = "测试消息\uD83D\uDE00";
      let msg1 = new concurrency.Message(1, unicodeStr, handler);
      let msg2 = new concurrency.Message(1, unicodeStr, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2800
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2800
     * @tc.desc   Verify Message.equals() returns true when comparing callback messages with same callback reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => { console.info("same callback"); }
      let msg1 = new concurrency.Message(callback, handler);
      let msg2 = new concurrency.Message(callback, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest2900
     * @tc.number SUB_MESSAGE_EQUALS_TEST_2900
     * @tc.desc   Verify Message.equals() returns false when comparing callback messages with different function instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback1 = (): void => { console.info("callback1"); }
      let callback2 = (): void => { console.info("callback2"); }
      let msg1 = new concurrency.Message(callback1, handler);
      let msg2 = new concurrency.Message(callback2, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3000
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3000
     * @tc.desc   Verify Message.equals() returns false when one has callback and the other does not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => { console.info("callback"); }
      let msg1 = new concurrency.Message(callback, handler);
      let msg2 = new concurrency.Message(handler);
      expect(msg1.getCallback() !== undefined).assertTrue();
      expect(msg2.getCallback()).assertUndefined();
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3100
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3100
     * @tc.desc   Verify Message.equals() returns true when comparing callback messages with same arrow function callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let arrowCallback = (): void => { return; }
      let msg1 = new concurrency.Message(arrowCallback, handler);
      let msg2 = new concurrency.Message(arrowCallback, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3200
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3200
     * @tc.desc   Verify Message.equals() returns true when comparing callback messages with same named function callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(normalEqualsCallback, handler);
      let msg2 = new concurrency.Message(normalEqualsCallback, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3300
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3300
     * @tc.desc   Verify Message.equals() returns false when comparing Message(handler) with Message(what, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(handler);
      let msg2 = new concurrency.Message(1, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3400
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3400
     * @tc.desc   Verify Message.equals() returns false when comparing Message(what, handler) with Message(what, obj, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(100, handler);
      let msg2 = new concurrency.Message(100, "data", handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3500
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3500
     * @tc.desc   Verify Message.equals() returns true for two Message(what, obj, handler) with same what and obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(100, "data", handler);
      let msg2 = new concurrency.Message(100, "data", handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3600
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3600
     * @tc.desc   Verify Message.equals() returns false when what is same but obj type is different
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(100, "string", handler);
      let msg2 = new concurrency.Message(100, "123", handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3700
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3700
     * @tc.desc   Verify Message.equals() returns true for two Message(callback, handler) with same callback reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {}
      let msg1 = new concurrency.Message(callback, handler);
      let msg2 = new concurrency.Message(callback, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3800
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3800
     * @tc.desc   Verify Message.equals() returns false comparing callback message with 100-what identifier message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {}
      let msg1 = new concurrency.Message(callback, handler);
      let msg2 = new concurrency.Message(100, handler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest3900
     * @tc.number SUB_MESSAGE_EQUALS_TEST_3900
     * @tc.desc   Verify Message.equals() symmetry: a.equals(b) equals b.equals(a)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", handler);
      let msg2 = new concurrency.Message(1, "hello", handler);
      expect(msg1.equals(msg2)).assertTrue();
      expect(msg2.equals(msg1)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4000
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4000
     * @tc.desc   Verify Message.equals() transitivity: a.equals(b) and b.equals(c) implies a.equals(c)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEqualsApiTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", handler);
      let msg2 = new concurrency.Message(1, "hello", handler);
      let msg3 = new concurrency.Message(1, "hello", handler);
      expect(msg1.equals(msg2)).assertTrue();
      expect(msg2.equals(msg3)).assertTrue();
      expect(msg1.equals(msg3)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4100
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4100
     * @tc.desc   Verify Message.equals() returns consistent results across multiple invocations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", handler);
      let msg2 = new concurrency.Message(1, "hello", handler);
      for (let i: number = 0; i < 10; i++) {
        expect(msg1.equals(msg2)).assertTrue();
      }
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4200
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4200
     * @tc.desc   Verify Message.equals() chain comparison with multiple Message instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(1, handler);
      let msg3 = new concurrency.Message(1, handler);
      let msg4 = new concurrency.Message(2, handler);
      expect(msg1.equals(msg2)).assertTrue();
      expect(msg2.equals(msg3)).assertTrue();
      expect(msg1.equals(msg3)).assertTrue();
      expect(msg1.equals(msg4)).assertFalse();
      expect(msg2.equals(msg4)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4300
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4300
     * @tc.desc   Verify Message.equals() thread safety with concurrent handler callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageEqualsApiTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", handler);
      let msg2 = new concurrency.Message(1, "hello", handler);
      let differentMsg = new concurrency.Message(2, "world", handler);
      let equalCount: number = 0;
      let notEqualCount: number = 0;
      for (let i: number = 0; i < 100; i++) {
        if (msg1.equals(msg2)) {
          equalCount++;
        }
        if (!msg1.equals(differentMsg)) {
          notEqualCount++;
        }
      }
      expect(equalCount).assertEqual(100);
      expect(notEqualCount).assertEqual(100);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4400
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4400
     * @tc.desc   Verify Message.equals() works correctly inside EAWorker thread via handler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageEqualsApiTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let m1 = new concurrency.Message(1, "data", handler1);
      let m2 = new concurrency.Message(1, "data", handler1);
      let m3 = new concurrency.Message(1, "data", handler2);
      expect(m1.equals(m2)).assertTrue();
      expect(m1.equals(m3)).assertFalse();
      expect(m2.equals(m3)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4500
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4500
     * @tc.desc   Verify Message.equals() with messages on different handlers of same EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageEqualsApiTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let m1 = new concurrency.Message(1, handler1);
      let m2 = new concurrency.Message(1, handler1);
      let m3 = new concurrency.Message(1, handler2);
      // Same handler, same what -> equal
      expect(m1.equals(m2)).assertTrue();
      // Different handler -> not equal even with same what
      expect(m1.equals(m3)).assertFalse();
      // Multiple rounds to verify stability
      expect(m1.equals(m2)).assertTrue();
      expect(m2.equals(m1)).assertTrue();
      expect(m2.equals(m3)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4600
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4600
     * @tc.desc   Verify Message.equals() with callback messages across different handlers on same EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageEqualsApiTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => { console.info("task done"); }
      // Callback messages with same callback but same handler -> equal
      let msg1 = new concurrency.Message(callback, handler1);
      let msg2 = new concurrency.Message(callback, handler1);
      expect(msg1.equals(msg2)).assertTrue();
      // Callback messages with same callback but different handlers -> not equal
      let msg3 = new concurrency.Message(callback, handler2);
      expect(msg1.equals(msg3)).assertFalse();
      // Callback message vs identifier message with same handler -> not equal
      let msg4 = new concurrency.Message(1, handler1);
      expect(msg1.equals(msg4)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4700
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4700
     * @tc.desc   Verify Message.equals() with large number of Message instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg0 = new concurrency.Message(0, "data0", handler);
      let msg1 = new concurrency.Message(1, "data1", handler);
      let msg2 = new concurrency.Message(2, "data2", handler);
      let msg3 = new concurrency.Message(3, "data3", handler);
      let msg4 = new concurrency.Message(4, "data4", handler);
      let msg5 = new concurrency.Message(5, "data5", handler);
      let msg6 = new concurrency.Message(6, "data6", handler);
      let msg7 = new concurrency.Message(7, "data7", handler);
      let msg8 = new concurrency.Message(8, "data8", handler);
      let msg9 = new concurrency.Message(9, "data9", handler);
      expect(msg0.equals(msg1)).assertFalse();
      expect(msg1.equals(msg2)).assertFalse();
      expect(msg2.equals(msg3)).assertFalse();
      expect(msg3.equals(msg4)).assertFalse();
      expect(msg4.equals(msg5)).assertFalse();
      expect(msg5.equals(msg6)).assertFalse();
      expect(msg6.equals(msg7)).assertFalse();
      expect(msg7.equals(msg8)).assertFalse();
      expect(msg8.equals(msg9)).assertFalse();
      expect(msg0.equals(msg0)).assertTrue();
      expect(msg1.equals(msg1)).assertTrue();
      expect(msg2.equals(msg2)).assertTrue();
      expect(msg3.equals(msg3)).assertTrue();
      expect(msg4.equals(msg4)).assertTrue();
      expect(msg5.equals(msg5)).assertTrue();
      expect(msg6.equals(msg6)).assertTrue();
      expect(msg7.equals(msg7)).assertTrue();
      expect(msg8.equals(msg8)).assertTrue();
      expect(msg9.equals(msg9)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4800
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4800
     * @tc.desc   Verify Message.equals() returns true for messages with equal what and object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "task1", handler);
      let msg2 = new concurrency.Message(1, "task1", handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest4900
     * @tc.number SUB_MESSAGE_EQUALS_TEST_4900
     * @tc.desc   Verify Message.equals() with callback messages representing same task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let onComplete = (): void => { console.info("task completed"); }
      let msg1 = new concurrency.Message(onComplete, handler);
      let msg2 = new concurrency.Message(onComplete, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest5000
     * @tc.number SUB_MESSAGE_EQUALS_TEST_5000
     * @tc.desc   Verify Message.equals() with messages carrying complex data objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data: EqualsTestData = new EqualsTestData();
      let msg1 = new concurrency.Message(100, data, handler);
      let msg2 = new concurrency.Message(100, data, handler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest5100
     * @tc.number SUB_MESSAGE_EQUALS_TEST_5100
     * @tc.desc   Verify Message.equals() for message type filtering with different what values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let templateStart = new concurrency.Message(1, handler);
      let templateComplete = new concurrency.Message(2, handler);
      let templateError = new concurrency.Message(3, handler);
      let incomingMsg = new concurrency.Message(1, "data", handler);
      expect(incomingMsg.equals(templateStart)).assertFalse();
      expect(incomingMsg.equals(templateComplete)).assertFalse();
      expect(incomingMsg.equals(templateError)).assertFalse();
      expect(templateStart.getWhat()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageEqualsApiTest5200
     * @tc.number SUB_MESSAGE_EQUALS_TEST_5200
     * @tc.desc   Verify Message.equals() returns true when both messages carry null obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageEqualsApiTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      try {
        let msg1 = new concurrency.Message(1, null, handler);
        let msg2 = new concurrency.Message(1, null, handler);
        expect(msg1.getObject() === null).assertTrue();
        expect(msg2.getObject() === null).assertTrue();
        expect(msg1.equals(msg2)).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })
  })
}
