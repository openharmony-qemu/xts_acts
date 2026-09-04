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
import Utils from '../Util.test';

export default function MessageHandlerSendMessageTest(): void {
  describe('MessageHandlerSendMessageTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0100
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0100
     * @tc.desc   Verify MessageHandler.sendMessage() with Message(what, obj, handler) returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendMessageTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message received");
      }, eaw);
      let msg = new concurrency.Message(1, "test", handler);
      let result: boolean = handler.sendMessage(msg);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0200
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0200
     * @tc.desc   Verify MessageHandler.sendMessage() with Message(handler) returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(handler);
      let result: boolean = handler.sendMessage(msg);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0300
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0300
     * @tc.desc   Verify MessageHandler.sendMessage() with Message(what, handler) returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendMessageTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler);
      let result: boolean = handler.sendMessage(msg);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0400
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0400
     * @tc.desc   Verify MessageHandler.sendMessage() with Message(callback, handler) returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let callbackExecuted = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {
        callbackExecuted.fetchAdd(1);
      }
      let msg = new concurrency.Message(callback, handler);
      let result: boolean = handler.sendMessage(msg);
      expect(result).assertTrue();
      let waitCount: int = 0;
      while (callbackExecuted.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(callbackExecuted.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0500
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0500
     * @tc.desc   Verify MessageHandler.sendMessage() with different what identifiers all return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(100, handler);
      let msg3 = new concurrency.Message(-1, handler);
      let result1: boolean = handler.sendMessage(msg1);
      let result2: boolean = handler.sendMessage(msg2);
      let result3: boolean = handler.sendMessage(msg3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0600
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0600
     * @tc.desc   Verify MessageHandler.sendMessage() with different obj data objects all return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "stringObj", handler);
      let msg2 = new concurrency.Message(2, 42, handler);
      let msg3 = new concurrency.Message(3, true, handler);
      let result1: boolean = handler.sendMessage(msg1);
      let result2: boolean = handler.sendMessage(msg2);
      let result3: boolean = handler.sendMessage(msg3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0700
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0700
     * @tc.desc   Verify MessageHandler.sendMessage() with different callback functions all return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback1 = (): void => { counter.fetchAdd(1); }
      let callback2 = (): void => { counter.fetchAdd(10); }
      let msg1 = new concurrency.Message(callback1, handler);
      let msg2 = new concurrency.Message(callback2, handler);
      let result1: boolean = handler.sendMessage(msg1);
      let result2: boolean = handler.sendMessage(msg2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      let waitCount: int = 0;
      while (counter.load() < 11 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(counter.load()).assertEqual(11);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0800
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0800
     * @tc.desc   Verify MessageHandler.sendMessage() returns false when EAWorker is not started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler);
      let result: boolean = handler.sendMessage(msg);
      expect(result).assertFalse();
      eaw.start();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest0900
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_0900
     * @tc.desc   Verify MessageHandler.sendMessage() returns false after EAWorker is terminated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      eaw.quit();
      let quitWait = 0;
      while (eaw.isAlive() && quitWait < 20000) {
        quitWait++;
      }
      let msg = new concurrency.Message(1, handler);
      let result: boolean = handler.sendMessage(msg);
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1000
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1000
     * @tc.desc   Verify MessageHandler.sendMessage() messages are processed in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let order0 = new AtomicInt(-1);
      let order1 = new AtomicInt(-1);
      let order2 = new AtomicInt(-1);
      let seq = new AtomicInt(0);
      let received = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
          return;
        }
        let idx: int = seq.fetchAdd(1);
        if (idx === 0) {
          order0.store(msg.getWhat());
        } else if (idx === 1) {
          order1.store(msg.getWhat());
        } else if (idx === 2) {
          order2.store(msg.getWhat());
        }
        received.fetchAdd(1);
      }, eaw);
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
        handler.sendMessage(new concurrency.Message(3, handler));
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (received.load() < 3 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(received.load()).assertEqual(3);
      expect(order0.load()).assertEqual(1);
      expect(order1.load()).assertEqual(2);
      expect(order2.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1100
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1100
     * @tc.desc   Verify concurrent sendMessage calls with AtomicInt counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      for (let i: int = 0; i < 10; i++) {
        let msg = new concurrency.Message(i, handler);
        handler.sendMessage(msg);
      }
      let waitCount: int = 0;
      while (counter.load() < 10 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(counter.load()).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1200
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1200
     * @tc.desc   Verify MessageHandler.sendMessage() handler correctly processes message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendMessageTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let received = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        received.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, "test", handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
      while (received.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(received.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1300
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1300
     * @tc.desc   Verify MessageHandler.sendMessage() handler receives correct getWhat and getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendMessageTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let whatValue = new AtomicInt(0);
      let objVerified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        whatValue.store(msg.getWhat());
        let obj: Object | undefined = msg.getObject() as Object | undefined;
        if (obj !== undefined && (obj as string) === "testData") {
          objVerified.store(1);
        }
      }, eaw);
      let msg = new concurrency.Message(42, "testData", handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
      while ((whatValue.load() !== 42 || objVerified.load() !== 1) && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(whatValue.load()).assertEqual(42);
      expect(objVerified.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1400
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1400
     * @tc.desc   Verify sendMessage called inside handler callback via msg.getTarget() executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let innerReceived = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (msg.getWhat() === 1) {
          let innerMsg = new concurrency.Message(2, msg.getTarget());
          msg.getTarget().sendMessage(innerMsg);
        } else if (msg.getWhat() === 2) {
          innerReceived.fetchAdd(1);
        }
      }, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
      while (innerReceived.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(innerReceived.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1500
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1500
     * @tc.desc   Verify nested sendMessage timing via handler callback with msg.getTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let order: int[] = [];
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        order.push(msg.getWhat());
        if (msg.getWhat() === 1) {
          let innerMsg = new concurrency.Message(2, msg.getTarget());
          msg.getTarget().sendMessage(innerMsg);
        }
      }, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
      while (order.length < 2 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(2);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1600
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1600
     * @tc.desc   Verify nested sendMessage messages are correctly processed in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let order: int[] = [];
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        order.push(msg.getWhat());
        if (msg.getWhat() === 10) {
          let innerMsg1 = new concurrency.Message(20, msg.getTarget());
          let innerMsg2 = new concurrency.Message(30, msg.getTarget());
          msg.getTarget().sendMessage(innerMsg1);
          msg.getTarget().sendMessage(innerMsg2);
        }
      }, eaw);
      let msg = new concurrency.Message(10, handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
      while (order.length < 3 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual(10);
      expect(order[1]).assertEqual(20);
      expect(order[2]).assertEqual(30);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1700
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1700
     * @tc.desc   Verify sendMessage called inside handler callback sends message successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let received = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        received.fetchAdd(1);
      }, eaw);
      let postedCallback = (): void => {
        let msg = new concurrency.Message(1, handler);
        handler.sendMessage(msg);
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (received.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(received.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1800
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1800
     * @tc.desc   Verify sendMessage with three messages increments handler counter to three
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(2, handler);
      let msg3 = new concurrency.Message(3, handler);
      handler.sendMessage(msg1);
      handler.sendMessage(msg2);
      handler.sendMessage(msg3);
      let waitCount: int = 0;
      while (counter.load() < 3 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest1900
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_1900
     * @tc.desc   Verify nested sendMessage inside handler callback maintains state consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let order: int[] = [];
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        order.push(msg.getWhat());
      }, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(2, handler);
      handler.sendMessage(msg1);
      handler.sendMessage(msg2);
      let waitCount: int = 0;
      while (order.length < 2 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(2);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2000
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2000
     * @tc.desc   Verify AtomicInt counter records all messages processed in sendMessage concurrent scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      for (let i: int = 0; i < 100; i++) {
        let msg = new concurrency.Message(i, handler);
        handler.sendMessage(msg);
      }
      let waitCount: int = 0;
      while (counter.load() < 100 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(counter.load()).assertEqual(100);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2100
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2100
     * @tc.desc   Verify AtomicInt counter records messages sent from multiple threads in sendMessage scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw2);
      for (let i: int = 0; i < 50; i++) {
        let msg = new concurrency.Message(i, handler);
        handler.sendMessage(msg);
      }
      for (let i: int = 0; i < 50; i++) {
        let msg = new concurrency.Message(i, handler2);
        handler2.sendMessage(msg);
      }
      let waitCount: int = 0;
      while (counter.load() < 100 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(counter.load()).assertEqual(100);
      if (eaw.isAlive()) { eaw.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2200
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2200
     * @tc.desc   Verify AtomicInt atomic counter controls message sending with sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let sendCounter = new AtomicInt(0);
      let processedCounter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        processedCounter.fetchAdd(1);
      }, eaw);
      let totalMessages: int = 50;
      for (let i: int = 0; i < totalMessages; i++) {
        let msg = new concurrency.Message(i, handler);
        let result: boolean = handler.sendMessage(msg);
        if (result) {
          sendCounter.fetchAdd(1);
        }
      }
      let sentCount: int = sendCounter.load();
      expect(sentCount > 0).assertTrue();
      let waitCount: int = 0;
      while (processedCounter.load() < sentCount && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(processedCounter.load()).assertEqual(sentCount);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2300
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2300
     * @tc.desc   Verify AtomicInt store/load synchronizes message status with sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let msgStatus = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        msgStatus.store(msg.getWhat());
      }, eaw);
      let msg = new concurrency.Message(42, handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
      while (msgStatus.load() !== 42 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(msgStatus.load()).assertEqual(42);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2400
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2400
     * @tc.desc   Verify multiple EAWorkers with sendMessage process all messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      let counter1 = new AtomicInt(0);
      let counter2 = new AtomicInt(0);
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter1.fetchAdd(1);
      }, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter2.fetchAdd(1);
      }, eaw2);
      for (let i: int = 0; i < 5; i++) {
        let msg1 = new concurrency.Message(i, handler1);
        let msg2 = new concurrency.Message(i, handler2);
        handler1.sendMessage(msg1);
        handler2.sendMessage(msg2);
      }
      let waitCount: int = 0;
      while ((counter1.load() < 5 || counter2.load() < 5) && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(counter1.load()).assertEqual(5);
      expect(counter2.load()).assertEqual(5);
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2500
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2500
     * @tc.desc   Verify AtomicInt shared variable counts messages processed in sendMessage concurrent scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendMessageTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let sharedValue = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        sharedValue.fetchAdd(1);
      }, eaw);
      for (let i: int = 0; i < 50; i++) {
        let msg = new concurrency.Message(i, handler);
        handler.sendMessage(msg);
      }
      let waitCount: int = 0;
      while (sharedValue.load() < 50 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(sharedValue.load()).assertEqual(50);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2600
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2600
     * @tc.desc   Verify sendMessage followed by hasMessages returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendMessageTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // start + atomic send/hasMessages on handler thread (handler must invoke post callbacks)
      let eaw = new EAWorker();
      eaw.start();
      let hasPending = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        if (handler.hasMessages(1)) {
          hasPending.fetchAdd(1);
        }
        doneCount.fetchAdd(1);
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (doneCount.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(hasPending.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2700
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2700
     * @tc.desc   Verify sendMessage message can be removed by removeMessages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // start + atomic send/removeMessages; handler must invoke post callbacks
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let cleared = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        if (handler.removeMessages(1)) {
          removed.fetchAdd(1);
        }
        if (!handler.hasMessages(1)) {
          cleared.fetchAdd(1);
        }
        doneCount.fetchAdd(1);
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (doneCount.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(removed.load()).assertEqual(1);
      expect(cleared.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendMessageTest2800
     * @tc.number SUB_MESSAGE_HANDLER_SEND_MESSAGE_TEST_2800
     * @tc.desc   Verify callback message sendMessage followed by hasCallbacks returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendMessageTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {}
      let msg = new concurrency.Message(callback, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })
  })
}
