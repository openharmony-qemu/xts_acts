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

export default function MessageHandlerSendEmptyMessageTest(): void {
  describe('MessageHandlerSendEmptyMessageTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0100
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0100
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() with required what parameter returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendEmptyMessageTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("message received");
        }, eaw);
        let result: boolean = handler.sendEmptyMessage(3);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0200
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0200
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() with positive what value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendEmptyMessageTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let result: boolean = handler.sendEmptyMessage(100);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0300
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0300
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() with negative what value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let result: boolean = handler.sendEmptyMessage(-1);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0400
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0400
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() with zero what value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let result: boolean = handler.sendEmptyMessage(0);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0500
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0500
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() with int max value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let result: boolean = handler.sendEmptyMessage(2147483647);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0600
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0600
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() with int min value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let result: boolean = handler.sendEmptyMessage(-2147483648);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0700
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0700
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() returns true when EAWorker is started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendEmptyMessageTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let result: boolean = handler.sendEmptyMessage(1);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0800
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0800
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() returns false when EAWorker is not started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let result: boolean = handler.sendEmptyMessage(1);
        expect(result).assertFalse();
        eaw.start();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest0900
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_0900
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() returns false after EAWorker is terminated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.quit();
        let quitWait = 0;
        while (eaw.isAlive() && quitWait < 20000) {
          quitWait++;
        }
        let result: boolean = handler.sendEmptyMessage(1);
        expect(result).assertFalse();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1000
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1000
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() message is processed by handler function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendEmptyMessageTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let received = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          received.fetchAdd(1);
        }, eaw);
        handler.sendEmptyMessage(3);
        let waitCount: int = 0;
        while (received.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(received.load()).assertEqual(1);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1100
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1100
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() handler receives correct what value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendEmptyMessageTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let whatValue = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          whatValue.store(msg.getWhat());
        }, eaw);
        handler.sendEmptyMessage(3);
        let waitCount: int = 0;
        while (whatValue.load() !== 3 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(whatValue.load()).assertEqual(3);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1200
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1200
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() message getObject returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let objChecked = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let obj: Object | undefined = msg.getObject() as Object | undefined;
          if (obj === undefined) {
            objChecked.store(1);
          }
        }, eaw);
        handler.sendEmptyMessage(5);
        let waitCount: int = 0;
        while (objChecked.load() !== 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(objChecked.load()).assertEqual(1);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1300
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1300
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() multiple messages are all processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let counter = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          counter.fetchAdd(1);
        }, eaw);
        for (let i: int = 1; i <= 5; i++) {
          handler.sendEmptyMessage(i);
        }
        let waitCount: int = 0;
        while (counter.load() < 5 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(counter.load()).assertEqual(5);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1400
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1400
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() consecutive calls return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendEmptyMessageTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        for (let i: int = 0; i < 10; i++) {
          let result: boolean = handler.sendEmptyMessage(i);
          expect(result).assertTrue();
        }
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1500
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1500
     * @tc.desc   Verify sendEmptyMessage with hasMessages returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerSendEmptyMessageTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        handler.sendEmptyMessage(1);
        let result: boolean = handler.hasMessages(1);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1600
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1600
     * @tc.desc   Verify MessageHandler.removeMessages() removes sendEmptyMessage message from queue inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let verified = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: (() => void) | undefined = msg.getCallback();
          if (cb !== undefined) { cb(); }
        }, eaw);
        handler.post((): void => {
          handler.sendEmptyMessage(1);
          let removeResult: boolean = handler.removeMessages(1);
          if (removeResult) { verified.fetchAdd(1); }
          let hasResult: boolean = handler.hasMessages(1);
          if (!hasResult) { verified.fetchAdd(1); }
        });
        let waitCount: int = 0;
        while (verified.load() < 2 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(verified.load()).assertEqual(2);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1700
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1700
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() vs sendMessage with empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let emptyMsgCount = new AtomicInt(0);
        let sentMsgCount = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let what: int = msg.getWhat();
          if (what === 10) { emptyMsgCount.fetchAdd(1); }
          if (what === 20) { sentMsgCount.fetchAdd(1); }
        }, eaw);
        handler.sendEmptyMessage(10);
        let msg = new concurrency.Message(20, handler);
        handler.sendMessage(msg);
        let waitCount: int = 0;
        while ((emptyMsgCount.load() < 1 || sentMsgCount.load() < 1) && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(emptyMsgCount.load()).assertEqual(1);
        expect(sentMsgCount.load()).assertEqual(1);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1800
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1800
     * @tc.desc   Verify concurrent sendEmptyMessage calls with AtomicInt counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
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
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest1900
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_1900
     * @tc.desc   Verify sendEmptyMessage called inside handler callback executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let innerReceived = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() === 1) {
            msg.getTarget().sendEmptyMessage(2);
          } else if (msg.getWhat() === 2) {
            innerReceived.fetchAdd(1);
          }
        }, eaw);
        handler.sendEmptyMessage(1);
        let waitCount: int = 0;
        while (innerReceived.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(innerReceived.load()).assertEqual(1);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2000
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2000
     * @tc.desc   Verify sendEmptyMessage called inside handler callback sends message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let received = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          received.fetchAdd(1);
        }, eaw);
        handler.post((): void => {
          handler.sendEmptyMessage(1);
        });
        let waitCount: int = 0;
        while (received.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(received.load()).assertEqual(1);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2100
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2100
     * @tc.desc   Verify AtomicInt protects shared counter in sendEmptyMessage concurrent scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let counter = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          counter.fetchAdd(1);
        }, eaw);
        for (let i: int = 0; i < 100; i++) {
          handler.sendEmptyMessage(i);
        }
        let waitCount: int = 0;
        while (counter.load() < 100 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(counter.load()).assertEqual(100);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2200
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2200
     * @tc.desc   Verify multiple EAWorkers with separate handlers sendEmptyMessage independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      try {
        let counter1 = new AtomicInt(0);
        let counter2 = new AtomicInt(0);
        let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          counter1.fetchAdd(1);
        }, eaw1);
        let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          counter2.fetchAdd(1);
        }, eaw2);
        for (let i: int = 0; i < 5; i++) {
          handler1.sendEmptyMessage(i);
          handler2.sendEmptyMessage(i);
        }
        let waitCount: int = 0;
        while ((counter1.load() < 5 || counter2.load() < 5) && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(counter1.load()).assertEqual(5);
        expect(counter2.load()).assertEqual(5);
      } finally {
        try {
          if (eaw1.isAlive()) { eaw1.quit(); }
          if (eaw2.isAlive()) { eaw2.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2300
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2300
     * @tc.desc   Verify sendEmptyMessage with default identifier -1000000 returns false from hasMessages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let result: boolean = handler.sendEmptyMessage(-1000000);
        expect(result).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2400
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2400
     * @tc.desc   Verify sendEmptyMessage followed by removeMessages then sendEmptyMessage again inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerSendEmptyMessageTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let verified = new AtomicInt(0);
        let removedOk = new AtomicInt(0);
        let doneCount = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: (() => void) | undefined = msg.getCallback();
          if (cb !== undefined) { cb(); }
          verified.fetchAdd(1);
        }, eaw);
        // First send+remove must be atomic inside post (main-thread send then remove races EAWorker drain)
        handler.post((): void => {
          handler.sendEmptyMessage(1);
          if (handler.removeMessages(1)) {
            removedOk.fetchAdd(1);
          }
          if (!handler.hasMessages(1)) {
            removedOk.fetchAdd(1);
          }
          doneCount.fetchAdd(1);
        });
        let waitCount: int = 0;
        while (doneCount.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(removedOk.load()).assertEqual(2);
        // Second sendEmptyMessage should be delivered to handler
        let before: int = verified.load();
        handler.sendEmptyMessage(1);
        waitCount = 0;
        while (verified.load() < before + 1 && waitCount < 5000) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(verified.load() >= before + 1).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2500
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2500
     * @tc.desc   Verify sendEmptyMessage stress test with 100 messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let counter = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          counter.fetchAdd(1);
        }, eaw);
        let successCount: int = 0;
        for (let i: int = 0; i < 100; i++) {
          let result: boolean = handler.sendEmptyMessage(i);
          if (result) { successCount++; }
        }
        expect(successCount > 0).assertTrue();
        let waitCount: int = 0;
        while (counter.load() < successCount && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(counter.load()).assertEqual(successCount);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2600
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2600
     * @tc.desc   Verify sendEmptyMessage returns false when message queue is full
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let successCount: int = 0;
        for (let i: int = 0; i < 100; i++) {
          let result: boolean = handler.sendEmptyMessage(i);
          if (result) { successCount++; } else { break; }
        }
        expect(successCount > 0).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    // Mind map 4.3 onReceiveData nested callback is not applicable in ArkTS-Sta.
    // EAWorker in static concurrency model does not have onReceiveData API.
    // Communication is handled through MessageHandler instead.

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2700
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2700
     * @tc.desc   Verify AtomicInt store/load synchronizes message status with sendEmptyMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let msgStatus = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          msgStatus.store(msg.getWhat());
        }, eaw);
        handler.sendEmptyMessage(42);
        let waitCount: int = 0;
        while (msgStatus.load() !== 42 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(msgStatus.load()).assertEqual(42);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2800
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2800
     * @tc.desc   Verify AtomicInt controls concurrent sendEmptyMessage with atomic counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let sendCounter = new AtomicInt(0);
        let processedCounter = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          processedCounter.fetchAdd(1);
        }, eaw);
        let totalMessages: int = 50;
        for (let i: int = 0; i < totalMessages; i++) {
          let result: boolean = handler.sendEmptyMessage(i);
          if (result) {
            sendCounter.fetchAdd(1);
          }
        }
        let sentCount: int = sendCounter.load();
        expect(sentCount > 0).assertTrue();
        let waitCount: int = 0;
        while (processedCounter.load() < sentCount && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(processedCounter.load()).assertEqual(sentCount);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerSendEmptyMessageTest2900
     * @tc.number SUB_MESSAGE_HANDLER_SEND_EMPTY_MESSAGE_TEST_2900
     * @tc.desc   Verify nested sendEmptyMessage via onReceiveMessage callback using msg.getTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerSendEmptyMessageTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let nestedCount = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() === 100) {
            msg.getTarget().sendEmptyMessage(200);
          } else if (msg.getWhat() === 200) {
            msg.getTarget().sendEmptyMessage(300);
          } else if (msg.getWhat() === 300) {
            nestedCount.fetchAdd(1);
          }
        }, eaw);
        handler.sendEmptyMessage(100);
        let waitCount: int = 0;
        while (nestedCount.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(nestedCount.load()).assertEqual(1);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })
  })
}
