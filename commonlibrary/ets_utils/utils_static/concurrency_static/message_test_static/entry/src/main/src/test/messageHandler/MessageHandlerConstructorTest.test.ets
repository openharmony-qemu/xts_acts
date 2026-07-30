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

export default function MessageHandlerConstructorTest(): void {
  describe('MessageHandlerConstructorTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerConstructorTest0100
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify MessageHandler(handler, eaw) creates instance with handler and explicit EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      expect(handler instanceof concurrency.MessageHandler).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest0200
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify MessageHandler(handler, worker) creates instance with handler and explicit EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      expect(handler instanceof concurrency.MessageHandler).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest0300
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify MessageHandler constructor with arrow function handler with explicit Message type annotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        console.info("received message what: ", what);
      }, eaw);
      expect(handler instanceof concurrency.MessageHandler).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest0400
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify MessageHandler constructor with empty handler function body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      expect(handler instanceof concurrency.MessageHandler).assertTrue();
      let msg = new concurrency.Message(1, handler);
      let sendResult: boolean = handler.sendMessage(msg);
      expect(sendResult).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest0500
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify MessageHandler getWorker() returns the passed EAWorker instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let worker: EAWorker = handler.getWorker();
      expect(worker === eaw).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest0600
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify MessageHandler constructor handler processes messages correctly via sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
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
     * @tc.name   MessageHandlerConstructorTest0700
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify multiple MessageHandler instances with different EAWorkers are independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
      expect(handler1 !== handler2).assertTrue();
      expect(handler1.getWorker() === eaw1).assertTrue();
      expect(handler2.getWorker() === eaw2).assertTrue();
      if (eaw1.isAlive()) {
        eaw1.quit();
      }
      if (eaw2.isAlive()) {
        eaw2.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest0800
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify multiple MessageHandler instances with same EAWorker are independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter1 = new AtomicInt(0);
      let counter2 = new AtomicInt(0);
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter1.fetchAdd(1);
      }, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter2.fetchAdd(1);
      }, eaw);
      expect(handler1 !== handler2).assertTrue();
      expect(handler1.getWorker() === eaw).assertTrue();
      expect(handler2.getWorker() === eaw).assertTrue();
      let msg1 = new concurrency.Message(1, handler1);
      let msg2 = new concurrency.Message(2, handler2);
      handler1.sendMessage(msg1);
      handler2.sendMessage(msg2);
      let waitCount: int = 0;
      while ((counter1.load() < 1 || counter2.load() < 1) && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter1.load()).assertEqual(1);
      expect(counter2.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest0900
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify MessageHandler constructor with not-started EAWorker creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      expect(handler instanceof concurrency.MessageHandler).assertTrue();
      expect(handler.getWorker() === eaw).assertTrue();
      eaw.start();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest1000
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify MessageHandler constructor with terminated EAWorker creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      eaw.quit();
      let quitWait = 0;
      while (eaw.isAlive() && quitWait < 20000) {
        quitWait++;
      }
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      expect(handler instanceof concurrency.MessageHandler).assertTrue();
      expect(handler.getWorker() === eaw).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerConstructorTest1100
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify MessageHandler created inside EAWorker handler processes nested messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let outerCounter = new AtomicInt(0);
      let innerCounter = new AtomicInt(0);
      let innerHandler = new concurrency.MessageHandler((innerMsg: concurrency.Message): void => {
        innerCounter.fetchAdd(1);
      }, eaw);
      let outerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        outerCounter.fetchAdd(1);
        innerHandler.sendEmptyMessage(100);
      }, eaw);
      outerHandler.sendEmptyMessage(1);
      let waitCount: int = 0;
      while (outerCounter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(outerCounter.load()).assertEqual(1);
      let waitCount2: int = 0;
      while (innerCounter.load() < 1 && waitCount2 < 6000) {
        waitCount2++;
        await Utils.msSleep(100);
      }
      expect(innerCounter.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest1200
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify multiple handlers sharing same EAWorker process messages concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter1 = new AtomicInt(0);
      let counter2 = new AtomicInt(0);
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter1.fetchAdd(1);
      }, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter2.fetchAdd(1);
      }, eaw);
      for (let i: int = 0; i < 5; i++) {
        handler1.sendEmptyMessage(i);
      }
      for (let j: int = 0; j < 5; j++) {
        handler2.sendEmptyMessage(j + 100);
      }
      let waitCount: int = 0;
      while ((counter1.load() < 5 || counter2.load() < 5) && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter1.load()).assertEqual(5);
      expect(counter2.load()).assertEqual(5);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerConstructorTest1300
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify MessageHandler handler with conditional what-based message processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          counter.fetchAdd(1);
        }
      }, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
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
     * @tc.name   MessageHandlerConstructorTest1400
     * @tc.number SUB_MESSAGE_HANDLER_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify MessageHandler constructor-created handler stability with rapid message sending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      for (let i: int = 0; i < 10; i++) {
        handler.sendEmptyMessage(i);
      }
      let waitCount: int = 0;
      while (counter.load() < 10 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })
  })
}
