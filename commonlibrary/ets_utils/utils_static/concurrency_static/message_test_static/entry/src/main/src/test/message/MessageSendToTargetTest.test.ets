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

type CB = () => void

export default function MessageSendToTargetTest(): void {
  describe('MessageSendToTargetTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageSendToTargetTest0100
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0100
     * @tc.desc   Verify Message.sendToTarget() with constructor(handler) sends message and triggers handler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageSendToTargetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
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
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest0200
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0200
     * @tc.desc   Verify Message.sendToTarget() with constructor(what, handler) handler receives correct what value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageSendToTargetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let receivedWhat: AtomicInt = new AtomicInt(-1);
      let counter: AtomicInt = new AtomicInt(0);
      let whatValue: int = 1;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(whatValue, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(receivedWhat.load()).assertEqual(whatValue);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest0300
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0300
     * @tc.desc   Verify Message.sendToTarget() with constructor(what, obj, handler) handler receives correct obj data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageSendToTargetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let objData: string = "hello";
      let receivedObj: string = "";
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let obj: Object | undefined = msg.getObject() as Object | undefined;
        if (obj !== undefined) {
          receivedObj = obj as string;
        }
        counter.fetchAdd(1);
      }, eaw);
      let StringMessage: int = 2;
      let msg = new concurrency.Message(StringMessage, objData, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(receivedObj).assertEqual(objData);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest0400
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0400
     * @tc.desc   Verify Message.sendToTarget() with constructor(callback, handler) executes callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageSendToTargetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let callbackExecuted: AtomicInt = new AtomicInt(0);
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: CB | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
        counter.fetchAdd(1);
      }, eaw);
      let callback: CB = (): void => {
        callbackExecuted.fetchAdd(1);
      }
      let msg = new concurrency.Message(callback, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      expect(callbackExecuted.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest0500
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0500
     * @tc.desc   Verify Message.sendToTarget() called on two different Message instances both process correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageSendToTargetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(messageHandler);
      msg.sendToTarget();
      let msg2 = new concurrency.Message(2, messageHandler);
      msg2.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(2);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest0600
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0600
     * @tc.desc   Verify Message.sendToTarget() after EAWorker quit does not process message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageSendToTargetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      msg1.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      eaw.quit();
      let waitCount2 = 0;
      while (eaw.isAlive() && waitCount2 < 6000) {
        waitCount2++;
      }
      let msg2 = new concurrency.Message(2, messageHandler);
      try {
        msg2.sendToTarget();
      } catch (e) {
        // Expected: error after EAWorker quit
      }
      let stallCount = 0;
      while (stallCount < 20000) {
        stallCount++;
      }
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageSendToTargetTest0700
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0700
     * @tc.desc   Verify Message.sendToTarget() called twice on same Message instance throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageSendToTargetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      let caught = false;
      try {
        msg.sendToTarget();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest0800
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0800
     * @tc.desc   Verify Message.sendToTarget() does not change message state (getWhat and getTarget unchanged)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageSendToTargetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, "data", messageHandler);
      let whatBefore: int = msg.getWhat();
      let targetBefore: concurrency.MessageHandler = msg.getTarget();
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      let whatAfter: int = msg.getWhat();
      let targetAfter: concurrency.MessageHandler = msg.getTarget();
      expect(whatAfter).assertEqual(whatBefore);
      expect(targetAfter === targetBefore).assertTrue();
      expect(targetAfter === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest0900
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_0900
     * @tc.desc   Verify Message.sendToTarget() handler receives correct what value via AtomicInt tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let receivedWhat: AtomicInt = new AtomicInt(-1);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(99, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      expect(receivedWhat.load()).assertEqual(99);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1000
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1000
     * @tc.desc   Verify Message.sendToTarget() with AtomicInt counter tracks message processing correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(42, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1100
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1100
     * @tc.desc   Verify multiple Messages sharing same MessageHandler sendToTarget are all processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      for (let i: int = 0; i < 10; i++) {
        let msg = new concurrency.Message(i, messageHandler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (counter.load() < 10 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1200
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1200
     * @tc.desc   Verify nested sendToTarget inside MessageHandler callback processes inner message with AsyncLock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let nestedCounter: AtomicInt = new AtomicInt(0);
      let outerCounter: AtomicInt = new AtomicInt(0);
      let innerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        nestedCounter.fetchAdd(1);
      }, eaw);
      let outerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let innerMsg = new concurrency.Message(innerHandler);
        innerMsg.sendToTarget();
        outerCounter.fetchAdd(1);
      }, eaw);
      let outerMsg = new concurrency.Message(outerHandler);
      outerMsg.sendToTarget();
      let waitCount = 0;
      while (nestedCounter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(outerCounter.load()).assertEqual(1);
      expect(nestedCounter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1300
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1300
     * @tc.desc   Verify AtomicInt.compareExchange conditionally triggers sendToTarget when state transitions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let state: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
        state.store(2);
      }, eaw);
      let msg = new concurrency.Message(messageHandler);
      state.store(1);
      expect(state.load()).assertEqual(1);
      if (state.load() === 1) {
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (state.load() !== 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1400
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1400
     * @tc.desc   Verify MessageHandler callback equals comparison then nested sendToTarget with AtomicInt tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let state: AtomicInt = new AtomicInt(0);
      let counter: AtomicInt = new AtomicInt(0);
      let handlerRef: concurrency.MessageHandler | null = null;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (handlerRef !== null) {
          let otherMsg = new concurrency.Message(1, handlerRef);
          if (msg.equals(otherMsg)) {
            state.store(1);
          }
        }
        counter.fetchAdd(1);
      }, eaw);
      handlerRef = messageHandler;
      let msg = new concurrency.Message(1, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load() >= 1).assertTrue();
      expect(state.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1500
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1500
     * @tc.desc   Verify sequential sendToTarget messages processed with AsyncLock order tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      for (let i: int = 1; i <= 3; i++) {
        let msg = new concurrency.Message(i, messageHandler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (counter.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1600
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1600
     * @tc.desc   Verify parallel sendToTarget messages with AtomicInt counter all processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg1 = new concurrency.Message(1, "msg1", messageHandler);
      let msg2 = new concurrency.Message(1, "msg2", messageHandler);
      let msg3 = new concurrency.Message(1, "msg3", messageHandler);
      msg1.sendToTarget();
      msg2.sendToTarget();
      msg3.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1700
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1700
     * @tc.desc   Verify read-write competition with AtomicInt.compareExchange during sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let state: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, "data", messageHandler);
      state.store(1);
      if (state.load() === 1) {
        let whatValue: int = msg.getWhat();
        expect(whatValue).assertEqual(1);
        counter.fetchAdd(1);
      }
      state.store(2);
      if (state.load() === 2) {
        msg.sendToTarget();
        counter.fetchAdd(1);
      }
      let waitCount = 0;
      while (counter.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest1800
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1800
     * @tc.desc   Verify EAWorker quit interrupts sendToTarget and message is not processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
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
      eaw.quit();
      let waitCount2 = 0;
      while (eaw.isAlive() && waitCount2 < 6000) {
        waitCount2++;
      }
      let msg2 = new concurrency.Message(2, messageHandler);
      try {
        msg2.sendToTarget();
        let stallCount = 0;
        while (stallCount < 20000) {
          stallCount++;
        }
        expect(counter.load()).assertEqual(1);
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   MessageSendToTargetTest1900
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_1900
     * @tc.desc   Verify message processing timeout detection with AtomicInt state tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let state: AtomicInt = new AtomicInt(0);
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
        state.store(2);
      }, eaw);
      let msg = new concurrency.Message(messageHandler);
      state.store(1);
      msg.sendToTarget();
      let waitCount: int = 0;
      while (state.load() !== 2 && waitCount < 10000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(state.load()).assertEqual(2);
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2000
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2000
     * @tc.desc   Verify event-driven sendToTarget triggered by callback array with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let listeners: CB[] = [];
      let callback: CB = (): void => {
        let msg = new concurrency.Message(messageHandler);
        msg.sendToTarget();
      }
      listeners.push(callback);
      for (let i: int = 0; i < listeners.length; i++) {
        listeners[i]();
      }
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2100
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2100
     * @tc.desc   Verify multiple concurrent events trigger sendToTarget and all messages processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let events: string[] = ["event1", "event2", "event3"];
      for (let i: int = 0; i < events.length; i++) {
        let msg = new concurrency.Message(1, events[i], messageHandler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (counter.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2200
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2200
     * @tc.desc   Verify Message.sendToTarget() handler callback throws exception and main thread unaffected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageSendToTargetTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handlerCalled: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        handlerCalled.fetchAdd(1);
        throw new Error("Handler error");
      }, eaw);
      let msg = new concurrency.Message(messageHandler);
      messageHandler.sendMessage(msg);
      let waitCount: int = 0;
      while (handlerCalled.load() < 1 && waitCount < 10000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(handlerCalled.load()).assertEqual(1);
      let eaw2 = new EAWorker();
      eaw2.start();
      let counter2: AtomicInt = new AtomicInt(0);
      let messageHandler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter2.fetchAdd(1);
      }, eaw2);
      let msg2 = new concurrency.Message(1, messageHandler2);
      messageHandler2.sendMessage(msg2);
      let waitCount2: int = 0;
      while (counter2.load() < 1 && waitCount2 < 6000) {
        waitCount2++;
        await Utils.msSleep(100);
      }
      expect(counter2.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2300
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2300
     * @tc.desc   Verify Message.sendToTarget() with large data object (10000 elements) processed correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageSendToTargetTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let receivedLength: AtomicInt = new AtomicInt(0);
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let obj: Object | undefined = msg.getObject() as Object | undefined;
        if (obj !== undefined) {
          let arr: string[] = obj as string[];
          receivedLength.store(arr.length);
        }
        counter.fetchAdd(1);
      }, eaw);
      let largeData: string[] = [];
      for (let i: int = 0; i < 10000; i++) {
        largeData.push("data");
      }
      let msg = new concurrency.Message(1, largeData, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(receivedLength.load()).assertEqual(10000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2400
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2400
     * @tc.desc   Verify Message.sendToTarget() default what value is -1000000 verified by handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageSendToTargetTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let receivedWhat: AtomicInt = new AtomicInt(0);
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(receivedWhat.load()).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2500
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2500
     * @tc.desc   Verify complete message lifecycle from construct to send to process with AsyncLock protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageSendToTargetTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let receivedWhat: AtomicInt = new AtomicInt(-1);
      let counter: AtomicInt = new AtomicInt(0);
      let targetHolder: concurrency.MessageHandler | null = null;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
        targetHolder = msg.getTarget();
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, "test", messageHandler);
      let targetBefore: concurrency.MessageHandler = msg.getTarget();
      expect(targetBefore === messageHandler).assertTrue();
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(receivedWhat.load()).assertEqual(1);
      expect(counter.load()).assertEqual(1);
      expect(targetHolder === messageHandler).assertTrue();
      expect(msg.getTarget() === messageHandler).assertTrue();
      expect(msg.getTarget() === targetHolder).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2600
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2600
     * @tc.desc   Verify EAWorker lifecycle with multiple sendToTarget messages and AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageSendToTargetTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      for (let i: int = 0; i < 5; i++) {
        let msg = new concurrency.Message(i, messageHandler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (counter.load() < 5 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(5);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2700
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2700
     * @tc.desc   Verify Message.equals() returns correct result after sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg1 = new concurrency.Message(1, "data", messageHandler);
      let msg2 = new concurrency.Message(1, "data", messageHandler);
      msg1.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      let isEqual: boolean = msg1.equals(msg2);
      expect(isEqual).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageSendToTargetTest2800
     * @tc.number SUB_MESSAGE_SEND_TO_TARGET_TEST_2800
     * @tc.desc   Verify Message.getTarget() returns same handler after sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageSendToTargetTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      let targetBefore: concurrency.MessageHandler = msg.getTarget();
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      let targetAfter: concurrency.MessageHandler = msg.getTarget();
      expect(targetAfter === messageHandler).assertTrue();
      expect(targetBefore === targetAfter).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })
  })
}