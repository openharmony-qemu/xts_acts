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

export default function MessageHandlerHasCallbacksTest(): void {
  describe('MessageHandlerHasCallbacksTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0100
     * @tc.desc   Verify MessageHandler.hasCallbacks() with required callback parameter returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let callback = (): void => { console.info("callback") };
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0200
     * @tc.desc   Verify MessageHandler.hasCallbacks() with arrow function callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let arrowCallback = (): void => { console.info("arrow callback"); };
      let result: boolean = handler.hasCallbacks(arrowCallback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0300
     * @tc.desc   Verify MessageHandler.hasCallbacks() with empty body callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let emptyCallback = (): void => {};
      let result: boolean = handler.hasCallbacks(emptyCallback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0400
     * @tc.desc   Verify MessageHandler.hasCallbacks() with null callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let nullCallbackHolder: (() => void) | null = null;
      let caught = false;
      try {
        // Cast keeps a runtime null while satisfying ArkTS ensure-not-nullish rules.
        handler.hasCallbacks(nullCallbackHolder as (() => void));
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0500
     * @tc.desc   Verify MessageHandler.hasCallbacks() with undefined callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let undefinedCallbackHolder: (() => void) | undefined = undefined;
      let caught = false;
      try {
        // Cast keeps a runtime undefined while satisfying ArkTS ensure-not-nullish rules.
        handler.hasCallbacks(undefinedCallbackHolder as (() => void));
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0600
     * @tc.desc   Verify MessageHandler.hasCallbacks() with closure callback that captures outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let counter: int = 0;
      let closureCallback = (): void => { counter++; };
      let result: boolean = handler.hasCallbacks(closureCallback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0700
     * @tc.desc   Verify MessageHandler.hasCallbacks() with callback returning non-void value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let returnCallback = (): string => { return "test"; };
      let result: boolean = handler.hasCallbacks(returnCallback as () => void);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0800
     * @tc.desc   Verify MessageHandler.hasCallbacks() with async callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let asyncCallback = async (): Promise<void> => { await Utils.msSleep(100); };
      let result: boolean = handler.hasCallbacks(asyncCallback as () => void);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest0900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_0900
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns true when callback-constructed message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let callback = (): void => { console.info("this is callback") };
      let msg = new concurrency.Message(callback, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1000
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns false when querying different callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let callback1 = (): void => { console.info("callback1") };
      let callback2 = (): void => { console.info("callback2") };
      let msg = new concurrency.Message(callback1, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasCallbacks(callback2);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1100
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns false before any message is sent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let callback = (): void => { console.info("callback") };
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1200
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns true for callback sent via post method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message get");
      }, eaw);
      let callback = (): void => { console.info("post task"); };
      handler.post(callback);
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1300
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns false after removeCallbacks for sendMessage-queued message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasCallbacksTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // start + atomic send/removeCallbacks; assert hasCallbacks false after post returns
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => { console.info("callback") };
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        if (handler.removeCallbacks(callback)) {
          removed.fetchAdd(1);
        }
        doneCount.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (doneCount.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
      // hasCallbacks may briefly still see CANCELLED after remove
      waitCount = 0;
      while (handler.hasCallbacks(callback) && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(handler.hasCallbacks(callback)).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1400
     * @tc.desc   Verify MessageHandler.hasCallbacks() return value type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let callback = (): void => {};
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })


    /**
     * @tc.name   MessageHandlerHasCallbacksTest1500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1500
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns true after sending same callback multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let callback = (): void => { console.info("callback") };
      for (let i: int = 0; i < 10; i++) {
        let msg = new concurrency.Message(callback, handler);
        handler.sendMessage(msg);
      }
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1600
     * @tc.desc   Verify MessageHandler.hasCallbacks() callback isolation between different MessageHandlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("handler1");
      }, eaw);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("handler2");
      }, eaw);
      let callback = (): void => { console.info("callback") };
      let msg = new concurrency.Message(callback, handler1);
      handler1.sendMessage(msg);
      expect(handler1.hasCallbacks(callback)).assertTrue();
      expect(handler2.hasCallbacks(callback)).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1700
     * @tc.desc   Verify MessageHandler.hasCallbacks() after EAWorker is terminated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message");
      }, eaw);
      eaw.quit();
      let callback = (): void => {};
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1800
     * @tc.desc   Verify MessageHandler.hasCallbacks() after async message sending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message");
      }, eaw);
      let callback = (): void => { console.info("callback") };
      let msg = new concurrency.Message(callback, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest1900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_1900
     * @tc.desc   Verify MessageHandler.hasCallbacks() with multiple queries on same callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message");
      }, eaw);
      let callback = (): void => { console.info("callback") };
      let msg = new concurrency.Message(callback, handler);
      handler.sendMessage(msg);
      let results: boolean[] = [];
      for (let i: int = 0; i < 5; i++) {
        results.push(handler.hasCallbacks(callback));
      }
      for (let i: int = 0; i < results.length; i++) {
        expect(results[i]).assertTrue();
      }
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })


    /**
     * @tc.name   MessageHandlerHasCallbacksTest2000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2000
     * @tc.desc   Verify MessageHandler.hasCallbacks() state changes from true to false after removeCallbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // start + atomic post/removeCallbacks; assert hasCallbacks false after post returns
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let targetCallback = (): void => { console.info("callback"); };
      handler.post((): void => {
        handler.post(targetCallback);
        if (handler.removeCallbacks(targetCallback)) {
          removed.fetchAdd(1);
        }
        doneCount.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (doneCount.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
      // hasCallbacks may briefly still see CANCELLED after remove
      waitCount = 0;
      while (handler.hasCallbacks(targetCallback) && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(handler.hasCallbacks(targetCallback)).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest2100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2100
     * @tc.desc   Verify MessageHandler.hasCallbacks() with multiple different callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message");
      }, eaw);
      let callback1 = (): void => { console.info("callback1"); };
      let callback2 = (): void => { console.info("callback2"); };
      let callback3 = (): void => { console.info("callback3"); };
      handler.post(callback1);
      handler.post(callback2);
      handler.post(callback3);
      expect(handler.hasCallbacks(callback1)).assertTrue();
      expect(handler.hasCallbacks(callback2)).assertTrue();
      expect(handler.hasCallbacks(callback3)).assertTrue();
      let callback4 = (): void => { console.info("callback4"); };
      expect(handler.hasCallbacks(callback4)).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest2200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2200
     * @tc.desc   Verify MessageHandler.hasCallbacks() after partial removeCallbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasCallbacksTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let removedOk = new AtomicInt(0);
      let has2Ok = new AtomicInt(0);
      let doneCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback1 = (): void => { console.info("callback1"); };
      let callback2 = (): void => { console.info("callback2"); };
      // send+remove+has atomically inside post to avoid queue drain races
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(callback1, handler));
        handler.sendMessage(new concurrency.Message(callback2, handler));
        if (handler.removeCallbacks(callback1)) {
          removedOk.fetchAdd(1);
        }
        if (handler.hasCallbacks(callback2)) {
          has2Ok.fetchAdd(1);
        }
        doneCount.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (doneCount.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      // hasCallbacks may briefly still see CANCELLED after remove
      waitCount = 0;
      while (handler.hasCallbacks(callback1) && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removedOk.load()).assertEqual(1);
      expect(handler.hasCallbacks(callback1)).assertFalse();
      expect(has2Ok.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest2300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2300
     * @tc.desc   Verify MessageHandler.hasCallbacks() isolation between different EAWorkers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("handler1");
      }, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("handler2");
      }, eaw2);
      let callback = (): void => { console.info("callback") };
      let msg1 = new concurrency.Message(callback, handler1);
      handler1.sendMessage(msg1);
      expect(handler1.hasCallbacks(callback)).assertTrue();
      expect(handler2.hasCallbacks(callback)).assertFalse();
      if (eaw1.isAlive()) {
        eaw1.quit();
      }
      if (eaw2.isAlive()) {
        eaw2.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest2400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2400
     * @tc.desc   Verify MessageHandler.hasCallbacks() with proper EAWorker lifecycle management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw: EAWorker | null = new EAWorker();
      eaw.start();
      let handler: concurrency.MessageHandler | null = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message");
      }, eaw);
      let callback = (): void => {};
      let result: boolean = handler.hasCallbacks(callback);
      expect(result).assertFalse();
      if (eaw !== null && eaw.isAlive()) {
        eaw.quit();
        eaw = null;
      }
      handler = null;
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest2500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2500
     * @tc.desc   Verify MessageHandler.hasCallbacks() after posting inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let found = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let innerCallback = (): void => { console.info("inner"); };
      let outerCallback = (): void => {
        handler.post(innerCallback);
        let result: boolean = handler.hasCallbacks(innerCallback);
        if (result) {
          found.fetchAdd(1);
        }
      };
      handler.post(outerCallback);
      let waitCount: int = 0;
      while (found.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(found.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest2600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2600
     * @tc.desc   Verify MessageHandler.hasCallbacks() called inside callback queries pending callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let found = new AtomicInt(0);
      let blockEntered = new AtomicInt(0);
      let releaseBlock = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let targetCallback = (): void => {};
      let blocker = (): void => {
        blockEntered.fetchAdd(1);
        let spinCount: int = 0;
        while (releaseBlock.load() == 0 && spinCount < 50000000) {
          spinCount++;
        }
      };
      let queryCallback = (): void => {
        let result: boolean = handler.hasCallbacks(targetCallback);
        if (result) {
          found.fetchAdd(1);
        }
      };
      handler.post(blocker);
      let waitCount: int = 0;
       while (blockEntered.load() < 1 && waitCount < 50) {
         waitCount++;
         await Utils.msSleep(100);
       }
       handler.post(queryCallback);
       handler.post(targetCallback);
       releaseBlock.fetchAdd(1);
       expect(blockEntered.load()).assertEqual(1);
      waitCount = 0;
      while (found.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(found.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
      done();
    })


    /**
     * @tc.name   MessageHandlerHasCallbacksTest2700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2700
     * @tc.desc   Verify MessageHandler.hasCallbacks() with Atomics compareExchange for query count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageHandlerHasCallbacksTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback = (): void => {};
      handler.post(callback);
      let queryCount = new AtomicInt(0);
      let tasksDone = new AtomicInt(0);
      for (let i: int = 0; i < 10; i++) {
        handler.post((): void => {
          queryCount.fetchAdd(1);
          tasksDone.fetchAdd(1);
        });
      }
      let waitCount: int = 0;
      while (tasksDone.load() < 10 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(tasksDone.load()).assertEqual(10);
      if (eaw.isAlive()) {
        eaw.quit();
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest2800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2800
     * @tc.desc   Verify MessageHandler.hasCallbacks() with multiple EAWorkers querying same handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasCallbacksTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let queryDone = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback = (): void => {};
      let queryCallback = (): void => {
        let r: boolean = handler.hasCallbacks(callback);
        if (r) {
          queryDone.fetchAdd(1);
        }
      };
      let msg = new concurrency.Message(callback, handler);
      handler.sendMessage(msg);
      handler.post(queryCallback);
      let waitCount: int = 0;
      while (queryDone.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(queryDone.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasCallbacksTest2900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_CALLBACKS_TEST_2900
     * @tc.desc   Verify MessageHandler.hasCallbacks() queried from TaskPool concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageHandlerHasCallbacksTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback = (): void => {};
      handler.post(callback);
      let queryResults = new AtomicInt(0);
      let tasksDone = new AtomicInt(0);
      for (let i: int = 0; i < 5; i++) {
        handler.post((): void => {
          let r: boolean = handler.hasCallbacks(callback);
          if (r) {
            queryResults.fetchAdd(1);
          }
          tasksDone.fetchAdd(1);
        });
      }
      let waitCount: int = 0;
      while (tasksDone.load() < 5 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(tasksDone.load()).assertEqual(5);
      if (eaw.isAlive()) {
        eaw.quit();
      }
      done();
    })
  })
}
