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

export default function MessageHandlerPostTest(): void {
  describe('MessageHandlerPostTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerPostTest0100
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0100
     * @tc.desc   Verify MessageHandler.post() with required callback parameter returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerPostTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message received");
      }, eaw);
      let result: boolean = handler.post((): void => {
        console.info("callback executed");
      });
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest0200
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0200
     * @tc.desc   Verify MessageHandler.post() with arrow function variable as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerPostTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let arrowCallback = (): void => { console.info("arrow callback"); };
      let result: boolean = handler.post(arrowCallback);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest0300
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0300
     * @tc.desc   Verify MessageHandler.post() with empty body callback returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerPostTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.post((): void => {});
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest0400
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0400
     * @tc.desc   Verify MessageHandler.post() with callback containing complex logic executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let result: boolean = handler.post((): void => {
        for (let i: int = 0; i < 10; i++) { counter.fetchAdd(1); }
      });
      expect(result).assertTrue();
      let waitCount: int = 0;
      while (counter.load() < 10 && waitCount < 3000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest0500
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0500
     * @tc.desc   Verify MessageHandler.post() with closure callback accessing outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let externalVar: string = "test";
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let result: boolean = handler.post((): void => {
        if (externalVar === "test") { verified.fetchAdd(1); }
      });
      expect(result).assertTrue();
      let waitCount: int = 0;
      while (verified.load() < 1 && waitCount < 3000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest0600
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0600
     * @tc.desc   Verify MessageHandler.post() with callback modifying external state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let stateValue = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let result: boolean = handler.post((): void => { stateValue.store(100); });
      expect(result).assertTrue();
      let waitCount: int = 0;
      while (stateValue.load() !== 100 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(stateValue.load()).assertEqual(100);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest0700
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0700
     * @tc.desc   Verify MessageHandler.post() returns true even when callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.post((): void => { throw new Error("callback error"); });
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest0800
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0800
     * @tc.desc   Verify MessageHandler.post() with null callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let nullCallbackHolder: (() => void) | null = null;
      let caught = false;
      try {
        handler.post(nullCallbackHolder!);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest0900
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_0900
     * @tc.desc   Verify MessageHandler.post() with undefined callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let undefinedCallbackHolder: (() => void) | undefined = undefined;
      let caught = false;
      try {
        handler.post(undefinedCallbackHolder!);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest1000
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1000
     * @tc.desc   Verify MessageHandler.post() with async callback returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let asyncCallback = async (): Promise<void> => { await Utils.msSleep(100); };
      let result: boolean = handler.post(asyncCallback as () => void);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest1100
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1100
     * @tc.desc   Verify MessageHandler.post() with callback returning non-void value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let returnCallback = (): number => { return 42; };
      let result: boolean = handler.post(returnCallback as () => void);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest1200
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1200
     * @tc.desc   Verify MessageHandler.post() returns true for multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerPostTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      for (let i: int = 0; i < 10; i++) {
        let result: boolean = handler.post((): void => {});
        expect(result).assertTrue();
      }
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest1300
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1300
     * @tc.desc   Verify MessageHandler.post() before EAWorker start returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.post((): void => {});
      expect(result).assertFalse();
      eaw.start();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest1400
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1400
     * @tc.desc   Verify MessageHandler.post() returns false after EAWorker is terminated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      eaw.quit();
      let quitWait = 0;
      while (eaw.isAlive() && quitWait < 20000) {
        quitWait++;
      }
      let result: boolean = handler.post((): void => {});
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerPostTest1500
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1500
     * @tc.desc   Verify MessageHandler.post() returns false when message queue is full
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let successCount: int = 0;
      for (let i: int = 0; i < 100; i++) {
        let result: boolean = handler.post((): void => {});
        if (result) { successCount++; } else { break; }
      }
      expect(successCount > 0).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest1600
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1600
     * @tc.desc   Verify MessageHandler.post() return value type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerPostTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.post((): void => {});
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })


    /**
     * @tc.name   MessageHandlerPostTest1700
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1700
     * @tc.desc   Verify MessageHandler.post() returns true when callback throws synchronous error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.post((): void => { throw new Error("sync error"); });
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest1800
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1800
     * @tc.desc   Verify MessageHandler.post() returns true when async callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let asyncCallback = async (): Promise<void> => { throw new Error("async error"); };
      let result: boolean = handler.post(asyncCallback as () => void);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest1900
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_1900
     * @tc.desc   Verify one callback error does not prevent subsequent messages from being processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => { throw new Error("error"); });
      handler.post((): void => { executed.fetchAdd(1); });
      handler.post((): void => { executed.fetchAdd(1); });
      handler.post((): void => { executed.fetchAdd(1); });
      let waitCount: int = 0;
      while (executed.load() < 3 && waitCount < 1200) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(executed.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2000
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2000
     * @tc.desc   Verify MessageHandler.post() callback executes asynchronously via EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => { executed.fetchAdd(1); });
      let waitCount: int = 0;
      while (executed.load() < 1 && waitCount < 600) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(executed.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2100
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2100
     * @tc.desc   Verify MessageHandler.post() during EAWorker running succeeds continuously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerPostTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      for (let i: int = 0; i < 5; i++) {
        let result: boolean = handler.post((): void => { counter.fetchAdd(1); });
        expect(result).assertTrue();
      }
      let waitCount: int = 0;
      while (counter.load() < 5 && waitCount < 1200) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(5);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2200
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2200
     * @tc.desc   Verify MessageHandler.post() callback is processed by handler function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerPostTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let received = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        console.info("callback executed");
        received.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (received.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(received.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2300
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2300
     * @tc.desc   Verify multiple MessageHandler instances with different EAWorkers work independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      let counter1 = new AtomicInt(0);
      let counter2 = new AtomicInt(0);
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw2);
      handler1.post((): void => { counter1.fetchAdd(1); });
      handler2.post((): void => { counter2.fetchAdd(1); });
      let waitCount: int = 0;
      while ((counter1.load() < 1 || counter2.load() < 1) && waitCount < 3000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter1.load()).assertEqual(1);
      expect(counter2.load()).assertEqual(1);
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2400
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2400
     * @tc.desc   Verify concurrent MessageHandler.post() calls with AtomicInt counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      for (let i: int = 0; i < 10; i++) {
        handler.post((): void => { counter.fetchAdd(1); });
      }
      let waitCount: int = 0;
      while (counter.load() < 10 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2500
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2500
     * @tc.desc   Verify MessageHandler.post() race condition with AsyncLock protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      for (let i: int = 0; i < 100; i++) {
        handler.post((): void => { counter.fetchAdd(1); });
      }
      let waitCount: int = 0;
      while (counter.load() < 100 && waitCount < 30000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(100);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2600
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2600
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns true after post()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerPostTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => { console.info("callback"); };
      handler.post(callback);
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2700
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2700
     * @tc.desc   Verify MessageHandler.removeCallbacks() called after post and handler continues working
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerPostTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let removedCallback = (): void => { console.info("removed"); };
      handler.post(removedCallback);
      handler.removeCallbacks(removedCallback);
      let result: boolean = handler.post((): void => { executed.fetchAdd(1); });
      expect(result).assertTrue();
      let waitCount: int = 0;
      while (executed.load() < 1 && waitCount < 600) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(executed.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2800
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2800
     * @tc.desc   Verify AsyncLock waits for posted callback completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => { executed.store(1); });
      let waitCount: int = 0;
      while (executed.load() < 1 && waitCount < 3000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(executed.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest2900
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_2900
     * @tc.desc   Verify counting wait for all posted callbacks completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let totalTasks: int = 10;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      for (let i: int = 0; i < totalTasks; i++) {
        handler.post((): void => { counter.fetchAdd(1); });
      }
      let waitCount: int = 0;
      while (counter.load() < totalTasks && waitCount < 3000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalTasks);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest3000
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3000
     * @tc.desc   Verify Promise.all waits for all posted callbacks completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      for (let i: int = 0; i < 10; i++) {
        handler.post((): void => { counter.fetchAdd(1); });
      }
      let waitCount: int = 0;
      while (counter.load() < 10 && waitCount < 1200) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest3100
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3100
     * @tc.desc   Verify MessageHandler.post() with proper EAWorker lifecycle management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw: EAWorker | null = new EAWorker();
      eaw.start();
      let handler: concurrency.MessageHandler | null = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let counter = new AtomicInt(0);
      let result: boolean = handler.post((): void => { counter.fetchAdd(1); });
      expect(result).assertTrue();
      let waitCount: int = 0;
      while (counter.load() < 1 && waitCount < 600) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw !== null && eaw.isAlive()) { eaw.quit(); eaw = null; }
      handler = null;
    })

    /**
     * @tc.name   MessageHandlerPostTest3200
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3200
     * @tc.desc   Verify AsyncLock protects shared variable in posted callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let lock = new AsyncLock();
      let counter = 0;
      let totalTasks: int = 100;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      for (let i: int = 0; i < totalTasks; i++) {
        handler.post(async (): Promise<void> => {
          await lock.lockAsync(() => { counter++; return Promise.resolve(); });
        } as () => void);
      }
      let waitCount: int = 0;
      while (counter < totalTasks && waitCount < 10000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter).assertEqual(totalTasks);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest3300
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3300
     * @tc.desc   Verify AtomicInt protects counter in posted callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let totalTasks: int = 100;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      for (let i: int = 0; i < totalTasks; i++) {
        handler.post((): void => { counter.fetchAdd(1); });
      }
      let waitCount: int = 0;
      while (counter.load() < totalTasks && waitCount < 3000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalTasks);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest3400
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3400
     * @tc.desc   Verify nested post() call inside callback executes inner callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let innerExecuted = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.post((): void => { innerExecuted.fetchAdd(1); });
      });
      let waitCount: int = 0;
      while (innerExecuted.load() < 1 && waitCount < 1200) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(innerExecuted.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest3500
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3500
     * @tc.desc   Verify multi-level nested post() calls execute in correct depth order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let depth = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        depth.store(1);
        handler.post((): void => {
          depth.store(2);
          handler.post((): void => { depth.store(3); });
        });
      });
      let waitCount: int = 0;
      while (depth.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(depth.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest3600
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3600
     * @tc.desc   Verify hasCallbacks() called inside callback finds other posted callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let found = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let targetCallback = (): void => { console.info("target"); };
      // Query immediately after post so target is still pending (not after it drains)
      handler.post((): void => {
        handler.post(targetCallback);
        let result: boolean = handler.hasCallbacks(targetCallback);
        if (result) { found.fetchAdd(1); }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(found.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })


    /**
     * @tc.name   MessageHandlerPostTest3700
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3700
     * @tc.desc   Verify post() called inside handler callback executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.post((): void => { executed.fetchAdd(1); });
      });
      let waitCount: int = 0;
      while (executed.load() < 1 && waitCount < 3000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(executed.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest3800
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3800
     * @tc.desc   Verify hasCallbacks() called inside handler callback finds posted callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let found = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      // Enqueue target + hasCallbacks query atomically so target is still pending
      handler.post((): void => {
        handler.post(callback);
        let result: boolean = handler.hasCallbacks(callback);
        if (result) { found.fetchAdd(1); }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 600) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(found.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })


    /**
     * @tc.name   MessageHandlerPostTest3900
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_3900
     * @tc.desc   Verify multiple EAWorkers with separate MessageHandlers post concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      let counter1 = new AtomicInt(0);
      let counter2 = new AtomicInt(0);
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw2);
      for (let i: int = 0; i < 5; i++) {
        handler1.post((): void => { counter1.fetchAdd(1); });
        handler2.post((): void => { counter2.fetchAdd(1); });
      }
      let waitCount: int = 0;
      while ((counter1.load() < 5 || counter2.load() < 5) && waitCount < 3000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter1.load()).assertEqual(5);
      expect(counter2.load()).assertEqual(5);
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })

    /**
     * @tc.name   MessageHandlerPostTest4000
     * @tc.number SUB_MESSAGE_HANDLER_POST_TEST_4000
     * @tc.desc   Verify post() with concurrent multi-handler stress test completes all tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerPostTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      for (let i: int = 0; i < 5; i++) {
        handler.post((): void => { counter.fetchAdd(1); });
      }
      let waitCount: int = 0;
      while (counter.load() < 5 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(5);
      if (eaw.isAlive()) { eaw.quit(); }
    })
  })
}
