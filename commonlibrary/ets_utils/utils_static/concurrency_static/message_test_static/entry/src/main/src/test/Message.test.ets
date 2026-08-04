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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium/index";
import Utils from './Util.test';

class MessageObject {
  id: number

  constructor(id: number) {
    this.id = id;
  }
}

export function Sleep(ms: int): Promise<number> {
  return new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1)
    }, ms)
  });
}

type CB = () => void;

export default function MessageTest(): void {
  describe('MessageTest', (): void => {
    afterEach(async () => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   MessageConstructor0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0100
     * @tc.desc   Verify Message(what, handler) constructor sends message via sendToTarget() and getWhat() returns the specified what value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor001';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler);
          message.sendToTarget();
          expect(handler.hasMessages(1)).assertEqual(true);
          expect(message.getWhat()).assertEqual(1);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      })

    /**
     * @tc.name   MessageConstructor0101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0101
     * @tc.desc   Verify Message(what, handler) constructor preserves various what values (0, 1, negative, Int.MAX/MIN) after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructor0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor002';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              console.log("worker one message");
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg1 = new concurrency.Message(0, handler);
          let msg2 = new concurrency.Message(1, handler);
          let msg3 = new concurrency.Message(-165535, handler);
          let msg4 = new concurrency.Message(-65536, handler);
          let msg5 = new concurrency.Message(Int.MAX_VALUE, handler);
          let msg6 = new concurrency.Message(Int.MIN_VALUE, handler);
          handler.sendMessage(msg1);
          handler.sendMessage(msg2);
          handler.sendMessage(msg3);
          handler.sendMessage(msg4);
          handler.sendMessage(msg5);
          handler.sendMessage(msg6);
          expect(msg1.getWhat()).assertEqual(0);
          expect(msg2.getWhat()).assertEqual(1);
          expect(msg3.getWhat()).assertEqual(-165535);
          expect(msg4.getWhat()).assertEqual(-65536);
          expect(msg5.getWhat()).assertEqual(Int.MAX_VALUE);
          expect(msg6.getWhat()).assertEqual(Int.MIN_VALUE);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   MessageConstructor0102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0102
     * @tc.desc   Verify Message(what, handler) constructor without obj leaves getObject() undefined after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructor0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor003';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              console.log("worker one message");
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(1, handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as undefined).assertEqual(undefined);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   MessageConstructor0103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0103
     * @tc.desc   Verify Message(what, handler) constructor without callback leaves getCallback() undefined after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor004';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              console.log("worker one message");
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let msg = new concurrency.Message(1, handler);
          handler.sendMessage(msg);
          expect(msg.getCallback()).assertEqual(undefined);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageConstructor0104
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0104
     * @tc.desc   Verify Message(callback, handler) constructor runs the callback on the worker via sendToTarget() with default what -1000000 and undefined object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageConstructor005';
        console.info(`${TAG} test start`);
        let executed = false;
        const worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          const m = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              const cb = msg.getCallback()!;
              cb();
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          const msg = new concurrency.Message(() => {
            executed = true;
          }, m);
          msg.sendToTarget();
          await Sleep(200);
          expect(executed).assertTrue();
          expect(msg.getWhat()).assertEqual(-1000000);
          expect(msg.getObject() as undefined).assertUndefined();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageConstructor0105
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0105
     * @tc.desc   Verify Message(callback, handler) constructor executes the async callback task on the worker via sendToTarget() with default what -1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructor0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageConstructor006';
        console.info(`${TAG} test start`);
        let executed = false;
        const worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          const m = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              const cb = msg.getCallback()!;
              cb();
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          const asyncTask = () => {
            setTimeout(() => {
              executed = true;
            }, 1000);
          };
          const msg = new concurrency.Message(asyncTask, m);
          msg.sendToTarget();
          await Sleep(1100);
          expect(executed).assertTrue();
          expect(msg.getWhat()).assertEqual(-1000000);
          expect(msg.getObject() as undefined).assertUndefined();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (err) {
          console.error(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      }
    );

    /**
     * @tc.name   MessageConstructor0106
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0106
     * @tc.desc   Verify Message(callback, handler) constructor executes a blocking callback on the worker via sendToTarget() with default what -1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructor0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor007';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let callbackExecuted = false;
        let flag: boolean = false;
        worker.start();
        try {
          const m = new concurrency.MessageHandler((msg: concurrency.Message) => {
            const cb = msg.getCallback();
            expect(cb).not().assertNull();
            cb!();
            callbackExecuted = true;
            flag = true;
          }, worker);
          const asyncCallback = () => {
            const end = Date.now() + 1000;
            while (Date.now() < end) {
            }
          };
          const message = new concurrency.Message(asyncCallback, m);
          message.sendToTarget();
          await Sleep(1200);
          expect(callbackExecuted).assertTrue();
          expect(message.getWhat()).assertEqual(-1000000);
          expect(message.getObject() as undefined).assertUndefined();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (err) {
          console.error(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageConstructor0107
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0107
     * @tc.desc   Verify Message(handler) constructor sends message via sendToTarget() and handler.hasMessages(-1000000) returns false for default what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructor0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor008';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(handler);
          message.sendToTarget();
          expect(handler.hasMessages(-1000000)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   MessageConstructor0108
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0108
     * @tc.desc   Verify Message(handler) constructor with only handler keeps default what -1000000 after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructor0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor009';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              console.info('MessageConstructor009--00')
              await Sleep(1000);
              flag = true;
              console.info('MessageConstructor009--01', flag)
            })().awaitSync()
          }, worker);
          console.info('MessageConstructor009--0', handler)
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          console.info('MessageConstructor009--1', message.getWhat())
          expect(message.getWhat()).assertEqual(-1000000);
          while (!flag) {
            await Utils.msSleep(100)
            console.info('MessageConstructor009--2', flag)
          }
          ;
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      })

    /**
     * @tc.name   MessageConstructor0109
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0109
     * @tc.desc   Verify Message(what, handler) constructor with what=0 leaves getObject() undefined after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructor0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor010';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(0, handler);
          handler.sendMessage(message);
          expect(message.getObject() as undefined).assertEqual(undefined);
          while (!flag) {
            await Utils.msSleep(100)
          }
          ;
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      })

    /**
     * @tc.name   MessageConstructor0110
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0110
     * @tc.desc   Verify Message(what, handler) constructor with what=0 leaves getCallback() undefined after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor011';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              console.log("worker one message");
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          console.info('MessageConstructor011--0', handler)
          let msg = new concurrency.Message(0, handler);
          handler.sendMessage(msg);
          console.info('MessageConstructor011--1', msg.getCallback())
          expect(msg.getCallback()).assertEqual(undefined);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageHandlerConstructor0111
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0111
     * @tc.desc   Verify MessageHandler(callback, worker) constructor processes messages on the bound worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerConstructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandlerConstructor001';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start();
        let handler: concurrency.MessageHandler;
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            let currentWorkerId = EAWorker.current()!.getWorkerId();
            expect(currentWorkerId).assertEqual(worker.getWorkerId());
          }, worker);
          let message = new concurrency.Message(1, "handler workerID", handler)
          handler.sendMessage(message);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   MessageHandlerConstructor0112
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0112
     * @tc.desc   Verify MessageHandler(callback) constructor without worker processes messages on the main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerConstructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandlerConstructor002';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let workerId = EAWorker.main()!.getWorkerId()
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            let currentWorkerId = EAWorker.current()!.getWorkerId();
            expect(currentWorkerId).assertEqual(workerId);
          });
          let message = new concurrency.Message(1, "handler workerID", handler)
          handler.sendMessage(message);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          done();
        }
      });


    /**
     * @tc.name   HasCallbacks0113
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0113
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns true for a callback posted via post()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HasCallbacks0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks001';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          expect(handler.hasCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   HasCallbacks0114
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0114
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns false for a callback that was not posted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasCallbacks0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks002';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.post(p);
          expect(handler.hasCallbacks(q)).assertEqual(false)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   HasCallbacks0115
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0115
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns false when no callback has been posted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HasCallbacks0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks003';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let msg = new concurrency.Message(handler)
          expect(handler.hasCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   HasCallbacks0116
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0116
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns true for a callback-carrying message sent via sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasCallbacks0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks003';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          handler.sendMessage(message1);
          expect(handler.hasCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   HasCallbacks0117
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0117
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns false for a callback whose message was not sent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasCallbacks0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks004';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          handler.sendMessage(message1);
          expect(handler.hasCallbacks(q)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   HasCallbacks0118
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0118
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns true for a callback message sent via sendToTarget()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasCallbacks0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks005';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          message1.sendToTarget();
          expect(handler.hasCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   HasCallbacks0119
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0119
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns false for a callback message not sent via sendToTarget()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasCallbacks0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks006';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          message1.sendToTarget();
          expect(handler.hasCallbacks(q)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   HasCallbacks0120
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0120
     * @tc.desc   Verify MessageHandler.hasCallbacks() returns false for a callback message that was never sent to the handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasCallbacks0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks007';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          expect(handler.hasCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0121
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0121
     * @tc.desc   Verify MessageHandler.removeMessages() returns false for what 0 when no matching message is queued and none is processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RemoveMessages0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages001';
        console.info(`${TAG} test start`);
        let flag = false;
        let worker = new EAWorker();
        worker.start();
        let handler: concurrency.MessageHandler;
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          await Sleep(1500);
          expect(handler.removeMessages(0)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0122
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0122
     * @tc.desc   Verify MessageHandler.removeMessages() removes a queued message by what and prevents its callback from running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RemoveMessages0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages002';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          handler.post((): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          });
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 50) {
              waitB++;
              await Utils.msSleep(10);
            }
            handler.sendMessage(message);
            expect(handler.removeMessages(1)).assertEqual(true);
            expect(flag).assertEqual(false);
          } finally {
            releaseBlock.fetchAdd(1);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0123
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0123
     * @tc.desc   Verify MessageHandler.removeMessages() returns false when removing a what that was already removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages003';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(2000);
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          worker.join()
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0124
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0124
     * @tc.desc   Verify MessageHandler.removeMessages() removes a pending message with matching what while the handler is busy processing another message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RemoveMessages0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages004';
        console.info(`${TAG} test start`);
        let flag = false;
        let blockerStarted = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted = true;
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                await Sleep(1000);
                flag = true;
              }
            })().awaitSync()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler)
          blockMsg.sendToTarget();
          while (!blockerStarted) {
            await Utils.msSleep(10);
          }
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.removeMessages(1)).assertEqual(true);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0125
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0125
     * @tc.desc   Verify MessageHandler.removeMessages() returns false on second call after the message sent via sendToTarget() was removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages005';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(2000);
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0126
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0126
     * @tc.desc   Verify MessageHandler.removeMessages() returns false for what 0 when only a what-1 message with object exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages006';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          expect(handler.removeMessages(0)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0127
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0127
     * @tc.desc   Verify MessageHandler.removeMessages() removes a pending message with object payload while the handler is busy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RemoveMessages0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages007';
        console.info(`${TAG} test start`);
        let messageObject = new MessageObject(10);
        let handler: concurrency.MessageHandler;
        let blockerStarted = false;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted = true;
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                await Sleep(2000);
              }
            })().awaitSync()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler)
          blockMsg.sendToTarget();
          while (!blockerStarted) {
            await Utils.msSleep(10);
          }
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          expect(handler.removeMessages(1)).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0128
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0128
     * @tc.desc   Verify MessageHandler.removeMessages() returns false after the queued message has already been processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages008';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          await Sleep(1200);
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0129
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0129
     * @tc.desc   Verify MessageHandler.removeMessages() removes a message with object sent via sendToTarget() while the handler is busy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RemoveMessages0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages009';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let blockerStarted = false;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted = true;
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                await Sleep(2000);
              }
            })().awaitSync()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler)
          blockMsg.sendToTarget();
          while (!blockerStarted) {
            await Utils.msSleep(10);
          }
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          expect(handler.removeMessages(1)).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0130
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0130
     * @tc.desc   Verify MessageHandler.removeMessages() returns false after the message sent via sendToTarget() was already processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages010';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          await Utils.msSleep(1300);
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0131
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0131
     * @tc.desc   Verify MessageHandler.removeMessages() returns false for what 0 when no matching message is queued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages011';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          expect(handler.removeMessages(0)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0132
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0132
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false when the queued message has no matching object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages012';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0133
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0133
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false on second call when no message matches both what and object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages013';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0134
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0134
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false for an object-less message sent via sendToTarget()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages014';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0135
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0135
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) does not remove an object-less message sent via sendToTarget()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages015';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0136
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0136
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false when the matching message was never sent to the handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages016';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0137
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0137
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) removes a pending message matching both what and object while the handler is busy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RemoveMessages0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages017';
        console.info(`${TAG} test start`);
        let flag = false;
        let blockerStarted = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted = true;
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                await Sleep(1000);
                flag = true;
              }
            })().awaitSync()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler)
          blockMsg.sendToTarget();
          while (!blockerStarted) {
            await Utils.msSleep(10);
          }
          let message = new concurrency.Message(1, messageObject, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          handler.post((): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          });
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 50) {
              waitB++;
              await Utils.msSleep(10);
            }
            handler.sendMessage(message);
            expect(handler.removeMessages(1, messageObject)).assertEqual(true);
          } finally {
            releaseBlock.fetchAdd(1);
          }
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0138
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0138
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false on second call after the matching message was removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages018';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(5000);
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler);
          handler.sendMessage(message);
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0139
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0139
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) removes a message sent via sendToTarget() while the handler is busy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RemoveMessages0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages019';
        console.info(`${TAG} test start`);
        let flag = false;
        let blockerStarted = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted = true;
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                await Sleep(1000);
                flag = true;
              }
            })().awaitSync()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler);
          blockMsg.sendToTarget();
          while (!blockerStarted) {
            await Utils.msSleep(10);
          }
          let message = new concurrency.Message(1, messageObject, handler);
          message.sendToTarget();
          expect(handler.removeMessages(1, messageObject)).assertEqual(true);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   RemoveMessages0140
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0140
     * @tc.desc   Verify MessageHandler.removeMessages(what, obj) returns false on second call after the sendToTarget() message was removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveMessages0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages020';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(5000);
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler);
          message.sendToTarget();
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0141
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0141
     * @tc.desc   Verify MessageHandler.hasMessages() returns false for what 0 when no message is queued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages001';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(handler);
          expect(handler.hasMessages(0)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0142
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0142
     * @tc.desc   Verify MessageHandler.hasMessages() returns false for what 1 when the queued message has default what -1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages002';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(1)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0143
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0143
     * @tc.desc   Verify MessageHandler.hasMessages() returns false for non-matching what 0 after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages003';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(0)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0144
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0144
     * @tc.desc   Verify MessageHandler.hasMessages() returns true for the what value of a message sent via sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages004';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          handler.post((): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          });
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 50) {
              waitB++;
              await Utils.msSleep(10);
            }
            handler.sendMessage(message);
            expect(handler.hasMessages(1)).assertEqual(true);
          } finally {
            releaseBlock.fetchAdd(1);
          }
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0145
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0145
     * @tc.desc   Verify MessageHandler.hasMessages() returns false for non-matching what 0 after sendToTarget()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages005';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.hasMessages(0)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0146
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0146
     * @tc.desc   Verify MessageHandler.hasMessages() returns true for the what value of a message sent via sendToTarget()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages006';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.hasMessages(1)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0147
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0147
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false when no matching object message is queued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages007';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0148
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0148
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false for what 1 with object when only a default-what message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages008';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0149
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0149
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false for non-matching what 0 after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages009';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0150
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0150
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns true for a message sent via sendMessage() matching both what and object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages010';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          handler.post((): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          });
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 50) {
              waitB++;
              await Utils.msSleep(10);
            }
            handler.sendMessage(message);
            expect(handler.hasMessages(1, messageObject)).assertEqual(true);
          } finally {
            releaseBlock.fetchAdd(1);
          }
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0151
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0151
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false for non-matching what 0 after sendToTarget()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages011';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   HasMessages0152
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0152
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns true for a message sent via sendToTarget() matching both what and object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HasMessages0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages012';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          expect(handler.hasMessages(1, messageObject)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.name   SendToTargetTest0153
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0153
     * @tc.desc   Verify Message.sendToTarget() dispatches a message created with constructor(handler) to the handler's worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendToTargetTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SendToTargetTest001';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(handler);
          message.sendToTarget();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });

    /**
     * @tc.name   SendToTargetTest0154
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0154
     * @tc.desc   Verify Message.sendToTarget() dispatches a message with what to the handler's worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendToTargetTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SendToTargetTest002';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, handler);
          message.sendToTarget();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });

    /**
     * @tc.name   SendToTargetTest0155
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0155
     * @tc.desc   Verify Message.sendToTarget() dispatches a message with what and obj to the handler's worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendToTargetTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SendToTargetTest003';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, 'obj', handler);
          message.sendToTarget();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });

    /**
     * @tc.name   SendToTargetTest0156
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0156
     * @tc.desc   Verify Message.sendToTarget() dispatches a message with callback to the handler's worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendToTargetTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SendToTargetTest004';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, eaw);
          let callback: CB = () => {};
          let message: concurrency.Message = new concurrency.Message(callback, handler);
          message.sendToTarget();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });

    /**
     * @tc.name   GetWhatTest0157
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0157
     * @tc.desc   Verify Message.getWhat() returns default value -1000000 for a message created with constructor(handler) after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetWhatTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWhatTest001';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(message.getWhat()).assertEqual(-1000000);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });
  });
}
