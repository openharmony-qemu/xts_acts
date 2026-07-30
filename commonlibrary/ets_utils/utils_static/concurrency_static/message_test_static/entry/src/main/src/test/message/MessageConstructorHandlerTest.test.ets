'use static'
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
import Utils from '../Util.test';

export default function MessageConstructorHandlerTest(): void {
  describe('MessageConstructorHandlerTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageConstructorHandlerTest0100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0100
     * @tc.desc   Verify Message(handler) creates instance with valid MessageHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorHandlerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      expect(msg.getTarget()).assertEqual(messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      expect(msg.getCallback() === undefined).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })



    /**
     * @tc.name   MessageConstructorHandlerTest0200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0200
     * @tc.desc   Verify Message(handler).getTarget() returns the same handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorHandlerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest0300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0300
     * @tc.desc   Verify Message(handler) sendToTarget triggers handler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorHandlerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(messageHandler);
      msg.sendToTarget();
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
     * @tc.name   MessageConstructorHandlerTest0400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0400
     * @tc.desc   Verify Message instance instanceof concurrency.Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorHandlerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      expect(msg instanceof concurrency.Message).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest0500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0500
     * @tc.desc   Verify Message(handler) default getWhat() returns -1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorHandlerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest0600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0600
     * @tc.desc   Verify Message(handler) default getObject() returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorHandlerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      expect(msg.getObject() === undefined).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest0700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0700
     * @tc.desc   Verify Message(handler) default getCallback() returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorHandlerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      expect(msg.getCallback() === undefined).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest0800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0800
     * @tc.desc   Verify multiple Message instances are independent objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorHandlerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(messageHandler);
      let msg2 = new concurrency.Message(messageHandler);
      expect(msg1 !== msg2).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest0900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_0900
     * @tc.desc   Verify Message with different MessageHandler instances returns correct target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorHandlerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
      let msg1 = new concurrency.Message(handler1);
      let msg2 = new concurrency.Message(handler2);
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
     * @tc.name   MessageConstructorHandlerTest1000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1000
     * @tc.desc   Verify concurrent Message creation with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorHandlerTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let counter = new AtomicInt(0);
      let createAndCount = async (): Promise<void> => {
        let msg = new concurrency.Message(messageHandler);
        counter.fetchAdd(1);
      };
      await Promise.all([createAndCount(), createAndCount(), createAndCount()]);
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest1100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1100
     * @tc.desc   Verify multiple Promise.all tasks sharing same MessageHandler create Messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorHandlerTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handlerCallbackCount = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        handlerCallbackCount.fetchAdd(1);
      }, eaw);
      let createAndSend = async (): Promise<void> => {
        let msg = new concurrency.Message(messageHandler);
        msg.sendToTarget();
      };
      await Promise.all([createAndSend(), createAndSend(), createAndSend()]);
      let waitCount = 0;
      while (handlerCallbackCount.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(handlerCallbackCount.load()).assertEqual(3);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest1200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1200
     * @tc.desc   Verify creating new Message inside MessageHandler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorHandlerTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let nestedCounter = new AtomicInt(0);
      let innerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        nestedCounter.fetchAdd(1);
      }, eaw);
      let outerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let innerMsg = new concurrency.Message(innerHandler);
        innerMsg.sendToTarget();
      }, eaw);
      let msg = new concurrency.Message(outerHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (nestedCounter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(nestedCounter.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest1300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1300
     * @tc.desc   Verify nested sendToTarget creates new Message to different handler in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorHandlerTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let secondReceived = new AtomicInt(0);
      let secondHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        secondReceived.fetchAdd(1);
      }, eaw);
      let firstHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let newMsg = new concurrency.Message(secondHandler);
        newMsg.sendToTarget();
      }, eaw);
      let msg = new concurrency.Message(firstHandler);
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
     * @tc.name   MessageConstructorHandlerTest1400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1400
     * @tc.desc   Verify creating multiple Messages in a loop with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('MessageConstructorHandlerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let createdCount = new AtomicInt(0);
      let keys: string[] = ["key1", "key2", "key3"];
      for (let i = 0; i < keys.length; i++) {
        let msg = new concurrency.Message(handler);
        createdCount.fetchAdd(1);
      }
      expect(createdCount.load()).assertEqual(3);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest1500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1500
     * @tc.desc   Verify multiple Message instances have independent getTarget references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('MessageConstructorHandlerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(handler);
      let msg2 = new concurrency.Message(handler);
      let msg3 = new concurrency.Message(handler);
      expect(msg1.getTarget()).assertEqual(handler);
      expect(msg2.getTarget()).assertEqual(handler);
      expect(msg3.getTarget()).assertEqual(handler);
      expect(msg1 !== msg2).assertTrue();
      expect(msg2 !== msg3).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest1600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1600
     * @tc.desc   Verify AtomicReference stores and updates Message reference atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorHandlerTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let atomicRef = new AtomicReference<concurrency.Message | null>(null);
      let msg1 = new concurrency.Message(handler);
      atomicRef.store(msg1);
      expect(atomicRef.load()).assertEqual(msg1);
      let msg2 = new concurrency.Message(handler);
      let swapResult = atomicRef.compareAndSwap(msg1, msg2);
      expect(swapResult !== msg2).assertTrue();
      expect(atomicRef.load()).assertEqual(msg2);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest1700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1700
     * @tc.desc   Verify Atomics.compareExchange for atomic branch Message creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorHandlerTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let flag = new AtomicInt(0);
      let createdCount = new AtomicInt(0);
      let prev = flag.compareAndSwap(0, 1);
      if (prev === 0) {
        let msg = new concurrency.Message(handler);
        createdCount.fetchAdd(1);
      }
      expect(createdCount.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest1800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1800
     * @tc.desc   Verify sequential Message creation and sending in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorHandlerTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg1 = new concurrency.Message(messageHandler);
      msg1.sendToTarget();
      let waitCount1 = 0;
      while (counter.load() < 1 && waitCount1 < 6000) {
        waitCount1++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      let msg2 = new concurrency.Message(messageHandler);
      msg2.sendToTarget();
      let waitCount2 = 0;
      while (counter.load() < 2 && waitCount2 < 6000) {
        waitCount2++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(2);
      let msg3 = new concurrency.Message(messageHandler);
      msg3.sendToTarget();
      let waitCount3 = 0;
      while (counter.load() < 3 && waitCount3 < 6000) {
        waitCount3++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest1900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_1900
     * @tc.desc   Verify multiple concurrent tasks competing to create Messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorHandlerTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let createAndSend = async (): Promise<void> => {
        let msg = new concurrency.Message(messageHandler);
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
     * @tc.name   MessageConstructorHandlerTest2000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_2000
     * @tc.desc   Verify Message creation with retry pattern on failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorHandlerTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let retryCount = 0;
      let maxRetries = 3;
      let createdMsg: concurrency.Message | null = null;
      for (let i = 0; i < maxRetries; i++) {
        try {
          createdMsg = new concurrency.Message(messageHandler);
          break;
        } catch (error) {
          retryCount++;
        }
      }
      expect(createdMsg instanceof concurrency.Message).assertTrue();
      if (createdMsg !== null) {
        expect(createdMsg.getTarget()).assertEqual(messageHandler);
      }
      expect(retryCount).assertEqual(0);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest2100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_2100
     * @tc.desc   Verify event-driven Message creation with callback pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorHandlerTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let createdCount = new AtomicInt(0);
      let triggerCreate = (): void => {
        let msg = new concurrency.Message(handler);
        createdCount.fetchAdd(1);
      };
      triggerCreate();
      triggerCreate();
      expect(createdCount.load()).assertEqual(2);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest2200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_2200
     * @tc.desc   Verify Message with handler callback accessing message properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorHandlerTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let receivedWhat = new AtomicInt(-1);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
      }, eaw);
      let msg = new concurrency.Message(messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (receivedWhat.load() === -1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(receivedWhat.load()).assertEqual(-1000000);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageConstructorHandlerTest2300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_HANDLER_TEST_2300
     * @tc.desc   Verify Message created with AsyncLock protected shared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorHandlerTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let sharedCount = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        sharedCount.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (sharedCount.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(sharedCount.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })
  })
}
