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

export default function MessageHandlerHasMessagesWhatTest(): void {
  describe('MessageHandlerHasMessagesWhatTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0100
     * @tc.desc   Verify MessageHandler.hasMessages(what) with required what parameter returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let result: boolean = handler.hasMessages(1);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0200
     * @tc.desc   Verify MessageHandler.hasMessages(what) with extra parameter resolves to two-param overload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(1, "extra");
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0300
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns true when message with matching what exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(100, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(100);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0400
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns false when no message with matching what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(100, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(999);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0500
     * @tc.desc   Verify MessageHandler.hasMessages(what) with int minimum boundary value returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.hasMessages(-2147483648);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0600
     * @tc.desc   Verify MessageHandler.hasMessages(what) with int maximum boundary value returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.hasMessages(2147483647);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0700
     * @tc.desc   Verify MessageHandler.hasMessages(what) with zero value returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(0);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0800
     * @tc.desc   Verify MessageHandler.hasMessages(what) with negative value returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(-1, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(-1);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest0900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_0900
     * @tc.desc   Verify MessageHandler.hasMessages(what) with default identifier -1000000 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.hasMessages(-1000000);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1000
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns false for what value never used in any Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      // ArkTS type system prevents passing null as int at compile time
      let msg = new concurrency.Message(5, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(999);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1100
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns true for message sent via sendEmptyMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      // ArkTS type system prevents passing undefined as int at compile time
      handler.sendEmptyMessage(3);
      let result: boolean = handler.hasMessages(3);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1200
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns false for what with very large int value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      // ArkTS type system prevents passing string as int at compile time
      let result: boolean = handler.hasMessages(2147483647);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1300
     * @tc.desc   Verify MessageHandler.hasMessages(what) return value is strictly boolean true or false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.hasMessages(1);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1400
     * @tc.desc   Verify MessageHandler.hasMessages(what) type safety - int parameter cannot be NaN (ArkTS compile-time guarantee)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      // ArkTS type system prevents passing NaN as int at compile time
      // Verify hasMessages works with valid int after type-safe conversion
      let msg = new concurrency.Message(10, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(10);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1500
     * @tc.desc   Verify MessageHandler.hasMessages(what) type safety - int parameter cannot be Infinity (ArkTS compile-time guarantee)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      // ArkTS type system prevents passing Infinity as int at compile time
      // Verify hasMessages works with valid int boundary value
      let result: boolean = handler.hasMessages(-2147483648);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1600
     * @tc.desc   Verify MessageHandler.hasMessages(what) with hexadecimal value returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0x10, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(0x10);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1700
     * @tc.desc   Verify MessageHandler.hasMessages(what) with octal value returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0o10, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(0o10);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1800
     * @tc.desc   Verify MessageHandler.hasMessages(what) with binary value returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0b1010, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(0b1010);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest1900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_1900
     * @tc.desc   Verify MessageHandler.hasMessages(what) with scientific notation value returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.hasMessages(100000);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2000
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns true when message with specified what exists in queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("message type: ", msg.getWhat());
      }, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(1);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2100
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns true when multiple messages exist and one matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(2, handler);
      let msg3 = new concurrency.Message(3, handler);
      handler.sendMessage(msg1);
      handler.sendMessage(msg2);
      handler.sendMessage(msg3);
      let result: boolean = handler.hasMessages(2);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2200
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns true when multiple messages with same what exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(1, handler);
      handler.sendMessage(msg1);
      handler.sendMessage(msg2);
      let result: boolean = handler.hasMessages(1);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2300
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns false when no message with specified what in queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(999);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2400
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns false when Message created without what identifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => { console.info("callback"); };
      let msg = new concurrency.Message(callback, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(1);
      expect(result).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })


    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2500
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns false after removeMessages removes the message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
      }, eaw);
      let removerCallback = (): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.removeMessages(1);
      };
      let verifyCallback = (): void => {
        let result: boolean = handler.hasMessages(1);
        if (!result) {
          verified.fetchAdd(1);
        }
      };
      handler.post(removerCallback);
      handler.post(verifyCallback);
      let waitCount: int = 0;
      while (verified.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2600
     * @tc.desc   Verify MessageHandler.hasMessages(what) return value type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let result: boolean = handler.hasMessages(1);
      expect(result).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2700
     * @tc.desc   Verify MessageHandler.hasMessages(what) consecutive queries return consistent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let result1: boolean = handler.hasMessages(1);
      let result2: boolean = handler.hasMessages(1);
      expect(result1).assertEqual(result2);
      expect(result1).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2800
     * @tc.desc   Verify MessageHandler.hasMessages(what) performance with 100 queries completes within time limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let startTime: number = Date.now();
      for (let i: int = 0; i < 100; i++) {
        handler.hasMessages(i);
      }
      let endTime: number = Date.now();
      expect(endTime - startTime < 5000).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest2900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_2900
     * @tc.desc   Verify MessageHandler.hasMessages(what) with MessageHandler not associated with EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {});
      try {
        let result: boolean = handler.hasMessages(1);
        expect(result).assertFalse();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3000
     * @tc.desc   Verify MessageHandler.hasMessages(what) after EAWorker is terminated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      eaw.quit();
      let quitWait = 0;
      while (eaw.isAlive() && quitWait < 20000) {
        quitWait++;
      }
      try {
        let result: boolean = handler.hasMessages(1);
        expect(result).assertFalse();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3100
     * @tc.desc   Verify MessageHandler.hasMessages(what) concurrent query with Promise.all returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(2, handler);
      let msg3 = new concurrency.Message(3, handler);
      handler.sendMessage(msg1);
      handler.sendMessage(msg2);
      handler.sendMessage(msg3);
      let results: boolean[] = await Promise.all([
        Promise.resolve(handler.hasMessages(1)),
        Promise.resolve(handler.hasMessages(2)),
        Promise.resolve(handler.hasMessages(3))
      ]);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3200
     * @tc.desc   Verify MessageHandler.hasMessages(what) query inside message callback returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // Enqueue what=1 and what=2 atomically via post so hasMessages(2) is true when what=1 runs
      let eaw = new EAWorker();
      eaw.start();
      let checkResult = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
        if (msg.getWhat() === 1) {
          let result: boolean = msg.getTarget().hasMessages(2);
          if (result) {
            checkResult.fetchAdd(1);
          }
          done.fetchAdd(1);
        }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(checkResult.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3300
     * @tc.desc   Verify MessageHandler.hasMessages(what) nested query inside callback verifies queue state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // Enqueue 1/2/3 atomically via post so nested hasMessages sees pending siblings
      let eaw = new EAWorker();
      eaw.start();
      let nestedCount = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
        if (msg.getWhat() === 1) {
          let hasMsg3: boolean = msg.getTarget().hasMessages(3);
          let hasMsg2: boolean = msg.getTarget().hasMessages(2);
          if (hasMsg3) {
            nestedCount.fetchAdd(1);
          }
          if (hasMsg2) {
            nestedCount.fetchAdd(1);
          }
        } else if (msg.getWhat() === 2) {
          let hasMsg1: boolean = msg.getTarget().hasMessages(1);
          if (hasMsg1) {
            nestedCount.fetchAdd(1);
          }
        } else if (msg.getWhat() === 3) {
          done.fetchAdd(1);
        }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
        handler.sendMessage(new concurrency.Message(3, handler));
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(nestedCount.load() >= 1).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3400
     * @tc.desc   Verify MessageHandler.hasMessages(what) nested query then removeMessages inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // Enqueue what=1 and what=2 atomically via post so removeMessages(2) finds the pending message
      let eaw = new EAWorker();
      eaw.start();
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
        if (msg.getWhat() === 1) {
          if (msg.getTarget().hasMessages(2)) {
            msg.getTarget().removeMessages(2);
            removed.fetchAdd(1);
          }
          done.fetchAdd(1);
        }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
      expect(handler.hasMessages(2)).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3500
     * @tc.desc   Verify MessageHandler.hasMessages(what) self-check inside callback returns boolean for currently processing message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      let selfCheckDone = new AtomicInt(0);
      let selfCheckResult: boolean = false;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (msg.getWhat() === 1) {
          selfCheckResult = msg.getTarget().hasMessages(1);
          selfCheckDone.fetchAdd(1);
        }
      }, eaw);
      eaw.start();
      handler.sendMessage(new concurrency.Message(1, handler));
      let waitCount: int = 0;
      while (selfCheckDone.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(selfCheckResult).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3600
     * @tc.desc   Verify MessageHandler.hasMessages(what) query result before and after EAWorker start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let resultBeforeStart: boolean = handler.hasMessages(1);
      eaw.start();
      let resultAfterStart: boolean = handler.hasMessages(1);
      expect(resultBeforeStart).assertEqual(resultAfterStart);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3700
     * @tc.desc   Verify MessageHandler.hasMessages(what) concurrent query from main thread and Worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let workerDone = new AtomicInt(0);
      let workerResultCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (msg.getWhat() >= 100) {
          let result: boolean = msg.getTarget().hasMessages(1);
          if (result) {
            workerResultCount.fetchAdd(1);
          }
          workerDone.fetchAdd(1);
        }
      }, eaw);
      handler.sendMessage(new concurrency.Message(1, handler));
      for (let i: int = 0; i < 5; i++) {
        handler.sendMessage(new concurrency.Message(100 + i, handler));
      }
      let mainResults: boolean[] = [];
      for (let i: int = 0; i < 5; i++) {
        mainResults.push(handler.hasMessages(1));
      }
      let waitCount: int = 0;
      while (workerDone.load() < 5 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      for (let i: int = 0; i < mainResults.length; i++) {
        expect(mainResults[i]).assertTrue();
      }
      expect(workerResultCount.load() >= 1).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3800
     * @tc.desc   Verify MessageHandler.hasMessages(what) concurrent with sendMessage inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let sendCount = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (msg.getWhat() === 1) {
          sendCount.fetchAdd(1);
          if (sendCount.load() >= 6) {
            done.fetchAdd(1);
          }
        } else if (msg.getWhat() >= 100) {
          msg.getTarget().sendMessage(new concurrency.Message(1, msg.getTarget()));
        }
      }, eaw);
      handler.sendMessage(new concurrency.Message(1, handler));
      for (let i: int = 0; i < 5; i++) {
        handler.sendMessage(new concurrency.Message(100 + i, handler));
      }
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(sendCount.load()).assertEqual(6);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest3900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_3900
     * @tc.desc   Verify MessageHandler.hasMessages(what) isolation between different EAWorker handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
      let msg1 = new concurrency.Message(1, handler1);
      handler1.sendMessage(msg1);
      let result1: boolean = handler1.hasMessages(1);
      let result2: boolean = handler2.hasMessages(1);
      expect(result1).assertTrue();
      expect(result2).assertFalse();
      if (eaw1.isAlive()) {
        eaw1.quit();
      }
      if (eaw2.isAlive()) {
        eaw2.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4000
     * @tc.desc   Verify MessageHandler.hasMessages(what) concurrent queries in Worker callback return consistent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let results = new AtomicInt(0);
      let queryCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (msg.getWhat() >= 10 && msg.getWhat() < 20) {
          let r: boolean = msg.getTarget().hasMessages(1);
          if (r) {
            results.fetchAdd(1);
          }
          queryCount.fetchAdd(1);
        }
      }, eaw);
      for (let i: int = 0; i < 20; i++) {
        handler.sendMessage(new concurrency.Message(1, handler));
      }
      for (let i: int = 0; i < 10; i++) {
        handler.sendMessage(new concurrency.Message(10 + i, handler));
      }
      let waitCount: int = 0;
      while (queryCount.load() < 10 && waitCount < 5000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(queryCount.load()).assertEqual(10);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4100
     * @tc.desc   Verify MessageHandler.hasMessages(what) concurrent main thread and Worker thread queries return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let workerDone = new AtomicInt(0);
      let workerTrueCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let r: boolean = msg.getTarget().hasMessages(1);
        if (r) {
          workerTrueCount.fetchAdd(1);
        }
        workerDone.fetchAdd(1);
      }, eaw);
      handler.sendMessage(new concurrency.Message(1, handler));
      for (let i: int = 0; i < 5; i++) {
        handler.sendMessage(new concurrency.Message(100 + i, handler));
      }
      let mainResults: boolean[] = [];
      for (let i: int = 0; i < 5; i++) {
        mainResults.push(handler.hasMessages(1));
      }
      let waitCount: int = 0;
      while (workerDone.load() < 5 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      for (let i: int = 0; i < mainResults.length; i++) {
        expect(mainResults[i]).assertTrue();
      }
      expect(workerTrueCount.load() >= 1).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4200
     * @tc.desc   Verify MessageHandler.hasMessages(what) finds prefilled what=1 messages and nested send updates queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let sendCount = new AtomicInt(0);
      let queryCount = new AtomicInt(0);
      let trueCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (msg.getWhat() === 1) {
          sendCount.fetchAdd(1);
        } else if (msg.getWhat() >= 100) {
          queryCount.fetchAdd(1);
          let result: boolean = msg.getTarget().hasMessages(1);
          if (result) {
            trueCount.fetchAdd(1);
          }
          msg.getTarget().sendMessage(new concurrency.Message(1, msg.getTarget()));
        }
      }, eaw);
      // Prefill what=1 before query messages so hasMessages can observe remaining queue items.
      for (let i: int = 0; i < 5; i++) {
        handler.sendMessage(new concurrency.Message(1, handler));
      }
      for (let i: int = 0; i < 5; i++) {
        handler.sendMessage(new concurrency.Message(100 + i, handler));
      }
      let waitCount: int = 0;
      while (queryCount.load() < 5 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(queryCount.load()).assertEqual(5);
      expect(trueCount.load() >= 1).assertTrue();
      expect(sendCount.load() >= 5).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4300
     * @tc.desc   Verify MessageHandler.hasMessages(what) queue state changes from false to true after sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let resultBefore: boolean = handler.hasMessages(1);
      expect(resultBefore).assertFalse();
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      let resultAfter: boolean = handler.hasMessages(1);
      expect(resultAfter).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4400
     * @tc.desc   Verify MessageHandler.hasMessages(what) checks specific message type existence in queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(100, handler);
      handler.sendMessage(msg1);
      handler.sendMessage(msg2);
      expect(handler.hasMessages(100)).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4500
     * @tc.desc   Verify MessageHandler.hasMessages(what) message dedup scenario - send only if not exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let sendUniqueMessage = (what: int): boolean => {
        if (!handler.hasMessages(what)) {
          let m = new concurrency.Message(what, handler);
          handler.sendMessage(m);
          return true;
        }
        return false;
      };
      let sent1: boolean = sendUniqueMessage(1);
      let sent2: boolean = sendUniqueMessage(1);
      expect(sent1).assertTrue();
      expect(sent2).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4600
     * @tc.desc   Verify MessageHandler.hasMessages(what) conditional processing based on message existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let processed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        processed.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, handler);
      handler.sendMessage(msg);
      if (handler.hasMessages(1)) {
        let waitCount: int = 0;
        while (processed.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
      }
      expect(processed.load()).assertEqual(1);
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4700
     * @tc.desc   Verify MessageHandler.hasMessages(what) nested callback business scenario with conditional branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // Align with Test3600: atomic enqueue + nested has/remove of sibling what=2
      let eaw = new EAWorker();
      eaw.start();
      let actionVerified = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) {
          cb();
        }
        if (msg.getWhat() === 1) {
          if (msg.getTarget().hasMessages(2)) {
            msg.getTarget().removeMessages(2);
            actionVerified.fetchAdd(1);
          }
          done.fetchAdd(1);
        }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(actionVerified.load()).assertEqual(1);
      expect(handler.hasMessages(2)).assertFalse();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatTest4800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_TEST_4800
     * @tc.desc   Verify MessageHandler.hasMessages(what) nested callback priority processing scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let priorityCount = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (msg.getTarget().hasMessages(1)) {
          msg.getTarget().removeMessages(1);
          priorityCount.fetchAdd(1);
        }
        if (msg.getTarget().hasMessages(2)) {
          msg.getTarget().removeMessages(2);
          priorityCount.fetchAdd(1);
        }
        if (msg.getTarget().hasMessages(3)) {
          msg.getTarget().removeMessages(3);
          priorityCount.fetchAdd(1);
          done.fetchAdd(1);
        }
      }, eaw);
      handler.sendEmptyMessage(1);
      handler.sendEmptyMessage(3);
      handler.sendEmptyMessage(2);
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(priorityCount.load() >= 1).assertTrue();
      if (eaw.isAlive()) {
        eaw.quit();
      }
    })
  })
}
