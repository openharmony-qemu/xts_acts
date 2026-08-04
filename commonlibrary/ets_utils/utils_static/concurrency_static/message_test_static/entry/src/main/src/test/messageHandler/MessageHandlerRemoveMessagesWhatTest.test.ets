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

export default function MessageHandlerRemoveMessagesWhatTest(): void {
  describe('MessageHandlerRemoveMessagesWhatTest', (): void => {
    let eaw: EAWorker = new EAWorker();
    beforeAll((): void => {
      eaw.start();
    })
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0100
     * @tc.desc   Verify MessageHandler.removeMessages(what) with required what parameter returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        if (handler.removeMessages(1)) {
          removed.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0200
     * @tc.desc   Verify MessageHandler.removeMessages(what) with positive integer what returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(5, handler));
        if (handler.removeMessages(5)) {
          removed.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0300
     * @tc.desc   Verify MessageHandler.removeMessages(0) with zero what returns true after sendEmptyMessage(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendEmptyMessage(0);
        if (handler.removeMessages(0)) {
          removed.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0400
     * @tc.desc   Verify MessageHandler.removeMessages(-1) with negative what returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(-1, handler));
        if (handler.removeMessages(-1)) {
          removed.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0500
     * @tc.desc   Verify MessageHandler.removeMessages(-1000000) with default identifier returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, handler));
      let result: boolean = handler.removeMessages(-1000000);
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0600
     * @tc.desc   Verify MessageHandler.removeMessages(999999) with large integer what returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(999999, handler));
        if (handler.removeMessages(999999)) {
          removed.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0700
     * @tc.desc   Verify MessageHandler.removeMessages(what) with int max boundary value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let maxVal: int = 2147483647;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      // send+remove atomically inside post to avoid queue drain races
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(maxVal, handler));
        if (handler.removeMessages(maxVal)) {
          removed.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0800
     * @tc.desc   Verify MessageHandler.removeMessages(what) second call with same what returns false after first removal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        if (handler.removeMessages(1)) {
          verified.fetchAdd(1);
        }
        if (!handler.removeMessages(1)) {
          verified.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(2);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest0900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_0900
     * @tc.desc   Verify MessageHandler.hasMessages(what) returns false after removeMessages removes matching message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        if (handler.removeMessages(1)) {
          verified.fetchAdd(1);
        }
        if (!handler.hasMessages(1)) {
          verified.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(2);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1000
     * @tc.desc   Verify MessageHandler.removeMessages(what) returns false when no matching what exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, handler));
      let result: boolean = handler.removeMessages(2);
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1100
     * @tc.desc   Verify MessageHandler.removeMessages(what) returns false when message queue is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.removeMessages(1);
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1200
     * @tc.desc   Verify MessageHandler.removeMessages(what) returns false when queue only has callback-type messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {};
      handler.sendMessage(new concurrency.Message(callback, handler));
      let result: boolean = handler.removeMessages(1);
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1300
     * @tc.desc   Verify MessageHandler.removeMessages(-1000000) returns false even when queue has other messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, handler));
      handler.sendMessage(new concurrency.Message(2, handler));
      let result: boolean = handler.removeMessages(-1000000);
      expect(result).assertFalse();
    })


    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1400
     * @tc.desc   Verify MessageHandler.removeMessages(what) returns false after message has been processed by EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        executed.fetchAdd(1);
      }, eaw);
      handler.sendMessage(new concurrency.Message(1, handler));
      let waitCount: int = 0;
      while (executed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(executed.load()).assertEqual(1);
      let result: boolean = handler.removeMessages(1);
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1500
     * @tc.desc   Verify MessageHandler.removeMessages(what) removes what-type messages while keeping callback messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let hasCb = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        handler.sendMessage(new concurrency.Message(1, handler));
        if (handler.removeMessages(1)) {
          removed.fetchAdd(1);
        }
        if (handler.hasCallbacks(callback)) {
          hasCb.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
      expect(hasCb.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1600
     * @tc.desc   Verify MessageHandler.removeMessages(what) inside post callback removes message successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        let result: boolean = handler.removeMessages(1);
        if (result) { removed.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (removed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1700
     * @tc.desc   Verify MessageHandler.removeMessages(what) inside post callback removes multiple messages with different what values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
        handler.sendMessage(new concurrency.Message(3, handler));
        let r1: boolean = handler.removeMessages(1);
        let r2: boolean = handler.removeMessages(2);
        let r3: boolean = handler.removeMessages(3);
        if (r1) { removed.fetchAdd(1); }
        if (r2) { removed.fetchAdd(1); }
        if (r3) { removed.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (removed.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(3);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1800
     * @tc.desc   Verify MessageHandler.removeMessages(what) nested call inside handler callback does not deadlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let nestedDone = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          let target = msg.getTarget();
          let result: boolean = target.removeMessages(2);
          if (result) { nestedDone.fetchAdd(1); }
        }
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
      });
      let waitCount: int = 0;
      while (nestedDone.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(nestedDone.load() >= 1).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest1900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_1900
     * @tc.desc   Verify MessageHandler.removeMessages(what) with AtomicInt counter wait instead of Timer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        let hasResult: boolean = handler.hasMessages(1);
        if (hasResult) { verified.fetchAdd(1); }
        let removeResult: boolean = handler.removeMessages(1);
        if (removeResult) { verified.fetchAdd(1); }
        let hasResult2: boolean = handler.hasMessages(1);
        if (!hasResult2) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(3);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2000
     * @tc.desc   Verify MessageHandler.removeMessages(what) inside handler callback successfully removes other message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          let target = msg.getTarget();
          let result: boolean = target.removeMessages(2);
          if (result) { removed.fetchAdd(1); }
        }
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
      });
      let waitCount: int = 0;
      while (removed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load() >= 1).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2100
     * @tc.desc   Verify MessageHandler.hasMessages(what) then removeMessages(what) inside handler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          let target = msg.getTarget();
          let hasResult: boolean = target.hasMessages(2);
          if (hasResult) { verified.fetchAdd(1); }
          let removeResult: boolean = target.removeMessages(2);
          if (removeResult) { verified.fetchAdd(1); }
        }
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
      });
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load() >= 2).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2200
     * @tc.desc   Verify MessageHandler removeMessages complete flow: sendMessage then hasMessages then removeMessages then hasMessages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        let hasBefore: boolean = handler.hasMessages(1);
        if (hasBefore) { verified.fetchAdd(1); }
        let removeResult: boolean = handler.removeMessages(1);
        if (removeResult) { verified.fetchAdd(1); }
        let hasAfter: boolean = handler.hasMessages(1);
        if (!hasAfter) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(3);
    })


    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2300
     * @tc.desc   Verify MessageHandler.removeMessages(1) does not affect hasMessages(2) for different what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
        let result: boolean = handler.removeMessages(1);
        if (result) { verified.fetchAdd(1); }
        let hasResult: boolean = handler.hasMessages(2);
        if (hasResult) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(2);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2400
     * @tc.desc   Verify MessageHandler.removeMessages(what) returns true after re-sending message with same what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        if (handler.removeMessages(1)) {
          removed.fetchAdd(1);
        }
        handler.sendMessage(new concurrency.Message(1, handler));
        if (handler.removeMessages(1)) {
          removed.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(2);
    })


    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2500
     * @tc.desc   Verify MessageHandler.removeMessages(what) after sendEmptyMessage removes empty message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendEmptyMessage(5);
        let removeResult: boolean = handler.removeMessages(5);
        if (removeResult) { verified.fetchAdd(1); }
        let hasResult: boolean = handler.hasMessages(5);
        if (!hasResult) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(2);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2600
     * @tc.desc   Verify MessageHandler.removeMessages(what) after sending large number of messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        for (let i: int = 0; i < 100; i++) {
          handler.sendMessage(new concurrency.Message(i, handler));
        }
        let result: boolean = handler.removeMessages(50);
        if (result) { removed.fetchAdd(1); }
        let hasResult: boolean = handler.hasMessages(50);
        if (!hasResult) { removed.fetchAdd(1); }
        let hasOther: boolean = handler.hasMessages(51);
        if (hasOther) { removed.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (removed.load() < 3 && waitCount < 70000) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(3);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2700
     * @tc.desc   Verify MessageHandler.removeMessages(what) with AtomicInt protecting concurrent remove counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let removeCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
        let r1: boolean = handler.removeMessages(1);
        if (r1) { removeCount.fetchAdd(1); }
        let r2: boolean = handler.removeMessages(2);
        if (r2) { removeCount.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (removeCount.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removeCount.load()).assertEqual(2);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2800
     * @tc.desc   Verify MessageHandler.removeMessages(what) with counter wait mechanism completes all operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        for (let i: int = 0; i < 10; i++) {
          handler.sendMessage(new concurrency.Message(i, handler));
        }
        for (let i: int = 0; i < 10; i++) {
          let result: boolean = handler.removeMessages(i);
          if (result) { verified.fetchAdd(1); }
        }
      });
      let waitCount: int = 0;
      while (verified.load() < 10 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(10);
    })


    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest2900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_2900
     * @tc.desc   Verify MessageHandler.removeMessages(what) works independently for different handlers with different EAWorkers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let removed = new AtomicInt(0);
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw2);
      handler1.post((): void => {
        handler1.sendMessage(new concurrency.Message(1, handler1));
        let r1: boolean = handler1.removeMessages(1);
        if (r1) { removed.fetchAdd(1); }
      });
      handler2.post((): void => {
        handler2.sendMessage(new concurrency.Message(1, handler2));
        let r2: boolean = handler2.removeMessages(1);
        if (r2) { removed.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (removed.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(2);
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatTest3000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_TEST_3000
     * @tc.desc   Verify MessageHandler.removeMessages(what) concurrent operations produce consistent queue state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, handler));
        handler.sendMessage(new concurrency.Message(2, handler));
        handler.sendMessage(new concurrency.Message(3, handler));
        let r1: boolean = handler.removeMessages(1);
        let r2: boolean = handler.removeMessages(2);
        if (r1 && r2) { verified.fetchAdd(1); }
        let has3: boolean = handler.hasMessages(3);
        if (has3) { verified.fetchAdd(1); }
        let r3: boolean = handler.removeMessages(3);
        if (r3) { verified.fetchAdd(1); }
        let hasNone: boolean = handler.hasMessages(1);
        if (!hasNone) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 4 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(4);
    })
  })
}
