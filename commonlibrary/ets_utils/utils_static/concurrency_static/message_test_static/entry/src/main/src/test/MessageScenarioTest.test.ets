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

export default function MessageScenarioTest(): void {
  describe('MessageScenarioTest', (): void => {
    afterEach((): void => {
    })

    /**
     * @tc.name   MessageScenarioTest0100
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0100
     * @tc.desc   Verify MessageHandler sendMessage with what Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest0100';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler);
          message.sendToTarget();
          expect(handler.hasMessages(1)).assertEqual(true);
          expect(message.getWhat()).assertEqual(1);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioTest0200
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0200
     * @tc.desc   Verify MessageHandler sendMessage with object Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest0200';
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
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })()
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
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest0300
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0300
     * @tc.desc   Verify MessageHandler sendMessage with callback Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest0300';
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
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })()
          }, worker)
          let msg = new concurrency.Message(1, handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as undefined).assertEqual(undefined);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest0400
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0400
     * @tc.desc   Verify Message getCallback returns undefined when message has no callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest0400';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              console.log("worker one message");
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })()
          }, worker);
          let msg = new concurrency.Message(1, handler);
          handler.sendMessage(msg);
          expect(msg.getCallback()).assertEqual(undefined);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest0500
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0500
     * @tc.desc   Verify MessageHandler removeMessages after sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioTest0500';
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
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })()
          }, worker);
          const msg = new concurrency.Message(() => {
            executed = true;
          }, m);
          msg.sendToTarget();
          let waitExecuted: int = 0;
          while (!executed && waitExecuted < 50) {
            waitExecuted++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(executed).assertTrue();
          expect(msg.getWhat()).assertEqual(-1000000);
          expect(msg.getObject() as undefined).assertUndefined();
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest0600
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0600
     * @tc.desc   Verify Message sendToTarget delivers to handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioTest0600';
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
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })()
          }, worker);
          let executeResolver: () => void = (): void => {};
          const executedPromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
            executeResolver = resolve;
          });
          const asyncTask = (): void => {
            setTimeout((): void => {
              executed = true;
              executeResolver();
            }, 1000);
          };
          const msg = new concurrency.Message(asyncTask, m);
          msg.sendToTarget();
          await executedPromise;
          expect(executed).assertTrue();
          expect(msg.getWhat()).assertEqual(-1000000);
          expect(msg.getObject() as undefined).assertUndefined();
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      }
    );

    /**
     * @tc.name   MessageScenarioTest0700
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0700
     * @tc.desc   Verify Message getWhat returns constructed what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest0700';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let callbackExecuted = false;
        let flag: boolean = false;
        worker.start();
        try {
          const m = new concurrency.MessageHandler((msg: concurrency.Message) => {
            const cb = msg.getCallback();
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
          let waitCallback: int = 0;
          while (!callbackExecuted && waitCallback < 200) {
            waitCallback++;
            try {
              await Utils.msSleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(callbackExecuted).assertTrue();
          expect(message.getWhat()).assertEqual(-1000000);
          expect(message.getObject() as undefined).assertUndefined();
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest0800
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0800
     * @tc.desc   Verify MessageHandler hasMessages returns false for what -1000000 after message sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest0800';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(handler);
          message.sendToTarget();
          expect(handler.hasMessages(-1000000)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest0900
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_0900
     * @tc.desc   Verify Message getWhat returns default what -1000000 for message constructed without what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest0900';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              console.info('MessageConstructor009--00')
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
              console.info('MessageConstructor009--01', flag)
            })()
          }, worker);
          console.info('MessageConstructor009--0', handler)
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          console.info('MessageConstructor009--1', message.getWhat())
          expect(message.getWhat()).assertEqual(-1000000);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioTest1000
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1000
     * @tc.desc   Verify Message getObject returns undefined for message constructed without object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1000';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(0, handler);
          handler.sendMessage(message);
          expect(message.getObject() as undefined).assertEqual(undefined);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioTest1100
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1100
     * @tc.desc   Verify Message getCallback returns undefined when message constructed with handler only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1100';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              console.log("worker one message");
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })()
          }, worker);
          console.info('MessageConstructor011--0', handler)
          let msg = new concurrency.Message(0, handler);
          handler.sendMessage(msg);
          console.info('MessageConstructor011--1', msg.getCallback())
          expect(msg.getCallback()).assertEqual(undefined);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest1200
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1200
     * @tc.desc   Verify MessageHandler post callback execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1200';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start();
        let callbackCount = new AtomicInt(0);
        let workerIdMatched = new AtomicInt(0);
        let handler: concurrency.MessageHandler;
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            let currentWorkerId = EAWorker.current()!.getWorkerId();
            if (currentWorkerId === worker.getWorkerId()) {
              workerIdMatched.store(1);
            }
            callbackCount.fetchAdd(1);
          }, worker);
          let message = new concurrency.Message(1, "handler workerID", handler)
          handler.sendMessage(message);
          let waitCount: int = 0;
          while (callbackCount.load() < 1 && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(callbackCount.load()).assertEqual(1);
          expect(workerIdMatched.load()).assertEqual(1);
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest1300
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1300
     * @tc.desc   Verify MessageHandler without bound worker handles message on the main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1300';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let workerId = EAWorker.main()!.getWorkerId()
        let callbackCount = new AtomicInt(0);
        let workerIdMatched = new AtomicInt(0);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            let currentWorkerId = EAWorker.current()!.getWorkerId();
            if (currentWorkerId === workerId) {
              workerIdMatched.store(1);
            }
            callbackCount.fetchAdd(1);
          });
          let message = new concurrency.Message(1, "handler workerID", handler)
          handler.sendMessage(message);
          let waitCount: int = 0;
          while (callbackCount.load() < 1 && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(callbackCount.load()).assertEqual(1);
          expect(workerIdMatched.load()).assertEqual(1);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
        }
        done();
      });


    /**
     * @tc.name   MessageScenarioTest1400
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1400
     * @tc.desc   Verify MessageHandler concurrent multi-message delivery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1400';
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
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          expect(handler.hasCallbacks(p)).assertEqual(true);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest1500
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1500
     * @tc.desc   Verify MessageHandler hasCallbacks returns false for a never-posted callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1500';
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
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.post(p);
          expect(handler.hasCallbacks(q)).assertEqual(false)
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest1600
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1600
     * @tc.desc   Verify MessageHandler hasCallbacks for pending posts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const TAG: string = 'MessageScenarioTest1600';
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
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let msg = new concurrency.Message(handler)
          expect(handler.hasCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
        }
      });

    /**
     * @tc.name   MessageScenarioTest1700
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1700
     * @tc.desc   Verify MessageHandler hasCallbacks returns true for a callback sent via sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1700';
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
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          handler.sendMessage(message1);
          expect(handler.hasCallbacks(p)).assertEqual(true);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest1800
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1800
     * @tc.desc   Verify MessageHandler hasCallbacks returns false for a never-posted callback after sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1800';
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
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          handler.sendMessage(message1);
          expect(handler.hasCallbacks(q)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest1900
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_1900
     * @tc.desc   Verify Message.sendToTarget scenario for case 1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest1900';
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
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          message1.sendToTarget();
          expect(handler.hasCallbacks(p)).assertEqual(true);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest2000
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2000
     * @tc.desc   Verify Message.sendToTarget scenario for case 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest2000';
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
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          message1.sendToTarget();
          expect(handler.hasCallbacks(q)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });


    /**
     * @tc.name   MessageScenarioTest2100
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2100
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const TAG: string = 'MessageScenarioTest2100';
        console.info(`${TAG} test start`);
        let flag = false;
        let worker = new EAWorker();
        worker.start();
        let handler: concurrency.MessageHandler;
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          expect(handler.removeMessages(0)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
        }
      });

    /**
     * @tc.name   MessageScenarioTest2200
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2200
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest2200';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            let cb: (() => void) | undefined = msg.getCallback();
            if (cb !== undefined) {
              cb();
              return;
            }
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          let postedCallback = (): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          };
          handler.post(postedCallback);
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 500) {
              waitB++;
              try {
                await Utils.msSleep(10);
              } catch (error) {
                expect(error).assertFail();
              }
            }
            expect(blockEntered.load()).assertEqual(1);
            handler.sendMessage(message);
            expect(handler.removeMessages(1)).assertEqual(true);
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
          console.info(`${TAG} test end`)
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest2300
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2300
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioTest2300';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(2000)
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          expect(handler.removeMessages(1)).assertEqual(true);
          expect(handler.removeMessages(1)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioTest2400
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2400
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest2400';
        console.info(`${TAG} test start`);
        let flag = false;
        let blockerStarted = new AtomicInt(0);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted.store(1);
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                try {
                  await Sleep(1000);
                } catch (error) {
                  expect(error).assertFail();
                }
                flag = true;
              }
            })()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler)
          blockMsg.sendToTarget();
          let waitBlocker: int = 0;
          while (blockerStarted.load() === 0 && waitBlocker < 500) {
            waitBlocker++;
            try {
              await Utils.msSleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(blockerStarted.load()).assertEqual(1);
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest2500
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2500
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioTest2500';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(2000)
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioTest2600
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2600
     * @tc.desc   Verify MessageHandler removeMessages returns false when the queue is empty and no message was sent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioTest2600';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          expect(handler.removeMessages(0)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioTest2700
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2700
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest2700';
        console.info(`${TAG} test start`);
        let messageObject = new MessageObject(10);
        let handler: concurrency.MessageHandler;
        let blockerStarted = new AtomicInt(0);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            let cb: (() => void) | undefined = msg.getCallback();
            if (cb !== undefined) {
              cb();
              return;
            }
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted.store(1);
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                try {
                  await Sleep(2000);
                } catch (error) {
                  console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
                }
              }
            })()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler)
          blockMsg.sendToTarget();
          let waitBlocker: int = 0;
          while (blockerStarted.load() === 0 && waitBlocker < 500) {
            waitBlocker++;
            try {
              await Utils.msSleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(blockerStarted.load()).assertEqual(1);
          let message = new concurrency.Message(1, messageObject, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          let postedCallback = (): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          };
          handler.post(postedCallback);
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 500) {
              waitB++;
              try {
                await Utils.msSleep(10);
              } catch (error) {
                expect(error).assertFail();
              }
            }
            expect(blockEntered.load()).assertEqual(1);
            handler.sendMessage(message);
            expect(handler.removeMessages(1)).assertEqual(true);
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
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest2800
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2800
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest2800';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          let waitFlag: int = 0;
          while (!flag && waitFlag < 20) {
            waitFlag++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest2900
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_2900
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest2900';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let blockerStarted = new AtomicInt(0);
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted.store(1);
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                try {
                  await Sleep(2000);
                } catch (error) {
                  console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
                }
              }
            })()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler)
          blockMsg.sendToTarget();
          let waitBlocker: int = 0;
          while (blockerStarted.load() === 0 && waitBlocker < 500) {
            waitBlocker++;
            try {
              await Utils.msSleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(blockerStarted.load()).assertEqual(1);
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest3000
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3000
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest3000';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          let waitFlag: int = 0;
          while (!flag && waitFlag < 20) {
            waitFlag++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest3100
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3100
     * @tc.desc   Verify MessageHandler removeMessages returns false when the queue is empty and no message was sent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioTest3100';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          expect(handler.removeMessages(0)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioTest3200
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3200
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 3300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest3200';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest3300
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3300
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 3400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest3300';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest3400
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3400
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 3500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest3400';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest3500
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3500
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 3600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest3500';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest3600
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3600
     * @tc.desc   Verify MessageHandler removeMessages with object returns false when the queue is empty and no message was sent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioTest3600';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioTest3700
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3700
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 3800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest3700';
        console.info(`${TAG} test start`);
        let flag = false;
        let blockerStarted = new AtomicInt(0);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            let cb: (() => void) | undefined = msg.getCallback();
            if (cb !== undefined) {
              cb();
              return;
            }
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted.store(1);
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                try {
                  await Sleep(1000);
                } catch (error) {
                  expect(error).assertFail();
                }
                flag = true;
              }
            })()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler)
          blockMsg.sendToTarget();
          let waitBlocker: int = 0;
          while (blockerStarted.load() === 0 && waitBlocker < 500) {
            waitBlocker++;
            try {
              await Utils.msSleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(blockerStarted.load()).assertEqual(1);
          let message = new concurrency.Message(1, messageObject, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          let postedCallback = (): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          };
          handler.post(postedCallback);
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 500) {
              waitB++;
              try {
                await Utils.msSleep(10);
              } catch (error) {
                expect(error).assertFail();
              }
            }
            expect(blockEntered.load()).assertEqual(1);
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest3800
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3800
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 3900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioTest3800';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(5000)
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler);
          handler.sendMessage(message);
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioTest3900
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_3900
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 4000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest3900';
        console.info(`${TAG} test start`);
        let flag = false;
        let blockerStarted = new AtomicInt(0);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              if (msg.getWhat() == 0) {
                blockerStarted.store(1);
                const end = Date.now() + 1000;
                while (Date.now() < end) {
                }
                return;
              }
              if (msg.getWhat() == 1) {
                try {
                  await Sleep(1000);
                } catch (error) {
                  expect(error).assertFail();
                }
                flag = true;
              }
            })()
          }, worker);
          let blockMsg = new concurrency.Message(0, handler);
          blockMsg.sendToTarget();
          let waitBlocker: int = 0;
          while (blockerStarted.load() === 0 && waitBlocker < 500) {
            waitBlocker++;
            try {
              await Utils.msSleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(blockerStarted.load()).assertEqual(1);
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest4000
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4000
     * @tc.desc   Verify MessageHandler removeMessages scenario for case 4100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioTest4000';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(5000)
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler);
          message.sendToTarget();
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioTest4100
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4100
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 4200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioTest4100';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(handler);
          expect(handler.hasMessages(0)).assertEqual(false);
        } catch (error) {
          console.info(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioTest4200
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4200
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 4300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest4200';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(1)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest4300
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4300
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 4400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest4300';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(0)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest4400
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4400
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 4500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest4400';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            let cb: (() => void) | undefined = msg.getCallback();
            if (cb !== undefined) {
              cb();
              return;
            }
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          let postedCallback = (): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          };
          handler.post(postedCallback);
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 500) {
              waitB++;
              try {
                await Utils.msSleep(10);
              } catch (error) {
                expect(error).assertFail();
              }
            }
            expect(blockEntered.load()).assertEqual(1);
            handler.sendMessage(message);
            expect(handler.hasMessages(1)).assertEqual(true);
          } finally {
            releaseBlock.fetchAdd(1);
          }
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest4500
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4500
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 4600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest4500';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.hasMessages(0)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest4600
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4600
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 4700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest4600';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.hasMessages(1)).assertEqual(true);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest4700
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4700
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 4800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest4700';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest4800
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4800
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 4900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest4800';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(1, messageObject)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest4900
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_4900
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 5000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest4900';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest5000
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_5000
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 5100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest5000';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            let cb: (() => void) | undefined = msg.getCallback();
            if (cb !== undefined) {
              cb();
              return;
            }
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          let blockEntered = new AtomicInt(0);
          let releaseBlock = new AtomicInt(0);
          let postedCallback = (): void => {
            blockEntered.fetchAdd(1);
            while (releaseBlock.load() == 0) {
            }
          };
          handler.post(postedCallback);
          try {
            let waitB: int = 0;
            while (blockEntered.load() < 1 && waitB < 500) {
              waitB++;
              try {
                await Utils.msSleep(10);
              } catch (error) {
                expect(error).assertFail();
              }
            }
            expect(blockEntered.load()).assertEqual(1);
            handler.sendMessage(message);
            expect(handler.hasMessages(1, messageObject)).assertEqual(true);
          } finally {
            releaseBlock.fetchAdd(1);
          }
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest5100
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_5100
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 5200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest5100';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest5200
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_5200
     * @tc.desc   Verify MessageHandler hasMessages scenario for case 5300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest5200';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          expect(handler.hasMessages(1, messageObject)).assertEqual(true);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
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
        }
        done();
      });


    /**
     * @tc.name   MessageScenarioTest5300
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_5300
     * @tc.desc   Verify Message.sendToTarget scenario for case 5400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest5300';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(handler);
          message.sendToTarget();
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest5400
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_5400
     * @tc.desc   Verify Message.sendToTarget scenario for case 5500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest5400';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, handler);
          message.sendToTarget();
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest5500
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_5500
     * @tc.desc   Verify Message.sendToTarget scenario for case 5600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest5500';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, 'obj', handler);
          message.sendToTarget();
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest5600
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_5600
     * @tc.desc   Verify Message.sendToTarget scenario for case 5700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest5600';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, eaw);
          let callback: CB = () => {};
          let message: concurrency.Message = new concurrency.Message(callback, handler);
          message.sendToTarget();
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioTest5700
     * @tc.number SUB_MESSAGE_SCENARIO_TEST_5700
     * @tc.desc   Verify MessageHandler sendMessage scenario for case 5800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest5700';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000);
                flag = true;
              } catch (error) {
                console.info(`MessageScenarioTest sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(message.getWhat()).assertEqual(-1000000);
          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(flag).assertTrue();
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
        }
        done();
      });
  });
}
