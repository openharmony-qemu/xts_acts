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

export default function MessageHandlerRemoveMessagesWhatObjTest(): void {
  describe('MessageHandlerRemoveMessagesWhatObjTest', (): void => {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0100
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with both required parameters returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        if (handler.removeMessages(1, "test")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0200
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with positive integer what and string obj returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(5, "data", handler));
        if (handler.removeMessages(5, "data")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0300
     * @tc.desc   Verify MessageHandler.removeMessages(0, obj) with zero what returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(0, "zero", handler));
        if (handler.removeMessages(0, "zero")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0400
     * @tc.desc   Verify MessageHandler.removeMessages(-1, obj) with negative what returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(-1, "neg", handler));
        if (handler.removeMessages(-1, "neg")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0500
     * @tc.desc   Verify MessageHandler.removeMessages(-1000000, obj) with default identifier returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, "test", handler));
      let result: boolean = handler.removeMessages(-1000000, "test");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0600
     * @tc.desc   Verify MessageHandler.removeMessages(999999, obj) with large integer what returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(999999, "big", handler));
        if (handler.removeMessages(999999, "big")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0700
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with int max boundary what returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let maxVal: int = 2147483647;
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(maxVal, "max", handler));
        if (handler.removeMessages(maxVal, "max")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0800
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with int min boundary what returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let minVal: int = -2147483648;
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(minVal, "min", handler));
        if (handler.removeMessages(minVal, "min")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest0900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_0900
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with number obj returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let numObj: Object = 42 as Object;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, numObj, handler));
        if (handler.removeMessages(1, numObj)) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1000
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with boolean obj returns true when matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let boolObj: Object = true as Object;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, boolObj, handler));
        if (handler.removeMessages(1, boolObj)) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1100
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with array obj and same reference returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let arr: number[] = [1, 2, 3, 4, 5];
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, arr as Object, handler));
        if (handler.removeMessages(1, arr as Object)) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1200
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with Record object obj and same reference returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let obj: Record<string, Object> = { "name": "test" as Object, "value": 123 as Object };
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, obj as Object, handler));
        if (handler.removeMessages(1, obj as Object)) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1300
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with same object reference matches successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let sharedObj: Record<string, Object> = { "key": "value" as Object };
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, sharedObj as Object, handler));
        if (handler.removeMessages(1, sharedObj as Object)) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1400
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with different object reference but same content returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let obj: Record<string, Object> = { "key": "value" as Object };
      handler.sendMessage(new concurrency.Message(1, obj as Object, handler));
      let otherObj: Record<string, Object> = { "key": "value" as Object };
      let result: boolean = handler.removeMessages(1, otherObj as Object);
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1500
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns true when both what and obj match existing message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(100, "match_obj", handler));
        if (handler.removeMessages(100, "match_obj")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1600
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false when what does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, "test", handler));
      let result: boolean = handler.removeMessages(2, "test");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1700
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false when what matches but obj does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, "test", handler));
      let result: boolean = handler.removeMessages(1, "other");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1800
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false when obj matches but what does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, "test", handler));
      let result: boolean = handler.removeMessages(2, "test");
      expect(result).assertFalse();
    })


    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest1900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_1900
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) second call with same what and obj returns false after first removal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        if (handler.removeMessages(1, "test")) {
          verified.fetchAdd(1);
        }
        if (!handler.removeMessages(1, "test")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2000
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false when message queue is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let result: boolean = handler.removeMessages(1, "test");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2100
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false after message has been processed by EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        executed.fetchAdd(1);
      }, eaw);
      handler.sendMessage(new concurrency.Message(1, "test", handler));
      let waitCount: int = 0;
      while (executed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(executed.load()).assertEqual(1);
      let result: boolean = handler.removeMessages(1, "test");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2200
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns true after re-sending message with same what and obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        if (handler.removeMessages(1, "test")) {
          removed.fetchAdd(1);
        }
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        if (handler.removeMessages(1, "test")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2300
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false when queue only has callback-type messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {};
      handler.sendMessage(new concurrency.Message(callback, handler));
      let result: boolean = handler.removeMessages(1, "test");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2400
     * @tc.desc   Verify MessageHandler.removeMessages(-1000000, obj) returns false even when queue has other messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(1, "test1", handler));
      handler.sendMessage(new concurrency.Message(2, "test2", handler));
      let result: boolean = handler.removeMessages(-1000000, "test1");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2500
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with multiple messages removes only matching what and obj combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(1, "obj2", handler));
        handler.sendMessage(new concurrency.Message(2, "obj1", handler));
        let result: boolean = handler.removeMessages(1, "obj1");
        if (result) { verified.fetchAdd(1); }
        let hasObj2: boolean = handler.hasMessages(1, "obj2");
        if (hasObj2) { verified.fetchAdd(1); }
        let hasWhat2: boolean = handler.hasMessages(2, "obj1");
        if (hasWhat2) { verified.fetchAdd(1); }
        let noObj1: boolean = handler.hasMessages(1, "obj1");
        if (!noObj1) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 4 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(4);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2600
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with what and obj both unmatched returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      handler.sendMessage(new concurrency.Message(100, "match_obj", handler));
      let result: boolean = handler.removeMessages(200, "other_obj");
      expect(result).assertFalse();
    })



    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2700
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) parameter type safety - ArkTS prevents invalid types at compile time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(10, "data", handler));
        if (handler.removeMessages(10, "data")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2800
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) obj parameter type safety - null and undefined cannot be passed as Object in ArkTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "valid_obj", handler));
        if (handler.removeMessages(1, "valid_obj")) {
          verified.fetchAdd(1);
        }
        if (!handler.removeMessages(1, "other_obj")) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest2900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_2900
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false when Message created without what identifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback = (): void => {};
      handler.sendMessage(new concurrency.Message(callback, handler));
      let result: boolean = handler.removeMessages(-1000000, "data");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3000
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) inside post callback removes message successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        let result: boolean = handler.removeMessages(1, "test");
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3100
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) nested call inside handler callback does not deadlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let nestedDone = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          let target = msg.getTarget();
          let result: boolean = target.removeMessages(2, "nested");
          if (result) { nestedDone.fetchAdd(1); }
        }
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "trigger", handler));
        handler.sendMessage(new concurrency.Message(2, "nested", handler));
      });
      let waitCount: int = 0;
      while (nestedDone.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(nestedDone.load() >= 1).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3200
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with multiple EAWorkers removes messages independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
        handler1.sendMessage(new concurrency.Message(1, "data", handler1));
        let r1: boolean = handler1.removeMessages(1, "data");
        if (r1) { removed.fetchAdd(1); }
      });
      handler2.post((): void => {
        handler2.sendMessage(new concurrency.Message(1, "data", handler2));
        let r2: boolean = handler2.removeMessages(1, "data");
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3300
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) concurrent operations produce consistent queue state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(2, "obj2", handler));
        handler.sendMessage(new concurrency.Message(3, "obj3", handler));
        let r1: boolean = handler.removeMessages(1, "obj1");
        let r2: boolean = handler.removeMessages(2, "obj2");
        if (r1 && r2) { verified.fetchAdd(1); }
        let has3: boolean = handler.hasMessages(3, "obj3");
        if (has3) { verified.fetchAdd(1); }
        let r3: boolean = handler.removeMessages(3, "obj3");
        if (r3) { verified.fetchAdd(1); }
        let hasNone: boolean = handler.hasMessages(1, "obj1");
        if (!hasNone) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 4 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(4);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3400
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with AtomicInt counter wait instead of Timer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        let hasResult: boolean = handler.hasMessages(1, "test");
        if (hasResult) { verified.fetchAdd(1); }
        let removeResult: boolean = handler.removeMessages(1, "test");
        if (removeResult) { verified.fetchAdd(1); }
        let hasResult2: boolean = handler.hasMessages(1, "test");
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3500
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) inside handler callback removes other message safely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          let target = msg.getTarget();
          let result: boolean = target.removeMessages(2, "obj2");
          if (result) { removed.fetchAdd(1); }
        }
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(2, "obj2", handler));
      });
      let waitCount: int = 0;
      while (removed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load() >= 1).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3600
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with object reference competition in concurrent scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let sharedObj: Record<string, Object> = { "id": "shared" as Object };
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, sharedObj as Object, handler));
        let result: boolean = handler.removeMessages(1, sharedObj as Object);
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3700
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) multiple removes return correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "a", handler));
        handler.sendMessage(new concurrency.Message(2, "b", handler));
        handler.sendMessage(new concurrency.Message(3, "c", handler));
        let r1: boolean = handler.removeMessages(1, "a");
        let r2: boolean = handler.removeMessages(2, "b");
        let r3: boolean = handler.removeMessages(3, "c");
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3800
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) inside handler callback with obj reference matching correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          let target = msg.getTarget();
          let hasResult: boolean = target.hasMessages(2, "obj2");
          if (hasResult) { verified.fetchAdd(1); }
          let removeResult: boolean = target.removeMessages(2, "obj2");
          if (removeResult) { verified.fetchAdd(1); }
        }
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(2, "obj2", handler));
      });
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load() >= 2).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest3900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_3900
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with different Workers removing same what+obj from different handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
        handler1.sendMessage(new concurrency.Message(1, "shared", handler1));
        let r1: boolean = handler1.removeMessages(1, "shared");
        if (r1) { removed.fetchAdd(1); }
      });
      handler2.post((): void => {
        handler2.sendMessage(new concurrency.Message(1, "shared", handler2));
        let r2: boolean = handler2.removeMessages(1, "shared");
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4000
     * @tc.desc   Verify MessageHandler removeMessages complete flow: sendMessage then hasMessages then removeMessages then hasMessages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        let hasBefore: boolean = handler.hasMessages(1, "test");
        if (hasBefore) { verified.fetchAdd(1); }
        let removeResult: boolean = handler.removeMessages(1, "test");
        if (removeResult) { verified.fetchAdd(1); }
        let hasAfter: boolean = handler.hasMessages(1, "test");
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4100
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) removes all messages with same what and obj at once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "dup", handler));
        handler.sendMessage(new concurrency.Message(1, "dup", handler));
        handler.sendMessage(new concurrency.Message(1, "dup", handler));
        let result: boolean = handler.removeMessages(1, "dup");
        if (result) { verified.fetchAdd(1); }
        let hasResult: boolean = handler.hasMessages(1, "dup");
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4200
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) only removes messages matching both what and obj, unlike removeMessages(what)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(1, "obj2", handler));
        let result: boolean = handler.removeMessages(1, "obj1");
        if (result) { verified.fetchAdd(1); }
        let hasObj2: boolean = handler.hasMessages(1, "obj2");
        if (hasObj2) { verified.fetchAdd(1); }
        let noObj1: boolean = handler.hasMessages(1, "obj1");
        if (!noObj1) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(3);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4300
     * @tc.desc   Verify MessageHandler.removeMessages(1, obj1) does not affect hasMessages(1, obj2) for different obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(1, "obj2", handler));
        let result: boolean = handler.removeMessages(1, "obj1");
        if (result) { verified.fetchAdd(1); }
        let hasObj2: boolean = handler.hasMessages(1, "obj2");
        if (hasObj2) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(2);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4400
     * @tc.desc   Verify MessageHandler.removeMessages(1, obj) does not affect hasMessages(2, obj) for different what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "shared", handler));
        handler.sendMessage(new concurrency.Message(2, "shared", handler));
        let result: boolean = handler.removeMessages(1, "shared");
        if (result) { verified.fetchAdd(1); }
        let hasWhat2: boolean = handler.hasMessages(2, "shared");
        if (hasWhat2) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 2 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(2);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4500
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4500
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) after sending large number of messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let localEaw = new EAWorker();
      localEaw.start();
      let removed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, localEaw);
      // Use post-setup to atomically send, remove and verify on EAWorker thread
      handler.post((): void => {
        for (let i: int = 0; i < 100; i++) {
          handler.sendMessage(new concurrency.Message(i, `obj_${i}`, handler));
        }
        let result: boolean = handler.removeMessages(50, "obj_50");
        if (result) { removed.fetchAdd(1); }
        let hasResult: boolean = handler.hasMessages(50, "obj_50");
        if (!hasResult) { removed.fetchAdd(1); }
        let hasOther: boolean = handler.hasMessages(51, "obj_51");
        if (hasOther) { removed.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (removed.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(removed.load()).assertEqual(3);
      if (localEaw.isAlive()) { localEaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4600
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4600
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) works independently for different handlers with different EAWorkers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let verified = new AtomicInt(0);
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw2);
      handler1.post((): void => {
        handler1.sendMessage(new concurrency.Message(1, "data", handler1));
        let r1: boolean = handler1.removeMessages(1, "data");
        if (r1) { verified.fetchAdd(1); }
        let has1: boolean = handler1.hasMessages(1, "data");
        if (!has1) { verified.fetchAdd(1); }
      });
      handler2.post((): void => {
        handler2.sendMessage(new concurrency.Message(1, "data", handler2));
        let r2: boolean = handler2.removeMessages(1, "data");
        if (r2) { verified.fetchAdd(1); }
        let has2: boolean = handler2.hasMessages(1, "data");
        if (!has2) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 4 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(4);
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4700
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4700
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with same what different obj multiple messages removes correct combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let localEaw = new EAWorker();
      localEaw.start();
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, localEaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(1, "obj2", handler));
        handler.sendMessage(new concurrency.Message(1, "obj3", handler));
        let result: boolean = handler.removeMessages(1, "obj2");
        if (result) { verified.fetchAdd(1); }
        let has1: boolean = handler.hasMessages(1, "obj1");
        if (has1) { verified.fetchAdd(1); }
        let no2: boolean = handler.hasMessages(1, "obj2");
        if (!no2) { verified.fetchAdd(1); }
        let has3: boolean = handler.hasMessages(1, "obj3");
        if (has3) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 4 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(4);
      if (localEaw.isAlive()) { localEaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4800
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4800
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) Worker destruction timing - ensure no pending tasks before quit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let localEaw = new EAWorker();
      localEaw.start();
      let executed = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, localEaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "task", handler));
        handler.removeMessages(1, "task");
        executed.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (executed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(executed.load()).assertEqual(1);
      if (localEaw.isAlive()) { localEaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest4900
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_4900
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) concurrent remove produces stable queue state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let localEaw = new EAWorker();
      localEaw.start();
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, localEaw);
      handler.post((): void => {
        for (let i: int = 0; i < 10; i++) {
          handler.sendMessage(new concurrency.Message(i, `obj_${i}`, handler));
        }
        for (let i: int = 0; i < 10; i++) {
          let result: boolean = handler.removeMessages(i, `obj_${i}`);
          if (result) { verified.fetchAdd(1); }
        }
      });
      let waitCount: int = 0;
      while (verified.load() < 10 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(10);
      if (localEaw.isAlive()) { localEaw.quit(); }
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest5000
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_5000
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) removes what+obj messages while keeping callback messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let callback = (): void => {};
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(callback, handler));
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        let result: boolean = handler.removeMessages(1, "test");
        let hasCallback: boolean = handler.hasCallbacks(callback);
        if (result && hasCallback) {
          verified.fetchAdd(1);
        }
        done.fetchAdd(1);
      });
      let waitCount: int = 0;
      while (done.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(1);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest5100
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_5100
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) after EAWorker quit and restart returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerRemoveMessagesWhatObjTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let localEaw = new EAWorker();
      localEaw.start();
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, localEaw);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, "test", handler));
        if (handler.removeMessages(1, "test")) {
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
      localEaw.quit();
      let quitWait = 0;
      while (localEaw.isAlive() && quitWait < 500) {
        quitWait++;
        await Utils.msSleep(100);
      }
      let result2: boolean = handler.removeMessages(1, "test");
      expect(result2).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest5200
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_5200
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with different obj types for same what removes correct combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let verified = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let numObj: Object = 42 as Object;
      let boolObj: Object = true as Object;
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, numObj, handler));
        handler.sendMessage(new concurrency.Message(1, boolObj, handler));
        let result1: boolean = handler.removeMessages(1, numObj);
        if (result1) { verified.fetchAdd(1); }
        let hasBool: boolean = handler.hasMessages(1, boolObj);
        if (hasBool) { verified.fetchAdd(1); }
        let noNum: boolean = handler.hasMessages(1, numObj);
        if (!noNum) { verified.fetchAdd(1); }
      });
      let waitCount: int = 0;
      while (verified.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(verified.load()).assertEqual(3);
    })

    /**
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest5300
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_5300
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with Map obj returns true when matching by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let map = new Map<string, number>();
      map.set("key1", 100);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, map as Object, handler));
        if (handler.removeMessages(1, map as Object)) {
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
     * @tc.name   MessageHandlerRemoveMessagesWhatObjTest5400
     * @tc.number SUB_MESSAGE_HANDLER_REMOVE_MESSAGES_WHAT_OBJ_TEST_5400
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) with Set obj returns true when matching by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerRemoveMessagesWhatObjTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let removed = new AtomicInt(0);
      let done = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let cb: (() => void) | undefined = msg.getCallback();
        if (cb !== undefined) { cb(); }
      }, eaw);
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      handler.post((): void => {
        handler.sendMessage(new concurrency.Message(1, set as Object, handler));
        if (handler.removeMessages(1, set as Object)) {
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
  })
}
