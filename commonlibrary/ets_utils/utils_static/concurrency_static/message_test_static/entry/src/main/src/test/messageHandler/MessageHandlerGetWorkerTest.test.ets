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

export default function MessageHandlerGetWorkerTest(): void {
  describe('MessageHandlerGetWorkerTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0100
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0100
     * @tc.desc   Verify MessageHandler.getWorker() with no arguments returns non-null EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerGetWorkerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("message type: ", msg.getWhat());
        }, eaw);

        let worker: EAWorker = handler.getWorker();
        expect(worker === eaw).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0200
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0200
     * @tc.desc   Verify MessageHandler.getWorker() returns the EAWorker passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerGetWorkerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handle message");
        }, eaw);

        let worker: EAWorker = handler.getWorker();
        expect(worker === eaw).assertTrue();
        eaw.start();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0300
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0300
     * @tc.desc   Verify MessageHandler.getWorker() returns default EAWorker when worker param not provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerGetWorkerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("handle message");
      });

      let worker: EAWorker = handler.getWorker();
      expect(worker === EAWorker.main()).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0400
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0400
     * @tc.desc   Verify multiple getWorker() calls return the same EAWorker instance reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerGetWorkerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handle message");
        }, eaw);

        let worker1: EAWorker = handler.getWorker();
        let worker2: EAWorker = handler.getWorker();
        let worker3: EAWorker = handler.getWorker();

        expect(worker1 === worker2).assertTrue();
        expect(worker2 === worker3).assertTrue();
        expect(worker1 === eaw).assertTrue();
        eaw.start();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0500
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0500
     * @tc.desc   Verify MessageHandler.getWorker() return value is instanceof EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerGetWorkerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handle message");
        }, eaw);

        let worker: EAWorker = handler.getWorker();
        expect(worker === eaw).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0600
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0600
     * @tc.desc   Verify MessageHandler.getWorker() returns correct instance when EAWorker not started
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handle message");
        }, eaw);

        let worker: EAWorker = handler.getWorker();
        expect(worker === eaw).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0700
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0700
     * @tc.desc   Verify MessageHandler.getWorker() returns terminated EAWorker after quit()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        console.info("handle message");
      }, eaw);

      if (eaw.isAlive()) {
        eaw.quit();
      }
      expect(eaw.isAlive()).assertFalse();

      let worker: EAWorker = handler.getWorker();
      expect(worker === eaw).assertTrue();
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0800
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0800
     * @tc.desc   Verify MessageHandler.getWorker() does not throw any exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerGetWorkerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handle message");
        }, eaw);

        let noError: boolean = true;
        try {
          let worker: EAWorker = handler.getWorker();
          expect(worker === eaw).assertTrue();
        } catch (error) {
          noError = false;
        }
        expect(noError).assertTrue();
        eaw.start();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest0900
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_0900
     * @tc.desc   Verify MessageHandler.getWorker() inside EAWorker message handler returns correct EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let matchCount: AtomicInt = new AtomicInt(0);
        let completedCount: AtomicInt = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let w: EAWorker = msg.getTarget().getWorker();
          if (w === eaw) {
            matchCount.fetchAdd(1);
          }
          completedCount.fetchAdd(1);
        }, eaw);

        let msg = new concurrency.Message(1, handler);
        handler.sendMessage(msg);

        let waitCount: int = 0;
        while (completedCount.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(matchCount.load()).assertEqual(1);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest1000
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_1000
     * @tc.desc   Verify MessageHandler.getWorker() inside sendEmptyMessage callback returns correct EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let matchCount: AtomicInt = new AtomicInt(0);
        let completedCount: AtomicInt = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let w: EAWorker = msg.getTarget().getWorker();
          if (w === eaw) {
            matchCount.fetchAdd(1);
          }
          completedCount.fetchAdd(1);
        }, eaw);

        handler.sendEmptyMessage(100);

        let waitCount: int = 0;
        while (completedCount.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(matchCount.load()).assertEqual(1);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest1100
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_1100
     * @tc.desc   Verify MessageHandler.getWorker() for MessageHandler created inside EAWorker handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let innerMatchCount: AtomicInt = new AtomicInt(0);
        let completedCount: AtomicInt = new AtomicInt(0);
        let outerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let innerHandler = new concurrency.MessageHandler((innerMsg: concurrency.Message): void => {
            console.info("inner handler received");
          }, eaw);
          if (innerHandler.getWorker() === eaw) {
            innerMatchCount.fetchAdd(1);
          }
          completedCount.fetchAdd(1);
        }, eaw);

        outerHandler.sendEmptyMessage(1);

        let waitCount: int = 0;
        while (completedCount.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(innerMatchCount.load()).assertEqual(1);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest1200
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_1200
     * @tc.desc   Verify concurrent getWorker() calls from multiple EAWorkers return correct instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      try {
        let matchCount: AtomicInt = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handle message");
        }, eaw);

        // Call getWorker from main thread
        let mainWorker: EAWorker = handler.getWorker();
        if (mainWorker === eaw) {
          matchCount.fetchAdd(1);
        }

        // Call getWorker from another EAWorker thread
        let callCount: AtomicInt = new AtomicInt(0);
        let callHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let w: EAWorker = handler.getWorker();
          if (w === eaw) {
            matchCount.fetchAdd(1);
          }
          callCount.fetchAdd(1);
        }, eaw2);
        callHandler.sendEmptyMessage(1);

        let waitCount: int = 0;
        while (callCount.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }

        expect(matchCount.load()).assertEqual(2);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
        if (eaw2.isAlive()) {
          try {
            eaw2.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest1300
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_1300
     * @tc.desc   Verify MessageHandler.getWorker() consistency with counting wait for multiple messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let completedCount: AtomicInt = new AtomicInt(0);
        let matchCount: AtomicInt = new AtomicInt(0);
        let totalCount: int = 3;

        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let w: EAWorker = msg.getTarget().getWorker();
          if (w === eaw) {
            matchCount.fetchAdd(1);
          }
          completedCount.fetchAdd(1);
        }, eaw);

        for (let i: int = 0; i < totalCount; i++) {
          handler.sendEmptyMessage(i);
        }

        let waitCount: int = 0;
        while (completedCount.load() < totalCount && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }

        expect(matchCount.load()).assertEqual(totalCount);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest1400
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_1400
     * @tc.desc   Verify EAWorker returned by getWorker() can be used to create new MessageHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerGetWorkerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let received: AtomicInt = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handle message");
        }, eaw);

        let worker: EAWorker = handler.getWorker();
        expect(worker === eaw).assertTrue();

        // Use the returned worker to create a new MessageHandler
        let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          received.fetchAdd(1);
        }, worker);
        handler2.sendEmptyMessage(1);

        let waitCount: int = 0;
        while (received.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(received.load()).assertEqual(1);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })


    /**
     * @tc.name   MessageHandlerGetWorkerTest1500
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_1500
     * @tc.desc   Verify different MessageHandlers return their respective EAWorkers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerGetWorkerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      try {
        let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handler1");
        }, eaw1);

        let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          console.info("handler2");
        }, eaw2);

        let worker1: EAWorker = handler1.getWorker();
        let worker2: EAWorker = handler2.getWorker();

        expect(worker1 === eaw1).assertTrue();
        expect(worker2 === eaw2).assertTrue();
        expect(worker1 !== worker2).assertTrue();
      } finally {
        if (eaw1.isAlive()) {
          try {
            eaw1.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
        if (eaw2.isAlive()) {
          try {
            eaw2.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest1600
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_1600
     * @tc.desc   Verify MessageHandler.getWorker() in nested MessageHandler scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let outerCount: AtomicInt = new AtomicInt(0);
        let innerCount: AtomicInt = new AtomicInt(0);
        let outerMatchCount: AtomicInt = new AtomicInt(0);
        let innerMatchCount: AtomicInt = new AtomicInt(0);
        let nestedGetWorkerMatch: AtomicInt = new AtomicInt(0);
        let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getTarget().getWorker() === eaw) {
            outerMatchCount.fetchAdd(1);
          }
          outerCount.fetchAdd(1);
          let nestedHandler = new concurrency.MessageHandler((nestedMsg: concurrency.Message): void => {
            if (nestedMsg.getTarget().getWorker() === eaw) {
              innerMatchCount.fetchAdd(1);
            }
            innerCount.fetchAdd(1);
          }, eaw);
          nestedHandler.sendEmptyMessage(100);
          if (nestedHandler.getWorker() === eaw) {
            nestedGetWorkerMatch.fetchAdd(1);
          }
        }, eaw);

        for (let i: int = 0; i < 3; i++) {
          handler1.sendEmptyMessage(i);
        }

        let waitCount: int = 0;
        while (outerCount.load() < 3 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }

        expect(outerCount.load()).assertEqual(3);
        expect(outerMatchCount.load()).assertEqual(3);
        expect(handler1.getWorker() === eaw).assertTrue();

        waitCount = 0;
        while (innerCount.load() < 3 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }

        expect(innerCount.load()).assertEqual(3);
        expect(innerMatchCount.load()).assertEqual(3);
        expect(nestedGetWorkerMatch.load()).assertEqual(3);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerGetWorkerTest1700
     * @tc.number SUB_MESSAGE_HANDLER_GET_WORKER_TEST_1700
     * @tc.desc   Verify MessageHandler.getWorker() in multi-level nested MessageHandler scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerGetWorkerTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let level1Count: AtomicInt = new AtomicInt(0);
        let level2Count: AtomicInt = new AtomicInt(0);
        let level3Count: AtomicInt = new AtomicInt(0);
        let level1Match: AtomicInt = new AtomicInt(0);
        let level2Match: AtomicInt = new AtomicInt(0);
        let level3Match: AtomicInt = new AtomicInt(0);
        let level2GetWorkerMatch: AtomicInt = new AtomicInt(0);
        let level3GetWorkerMatch: AtomicInt = new AtomicInt(0);

        let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          level1Count.fetchAdd(1);
          if (msg.getTarget().getWorker() === eaw) {
            level1Match.fetchAdd(1);
          }

          let handler2 = new concurrency.MessageHandler((msg2: concurrency.Message): void => {
            level2Count.fetchAdd(1);
            if (msg2.getTarget().getWorker() === eaw) {
              level2Match.fetchAdd(1);
            }

            let handler3 = new concurrency.MessageHandler((msg3: concurrency.Message): void => {
              level3Count.fetchAdd(1);
              if (msg3.getTarget().getWorker() === eaw) {
                level3Match.fetchAdd(1);
              }
            }, eaw);

            handler3.sendEmptyMessage(300);
            if (handler3.getWorker() === eaw) {
              level3GetWorkerMatch.fetchAdd(1);
            }
          }, eaw);

          handler2.sendEmptyMessage(200);
          if (handler2.getWorker() === eaw) {
            level2GetWorkerMatch.fetchAdd(1);
          }
        }, eaw);

        handler1.sendEmptyMessage(100);

        let waitCount: int = 0;
        while (level1Count.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }

        expect(handler1.getWorker() === eaw).assertTrue();
        expect(level1Count.load()).assertEqual(1);
        expect(level1Match.load()).assertEqual(1);

        waitCount = 0;
        while (level2Count.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(level2Count.load()).assertEqual(1);
        expect(level2Match.load()).assertEqual(1);
        expect(level2GetWorkerMatch.load()).assertEqual(1);

        waitCount = 0;
        while (level3Count.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(level3Count.load()).assertEqual(1);
        expect(level3Match.load()).assertEqual(1);
        expect(level3GetWorkerMatch.load()).assertEqual(1);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })
  })
}
