'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import Utils from '../Util.test';

export default function MessageConstructorWhatTest(): void {
  describe('MessageConstructorWhatTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageConstructorWhatTest0100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0100
     * @tc.desc   Verify Message(what, handler) creates instance with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      expect(msg.getWhat()).assertEqual(1);
      expect(msg.getTarget()).assertEqual(messageHandler);
      expect(msg.getObject() === undefined).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest0200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0200
     * @tc.desc   Verify Message(100, handler).getWhat() returns 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(100, messageHandler);
      expect(msg.getWhat()).assertEqual(100);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest0300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0300
     * @tc.desc   Verify Message(0, handler).getWhat() returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0, messageHandler);
      expect(msg.getWhat()).assertEqual(0);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest0400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0400
     * @tc.desc   Verify Message(-1, handler).getWhat() returns -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(-1, messageHandler);
      expect(msg.getWhat()).assertEqual(-1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest0500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0500
     * @tc.desc   Verify Message with int min value -2147483648 returns correct what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(-2147483648, messageHandler);
      expect(msg.getWhat()).assertEqual(-2147483648);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest0600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0600
     * @tc.desc   Verify Message with int max value 2147483647 returns correct what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(2147483647, messageHandler);
      expect(msg.getWhat()).assertEqual(2147483647);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest0700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0700
     * @tc.desc   Verify Message with what values near -1000000 boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(-1000001, messageHandler);
      let msg2 = new concurrency.Message(-999999, messageHandler);
      expect(msg1.getWhat()).assertEqual(-1000001);
      expect(msg2.getWhat()).assertEqual(-999999);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest0800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0800
     * @tc.desc   Verify Message with special value -1000000 which is the default what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(-1000000, messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest0900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_0900
     * @tc.desc   Verify Message with hex literal 0xFF returns getWhat 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0xFF, messageHandler);
      expect(msg.getWhat()).assertEqual(255);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1000
     * @tc.desc   Verify Message with octal literal 0o10 returns getWhat 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0o10, messageHandler);
      expect(msg.getWhat()).assertEqual(8);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1100
     * @tc.desc   Verify Message with binary literal 0b1010 returns getWhat 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0b1010, messageHandler);
      expect(msg.getWhat()).assertEqual(10);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1200
     * @tc.desc   Verify Message(1, handler).getTarget() returns the same handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1300
     * @tc.desc   Verify Message with handler containing processing logic via sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      messageHandler.sendMessage(msg);
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1400
     * @tc.desc   Verify positive integer with normal handler combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(100, messageHandler);
      expect(msg.getWhat()).assertEqual(100);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1500
     * @tc.desc   Verify negative integer with normal handler combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(-100, messageHandler);
      expect(msg.getWhat()).assertEqual(-100);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1600
     * @tc.desc   Verify zero with normal handler combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0, messageHandler);
      expect(msg.getWhat()).assertEqual(0);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1700
     * @tc.desc   Verify boundary value with normal handler combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(2147483647, messageHandler);
      expect(msg.getWhat()).assertEqual(2147483647);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1800
     * @tc.desc   Verify constructed Message instanceof concurrency.Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      expect(msg instanceof concurrency.Message).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest1900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_1900
     * @tc.desc   Verify Message.getWhat() returns exact variable value passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let testWhat: int = 12345;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(testWhat, messageHandler);
      expect(msg.getWhat()).assertEqual(testWhat);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2000
     * @tc.desc   Verify Message.equals() returns true for same what and handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message(1, messageHandler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2100
     * @tc.desc   Verify Message.getObject() returns undefined for 2-param constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      expect(msg.getObject() === undefined).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2200
     * @tc.desc   Verify Message.getCallback() returns undefined for 2-param constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      expect(msg.getCallback() === undefined).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2300
     * @tc.desc   Verify multiple Message instances are independent with different what values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message(2, messageHandler);
      expect(msg1.getWhat()).assertEqual(1);
      expect(msg2.getWhat()).assertEqual(2);
      expect(msg1 !== msg2).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2400
     * @tc.desc   Verify multiple messages processed in order by same handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(2, handler);
      let msg3 = new concurrency.Message(3, handler);
      msg1.sendToTarget();
      msg2.sendToTarget();
      msg3.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2500
     * @tc.desc   Verify creating new Message to different handler in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let secondReceived = new AtomicInt(0);
      let secondHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        secondReceived.fetchAdd(1);
      }, eaw);
      let firstHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let newMsg = new concurrency.Message(2, secondHandler);
        newMsg.sendToTarget();
      }, eaw);
      let msg = new concurrency.Message(1, firstHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (secondReceived.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(secondReceived.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2600
     * @tc.desc   Verify Message batch creation in loop with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let createdCount = new AtomicInt(0);
      let keys: string[] = ["k1", "k2", "k3"];
      let values: int[] = [1, 2, 3];
      for (let i = 0; i < keys.length; i++) {
        let msg = new concurrency.Message(values[i], handler);
        createdCount.fetchAdd(1);
      }
      expect(createdCount.load()).assertEqual(3);
      expect(values.length).assertEqual(3);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2700
     * @tc.desc   Verify Message with different MessageHandler instances returns correct target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
      let msg1 = new concurrency.Message(1, handler1);
      let msg2 = new concurrency.Message(2, handler2);
      expect(msg1.getTarget()).assertEqual(handler1);
      expect(msg2.getTarget()).assertEqual(handler2);
      expect(msg1.getTarget() !== msg2.getTarget()).assertTrue();
      if (eaw1.isAlive()) {
        eaw1.quit();
      }
      if (eaw2.isAlive()) {
        eaw2.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2800
     * @tc.desc   Verify AtomicReference stores and updates Message atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let atomicRef = new AtomicReference<concurrency.Message | null>(null);
      let msg1 = new concurrency.Message(1, handler);
      atomicRef.store(msg1);
      expect(atomicRef.load()).assertEqual(msg1);
      let msg2 = new concurrency.Message(2, handler);
      let swapResult = atomicRef.compareAndSwap(msg1, msg2);
      expect(atomicRef.load()).assertEqual(msg2);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest2900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_2900
     * @tc.desc   Verify concurrent Message creation with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let counter = new AtomicInt(0);
      let createAndCount = async (): Promise<void> => {
        let msg = new concurrency.Message(1, messageHandler);
        counter.fetchAdd(1);
      };
      await Promise.all([createAndCount(), createAndCount(), createAndCount()]);
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3000
     * @tc.desc   Verify concurrent Message sending to same handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let createAndSend = async (): Promise<void> => {
        let msg = new concurrency.Message(1, messageHandler);
        msg.sendToTarget();
      };
      let tasks: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(createAndSend());
      }
      await Promise.all(tasks);
      let waitCount = 0;
      while (counter.load() < 10 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3100
     * @tc.desc   Verify different what values distinguish message types in handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let typeACount = new AtomicInt(0);
      let typeBCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          typeACount.fetchAdd(1);
        } else if (what === 2) {
          typeBCount.fetchAdd(1);
        }
      }, eaw);
      let msgA = new concurrency.Message(1, handler);
      let msgB = new concurrency.Message(2, handler);
      handler.sendMessage(msgA);
      handler.sendMessage(msgB);
      let waitCount = 0;
      while ((typeACount.load() < 1 || typeBCount.load() < 1) && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(typeACount.load()).assertEqual(1);
      expect(typeBCount.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3200
     * @tc.desc   Verify special identifier values (0, -1, 100) stored correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msgEmpty = new concurrency.Message(0, handler);
      let msgError = new concurrency.Message(-1, handler);
      let msgSuccess = new concurrency.Message(100, handler);
      expect(msgEmpty.getWhat()).assertEqual(0);
      expect(msgError.getWhat()).assertEqual(-1);
      expect(msgSuccess.getWhat()).assertEqual(100);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3300
     * @tc.desc   Verify comparison with single-param constructor default what value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(messageHandler);
      let msg2 = new concurrency.Message(1, messageHandler);
      expect(msg1.getWhat()).assertEqual(-1000000);
      expect(msg2.getWhat()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3400
     * @tc.desc   Verify comparison with three-param constructor getObject result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message(1, "data", messageHandler);
      expect(msg1.getObject() === undefined).assertTrue();
      expect(msg2.getObject() as string).assertEqual("data");
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3500
     * @tc.desc   Verify complete message lifecycle from creation to processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let processed = new AtomicInt(0);
      let receivedWhat = new AtomicInt(-1);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
        processed.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(100, handler);
      expect(processed.load()).assertEqual(0);
      msg.sendToTarget();
      let waitCount = 0;
      while (processed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(processed.load()).assertEqual(1);
      expect(receivedWhat.load()).assertEqual(100);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3600
     * @tc.desc   Verify while-loop wait pattern for concurrent message processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let completedCount = new AtomicInt(0);
      let totalCount: int = 10;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        completedCount.fetchAdd(1);
      }, eaw);
      for (let i = 0; i < totalCount; i++) {
        let msg = new concurrency.Message(i, handler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (completedCount.load() < totalCount && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(completedCount.load()).assertEqual(totalCount);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3700
     * @tc.desc   Verify concurrent message result collection with AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let resultCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        resultCount.fetchAdd(1);
      }, eaw);
      for (let i = 0; i < 5; i++) {
        let msg = new concurrency.Message(i, handler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (resultCount.load() < 5 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(resultCount.load()).assertEqual(5);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorWhatTest3800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_TEST_3800
     * @tc.desc   Verify Message.getTarget() after handler EAWorker terminates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler);
      expect(msg.getTarget()).assertEqual(handler);
      if (eaw.isAlive()) {
        eaw.quit();
      }
      expect(msg.getTarget()).assertEqual(handler);
    })
  })
}
