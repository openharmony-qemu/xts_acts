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

export default function MessageHandlerRemoveCallbacksTest(): void {
  describe('MessageHandlerRemoveCallbacksTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0100
     * @tc.desc   Verify MessageHandler.removeCallbacks() with required callback parameter returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveCallbacksTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => { console.info("callback"); };
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        if (handler.removeCallbacks(callback)) {
          removed.fetchAdd(1);
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0200
     * @tc.desc   Verify MessageHandler.removeCallbacks() with arrow function callback returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveCallbacksTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let arrowCallback = (): void => { console.info("arrow callback"); };
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(arrowCallback, handler));
        if (handler.removeCallbacks(arrowCallback)) {
          removed.fetchAdd(1);
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0300
     * @tc.desc   Verify MessageHandler.removeCallbacks() removes all messages with same callback reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveCallbacksTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      let postedCallback = (): void => {
        for (let i: int = 0; i < 10; i++) {
          handler.sendMessage(new concurrency.Message(callback, handler));
        }
        let result: boolean = handler.removeCallbacks(callback);
        if (result) { verified.fetchAdd(1); }
        let result2: boolean = handler.removeCallbacks(callback);
        if (!result2) { verified.fetchAdd(1); }
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(verified.load()).assertEqual(2);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0400
     * @tc.desc   Verify MessageHandler.removeCallbacks() with different callback reference returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveCallbacksTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback1 = (): void => {};
      let callback2 = (): void => {};
      handler.sendMessage(new concurrency.Message(callback1, handler));
      let result: boolean = handler.removeCallbacks(callback2);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0500
     * @tc.desc   Verify MessageHandler.removeCallbacks() with empty body callback returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveCallbacksTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        if (handler.removeCallbacks(callback)) {
          removed.fetchAdd(1);
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0600
     * @tc.desc   Verify MessageHandler.removeCallbacks() with closure callback returns true and closure not executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let counter = new AtomicInt(0);
      let callback = (): void => { counter.fetchAdd(1); };
      let postedCallback = (): void => {
        for (let i: int = 0; i < 10; i++) {
          handler.sendMessage(new concurrency.Message(callback, handler));
        }
        let result: boolean = handler.removeCallbacks(callback);
        if (result) { removed.fetchAdd(1); }
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (removed.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(removed.load()).assertEqual(1);
      expect(counter.load()).assertEqual(0);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0700
     * @tc.desc   Verify MessageHandler.removeCallbacks() with null callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let nullCallbackHolder: (() => void) | null = null;
      let caught = false;
      try {
        handler.removeCallbacks(nullCallbackHolder!);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0800
     * @tc.desc   Verify MessageHandler.removeCallbacks() with undefined callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let undefinedCallbackHolder: (() => void) | undefined = undefined;
      let caught = false;
      try {
        handler.removeCallbacks(undefinedCallbackHolder!);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest0900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_0900
     * @tc.desc   Verify MessageHandler.removeCallbacks() removes existing callback message returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveCallbacksTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => { console.info("test"); };
      let postedCallback = (): void => {
        let msg = new concurrency.Message(callback, handler);
        handler.sendMessage(msg);
        if (handler.removeCallbacks(callback)) {
          removed.fetchAdd(1);
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1000
     * @tc.desc   Verify MessageHandler.removeCallbacks() with non-existing callback returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveCallbacksTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {};
      let result: boolean = handler.removeCallbacks(callback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })



    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1100
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns false when queue has only what-type messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, handler));
      let callback = (): void => {};
      let result: boolean = handler.removeCallbacks(callback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1200
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      // send + removeCallbacks atomically on handler thread (avoid post/remove vs send race)
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        if (handler.removeCallbacks(callback)) {
          removed.fetchAdd(1);
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })
    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1300
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns false after message already processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => { executed.fetchAdd(1); };
      handler.sendMessage(new concurrency.Message(callback, handler));
      let waitCount: int = 0;
      while (executed.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(executed.load()).assertEqual(1);
      let result: boolean = handler.removeCallbacks(callback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })


    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1400
     * @tc.desc   Verify MessageHandler.removeCallbacks() removes all callbacks sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback1 = (): void => {};
      let callback2 = (): void => {};
      let callback3 = (): void => {};
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(callback1, handler));
        handler.sendMessage(new concurrency.Message(callback2, handler));
        handler.sendMessage(new concurrency.Message(callback3, handler));
        let result1: boolean = handler.removeCallbacks(callback1);
        if (result1) { removed.fetchAdd(1); }
        let result2: boolean = handler.removeCallbacks(callback2);
        if (result2) { removed.fetchAdd(1); }
        let result3: boolean = handler.removeCallbacks(callback3);
        if (result3) { removed.fetchAdd(1); }
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (removed.load() < 3 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(removed.load()).assertEqual(3);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1500
     * @tc.desc   Verify MessageHandler.removeCallbacks() removes all same callback messages sent multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      let postedCallback = (): void => {
        for (let i: int = 0; i < 5; i++) {
          handler.sendMessage(new concurrency.Message(callback, handler));
        }
        let result: boolean = handler.removeCallbacks(callback);
        if (result) { verified.fetchAdd(1); }
        let result2: boolean = handler.removeCallbacks(callback);
        if (!result2) { verified.fetchAdd(1); }
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(verified.load()).assertEqual(2);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1600
     * @tc.desc   Verify MessageHandler.removeCallbacks() called from EAWorker callback removes message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => { console.info("worker callback"); };
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        handler.sendMessage(new concurrency.Message(callback, handler));
        handler.sendMessage(new concurrency.Message(callback, handler));
        let result: boolean = handler.removeCallbacks(callback);
        if (result) { removed.fetchAdd(1); }
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1700
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns false after message already processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveCallbacksTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      handler.post(callback);
      let postedCallback = (): void => {
        let hasBefore: boolean = handler.hasCallbacks(callback);
        let removeResult: boolean = handler.removeCallbacks(callback);
        if (hasBefore && removeResult) {
          handler.hasCallbacks(callback);
        }
      };
      handler.post(postedCallback);
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect(error).assertFail();
      }
      let result: boolean = handler.removeCallbacks(callback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1800
     * @tc.desc   Verify MessageHandler.removeCallbacks() repeated call returns false after first removal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let verified = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        if (handler.removeCallbacks(callback)) {
          verified.fetchAdd(1);
        }
        if (!handler.removeCallbacks(callback)) {
          verified.fetchAdd(1);
        }
        if (!handler.removeCallbacks(callback)) {
          verified.fetchAdd(1);
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
      expect(verified.load()).assertEqual(3);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest1900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_1900
     * @tc.desc   Verify MessageHandler.removeCallbacks() removes large number of callback messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveCallbacksTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let verified = new AtomicInt(0);
      let callback = (): void => {};
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      // Send 100 callback messages inside post and verify removal
      let postedCallback = (): void => {
        for (let i: int = 0; i < 100; i++) {
          handler.sendMessage(new concurrency.Message(callback, handler));
        }
        let result: boolean = handler.removeCallbacks(callback);
        if (result) { verified.fetchAdd(1); }
        // Second remove should fail (all already removed)
        let result2: boolean = handler.removeCallbacks(callback);
        if (!result2) { verified.fetchAdd(1); }
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(verified.load()).assertEqual(2);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest2000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_2000
     * @tc.desc   Verify MessageHandler.removeCallbacks() after sending many what-type messages returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveCallbacksTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      let postedCallback = (): void => {
        for (let i: int = 0; i < 100; i++) {
          handler.sendMessage(new concurrency.Message(i, handler));
        }
        handler.sendMessage(new concurrency.Message(callback, handler));
        if (handler.removeCallbacks(callback)) {
          removed.fetchAdd(1);
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })


    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest2100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_2100
     * @tc.desc   Verify MessageHandler.removeCallbacks() removes queued callback messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveCallbacksTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removeCount = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      let postedCallback = (): void => {
        for (let i: int = 0; i < 10; i++) {
          handler.sendMessage(new concurrency.Message(callback, handler));
        }
        let result: boolean = handler.removeCallbacks(callback);
        if (result) { removeCount.fetchAdd(1); }
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
      expect(removeCount.load()).assertEqual(1);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest2200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_2200
     * @tc.desc   Verify MessageHandler.removeCallbacks() removes multiple callbacks with counting wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveCallbacksTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removeCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let postedCallback = (): void => {
        let callbacks: (() => void)[] = [];
        for (let i: int = 0; i < 10; i++) {
          let cb = (): void => {};
          callbacks.push(cb);
          handler.sendMessage(new concurrency.Message(cb, handler));
        }
        for (let i: int = 0; i < callbacks.length; i++) {
          let result: boolean = handler.removeCallbacks(callbacks[i]);
          if (result) { removeCount.fetchAdd(1); }
        }
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (removeCount.load() < 10 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(removeCount.load()).assertEqual(10);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest2300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_2300
     * @tc.desc   Verify MessageHandler.removeCallbacks() inside callback after post removes inner callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveCallbacksTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let innerCallback = (): void => { console.info("inner"); };
      // Merge into single post to avoid race between two separate posts
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(innerCallback, handler));
        let result: boolean = handler.removeCallbacks(innerCallback);
        if (result) { removed.fetchAdd(1); }
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (removed.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(removed.load()).assertEqual(1);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest2400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_2400
     * @tc.desc   Verify MessageHandler.removeCallbacks() inside callback removes other posted callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveCallbacksTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let otherCallback = (): void => {};
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(otherCallback, handler));
        let result: boolean = handler.removeCallbacks(otherCallback);
        if (result) { removed.fetchAdd(1); }
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest2500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_2500
     * @tc.desc   Verify MessageHandler.removeCallbacks() removes sent callback message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveCallbacksTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      // Merge into single post to avoid race between two separate posts
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        let result: boolean = handler.removeCallbacks(callback);
        if (result) { removed.store(1); }
      };
      handler.post(postedCallback);
      let waitCount: int = 0;
      while (removed.load() < 1 && waitCount < 50) {
        waitCount++;
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect(error).assertFail();
        }
      }
      expect(removed.load()).assertEqual(1);
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest2600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_2600
     * @tc.desc   Verify MessageHandler.removeCallbacks() with anonymous function reference returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(() => {}, handler));
      let removedEmptyCallback = (): void => {};
      let result: boolean = handler.removeCallbacks(removedEmptyCallback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerRemoveCallbacksTest2700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_CALLBACKS_TEST_2700
     * @tc.desc   Verify MessageHandler.removeCallbacks() with closure function reference preserved returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveCallbacksTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let count: int = 0;
      let callback = (): void => { count = count + 1; };
      let postedCallback = (): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        if (handler.removeCallbacks(callback)) {
          removed.fetchAdd(1);
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
      if (eaw.isAlive()) {
        try {
          eaw.quit();
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

  })
}
