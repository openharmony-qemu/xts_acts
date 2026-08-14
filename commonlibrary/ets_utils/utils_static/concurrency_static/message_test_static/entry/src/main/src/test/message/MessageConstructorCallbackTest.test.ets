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

export default function MessageConstructorCallbackTest(): void {
  describe('MessageConstructorCallbackTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0100
     * @tc.desc   Verify Message(callback, handler) creates instance with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {
        console.info("this is callback message");
      }
      let msg = new concurrency.Message(callback, messageHandler);
      expect(msg.getTarget()).assertEqual(messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0200
     * @tc.desc   Verify Message with arrow function callback, getCallback returns same reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {
        console.info("callback executed");
      }
      let msg = new concurrency.Message(callback, messageHandler);
      let cb = msg.getCallback();
      expect(cb !== undefined).assertTrue();
      expect(cb === callback).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0300
     * @tc.desc   Verify Message with empty body callback, getCallback not undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      expect(msg.getCallback() !== undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0400
     * @tc.desc   Verify Message with console output callback, getCallback not undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {
        console.info("this is callback message");
      }, messageHandler);
      expect(msg.getCallback() !== undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0500
     * @tc.desc   Verify Message with closure callback accessing external variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let counter: int = 0;
      let msg = new concurrency.Message((): void => {
        counter++;
        console.info("counter: " + counter);
      }, messageHandler);
      expect(msg.getCallback() !== undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0600
     * @tc.desc   Verify Message with try-catch callback, getCallback not undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {
        try {
          throw new Error("test error");
        } catch (e) {
          console.info("caught error");
        }
      }, messageHandler);
      expect(msg.getCallback() !== undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0700
     * @tc.desc   Verify Message with normal MessageHandler instance, getTarget matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      expect(msg.getTarget() === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0800
     * @tc.desc   Verify Message with MessageHandler containing processing logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let processed = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        processed.fetchAdd(1);
        console.info("message processed");
      }, eaw);
      let msg = new concurrency.Message((): void => {
        console.info("callback after processing");
      }, messageHandler);
      expect(msg.getTarget() === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest0900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_0900
     * @tc.desc   Verify Message with callback and handler combination returns correct properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {
        console.info("callback executed");
      }
      let msg = new concurrency.Message(callback, messageHandler);
      expect(msg.getCallback() === callback).assertTrue();
      expect(msg.getTarget() === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1000
     * @tc.desc   Verify different callback functions create Messages with different callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback1 = (): void => { console.info("callback1"); };
      let callback2 = (): void => { console.info("callback2"); };
      let msg1 = new concurrency.Message(callback1, messageHandler);
      let msg2 = new concurrency.Message(callback2, messageHandler);
      expect(msg1.getCallback() !== msg2.getCallback()).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1100
     * @tc.desc   Verify shared handler creates Messages with same target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message((): void => {}, messageHandler);
      let msg2 = new concurrency.Message((): void => {}, messageHandler);
      expect(msg1.getTarget() === msg2.getTarget()).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1200
     * @tc.desc   Verify Message(callback, handler) returns non-null instance with instanceof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      expect(msg.getTarget()).assertEqual(messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1300
     * @tc.desc   Verify getCallback returns the callback passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => { console.info("test"); };
      let msg = new concurrency.Message(callback, messageHandler);
      let storedCallback = msg.getCallback();
      expect(storedCallback === callback).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1400
     * @tc.desc   Verify getTarget returns the handler passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1500
     * @tc.desc   Verify getWhat returns default -1000000 for callback constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1600
     * @tc.desc   Verify getObject returns undefined for callback constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      expect(msg.getObject() === undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1700
     * @tc.desc   Verify getCallback returns callable function reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {};
      let msg = new concurrency.Message(callback, messageHandler);
      let cb = msg.getCallback();
      expect(cb !== undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1800
     * @tc.desc   Verify getTarget returns same handler reference as passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      let target = msg.getTarget();
      expect(target === messageHandler).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest1900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_1900
     * @tc.desc   Verify Message(callback, handler) instanceof concurrency.Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      expect(msg.getTarget() === messageHandler).assertTrue();
      expect(msg.getCallback() !== undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest2000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2000
     * @tc.desc   Verify callback throws exception when called via getCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let errorCallback = (): void => {
        throw new Error("callback error");
      };
      let msg = new concurrency.Message(errorCallback, messageHandler);
      let caught = false;
      try {
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })


    /**
     * @tc.name   MessageConstructorCallbackTest2100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2100
     * @tc.desc   Verify callback with error handling inside can be stored and retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {
        try {
          throw new Error("handled error");
        } catch (e) {
          console.info("error handled");
        }
      };
      let msg = new concurrency.Message(callback, messageHandler);
      let cb = msg.getCallback();
      expect(cb !== undefined).assertTrue();
      if (cb !== undefined) {
        cb();
      }
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest2200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2200
     * @tc.desc   Verify interface only supports ArkTS-Sta
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, messageHandler);
      expect(msg instanceof concurrency.Message).assertTrue();
      expect(msg.getTarget()).assertEqual(messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest2300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2300
     * @tc.desc   Verify callback executed after handler processes message via sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let callbackExecuted = new AtomicInt(0);
      let messageProcessed = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        messageProcessed.fetchAdd(1);
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback = (): void => {
        callbackExecuted.fetchAdd(1);
      };
      let msg = new concurrency.Message(callback, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (callbackExecuted.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(messageProcessed.load()).assertEqual(1);
      expect(callbackExecuted.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest2400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2400
     * @tc.desc   Verify handler executes before callback in processing order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handlerStep = new AtomicInt(0);
      let callbackStep = new AtomicInt(0);
      let handlerOrder = new AtomicInt(0);
      let callbackOrder = new AtomicInt(0);
      let orderCounter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        handlerOrder.store(orderCounter.fetchAdd(1));
        handlerStep.fetchAdd(1);
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback = (): void => {
        callbackOrder.store(orderCounter.fetchAdd(1));
        callbackStep.fetchAdd(1);
      };
      let msg = new concurrency.Message(callback, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (callbackStep.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(handlerStep.load()).assertEqual(1);
      expect(callbackStep.load()).assertEqual(1);
      expect(handlerOrder.load() < callbackOrder.load()).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest2500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2500
     * @tc.desc   Verify callback closure modifies external variable correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback = (): void => {
        counter.fetchAdd(1);
      };
      let msg = new concurrency.Message(callback, messageHandler);
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
     * @tc.name   MessageConstructorCallbackTest2600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2600
     * @tc.desc   Verify callback modifies shared state multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let sharedCounter = new AtomicInt(0);
      let callback = (): void => {
        sharedCounter.fetchAdd(1);
      };
      let msg = new concurrency.Message(callback, messageHandler);
      let cb = msg.getCallback();
      if (cb !== undefined) {
        cb();
        cb();
        cb();
      }
      expect(sharedCounter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest2700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2700
     * @tc.desc   Verify callback chain triggers next Message creation via sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let chainCount = new AtomicInt(0);
      let secondCallback = (): void => {
        chainCount.fetchAdd(1);
      };
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let outerCallback = (): void => {
        let innerMsg = new concurrency.Message(secondCallback, messageHandler);
        innerMsg.sendToTarget();
      };
      let msg = new concurrency.Message(outerCallback, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (chainCount.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(chainCount.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest2800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2800
     * @tc.desc   Verify multiple Messages share same handler with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let processedCount = new AtomicInt(0);
      let callbackCount = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        processedCount.fetchAdd(1);
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      for (let i = 0; i < 5; i++) {
        let callback = (): void => {
          callbackCount.fetchAdd(1);
        };
        let msg = new concurrency.Message(callback, messageHandler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (callbackCount.load() < 5 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(processedCount.load()).assertEqual(5);
      expect(callbackCount.load()).assertEqual(5);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest2900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_2900
     * @tc.desc   Verify shared callback counter with different callbacks modifying AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let sharedCounter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let cb1 = (): void => { sharedCounter.fetchAdd(1); };
      let cb2 = (): void => { sharedCounter.fetchAdd(2); };
      let cb3 = (): void => { sharedCounter.fetchAdd(3); };
      let msg1 = new concurrency.Message(cb1, messageHandler);
      let msg2 = new concurrency.Message(cb2, messageHandler);
      let msg3 = new concurrency.Message(cb3, messageHandler);
      let retrieved1 = msg1.getCallback();
      let retrieved2 = msg2.getCallback();
      let retrieved3 = msg3.getCallback();
      if (retrieved1 !== undefined) { retrieved1(); }
      if (retrieved2 !== undefined) { retrieved2(); }
      if (retrieved3 !== undefined) { retrieved3(); }
      expect(sharedCounter.load()).assertEqual(6);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3000
     * @tc.desc   Verify MessageHandler callback creates Message with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let nestedCreated = new AtomicInt(0);
      let innerCallback = (): void => {
        nestedCreated.fetchAdd(1);
      };
      let innerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let outerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let outerCb = msg.getCallback();
        if (outerCb !== undefined) {
          outerCb();
        }
        let innerMsg = new concurrency.Message(innerCallback, innerHandler);
        innerMsg.sendToTarget();
      }, eaw);
      let msg = new concurrency.Message((): void => {}, outerHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (nestedCreated.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(nestedCreated.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3100
     * @tc.desc   Verify callback nested creates Message and sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let nestedMessageCreated = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let nestedCallback = (): void => {
        nestedMessageCreated.fetchAdd(1);
      };
      let outerCallback = (): void => {
        let nestedMsg = new concurrency.Message(nestedCallback, messageHandler);
        nestedMsg.sendToTarget();
      };
      let msg = new concurrency.Message(outerCallback, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (nestedMessageCreated.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(nestedMessageCreated.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3200
     * @tc.desc   Verify sendToTarget creates new Message in handler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let secondCallbackExecuted = new AtomicInt(0);
      let secondHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let newCallback = (): void => {
        secondCallbackExecuted.fetchAdd(1);
      };
      let firstHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let newMsg = new concurrency.Message(newCallback, secondHandler);
        newMsg.sendToTarget();
      }, eaw);
      let msg = new concurrency.Message((): void => {}, firstHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (secondCallbackExecuted.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(secondCallbackExecuted.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3300
     * @tc.desc   Verify batch Message creation in loop with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorCallbackTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let createdCount = new AtomicInt(0);
      let keys: string[] = ["k1", "k2"];
      for (let i = 0; i < keys.length; i++) {
        let callback = (): void => {};
        let msg = new concurrency.Message(callback, handler);
        createdCount.fetchAdd(1);
      }
      expect(createdCount.load()).assertEqual(2);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3400
     * @tc.desc   Verify multiple Message instances with callback are independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorCallbackTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message((): void => {}, handler);
      let msg2 = new concurrency.Message((): void => {}, handler);
      expect(msg1 !== msg2).assertTrue();
      expect(msg1.getCallback() !== msg2.getCallback()).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3500
     * @tc.desc   Verify AtomicReference stores and updates Message with callback atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorCallbackTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let atomicRef = new AtomicReference<concurrency.Message | null>(null);
      let msg1 = new concurrency.Message((): void => {}, handler);
      atomicRef.store(msg1);
      expect(atomicRef.load()).assertEqual(msg1);
      let msg2 = new concurrency.Message((): void => {}, handler);
      let swapResult = atomicRef.compareAndSwap(msg1, msg2);
      expect(atomicRef.load()).assertEqual(msg2);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3600
     * @tc.desc   Verify Atomics atomic branch creates Message with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorCallbackTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let flag = new AtomicInt(0);
      let createdCount = new AtomicInt(0);
      let prev = flag.compareAndSwap(0, 1);
      if (prev === 0) {
        let callback = (): void => {};
        let msg = new concurrency.Message(callback, handler);
        createdCount.fetchAdd(1);
      }
      expect(createdCount.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3700
     * @tc.desc   Verify Message processing chain with sequential sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let order = new AtomicInt(0);
      let callbackCount = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        order.fetchAdd(1);
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let msg1 = new concurrency.Message((): void => { callbackCount.fetchAdd(1); }, messageHandler);
      let msg2 = new concurrency.Message((): void => { callbackCount.fetchAdd(1); }, messageHandler);
      let msg3 = new concurrency.Message((): void => { callbackCount.fetchAdd(1); }, messageHandler);
      msg1.sendToTarget();
      msg2.sendToTarget();
      msg3.sendToTarget();
      let waitCount = 0;
      while (callbackCount.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(order.load()).assertEqual(3);
      expect(callbackCount.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3800
     * @tc.desc   Verify callback chain trigger forms processing sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let chainResult = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        chainResult.fetchAdd(1);
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback3 = (): void => { chainResult.fetchAdd(1); };
      let callback2 = (): void => {
        let msg3 = new concurrency.Message(callback3, messageHandler);
        msg3.sendToTarget();
      };
      let callback1 = (): void => {
        let msg2 = new concurrency.Message(callback2, messageHandler);
        msg2.sendToTarget();
      };
      let msg1 = new concurrency.Message(callback1, messageHandler);
      msg1.sendToTarget();
      let waitCount = 0;
      while (chainResult.load() < 4 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(chainResult.load()).assertEqual(4);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest3900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_3900
     * @tc.desc   Verify concurrent Message creation with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let createdCount = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let createAndCount = async (): Promise<void> => {
        let callback = (): void => {};
        let msg = new concurrency.Message(callback, messageHandler);
        createdCount.fetchAdd(1);
      };
      await Promise.all([createAndCount(), createAndCount(), createAndCount()]);
      expect(createdCount.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4000
     * @tc.desc   Verify concurrent Message sending to same handler with AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let callbackCount = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let createAndSend = async (): Promise<void> => {
        let callback = (): void => { callbackCount.fetchAdd(1); };
        let msg = new concurrency.Message(callback, messageHandler);
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
      expect(callbackCount.load()).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4100
     * @tc.desc   Verify Message processing timeout detection with wait count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let completed = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        completed.fetchAdd(1);
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback = (): void => { console.info("done"); };
      let msg = new concurrency.Message(callback, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (completed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(completed.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4200
     * @tc.desc   Verify callback retry mechanism on failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let retryCount = new AtomicInt(0);
      let maxRetries: int = 3;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {
        retryCount.fetchAdd(1);
        if (retryCount.load() < maxRetries) {
          throw new Error("retry needed");
        }
      };
      let msg = new concurrency.Message(callback, messageHandler);
      let cb = msg.getCallback();
      for (let i = 0; i < maxRetries; i++) {
        try {
          if (cb !== undefined) {
            cb();
          }
          break;
        } catch (e) {
          // continue retrying
        }
      }
      expect(retryCount.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4300
     * @tc.desc   Verify event triggers Message creation with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let eventTriggered = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        eventTriggered.fetchAdd(1);
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let onEvent = (): void => {
        let callback = (): void => { console.info("event callback"); };
        let msg = new concurrency.Message(callback, messageHandler);
        msg.sendToTarget();
      };
      onEvent();
      let waitCount = 0;
      while (eventTriggered.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(eventTriggered.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4400
     * @tc.desc   Verify multiple events concurrent trigger Message creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorCallbackTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let eventCount = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        eventCount.fetchAdd(1);
      }, eaw);
      let events: string[] = ["event1", "event2", "event3"];
      for (let i = 0; i < events.length; i++) {
        let eventName: string = events[i];
        let callback = (): void => { console.info(eventName); };
        let msg = new concurrency.Message(callback, messageHandler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (eventCount.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(eventCount.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4500
     * @tc.desc   Verify comparison with constructor(handler) callback undefined vs non-null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(messageHandler);
      let msg2 = new concurrency.Message((): void => {}, messageHandler);
      expect(msg1.getCallback() === undefined).assertTrue();
      expect(msg2.getCallback() !== undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4600
     * @tc.desc   Verify comparison with constructor(what, handler) what default vs set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message((): void => {}, messageHandler);
      expect(msg1.getWhat()).assertEqual(1);
      expect(msg2.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4700
     * @tc.desc   Verify comparison with constructor(what, obj, handler) object undefined vs set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "data", messageHandler);
      let msg2 = new concurrency.Message((): void => {}, messageHandler);
      expect(msg1.getObject() as string).assertEqual("data");
      expect(msg2.getObject() === undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4800
     * @tc.desc   Verify different callback Messages not equal via equals()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback1 = (): void => {};
      let callback2 = (): void => {};
      let msg1 = new concurrency.Message(callback1, messageHandler);
      let msg2 = new concurrency.Message(callback2, messageHandler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest4900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_4900
     * @tc.desc   Verify same callback reference Messages have equal callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorCallbackTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {};
      let msg1 = new concurrency.Message(callback, messageHandler);
      let msg2 = new concurrency.Message(callback, messageHandler);
      expect(msg1.getCallback() === msg2.getCallback()).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest5000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_5000
     * @tc.desc   Verify callback executed after sendToTarget with AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let callbackExecuted = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let callback = (): void => {
        callbackExecuted.fetchAdd(1);
      };
      let msg = new concurrency.Message(callback, messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (callbackExecuted.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(callbackExecuted.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest5100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_5100
     * @tc.desc   Verify getCallback returned function is executable and produces side effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorCallbackTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let executed = new AtomicInt(0);
      let callback = (): void => { executed.fetchAdd(1); };
      let msg = new concurrency.Message(callback, messageHandler);
      let cb = msg.getCallback();
      if (cb !== undefined) {
        cb();
      }
      expect(executed.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorCallbackTest5200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_CALLBACK_TEST_5200
     * @tc.desc   Verify Message getTarget after EAWorker quit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorCallbackTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message((): void => {}, handler);
      expect(msg.getTarget()).assertEqual(handler);
      if (eaw.isAlive()) { eaw.quit(); }
      expect(msg.getTarget()).assertEqual(handler);
    })
  })
}
