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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0100
     * @tc.name MessageConstructor001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0101
     * @tc.name MessageConstructor002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0102
     * @tc.name MessageConstructor003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MessageConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0103
     * @tc.name MessageConstructor004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MessageConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0104
     * @tc.name MessageConstructor005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0105
     * @tc.name MessageConstructor006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MessageConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0106
     * @tc.name MessageConstructor007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MessageConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0107
     * @tc.name MessageConstructor008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0108
     * @tc.name MessageConstructor009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MessageConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0109
     * @tc.name MessageConstructor010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MessageConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0110
     * @tc.name MessageConstructor011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MessageConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0111
     * @tc.name MessageHandlerConstructor001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandlerConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0112
     * @tc.name MessageHandlerConstructor002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandlerConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0113
     * @tc.name HasCallbacks001
     * @tc.desc test
