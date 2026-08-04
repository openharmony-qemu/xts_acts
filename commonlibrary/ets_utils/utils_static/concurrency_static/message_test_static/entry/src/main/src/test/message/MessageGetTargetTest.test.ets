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

export default function MessageGetTargetTest(): void {
  describe('MessageGetTargetTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageGetTargetTest0100
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0100
     * @tc.desc   Verify Message.getTarget() with no args returns handler from constructor(handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetTargetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      let target: concurrency.MessageHandler = msg.getTarget();
      expect(target === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })



    /**
     * @tc.name   MessageGetTargetTest0200
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0200
     * @tc.desc   Verify Message.getTarget() returns correct handler for constructor(what, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetTargetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let EmptyMessageType: int = 1;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(EmptyMessageType, messageHandler);
      let target: concurrency.MessageHandler = msg.getTarget();
      expect(target === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest0300
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0300
     * @tc.desc   Verify Message.getTarget() returns correct handler for constructor(what, obj, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetTargetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let StringMessage: int = 2;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(StringMessage, "hello", messageHandler);
      let target: concurrency.MessageHandler = msg.getTarget();
      expect(target === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest0400
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0400
     * @tc.desc   Verify Message.getTarget() returns correct handler for constructor(callback, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetTargetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback: CB = (): void => { console.info("this is callback message"); }
      let msg = new concurrency.Message(callback, messageHandler);
      let target: concurrency.MessageHandler = msg.getTarget();
      expect(target === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest0500
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0500
     * @tc.desc   Verify Message.getTarget() returned handler can sendMessage and trigger callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      let target: concurrency.MessageHandler = msg.getTarget();
      target.sendMessage(msg);
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest0600
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0600
     * @tc.desc   Verify Message.getTarget() returned handler has same functionality as original handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handlerCallCount: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        handlerCallCount.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      let target: concurrency.MessageHandler = msg.getTarget();
      target.sendMessage(msg);
      let waitCount = 0;
      while (handlerCallCount.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(handlerCallCount.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest0700
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0700
     * @tc.desc   Verify Message.getTarget() with different EAWorker instances returns correct handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetTargetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let messageHandler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
      let messageHandler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
      let msg1 = new concurrency.Message(1, messageHandler1);
      let target1: concurrency.MessageHandler = msg1.getTarget();
      expect(target1 === messageHandler1).assertTrue();
      expect(target1 !== messageHandler2).assertTrue();
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })



    /**
     * @tc.name   MessageGetTargetTest0800
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0800
     * @tc.desc   Verify Message.getTarget() returns same object on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetTargetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      let target1: concurrency.MessageHandler = msg.getTarget();
      let target2: concurrency.MessageHandler = msg.getTarget();
      let target3: concurrency.MessageHandler = msg.getTarget();
      expect(target1 === target2).assertTrue();
      expect(target2 === target3).assertTrue();
      expect(target1 === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })



    /**
     * @tc.name   MessageGetTargetTest0900
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_0900
     * @tc.desc   Verify Message.getTarget() inside MessageHandler callback returns correct handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let targetHolder: concurrency.MessageHandler | null = null;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        targetHolder = msg.getTarget();
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
      expect(targetHolder === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })



    /**
     * @tc.name   MessageGetTargetTest1000
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1000
     * @tc.desc   Verify Message.getTarget() via sendToTarget inside handler callback returns correct handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let targetHolder: concurrency.MessageHandler | null = null;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        targetHolder = msg.getTarget();
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
      expect(targetHolder === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1100
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1100
     * @tc.desc   Verify Message.getTarget() with multiple Message instances returns respective handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let handler3 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler1);
      let msg2 = new concurrency.Message(2, handler2);
      let msg3 = new concurrency.Message(3, handler3);
      expect(msg1.getTarget() === handler1).assertTrue();
      expect(msg2.getTarget() === handler2).assertTrue();
      expect(msg3.getTarget() === handler3).assertTrue();
      expect(msg1.getTarget() !== handler2).assertTrue();
      expect(msg2.getTarget() !== handler3).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1200
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1200
     * @tc.desc   Verify Message.getTarget() returns correct handler before and after sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handlerExecuted: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        handlerExecuted.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      let targetBefore: concurrency.MessageHandler = msg.getTarget();
      expect(targetBefore === messageHandler).assertTrue();
      messageHandler.sendMessage(msg);
      let waitCount = 0;
      while (handlerExecuted.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      let targetAfter: concurrency.MessageHandler = msg.getTarget();
      expect(targetAfter === messageHandler).assertTrue();
      expect(targetBefore === targetAfter).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1300
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1300
     * @tc.desc   Verify Message.getTarget() chained call to sendMessage triggers handler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg2 = new concurrency.Message(2, messageHandler);
      msg2.getTarget().sendMessage(msg2);
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1400
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1400
     * @tc.desc   Verify Message.getTarget() complete lifecycle from creation to processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      let msg = new concurrency.Message(42, "test_data", messageHandler);
      let targetBeforeSend: concurrency.MessageHandler = msg.getTarget();
      expect(targetBeforeSend === messageHandler).assertTrue();
      messageHandler.sendMessage(msg);
      let waitCount = 0;
      while (receivedWhat.load() !== 42 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(receivedWhat.load()).assertEqual(42);
      expect(counter.load()).assertEqual(1);
      expect(targetHolder === messageHandler).assertTrue();
      let targetAfterSend: concurrency.MessageHandler = msg.getTarget();
      expect(targetAfterSend === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1500
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1500
     * @tc.desc   Verify Message.getTarget() combined with getWhat returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetTargetTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let whatValue: int = 100;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(whatValue, messageHandler);
      expect(msg.getWhat()).assertEqual(whatValue);
      expect(msg.getTarget() === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1600
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1600
     * @tc.desc   Verify Message.getTarget() combined with getObject returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetTargetTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let objData: string = "test_object";
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, objData, messageHandler);
      let objResult: Object | undefined = msg.getObject() as Object | undefined;
      expect(objResult !== undefined).assertTrue();
      expect(objResult as string).assertEqual(objData);
      expect(msg.getTarget() === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1700
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1700
     * @tc.desc   Verify Message.getTarget() combined with getCallback returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetTargetTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let callbackExecuted: boolean = false;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback: CB = (): void => { callbackExecuted = true; }
      let msg = new concurrency.Message(callback, messageHandler);
      let retrievedCallback: CB | undefined = msg.getCallback();
      expect(retrievedCallback !== undefined).assertTrue();
      expect(msg.getTarget() === messageHandler).assertTrue();
      retrievedCallback!();
      expect(callbackExecuted).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1800
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1800
     * @tc.desc   Verify Message.getTarget() returned handler is same as sendToTarget target handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handlerExecuted: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        handlerExecuted.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      expect(msg.getTarget() === messageHandler).assertTrue();
      msg.sendToTarget();
      let waitCount = 0;
      while (handlerExecuted.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(handlerExecuted.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest1900
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_1900
     * @tc.desc   Verify Message.getTarget() in equals comparison between Messages with same/different handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetTargetTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let messageHandler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler1);
      let msg2 = new concurrency.Message(1, messageHandler1);
      let msg3 = new concurrency.Message(1, messageHandler2);
      expect(msg1.getTarget() === msg2.getTarget()).assertTrue();
      expect(msg1.getTarget() !== msg3.getTarget()).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest2000
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_2000
     * @tc.desc   Verify Message.getTarget() AtomicInt state change after getTarget retrieval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let state: AtomicInt = new AtomicInt(0);
      let msg = new concurrency.Message(messageHandler);
      let target: concurrency.MessageHandler = msg.getTarget();
      state.store(1);
      expect(msg.getTarget() === target).assertTrue();
      expect(target === messageHandler).assertTrue();
      expect(state.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest2100
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_2100
     * @tc.desc   Verify Message.getTarget() with Message array storage retrieves correct handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let messages: concurrency.Message[] = [];
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message(2, messageHandler);
      let msg3 = new concurrency.Message(3, messageHandler);
      messages.push(msg1);
      messages.push(msg2);
      messages.push(msg3);
      expect(messages.length).assertEqual(3);
      let mapMsg1: concurrency.Message = messages[0];
      let mapMsg2: concurrency.Message = messages[1];
      let mapMsg3: concurrency.Message = messages[2];
      expect(mapMsg1.getTarget() === messageHandler).assertTrue();
      expect(mapMsg2.getTarget() === messageHandler).assertTrue();
      expect(mapMsg3.getTarget() === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest2200
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_2200
     * @tc.desc   Verify Message.getTarget() returned handler sendMessage tracked by AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let callCount: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        callCount.fetchAdd(1);
      }, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message(2, messageHandler);
      let msg3 = new concurrency.Message(3, messageHandler);
      msg1.getTarget().sendMessage(msg1);
      msg2.getTarget().sendMessage(msg2);
      msg3.getTarget().sendMessage(msg3);
      let waitCount = 0;
      while (callCount.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(callCount.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest2300
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_2300
     * @tc.desc   Verify Message.getTarget() multiple calls consistency verified by AtomicInt exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let state: AtomicInt = new AtomicInt(0);
      let msg = new concurrency.Message(messageHandler);
      let target1: concurrency.MessageHandler = msg.getTarget();
      state.fetchAdd(1);
      expect(target1 === messageHandler).assertTrue();
      expect(state.load()).assertEqual(1);
      let target2: concurrency.MessageHandler = msg.getTarget();
      state.fetchAdd(1);
      expect(target2 === messageHandler).assertTrue();
      expect(state.load()).assertEqual(2);
      expect(target1 === target2).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest2400
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_2400
     * @tc.desc   Verify Message.getTarget() handler not equal to different handler instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetTargetTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler1);
      let target: concurrency.MessageHandler = msg.getTarget();
      expect(target === handler1).assertTrue();
      expect(target !== handler2).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest2500
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_2500
     * @tc.desc   Verify Message.getTarget() AtomicInt counter tracks concurrent handler retrieval from multiple Messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message(2, messageHandler);
      let msg3 = new concurrency.Message(3, messageHandler);
      let t1: concurrency.MessageHandler = msg1.getTarget();
      let t2: concurrency.MessageHandler = msg2.getTarget();
      let t3: concurrency.MessageHandler = msg3.getTarget();
      if (t1 === messageHandler) { counter.fetchAdd(1); }
      if (t2 === messageHandler) { counter.fetchAdd(1); }
      if (t3 === messageHandler) { counter.fetchAdd(1); }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetTargetTest2600
     * @tc.number SUB_MESSAGE_GET_TARGET_TEST_2600
     * @tc.desc   Verify Message.getTarget() callback Message getTarget returns correct handler in callback context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetTargetTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let targetHolder: concurrency.MessageHandler | null = null;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        targetHolder = msg.getTarget();
        counter.fetchAdd(1);
      }, eaw);
      let callback: CB = (): void => { console.info("callback executed"); }
      let msg = new concurrency.Message(callback, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      expect(targetHolder === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })
  })
}